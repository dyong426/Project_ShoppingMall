package com.ezen.jhc.web.admin.dto.prod;

import lombok.Data;
import lombok.NoArgsConstructor;

@NoArgsConstructor
@Data
public class ProdDTO {
	
	Integer m_ctgr_num;
	String m_ctgr_name;
	Integer s_ctgr_num;
	String s_ctgr_name;
	Integer p_num;
	String p_name;
	Integer p_price;
	String p_info_img_path;
}
