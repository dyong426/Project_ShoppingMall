package com.ezen.jhc.web.user.controller.cs;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class MainController_sc {

	@RequestMapping(value ="/cs", method = RequestMethod.GET)
	public String main() {
		
		return "user/cs/category/01_order_pay";
	}
	@RequestMapping(value ="/cs/order_pay", method = RequestMethod.GET)
	public String cate1() {
		
		return "user/cs/category/01_order_pay";
	}
	@RequestMapping(value ="/cs/shipping", method = RequestMethod.GET)
	public String cate2() {
		
		return "user/cs/category/02_shipping";
	}
	@RequestMapping(value ="/cs/cancel_refund", method = RequestMethod.GET)
	public String cate3() {
		
		return "user/cs/category/03_cancel_refund";
	}
	@RequestMapping(value ="/cs/return_exchange", method = RequestMethod.GET)
	public String cate4() {
		
		return "user/cs/category/04_return_exchange";
	}
	@RequestMapping(value ="/cs/etc", method = RequestMethod.GET)
	public String cate5() {
		
		return "user/cs/category/05_etc";
	}
	
	@RequestMapping(value ="/cs/contact", method = RequestMethod.GET)
	public String oneOnOne() {
		
		return "user/cs/contact/contact";
	}
	@RequestMapping(value ="/contact", method = RequestMethod.GET)
	public String contact_mp() {
		
		return "user/mypage/contact/mp_contact";
	}
	
}
