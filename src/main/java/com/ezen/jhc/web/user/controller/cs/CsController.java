package com.ezen.jhc.web.user.controller.cs;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

import com.ezen.jhc.web.user.dto.contact.AttachImageDTO;
import com.ezen.jhc.web.user.dto.contact.AttachImageListDTO;
import com.ezen.jhc.web.user.dto.contact.ContactDTO;
import com.ezen.jhc.web.user.dto.faq.FaqDTO;
import com.ezen.jhc.web.user.mapper.cs.ContactMapper;
import com.ezen.jhc.web.user.mapper.cs.FaqMapper;
import com.ezen.jhc.web.user.service.csService.ContactService;


@Controller
public class CsController {
	   @Autowired(required = false)
	   ContactDTO contact;
	
	@Autowired
	FaqMapper faq_mapper;

	@Autowired
	ContactMapper contact_mapper;
	
	@Autowired
	ContactService contact_service;
	
	/**@author JIEUN
	 * 
	 * **/
	
	// 카테고리별 페이지 cate_num을 받아서 적용 
	@GetMapping("/customerservice/cate")
	public String cs_cate1(Model model, Integer cs_ctgr_num) {
		
		// 모든 카테고리 -> 카테고리탭 , faq_num을 통해 가져온 질문목록
		List<FaqDTO> ctgr = faq_mapper.get_ctgr_num();
		List<FaqDTO> faq = faq_mapper.get(cs_ctgr_num);
		
		// faq_num을 통해 가져온 카테고리 이름 
		String ctgr_name = faq.get(0).getCs_ctgr_name();
		
		// 현재 카테고리의 개수
		int num_of_ctgr = faq_mapper.get_ctgr_num().size();
		
		model.addAttribute("faq", faq);
		model.addAttribute("ctgr", ctgr);
		model.addAttribute("ctgr_name", ctgr_name);
		model.addAttribute("num_of_ctgr", num_of_ctgr);
		
		return "user/cs/category/faq_category";
	}
	
	// CS 내 1:1 문의 
	
	@GetMapping("/customerservice/con")
	public String cs_contatct(Model model) {

		List<FaqDTO> ctgr = faq_mapper.get_ctgr_num();
		// 미리 선택되어있는 값 
		List<FaqDTO> ctgr0 = new ArrayList<>();
		
		ctgr0.add(ctgr.get(0));
		
		model.addAttribute("ctgr", ctgr);
		model.addAttribute("ctgr0", ctgr0);
		
		return "user/cs/contact/contact";
	}
	

	//1:1문의 POST
	   @PostMapping("/customerservice/con")
	   public String cs_contatct_(ContactDTO contact, AttachImageListDTO images){
	     
		  contact_service.contactEnroll(contact, images);
	      
	       return "redirect:/contact";
	   }
	
	
	
}
