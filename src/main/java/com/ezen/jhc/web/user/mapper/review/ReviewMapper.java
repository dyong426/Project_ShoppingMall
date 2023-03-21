package com.ezen.jhc.web.user.mapper.review;

import java.util.List;

import org.apache.ibatis.annotations.Select;

import com.ezen.jhc.web.user.dto.review.ReviewDTO;

public interface ReviewMapper {

	public ReviewDTO getProdNum(Integer p_num); 
	
	@Select("select * from reviews inner join members using (mem_num) where p_num = #{p_num}")
	public List<ReviewDTO> getReviewAll(int p_num);
	
	@Select("select avg(review_star) from (select * from reviews inner join members using (mem_num) where p_num = #{p_num})")
	public Double getStarAvg(int p_num);
	

}
 