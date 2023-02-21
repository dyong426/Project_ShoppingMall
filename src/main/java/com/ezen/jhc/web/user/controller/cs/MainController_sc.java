package com.ezen.jhc.web.user.controller.cs;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class MainController_sc {

	@RequestMapping(value ="/cs", method = RequestMethod.GET)
	public String main() {
		
		return "user/cs/category/01_order_pay";
	}
	
}
