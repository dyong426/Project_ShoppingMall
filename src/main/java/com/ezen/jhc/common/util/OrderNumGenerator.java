package com.ezen.jhc.common.util;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;

import com.ezen.jhc.web.user.dto.order.OrderDTO;

/**
 * @author SUJEONG
 * 주문 번호 생성
 * */
@Configuration
public class OrderNumGenerator {

	@Bean
	public String getOrderNum(OrderDTO orderDTO) {
		// 주문번호 : 날짜 + 시간 + 오더번호 [20230310-16511]
		
		String orderNumber = orderDTO.getOrd_date() + "-" + orderDTO.getOrd_num();
		
		System.out.println(orderNumber);
		return orderNumber;
				
		
	}
	
}
