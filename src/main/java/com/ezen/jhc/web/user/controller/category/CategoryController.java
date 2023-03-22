package com.ezen.jhc.web.user.controller.category;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import javax.sql.DataSource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.ezen.jhc.web.user.dto.prod.ProdDTO;
import com.ezen.jhc.web.user.dto.prod.SubCtgrDTO;
import com.ezen.jhc.web.user.service.category.CategoryService;
import com.ezen.jhc.web.user.service.category.SearchService;

@Controller
public class CategoryController {
	
	@Autowired
	DataSource ds;
	
	@Autowired
	private CategoryService categoryService; 
	
	@Autowired
	private SearchService searchService;

	
	@GetMapping(value="/main_category")
	public String category_clothes(HttpServletRequest request, Model model, HttpSession session) {
		
		int m_ctgr_num = Integer.parseInt(request.getParameter("m_ctgr_num"));
		
		String mainCtgr = categoryService.getMainCategory(m_ctgr_num);
		List<SubCtgrDTO> subCtgr = categoryService.getSubCategories(m_ctgr_num);
		List<ProdDTO> products= categoryService.getProdsAll(m_ctgr_num);
		
		model.addAttribute("products", products);
		model.addAttribute("mainCtgr", mainCtgr);
		model.addAttribute("subCtgrs", subCtgr);
		
		return "user/category/category";
	}
	
	@GetMapping(value="/category")
	public String categorySubItems(@RequestParam("ctgr_num") int s_ctgr_num, Model model) {
		
		String mainCtgr = categoryService.getMainCtgrNameBySubCtgr(s_ctgr_num);
		List<SubCtgrDTO> subCtgr = categoryService.getSubCategoriesBySubNum(s_ctgr_num);
		List<ProdDTO> products_sub = categoryService.getAllSubProds(s_ctgr_num);
		
		model.addAttribute("products", products_sub);
		model.addAttribute("mainCtgr", mainCtgr);
		model.addAttribute("subCtgrs", subCtgr);

		
		return "user/category/category";
	}
	
	@GetMapping(value="/products/search")
	public String search(@RequestParam("keyword") String keyword, Model model) {

		List<ProdDTO> products = searchService.getProdsBySearch(keyword);
		
		model.addAttribute("keyword", keyword);
		model.addAttribute("products", products);
		
		return "user/category/search";
	}
}
