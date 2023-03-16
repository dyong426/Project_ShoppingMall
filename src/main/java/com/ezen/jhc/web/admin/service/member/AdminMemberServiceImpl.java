package com.ezen.jhc.web.admin.service.member;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ezen.jhc.web.admin.dto.member.MemberDTO;
import com.ezen.jhc.web.admin.dto.order.OrderDetailDTO;
import com.ezen.jhc.web.admin.dto.order.OrderListDTO;
import com.ezen.jhc.web.admin.mapper.member.AdminMemberMapper;
import com.ezen.jhc.web.admin.mapper.order.OrderMapper;

import lombok.extern.log4j.Log4j2;

@Log4j2
@Service
public class AdminMemberServiceImpl implements AdminMemberService{
	
	@Autowired(required = false)
	List<OrderDetailDTO> memberOrderDetails;
	
	@Autowired(required = false)
	OrderListDTO memberOrders;
	
	@Autowired(required = false)
	List<OrderListDTO> memberOrderList;
	
	
	@Autowired
	AdminMemberMapper memberMapper;
	
	@Autowired
	OrderMapper orderMapper;
	
	@Override
	public List<MemberDTO> getMemberList() {
		
		return memberMapper.getMembers();
	}
	
	@Override
	public MemberDTO getMemberInfo(Integer mem_num) {
		
		return memberMapper.getMember(mem_num);
	}
	
	@Override
	public List<OrderListDTO> getMemberRecentOrderList(Integer mem_num) {
		
		int[] recentOrderNums = new int[5]; 
		recentOrderNums = orderMapper.getMemberRecentOrders(mem_num);
		
		List<OrderListDTO> memberOrderList = new ArrayList();
		for (Integer ord_num : recentOrderNums) {
			
			
			memberOrderDetails = orderMapper.getOrderDetails(ord_num);
			
			OrderListDTO memberOrders = new OrderListDTO(); 
			memberOrders.setOrderDetails(memberOrderDetails);
		
			memberOrderList.add(memberOrders);
		}
		
		return memberOrderList;
	}

}
