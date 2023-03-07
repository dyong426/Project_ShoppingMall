package com.ezen.jhc.web.admin.controller.prod;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;

import com.ezen.jhc.web.admin.dto.prod.MainCtgrDTO;
import com.ezen.jhc.web.admin.dto.prod.ProdColorDTO;
import com.ezen.jhc.web.admin.dto.prod.ProdColorListDTO;
import com.ezen.jhc.web.admin.dto.prod.ProdDTO;
import com.ezen.jhc.web.admin.dto.prod.ProdSizeDTO;
import com.ezen.jhc.web.admin.dto.prod.ProdSizeListDTO;
import com.ezen.jhc.web.admin.mapper.prod.MainCtgrMapper;
import com.ezen.jhc.web.admin.mapper.prod.SubCtgrMapper;

import lombok.extern.log4j.Log4j2;

@Log4j2
@Controller
public class AdminProdRegController {
	
	@Autowired
	MainCtgrMapper mCtgrMapper;
	
	@Autowired
	SubCtgrMapper sCtgrMapper;
	
	@Autowired(required = false)
	List<ProdColorDTO> prodColors;
	
	@Autowired(required = false)
	List<ProdSizeDTO> prodSizes;
	
	@GetMapping("/admin/prod/reg")
	public String regForm(Model model) {
		
		List<MainCtgrDTO> mainCtgrs = mCtgrMapper.getMainCtgr();
		
		model.addAttribute("mainCtgrs", mainCtgrs);

		return "admin/prod/admin_prod_reg";
	}
	
	@PostMapping("/admin/prod/reg")
	public String prodReg(ProdDTO prodDTO, @ModelAttribute(value="ProdColorListDTO") ProdColorListDTO prodColors, @ModelAttribute(value="ProdSizeListDTO") ProdSizeListDTO prodSizes, HttpServletRequest req, Model model) {
		
		System.out.println(prodDTO);
		
		System.out.println(prodColors);
		
		System.out.println(prodSizes);
		
		System.out.println(req.getParameter("prod_explain").length());
		
		System.out.println(req.getParameter("prod_info").length());
		
		return "redirect:/admin/prod/view";
	}	
}
