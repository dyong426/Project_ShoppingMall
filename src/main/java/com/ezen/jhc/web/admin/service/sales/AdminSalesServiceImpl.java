package com.ezen.jhc.web.admin.service.sales;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ezen.jhc.web.admin.dto.prod.MainCtgrDTO;
import com.ezen.jhc.web.admin.dto.prod.SubCtgrDTO;
import com.ezen.jhc.web.admin.dto.sales.DailySalesDTO;
import com.ezen.jhc.web.admin.mapper.prod.CtgrMapper;
import com.ezen.jhc.web.admin.mapper.sales.SalesMapper;

@Service
public class AdminSalesServiceImpl implements AdminSalesService{

	@Autowired
	CtgrMapper ctgrMapper;
	
	@Autowired
	SalesMapper salesMapper;
	
	@Override
	public List<MainCtgrDTO> getMainCtgrList() {
		
		
		return ctgrMapper.getMainCtgr();
	}
	
	@Override
	public List<SubCtgrDTO> getSubCtgrsList() {
		return ctgrMapper.getSubCtgrs();
	}

	@Override
	public List<DailySalesDTO> getDailySales() {
		
		return salesMapper.getDailySales();
	}
	
}
