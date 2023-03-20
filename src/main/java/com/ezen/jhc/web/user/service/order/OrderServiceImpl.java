package com.ezen.jhc.web.user.service.order;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ezen.jhc.web.user.dto.member.MemberAddressDTO;
import com.ezen.jhc.web.user.dto.member.MemberDTO;
import com.ezen.jhc.web.user.dto.order.OrderDTO;
import com.ezen.jhc.web.user.mapper.cart.CartMapper;
import com.ezen.jhc.web.user.mapper.member.OrdererMapper;
import com.ezen.jhc.web.user.mapper.order.OrderMapper;
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
	OrderMapper orderMapper;
	
	
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
	public void updateAddr(HttpSession session, HttpServletRequest req) {
		
		int mem_num = 1;//((MemberDTO)session.getAttribute("member")).getMem_num();
		int addr_save = req.getParameter("addr_save").equals("on") ? 1 : 0;
		
		if (addr_save == 1) {
			OrderDTO orderDto = new OrderDTO();
			orderDto.setMem_num(mem_num);
			orderDto.setOrd_addr1(req.getParameter("ord_addr1"));
			orderDto.setOrd_addr2(req.getParameter("ord_addr2"));
			orderDto.setMem_zipcode(Integer.parseInt(req.getParameter("ord_zipCode")));
			orderDto.setAddr_save(addr_save);
			
			if (getAddressByNum(mem_num) == null) {
				orderMapper.insertAddr(orderDto);
			} else {
				orderMapper.saveAddr(orderDto);
			}
		} else {
			if (getAddressByNum(mem_num) != null) {
				orderMapper.notSaveAddr(mem_num);
			}
		}		
	}
	
}
