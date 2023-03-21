package com.ezen.jhc.web.admin.mapper.order;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.ezen.jhc.web.admin.dto.order.OrderDTO;
import com.ezen.jhc.web.admin.dto.order.OrderDetailDTO;
import com.ezen.jhc.web.admin.dto.order.OrderStatusDTO;

public interface AdminOrderMapper {
	
	List<OrderDTO> getOrders();
	
	List<OrderDTO> getSearchOrders(@Param("ord_status")Integer ord_status,@Param("mem_name") String mem_name);
	
	List<OrderDTO> getSearchKeywordOrders(@Param("mem_name")String mem_name);
	
	OrderDTO getOrder(@Param("ord_num")Integer ord_num);
	
	List<OrderDetailDTO> getOrderDetails(@Param("ord_num")Integer ord_num);
	
	int[] getMemberRecentOrders(@Param("mem_num")Integer mem_num);
	
	Integer updateOrderStatus(OrderDTO ordDTO);
	
	List<OrderStatusDTO> orderStatuses();
	
}
