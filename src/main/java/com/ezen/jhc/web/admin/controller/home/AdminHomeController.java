package com.ezen.jhc.web.admin.controller.home;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@RequestMapping("/admin")
@Controller
public class AdminHomeController {
	
	@RequestMapping(value="/main", method=RequestMethod.GET)
	public String adminHome() {
		
		return "admin/home/admin_home";
	}
	
}
