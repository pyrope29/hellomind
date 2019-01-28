package com.hellomind.controller;

import java.text.DateFormat;
import java.util.Date;
import java.util.Locale;
import java.util.Map;

import org.json.JSONObject;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

/**
 * Handles requests for the application home page.
 */
@Controller
public class HomeController {
	
	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);
	
	/**
	 * Simply selects the home view to render by returning its name.
	 */
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home(Locale locale, Model model) {
		logger.info("Welcome home! The client locale is {}.", locale);
		
		Date date = new Date();
		DateFormat dateFormat = DateFormat.getDateTimeInstance(DateFormat.LONG, DateFormat.LONG, locale);
		String formattedDate = dateFormat.format(date);
		model.addAttribute("serverTime", formattedDate );
		
		return "main";
	}

    @RequestMapping(value = "/start", method = RequestMethod.POST, consumes = "application/json")
    @ResponseBody
    public String startApp(@RequestBody String body) {
        System.out.println("노드서버의 dateTime : " + body);
        System.out.println("/start 시작!!");
        logger.info(body);
        return "/";
    }

    @RequestMapping(value = "/hellomind", method = RequestMethod.GET)
    public String getData(@RequestParam Map<String, String> param, Locale locale, Model model){	
    	System.out.println("getData 시작!!!!"  +param);
    	
    	model.addAttribute("sender", param.get("sender"));
    	model.addAttribute("recepient", param.get("recepient"));
    	model.addAttribute("dateTime", param.get("dateTime"));
    	
    	
    	Date date = new Date();
		DateFormat dateFormat = DateFormat.getDateTimeInstance(DateFormat.LONG, DateFormat.LONG, locale);
		String formattedDate = dateFormat.format(date);
		model.addAttribute("serverTime", formattedDate );
		
        //console 전달
        JSONObject cred = new JSONObject();
        JSONObject auth=new JSONObject();
        JSONObject parent=new JSONObject();
        cred.put("id","nodeId");
        cred.put("serverTime",formattedDate);
        cred.put("password", "pwd");
        auth.put("tenantName", "tenantName");
        auth.put("passwordCredentials", cred);
        parent.put("auth", auth);

        URLConn conn = new URLConn("http://127.0.0.1",3000);
        conn.urlPost(parent);

        return "chat/chatting";
    }
	
}
