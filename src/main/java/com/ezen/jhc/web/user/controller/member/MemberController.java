package com.ezen.jhc.web.user.controller.member;

import java.security.NoSuchAlgorithmException;
import java.util.Date;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.sql.DataSource;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.ezen.jhc.common.util.PasswordEncoder;
import com.ezen.jhc.web.user.dto.member.MemberDTO;
import com.ezen.jhc.web.user.mapper.member.MemberMapper;


/**
 * @author SUJEONG
 * 회원가입, 로그인, 로그아웃 */

@Controller
public class MemberController {

	@Autowired
	DataSource ds;
	
	@Autowired
	MemberMapper mapper;

	
	// 암호화
	@RequestMapping(value="/encrypt.do")
	public ResponseEntity<String> encryptPassword(@RequestParam String password) throws NoSuchAlgorithmException {
		String encoded = PasswordEncoder.encodePassword(password);
		
		return new ResponseEntity<String>(encoded, HttpStatus.OK);
		
	}
	
	
	@RequestMapping(value="/join.do")
	public String join_member (MemberDTO dto, Model model, HttpServletRequest request) throws NoSuchAlgorithmException{
		
		String mem_email = request.getParameter("mem_email");
		Integer member = mapper.checkMem(mem_email);
		
		dto.setMem_pw(PasswordEncoder.encodePassword(dto.getMem_pw()));
		
		if (member == 0) {
			
			mapper.join(dto);
			model.addAttribute("mem_email", dto.getMem_email());
			model.addAttribute("mem_name", dto.getMem_name());	
		}
			return "user/join/welcome";
	}
	
	// 세션과 쿠키를 이용한 로그인 유지 방식
	@PostMapping("/login.do")
	public String login(@RequestParam("mem_email")String memEmail,
			HttpServletRequest request, HttpServletResponse response,
			HttpSession session) {
		
		MemberDTO dto = mapper.getMember(memEmail);
		

		// 세션에 memberDTO 저장
		session = request.getSession(true);
		session.setAttribute("member", dto);
		
		session.setMaxInactiveInterval(60 * 60);
		
		

		// 쿠키 생성
		Cookie cookie = new Cookie("jhcid", session.getId());
		cookie.setMaxAge(60 * 60); // 한시간
		cookie.setHttpOnly(true); // xss 공격 예방
		cookie.setPath("/jhc");
		response.addCookie(cookie);
		
		
		return "redirect:/main";
		
	}
	
	@PostMapping("/logout.do")
	public String logout(HttpSession session, HttpServletRequest request, HttpServletResponse response) {
		
		// 로그아웃시 세션, 쿠키 만료
		session.removeAttribute("member");
		session.invalidate();
		
		Cookie[] cookies = request.getCookies();
		
		if (cookies !=null) {
			for (Cookie cookie : cookies) {
				if(cookie.getName().equals("jhcid")) {
				cookie.setValue(null);
				cookie.setMaxAge(0);
				response.addCookie(cookie);
				break;
				
				}
				
			}
		}
		
		return "redirect:/main";
				
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
	
	// 패스워드 변경 작업
	@PostMapping("/member/reset/password")
	public String resetPassword(HttpServletRequest request, HttpSession session) throws NoSuchAlgorithmException {
		
		String pw = request.getParameter("mem_pw");
		String mem_email = request.getParameter("mem_email");
		
		// 암호화
		String mem_pw = PasswordEncoder.encodePassword(pw); 
				
		// db
		mapper.changePassword(mem_pw, mem_email);
		
		// 변경 완료 메세지
		return "user/mypage/personal_information/passwordChangeComplete";
		
	}
	
	
}
