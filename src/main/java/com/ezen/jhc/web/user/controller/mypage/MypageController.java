package com.ezen.jhc.web.user.controller.mypage;



import javax.sql.DataSource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.ezen.jhc.web.user.dto.order.OrderDetailDTO;
import com.ezen.jhc.web.user.mapper.mypage.MypageMapper;




@Controller
public class MypageController {
	
	@Autowired
	DataSource ds;
	
	@Autowired
	MypageMapper mm_mapper;

	@RequestMapping(value ="/info", method = RequestMethod.GET)
	public String mpInfo() {
		
		return "user/mypage/personal_information/my_info";
	}
	
	@RequestMapping(value ="/writeable_reviews", method = RequestMethod.GET)
	public String mpWriteReviewCheck() {
		
		return "user/mypage/myreview/writeable_reviews";
	}
	
	@RequestMapping(value ="/watching_review", method = RequestMethod.GET)
	public String mpWatchReview() {
		
		return "user/mypage/myreview/wrote_review";
	}
	
	@RequestMapping(value ="/writing_review", method = RequestMethod.GET)
	public String mpWriteReview(Model model) {
		
		OrderDetailDTO od_dto = mm_mapper.getAll(7, 42, 41);
		model.addAttribute("review_pd", od_dto);
		
		
		return "user/mypage/myreview/writing_review";
	}
	
	@RequestMapping(value ="/history", method = RequestMethod.GET)
	public String mpHistory() {
		
		return "user/mypage/purchase/history";
	}
	
	@RequestMapping(value ="/details", method = RequestMethod.GET)
	public String mpDetails() {
		
		return "user/mypage/purchase/details";
	}
	
	@RequestMapping(value ="/er", method = RequestMethod.GET)
	public String orderER() {
		
		return "user/mypage/purchase/exchange_refund";
	}
	
	@RequestMapping(value ="/cancel", method = RequestMethod.GET)
	public String orderCancel() {
		
		return "user/mypage/purchase/cancel";
	}
	
	@GetMapping("/password/change")
	public String showPasswordChangeForm() {
		return "user/mypage/personal_information/passwordChangeForm";
	}

	
	
	
}
