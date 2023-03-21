package com.ezen.jhc.web.admin.service.sales;

import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ezen.jhc.web.admin.dto.prod.MainCtgrDTO;
import com.ezen.jhc.web.admin.dto.prod.SubCtgrDTO;
import com.ezen.jhc.web.admin.dto.sales.DailySalesDTO;
import com.ezen.jhc.web.admin.dto.sales.PeriodSalesDTO;
import com.ezen.jhc.web.admin.dto.sales.WeeklySalesDTO;
import com.ezen.jhc.web.admin.mapper.prod.CtgrMapper;
import com.ezen.jhc.web.admin.mapper.sales.SalesMapper;

import lombok.extern.log4j.Log4j2;

@Log4j2
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
	
	@Override
	public String getDailySalesJson() {
		
		Iterator<DailySalesDTO> it = salesMapper.getDailySales().iterator();
		
		JSONArray arr = new JSONArray();
		while (it.hasNext()) {
			DailySalesDTO dto = it.next();
			
			
			JSONObject jobj = new JSONObject();
			Integer s_ctgr_num = dto.getS_ctgr_num();
			String s_ctgr_name = dto.getS_ctgr_name();
			Integer m_ctgr_num = dto.getM_ctgr_num();
			Integer daily_sales = dto.getDaily_sales();
			Integer daily_amount = dto.getDaily_amount();
			
			jobj.put("s_ctgr_num", s_ctgr_num);
			jobj.put("s_ctgr_name", s_ctgr_name);
			jobj.put("m_ctgr_num", m_ctgr_num);
			jobj.put("daily_sales", daily_sales);
			jobj.put("daily_amount", daily_amount);
			
			arr.add(jobj);
		}
		
		String json = arr.toJSONString();
		
		return json;
	}
	
	@Override
	public List<WeeklySalesDTO> getWeeklySalesMainCtgrList() {
		
		List<WeeklySalesDTO> weeklySalesList = new ArrayList();
		
		for (MainCtgrDTO mCtgrDTO : ctgrMapper.getMainCtgr()) {
			weeklySalesList.add(salesMapper.getWeeklySalesMainCtgr(mCtgrDTO.getM_ctgr_num()));
		}
		
		return weeklySalesList;
	}
	
	@Override
	public List<WeeklySalesDTO> getWeeklySalesSubCtgrList() {
		
		List<WeeklySalesDTO> weeklySalesList = new ArrayList();
		
		for (SubCtgrDTO sCtgrDTO : ctgrMapper.getSubCtgrs()) {
			weeklySalesList.add(salesMapper.getWeeklySalesSubCtgr(sCtgrDTO.getS_ctgr_num(), sCtgrDTO.getM_ctgr_num()));
		}
		
		return weeklySalesList;
	}
	
	@Override
	public String getWeeklySalesJson() {
		
		List<WeeklySalesDTO> weeklySalesList = new ArrayList();
		
		for (MainCtgrDTO mCtgrDTO : ctgrMapper.getMainCtgr()) {
			weeklySalesList.add(salesMapper.getWeeklySalesMainCtgr(mCtgrDTO.getM_ctgr_num()));
		}
		
		Iterator<WeeklySalesDTO> it = weeklySalesList.iterator();
		
		JSONArray arr = new JSONArray();
		while (it.hasNext()) {
			WeeklySalesDTO dto = it.next();
			
			
			JSONObject jobj = new JSONObject();
			Integer mon = dto.getMon();
			Integer tues = dto.getTues();
			Integer wednes = dto.getWednes();
			Integer thurs = dto.getThurs();
			Integer fri = dto.getFri();
			Integer satur = dto.getSatur();
			Integer sun = dto.getSun();
			Integer total = dto.getTotal();
			Integer m_ctgr_num = dto.getM_ctgr_num();
			String ctgr_name = dto.getCtgr_name();
			
			jobj.put("mon", mon);
			jobj.put("tues", tues);
			jobj.put("wednes", wednes);
			jobj.put("thurs", thurs);
			jobj.put("fri", fri);
			jobj.put("satur", satur);
			jobj.put("sun", sun);
			jobj.put("total", total);
			jobj.put("m_ctgr_num", m_ctgr_num);
			jobj.put("ctgr_name", ctgr_name);
			
			arr.add(jobj);
		}
		
		String json = arr.toJSONString();
		
		return json;
	}
	
	@Override
	public List<PeriodSalesDTO> getPeriodSalesList(String startDate, String endDate) {
		
		List<PeriodSalesDTO> dto = salesMapper.getPeriodSales(startDate, endDate);
		
		return dto;
	}
	
	@Override
	public String getPeriodSalesJson(String startDate, String endDate) {
		
		Iterator<PeriodSalesDTO> it = salesMapper.getPeriodSales(startDate, endDate).iterator();
		
		JSONArray arr = new JSONArray();
		while (it.hasNext()) {
			PeriodSalesDTO dto = it.next();
			
			
			JSONObject jobj = new JSONObject();
			String ord_date = dto.getOrd_date();
			Integer count = dto.getCount();
			Integer total_amount = dto.getTotal_amount();
			
			jobj.put("ord_date", ord_date);
			jobj.put("count", count);
			jobj.put("total_amount", total_amount);
			
			arr.add(jobj);
		}
		
		String json = arr.toJSONString();
		
		return json;
	}
	
}
