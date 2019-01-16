package com.hellomind.controller;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.hellomind.service.ColService;

@Controller
@RequestMapping("/col")
public class ColController {

	@Autowired
	private ColService colService;
	@Autowired
	BCryptPasswordEncoder passwordEncoder;

	@RequestMapping("search")
	public String col(Model model, String page, String msgPerPage) {
		int pageNumber = 1;	
		if (page != null) {
			pageNumber = Integer.parseInt(page);
		}
		
		int numOfMsgPage = 10;
		if (msgPerPage != null) {
			numOfMsgPage = Integer.parseInt(msgPerPage);
		} 
		
		Map<String, Object> data = new HashMap<String, Object>();
		data.put("pageNumber", pageNumber);
		data.put("numOfMsgPage", numOfMsgPage);
	
		Map<String, Object> viewData = colService.selectColList(data);
		model.addAttribute("viewData", viewData);	

		return "col/colList";
	}

}
