package com.ezen.jhc.web.user.service.cart;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.http.ResponseEntity;
import org.springframework.ui.Model;

import com.ezen.jhc.web.user.dto.cart.CartDTO;
import com.ezen.jhc.web.user.dto.cart.IntoCartDTO;
import com.ezen.jhc.web.user.dto.cart.OnlyCartDTO;
import com.ezen.jhc.web.user.dto.cstm.MemberCstmDTO;

public interface CartService {
	
	public int insertCart(MemberCstmDTO cstmDto, IntoCartDTO cartDto);
	
	public void getCartDto(HttpSession session, HttpServletRequest req, HttpServletResponse resp);
	
	public List<CartDTO> getCarts(int mem_num, HttpSession session, Model model);
	
	public void deleteCart(int cart_num);
	
	public void createCart(OnlyCartDTO cartDto);
	
	public void increaseQty(int cart_num, int p_price);
	
	public void decreaseQty(int cart_num, int p_price);
}
