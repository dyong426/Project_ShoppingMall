package com.ezen.jhc.web.user.service.mypage;

import java.util.Date;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.bind.annotation.RequestMapping;

import com.ezen.jhc.web.user.dto.review.ReviewDTO;
import com.ezen.jhc.web.user.mapper.mypage.MyPageMapper;

@Service
public class WriteReviewService {
	
	ReviewDTO rv_dto = new ReviewDTO();
	
//	@Override
//	public String service(HttpServletRequest req) {
//		
//		return "redirect::" + req.getContextPath() + "/watching_review";
//	}
	
	
}
