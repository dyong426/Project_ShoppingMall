package com.ezen.jhc.web.user.mapper.mypage;



import java.util.List;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;

import com.ezen.jhc.web.user.dto.order.OrderDTO;
import com.ezen.jhc.web.user.dto.order.OrderDetailDTO;
import com.ezen.jhc.web.user.dto.review.ReviewDTO;

// 김주11희 - 마이페이지 Mapper
// 정수정
public interface MyPageMapper {
	
	// 배송 완료 상품 정보 쿼리문(리뷰 작성 가능 페이지)
	@Select(" select m.mem_num, m.mem_name, ord.ord_date, od.ord_num, p.p_name, pi.origin_img_path, pd.p_num, pc.pc_name, pc.pc_num, ps.ps_num "
			+ "from members m, orders ord, order_details od, prod_details pd, prods p, prod_images pi, prod_colors pc, prod_sizes ps, reviews r "
			+ "where m.mem_num = #{mem_num} and ord_status = 4 and ord.mem_num = m.mem_num and ord.ord_num = od.ord_num and p.p_num = r.p_num and ord.mem_num != r.mem_num "
			+ "and pd.pd_num = od.pd_num and pd.p_num = p.p_num and pi.p_num = p.p_num and pd.pd_num = od.pd_num and pc.pc_num = pd.pc_num and ps.ps_num = pd.ps_num and ps.p_num = p.p_num "
			+ " order by ord_date desc")
	List <OrderDetailDTO> buyProds(@Param("mem_num")Integer mem_num);
	
	
	
	
	// 주문 상품 정보 쿼리문(리뷰 작성용)
	@Select("select p.p_name, pc.pc_name, pi.origin_img_path AS origin_img_path, ps.ps_name "
			+ "from prods p, prod_sizes ps, prod_colors pc, prod_details pd, prod_images pi "
			+ "where p.p_num = ${p_num} and pc.pc_num = ${pc_num} and ps.ps_num = ${ps_num} and p.p_num = pi.p_num")
	List <OrderDetailDTO> getAll(@Param("p_num")Integer p_num, @Param("pc_num")Integer pc_num, @Param("ps_num")Integer ps_num);
	
	
	// 작성한 리뷰 추가 쿼리문
	@Insert("INSERT INTO reivews VALUES(review_num_seq.NEXTVAL, "
			+ "#{p_num},#{mem_num},#{review_content},#{review_image_path},#{review_star},sysdate)")
	Integer addReview(@Param("p_num")Integer p_num, @Param("mem_num")Integer mem_num, @Param("review_content")String review_content, 
			@Param("review_image_path")String review_image_path, @Param("review_star")Integer review_star);
	
	// 작성한 리뷰 이미지 추가 쿼리문
	@Insert("INSERT INTO reivews VALUES(review_num_seq.NEXTVAL, "
			+ "#{p_num},#{mem_num},#{review_content},#{review_image_path},#{review_star},sysdate)")
	Integer addReviewImage(ReviewDTO review);
	
	
	// 내가 쓴 리뷰 내역 쿼리문
	@Select (" select ord.ord_date, ord.ord_num, r.review_regdate, r.review_content, r.review_star, r.review_image_path "
			+ "from members m, orders ord, order_details od, prod_details pd, prods p, prod_images pi, prod_colors pc, reviews r "
			+ "where m.mem_num = #{mem_num} and ord.ord_status = 4 and ord.mem_num = m.mem_num and ord.ord_num = od.ord_num and p.p_num = r.p_num and ord.mem_num = r.mem_num "
			+ "and pd.pd_num = od.pd_num and pd.p_num = p.p_num and pi.p_num = p.p_num and pd.pd_num = od.pd_num and pc.pc_num = pd.pc_num"
			+ " order by ord_date desc")
	List <OrderDetailDTO> getOrderHistory(@Param("mem_num")Integer mem_num);

}
