package com.ezen.jhc.web.admin.dto.prod;

import lombok.Data;
import lombok.NoArgsConstructor;

@NoArgsConstructor
@Data
public class ProdDTO {
	
	private Integer m_ctgr_num;
	private String m_ctgr_name;
	private Integer s_ctgr_num;
	private String s_ctgr_name;
	private Integer p_num;
	private String p_name;
	private Integer p_price;
	private String p_explain_path;
	private String p_info_path;
}
