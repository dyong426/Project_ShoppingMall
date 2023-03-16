package com.ezen.jhc.web.admin.controller.contact;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.ezen.jhc.web.admin.dto.contact.ContactDTO;
import com.ezen.jhc.web.admin.service.contact.AdminContactServiceImpl;

import lombok.extern.log4j.Log4j2;

@Log4j2
@Controller
@RequestMapping("/admin")
public class AdminContactController {
	
	@Autowired
	AdminContactServiceImpl csService;
	
	@Autowired(required = false)
	List<ContactDTO> contents;
	
	@GetMapping("/contact")
	public String getContacts(Model model) {
		
		contents = csService.getContactContentList();
		
		log.info(contents);
		model.addAttribute("contents", contents);
		
		return "admin/contact/admin_contact";
	}
	
	@GetMapping("/contact/content")
	public String getContent() {
		
		
		
		return "admin/contact/admin_contact_content";
	}
}
