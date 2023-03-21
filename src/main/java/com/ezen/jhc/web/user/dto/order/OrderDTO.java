package com.ezen.jhc.web.user.dto.order;

import java.text.SimpleDateFormat;
import java.util.Date;


import org.springframework.stereotype.Component;


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
	
	//order_statuses
	String status_name;
	
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

}
