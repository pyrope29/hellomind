package com.hellomind.controller;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.hellomind.dto.ColDto;
import com.hellomind.dto.MemberDto;
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
	

	@RequestMapping("viewColDet")
	public String colDet(Model model, String cId, String msgPerPage) {
	
		//ColDto colDto = colService.selectCol(cId);
		//System.out.println("colDto : " +colDto.toString());
		
		//model.addAttribute("colDto", colDto);	
			//colDto 하나하나 뿌려주기
		return "col/colDet";
	}
	
	@RequestMapping("regist")
	public String regist() {
		return "col/regist";
	}
	
	@RequestMapping
	public String colHome() {
		return "col/home";
	}
	
	@RequestMapping(value="login", method=RequestMethod.POST)
	public String login(@RequestParam Map<String, String> param, Model model, HttpSession session) {

		String id = param.get("cId");
		String pw = param.get("cPw");
		System.out.println("로그인 요청 id : " + id + "\npw:" + pw);
		
	   ColDto colDto = colService.selectCol(id);	
	
		System.out.println("rawPw : " + pw);
		System.out.println("getPw : " + colDto.getcPw());
		
		if (colDto != null) {
			if(colDto.getcStats().equals("2")) {
				model.addAttribute("msg", "탈퇴한 아이디입니다");
				model.addAttribute("url", "/col");
				return "common/error";
			}
			if (passwordEncoder.matches(pw, colDto.getcPw())) {
			/* if(pw.equals(memberDto.getmPw())) { */
				model.addAttribute("msg", id + " 님 환영합니다");
				session.setAttribute("colInfo", colDto);
				model.addAttribute("url", "/col");
				return "common/info";
			} else {
				model.addAttribute("msg", "비밀번호가 잘못되었습니다");
				model.addAttribute("url", "/col");
				return "common/error";
			}
		} else {
			System.out.println("memberDto :" + colDto);
			model.addAttribute("msg", "아이디가 잘못되었습니다");
			model.addAttribute("url", "/col");
			return "common/error";
		}
	}
	
	
	@RequestMapping(value = "logout", method = RequestMethod.GET)
	public String logout(HttpSession session) {
		session.removeAttribute("colInfo");
		return "redirect:/col";
	}
		
}
