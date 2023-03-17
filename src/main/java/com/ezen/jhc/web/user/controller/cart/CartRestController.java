package com.ezen.jhc.web.user.controller.cart;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.MediaType;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RestController;

import com.ezen.jhc.web.user.dto.prod.ProdSizeDTO;
import com.ezen.jhc.web.user.service.prod.ProductServiceImpl;

import lombok.extern.log4j.Log4j2;

@RestController
@Log4j2
public class CartRestController {

	@Autowired
	ProductServiceImpl prodService;
	
	@GetMapping(value="/getSizes", produces=MediaType.APPLICATION_JSON_VALUE)
	public List<ProdSizeDTO> getSizes(Model model, HttpServletRequest req) {
		List<ProdSizeDTO> list = prodService.getSizes(Integer.parseInt(req.getParameter("pNum")));
		
		model.addAttribute("sizes", list);
		return list;
	}
}
