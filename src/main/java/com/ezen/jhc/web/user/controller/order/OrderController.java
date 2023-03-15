package com.ezen.jhc.web.user.controller.order;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.ezen.jhc.web.user.dto.cart.CartDTO;
import com.ezen.jhc.web.user.dto.member.MemberAddressDTO;
import com.ezen.jhc.web.user.dto.member.MemberDTO;
import com.ezen.jhc.web.user.service.cart.CartServiceImpl;
import com.ezen.jhc.web.user.service.order.OrderServiceImpl;

import lombok.extern.log4j.Log4j2;

@Controller
@Log4j2
@RequestMapping("/order")
public class OrderController {

	@Autowired
	OrderServiceImpl orderService;
	
	@Autowired
	CartServiceImpl cartService;
	
	@PostMapping("/directPurchase")
	public String order(HttpSession session, HttpServletRequest req, Model model) {				
		// 임시 정보
		session.setAttribute("member", new MemberDTO(1, "dslkjf@naver.com", "2132", "1985/02/21", "두리두하", "01050505050", null, new Date(810501231065145L), 7832));
		
		MemberDTO member = (MemberDTO) session.getAttribute("member");
		
		MemberAddressDTO memberAddress = orderService.getAddressByNum(member.getMem_num());
		
		session.setAttribute("memberAddress", memberAddress);
		
		List<CartDTO> list = new ArrayList<CartDTO>();
		list.add(cartService.getCartDto(member.getMem_num(), req));
		
		model.addAttribute("cartDto", list);
		
		return "user/order/order";
	}
	
	@PostMapping("/fromCart")
	public String order2(HttpSession session, HttpServletRequest req, Model model) {
		List<CartDTO> list = cartService.getCarts(((MemberDTO)session.getAttribute("member")).getMem_num());
		model.addAttribute("cartDto", list);
		
		return "user/order/order";
	}

}
