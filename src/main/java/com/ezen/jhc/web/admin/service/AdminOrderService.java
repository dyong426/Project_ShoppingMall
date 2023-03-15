package com.ezen.jhc.web.admin.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.ezen.jhc.web.admin.dto.order.OrderDTO;
import com.ezen.jhc.web.admin.dto.order.OrderDetailDTO;

@Service
public interface AdminOrderService {
	
	public List<OrderDTO> getOrderList();
	
	public OrderDTO getOrderOrd_num(Integer ord_num);
	
	public List<OrderDetailDTO> getOrderDetailList(Integer ord_num);
}
