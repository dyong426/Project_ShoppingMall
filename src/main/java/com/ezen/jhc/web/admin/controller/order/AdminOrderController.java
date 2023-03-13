package com.ezen.jhc.web.admin.controller.order;

import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import com.ezen.jhc.web.admin.dto.order.OrderDTO;
import com.ezen.jhc.web.admin.service.AdminOrderService;
import com.ezen.jhc.web.admin.service.AdminOrderServiceImpl;

@Controller
public class AdminOrderController {
	
	AdminOrderService orderService = new AdminOrderServiceImpl();
	
	
	@GetMapping("admin/order")
	public String orderForm(Model model) {
		
		List<OrderDTO> orders = orderService.getOrderList();
		
		model.addAttribute("orders", orders);
		
		return "admin/order/admin_order";
		
	}

}
