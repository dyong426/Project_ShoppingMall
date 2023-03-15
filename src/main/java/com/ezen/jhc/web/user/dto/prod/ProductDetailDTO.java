package com.ezen.jhc.web.user.dto.prod;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NonNull;
import lombok.RequiredArgsConstructor;

@AllArgsConstructor
@RequiredArgsConstructor
@Data
public class ProductDetailDTO {

	// 테이블 : prod_details
	@NonNull
	Integer pd_num;

	// 테이블 조인 : prods
	@NonNull
	Integer p_num;
	String p_name;
	Integer p_price;
	// 테이블 조인 : prod_colors
	@NonNull
	Integer pc_num;
	@NonNull
	String pc_name;
	@NonNull
	String pc_code;
	// 테이블 조인 : prod_sizes
	@NonNull
	Integer ps_num;
	@NonNull
	String ps_name;

	@NonNull
	Integer pd_stock;
}
