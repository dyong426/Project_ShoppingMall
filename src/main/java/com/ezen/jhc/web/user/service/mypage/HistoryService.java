package com.ezen.jhc.web.user.service.mypage;

import java.util.Date;
import java.util.List;

import org.springframework.stereotype.Service;

import com.ezen.jhc.web.user.dto.order.OrderDTO;
import com.ezen.jhc.web.user.dto.order.OrderDetailDTO;

/**
 * @author SuJeong
 * 주문 내역
 * */

@Service
public interface HistoryService {
	
	// 모든 주문 내역 (order마다 한 행만 가져옴)
	List<OrderDTO> getOrderHistory(Integer mem_num);
	
	// 상태, 날짜 모두 선택 된 경우
	List<OrderDTO> getOrderHistorySelectedAll(Integer mem_num, String ord_status, String start_date, String end_date);
	
	// 상태만 선택 된 경우
	List<OrderDTO> getOrderHistoryStatusSelected(Integer mem_num, String ord_status);
	
	// 날짜만 선택 된 경우
	List<OrderDTO> getOrderHistoryDateSelected(Integer mem_num, String start_date, String end_date);
	
	OrderDTO getOrderAll(Integer mem_num, Integer ord_num);
	
	// 상세 주문 내역
	List<OrderDetailDTO> getOrderDetails(Integer ord_num);
	
	// 주문 취소
	void orderCancel(Integer ord_num);

}
