package com.ezen.jhc.web.user.dto.order;

import lombok.Data;
import lombok.NonNull;
import lombok.RequiredArgsConstructor;

@RequiredArgsConstructor
@Data
public class IntoOrderDTO {

	@NonNull
	Integer p_price;
	@NonNull
	String mem_cstm_path;
	@NonNull
	String pc_name;
	@NonNull
	String ps_name;
	@NonNull
	String p_name;
	Integer od_quantity;
}
