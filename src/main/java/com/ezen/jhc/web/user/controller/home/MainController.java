package com.ezen.jhc.web.user.controller.home;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class MainController {

	@RequestMapping(value ="/main", method = RequestMethod.GET)
	public String main() {
		
		return "user/home/main";
	}
	
	@RequestMapping(value ="/productDetail", method = RequestMethod.GET)
	public String productDetail() {
		return "user/prod/productDetailed";
	}
}
