package com.ezen.jhc.web.user.controller.home;



import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.ezen.jhc.web.session.SessionManager;

import com.ezen.jhc.web.user.dto.member.MemberDTO;

@Controller
public class MainController {
	

	@Autowired
	SessionManager sessionManager;
	
	@RequestMapping(value ="/main", method = RequestMethod.GET)
	public String main(HttpServletRequest request) {
		
		MemberDTO member = (MemberDTO)sessionManager.getSession(request);
	
		return "user/home/main";
	}
	
}
