package com.ezen.jhc.web.user.controller.home;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class MainController {

	@RequestMapping(value ="/main", method = RequestMethod.GET)
	public String main() {
		
		return "user/home/main";
	}
	
	@RequestMapping(value ="/product_details", method = RequestMethod.GET)
	public String productDetail() {
		return "user/prod/product_details";
	}
	
//	@RequestMapping(value ="/review", method = RequestMethod.GET)
//	public String reivew(Model model) {
//		
//		
//		
//		return "user/home/review";
//	}

	
	@RequestMapping(value ="/allreview", method = RequestMethod.GET)
	public String all_reivew(Model model) {
		
		return "user/home/all_review";
	}
}
