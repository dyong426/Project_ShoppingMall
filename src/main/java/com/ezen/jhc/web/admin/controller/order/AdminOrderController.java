package com.ezen.jhc.web.admin.controller.order;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.ezen.jhc.common.util.PagingHelper;
import com.ezen.jhc.web.admin.dto.order.OrderDTO;
import com.ezen.jhc.web.admin.dto.order.OrderStatusDTO;
import com.ezen.jhc.web.admin.mapper.order.AdminOrderMapper;
import com.ezen.jhc.web.admin.service.order.AdminOrderServiceImpl;

import lombok.extern.log4j.Log4j2;

@Log4j2
@Controller
@RequestMapping("/admin")
public class AdminOrderController {
	
	@Autowired
	AdminOrderServiceImpl orderService;
	
	@Autowired
	AdminOrderMapper orderMapper;
	
	@GetMapping("/order")
	public String orderForm(Model model, 
						@RequestParam(defaultValue="1") Integer currentPage, 
						@RequestParam(value="category", required = false,defaultValue="8") Integer ord_status,
						@RequestParam(value="keyword", required = false,defaultValue="") String mem_name) {
		
		List<OrderDTO> orderList = new ArrayList<>();
		
		if (ord_status == null || ord_status == 8) {
			orderList = orderService.getSearchKeywordOrderList(mem_name);
		} else {
			orderList = orderService.getSearchOrderList(ord_status, mem_name);
		}
		
		List<OrderStatusDTO> status = orderMapper.orderStatuses();
		
		int total = orderList.size();

		int size = 10;
		
		if (currentPage == null && currentPage <= 0) {
			currentPage = 1;
		}
		
		int lastIndex = 0;
		if (orderList.size() < size * currentPage) {
			lastIndex = orderList.size();
		} else {			
			lastIndex = currentPage * size;
		}
		
		
		int startIndex = (currentPage * size) - size; 

		List<OrderDTO> orders = new ArrayList<>();
		
		for (int i = startIndex; i < lastIndex; i++) {
			
			orders.add(orderList.get(i));
		}
		
		model.addAttribute("status", status);
		model.addAttribute("orders", orders);
		model.addAttribute("paging", new PagingHelper(total, currentPage, 10, 5));
		
		
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
