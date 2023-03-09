package com.ezen.jhc.web.user.controller.prod;

import java.util.Date;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import com.ezen.jhc.web.user.dto.member.MemberDTO;
import com.ezen.jhc.web.user.dto.prod.ProdColorDTO;
import com.ezen.jhc.web.user.dto.prod.ProdDTO;
import com.ezen.jhc.web.user.service.prod.ProductServiceImpl;

import lombok.extern.log4j.Log4j2;

@Controller
@Log4j2
public class ProdDetailController {

	@Autowired
	ProductServiceImpl prodService;
	
	// detail 페이지로 요청받을 때 p_num, pc_num parameter 받기 (pd_num으로 받으면 사이즈도 정해져 있기 때문에 안됨)
	@GetMapping("/prodDetail")
	public String prodDetail(Model model, Integer p_num, HttpSession session) {
		
		session.setAttribute("member", new MemberDTO(1, "dslkjf@naver.com", "2132", "1985/02/21", "두리두하", "01050505050", null, new Date(810501231065145L), 7832));
		
		Map<String, ProdColorDTO> colors = prodService.getColors(p_num);
		List<String> sizes = prodService.getSizes(p_num);
		ProdColorDTO color = prodService.getInitialColor(p_num);
		ProdDTO prod = prodService.getProd(p_num);
		
		model.addAttribute("colors", colors);
		model.addAttribute("color", color);
		model.addAttribute("sizes", sizes);
		model.addAttribute("prod", prod);
		
		return "user/prod/product_details";
	}
}
