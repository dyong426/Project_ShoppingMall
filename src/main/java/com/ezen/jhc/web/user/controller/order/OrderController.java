package com.ezen.jhc.web.user.controller.order;

import java.util.Date;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

import com.ezen.jhc.web.user.dto.member.MemberAddressDTO;
import com.ezen.jhc.web.user.dto.member.MemberDTO;
import com.ezen.jhc.web.user.service.order.OrderServiceImpl;

import lombok.extern.log4j.Log4j2;

@Controller
@Log4j2
public class OrderController {

	@Autowired
	OrderServiceImpl orderService;
	
	@GetMapping("/order")
	public String order(HttpSession session) {
		
		// 임시 정보
		session.setAttribute("member", new MemberDTO(1, "dslkjf@naver.com", "2132", "1985/02/21", "두리두하", "01050505050", null, new Date(810501231065145L), 7832));
		
		MemberAddressDTO memberAddress = orderService.getAddressByNum(1);
		
		session.setAttribute("memberAddress", memberAddress);
		
		return "user/order/order";
	}
	
}
