package com.ezen.jhc.web.user.mapper.mypage;







import java.sql.Date;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;

import com.ezen.jhc.web.user.dto.order.OrderDTO;
import com.ezen.jhc.web.user.dto.order.OrderDetailDTO;
import com.ezen.jhc.web.user.dto.review.ReviewDTO;

// 김주희 - 마이페이지 Mapper
public interface MypageMapper {
	
	// 구매 상품 정보 불러오기
//	@Select("select m.mem_num, od.ord_date, od.ord_num, pi.origin_img_path, p.p_name, pc.pc_name"
//			+ "from orders od, prods p, prod_colors pc, prod_images pi, members m"
//			+ "where m.mem_num = 5 and ord_num = 46 and pc.pc_num = 42 and TO_CHAR(ord_date, 'yy/MM/dd') = '23/01/05'"
//			+ "and p.p_num = pi.p_num and p.p_num = pc.p_num and pi.p_num = pc.p_num and od.mem_num = m.mem_num order by ord_num desc")
//	List<OrderDetailDTO> buyProds(OrderDetailDTO odd);
//	@Param("mem_num")Integer mem_num, @Param("ord_num")Integer ord_num, @Param("pc_num")Integer pc_num, @Param("ord_date")Date ord_date
	
	
	// 주문 상품 정보 불러오기(리뷰 작성 페이지용)
	@Select("select p.p_name, pc.pc_name, pi.origin_img_path origin_img_path, ps.ps_name from prods p, prod_sizes ps, prod_colors pc, prod_images pi"
			+ "	where p.p_num = 7 and pc.pc_num = 42 and ps.ps_num = 41 and p.p_num = pi.p_num")
	List<OrderDetailDTO> getAll(@Param("p_num")Integer p_num, @Param("pc_num")Integer pc_num, @Param("ps_num")Integer ps_num);
	
//	 //첨부파일 이미지 
//	@Select("")
//	
	// 작성한 리뷰 추가하기
	@Insert("INSERT INTO reivews VALUES(review_num_seq.NEXTVAL, "
			+ "#{p_num},#{mem_num},#{review_content},#{review_image_path},#{review_star},sysdate)")
	Integer add(ReviewDTO review);
	
	

}
