package com.ezen.jhc.web.admin.controller.prod;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.ezen.jhc.web.admin.dto.prod.ProdColorDTO;
import com.ezen.jhc.web.admin.dto.prod.ProdDTO;
import com.ezen.jhc.web.admin.dto.prod.ProdSizeDTO;
import com.ezen.jhc.web.admin.service.AdminProdViewServiceImpl;

import lombok.extern.log4j.Log4j2;

@Log4j2
@Controller
@RequestMapping("/admin")
public class AdminProdViewController {

	@Autowired
	AdminProdViewServiceImpl adminProdViewService;
	
	@Autowired(required = false)
	List<ProdDTO> prods;
	
	@Autowired(required = false)
	List<ProdColorDTO> prodColors;
	
	@Autowired(required = false)
	List<ProdSizeDTO> prodSizes;
	
	@GetMapping("/prod/view")
	public String prodView(Model model) {
		
		prods = adminProdViewService.getProdsList();
		
		model.addAttribute("prods", prods);
		
		return "admin/prod/admin_prod_view";
	}
	
	@PostMapping("/prod/delete")
	public String deleteProd(Integer p_num) {
		
		log.info(p_num);
		
		int result = adminProdViewService.deleteProd(p_num);
		
		return "redirect:/admin/prod/view";
	}
}
