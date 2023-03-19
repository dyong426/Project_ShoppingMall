package com.ezen.jhc.web.admin.controller.order;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.ezen.jhc.web.admin.dto.order.OrderDTO;
import com.ezen.jhc.web.admin.service.order.AdminOrderServiceImpl;

import lombok.extern.log4j.Log4j2;

@Log4j2
@Controller
@RequestMapping("/admin")
public class AdminOrderController {
	
	@Autowired
	AdminOrderServiceImpl orderService;
	
	@GetMapping("/order")
	public String orderForm(Model model) {
		
		List<OrderDTO> orders = orderService.getOrderList();
		
		model.addAttribute("orders", orders);
		
		return "admin/order/admin_order";
	}
	
	@PostMapping("/order/recieved")
	public String recievedOrder(OrderDTO ordDTO) {
		
		log.info("recieve ordDTO : " + ordDTO);
		
		int result = orderService.recievedOrder(ordDTO);
		
		log.info(result);
		
		return "redirect:/admin/order";
	}

	@PostMapping("/order/cancel")
	public String cancelOrder(OrderDTO ordDTO) {
		
		log.info("recieve ordDTO : " + ordDTO);
		
		int result = orderService.cancelOrder(ordDTO);
		
		log.info(result);
		
		return "redirect:/admin/order";
	}
	
	@PostMapping("/order/exchange")
	public String exchangeOrder(OrderDTO ordDTO) {
		
		log.info("recieve ordDTO : " + ordDTO);
		
		int result = orderService.exchangeOrder(ordDTO);
		
		log.info(result);
		
		return "redirect:/admin/order";
	}
	
	@PostMapping("/order/refund")
public String refundOrder(OrderDTO ordDTO) {
		
		log.info("recieve ordDTO : " + ordDTO);
		
		int result = orderService.refundOrder(ordDTO);
		
		log.info(result);
		
		return "redirect:/admin/order";
	}
}
