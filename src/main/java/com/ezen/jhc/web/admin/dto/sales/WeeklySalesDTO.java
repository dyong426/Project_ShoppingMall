package com.ezen.jhc.web.admin.dto.sales;

import lombok.Data;

@Data
public class WeeklySalesDTO {
	
	Integer mon;
	Integer tues;
	Integer wednes;
	Integer thurs;
	Integer fri;
	Integer satur;
	Integer sun;
	Integer total;
	Integer m_ctgr_num;
	String ctgr_name;
}
