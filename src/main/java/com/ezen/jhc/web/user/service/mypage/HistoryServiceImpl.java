package com.ezen.jhc.web.user.service.mypage;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ezen.jhc.web.user.dto.order.OrderDTO;
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
	public OrderDTO getAll(Integer mem_num, Integer ord_num) {
		// TODO Auto-generated method stub
		return orderMapper.selectAll(mem_num, ord_num);
	}

	
}
