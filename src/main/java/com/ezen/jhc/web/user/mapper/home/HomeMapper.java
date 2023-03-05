package com.ezen.jhc.web.user.mapper.home;

import java.util.List;

import com.ezen.jhc.web.user.dto.review.ReviewDTO;

public interface HomeMapper {
	

	List<ReviewDTO> get(Integer review_num);
	
}
