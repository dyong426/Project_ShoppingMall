package com.ezen.jhc.web.admin.controller.member;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.ezen.jhc.web.admin.dto.member.MemberDTO;
import com.ezen.jhc.web.admin.dto.order.OrderListDTO;
import com.ezen.jhc.web.admin.service.member.AdminMemberServiceImpl;

import lombok.extern.log4j.Log4j2;

@Log4j2
@Controller
@RequestMapping("/admin")
public class AdminMemberController {
	
	@Autowired
	AdminMemberServiceImpl memberService; 
	
	@Autowired(required = false)
	MemberDTO memberDTO;
	
	@Autowired(required = false)
	List<MemberDTO> members;
	
	@Autowired(required = false)
	List<OrderListDTO> orderList;
	
	
	@GetMapping("/member")
	public String getMembers(Model model) {
		
		members = memberService.getMemberList();
		
		model.addAttribute("members", members);
		
		return "admin/member/admin_member";
	}
	
	@GetMapping("/member/detail")
	public String getMemberDetail(Model model, Integer mem_num) {
		
		memberDTO = memberService.getMemberInfo(mem_num);
		
		model.addAttribute("member", memberDTO);
		
		orderList = memberService.getMemberRecentOrderList(mem_num);
		
		model.addAttribute("orderList", orderList);
		
		return "admin/member/admin_member_detail";
	}
	
	@PostMapping("/member/delete")
	public String deleteMember(Integer mem_num) {
		
		log.info(mem_num);
		
		int result = memberService.deleteMember(mem_num);
		
		log.info(result);
		
		return "redirect:/admin/member";
	}

}
