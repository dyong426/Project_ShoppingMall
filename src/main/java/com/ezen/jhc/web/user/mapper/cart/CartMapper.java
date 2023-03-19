package com.ezen.jhc.web.user.mapper.cart;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.ezen.jhc.web.user.dto.cart.CartDTO;
import com.ezen.jhc.web.user.dto.cart.OnlyCartDTO;

public interface CartMapper {

	public int insertCart(OnlyCartDTO cartDto);
	
	public List<CartDTO> getCarts(int mem_num);
	
	public void deleteCart(int cart_num);
	
	public void increaseQty(@Param("cart_num") int cart_num, @Param("p_price") int p_price);
	
	public void decreaseQty(@Param("cart_num") int cart_num, @Param("p_price") int p_price);
}
