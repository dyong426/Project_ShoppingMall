package com.ezen.jhc.web.admin.dto.order;

import lombok.Data;

@Data
public class OrderDetailDTO {
	
	// 테이블 : orders
		Integer	ord_num;
		
		// order_details
		Integer od_num;
		
		// prod_details
		Integer pd_num;
			// prods
		Integer p_num;
		String p_name;
		
			// prod_colors
		Integer pc_num;
		String pc_name;
		
		
			// prod_sizes
		Integer ps_num;
		String ps_name;
		
		
		Integer pd_stock;
		
		// member_cstms
		Integer mem_cstm_num;
		String mem_cstm_path;
		
		Integer od_quantity;
		Integer od_amount;

}
