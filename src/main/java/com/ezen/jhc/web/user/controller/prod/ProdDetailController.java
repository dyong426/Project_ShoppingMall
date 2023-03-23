package com.ezen.jhc.web.user.controller.prod;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import com.ezen.jhc.web.user.dto.prod.ProdColorDTO;
import com.ezen.jhc.web.user.dto.prod.ProdDTO;
import com.ezen.jhc.web.user.dto.prod.ProdSizeDTO;
import com.ezen.jhc.web.user.dto.review.ReviewDTO;
import com.ezen.jhc.web.user.mapper.review.ReviewMapper;
import com.ezen.jhc.web.user.service.prod.ProductServiceImpl;

import lombok.extern.log4j.Log4j2;

@Controller
@Log4j2
public class ProdDetailController {

	@Autowired
	ProductServiceImpl prodService;
		
	@Autowired
	ReviewMapper review_mapper;
	
	@GetMapping("/prodDetail")
	public String prodDetail(Model model, Integer p_num, HttpSession session) {
		Map<String, ProdColorDTO> colors = prodService.getColors(p_num);
		List<ProdSizeDTO> sizes = prodService.getSizes(p_num);
		ProdColorDTO color = prodService.getInitialColor(p_num);
		ProdDTO prod = prodService.getProd(p_num);
		
		model.addAttribute("colors", colors);
		model.addAttribute("color", color);
		model.addAttribute("sizes", sizes);
		model.addAttribute("prod", prod);
						
		List<ReviewDTO> r_dto = review_mapper.getReviewAll(p_num);
		
		log.info("review : " + r_dto);
		Double starAvg = review_mapper.getStarAvg(p_num);
		
		model.addAttribute("starAvg",starAvg);
		model.addAttribute("reviews", r_dto);
		
		return "user/prod/product_details";
	}
	
	
}
