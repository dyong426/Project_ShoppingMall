package com.ezen.jhc.web.admin.dto.order;
import java.text.SimpleDateFormat;
import java.util.Date;

import com.ezen.jhc.web.user.dto.member.MemberAddressesDTO;

import lombok.Data;
import lombok.NoArgsConstructor;

@NoArgsConstructor
@Data
public class OrderDTO {
	
	// 테이블 : orders
	Integer	ord_num;
	Integer mem_num;
	String mem_email;
	
	Date	ord_date;
	
	Integer ord_zipcode;
	String ord_addr1;
	String ord_addr2;
	
	String receiver_name;
	String receiver_phone;
	
	String ord_request;
	Integer payment_num;
	
	
	Integer ord_status;
	String	status_name;
	Integer	total_amount;
	
	public String getOrd_date() {
		
		SimpleDateFormat dayTime = new SimpleDateFormat("yyyy-MM-dd");
		
		String formatTime = dayTime.format(this.ord_date);
		
		return formatTime;
	}
}
