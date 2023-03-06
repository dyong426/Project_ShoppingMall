package com.ezen.jhc.web.user.controller.member;

import java.util.Date;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.sql.DataSource;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.ezen.jhc.common.util.SessionConstants;
import com.ezen.jhc.common.util.SessionManager;
import com.ezen.jhc.web.user.dto.member.MemberDTO;
import com.ezen.jhc.web.user.mapper.member.MemberMapper;

@Controller

public class MemberController {

	@Autowired
	SessionManager sessionManager;
	
	@Autowired
	DataSource ds;
	
	@Autowired
	MemberMapper mapper;
	
	@RequestMapping(value="/join.do")
	public String join_member (MemberDTO dto, Model model, HttpServletRequest request){
		
		String mem_email = request.getParameter("mem_email");
		Integer member = mapper.checkMem(mem_email);

		if (member == 0) {
			mapper.join(dto);
			model.addAttribute("member", dto);	
		}
				return "user/join/welcome";
	}
	
	@PostMapping("/login.do")
	public String login(
			Model model, HttpServletRequest request, HttpServletResponse response) {

		MemberDTO dto = mapper.getMember(request.getParameter("mem_email"));
		model.addAttribute("member", dto);
		
		HttpSession session = request.getSession();
		session.setAttribute(SessionConstants.LOGIN_MEMBER, dto);
		session.setMaxInactiveInterval(1800);//1800초
		
		
		return "redirect:/main";
		
	}
	
	@PostMapping("/logout.do")
	public String logout(HttpServletRequest request) {
		
		System.out.println("로그아웃");
		HttpSession session = request.getSession(false);
		session.invalidate();
		
		
		return "redirect:/loginHome";
				
	}
	
	@GetMapping("/loginHome")
	public String homeLoginV2(HttpServletRequest request, Model model) {
	   MemberDTO member = (MemberDTO) sessionManager.getSession(request);

	    if (member == null) {
	        return "user/home/main";
	    }

	    model.addAttribute("member", member);
	    return "loginHome";
	}
	
	@RequestMapping("/emailCheck")
	@ResponseBody
	public int emailCheck(@RequestParam("mem_email") String mem_email) {
		int cnt = mapper.checkMem(mem_email);
	
		return cnt;
	}
	
	@RequestMapping("/checkEmailPw")
	@ResponseBody
	public Integer checkEmailPw(@RequestParam("mem_email")String mem_email, @RequestParam("mem_pw")String mem_pw) {

		Integer match = mapper.checkEmailPw(mem_email, mem_pw);
		
		return match;
		
	}
	private static final Logger log = LoggerFactory.getLogger(MemberController.class);
	
	public void printSessionInfo(HttpServletRequest request, String sessionId){
		HttpSession session = request.getSession(false);    

    log.info("sessionId={}", session.getId());
    log.info("getMaxInactiveInterval={}", session.getMaxInactiveInterval());
    log.info("creationTime={}", new Date(session.getCreationTime()));
    log.info("lastAccessedTime={}", new Date(session.getLastAccessedTime()));
    log.info("isNew={}", session.isNew());
	}
	
	
	
}
