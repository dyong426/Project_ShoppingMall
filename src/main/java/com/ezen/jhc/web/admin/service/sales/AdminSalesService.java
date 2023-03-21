package com.ezen.jhc.web.admin.service.sales;

import java.util.List;

import org.springframework.stereotype.Service;

import com.ezen.jhc.web.admin.dto.prod.MainCtgrDTO;
import com.ezen.jhc.web.admin.dto.prod.SubCtgrDTO;
import com.ezen.jhc.web.admin.dto.sales.DailySalesDTO;
import com.ezen.jhc.web.admin.dto.sales.PeriodSalesDTO;
import com.ezen.jhc.web.admin.dto.sales.WeeklySalesDTO;

@Service
public interface AdminSalesService {
	
	public List<MainCtgrDTO> getMainCtgrList();

	public List<SubCtgrDTO> getSubCtgrsList();
	
	public List<DailySalesDTO> getDailySales();
	
	public String getDailySalesJson();
	
	public List<WeeklySalesDTO> getWeeklySalesMainCtgrList();
	
	public List<WeeklySalesDTO> getWeeklySalesSubCtgrList();
	
	public String getWeeklySalesJson();
	
	public List<PeriodSalesDTO> getPeriodSalesList(String startDate, String endDate);
	
	public String getPeriodSalesJson(String startDate, String endDate);
}
