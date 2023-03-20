package com.ezen.jhc.web.user.controller.cart;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.MediaType;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RestController;

import com.ezen.jhc.web.user.dto.cart.OnlyCartDTO;
import com.ezen.jhc.web.user.dto.prod.ProdSizeDTO;
import com.ezen.jhc.web.user.service.cart.CartServiceImpl;
import com.ezen.jhc.web.user.service.prod.ProductServiceImpl;

import lombok.extern.log4j.Log4j2;

@RestController
@Log4j2
public class CartRestController {

	@Autowired
	ProductServiceImpl prodService;
	
	@Autowired
	CartServiceImpl cartService;
	
	@GetMapping(value="/getSizes", produces=MediaType.APPLICATION_JSON_VALUE)
	public List<ProdSizeDTO> getSizes(Model model, HttpServletRequest req) {
		List<ProdSizeDTO> list = prodService.getSizes(Integer.parseInt(req.getParameter("p_num")));
		
		model.addAttribute("sizes", list);
		return list;
	}
	
	@PostMapping("/deleteCart")
	public void deleteCart(int cart_num) {
		cartService.deleteCart(cart_num);
	}
	
	@PostMapping(value="/createCart", produces=MediaType.APPLICATION_JSON_VALUE)
	public void createCart(@RequestBody OnlyCartDTO cartDto) {
		cartDto.setMem_cstm_path(cartDto.getMem_cstm_path().replace("file:///", "").replace("/", "\\"));
		cartService.createCart(cartDto);
	}
	
	@PostMapping("/update/increaseQty")
	public void increaseQty(int cart_num, int p_price) {
		cartService.increaseQty(cart_num, p_price);
	}
	
	@PostMapping("/update/decreaseQty")
	public void decreaseQty(int cart_num, int p_price) {
		cartService.decreaseQty(cart_num, p_price);
	}
}
