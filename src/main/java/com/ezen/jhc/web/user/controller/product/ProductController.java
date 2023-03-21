package com.ezen.jhc.web.user.controller.product;

/**@author SUJEONG
 * 제품 상세 페이지
 * */
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

import lombok.extern.log4j.Log4j2;

@Log4j2
@Controller
public class ProductController {
	@Autowired
	DataSource ds;
	
	@Autowired
	ProductsMapper prod_mapper;
	
	@Autowired
	ReviewMapper review_mapper;
	
	@GetMapping(value="/product_details")
	public String product_details(Model model, @RequestParam("p_num")int p_num) {

		ProdDTO p_dto = prod_mapper.getProdsAll(p_num);
		List<ReviewDTO> r_dto = review_mapper.getReviewAll(p_num);
		
		log.info("review : " + r_dto);
		Double starAvg = review_mapper.getStarAvg(p_num);
		
		model.addAttribute("prod", p_dto);
		model.addAttribute("starAvg",starAvg);
		model.addAttribute("reviews", r_dto);
		
	return "user/prod/product_details";
	
	}
	
	
	
}
