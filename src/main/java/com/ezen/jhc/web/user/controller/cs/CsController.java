package com.ezen.jhc.web.user.controller.cs;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.ezen.jhc.web.user.dto.faq.FaqDTO;
import com.ezen.jhc.web.user.mapper.cs.ContactMapper;
import com.ezen.jhc.web.user.mapper.cs.FaqMapper;

@Controller
public class CsController {
	
	
	@Autowired
	FaqMapper faq_mapper;

	@Autowired
	ContactMapper contact_mapper;
	
	// CS 시작 페이지 = 주문/결제 (cate_num=1)
	@RequestMapping(value ="/customerservice", method = RequestMethod.GET)
	public String cs_main(Model model) {
		
		String cate_name = "주문 / 결제";
		List<FaqDTO> faq = faq_mapper.get(0);
		
		model.addAttribute("faq", faq);
		model.addAttribute("cate_name", cate_name);
		return "user/cs/category/faq_category";
	}
	
	// 카테고리별 페이지 
	// cate_num을 받아서 적용 
	@RequestMapping(value ="/customerservice/cate", method = RequestMethod.GET)
	public String cs_cate1(Model model, Integer faq_ctgr) {
		String cate_name = "";
		List<FaqDTO> faq = faq_mapper.get(faq_ctgr);
		
		if(faq_ctgr == 0) {
			cate_name ="주문 / 결제";
		} else if(faq_ctgr == 1) {
			cate_name ="배송";
		} else if(faq_ctgr == 2) {
			cate_name ="취소 / 환불";
		} else if(faq_ctgr == 3) {
			cate_name ="반품 / 교환";
		} else if(faq_ctgr == 4) {
			cate_name ="기타";
		} else if (faq_ctgr == 5) {
			cate_name ="제작 문의";
		} else if (faq_ctgr == 6) {
			cate_name ="단체문의";
		}
		
		model.addAttribute("faq", faq);
		model.addAttribute("cate_name", cate_name);
		return "user/cs/category/faq_category";
	}
	
	// CS 내 1:1 문의 
	
	@RequestMapping(value ="/customerservice/con", method = RequestMethod.GET)
	public String cs_contatct(HttpServletRequest req) {
		
		
		
		
		return "user/cs/contact/contact";
	}
	
	
	
	@RequestMapping(value ="/customerservice/con", method = RequestMethod.POST)
	public String cs_contatct_(HttpServletRequest req) {
		
		
		
		
		
		return "user/cs/contact/contact";
	}
	
	// 마이 페이지 내 1:1 문의 리스트
	@RequestMapping(value ="/contact", method = RequestMethod.GET)
	public String contact_mp_list() {
		
		return "user/mypage/contact/mp_contact_list";
	}
	
	// 마이 페이지 내 1:1 문의 확인 (문의 번호로 조회)
	@RequestMapping(value ="/contact/01", method = RequestMethod.GET)
	public String contact_mp() {
		
		return "user/mypage/contact/mp_contact";
	}
	
}
