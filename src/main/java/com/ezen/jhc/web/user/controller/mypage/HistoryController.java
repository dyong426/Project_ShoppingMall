package com.ezen.jhc.web.user.controller.mypage;


import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.ezen.jhc.common.util.OrderStatusConverter;
import com.ezen.jhc.web.user.dto.member.MemberDTO;
import com.ezen.jhc.web.user.dto.order.OrderDTO;
import com.ezen.jhc.web.user.service.mypage.HistoryService;

@Controller
public class HistoryController {

	@Autowired
	HistoryService historyService;
	
	@RequestMapping(value = "/history", method = RequestMethod.GET)
	public String mpHistory(HttpSession session, Model model) throws ParseException {
		if (session.getAttribute("member") == null) {
			return "user/common/loginPlease";
		}
		SimpleDateFormat myDate = new SimpleDateFormat("yyyy-MM-dds");
		
		MemberDTO member = (MemberDTO) session.getAttribute("member"); 
		OrderStatusConverter conv = new OrderStatusConverter();
		Integer mem_num = member.getMem_num();
	
		
		List<OrderDTO> orders = (List<OrderDTO>) historyService.getOrderHistory(mem_num);
		
		for(int i = 0; i < orders.size(); i++) {
			
			 String status = conv.orderStatusToKorean(Integer.parseInt(orders.get(i).getOrd_status()));
			 orders.get(i).setOrd_status(status);
			
			
			


	        
			
		}
		
		model.addAttribute("history", orders); 
		
		
		return "user/mypage/purchase/history";
	}

	@RequestMapping(value = "/details", method = RequestMethod.GET)
	public String mpDetails() {

		return "user/mypage/purchase/details";
	}

	@RequestMapping(value = "/er", method = RequestMethod.GET)
	public String orderER() {

		return "user/mypage/purchase/exchange_refund";
	}

	@RequestMapping(value = "/cancel", method = RequestMethod.GET)
	public String orderCancel() {

		return "user/mypage/purchase/cancel";
	}
}
