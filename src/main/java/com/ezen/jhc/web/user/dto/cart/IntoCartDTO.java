package com.ezen.jhc.web.user.dto.cart;

import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.NonNull;
import lombok.RequiredArgsConstructor;

@RequiredArgsConstructor
@NoArgsConstructor
@Data
public class IntoCartDTO {

	Integer cart_num;
	Integer mem_num;
	Integer mem_cstm_num;
	@NonNull
	Integer p_num;
	@NonNull
	Integer p_price;
	@NonNull
	String pc_name;
	@NonNull
	String ps_name;
	@NonNull
	String p_name;
}
