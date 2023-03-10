package com.ezen.jhc.web.user.controller.home;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
<<<<<<< HEAD
import org.springframework.web.bind.annotation.PostMapping;
=======
import org.springframework.web.bind.annotation.PathVariable;
>>>>>>> refs/heads/je
import org.springframework.web.bind.annotation.RequestMapping;
<<<<<<< HEAD
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
=======
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import com.ezen.jhc.web.user.dto.review.ReviewDTO;
import com.ezen.jhc.web.user.mapper.home.HomeMapper;
>>>>>>> refs/heads/je

/**@author SUJEONG
 * 로그인 확인, 메인 페이지 연결
 * */
@Controller
public class MainController {
<<<<<<< HEAD

	// js에서 로그인 상태 확인해 로그인/로그아웃 표시
	@ResponseBody
	@PostMapping(value = "/isLoggedIn")
	public boolean isLoggedIn(@RequestParam boolean loggedIn, HttpServletRequest request, HttpSession session) {
		boolean isLoggedIn = false;
=======
	
	@Autowired
	HomeMapper home_mapper;
>>>>>>> refs/heads/je

<<<<<<< HEAD
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


=======
	/*
	  	홈 화면 메인페이지
	  	review_list -> 사진이 첨부된 리뷰 리스트
	  	count -> 리뷰 개수파악
	 */
	@RequestMapping(value ="/main", method = RequestMethod.GET)
	public String main(Model model) {
		
		List<ReviewDTO> review_list = home_mapper.get_review_list();
		List<ReviewDTO> count = home_mapper.get_all_reviews();
		
		model.addAttribute("review_list", review_list);
		model.addAttribute("review_size", count.size());
	
		
>>>>>>> refs/heads/je
		return "user/home/main";
<<<<<<< HEAD
	}
=======
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
	

	
	

>>>>>>> refs/heads/je
}
