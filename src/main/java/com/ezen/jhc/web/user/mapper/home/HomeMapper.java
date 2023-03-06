package com.ezen.jhc.web.user.mapper.home;

import java.util.List;

import com.ezen.jhc.web.user.dto.review.ReviewDTO;

public interface HomeMapper {
	

	List<ReviewDTO> get_review_list();
	
	//List<ReviewDTO> get_review(Integer review_num);
	
	//List<ReviewDTO> main_review_list();
}
