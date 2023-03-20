package com.ezen.jhc.web.user.dto.cart;

import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.NonNull;
import lombok.RequiredArgsConstructor;

@RequiredArgsConstructor
@NoArgsConstructor
@Data
public class CartDTO {
	
	// 테이블 조인 : carts, member_cstm
	Integer cart_num;
	@NonNull
	Integer	mem_num;
	
	// 테이블 조인 : prod_details, prods, prod_colors, prod_sizes
	@NonNull
	Integer pd_num;
	
	@NonNull
	Integer	p_num;
	@NonNull
	String	p_name;
	@NonNull
	Integer	p_price;
	
	@NonNull
	String	pc_name;
	String	pc_code;

	@NonNull
	String	ps_name;
	
	// 테이블 조인 : member_cstm
	@NonNull
	String	mem_cstm_path;
	
	@NonNull
	Integer cart_quantity;
	@NonNull
	Integer cart_amount;
	
	Integer ord_num;
}
