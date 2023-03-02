package com.ezen.jhc.web.user.controller.member;

import javax.servlet.http.HttpServletRequest;
import javax.sql.DataSource;

import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.ezen.jhc.web.user.dto.member.MemberDTO;
import com.ezen.jhc.web.user.mapper.member.MemberMapper;

@Controller

public class MemberController {

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
		} else {
			
		}
				return "user/join/welcome";
	}
	
	@RequestMapping("/login.do")
	public String login(MemberDTO dto, Model model) {
				
		model.addAttribute("member", dto);
				
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

	

	
	
	
}
