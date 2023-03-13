package com.ezen.jhc.web.admin.controller.order;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import com.ezen.jhc.web.admin.dto.order.OrderDTO;
import com.ezen.jhc.web.admin.dto.order.OrderDetailDTO;
import com.ezen.jhc.web.admin.service.AdminOrderService;

@Controller
public class AdminOrderViewController {

	@Autowired
	AdminOrderService orderService;
	
	@Autowired
	OrderDTO orderDTO;
	
	@Autowired
	List<OrderDetailDTO> orderDetails;
	
	@GetMapping("admin/order/detail")
	public String getOrderDetail(Model model, Integer ord_num) {
		
		orderDTO = orderService.getOrderOrd_num(ord_num);
		
		orderDetails = orderService.getOrderDetailList(ord_num);
		
		model.addAttribute("order", orderDTO);
		model.addAttribute("orderDetails", orderDetails);
		
		return "admin/order/admin_order_detail";
		
	}
}
