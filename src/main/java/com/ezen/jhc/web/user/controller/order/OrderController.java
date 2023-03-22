package com.ezen.jhc.web.user.controller.order;

import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.ezen.jhc.web.user.dto.cart.CartDTO;
import com.ezen.jhc.web.user.dto.member.MemberDTO;
import com.ezen.jhc.web.user.dto.order.OrderDTO;
import com.ezen.jhc.web.user.service.cart.CartServiceImpl;
import com.ezen.jhc.web.user.service.member.MemberServiceImpl;
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
	
	@Autowired
	MemberServiceImpl memberService;
	
	
	@PostMapping("/directPurchase")
	public String directPurchase(HttpSession session, HttpServletRequest req, HttpServletResponse resp) {
		cartService.getCart(session, req);
		
		return "user/order/order";
	}
	
	@PostMapping("/fromCart")
	public String fromCart(HttpSession session, Model model) {
		int mem_num = ((MemberDTO)session.getAttribute("member")).getMem_num();
		List<CartDTO> carts = cartService.getCarts(mem_num, session, model);
		
		int totalPrice = 0;
		int totalQuantity = 0;
		
		for (CartDTO cart : carts) {
			totalPrice += cart.getCart_amount();
			totalQuantity += cart.getCart_quantity();
		}
		
		model.addAttribute("carts", carts);
		model.addAttribute("totalPrice", totalPrice);
		model.addAttribute("totalQuantity", totalQuantity);
		
		return "user/order/order";
	}
	
	@PostMapping("/completed")
	public String orderCompleted(HttpSession session, HttpServletRequest req) {
		OrderDTO orderDto = orderService.insertOrder(session, req);
		int ord_num = orderDto.getOrd_num();
		int totalAmount = orderDto.getTotal_amount();
		MemberDTO member = (MemberDTO)session.getAttribute("member");
		
		List<CartDTO> carts = new ArrayList<CartDTO>();
		if (req.getParameter("cart_num").isEmpty()) {
			carts = cartService.getCartsByMemNum(member.getMem_num());
			cartService.deleteCartsByMemNum(member.getMem_num());
		} else {
			carts.add(cartService.getCartByCartNum(Integer.parseInt(req.getParameter("cart_num"))));
			cartService.deleteCart(Integer.parseInt(req.getParameter("cart_num")));
		}
		
		// 포인트 사용 후 mem_point 업데이트
		MemberDTO memberDto = new MemberDTO();
		memberDto.setMem_num(member.getMem_num());
		if (!req.getParameter("mem_point").isEmpty()) {
			// 여기서 mem_point는 보유 포인트가 아닌 결제 시 사용한 포인트로 설정
			memberDto.setMem_point(Integer.parseInt(req.getParameter("mem_point")));
		} else {
			memberDto.setMem_point(0);
		}
		memberDto.setAdditionalPoint((int)Math.round(totalAmount * 0.05));
		memberService.updateMemPoint(memberDto);
		
		
		// 포인트 사용 or 개인정보 수정시 session에 있는 member 업데이트 해야함
		session.setAttribute("member", memberService.getMemByEmail(member.getMem_email()));
		orderService.insertOrderDetails(ord_num, carts);
		
		DateTimeFormatter format = DateTimeFormatter.ofPattern("yyyyMMdd");
		String now = LocalDate.now().format(format);
		req.setAttribute("now", now);
		
		return "user/order/orderCompleted";
	}

}
