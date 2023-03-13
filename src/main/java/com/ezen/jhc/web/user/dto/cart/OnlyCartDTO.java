package com.ezen.jhc.web.user.dto.cart;

import lombok.Data;
import lombok.NonNull;
import lombok.RequiredArgsConstructor;

@RequiredArgsConstructor
@Data
public class OnlyCartDTO {

	Integer cart_num;
	@NonNull
	Integer mem_num;
	Integer pd_num;
	Integer mem_cstm_num;
	@NonNull
	Integer cart_quantity_num;
	@NonNull
	Integer cart_amount_num;
}
