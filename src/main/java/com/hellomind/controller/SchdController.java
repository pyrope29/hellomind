package com.hellomind.controller;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.GregorianCalendar;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.hellomind.dto.ColDto;
import com.hellomind.dto.SchdDto;
import com.hellomind.service.SchdService;
import com.mysql.fabric.xmlrpc.base.Data;

@Controller
@RequestMapping("/schd")
public class SchdController {

	@Autowired
	private SchdService schdService;

	/*
	 * @RequestMapping("viewColDet") public String colDet(Model model, String cId,
	 * String msgPerPage) {
	 * 
	 * // ColDto colDto = colService.selectCol(cId); //
	 * System.out.println("colDto : " +colDto.toString());
	 * 
	 * // model.addAttribute("colDto", colDto); // colDto 하나하나 뿌려주기 return
	 * "col/colDet"; }
	 * 
	 * @RequestMapping("regist") public String regist() { return "col/regist"; }
	 */
	/* 일정 관리 */
	@RequestMapping("regist")
	public String schedule(Model model, HttpSession session) {
		String cId = ( (ColDto) session.getAttribute("colInfo") ).getcId();
			System.out.println("cId : " + cId);
		
		List<String> schdDateList = new ArrayList<>();
		schdDateList = schdService.selectSchd(cId);

		System.out.println("schdDateList : " +schdDateList.toString());

		model.addAttribute("schdDateList",schdDateList);
		
		List<String> availableDates = new ArrayList<>();
		List<String> availableTime = new ArrayList<>();
		
		for(String sList : schdDateList) {
			String aList = sList.substring(0, 10);
			availableDates.add(aList);

			String tList = sList.substring(11, 19);
			availableTime.add(tList);
		}

		System.out.println("availableDatesddddddd : " +availableDates);
		System.out.println("availableTimeddddddddd : " +availableTime);

		model.addAttribute("availableDates",availableDates);
		model.addAttribute("availableTime",availableTime);
		return "schd/schedule";
	}
	
	@RequestMapping("registSchd")
	public String registSchd(String dateTime, Model model,HttpSession session) {
		String cId = ( (ColDto) session.getAttribute("colInfo") ).getcId();
		
		SchdDto schdDto = new SchdDto();
		schdDto.setcId(cId);
		schdDto.setschdDate(dateTime);
		
		
		System.out.println(schdDto.toString() + "Dasdass@#!@#123");
		
		int result = schdService.insertSchd(schdDto);
		
		if(result > 0) {
			model.addAttribute("msg", "일정 관리가 완료되었습니다");
			model.addAttribute("url", "/schd/regist");
		}
		return "common/info";
	}

}
