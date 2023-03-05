package com.ezen.jhc.web.admin.controller.prod;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import com.ezen.jhc.web.admin.dto.prod.ProdColorDTO;
import com.ezen.jhc.web.admin.dto.prod.ProdDTO;
import com.ezen.jhc.web.admin.dto.prod.ProdSizeDTO;
import com.ezen.jhc.web.admin.service.AdminProdViewServiceImpl;

@Controller
public class AdminProdViewController {

	@Autowired
	AdminProdViewServiceImpl adminProdViewService;
	
	@Autowired(required = false)
	List<ProdDTO> prods;
	
	@Autowired(required = false)
	List<ProdColorDTO> prodColors;
	
	@Autowired(required = false)
	List<ProdSizeDTO> prodSizes;
	
	@GetMapping("/admin/prod/view")
	public String prodView(Model model) {
		
		prods = adminProdViewService.getProdsList();
		
		for (int i = 0; i < prods.size(); i++) {
			
			Integer p_num = prods.get(i).getP_num();
			String p_name = prods.get(i).getP_name();
			
			prodColors = adminProdViewService.getProdColorList(p_num);
			prodSizes = adminProdViewService.getProdSizeList(p_num);
			
			model.addAttribute(p_name + "_Colors", prodColors);
			model.addAttribute(p_name + "_Sizes", prodSizes);
			
			System.out.println(p_name + "Colors");
			System.out.println(model.getAttribute(p_name + "Colors"));
		}
		
		
		model.addAttribute("prods", prods);
		
		
		return "admin/prod/admin_prod_view";
	}
}
