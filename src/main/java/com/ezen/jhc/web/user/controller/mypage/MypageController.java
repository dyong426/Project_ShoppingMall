package com.ezen.jhc.web.user.controller.mypage;





import java.sql.Date;
import java.util.List;

import javax.servlet.http.HttpSession;
import javax.sql.DataSource;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.ezen.jhc.web.user.dto.member.MemberDTO;
import com.ezen.jhc.web.user.dto.order.OrderDetailDTO;
import com.ezen.jhc.web.user.dto.review.ReviewDTO;
import com.ezen.jhc.web.user.mapper.mypage.MypageMapper;
import com.ezen.jhc.web.user.service.mypage.WriteReviewService;

import lombok.extern.log4j.Log4j;




@Controller
public class MypageController {
	
	@Autowired
	DataSource ds;
	
	@Autowired
	MypageMapper mm_mapper;
	
	@Autowired
	WriteReviewService wr_service;

	@RequestMapping(value ="/info", method = RequestMethod.GET)
	public String mpInfo() {
		
		return "user/mypage/personal_information/my_info";
	}
	
	@RequestMapping(value ="/writeable_reviews", method = RequestMethod.GET)
	public String mpWriteReviewCheck(Model model) {
		
//		
//		Date today = Date.valueOf("23/01/05");
//		
//		List<OrderDetailDTO> odeail_dto = mm_mapper.buyProds(5, 46, 42, );
//		model.addAttribute("review_ch", odeail_dto);
		
		return "user/mypage/myreview/writeable_reviews";
	}
	

	
	@RequestMapping(value ="/writing_review", method = RequestMethod.GET)
	public String mpWriteReview(Model model) {
		
		List<OrderDetailDTO> od_dto = mm_mapper.getAll(7, 42, 41);
		model.addAttribute("review_pd", od_dto);
		
		
		return "user/mypage/myreview/writing_review";
	}
	
	@RequestMapping(value ="/wrote_review", method = RequestMethod.GET)
	public String mpWriteReview2(ReviewDTO rv_dto, HttpSession session) {
		
//		MemberDTO member = (MemberDTO)session.getAttribute("mem_num");
//		rv_dto.setMem_num(member.getMem_num());
//		
//		mm_mapper.add(rv_dto);
		
		
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
	
	@RequestMapping(value ="/er", method = RequestMethod.GET)
	public String orderER() {
		
		return "user/mypage/purchase/exchange_refund";
	}
	
	@RequestMapping(value ="/cancel", method = RequestMethod.GET)
	public String orderCancel() {
		
		return "user/mypage/purchase/cancel";
	}
}
