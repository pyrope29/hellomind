package com.hellomind.controller;

import java.io.File;
import java.io.IOException;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.TreeSet;
import java.util.UUID;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.hellomind.dto.ColDetDto;
import com.hellomind.dto.ColDto;
import com.hellomind.dto.MemberDto;
import com.hellomind.dto.SchdDto;
import com.hellomind.service.ColDetService;
import com.hellomind.service.ColService;

@Controller
@RequestMapping("/col")
public class ColController {

	@Autowired
	private ColService colService;
	@Autowired
	private ColDetService colDetService;
	@Autowired
	BCryptPasswordEncoder passwordEncoder;	
	@Autowired
	private ServletContext servletContext;

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
	
	@RequestMapping
	public String colHome() {
		return "col/main";
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
	
	@RequestMapping(value = "join", method = RequestMethod.GET)
	public String join() {
		System.out.println("조인 요청");
		return "col/join";
	}
		
	@Transactional
	@RequestMapping(value = "join", method = RequestMethod.POST)
	public String join(@RequestParam Map<String, String> param, Model model, @RequestParam("pic") MultipartFile multipartFile,
			@RequestParam("cert") MultipartFile multipartFile2) throws IOException {
		System.out.println(param +"\n"+ multipartFile +"\n"); 
		ColDto colDto = new ColDto();
		colDto.setcId(param.get("cId"));
		// 비밀번호 암호화
		colDto.setcPw(passwordEncoder.encode(param.get("cPw")));
		colDto.setcName(param.get("cName"));
		colDto.setcEmail(param.get("cEmail"));
		colDto.setcPnum(param.get("cPnum"));
		colDto.setcLv(param.get("cLv"));
		
		ColDetDto colDetDto = new ColDetDto();
		colDetDto.setcId(param.get("cId"));
		colDetDto.setCareer(param.get("career"));
		colDetDto.setIntro(param.get("intro"));

		
		if(multipartFile != null && !multipartFile.isEmpty()) {
			String opicture = multipartFile.getOriginalFilename();
			String opicture2 = multipartFile2.getOriginalFilename();
			
			String realPath = servletContext.getRealPath("/img/pic");
			System.out.println("realpath : " + realPath);
			
			String realPath2 = servletContext.getRealPath("/img/cert");
			System.out.println("realpath2 : " + realPath2);
			
			DateFormat df = new SimpleDateFormat("yyMMdd");
			String saveFolder = df.format(new Date());
			String fullSaveFolder = realPath + File.separator + saveFolder;
			String fullSaveFolder2 = realPath2 + File.separator + saveFolder;
			
			System.out.println("fullSaveFolder : " + fullSaveFolder);
			System.out.println("fullSaveFolder2 : " + fullSaveFolder2);
			
			File dir = new File(fullSaveFolder);
			File dir2 = new File(fullSaveFolder2);
			if(!dir.exists())
				dir.mkdirs();
			
			if(!dir2.exists())
				dir2.mkdirs();
			
			String savePicture = UUID.randomUUID().toString() + opicture.substring(opicture.lastIndexOf('.'));
			String savePicture2 = param.get("cId") + UUID.randomUUID().toString() + opicture2.substring(opicture2.lastIndexOf('.'));
			
			File file = new File(fullSaveFolder, savePicture);
			File file2 = new File(fullSaveFolder2, savePicture2);
			
			try {
				multipartFile.transferTo(file);
				multipartFile2.transferTo(file2);
			} catch (IllegalStateException e) {
				e.printStackTrace();
			} catch (IOException e) {
				e.printStackTrace();
			}
			
			colDetDto.setOrignPicture(opicture);
			colDetDto.setSavePicture(savePicture);
			colDetDto.setSaveFolder(saveFolder);
			
		}
		
		if (0 < colService.insertCol(colDto) && 0 < colDetService.insertColDet(colDetDto) ) {
			model.addAttribute("msg", "상담사 가입이 완료되었습니다.");
			model.addAttribute("url", "/col");
		}
		return "common/info";
	}
	
	@RequestMapping(value = "viewColDet", method = RequestMethod.GET)
	public String viewColDet(Model model) {
		System.out.println("상담사 디테일 요청");
		//TODO
		model.addAttribute("cId", "2");
		return "col/colDet";
	}
	
}
