package com.ezen.jhc.web.admin.controller.member;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.ezen.jhc.common.util.PagingHelper;
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
	List<MemberDTO> memberList;
	
	@Autowired(required = false)
	List<OrderListDTO> orderList;
	
	
	@GetMapping("/member")
	public String getMembers(Model model,
					@RequestParam(value="keyword", required=false, defaultValue="") String mem_name,
					@RequestParam(defaultValue="1") Integer currentPage ){
		
		memberList = memberService.getMemberByName(mem_name);
	
		
		int total = memberList.size();

		int size = 10;
		
		if (currentPage == null && currentPage <= 0) {
			currentPage = 1;
		}
		
		int lastIndex = 0;
		if (memberList.size() < size * currentPage) {
			lastIndex = memberList.size();
		} else {			
			lastIndex = currentPage * size;
		}
		
		
		int startIndex = (currentPage * size) - size; 

		List<MemberDTO> members = new ArrayList<>();
		
		for (int i = startIndex; i < lastIndex; i++) {
			
			members.add(memberList.get(i));
		}
		
		model.addAttribute("paging", new PagingHelper(total, currentPage, 10, 5));
		
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
