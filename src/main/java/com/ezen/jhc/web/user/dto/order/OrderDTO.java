package com.ezen.jhc.web.user.dto.order;

import java.util.Date;

import com.ezen.jhc.web.user.dto.member.MemberAddressesDTO;

import lombok.Data;
import lombok.NoArgsConstructor;

@NoArgsConstructor
@Data
public class OrderDTO {
	Integer ord_num;
	MemberAddressesDTO memberAddressesDTO;
	Date ord_date;
	Integer ord_zipcode;
	String ord_addr1;
	String ord_addr2;
	String receiver_name;
	String receiver_phone;
	Integer total_amount;
	String ord_status;
	String ord_request;
	String payment_name;
}
