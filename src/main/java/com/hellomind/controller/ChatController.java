package com.hellomind.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/hellomind")
public class ChatController {
	
	@RequestMapping("/chat.html")
	public void test() {
		System.out.println("test");
	}
}
