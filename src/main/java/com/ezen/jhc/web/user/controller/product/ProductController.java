package com.ezen.jhc.web.user.controller.product;

import java.util.List;

import javax.sql.DataSource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.ezen.jhc.web.user.dto.prod.ProdDTO;
import com.ezen.jhc.web.user.dto.review.ReviewDTO;
import com.ezen.jhc.web.user.mapper.products.ProductsMapper;
import com.ezen.jhc.web.user.mapper.review.ReviewMapper;

@Controller
public class ProductController {
	@Autowired
	DataSource ds;
	
	@Autowired
	ProductsMapper prod_mapper;
	
	@Autowired
	ReviewMapper review_mapper;
	
	@GetMapping(value="/product_details")
	public String product_details(Model model, @RequestParam("product_num")int p_num) {

		ProdDTO p_dto = prod_mapper.getAll(p_num);
		List<ReviewDTO> r_dto = review_mapper.getAll(p_num); 
		Double starAvg = review_mapper.getStarAvg(p_num);
		
		model.addAttribute("prod", p_dto);
		model.addAttribute("starAvg",starAvg);
		model.addAttribute("reviews", r_dto);
		
	return "user/prod/product_details";
	
	}
	
	
	
}
