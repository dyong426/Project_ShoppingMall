package com.ezen.jhc.web.user.controller.member;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import javax.sql.DataSource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.ezen.jhc.web.user.dto.member.MemberDTO;
import com.ezen.jhc.web.user.mapper.member.MemberMapper;

@Controller

public class MemberController {

	@Autowired
	DataSource ds;
	
	@Autowired
	MemberMapper mapper;
	
	// 입력된 이메일로 체크와 가입
	@RequestMapping(value="/join_member")
	public ModelAndView join_member (HttpServletRequest request, HttpSession session){
		ModelAndView mv = new ModelAndView();
		
		String mem_email = request.getParameter("mem_email");
		Integer member = mapper.checkMem(mem_email);

		if (member == 0) {
			
			// 가입
			
//			mapper.join(mem_email, mem_email, mem_email, mem_email, mem_email, mem_email, mem_email, null);
			
		} else {
			
			mv.addObject("email", "error");
			
		}

				return mv;
	}
	

	// 로그인
	@RequestMapping("/login.do")
	public String login(MemberDTO dto,  HttpServletRequest request) {
		MemberDTO login = mapper.login(dto);	
		HttpSession session = request.getSession();
		
		if (login != null) {
			
			session.setAttribute("login", login);
			return "redirect:/main";
					
		} else {
			
			session.setAttribute("login", login);
			return "redirect:/main";
			
		}
		
		
		
		
		
		
	}
	
	@RequestMapping("/logout.do")
	public String logout(HttpSession session) {
		
		session.invalidate();
		return "redirect:/main";
		
	}
	
	
	
}
