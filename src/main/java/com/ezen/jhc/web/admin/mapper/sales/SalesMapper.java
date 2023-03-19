package com.ezen.jhc.web.admin.mapper.sales;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.ezen.jhc.web.admin.dto.home.MainCtgrOrderDTO;
import com.ezen.jhc.web.admin.dto.sales.DailySalesDTO;
import com.ezen.jhc.web.admin.dto.sales.MonthlySalesDTO;
import com.ezen.jhc.web.admin.dto.sales.PeriodSalesDTO;
import com.ezen.jhc.web.admin.dto.sales.WeeklySalesDTO;

public interface SalesMapper {
	
	public List<DailySalesDTO> getDailySales();
	
	public WeeklySalesDTO getWeeklySalesMainCtgr(Integer m_ctgr_num);
	
	public WeeklySalesDTO getWeeklySalesSubCtgr(@Param("s_ctgr_num") Integer s_ctgr_num,@Param("m_ctgr_num") Integer m_ctgr_num);

	public List<PeriodSalesDTO> getPeriodSales(@Param("startDate") String startDate, @Param("endDate") String endDate);

	List<MainCtgrOrderDTO> getMainCtgrNewOrders();
	
	List<MainCtgrOrderDTO> getMonthlyMainCtgrOrders();
	
	List<MonthlySalesDTO> getMonthlySales();
	
	

}
