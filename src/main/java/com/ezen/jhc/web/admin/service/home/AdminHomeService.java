package com.ezen.jhc.web.admin.service.home;

import java.util.List;

import org.springframework.stereotype.Service;

import com.ezen.jhc.web.admin.dto.home.AdminDTO;
import com.ezen.jhc.web.admin.dto.home.CsCtgrDTO;
import com.ezen.jhc.web.admin.dto.home.MainCtgrOrderDTO;
import com.ezen.jhc.web.admin.dto.home.NewMemberCountDTO;

@Service
public interface AdminHomeService {

	List<MainCtgrOrderDTO> getMainCtgrNewOrders();
	
	List<MainCtgrOrderDTO> getMonthlyMainCtgrOrders();
	
	String getDailyDashJson();
	
	List<CsCtgrDTO> getNewCsCount();
	
	NewMemberCountDTO getNewMemberCount();
	
	String loginPW(String admin_email);
	
	Integer join(AdminDTO admin);
}
