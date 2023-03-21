package com.ezen.jhc.web.admin.service.order;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ezen.jhc.web.admin.dto.order.OrderDTO;
import com.ezen.jhc.web.admin.dto.order.OrderDetailDTO;
import com.ezen.jhc.web.admin.mapper.order.AdminOrderMapper;

import lombok.extern.log4j.Log4j2;

@Log4j2
@Service
public class AdminOrderServiceImpl implements AdminOrderService{

	@Autowired
	AdminOrderMapper orderMapper;
	
	@Autowired(required = false)
	OrderDTO ord;
	
	@Autowired(required = false)
	List<OrderDTO> orders;

	@Override
	public List<OrderDTO> getOrderList() {
		
		orders = orderMapper.getOrders();
		
		return orderMapper.getOrders();
	}
	
	@Override
	public List<OrderDTO> getSearchOrderList(Integer ord_status, String mem_name) {
		
		return orderMapper.getSearchOrders(ord_status,mem_name);
	}
	
	@Override
	public List<OrderDTO> getSearchKeywordOrderList(String mem_name) {
		
		return orderMapper.getSearchKeywordOrders(mem_name);
	}
	
	
	@Override
	public OrderDTO getOrderOrd_num(Integer ord_num) {
		
		return orderMapper.getOrder(ord_num);
	}
	
	@Override
	public List<OrderDetailDTO> getOrderDetailList(Integer ord_num) {
		
		return orderMapper.getOrderDetails(ord_num);
	}
	
	@Override
	public Integer recievedOrder(OrderDTO ordDTO) {
		
		ord = ordDTO;
		ord.setOrd_status(2);
		
		return orderMapper.updateOrderStatus(ord);
	}
	
	@Override
	public Integer cancelOrder(OrderDTO ordDTO) {
		
		ord = ordDTO;
		ord.setOrd_status(5);
		
		return orderMapper.updateOrderStatus(ord);
	}
	
	@Override
	public Integer exchangeOrder(OrderDTO ordDTO) {
		ord = ordDTO;
		ord.setOrd_status(6);
		
		return orderMapper.updateOrderStatus(ord);
	}
	
	@Override
	public Integer refundOrder(OrderDTO ordDTO) {
		ord = ordDTO;
		ord.setOrd_status(7);
		
		return orderMapper.updateOrderStatus(ord);
	}
	
	
}
