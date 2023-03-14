package com.ezen.jhc.web.admin.controller.sales;

import java.util.List;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import com.ezen.jhc.web.admin.dto.prod.MainCtgrDTO;
import com.ezen.jhc.web.admin.dto.sales.DailySalesDTO;
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
		
		log.info(mCtgrs);
		log.info(dailySales);
		model.addAttribute("mCtgrs", mCtgrs);
		model.addAttribute("dailySales", dailySales);
		
		JSONObject jobj = new JSONObject();
		JSONObject obj = new JSONObject();
		
		for (DailySalesDTO dto : dailySales) {			
			obj.put(dto.getS_ctgr_name(), dto);
		}
		JSONArray arr = new JSONArray();
		
		arr.add(obj);
		jobj.put("dailySales", arr);
		
		model.addAttribute("json", jobj);
		// main ctgr
		
		log.info(obj);
		log.info(arr);
		log.info(jobj);
		return "admin/sales/admin_sales";
	}

}
