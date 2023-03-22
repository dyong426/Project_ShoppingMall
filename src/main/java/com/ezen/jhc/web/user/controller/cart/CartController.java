package com.ezen.jhc.web.user.controller.cart;

import java.util.Date;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import com.ezen.jhc.web.user.dto.member.MemberDTO;
import com.ezen.jhc.web.user.service.cart.CartServiceImpl;


@Controller
public class CartController {
	
	@Autowired
	CartServiceImpl cartService;

	@GetMapping("/cart")
	public String cart(HttpSession session, Model model) {
		int mem_num = ((MemberDTO)session.getAttribute("member")).getMem_num();
		
		model.addAttribute("carts", cartService.getCarts(mem_num, session, model));
		
		return "user/cart/shopping_basket_page";
	}
}