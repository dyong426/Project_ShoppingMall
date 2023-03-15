package com.ezen.jhc.web.user.controller.mypage;

import java.util.List;

import javax.servlet.http.HttpSession;
import javax.sql.DataSource;

import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.ezen.jhc.web.user.dto.order.OrderDetailDTO;
import com.ezen.jhc.web.user.dto.review.ReviewDTO;
import com.ezen.jhc.web.user.mapper.mypage.MyPageMapper;
import com.ezen.jhc.web.user.service.mypage.WriteReviewService;


/**@author 김주희
 * @author SUJEONG
 * 
 * **/
@Controller
public class MypageController {
	
	@Autowired
	DataSource ds;
	
	@Autowired
	MyPageMapper mm_mapper;
	
	@Autowired
	WriteReviewService wr_service;
	
	
	
	@RequestMapping(value = "/info", method = RequestMethod.GET)
	public String mpInfo() {

		return "user/mypage/personal_information/my_info";
	}
	
	@RequestMapping(value ="/writeable_reviews", method = RequestMethod.GET)
	public String mpWriteReviewCheck(Integer mem_num, String ord_status, Model model) {
		
	List<OrderDetailDTO> rv_dto = mm_mapper.buyProds(mem_num, ord_status);
	model.addAttribute("rv_list", rv_dto);
		
		return "user/mypage/myreview/writeable_reviews";
	}
	
	@RequestMapping(value ="/writing_review", method = RequestMethod.GET)
	public String mpWriteReview(@RequestParam("p_num")Integer p_num, @RequestParam("pc_num")Integer pc_num, @RequestParam("ps_num")Integer ps_num, Model model) {
		
		List<OrderDetailDTO> od_dto = mm_mapper.getAll(p_num, pc_num, ps_num);
		model.addAttribute("review_pd", od_dto);
		System.out.println("내가 원하는 정보 : " + od_dto);
		
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

	@RequestMapping(value = "/history", method = RequestMethod.GET)
	public String mpHistory() {

		return "user/mypage/purchase/history";
	}

	@RequestMapping(value = "/details", method = RequestMethod.GET)
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
