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
import org.springframework.web.bind.annotation.PostMapping;
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
	

	
	@RequestMapping(value ="/writeable_reviews", method = RequestMethod.GET)
	public String mpWriteReviewCheck(Integer mem_num, Model model, Integer page) {
		
	List<OrderDetailDTO> pd_info = mm_mapper.buyProds(mem_num);
	
	
	int list_end = Integer.parseInt(page + "") * 10 - 1;
	
	int list_begin = list_end - 9;

	model.addAttribute("end", list_end);
	
	if (list_end >= pd_info.size()) {
		 list_end = pd_info.size() - 1;
	}

	model.addAttribute("pd_info", pd_info);
	model.addAttribute("pd_count", pd_info.size());
	
	model.addAttribute("start", list_begin);
		
		return "user/mypage/myreview/writeable_reviews";
	}
	
	
	
	@RequestMapping(value ="/writing_review", method = RequestMethod.GET)
	public String mpWriteReview(
			@RequestParam("p_num")Integer p_num, @RequestParam("pc_num")Integer pc_num, @RequestParam("ps_num")Integer ps_num, Model model) {
		
		List<OrderDetailDTO> od_dto = mm_mapper.getAll(p_num, pc_num, ps_num);
		model.addAttribute("review_pd", od_dto);
		
		return "user/mypage/myreview/writing_review";
	}
	
	
	
	@RequestMapping(value ="/writing_review", method = RequestMethod.POST)
	public String mpWriting(
			@RequestParam("p_num")Integer p_num, @RequestParam("mem_num")Integer mem_num, @RequestParam("review_content")String review_content, 
			@RequestParam("review_image_path")String review_image_path, @RequestParam("review_star")Integer review_star,Model model, Integer page) {
		
		Integer add_review = mm_mapper.addReview(p_num, mem_num, review_content, review_image_path, review_star);
		model.addAttribute("add_review", add_review);
		
		return "redirect:/wrote_review";
	}
	
	
	
	@RequestMapping(value ="/wrote_review", method = RequestMethod.GET)
	public String mpWriteReview2(Integer mem_num, Model model, Integer page) {
		
		List<OrderDetailDTO> rv_history = mm_mapper.getOrderHistory(mem_num);
		int list_end = Integer.parseInt(page + "") * 10 - 1;
		
		int list_begin = list_end - 9;

		model.addAttribute("end", list_end);
		
		if (list_end >= rv_history.size()) {
			 list_end = rv_history.size() - 1;
		}

		model.addAttribute("rh_count", rv_history.size());
		
		model.addAttribute("start", list_begin);
		model.addAttribute("rv_history", rv_history);

		return "user/mypage/myreview/wrote_review";
	}
	
	

	
	
	
	@RequestMapping(value ="/er", method = RequestMethod.GET)
	public String orderER() {
		
		return "user/mypage/purchase/exchange_refund";
	}
	
	
	
	
	@RequestMapping(value ="/cancel", method = RequestMethod.GET)
	public String orderCancel() {
		
		return "user/mypage/purchase/cancel";
	}

	
	
//	@RequestMapping(value = "/info", method = RequestMethod.GET)
//	public String mpInfo() {
//
//		return "user/mypage/personal_information/my_info";
//	}
	
//	@RequestMapping(value = "/history", method = RequestMethod.GET)
//	public String mpHistory() {
//
//		return "user/mypage/purchase/history";
//	}
//
//	@RequestMapping(value = "/details", method = RequestMethod.GET)
//	public String mpDetails() {
//
//		return "user/mypage/purchase/details";
//	}
	
	

}
