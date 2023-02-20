package com.ezen.jhc.web.user.dto.order;

import com.ezen.jhc.web.user.dto.cstm.MemberCstmDTO;
import com.ezen.jhc.web.user.dto.prod.ProdDetailDTO;

import lombok.Data;
import lombok.NoArgsConstructor;

@NoArgsConstructor
@Data
public class OrderDetailDTO {

	Integer od_num;
	Integer ord_num;
	ProdDetailDTO prodDetailDTO;
	MemberCstmDTO memberCstmDTO;
	Integer od_quantity;
	Integer od_amount;
	
}
