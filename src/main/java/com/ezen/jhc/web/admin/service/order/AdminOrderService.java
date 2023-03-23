package com.ezen.jhc.web.admin.service.order;

import java.util.List;

import org.springframework.stereotype.Service;

import com.ezen.jhc.web.admin.dto.order.OrderDTO;
import com.ezen.jhc.web.admin.dto.order.OrderDetailDTO;

@Service
public interface AdminOrderService {
	
	List<OrderDTO> getOrderList();
	
	List<OrderDTO> getSearchOrderList(Integer ord_status, String mem_name);
	
	List<OrderDTO> getSearchKeywordOrderList(String mem_name);
	
	OrderDTO getOrderOrd_num(Integer ord_num);
	
	List<OrderDetailDTO> getOrderDetailList(Integer ord_num);
	
	Integer recievedOrder(OrderDTO ordDTO);
	
	Integer cancelOrder(OrderDTO ordDTO);
	
	Integer exchangeOrder(OrderDTO ordDTO);
	
	Integer refundOrder(OrderDTO ordDTO);

}
