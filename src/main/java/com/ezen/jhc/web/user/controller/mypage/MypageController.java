package com.ezen.jhc.web.user.controller.mypage;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class MypageController {

	@RequestMapping(value ="/info", method = RequestMethod.GET)
	public String mpInfo() {
		
		return "user/mypage/personal_information/my_info";
	}
	
	@RequestMapping(value ="/writing_review", method = RequestMethod.GET)
	public String mpWriteReview() {
		
		return "user/mypage/myreview/writeable_reviews";
	}
	
	@RequestMapping(value ="/watching_review", method = RequestMethod.GET)
	public String mpWatchReview() {
		
		return "user/mypage/myreview/wrote_review";
	}
	
	@RequestMapping(value ="/history", method = RequestMethod.GET)
	public String mpHistory() {
		
		return "user/mypage/purchase/history";
	}
	
	@RequestMapping(value ="/details", method = RequestMethod.GET)
	public String mpDetails() {
		
		return "user/mypage/purchase/details";
	}
}
