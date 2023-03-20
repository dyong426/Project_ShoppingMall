package com.ezen.jhc.web.admin.controller.home;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.ezen.jhc.web.admin.dto.home.AdminDTO;
import com.ezen.jhc.web.admin.dto.home.CsCtgrDTO;
import com.ezen.jhc.web.admin.dto.home.MainCtgrOrderDTO;
import com.ezen.jhc.web.admin.dto.home.NewMemberCountDTO;
import com.ezen.jhc.web.admin.dto.sales.MonthlySalesDTO;
import com.ezen.jhc.web.admin.service.home.AdminHomeServiceImpl;
import com.ezen.jhc.web.admin.service.sales.AdminSalesServiceImpl;

import lombok.extern.log4j.Log4j2;

@Log4j2
@Controller
public class AdminHomeController {
	
	@Autowired
	AdminHomeServiceImpl homeService;
	
	@Autowired
	AdminSalesServiceImpl salesService;
	
	@Autowired(required = false)
	List<MonthlySalesDTO> monthlySalesList;
	
	@Autowired(required = false)
	List<MainCtgrOrderDTO> mCtgrOrders;
	
	@Autowired(required = false)
	List<CsCtgrDTO> csCtgrs;
	
	@Autowired(required = false)
	NewMemberCountDTO newMemCntDTO;
	
	@Autowired(required = false)
	AdminDTO amdin;
	
	
	@RequestMapping(value ={"/admin", "/admin/home"}, method = RequestMethod.GET)
	public String main(Model model) {
		
		
		// 매출 통계
		monthlySalesList = salesService.getMonthlySales();
		
		log.info(monthlySalesList);
		
		model.addAttribute("monthlySalesList", monthlySalesList);
		
		String monthlySalesJson = salesService.getMonthlySalesJson();
		
		model.addAttribute("monthlySalesJson", monthlySalesJson);
		
		
		
		// 주문 통계
		mCtgrOrders = homeService.getMonthlyMainCtgrOrders();
		
		log.info(mCtgrOrders);
		
		model.addAttribute("monthlyMCtgrOrders", mCtgrOrders);
		
		// 주문 통계 차트 JSON데이터
		String mCtgrOrdersJson = homeService.getDailyDashJson();
		
		model.addAttribute("mCtgrOrdersJson", mCtgrOrdersJson);
		
		
		// 신규 주문
		mCtgrOrders = homeService.getMainCtgrNewOrders();
		
		log.info(mCtgrOrders);
		
		model.addAttribute("dailyMCtgrOrders", mCtgrOrders);
		
		// 1:1 문의
		
		csCtgrs = homeService.getNewCsCount();
		
		log.info(csCtgrs);
		
		model.addAttribute("csCtgrs", csCtgrs);
		
		newMemCntDTO = homeService.getNewMemberCount();
		
		model.addAttribute("newMemCnt", newMemCntDTO);
		
		
		
		
		return "admin/home/admin_home";
	}
	
	@GetMapping("admin/login")
	public String login() {
		
		return "admin/home/admin_login";
	}
	
	@PostMapping("admin/login")
	public String loginCheck(AdminDTO admin) {
		if (admin.getAdmin_email().equals("admin@naver.com") && admin.getAdmin_pw().equals("1234")) return "redirect:/admin";
		
		return "redirect:/admin/login";
	}

}
