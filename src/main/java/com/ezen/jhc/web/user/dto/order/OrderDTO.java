package com.ezen.jhc.web.user.dto.order;

import java.util.Date;

import com.ezen.jhc.web.user.dto.member.MemberAddressesDTO;

import lombok.Data;
import lombok.NoArgsConstructor;

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
	
	
}
