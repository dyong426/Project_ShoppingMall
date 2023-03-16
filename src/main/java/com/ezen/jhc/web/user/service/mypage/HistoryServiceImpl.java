package com.ezen.jhc.web.user.service.mypage;

import java.util.Date;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ezen.jhc.web.user.dto.order.OrderDTO;
import com.ezen.jhc.web.user.dto.order.OrderDetailDTO;
import com.ezen.jhc.web.user.mapper.order.OrderMapper;

@Service
public class HistoryServiceImpl implements HistoryService {
	
	

	@Autowired
	OrderMapper orderMapper;

	@Override
	public List<OrderDTO> getOrderHistory(Integer mem_num) {
		return orderMapper.selectOrderHistory(mem_num);
	}
	
	@Override
	public List<OrderDTO> getOrderHistorySelectedAll(Integer mem_num, String ord_status, String start_date, String end_date) {
		return orderMapper.selectOrderHistorySelectedAll(mem_num, ord_status, start_date, end_date);
	}

	@Override
	public OrderDTO getAll(Integer mem_num, Integer ord_num) {
		// TODO Auto-generated method stub
		return orderMapper.selectAll(mem_num, ord_num);
	}

	@Override
	public List<OrderDetailDTO> getOrderDetails(Integer ord_num) {
		// TODO Auto-generated method stub
		return orderMapper.selectOrderDetails(ord_num);
	}

	@Override
	public void orderCancel(Integer ord_num) {
			orderMapper.cancleOrder(ord_num);
		
	}

	
}
