package com.ezen.jhc.web.admin.dto.sales;

import lombok.Data;
import lombok.NoArgsConstructor;

@NoArgsConstructor
@Data
public class MonthlySalesDTO {
	
	String month;
	Integer sales;
	Integer total_amount;
	
	public Integer getTotal_amount() {
		return this.total_amount/100000;
	}
	
	public String getMonth() {
		
		return this.month + "월";
	}
}
