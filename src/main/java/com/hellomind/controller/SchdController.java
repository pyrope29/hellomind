package com.hellomind.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.TreeSet;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.google.gson.Gson;
import com.google.gson.JsonArray;
import com.hellomind.dto.ColDto;
import com.hellomind.dto.MemberDto;
import com.hellomind.dto.RegDto;
import com.hellomind.dto.SchdDto;
import com.hellomind.service.RegService;
import com.hellomind.service.SchdService;

@Controller
@RequestMapping("/schd")
public class SchdController {

	@Autowired
	private SchdService schdService;
	@Autowired
	private RegService regService;

	/* 상담사 - 가능한 일정 보여주는 페이지 */
	@RequestMapping("regist")
	public String schedule(Model model, HttpSession session) {

		String cId = ((ColDto) session.getAttribute("colInfo")).getcId();

		List<SchdDto> availableDateTime = new ArrayList<SchdDto>();
		availableDateTime = schdService.selectSchdById(cId);

		List<Map<String, ArrayList<String>>> multiList = new ArrayList<>();

		List<String> dateList = new ArrayList<>();

		for (int i = 0; i < availableDateTime.size(); i++) {
			// 날짜값받기
			String keyName = availableDateTime.get(i).getSchdDates();
			dateList.add(keyName);

			Map<String, ArrayList<String>> tempMap = new HashMap<String, ArrayList<String>>();
			ArrayList<String> timeList = new ArrayList<>();
			String date = availableDateTime.get(i).getSchdDates();
			String time = availableDateTime.get(i).getSchdTime();

			timeList.add(time);

			for (int j = i + 1; j < availableDateTime.size(); j++) {
				if (availableDateTime.get(i).getSchdDates().equals(availableDateTime.get(j).getSchdDates())) {
					timeList.add(availableDateTime.get(j).getSchdTime());
					i++;
				}
			}

			tempMap.put(date, timeList);

			multiList.add(tempMap);
		}

		TreeSet<String> distinctData = new TreeSet<>(dateList);
		dateList = new ArrayList<>(distinctData);
		System.out.println("dateList " + dateList);
		model.addAttribute("dateList", dateList);

		System.out.println("multiList : " + multiList);
		model.addAttribute("multiList", multiList);

		return "schd/colSchedule";
	}

	/* 상담사 - 가능한 일정 등록하는 페이지 */
	@RequestMapping("registSchd")
	public String registSchd(String date, String time, Model model, HttpSession session) {
		String cId = ((ColDto) session.getAttribute("colInfo")).getcId();

		System.out.println("파라미터로 넘어온 시간 : " + time);
		SchdDto schdDto = new SchdDto();
		int result;

		List<SchdDto> sDtoList = schdService.selectSchdById(cId);

		System.out.println("sDtoList : " + sDtoList);

		String[] splitStr = time.split(",");
		for (int i = 0; i < splitStr.length; i++) {

			schdDto.setcId(cId);
			schdDto.setSchdDates(date);
			schdDto.setSchdTime(splitStr[i]);
			System.out.println("넘어온 시간의 splitStr[i]) :" + splitStr[i]);
			System.out.println("새로 만든 schdDto는 :" + schdDto);

			Map<String, String> map = new HashMap<>();
			map.put("cId", cId);
			map.put("schdDates", date);
			map.put("schdTime", splitStr[i]);

			SchdDto sDto = schdService.selectSchd(map);

			System.out.println("sDto : " + sDto);
			// select해서 없으면 sDto insert.
			// 원래 20일에 있어야하는데 없어졌다면 delete-> 20일의 날짜만 select해서 시간전체를 불러온다. 하나하나체크.
			// selectAll 한후 대조, delete
			if (sDto == null) {
				result = schdService.insertSchd(schdDto);
				/*
				 * if() { System.out.println("********" + sDtoList.get(i)); result =
				 * schdService.deleteSchd(map); }
				 */
			}
		}
		model.addAttribute("msg", "일정 관리가 완료되었습니다");
		model.addAttribute("url", "/schd/regist");

		return "common/info";
	}

	/* 멤버 - 상담사가 등록한 일정 보여주는 페이지 */
	@RequestMapping(value = "memberRegist", method = RequestMethod.GET)
	public String regist(HttpSession session, Model model, String cId) {
		System.out.println("멤버의 상담 시간 등록 요청");
		String mId = ((MemberDto) session.getAttribute("userInfo")).getmId();

		List<SchdDto> availableDateTime = new ArrayList<SchdDto>();
		availableDateTime = schdService.selectSchdById(cId);

		model.addAttribute("cId", cId);

		List<Map<String, ArrayList<String>>> multiList = new ArrayList<>();

		List<String> dateList = new ArrayList<>();

		for (int i = 0; i < availableDateTime.size(); i++) {
			// 날짜값받기
			String keyName = availableDateTime.get(i).getSchdDates();
			dateList.add(keyName);

			Map<String, ArrayList<String>> tempMap = new HashMap<String, ArrayList<String>>();
			ArrayList<String> timeList = new ArrayList<>();
			String date = availableDateTime.get(i).getSchdDates();
			String time = availableDateTime.get(i).getSchdTime();

			timeList.add(time);

			for (int j = i + 1; j < availableDateTime.size(); j++) {
				if (availableDateTime.get(i).getSchdDates().equals(availableDateTime.get(j).getSchdDates())) {
					timeList.add(availableDateTime.get(j).getSchdTime());
					i++;
				}
			}

			tempMap.put(date, timeList);

			multiList.add(tempMap);
		}

		TreeSet<String> distinctData = new TreeSet<>(dateList);
		dateList = new ArrayList<>(distinctData);
		System.out.println("dateList " + dateList);
		model.addAttribute("dateList", dateList);

		System.out.println("multiList : " + multiList);
		model.addAttribute("multiList", multiList);

		Gson gson = new Gson();

		JsonArray jsonMultiList = gson.toJsonTree(multiList).getAsJsonArray();

		/*
		 * Type listType = new TypeToken<List<Map<String,
		 * ArrayList<String>>>>(){}.getType(); Type jsonMultiList = (Type)
		 * gson.toJsonTree(multiList, listType);
		 */

		// multiList = gson.toJson(sb.toString(), multiList);
		/*
		 * List<Map<String, ArrayList<String>>> listOfCountry = gson.toJson(multiList);
		 * 
		 */

		System.out.println("jsonMultiList : " + jsonMultiList);

		model.addAttribute("jsonMultiList", jsonMultiList);
		return "schd/memberRegist";
	}


	/* 멤버 - 상담사가 등록한 일정을, 멤버가 확정하는 페이지 */
	@RequestMapping("registChat")
	public String registChat(@RequestParam Map<String, String> param, Model model, HttpSession session) {
		System.out.println("param :"+param);
		String mId = ((MemberDto) session.getAttribute("userInfo")).getmId();

		RegDto regDto = new RegDto();
		regDto.setmId(mId);
		
		param.put("schdDates", param.get("date"));
		param.put("schdTime", param.get("time"));
		
		SchdDto schdDTo = schdService.selectSchd(param);
		regDto.setSchdNum(schdDTo.getSchdNum());

		System.out.println("schdDTo : " + schdDTo);

		regService.insertReg(regDto);

		model.addAttribute("msg", "상담 시간이 확정되었습니다.");
		model.addAttribute("url", "/schd/memberRegist?cId=" + param.get("cId"));
		return "common/info";
	}
	
	
	/* id파라미터값 갖고 채팅 방 들어가기*/
	//TODO
	//여기서 방들어갈수 있을지 없을지 시간 대조. schd의 일정가능날짜와 시간을 가져와서, 현재날짜와 비교, 현재날짜안에 속해 있으면 방에 입장 가능. 아니면 불가능.
		//?? nodejs에서 make room해야한다는데???????
	@RequestMapping(value = "chat", method = RequestMethod.GET)
	public String colChat(HttpSession session, Model model/*, RedirectAttributes redirectAttributes*/) {

		RegDto regDto = regService.selectReg();
		System.out.println("regDto : " + regDto);
		
		ColDto colDto = (ColDto)session.getAttribute("colInfo");
		MemberDto memberDto = (MemberDto)session.getAttribute("userInfo");
		
		if(regDto == null) {
			
			if(colDto != null) {
				model.addAttribute("msg", "상담 시간이 아닙니다.");
				model.addAttribute("msg2", "MY ACCOUNT > 일정 관리 에서 일정 확인 가능합니다");
				model.addAttribute("url", "/col");
				return "common/error2";
				
			} else {
				model.addAttribute("msg", "상담 시간이 아닙니다.");
				model.addAttribute("msg2", "MY MIND > 예약내역 에서 일정 확인 가능합니다");
				model.addAttribute("url", "/");
				return "common/error2";
			}
			
		} else {
			
			model.addAttribute("msg", "상담 시간이 확인되었습니다.");
			
			String sender="";
			String recepient="";
			
			if(colDto != null) {
				/*redirectAttributes.addAttribute("cId", colDto.getcId());
				redirectAttributes.addAttribute("mId", regDto.getmId());*/

				recepient = regDto.getmId();
				sender = colDto.getcId();
				 
				model.addAttribute("msg2", regDto.getmId() + "회원님과 "+ 
						regDto.getSchdDateTime().substring(0, 12) + "시에 예약되어 있습니다." +
						"채팅 상담실에 입장합니다.");
				
			} else if(memberDto != null) {
				/*redirectAttributes.addAttribute("mId", memberDto.getmId());
				redirectAttributes.addAttribute("cId", regDto.getcId());*/
				
				sender = memberDto.getmId();
				recepient = regDto.getcId();
				
				model.addAttribute("msg2", regDto.getcId() + "상담사와 "+ 
						regDto.getSchdDateTime().substring(0, 12) + "시에 예약되어 있습니다. " +
						"채팅 상담실에 입장합니다.");
				
			} 
			
			String schdDateTime = regDto.getSchdDateTime();
			int schdNum = regDto.getSchdNum();
			
			System.out.println("*********" + sender);
			System.out.println("*********" + recepient);
			
			model.addAttribute("url", "/hellomind?sender="+sender+"&recepient="+recepient );
			return "common/info2";
		}
	}
}
