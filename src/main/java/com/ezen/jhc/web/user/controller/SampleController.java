package com.ezen.jhc.web.user.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.ezen.jhc.web.user.service.SampleReviewService;

@Controller
public class SampleController {
	
	@Autowired
	SampleReviewService service;
	
	@RequestMapping(value = "/review", method=RequestMethod.GET)
	public String reviewList(Model model, Integer p_num,  HttpServletRequest req, HttpServletResponse resp) {
		
		model.addAttribute("reviews", service.reviewList(p_num, req, resp));
		System.out.println(model.getAttribute("reviews"));
		return "user/sampleReview";
	}
}
