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
	public String col(Model model, String keyword) {
		Map<String, Object> data = new HashMap<String, Object>();
		data.put("keyword", keyword);		
		
		model.addAttribute("colList", colService.getColList(data));
		model.addAttribute("keyword", keyword);
		return "col/colList";
	}

}
