package com.hellomind.controller;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.GregorianCalendar;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.TreeSet;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.hellomind.dto.ColDto;
import com.hellomind.dto.SchdDto;
import com.hellomind.service.SchdService;
import com.mysql.fabric.xmlrpc.base.Array;
import com.mysql.fabric.xmlrpc.base.Data;

@Controller
@RequestMapping("/schd")
public class SchdController {

	@Autowired
	private SchdService schdService;

	 @RequestMapping("test") 
	 public String test() { 
		 return "schd/industry-mng"; 
		 }
		/* 상담사가 가능한 일정을 insert하고 수정할 수 있는 페이지 */
		@RequestMapping("regist")
		public String schedule(Model model, HttpSession session) {
			session.setAttribute("colInfo", "2");
			
			//String cId = ( (ColDto) session.getAttribute("colInfo") ).getcId();
			//System.out.println("cId : " + cId);
			
			String cId = "2";
			
			List<SchdDto> availableDateTime = new ArrayList<SchdDto>();
			availableDateTime = schdService.selectSchd(cId);
			
			List<Map<String,ArrayList<String>>> multiList = new ArrayList<>();
			
			List<String> dateList = new ArrayList<>();
			
			
			for(int i=0; i<availableDateTime.size(); i++) {
				//날짜값받기
				String keyName = availableDateTime.get(i).getschdDates();
				dateList.add(keyName);
	
				
				Map<String,ArrayList<String>> tempMap = new HashMap<String,ArrayList<String>>();
				ArrayList<String> timeList = new ArrayList<>();
				String date= availableDateTime.get(i).getschdDates();
				String time = availableDateTime.get(i).getschdTime();
				
				timeList.add(time);
				
				for(int j = i+1; j< availableDateTime.size(); j++) {  
					if(availableDateTime.get(i).getschdDates().equals(availableDateTime.get(j).getschdDates())) {
						System.out.println(availableDateTime.get(i).getschdDates() + "일의 중복값 :" + availableDateTime.get(j).getschdTime());
						timeList.add(availableDateTime.get(j).getschdTime());
						i++;
					} 
				}
				
				tempMap.put(date, timeList);

				System.out.println("tempMap : " + tempMap);
				
				multiList.add(tempMap);
			}
			
			
			TreeSet<String> distinctData  = new TreeSet<>(dateList);
			dateList = new ArrayList<>(distinctData);
			System.out.println("dateList " + dateList);
			model.addAttribute("dateList", dateList);
			
			System.out.println("multiList : " + multiList);
			model.addAttribute("multiList", multiList);

			
			return "schd/schedule";
		}
		
		
		@RequestMapping("registSchd")//TODO
		public String registSchd(String dateTime, Model model,HttpSession session) {
			String cId = ( (ColDto) session.getAttribute("colInfo") ).getcId();
			
			SchdDto schdDto = new SchdDto();
			schdDto.setcId(cId);
			schdDto.setSchdDate(dateTime);
			
			System.out.println(schdDto.toString() + "Dasdass@#!@#123");
			
			int result = schdService.insertSchd(schdDto);
			
			if(result > 0) {
				model.addAttribute("msg", "일정 관리가 완료되었습니다");
				model.addAttribute("url", "/schd/regist");
			}
			return "common/info";
		}

	 
	 
	 
	 
/*	 일정 관리 
	@RequestMapping("regist")
	public String schedule(Model model, HttpSession session) {
		session.setAttribute("colInfo", "2");
		
		//String cId = ( (ColDto) session.getAttribute("colInfo") ).getcId();
		//System.out.println("cId : " + cId);
		
		String cId = "2";
		
		List<String> availableDateTime = new ArrayList<>();
		availableDateTime = schdService.selectSchd(cId);

		System.out.println("******availableDateTime : " +availableDateTime.toString());
		model.addAttribute("availableDateTime",availableDateTime);

		List<Map<String,ArrayList<String>>> multiList = new ArrayList<>();
		
		for(int i=0; i<availableDateTime.size(); i++) {
			Map<String,ArrayList<String>> tempMap = new HashMap<String,ArrayList<String>>();
			ArrayList<String> timeList = new ArrayList<>();
			String date= availableDateTime.get(i).substring(0, 10).trim();
			//String time = availableDateTime.get(i).substring(11, 13);
			
			timeList.add(availableDateTime.get(i).substring(11, 13).trim());
			
			for(int j = i+1; j< availableDateTime.size(); j++) {  
				if(availableDateTime.get(i).substring(0, 10).trim().equals(availableDateTime.get(j).substring(0, 10).trim())) {
					System.out.println(availableDateTime.get(j).substring(0, 10).trim() + "일의 중복값 :" + availableDateTime.get(j).substring(11, 13).trim());
					timeList.add(availableDateTime.get(j).substring(11, 13).trim());
					i++;
				} 
			}
			
			
			tempMap.put(date, timeList);
			
			System.out.println("i List " + timeList);
			System.out.println("tempMap : " + tempMap);
			
			multiList.add(tempMap);
		}
		
		model.addAttribute("multiList",multiList);
		System.out.println("multiList : " + multiList);
	
		return "schd/schedule";
	}
	
	@RequestMapping("registSchd")
	public String registSchd(String dateTime, Model model,HttpSession session) {
		String cId = ( (ColDto) session.getAttribute("colInfo") ).getcId();
		
		SchdDto schdDto = new SchdDto();
		schdDto.setcId(cId);
		schdDto.setSchdDate(dateTime);
		
		System.out.println(schdDto.toString() + "Dasdass@#!@#123");
		
		int result = schdService.insertSchd(schdDto);
		
		if(result > 0) {
			model.addAttribute("msg", "일정 관리가 완료되었습니다");
			model.addAttribute("url", "/schd/regist");
		}
		return "common/info";
	}
*/
}
