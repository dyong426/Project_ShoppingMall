package com.ezen.jhc.web.admin.dto.order;
import java.util.Date;

import com.ezen.jhc.web.user.dto.member.MemberAddressesDTO;

import lombok.Data;
import lombok.NoArgsConstructor;

@NoArgsConstructor
@Data
public class OrderDTO {
	
	// 테이블 : orders
	Integer	ord_num;
	String mem_id;
	Date	ord_date;
	String	ord_status;
	Integer	total_amount;
}
