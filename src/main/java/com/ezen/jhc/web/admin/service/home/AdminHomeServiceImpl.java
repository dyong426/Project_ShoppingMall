package com.ezen.jhc.web.admin.service.home;

import java.util.Iterator;
import java.util.List;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ezen.jhc.web.admin.dto.home.CsCtgrDTO;
import com.ezen.jhc.web.admin.dto.home.MainCtgrOrderDTO;
import com.ezen.jhc.web.admin.dto.home.NewMemberCountDTO;
import com.ezen.jhc.web.admin.mapper.home.AdminHomeMapper;
import com.ezen.jhc.web.admin.mapper.sales.SalesMapper;

@Service
public class AdminHomeServiceImpl implements AdminHomeService{
	
	@Autowired
	SalesMapper salesMapper;
	
	@Autowired
	AdminHomeMapper homeMapper;
	
	@Override
	public List<MainCtgrOrderDTO> getMainCtgrNewOrders() {
		
		return salesMapper.getMainCtgrNewOrders();
	}
	
	@Override
	public List<MainCtgrOrderDTO> getMonthlyMainCtgrOrders() {
		
		return salesMapper.getMonthlyMainCtgrOrders();
	}
	
	@Override
	public String getDailyDashJson() {
		Iterator<MainCtgrOrderDTO> it = salesMapper.getMonthlyMainCtgrOrders().iterator();

		JSONArray arr = new JSONArray();
		while (it.hasNext()) {
			MainCtgrOrderDTO dto = it.next();

			JSONObject jobj = new JSONObject();
			Integer m_ctgr_num = dto.getM_ctgr_num();
			String m_ctgr_name = dto.getM_ctgr_name();
			Integer sales = dto.getSales();

			jobj.put("m_ctgr_num", m_ctgr_num);
			jobj.put("m_ctgr_name", m_ctgr_name);
			jobj.put("sales", sales);

			arr.add(jobj);
		}

		String json = arr.toJSONString();

		return json;
	}
	
	@Override
	public List<CsCtgrDTO> getNewCsCount() {
		
		return homeMapper.getNewCsCount();
	}
	
	@Override
	public NewMemberCountDTO getNewMemberCount() {
		
		return homeMapper.getNewMemberCount();
	}
}
