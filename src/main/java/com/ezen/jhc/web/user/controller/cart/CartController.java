package com.ezen.jhc.web.user.controller.cart;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class CartController {

	@RequestMapping(value ="/cart", method = RequestMethod.GET)
	public String cart() {
		
		return "user/cart/shopping_basket_page";
	}
}