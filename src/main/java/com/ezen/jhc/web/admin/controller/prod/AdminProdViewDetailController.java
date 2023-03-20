package com.ezen.jhc.web.admin.controller.prod;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import com.ezen.jhc.web.admin.dto.prod.MainCtgrDTO;
import com.ezen.jhc.web.admin.dto.prod.ProdColorDTO;
import com.ezen.jhc.web.admin.dto.prod.ProdDTO;
import com.ezen.jhc.web.admin.dto.prod.ProdSizeDTO;
import com.ezen.jhc.web.admin.dto.prod.SubCtgrDTO;
import com.ezen.jhc.web.admin.service.prod.AdminProdRegServiceImpl;
import com.ezen.jhc.web.admin.service.prod.AdminProdViewServiceImpl;

@Controller
public class AdminProdViewDetailController {
	
	@Autowired
	AdminProdViewServiceImpl adminProdViewService;
	
	@Autowired
	AdminProdRegServiceImpl adminProdRegService;
	
	@Autowired(required = false)
	List<MainCtgrDTO> mainCtgrs;
	
	@Autowired(required = false)
	List<SubCtgrDTO> subCtgrs;
	
	@Autowired(required = false)
	List<ProdDTO> prods;
	
	@Autowired(required = false)
	ProdDTO prodDTO;
	
	@Autowired(required = false)
	List<ProdColorDTO> prodColors;
	
	@Autowired(required = false)
	List<ProdSizeDTO> prodSizes;
	
	@GetMapping("/admin/prod/view/detail")
	public String prodDetail(Model model, Integer p_num) {
		
		prodDTO = adminProdViewService.getProdP_num(p_num);
		
		List<MainCtgrDTO> mainCtgrs = adminProdRegService.getMainCtgrList();
		
		List<SubCtgrDTO> subCtgrs = adminProdRegService.getSubCtgrList(prodDTO.getM_ctgr_num());
		
		prodColors = adminProdViewService.getProdColorList(p_num);
		
		prodSizes = adminProdViewService.getProdSizeList(p_num);
		
		model.addAttribute("mainCtgrs", mainCtgrs);
		
		model.addAttribute("prodSubCtgrs", subCtgrs);
		
		model.addAttribute("prod", prodDTO);
		
		model.addAttribute("prodColors", prodColors);
		
		model.addAttribute("prodSizes", prodSizes);
		
		return "admin/prod/admin_prod_view_detail";
	}
}
