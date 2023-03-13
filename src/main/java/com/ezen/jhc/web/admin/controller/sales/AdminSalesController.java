package com.ezen.jhc.web.admin.controller.sales;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import com.ezen.jhc.web.admin.dto.prod.MainCtgrDTO;
import com.ezen.jhc.web.admin.dto.prod.SubCtgrDTO;
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
		List<SubCtgrDTO> sCtgrs = salesService.getSubCtgrsList();
		
		log.info(mCtgrs);
		log.info(sCtgrs);
		model.addAttribute("mCtgrs", mCtgrs);
		model.addAttribute("sCtgrs", sCtgrs);
		
		// main ctgr
		
		return "admin/sales/admin_sales";
	}

}
