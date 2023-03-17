package com.ezen.jhc.web.user.service.mypage;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

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
		return orderMapper.selectOrderHistorySelected(mem_num, ord_status, start_date, end_date);
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

	//상태만 선택 된 경우
	@Override
	public List<OrderDTO> getOrderHistoryStatusSelected(Integer mem_num, String ord_status) {
		
		return orderMapper.selectOrderHistoryStatusSelected(mem_num, ord_status);
	}

	//날짜만 선택 된 경우
	@Override
	public List<OrderDTO> getOrderHistoryDateSelected(Integer mem_num, String start_date, String end_date) {
	
			
		SimpleDateFormat sdf = new SimpleDateFormat("yy/MM/dd");
		if (start_date == "") {
		    start_date = "20/01/01";
		} else if (end_date == "") {
		    end_date = sdf.format(new Date());
		}
		return orderMapper.selectOrderHistoryDateSelected(mem_num, start_date, end_date);
	}

	
	
	
	
}
