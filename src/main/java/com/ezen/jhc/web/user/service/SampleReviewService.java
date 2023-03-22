package com.ezen.jhc.web.user.service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ezen.jhc.web.user.dto.review.ReviewDTO;
import com.ezen.jhc.web.user.mapper.review.ReviewMapper;

@Service
public class SampleReviewService {
	
	@Autowired
	ReviewMapper rev_mapper;
	
	public ReviewDTO reviewList(Integer p_num,  HttpServletRequest req, HttpServletResponse resp) {
		
		ReviewDTO reviewDTO = rev_mapper.getProdNum(p_num);
		
		return reviewDTO;
		
	}
}
