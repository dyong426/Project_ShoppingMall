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
	
	@RequestMapping(value ="/cs", method = RequestMethod.GET)
	public String main() {
		
		return "user/cs/category/01_order_pay";
	}
	
	@RequestMapping(value ="/cs/order_pay", method = RequestMethod.GET)
	public String cate1(Model model, Integer faq_ctgr) {
		System.out.println(faq_ctgr);
		
		List<FaqDTO> faq = faq_mapper.get(faq_ctgr);
		
//		model.addAttribute("faq", faq);
		System.out.println(faq);
		
		return "user/cs/category/01_order_pay";
	}
	
	@RequestMapping(value ="/cs/shipping", method = RequestMethod.GET)
	public String cate2(Integer faq_ctgr) {
		System.out.println(faq_ctgr);
		
		
		return "user/cs/category/02_shipping";
	}
	
	@RequestMapping(value ="/cs/cancel_refund", method = RequestMethod.GET)
	public String cate3(Integer faq_ctgr) {
		System.out.println(faq_ctgr);
		
		
		return "user/cs/category/03_cancel_refund";
	}
	
	@RequestMapping(value ="/cs/return_exchange", method = RequestMethod.GET)
	public String cate4(Integer faq_ctgr) {
		System.out.println(faq_ctgr);
		
		return "user/cs/category/04_return_exchange";
	}
	
	@RequestMapping(value ="/cs/etc", method = RequestMethod.GET)
	public String cate5(Integer faq_ctgr) {
		System.out.println(faq_ctgr);
		
		return "user/cs/category/05_etc";
	}
	
	@RequestMapping(value ="/cs/contact", method = RequestMethod.GET)
	public String oneOnOne() {
		
		return "user/cs/contact/contact";
	}
	
	@RequestMapping(value ="/contact", method = RequestMethod.GET)
	public String contact_mp_list() {
		
		return "user/mypage/contact/mp_contact_list";
	}
	
	@RequestMapping(value ="/contact/01", method = RequestMethod.GET)
	public String contact_mp() {
		
		return "user/mypage/contact/mp_contact";
	}
	
}
