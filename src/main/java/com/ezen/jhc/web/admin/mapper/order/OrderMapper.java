package com.ezen.jhc.web.admin.mapper.order;

import java.util.List;

import com.ezen.jhc.web.admin.dto.order.OrderDTO;
import com.ezen.jhc.web.admin.dto.order.OrderDetailDTO;
import com.ezen.jhc.web.admin.dto.order.OrderListDTO;

public interface OrderMapper {
	
	List<OrderDTO> getOrders();
	
	OrderDTO getOrder(Integer ord_num);
	
	List<OrderDetailDTO> getOrderDetails(Integer ord_num);
	
	public int[] getMemberRecentOrders(Integer mem_num);
	
}
