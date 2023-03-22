package com.ezen.jhc.web.user.dto.prod;

import lombok.Data;
import lombok.NoArgsConstructor;

@NoArgsConstructor
@Data
public class ProdSizeInfoDetailDTO {
	
	/**
	 * 테이블 조인 :  prod_sizes, prod_size_info, prod_size_info_details
	 */
	
	Integer	psid_num;
	Integer	p_num;
	String	ps_name;
	String	psi_list_name;
	String	psid_list_item; 
}
