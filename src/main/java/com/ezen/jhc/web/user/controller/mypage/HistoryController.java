package com.ezen.jhc.web.user.controller.mypage;


import java.text.ParseException;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.ezen.jhc.web.user.dto.member.MemberDTO;
import com.ezen.jhc.web.user.dto.order.OrderDTO;
import com.ezen.jhc.web.user.dto.order.OrderDetailDTO;
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
		
		MemberDTO member = (MemberDTO) session.getAttribute("member"); 
		
		Integer mem_num = member.getMem_num();
		
		List<OrderDTO> orders = historyService.getOrderHistory(mem_num);
		
		
		model.addAttribute("orders", orders); 
			return "user/mypage/purchase/history";
	}

	@GetMapping(value="/history/selected")
	public String historySelected(HttpSession session, Model model, @RequestParam("select_order_status")String ord_status, @RequestParam("select_start_date")String start_date, @RequestParam("select_end_date")String end_date) {
		
	MemberDTO member = (MemberDTO) session.getAttribute("member"); 
		
		Integer mem_num = member.getMem_num();
		List<OrderDTO> orders = historyService.getOrderHistorySelectedAll(mem_num, ord_status, start_date, end_date);
		
		System.out.println(mem_num + ord_status + start_date + end_date);
		
		
		model.addAttribute("orders", orders);
		
		return "user/mypage/purchase/history";
	}
	
	@RequestMapping(value = "/details", method = RequestMethod.GET)
	public String mpDetails(Model model, HttpSession session, @RequestParam(value="ord_num", required=false) Integer ord_num) {

		MemberDTO member = (MemberDTO) session.getAttribute("member");
		Integer mem_num = member.getMem_num();
		String mem_name = member.getMem_name();
		
		OrderDTO order = historyService.getAll(mem_num, ord_num);
	
		List<OrderDetailDTO> orderDetails = historyService.getOrderDetails(ord_num);
		
		model.addAttribute("mem_name", mem_name);
		model.addAttribute("order", order);
		model.addAttribute("orderDetails", orderDetails);
				
		
		return "user/mypage/purchase/details";
	}

	// 주문 취소
	@PostMapping(value = "/order/cancel")
	@ResponseBody
	public void orderCancel(@RequestParam(value="ord_num", required=false)Integer ord_num) {
		
		
		historyService.orderCancel(ord_num);
	}
	
	@RequestMapping(value = "/er", method = RequestMethod.GET)
	public String orderER() {

		return "user/mypage/purchase/exchange_refund";
	}

	
}
