package com.ezen.jhc.web.user.controller.cart;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.ezen.jhc.web.user.dto.member.MemberDTO;
import com.ezen.jhc.web.user.service.cart.CartServiceImpl;

@Controller
public class CartController {
	
	@Autowired
	CartServiceImpl cartService;

	@GetMapping("/cart")
	public String cart(HttpSession session, Model model) {
		// 임시 데이터
		int mem_num = 1;//((MemberDTO)session.getAttribute("member")).getMem_num();
		
		model.addAttribute("carts", cartService.getCarts(mem_num));
		
		return "user/cart/shopping_basket_page";
	}
}
