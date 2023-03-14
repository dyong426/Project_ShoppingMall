package com.ezen.jhc.web.admin.service.sales;

import java.util.List;

import org.springframework.stereotype.Service;

import com.ezen.jhc.web.admin.dto.prod.MainCtgrDTO;
import com.ezen.jhc.web.admin.dto.prod.SubCtgrDTO;
import com.ezen.jhc.web.admin.dto.sales.DailySalesDTO;

@Service
public interface AdminSalesService {
	
	public List<MainCtgrDTO> getMainCtgrList();

	public List<SubCtgrDTO> getSubCtgrsList();
	
	public List<DailySalesDTO> getDailySales();
}
