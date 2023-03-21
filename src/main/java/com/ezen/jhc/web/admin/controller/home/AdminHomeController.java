package com.ezen.jhc.web.admin.controller.home;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@RequestMapping("/admin")
@Controller
public class AdminHomeController {
	
	@RequestMapping("/main")
	public String adminHome() {
		
		return "admin/home/admin_home";
	}
}
