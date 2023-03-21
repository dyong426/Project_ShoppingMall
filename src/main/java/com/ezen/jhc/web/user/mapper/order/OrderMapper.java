package com.ezen.jhc.web.user.mapper.order;

import java.util.List;

import com.ezen.jhc.web.user.dto.cart.CartDTO;
import com.ezen.jhc.web.user.dto.member.MemberAddressDTO;
import com.ezen.jhc.web.user.dto.order.OrderDTO;

public interface OrderMapper {
	
	public int insertOrder(OrderDTO orderDto);

	public void saveAddr(MemberAddressDTO memberAddressDto);
	
	public void notSaveAddr(int mem_num);
	
	public void insertAddr(MemberAddressDTO memberAddressDto);
	
	public void insertOrderDetails(CartDTO cart);
	
	public int getOrderId();
}
