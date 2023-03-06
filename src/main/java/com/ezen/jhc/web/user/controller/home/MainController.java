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
		
		return "user/home/all_review";
	}
}
