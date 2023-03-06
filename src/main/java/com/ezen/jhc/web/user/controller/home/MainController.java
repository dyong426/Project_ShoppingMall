package com.ezen.jhc.web.user.controller.home;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.ezen.jhc.web.user.dto.review.ReviewDTO;
import com.ezen.jhc.web.user.mapper.home.HomeMapper;

@Controller
public class MainController {
	
	@Autowired
	HomeMapper home_mapper;

	/**
	 * 홈 화면 메인페이지
	 * review_list -> 사진이 첨부된 리뷰 리스트
	 * all_reviews -> 리뷰 전체 개수 파악
	 * */
	@RequestMapping(value ="/main", method = RequestMethod.GET)
	public String main(Model model) {
		
		List<ReviewDTO> review_list = home_mapper.get_review_list();
		List<ReviewDTO> all_reviews = home_mapper.get_all_reviews();
		
		model.addAttribute("review_list", review_list);
		model.addAttribute("review_size", all_reviews.size());
	
		
		return "user/home/main";
	}
	
	@RequestMapping(value ="/productDetail", method = RequestMethod.GET)
	public String productDetail() {
		return "user/prod/productDetailed";
	}
	
	@RequestMapping(value ="/review", method = RequestMethod.GET)
	public String reivew(Model model, Integer review_num) {
		List<ReviewDTO> review = home_mapper.get_review(review_num);
	
		
		model.addAttribute("review", review);
		System.out.println(review);
		
		return "user/home/review";
	}

	
	@RequestMapping(value ="/allreview", method = RequestMethod.GET)
	public String all_reivew(Model model) {
		List<ReviewDTO> all_reviews = home_mapper.get_all_reviews();
		
		model.addAttribute("all_reviews",all_reviews);
		model.addAttribute("review_size", all_reviews.size());
		
		System.out.println(all_reviews);
		System.out.println( all_reviews.size());
		
		return "user/home/all_review";
	}
}
