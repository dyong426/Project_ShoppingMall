package com.ezen.jhc.web.user.service.order;


import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ezen.jhc.web.user.dto.cart.CartDTO;
import com.ezen.jhc.web.user.dto.member.MemberAddressDTO;
import com.ezen.jhc.web.user.dto.member.MemberDTO;
import com.ezen.jhc.web.user.dto.order.OrderDTO;
import com.ezen.jhc.web.user.mapper.cart.CartMapper;
import com.ezen.jhc.web.user.mapper.member.OrdererMapper;
import com.ezen.jhc.web.user.mapper.order.OrderMapper_dy;
import com.ezen.jhc.web.user.mapper.prod.ProductMapper;

import lombok.extern.log4j.Log4j2;

@Service
@Log4j2
public class OrderServiceImpl implements OrderService {

	@Autowired
	OrdererMapper ordererMapper;
	
	@Autowired
	ProductMapper prodMapper;
	
	@Autowired
	CartMapper cartMapper;
	
	@Autowired
	OrderMapper_dy orderMapper;
	
	
	@Override
	public MemberDTO getMemberByNum(int mem_num) {
		return ordererMapper.getMemberByNum(mem_num);
	}
	
	@Override
	public MemberAddressDTO getAddressByNum(int mem_num) {
		MemberAddressDTO memAddressDto = ordererMapper.getAddressByNum(mem_num);
		
		if (memAddressDto == null) {
			return null;
		} else if (memAddressDto.getAddr_save() == 0) {
			return null;
		}
		return memAddressDto;
	}

	@Override
	public OrderDTO insertOrder(HttpSession session, HttpServletRequest req) {
		int mem_num = ((MemberDTO)session.getAttribute("member")).getMem_num();
		int addr_save = req.getParameter("addr_save").equals("on") ? 1 : 0;
		
		OrderDTO orderDto = new OrderDTO();
		orderDto.setMem_num(mem_num);
		orderDto.setOrd_zipcode(Integer.parseInt(req.getParameter("ord_zipCode")));
		orderDto.setOrd_addr1(req.getParameter("ord_addr1"));
		orderDto.setOrd_addr2(req.getParameter("ord_addr2"));
		orderDto.setReceiver_name(req.getParameter("receiver_name"));
		orderDto.setReceiver_phone(req.getParameter("receiver_phone"));
		orderDto.setTotal_amount(Integer.parseInt(req.getParameter("total_amount")));
		orderDto.setOrd_request(req.getParameter("ord_request"));
		orderDto.setPayment_num(Integer.parseInt(req.getParameter("payment_num")));
		orderDto.setOrd_status(req.getParameter("payment_num").equals("1") ? "0" : "1");
		
		orderMapper.insertOrder(orderDto);
		
		req.setAttribute("order", orderDto);
		
		MemberAddressDTO memberAddressDto = new MemberAddressDTO(
				mem_num,
				req.getParameter("ord_zipCode"),
				req.getParameter("ord_addr1"),
				req.getParameter("ord_addr2"),
				addr_save);
		
		if (addr_save == 1) {
			if (getAddressByNum(mem_num) == null) {
				orderMapper.insertAddr(memberAddressDto);
			} else {
				orderMapper.saveAddr(memberAddressDto);
			}
		} else {
			if (getAddressByNum(mem_num) != null) {
				orderMapper.notSaveAddr(mem_num);
			}
		}
		return orderDto;
	}

	@Override
	public void insertOrderDetails(int ord_num, List<CartDTO> carts) {
		for (CartDTO cart : carts) {
			cart.setOrd_num(ord_num);
			orderMapper.insertOrderDetails(cart);
		}
	}
	
}
