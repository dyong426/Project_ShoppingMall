package com.ezen.jhc.web.admin.dto.sales;

import lombok.Data;

@Data
public class DailySalesDTO {
	
	private Integer s_ctgr_num;
	private String s_ctgr_name;
	private Integer m_ctgr_num;
	private Integer daily_sales;
	private Integer daily_amount;

}
