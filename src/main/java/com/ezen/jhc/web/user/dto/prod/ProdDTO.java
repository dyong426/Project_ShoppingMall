package com.ezen.jhc.web.user.dto.prod;


import lombok.Data;
import lombok.NoArgsConstructor;

@NoArgsConstructor
@Data
public class ProdDTO {
	
	Integer	p_num;
	String	p_name;
	Integer	p_price;
	String	p_material;
	String	p_explain_path;
	String	p_info_path;
	Integer	s_ctgr_num;
	String origin_img_path;
	
}
