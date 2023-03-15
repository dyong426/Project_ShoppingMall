package com.ezen.jhc.web.admin.mapper.order;

import java.util.List;

import com.ezen.jhc.web.admin.dto.order.OrderDTO;
import com.ezen.jhc.web.admin.dto.order.OrderDetailDTO;

public interface AdminOrderMapper {
	
	List<OrderDTO> getOrders();
	
	OrderDTO getOrder(Integer ord_num);
	
	List<OrderDetailDTO> getOrderDetails(Integer ord_num);
}
