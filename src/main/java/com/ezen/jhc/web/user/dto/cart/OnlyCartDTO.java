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
	@NonNull
	Integer pd_num;
	@NonNull
	Integer mem_cstm_num;
	Integer cart_quantity;
	@NonNull
	Integer cart_amount;
}
