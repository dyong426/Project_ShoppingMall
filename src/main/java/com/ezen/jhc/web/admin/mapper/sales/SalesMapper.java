package com.ezen.jhc.web.admin.mapper.sales;

import java.util.List;

import com.ezen.jhc.web.admin.dto.sales.DailySalesDTO;

public interface SalesMapper {
	
	public List<DailySalesDTO> getDailySales();

}
