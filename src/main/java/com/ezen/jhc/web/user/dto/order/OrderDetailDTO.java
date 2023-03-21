package com.ezen.jhc.web.user.dto.order;

import java.text.SimpleDateFormat;
import java.util.Date;

import com.ezen.jhc.web.user.dto.cstm.MemberCstmDTO;
import com.ezen.jhc.web.user.dto.prod.ProdDetailDTO;

import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.NonNull;

@NoArgsConstructor
@Data
public class OrderDetailDTO {

	// 테이블 : order_details
	Integer od_num;
	Integer ord_num;
	Integer od_quantity;
	Integer od_amount;

	//테이블 : prod_details
	Integer pd_num;
		
	//테이블 조인 : prods
	Integer	p_num;
	String	p_name;
	Integer	p_price;
	String	p_material;
	Integer	s_ctgr_num;
	//테이블 조인 : prod_colors
	Integer	pc_num;
	String	pc_name;
	String	pc_code;
	//테이블 조인 : prod_sizes
	Integer	ps_num;
	String	ps_name;
	//테이블 조인 : prod_images
	Integer	pi_num;
	String	origin_img_path;
	String	thumb_img_path;
	String	lg_img_path;
	String	md_img_path;
	String	sm_img_path;
	
	// 테이블 조인 : member_cstm
	Integer	mem_cstm_num;
	String	mem_cstm_path;

	// 테이블 조인 : members
	Integer mem_num;
	
	// 테이블 조인 : oders
	Date ord_date;
	Integer order_num;
	
	// 테이블 조인 : reviews
	Integer review_num;
	String review_content;
	String review_image_path;
	Date review_regdate;
	Integer review_star;
	
	String new_order_num;
	String new_order_date;
	String rv_write_date;
	String star;
	
	public String getNew_order_date() {
		SimpleDateFormat dayTime = new SimpleDateFormat("yyyy-MM-dd");
		
		String formatTime = dayTime.format(this.review_regdate);
		
		return formatTime;
	}
	
	public String getRv_write_date() {
		SimpleDateFormat dayTime = new SimpleDateFormat("yyyy-MM-dd");
		
		String formatTime = dayTime.format(this.ord_date);
		
		return formatTime;
	}
	
	public String getNew_order_num() {
		SimpleDateFormat dayTime = new SimpleDateFormat("yyMMdd-mmss");
		
		return dayTime.format(this.ord_date) + getOrd_num();
	}
	
	
	public String getStar() {
		if (review_star == 0) {
			return "☆☆☆☆☆";
		} else if (review_star == 1) {
			return "★☆☆☆☆";
		} else if (review_star == 2) {
			return "★★☆☆☆";
		} else if (review_star == 3) {
			return "★★★☆☆";
		} else if (review_star == 4) {
			return "★★★★☆";
		} else if (review_star == 5) {
			return "★★★★★";
		}
	
		return "";
	}
	
	


	//order_Statuses
	String status_name;

}
