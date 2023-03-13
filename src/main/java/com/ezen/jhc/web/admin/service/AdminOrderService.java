package com.ezen.jhc.web.admin.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.ezen.jhc.web.admin.dto.order.OrderDTO;

@Service
public interface AdminOrderService {
	
	public List<OrderDTO> getOrderList();
}
