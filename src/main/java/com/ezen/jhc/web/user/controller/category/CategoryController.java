package com.ezen.jhc.web.user.controller.category;

import java.util.List;

import javax.sql.DataSource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.ezen.jhc.web.user.dto.prod.ProdDTO;
import com.ezen.jhc.web.user.dto.prod.SubCtgrDTO;
import com.ezen.jhc.web.user.mapper.category.CategoryMapper;
import com.ezen.jhc.web.user.mapper.category.SearchMapper;

@Controller
public class CategoryController {
	
	@Autowired
	DataSource ds;
	
	@Autowired
	CategoryMapper mapper;
	
	@Autowired
	SearchMapper s_mapper;

	
	@GetMapping(value="/category_clothes")
	public String category_clothes(Model model) {
		
		String mainCtgr = mapper.getMainCategory(1);
		List<SubCtgrDTO> subCtgr = mapper.getSubCategories(1);
		List<ProdDTO> products= mapper.getAll(1);
		
		model.addAttribute("products", products);
		model.addAttribute("mainCtgr", mainCtgr);
		model.addAttribute("subCtgr", subCtgr);
		
		return "user/category/category";
	}
	
	@GetMapping(value="/category_phone_case")
	public String category_phone_case(Model model) {
		String mainCtgr = mapper.getMainCategory(2);
		List<SubCtgrDTO> subCtgr = mapper.getSubCategories(2);
		List<ProdDTO> products= mapper.getAll(2);
		
		model.addAttribute("products", products);
		model.addAttribute("mainCtgr", mainCtgr);
		model.addAttribute("subCtgr", subCtgr);
		
		return "user/category/category";
	}
	
	@GetMapping(value="/category_home")
	public String category_home(Model model) {
		String mainCtgr = mapper.getMainCategory(3);
		List<SubCtgrDTO> subCtgr = mapper.getSubCategories(3);
		List<ProdDTO> products= mapper.getAll(3);
		
		model.addAttribute("products", products);
		model.addAttribute("mainCtgr", mainCtgr);
		model.addAttribute("subCtgr", subCtgr);
		
		return "user/category/category";
	}

	@GetMapping(value="/category_frame")
	public String category_frame(Model model) {
		String mainCtgr = mapper.getMainCategory(4);
		List<SubCtgrDTO> subCtgr = mapper.getSubCategories(4);
		List<ProdDTO> products= mapper.getAll(4);
		
		model.addAttribute("products", products);
		model.addAttribute("mainCtgr", mainCtgr);
		model.addAttribute("subCtgr", subCtgr);
		
		return "user/category/category";
	}
	
	
	@GetMapping(value="/category")
	public String categorySubItems(@RequestParam("ctgr_num") int s_ctgr_num, Model model) {
		String mainCtgr = mapper.getMainCtgrNameBySubCtgr(s_ctgr_num);
		List<SubCtgrDTO> subCtgr = mapper.getSubCategoriesBySubNum(s_ctgr_num);
		List<ProdDTO> products_sub = mapper.getAllSubProds(s_ctgr_num);
		
		model.addAttribute("products", products_sub);
		model.addAttribute("mainCtgr", mainCtgr);
		model.addAttribute("subCtgr", subCtgr);
		
		
		return "user/category/category";
	}
	
	@GetMapping(value="/products/search")
	public String search(@RequestParam("keyword") String keyword, Model model) {

		List<ProdDTO> products = s_mapper.getProdsBySearch(keyword);
		
		
		model.addAttribute("keyword", keyword);
		model.addAttribute("products", products);
		
		return "user/category/search";
	}
}
