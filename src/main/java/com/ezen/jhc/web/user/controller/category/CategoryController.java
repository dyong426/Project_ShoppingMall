package com.ezen.jhc.web.user.controller.category;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.sql.DataSource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import com.ezen.jhc.web.user.dto.prod.ProdDTO;
import com.ezen.jhc.web.user.dto.prod.SubCtgrDTO;
import com.ezen.jhc.web.user.mapper.category.CategoryMapper;

@Controller
public class CategoryController {
	
	@Autowired
	DataSource ds;
	
	@Autowired
	CategoryMapper mapper;

	
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
	
	
	@GetMapping(value="/category_sub")
	public String categorySubItems(HttpServletRequest request, Model model) {
		

		
		
		
		
		
		
		return "user/category/sub_category";
	}
	
}
