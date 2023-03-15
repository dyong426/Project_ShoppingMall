package com.ezen.jhc.web.user.service.order;

import java.io.File;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ezen.jhc.web.user.dto.cart.CartDTO;
import com.ezen.jhc.web.user.dto.cstm.MemberCstmDTO;
import com.ezen.jhc.web.user.dto.member.MemberAddressDTO;
import com.ezen.jhc.web.user.dto.member.MemberDTO;
import com.ezen.jhc.web.user.dto.order.IntoOrderDTO;
import com.ezen.jhc.web.user.mapper.cart.CartMapper;
import com.ezen.jhc.web.user.mapper.member.OrdererMapper;
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

}
