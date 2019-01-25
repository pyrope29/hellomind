package com.hellomind.controller;

import java.io.IOException;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.http.HttpRequest;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.web.authentication.logout.SecurityContextLogoutHandler;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.hellomind.dto.MemberDto;
import com.hellomind.service.MemberService;
@Controller
@RequestMapping("/member")
public class MemberController {
	@Autowired
	private MemberService memberService;
	@Autowired
	BCryptPasswordEncoder passwordEncoder;
	
	@RequestMapping(value = "login", method = RequestMethod.GET)
	public String login() {
		System.out.println("로그인 요청");
		return "member/login";
	}
	
	@RequestMapping(value = "join", method = RequestMethod.GET)
	public String join() {
		System.out.println("조인 요청");
		return "member/join";
	}
	
	@RequestMapping(value = "idCheck", method = RequestMethod.POST)
	public @ResponseBody String idCheck(@RequestParam("id") String mId){
		String result;
		MemberDto CheckedId = memberService.selectMember(mId);
		
		if(CheckedId==null){
			result = "YES";	
		} else { 
			result = "NO";
		}
		return result;
	}
	
	@RequestMapping(method = RequestMethod.POST)
	public String join(@RequestParam Map<String, String> param, Model model) throws IOException {
		System.out.println("조인한 아이디 : " + param.get("mId"));

		MemberDto memberDto = new MemberDto();
		memberDto.setmId(param.get("mId"));
		
		// 비밀번호 암호화
		memberDto.setmPw(passwordEncoder.encode(param.get("mPw")));
		memberDto.setmPnum(param.get("mPnum"));
		memberDto.setmEmail(param.get("mEmail"));

		if (0 < memberService.insertMember(memberDto)) {
			model.addAttribute("msg", "회원가입 완료");
			model.addAttribute("url", "/");
		}
		return "common/info";
	}


	@RequestMapping(value = "login", method = RequestMethod.POST)
	public String login(@RequestParam Map<String, String> param, Model model, HttpSession session) {
	
		String id = param.get("mId");
		String pw = param.get("mPw");

	   MemberDto memberDto = memberService.selectMember(id);	
	
		System.out.println("rawPw : " + pw);
		System.out.println("getPw : " + memberDto.getmPw());
		
		if (memberDto != null) {
			if(memberDto.getmStats().equals("2")) {
				model.addAttribute("msg", "탈퇴한 아이디입니다");
				model.addAttribute("url", "login");
				return "common/error";
			}
			if(session.getAttribute("userInfo")!=null) {
				model.addAttribute("msg", "상담사로 로그인 되어있습니다. 로그아웃해 주세요.");
				model.addAttribute("url", "login");
				return "common/error";
			}
			if (passwordEncoder.matches(pw, memberDto.getmPw())) {
				model.addAttribute("msg", id + " 님 환영합니다");
				session.setAttribute("userInfo", memberDto);
				model.addAttribute("url", "../");
				return "common/info2";
			} else {
				model.addAttribute("msg", "비밀번호가 잘못되었습니다");
				model.addAttribute("url", "login");
				return "common/error";
			}
		} else {
			System.out.println("memberDto :" + memberDto);
			model.addAttribute("msg", "아이디가 잘못되었습니다");
			model.addAttribute("url", "login");
			return "common/error";
		}
	}
		
	@RequestMapping(value = "logout", method = RequestMethod.GET)
	public String logout(HttpSession session) {
		session.removeAttribute("userInfo");
		return "redirect:/";
	}

	/* 내정보 확인, 수정 */
	@RequestMapping(value = "modify", method = RequestMethod.GET)
	public String modify(HttpSession session, Model model) {
		
		MemberDto memberDto = (MemberDto) session.getAttribute("userInfo");
		System.out.println("수정하려는 멤버" + memberDto.toString());
		
		model.addAttribute("mId", memberDto.getmId());
		model.addAttribute("mPnum", memberDto.getmPnum());
		model.addAttribute("mEmail", memberDto.getmEmail());
		model.addAttribute("mRegdate", memberDto.getmRegdate());
		
		return "member/modify";
	}

	@RequestMapping(method = RequestMethod.POST, value="modify")
	public String modifyMember(@RequestParam Map<String, String> param, HttpSession session, Model model,
			HttpServletRequest request) {
		MemberDto memberDto = (MemberDto) session.getAttribute("userInfo");
		
		memberDto.setmEmail(param.get("mEmail"));
		memberDto.setmPnum(param.get("mPnum"));
		
		if( 0 < memberService.updateMember(memberDto)) {
			model.addAttribute("msg", "회원수정이 완료되었습니다");
			model.addAttribute("url", "modify");
			return "common/info";
		} else {
			model.addAttribute("msg", "회원수정이 실패했습니다");
			model.addAttribute("url", "modify");
			return "common/error";
		}
	}
	
	@RequestMapping(value = "modifyPw", method = RequestMethod.GET)
	public String modifyPw(HttpSession session, Model model) {
		
		MemberDto memberDto = (MemberDto)session.getAttribute("userInfo");
		model.addAttribute("mPw", memberDto.getmPw());
		return "member/modifyPw";
	}
	

	@RequestMapping(method = RequestMethod.POST, value="modifyPw")
	public String modifyPw(@RequestParam Map<String, String> param, HttpSession session, Model model,
			HttpServletRequest request) {
		MemberDto memberDto = (MemberDto) session.getAttribute("userInfo");
		memberDto.setmPw(passwordEncoder.encode(param.get("mPw")));
		
		if(0 < memberService.updateMember(memberDto)) {
			model.addAttribute("msg", "비밀번호 수정이 완료되었습니다");
			model.addAttribute("url", "modifyPw");
			return "common/info";
		} else {
			model.addAttribute("msg", "비밀번호 수정이 실패했습니다");
			model.addAttribute("url", "modifyPw");
			return "common/error";
		}
	}

}

