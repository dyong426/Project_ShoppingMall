package com.ezen.jhc.web.admin.controller.contact;

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
import com.ezen.jhc.web.admin.dto.contact.ContactDTO;
import com.ezen.jhc.web.admin.dto.contact.ContactImageDTO;
import com.ezen.jhc.web.admin.service.contact.AdminContactServiceImpl;

import lombok.extern.log4j.Log4j2;

@Log4j2
@Controller
@RequestMapping("/admin")
public class AdminContactController {
	
	@Autowired
	AdminContactServiceImpl csService;
	
	@Autowired(required = false)
	List<ContactDTO> contentList;
	
	@Autowired(required = false)
	List<ContactImageDTO> csImages;
	
	@Autowired(required = false)
	ContactDTO content;
	
	@GetMapping("/contact")
	public String getContacts(Model model,
					@RequestParam(defaultValue="1") Integer currentPage, 
					@RequestParam(value="category", required = false,defaultValue="0") Integer category ,
					@RequestParam(value="keyword", required = false,defaultValue="") String mem_name) {
		
		
			
		if (category == 1) {
			contentList = csService.csSearchNull(mem_name);
		} else if (category == 2) {
			contentList = csService.csSearchNotNull(mem_name);
		} else {
			contentList = csService.csSearchName(mem_name);			
		}
		
		
		int total = contentList.size();

		int size = 10;
		
		if (currentPage == null && currentPage <= 0) {
			currentPage = 1;
		}
		
		int lastIndex = 0;
		if (contentList.size() < size * currentPage) {
			lastIndex = contentList.size();
		} else {			
			lastIndex = currentPage * size;
		}
		
		
		int startIndex = (currentPage * size) - size; 

		List<ContactDTO> contents = new ArrayList<>();
		
		for (int i = startIndex; i < lastIndex; i++) {
			
			contents.add(contentList.get(i));
		}
		
		model.addAttribute("paging", new PagingHelper(total, currentPage, 10, 5));
		
		model.addAttribute("contents", contents);
		
		return "admin/contact/admin_contact";
	}
	
	@GetMapping("/contact/content")
	public String getContent(Model model, Integer contact_num) {
		
		content = csService.getContactContent(contact_num);
		
		csImages = csService.contentImages(contact_num);
		
		model.addAttribute("content", content);
		model.addAttribute("csImages", csImages);
		
		return "admin/contact/admin_contact_content";
	}
	
	@PostMapping("/contact/content/reply/update")
	public String regAdminReply(ContactDTO contact) {
		
		log.info(contact.getContact_num());
		log.info(contact.getAdmin_reply());
		
		int result = csService.updateReply(contact.getContact_num(), contact.getAdmin_reply());
		
		log.info("답변작성" + result);
		
		return "redirect:/admin/contact/content?contact_num=" + contact.getContact_num();
	}
	
	@PostMapping("/contact/content/reply/delete")
	public String deleteContent(Integer contact_num) {
		log.info(contact_num);
		int result = csService.deleteReply(contact_num);
		
		log.info(result);
		
		return "redirect:/admin/contact";
	}
}
