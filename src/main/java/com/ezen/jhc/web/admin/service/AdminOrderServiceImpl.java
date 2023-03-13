package com.ezen.jhc.web.admin.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ezen.jhc.web.admin.dto.order.OrderDTO;
import com.ezen.jhc.web.admin.mapper.order.OrderMapper;

@Service
public class AdminOrderServiceImpl implements AdminOrderService{

	@Autowired
	OrderMapper orderMapper;
	
	@Override
	public List<OrderDTO> getOrderList() {
		
		return orderMapper.getOrder();
	}
}
