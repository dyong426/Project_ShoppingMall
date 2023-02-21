package com.ezen.jhc.web.user.dto.prod;

import lombok.Data;
import lombok.NoArgsConstructor;

@NoArgsConstructor
@Data
public class ProdSizeInfoDTO {
	
	/**
	 * list_name : 측정 목록
	 * list_item : 측정 수치
	 */
	Integer psi_num;
	String  psi_list_name;
	Integer p_num;

}
