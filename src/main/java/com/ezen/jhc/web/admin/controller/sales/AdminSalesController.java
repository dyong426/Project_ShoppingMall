package com.ezen.jhc.web.admin.controller.sales;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import com.ezen.jhc.web.admin.dto.prod.MainCtgrDTO;
import com.ezen.jhc.web.admin.dto.sales.DailySalesDTO;
import com.ezen.jhc.web.admin.dto.sales.MonthlySalesDTO;
import com.ezen.jhc.web.admin.dto.sales.PeriodSalesDTO;
import com.ezen.jhc.web.admin.dto.sales.WeeklySalesDTO;
import com.ezen.jhc.web.admin.service.sales.AdminSalesServiceImpl;

import lombok.extern.log4j.Log4j2;

@Log4j2
@Controller
public class AdminSalesController {
	
	@Autowired
	AdminSalesServiceImpl salesService;
	
	@GetMapping("admin/sales")
	public String salesForm(Model model) {
		
		List<MainCtgrDTO> mCtgrs = salesService.getMainCtgrList();

		List<DailySalesDTO> dailySales = salesService.getDailySales();
		
		String json = salesService.getDailySalesJson();
		
		model.addAttribute("mCtgrs", mCtgrs);
		model.addAttribute("dailySales", dailySales);
		model.addAttribute("json", json);

		return "admin/sales/admin_sales";
	}
	
	@GetMapping("admin/sales/weekly")
	public String getWeeklySales(Model model) {
		
		List<WeeklySalesDTO> weeklySalesMcList = salesService.getWeeklySalesMainCtgrList();
		
		List<WeeklySalesDTO> weeklySalesScList = salesService.getWeeklySalesSubCtgrList();
		
		String weeklyJson = salesService.getWeeklySalesJson();

		model.addAttribute("weeklySalesScList", weeklySalesScList);
		model.addAttribute("weeklySalesMcList", weeklySalesMcList);
		model.addAttribute("weeklyJson", weeklyJson);
		
		return "admin/sales/admin_sales_weekly";
	}
	
	@GetMapping("admin/sales/monthly")
	public String getMonthlySales(Model model) {
		
		List<MonthlySalesDTO> monthlySalesList = salesService.getMonthlySales();
		
		String monthlyJson = salesService.getMonthlySalesJson();
		
		model.addAttribute("monthlySalesList", monthlySalesList);
		model.addAttribute("monthlyJson", monthlyJson);
		
		return "admin/sales/admin_sales_monthly";
	}
	
	@GetMapping("admin/sales/period")
	public String getPeriodSales(Model model, HttpServletRequest req) {
		
		
		String startDate = req.getParameter("startDate");
		String endDate = req.getParameter("endDate");
		
		List<PeriodSalesDTO> dto = salesService.getPeriodSalesList(startDate, endDate);
		String periodJson = salesService.getPeriodSalesJson(startDate, endDate);
		
		model.addAttribute("periodSalesList", dto);
		model.addAttribute("periodJson", periodJson);
		
		return "admin/sales/admin_sales_period";
	}

}
