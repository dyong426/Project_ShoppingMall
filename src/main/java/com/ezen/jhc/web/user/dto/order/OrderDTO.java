package com.ezen.jhc.web.user.dto.order;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Random;

import org.springframework.stereotype.Component;

import com.ezen.jhc.common.util.OrderNumGenerator;

import lombok.Data;
import lombok.NoArgsConstructor;

@Component
@NoArgsConstructor
@Data
public class OrderDTO {
	
	// 테이블 : orders
	Integer	ord_num;
	
	// 테이블 조인 : member_addresses
	Integer	mem_zipcode;
	String	mem_addr1;
	String	mem_addr2;
	Character addr_save;
	Date	ord_date;
	Integer	ord_zipcode;
	String	ord_addr1;
	String	ord_addr2;
	String	receiver_name;
	String	receiver_phone;
	Integer	total_amount;
	String	ord_status;
	String	ord_request;
	
	// 테이블 조인 : payments
	Integer	payment_num;
	String	payment_name;

	//prods
	Integer p_num;
	String p_name;
	//prod_images
	String origin_img_path;
	//order_details
	Integer od_quantity;
	Integer od_amount;
	
	//자바에서 생성
	String new_ord_date;
	String new_order_num;
	String od_ord_date;
	
	public String getNew_ord_date() {
		SimpleDateFormat dayTime= new SimpleDateFormat("yyyy-MM-dd");
		
		String formatTime = dayTime.format(this.ord_date);
		
		return formatTime;
	}
	
	public String getNew_order_num() {

		
		SimpleDateFormat dayTime= new SimpleDateFormat("yyMMdd-mmss");
				
		
		return dayTime.format(this.ord_date) + getOrd_num();

	}

	public String getOd_ord_date() {
		SimpleDateFormat dayTime= new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		
		return dayTime.format(this.ord_date);
		
	}
	
	public String getOrd_statusKor() {
		Integer status = Integer.parseInt(ord_status);
	
		String orderStatus = "";

		if (status == 0) {
			orderStatus = "입금 전";
		}

		if (status == 1) {
			orderStatus = "배송 준비 중";
		}

		if (status == 2) {
			orderStatus = "배송 중";
		}

		if (status == 3) {
			orderStatus = "배송 완료";
		}

		if (status == 4) {
			orderStatus = "주문 취소";
		}
		
		if (status == 5) {
			orderStatus = "교환";
		}

		if (status == 6) {
			orderStatus = "반품";
		}

		return orderStatus;

	}
}
