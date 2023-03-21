package com.ezen.jhc.web.user.controller.home;

import java.util.List;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.ezen.jhc.web.user.dto.review.ReviewDTO;
import com.ezen.jhc.web.user.mapper.home.HomeMapper;


/**@author SUJEONG
 * 로그인 확인, 메인 페이지 연결
 * */
@Controller
public class MainController {
	/**@author JIEUN
	 * 
	 * **/
	@Autowired
	HomeMapper home_mapper;

	// js에서 로그인 상태 확인해 로그인/로그아웃 표시
	@ResponseBody
	@PostMapping(value = "/isLoggedIn")
	public boolean isLoggedIn(@RequestParam boolean loggedIn, HttpServletRequest request, HttpSession session) {
		boolean isLoggedIn = false;


		Cookie[] cookies = request.getCookies();
		for (Cookie c : cookies) {
			if (c.getName().equals("jhcid") && session.getAttribute("member") != null) {
				isLoggedIn = true;
			} else {
				isLoggedIn = false;
			}
		}

		return isLoggedIn;
	}

	@RequestMapping(value = "/main")
	public String main(Model model, HttpServletRequest request, HttpSession session) {

		return "user/home/main";

	}
	
	@RequestMapping(value ="/productDetail", method = RequestMethod.GET)
	public String productDetail() {
		return "user/prod/productDetailed";
	}
	
	//리뷰 조회 페이지
	@RequestMapping(value ="/review", method = RequestMethod.GET)
	public String reivew(Model model, Integer review_num) {
		List<ReviewDTO> review = home_mapper.get_review(review_num);
	
		
		model.addAttribute("review", review);
		System.out.println(review);
		
		return "user/home/review";
	}

	
	// 전체 리뷰 조회 페이지
	/**
	 * list_end / list_begin -> 선택한 페이지에 맞춰서 꺼내올 list num
	 * 
	 * */
	@RequestMapping(value ="/allreview", method = RequestMethod.GET)
	public String all_reivew(Model model, Integer page) {
		List<ReviewDTO> all_reviews = home_mapper.get_all_reviews();
		
		if(page==null) {page=1;}
		
		int list_end = Integer.parseInt(page +"") * 10 - 1;
		int list_begin = list_end - 9;
		
		if(list_end >= all_reviews.size()) {
			list_end = all_reviews.size() - 1;
		}
		
		model.addAttribute("all_reviews",all_reviews);
		model.addAttribute("review_size", all_reviews.size());
		
		model.addAttribute("begin",list_begin);
		model.addAttribute("end",list_end);
		
		return "user/home/all_review";
	}
}
