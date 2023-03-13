package com.ezen.jhc.web.user.service.mypage;

import java.util.List;

import org.springframework.stereotype.Service;

import com.ezen.jhc.common.util.OrderNumGenerator;
import com.ezen.jhc.web.user.dto.order.OrderDTO;

@Service
public interface HistoryService {

	public static final OrderNumGenerator orderNumGenerator = new OrderNumGenerator();
	
	List<OrderDTO> getOrderHistory(Integer mem_num);
	
	
}
