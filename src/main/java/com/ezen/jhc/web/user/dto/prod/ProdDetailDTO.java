package com.ezen.jhc.web.user.dto.prod;

import lombok.Data;
import lombok.NoArgsConstructor;

@NoArgsConstructor
@Data
public class ProdDetailDTO {
	
	//테이블 : prod_details
	Integer pd_num;
	
	//테이블 조인 : prods
	Integer	p_num;
	String	p_name;
	Integer	p_price;
	String	p_material;
	String  p_info_img_path;
	Integer	s_ctgr_num;
	//테이블 조인 : prod_colors
	Integer	pc_num;
	String	pc_name;
	String	pc_code;
	//테이블 조인 : prod_sizes
	Integer	ps_num;
	String	ps_name;
	//테이블 조인 : prod_images
	Integer	pi_num;
	String	pi_main_path;
	String	pi_thumb_path;
	
	Integer pd_stock;
	
}
