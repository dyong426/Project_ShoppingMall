package com.ezen.jhc.web.admin.dto.sales;

import java.text.SimpleDateFormat;
import java.util.Date;

import lombok.Data;

@Data
public class PeriodSalesDTO {
	
	private Date ord_date;
	private Integer count;
	private Integer total_amount;
	
	public String getOrd_date() {
		
		SimpleDateFormat dayTime = new SimpleDateFormat("yyyy-MM-dd");
		
		String formatTime = dayTime.format(this.ord_date);
		
		return formatTime;
	}
}
