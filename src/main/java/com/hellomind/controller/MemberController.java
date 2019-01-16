package com.hellomind.controller;

import java.io.IOException;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

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
		System.out.println("로그인 포스트 요청" + id + "\n" + pw);
		
		 MemberDto memberDto = memberService.selectMember(id);	
	
		System.out.println("rawPw : " + pw);
		System.out.println("getPw : " + memberDto.getmPw());
		
		if (memberDto != null) {
			if(memberDto.getmStats().equals("2")) {
				model.addAttribute("msg", "탈퇴한 아이디입니다");
				model.addAttribute("url", "member/login");
				return "common/error";
			}
			if (passwordEncoder.matches(pw, memberDto.getmPw())) {
			/* if(pw.equals(memberDto.getmPw())) { */
				session.setAttribute("userId", id);
				model.addAttribute("msg", id + " 님 환영합니다");
				session.setAttribute("userInfo", memberDto);
				model.addAttribute("url", "/");
				return "common/info";
			} else {
				model.addAttribute("msg", "비밀번호가 잘못되었습니다");
				model.addAttribute("url", "member/login");
				return "common/error";
			}
		} else {
			System.out.println("memberDto :" + memberDto);
			model.addAttribute("msg", "아이디가 잘못되었습니다");
			model.addAttribute("url", "member/login");
			return "common/error";
		}
	}
		
	@RequestMapping(value = "logout", method = RequestMethod.GET)
	public String logout(HttpSession session) {
		session.removeAttribute("userId");
		return "redirect:/";
	}

	/* 내정보 확인, 수정 */
	@RequestMapping(value = "modify", method = RequestMethod.GET)
	public String modify(HttpSession session, Model model) {
		
		MemberDto member = memberService.selectMember((String) session.getAttribute("userId"));
		
		System.out.println(member);
		
		model.addAttribute("mId", member.getmId());
		model.addAttribute("mPnum", member.getmPnum());
		model.addAttribute("mEmail", member.getmEmail());
		model.addAttribute("mRegdate", member.getmRegdate());
		model.addAttribute("mPw", member.getmPw());
		
		return "member/modify";
	}

	@RequestMapping(method = RequestMethod.POST, value="modify")
	public String modifyMember(@RequestParam Map<String, String> param, HttpSession session, Model model,
			HttpServletRequest request) {
		MemberDto member = memberService.selectMember((String) session.getAttribute("mId"));
	
		member.setmEmail(param.get("mEmail"));
		member.setmPnum(param.get("mPnum"));
		
		System.out.println("수정하려는 멤버" + member.toString());
		
		if( 0 < memberService.updateMember(member)) {
			model.addAttribute("msg", "회원수정이 완료되었습니다");
			model.addAttribute("url", "modify");
			return "common/info";
		} else {
			model.addAttribute("msg", "회원수정이 실패했습니다");
			model.addAttribute("url", "modify");
			return "common/error";
		}
	}
	
	
/*	
	@RequestMapping(value = "modifyPw.bit", method = RequestMethod.GET)
	public String modifyPw(Model model, HttpSession session) {
		return "member/modifyPw";
	}
	
	@RequestMapping(value = "list.bit", method = RequestMethod.GET)
	public String list(Model model, HttpSession session) {
		MemberDto memberDto = (MemberDto) session.getAttribute("userInfo");
		if(memberDto != null) {
			List<MemberDto> mList = new ArrayList<MemberDto>();
			mList = memberService.selectAllMember();
		
			model.addAttribute("mList", mList);
		
			return "member/list";
		} else {
			model.addAttribute("msg", "회원전용 게시판입니다. 로그인 해주세요");
			model.addAttribute("url", "login.bit");
			return "error";
		}
			
	}



	// --------------------restful 구현-----------------------------------


	@RequestMapping(method = RequestMethod.GET)
	public String mypage(HttpSession session, Model model) {
		MemberDto memberDto = (MemberDto) session.getAttribute("userInfo");
		MemberDto member = memberService.selectMemberById(memberDto.getId());

		model.addAttribute("id", member.getId());
		model.addAttribute("name", member.getName());
		model.addAttribute("bdate", member.getBdate().substring(0, 10));

		if (member.getGender().equals("1")) {
			model.addAttribute("gender", "남자");
		} else {
			model.addAttribute("gender", "여자");
		}

		model.addAttribute("pnum", member.getPnum());
		model.addAttribute("addr", member.getAddr());

		return "member/view";
	}

	
	@RequestMapping(value="modifyPw", method = RequestMethod.PUT, headers={"Content-type=application/json"})
	public @ResponseBody String modifyPw(@RequestParam Map<String, String> param, HttpSession session, Model model,
			HttpServletRequest request) {
		
		MemberDto memberDto = (MemberDto) session.getAttribute("userInfo");
	
		memberDto.setPw(param.get("pw"));
		
		System.out.println(param.get("pw"));
		
		if (0 < memberService.updateMember(memberDto)) {
			System.out.println( "비번 수정이 완료되었습니다");
			return "{\"result\" : \"YES\" }" ;
		} else {
			System.out.println( "비번 수정이 실패했습니다");
			return "{\"result\" : \"NO\" }" ;
		}
	}
	
	@RequestMapping(method = RequestMethod.DELETE)
	public @ResponseBody String delete(Model model,HttpSession session) {
		MemberDto memberDto = (MemberDto) session.getAttribute("userInfo");
		memberService.deleteMember(memberDto.getId());
		session.removeAttribute("userInfo");
		model.addAttribute("msg", "회원탈퇴가 완료되었습니다");
		return "{\"result\" : \"badmin/boardmenu.bit\" }" ;
	}
	*/
}

