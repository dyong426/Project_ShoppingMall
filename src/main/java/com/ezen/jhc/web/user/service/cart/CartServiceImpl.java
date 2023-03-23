package com.ezen.jhc.web.user.service.cart;

import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import com.ezen.jhc.web.user.dto.cart.CartDTO;
import com.ezen.jhc.web.user.dto.cart.IntoCartDTO;
import com.ezen.jhc.web.user.dto.cart.OnlyCartDTO;
import com.ezen.jhc.web.user.dto.cstm.MemberCstmDTO;
import com.ezen.jhc.web.user.dto.member.MemberAddressDTO;
import com.ezen.jhc.web.user.dto.member.MemberDTO;
import com.ezen.jhc.web.user.dto.prod.ProductDetailDTO;
import com.ezen.jhc.web.user.mapper.cart.CartMapper;
import com.ezen.jhc.web.user.mapper.cstm.CstmMapper;
import com.ezen.jhc.web.user.mapper.member.OrdererMapper;
import com.ezen.jhc.web.user.mapper.order.OrderMapper_dy;
import com.ezen.jhc.web.user.mapper.prod.ProductMapper;

import lombok.extern.log4j.Log4j2;

@Service
@Log4j2
public class CartServiceImpl implements CartService {

	@Autowired
	CartMapper cartMapper;
	
	@Autowired
	ProductMapper prodMapper;
	
	@Autowired
	CstmMapper cstmMapper;
	
	@Autowired
	OrdererMapper ordererMapper;
	
	@Autowired
	OrderMapper_dy orderMapper;
	
	
	@Override
	public int insertCart(MemberCstmDTO cstmDto, IntoCartDTO cartDto) {
		ProductDetailDTO prodDetailDto = prodMapper.getProdDetailByIntoCartDto(cartDto);
		prodDetailDto.setP_name(cartDto.getP_name());
		
		int pd_num = prodDetailDto.getPd_num();
		
		OnlyCartDTO onlyCartDto = new OnlyCartDTO(
				cstmDto.getMem_num(), pd_num, cstmDto.getMem_cstm_num(), cartDto.getCart_quantity(), cartDto.getP_price());
		
		cartMapper.insertCart(onlyCartDto);
		
		return onlyCartDto.getCart_num();
	}
	
	@Override
	public List<CartDTO> getCarts(int mem_num, HttpSession session, Model model) {
		MemberAddressDTO memberAddress = ordererMapper.getAddressByNum(mem_num);
		model.addAttribute("memberAddress", memberAddress);
		model.addAttribute("orderId", orderMapper.getOrderId());
		
		LocalDateTime now = LocalDateTime.now();		
		DateTimeFormatter format = DateTimeFormatter.ofPattern("yyyyMMdd");
		String formatNow = now.format(format);
		
		model.addAttribute("now", now);
		
		return cartMapper.getCarts(mem_num);
	}
	
	@Override
	public void getCart(HttpSession session, HttpServletRequest req) {
		MemberDTO member = (MemberDTO) session.getAttribute("member");
		MemberAddressDTO memberAddress = ordererMapper.getAddressByNum(member.getMem_num());
		req.setAttribute("memberAddress", memberAddress);
		req.setAttribute("orderId", orderMapper.getOrderId());
		
		List<CartDTO> carts = new ArrayList<CartDTO>();
		
		carts.add(cartMapper.getCart(Integer.parseInt(req.getParameter("cart_num"))));
		
		req.setAttribute("carts", carts);
		req.setAttribute("cart_num", carts.get(0).getCart_num());
		req.setAttribute("totalPrice", carts.get(0).getCart_amount());
		req.setAttribute("totalQuantity", carts.get(0).getCart_quantity());
	}
	
	// 실패작
	@Override
	public void getCartDto(HttpSession session, HttpServletRequest req, HttpServletResponse resp) {
//		MemberDTO member = (MemberDTO) session.getAttribute("member");
//		MemberAddressDTO memberAddress = ordererMapper.getAddressByNum(member.getMem_num());
//		req.setAttribute("memberAddress", memberAddress);
//		
//		DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd");
//		String newFolder = LocalDateTime.now().format(formatter).replace("-", File.separator);
//		String image = "C:\\upload\\" + newFolder + File.separator + req.getParameter("mem_cstm_path");
//		
//		int pd_num = prodMapper.getProdDetailByIntoCartDto(
//				new IntoCartDTO(
//						Integer.parseInt(req.getParameter("p_num")),
//						Integer.parseInt(req.getParameter("p_price")),
//						req.getParameter("pc_name"),
//						req.getParameter("ps_name"),
//						req.getParameter("p_name"))).getPd_num();
//		
//		List<CartDTO> list = new ArrayList<CartDTO>();
//		list.add(new CartDTO(
//					member.getMem_num(),
//					pd_num,
//					Integer.parseInt(req.getParameter("p_num")),
//					req.getParameter("p_name"),
//					Integer.parseInt(req.getParameter("p_price")),
//					req.getParameter("pc_name"),
//					req.getParameter("ps_name"),
//					image,
//					1,
//					Integer.parseInt(req.getParameter("p_price"))));
//		req.setAttribute("carts", list);
//		req.setAttribute("totalPrice", list.get(0).getCart_amount());
//		req.setAttribute("totalQuantity", list.get(0).getCart_quantity());
	}

	@Override
	public void deleteCart(int cart_num) {
		cartMapper.deleteCart(cart_num);
	}	
	
	@Override
	public void createCart(OnlyCartDTO cartDto) {
		cartMapper.createCart(cartDto);
	}

	@Override
	public void increaseQty(int cart_num, int p_price) {
		cartMapper.increaseQty(cart_num, p_price);
	}

	@Override
	public void decreaseQty(int cart_num, int p_price) {
		cartMapper.decreaseQty(cart_num, p_price);
	}

	@Override
	public void deleteCartsByMemNum(int mem_num) {
		cartMapper.deleteCartsByMemNum(mem_num);
	}

	@Override
	public CartDTO getCartByCartNum(int cart_num) {
		return cartMapper.getCart(cart_num);
	}

	@Override
	public List<CartDTO> getCartsByMemNum(int mem_num) {
		return cartMapper.getCarts(mem_num);
	}

}
