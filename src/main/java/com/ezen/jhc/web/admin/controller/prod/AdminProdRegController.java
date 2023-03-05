package com.ezen.jhc.web.admin.controller.prod;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.MediaType;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;

import com.ezen.jhc.web.admin.dto.prod.MainCtgrDTO;
import com.ezen.jhc.web.admin.dto.prod.SubCtgrDTO;
import com.ezen.jhc.web.admin.mapper.prod.MainCtgrMapper;
import com.ezen.jhc.web.admin.mapper.prod.SubCtgrMapper;


@Controller
public class AdminProdRegController {
	
	@Autowired
	MainCtgrMapper mCtgrMapper;
	
	@Autowired
	SubCtgrMapper sCtgrMapper;
	
	@GetMapping("/admin/prod/reg")
	public String prodReg(Model model) {
		
		List<MainCtgrDTO> mainCtgrs = mCtgrMapper.getMainCtgr();
		
		model.addAttribute("mainCtgrs", mainCtgrs);
		
		
		
		return "admin/prod/admin_prod_reg";
	}
}
