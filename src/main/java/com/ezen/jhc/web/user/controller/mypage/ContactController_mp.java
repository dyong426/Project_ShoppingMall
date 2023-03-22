package com.ezen.jhc.web.user.controller.mypage;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import com.ezen.jhc.web.user.dto.contact.AttachImageDTO;
import com.ezen.jhc.web.user.dto.contact.ContactDTO;
import com.ezen.jhc.web.user.dto.member.MemberDTO;
import com.ezen.jhc.web.user.mapper.cs.ContactMapper;

@Controller
public class ContactController_mp {
	/**@author JIEUN
	 * 
	 * **/
	
	@Autowired
	ContactMapper contact_mapper;
	
	// 세션 가져와서 처리
	@GetMapping("/contact")
	public String contact_mp_list(Integer page, Model model, HttpServletRequest request) {
		
		// 세션 가져오기
		HttpSession session = request.getSession();
		
		// mem_num
		MemberDTO member = (MemberDTO) session.getAttribute("member");
		Integer mem_num = member.getMem_num();

		List<ContactDTO> list = contact_mapper.getContactList(mem_num);
		
		//page_num
		if(page == null) {
			page = 1;
		}
		int list_end = page * 10 - 1;
		int list_begin = list_end - 9;
		System.out.println(page);
		System.out.println(list_end);
		
		if(list_end > list.size()) {
			list_end = list.size() - 1;
		}
		System.out.println(list.size());
		System.out.println(list_begin);
		System.out.println(list_end);
		
		model.addAttribute("begin", list_begin);
		model.addAttribute("end", list_end);

		model.addAttribute("list", list);
		model.addAttribute("list_size", list.size());
		
		
		return "user/mypage/contact/mp_contact_list";
	}
	
	// 마이 페이지 내 1:1 문의 확인 (문의 번호로 조회)
	@GetMapping("/contact/view")
	public String contact_mp(Integer contact_num, Model model) {
		
		List<ContactDTO> contact = contact_mapper.getContactById(contact_num);
		List<AttachImageDTO> img = contact_mapper.getContactImgByContactNum(contact_num);
		
		model.addAttribute("contact", contact);
		model.addAttribute("img", img);
		
		
		return "user/mypage/contact/mp_contact";
	}

}
