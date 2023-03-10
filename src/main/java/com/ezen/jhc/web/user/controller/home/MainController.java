package com.ezen.jhc.web.user.controller.home;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

/**@author SUJEONG
 * 로그인 확인, 메인 페이지 연결
 * */
@Controller
public class MainController {

	// js에서 로그인 상태 확인해 로그인/로그아웃 표시
	@ResponseBody
	@PostMapping(value = "/isLoggedIn")
	public boolean isLoggedIn(@RequestParam boolean loggedIn, HttpServletRequest request, HttpSession session) {
		boolean isLoggedIn = false;

		Cookie[] cookies = request.getCookies();
		for (Cookie c : cookies) {
			if (c.getName().equals("jhcid") && session.getAttribute("member") != null) {
				isLoggedIn = true;
			} else {
				isLoggedIn = false;
			}
		}

		return isLoggedIn;
	}

	@RequestMapping(value = "/main")
	public String main(Model model, HttpServletRequest request, HttpSession session) {


		return "user/home/main";
	}
}
