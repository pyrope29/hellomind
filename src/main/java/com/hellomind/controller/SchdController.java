package com.hellomind.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.TreeSet;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

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
	private RegService RegService;

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
			String keyName = availableDateTime.get(i).getschdDates();
			dateList.add(keyName);

			Map<String, ArrayList<String>> tempMap = new HashMap<String, ArrayList<String>>();
			ArrayList<String> timeList = new ArrayList<>();
			String date = availableDateTime.get(i).getschdDates();
			String time = availableDateTime.get(i).getschdTime();

			timeList.add(time);

			for (int j = i + 1; j < availableDateTime.size(); j++) {
				if (availableDateTime.get(i).getschdDates().equals(availableDateTime.get(j).getschdDates())) {
					timeList.add(availableDateTime.get(j).getschdTime());
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
			schdDto.setschdDates(date);
			schdDto.setschdTime(splitStr[i]);
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
			String keyName = availableDateTime.get(i).getschdDates();
			dateList.add(keyName);

			Map<String, ArrayList<String>> tempMap = new HashMap<String, ArrayList<String>>();
			ArrayList<String> timeList = new ArrayList<>();
			String date = availableDateTime.get(i).getschdDates();
			String time = availableDateTime.get(i).getschdTime();

			timeList.add(time);

			for (int j = i + 1; j < availableDateTime.size(); j++) {
				if (availableDateTime.get(i).getschdDates().equals(availableDateTime.get(j).getschdDates())) {
					timeList.add(availableDateTime.get(j).getschdTime());
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

		RegService.insertReg(regDto);

		model.addAttribute("msg", "상담 시간이 확정되었습니다.");
		model.addAttribute("url", "memberRegist?cId=" + param.get("cId"));
		return "common/info";
	}
}
