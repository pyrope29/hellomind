package com.hellomind.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
@RequestMapping("/col")
public class ColController {

	/*
	 * @Autowired private MemberService memberService;
	 */
	/*
	 * @Autowired BCryptPasswordEncoder passwordEncoder;
	 */

	@RequestMapping(value = "colList", method = RequestMethod.GET)
	public String col() {
		return "col/colList";
	}

}
