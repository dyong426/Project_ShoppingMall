package com.ezen.jhc.web.user.dto.cart;

import com.ezen.jhc.web.user.dto.cstm.MemberCstmDTO;
import com.ezen.jhc.web.user.dto.member.MemberDTO;
import com.ezen.jhc.web.user.dto.prod.ProdDetailDTO;

import lombok.Data;
import lombok.NoArgsConstructor;

@NoArgsConstructor
@Data
public class CartDTO {
	
	// 테이블 조인 : carts, member_cstm
	Integer cart_num;
	Integer	mem_num;
	
	// 테이블 조인 : prod_details, prods, prod_colors, prod_sizes
	Integer pd_num;
	
	Integer	p_num;
	String	p_name;
	Integer	p_price;
	
	String	pc_name;
	String	pc_code;

	String	ps_name;
	
	// 테이블 조인 : member_cstm
	String	mem_cstm_path;
	
	Integer cart_quantity;
	Integer cart_amount;
	
}
