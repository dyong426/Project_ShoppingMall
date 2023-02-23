package com.ezen.jhc.web.user.controller.prod;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import com.ezen.jhc.web.user.dto.prod.ProdColorDTO;
import com.ezen.jhc.web.user.service.prod.ProductServiceImpl;

import lombok.extern.log4j.Log4j2;

@Controller
@Log4j2
public class ProdDetailController {

	@Autowired
	ProductServiceImpl prodService;
	
	@GetMapping("/prodDetail")
	public String prodDetail(Model model, Integer p_num) {
		
		Map<String, ProdColorDTO> colors = prodService.getColors(p_num);
		
		log.info("Product Color Config");
		model.addAttribute("colors", colors);
		log.info(model.getAttribute("colors"));
		
		return "user/prod/product_details";
	}
}
