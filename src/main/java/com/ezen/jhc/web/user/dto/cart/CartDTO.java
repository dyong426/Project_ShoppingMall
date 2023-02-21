package com.ezen.jhc.web.user.dto.cart;

import com.ezen.jhc.web.user.dto.cstm.MemberCstmDTO;
import com.ezen.jhc.web.user.dto.member.MemberDTO;
import com.ezen.jhc.web.user.dto.prod.ProdDetailDTO;

import lombok.Data;
import lombok.NoArgsConstructor;

@NoArgsConstructor
@Data
public class CartDTO {
	
	Integer cart_num;
	Integer	mem_num;
	ProdDetailDTO prodDetailDTO;
	MemberCstmDTO memberCstmDTO;
	Integer cart_quantity;
	Integer cart_amount;
	
}
