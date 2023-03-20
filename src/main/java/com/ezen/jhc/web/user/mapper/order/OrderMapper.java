package com.ezen.jhc.web.user.mapper.order;

import com.ezen.jhc.web.user.dto.order.OrderDTO;

public interface OrderMapper {

	public void saveAddr(OrderDTO orderDto);
	
	public void notSaveAddr(int mem_num);
	
	public void insertAddr(OrderDTO orderDto);
}
