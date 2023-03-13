package com.ezen.jhc.web.admin.service.sales;

import java.util.List;

import org.springframework.stereotype.Service;

import com.ezen.jhc.web.admin.dto.prod.MainCtgrDTO;
import com.ezen.jhc.web.admin.dto.prod.SubCtgrDTO;

@Service
public interface AdminSalesService {
	
	public List<MainCtgrDTO> getMainCtgrList();

	public List<SubCtgrDTO> getSubCtgrsList();
}
