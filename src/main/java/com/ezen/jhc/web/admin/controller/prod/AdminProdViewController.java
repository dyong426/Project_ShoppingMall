package com.ezen.jhc.web.admin.controller.prod;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.ezen.jhc.common.util.PagingHelper;
import com.ezen.jhc.web.admin.dto.prod.MainCtgrDTO;
import com.ezen.jhc.web.admin.dto.prod.ProdColorDTO;
import com.ezen.jhc.web.admin.dto.prod.ProdDTO;
import com.ezen.jhc.web.admin.dto.prod.ProdSizeDTO;
import com.ezen.jhc.web.admin.service.prod.AdminProdViewServiceImpl;
import com.ezen.jhc.web.admin.service.setting.AdminSettingServiceImpl;

import lombok.extern.log4j.Log4j2;

@Log4j2
@Controller
@RequestMapping("/admin")
public class AdminProdViewController {

	@Autowired
	AdminProdViewServiceImpl adminProdViewService;
	
	@Autowired(required = false)
	List<MainCtgrDTO> ctgrs;
	
	@Autowired(required = false)
	List<ProdDTO> prodList;
	
	@Autowired(required = false)
	List<ProdColorDTO> prodColors;
	
	@Autowired(required = false)
	List<ProdSizeDTO> prodSizes;
	
	@Autowired(required=false)
	AdminSettingServiceImpl settingService;
	
	@GetMapping("/prod/view")
	public String prodView(Model model, 
						@RequestParam(defaultValue="1") Integer currentPage,
						@RequestParam(value="category", required=false, defaultValue="0") Integer m_ctgr_num,
						@RequestParam(value="keyword", required=false, defaultValue="") String p_name) {
		
		if (m_ctgr_num == null || m_ctgr_num == 0) {
			prodList = adminProdViewService.getSearchKeywordProds(p_name);
		} else {
			prodList = adminProdViewService.getSearchProdsList(m_ctgr_num,p_name);			
		}
		
		ctgrs = settingService.getMainCtgrs();
		
		int total = prodList.size();

		int size = 10;
		
		if (currentPage == null && currentPage <= 0) {
			currentPage = 1;
		}
		
		int lastIndex = 0;
		if (prodList.size() < size * currentPage) {
			lastIndex = prodList.size();
		} else {			
			lastIndex = currentPage * size;
		}
		
		log.info("lastIndex" + lastIndex);
		
		
		log.info("prodList size : "+ prodList.size());
		int startIndex = (currentPage * size) - size; 
		log.info(startIndex);
		List<ProdDTO> prods = new ArrayList<>();
		
		for (int i = startIndex; i < lastIndex; i++) {
			
			prods.add(prodList.get(i));
		}
		
		
		model.addAttribute("paging", new PagingHelper(total, currentPage, 10, 5));
		model.addAttribute("prods", prods);
		model.addAttribute("ctgrs", ctgrs);
		return "admin/prod/admin_prod_view";
	}
	
	@PostMapping("/prod/delete")
	public String deleteProd(Integer p_num) {
		
		log.info(p_num);
		
		int result = adminProdViewService.deleteProd(p_num);
		
		return "redirect:/admin/prod/view";
	}
}
