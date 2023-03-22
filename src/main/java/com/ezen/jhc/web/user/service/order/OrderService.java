package com.ezen.jhc.web.user.service.order;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import com.ezen.jhc.web.user.dto.cart.CartDTO;
import com.ezen.jhc.web.user.dto.member.MemberAddressDTO;
import com.ezen.jhc.web.user.dto.member.MemberDTO;
import com.ezen.jhc.web.user.dto.order.OrderDTO;

public interface OrderService {

	public MemberDTO getMemberByNum(int mem_num);
	
	public MemberAddressDTO getAddressByNum(int mem_num);
	
	public OrderDTO insertOrder(HttpSession session, HttpServletRequest req);
	
	public void insertOrderDetails(int ord_num, List<CartDTO> carts);
}
