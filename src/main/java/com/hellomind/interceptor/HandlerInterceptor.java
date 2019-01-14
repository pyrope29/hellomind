package com.hellomind.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

public class HandlerInterceptor extends HandlerInterceptorAdapter {

	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {

		HttpSession session = request.getSession();
		String userId = (String) session.getAttribute("userId");
		if (userId == null) {
			// 로그인되어 있지 않음, 요청 진행 중단.
			// 로그인 화면으로 이동
			response.sendRedirect("/member/login");
			return false;
		} else {
			// 로그인 되어 있음,
			return true; // 요청 계속 진행
		}
	}
}
