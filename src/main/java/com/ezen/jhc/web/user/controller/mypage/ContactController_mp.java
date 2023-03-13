package com.ezen.jhc.web.user.controller.mypage;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import com.ezen.jhc.web.user.dto.contact.ContactDTO;
import com.ezen.jhc.web.user.mapper.cs.ContactMapper;

@Controller
public class ContactController_mp {
	
	
	@Autowired
	ContactMapper contact_mapper;
	
	@GetMapping("/contact")
	public String contact_mp_list(Model model) {
		
		List<ContactDTO> list = contact_mapper.getContactList();
		
		model.addAttribute("list", list);
		System.out.println(list);
		return "user/mypage/contact/mp_contact_list";
	}
	// 마이 페이지 내 1:1 문의 확인 (문의 번호로 조회)
	@GetMapping("/contact/view")
	public String contact_mp(Integer contact_num, Model model) {
		
		List<ContactDTO> contact = contact_mapper.getContactById(contact_num);
		
		model.addAttribute("contact", contact);
		
		
		return "user/mypage/contact/mp_contact";
	}

}
