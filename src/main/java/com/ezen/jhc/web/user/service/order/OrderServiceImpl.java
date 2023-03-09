package com.ezen.jhc.web.user.service.order;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ezen.jhc.web.user.dto.member.MemberAddressDTO;
import com.ezen.jhc.web.user.dto.member.MemberDTO;
import com.ezen.jhc.web.user.mapper.member.OrdererMapper;

@Service
public class OrderServiceImpl implements OrderService {

	@Autowired
	OrdererMapper ordererMapper;
	
	@Override
	public MemberDTO getMemberByNum(int mem_num) {
		
		return ordererMapper.getMemberByNum(mem_num);
	}

	@Override
	public MemberAddressDTO getAddressByNum(int mem_num) {
		
		return ordererMapper.getAddressByNum(mem_num);
	}
	
	
}
