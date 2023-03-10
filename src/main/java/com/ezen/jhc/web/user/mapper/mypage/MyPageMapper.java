package com.ezen.jhc.web.user.mapper.mypage;



import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;

import com.ezen.jhc.web.user.dto.order.OrderDetailDTO;
import com.ezen.jhc.web.user.dto.review.ReviewDTO;

// 김주희 - 마이페이지 Mapper
public interface MyPageMapper {
	
	
	
	// 주문 상품 정보 쿼리문(리뷰 작성용)
	@Select("select p.p_name, pc.pc_name, pi.origin_img_path AS origin_img_path, ps.ps_name from prods p, prod_sizes ps, prod_colors pc, prod_details pd, prod_images pi "
			+ "where p.p_num = #{p_num} and pc.pc_num = #{pc_num} and ps.ps_num = #{ps_num} and p.p_num = pi.p_num")
	OrderDetailDTO getAll(@Param("p_num")Integer p_num, @Param("pc_num")Integer pc_num, @Param("ps_num")Integer ps_num);
	
	
	// 작성한 리뷰 추가 쿼리문
	@Insert("INSERT INTO reivews VALUES(review_num_seq.NEXTVAL, "
			+ "#{p_num},#{mem_num},#{review_content},#{review_image_path},#{review_star},sysdate)")
	Integer add(ReviewDTO review);
	

}
