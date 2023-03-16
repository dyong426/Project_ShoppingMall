package com.ezen.jhc.web.user.controller.cart;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.ezen.jhc.web.user.dto.member.MemberDTO;
import com.ezen.jhc.web.user.service.cart.CartServiceImpl;

@Controller
public class CartController {
	
	@Autowired
	CartServiceImpl cartService;

	@RequestMapping(value ="/cart", method = RequestMethod.GET)
	public String cart(HttpSession session, Model model) {
		
//		int mem_num = ((MemberDTO)session.getAttribute("member")).getMem_num();
//		
//		model.addAttribute("carts", cartService.getCarts(mem_num));
		
		return "user/cart/shopping_basket_page";
	}
}
