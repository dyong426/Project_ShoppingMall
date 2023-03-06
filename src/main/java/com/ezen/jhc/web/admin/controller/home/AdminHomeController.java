package com.ezen.jhc.web.admin.controller.home;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class AdminHomeController {
	
	@RequestMapping(value ={"/admin", "/admin/home"}, method = RequestMethod.GET)
	public String main() {
		
		return "admin/home/admin_home";
	}

}
