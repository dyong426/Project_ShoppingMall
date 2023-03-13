package com.ezen.jhc.web.user.controller.cs;

import java.util.ArrayList;
import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.ezen.jhc.web.user.dto.faq.FaqDTO;
import com.ezen.jhc.web.user.mapper.cs.ContactMapper;
import com.ezen.jhc.web.user.mapper.cs.FaqMapper;

@Controller
public class CsController {

	
	@Autowired
	FaqMapper faq_mapper;

	@Autowired
	ContactMapper contact_mapper;
	
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
	
	
	
	@PostMapping("/customerservice/con")
	public String cs_contatct_( 
			@Param("mem_num") Integer mem_num,
			@Param("contact_ctgr") Integer contact_ctgr, @Param("contact_title") String contact_title,
			@Param("contact_content") String contact_content){
	//			@Param("contact_image_path") String contact_image_path) 
		
		
		System.out.println(mem_num);
		System.out.println(contact_ctgr);
		System.out.println(contact_title);
		System.out.println(contact_content);
		//System.out.println(contact_image_path);
	
	
		String insert = contact_mapper.insert_contact(mem_num, contact_ctgr, contact_title,contact_content);
		
		 return "redirect:/contact";
	}
	
}
