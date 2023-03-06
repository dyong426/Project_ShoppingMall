package com.ezen.jhc.web.user.controller.cs;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.ezen.jhc.web.user.dto.faq.FaqDTO;
import com.ezen.jhc.web.user.mapper.cs.FaqMapper;

@Controller
public class CsController {
	
	
	@Autowired
	FaqMapper faq_mapper;
	
	@RequestMapping(value ="/customerservice", method = RequestMethod.GET)
	public String cs_main(Model model) {
		
		String cate_name = "주문 / 결제";
		List<FaqDTO> faq = faq_mapper.get(0);
		
		model.addAttribute("faq", faq);
		model.addAttribute("cate_name", cate_name);
		return "user/cs/category/faq_category";
	}
	
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
		}
		
		model.addAttribute("faq", faq);
		model.addAttribute("cate_name", cate_name);
		return "user/cs/category/faq_category";
	}
	
	@RequestMapping(value ="/customerservice/con", method = RequestMethod.GET)
	public String cs_contatct() {
		
		return "user/cs/contact/contact";
	}
	
	@RequestMapping(value ="/mp/contact", method = RequestMethod.GET)
	public String contact_mp_list() {
		
		return "user/mypage/contact/mp_contact_list";
	}
	
	@RequestMapping(value ="/mp/contact/01", method = RequestMethod.GET)
	public String contact_mp() {
		
		return "user/mypage/contact/mp_contact";
	}
	
}
