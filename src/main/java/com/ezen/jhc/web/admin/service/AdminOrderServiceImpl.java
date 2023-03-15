package com.ezen.jhc.web.admin.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ezen.jhc.common.util.Utils;
import com.ezen.jhc.web.admin.dto.order.OrderDTO;
import com.ezen.jhc.web.admin.dto.order.OrderDetailDTO;
import com.ezen.jhc.web.admin.mapper.order.OrderMapper;

import lombok.extern.log4j.Log4j2;

@Log4j2
@Service
public class AdminOrderServiceImpl implements AdminOrderService{

	@Autowired
	OrderMapper orderMapper;

	@Override
	public List<OrderDTO> getOrderList() {
		
		List<OrderDTO> orders = orderMapper.getOrders();
		
		return orderMapper.getOrders();
	}
	
	@Override
	public OrderDTO getOrderOrd_num(Integer ord_num) {
		
		return orderMapper.getOrder(ord_num);
	}
	
	@Override
	public List<OrderDetailDTO> getOrderDetailList(Integer ord_num) {
		
		return orderMapper.getOrderDetails(ord_num);
	}
	
	
	
}
