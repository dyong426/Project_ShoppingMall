package com.ezen.jhc.web.user.controller.order;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import com.ezen.jhc.web.user.service.order.OrderServiceImpl;

@Controller
public class OrderController {

	@Autowired
	OrderServiceImpl orderService;
	
	@GetMapping("/order")
	public String order(Model model, HttpServletRequest req) {
		
		
		
		return "user/order/order";
	}
	
}
