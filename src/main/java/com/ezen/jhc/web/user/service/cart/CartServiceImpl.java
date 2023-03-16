package com.ezen.jhc.web.user.service.cart;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.io.InputStream;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.io.IOUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Service;

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
	
	@Override
	public int insertCart(MemberCstmDTO cstmDto, IntoCartDTO cartDto) {		
		ProductDetailDTO prodDetailDto = prodMapper.getProdDetailByIntoCartDto(cartDto);
		prodDetailDto.setP_name(cartDto.getP_name());
		
		int pd_num = prodDetailDto.getPd_num();
		
		OnlyCartDTO onlyCartDto = new OnlyCartDTO(cstmDto.getMem_num(), pd_num, cstmDto.getMem_cstm_num(), cartDto.getP_price());
		
		return cartMapper.insertCart(onlyCartDto);
	}
	
	@Override
	public List<CartDTO> getCarts(int mem_num) {
		return cartMapper.getCarts(mem_num);
	}
	
	@Override
	public void getCartDto(HttpSession session, HttpServletRequest req, HttpServletResponse resp) {
		MemberDTO member = (MemberDTO) session.getAttribute("member");		
		MemberAddressDTO memberAddress = ordererMapper.getAddressByNum(member.getMem_num());		
		session.setAttribute("memberAddress", memberAddress);		
				
		DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd");		
		String newFolder = LocalDateTime.now().format(formatter).replace("-", File.separator);		
		String image = "C:\\upload\\cstm_img\\" + newFolder + File.separator + req.getParameter("mem_cstm_path");
		
		int pd_num = prodMapper.getProdDetailByIntoCartDto(
				new IntoCartDTO(
						Integer.parseInt(req.getParameter("p_num")),
						Integer.parseInt(req.getParameter("p_price")),
						req.getParameter("pc_name"),
						req.getParameter("ps_name"),
						req.getParameter("p_name"))).getPd_num();
		
		List<CartDTO> list = new ArrayList<CartDTO>();
		list.add(new CartDTO(
					member.getMem_num(),
					pd_num,
					Integer.parseInt(req.getParameter("p_num")),
					req.getParameter("p_name"),
					Integer.parseInt(req.getParameter("p_price")),
					req.getParameter("pc_name"),
					req.getParameter("ps_name"),
					image,
					1,
					Integer.parseInt(req.getParameter("p_price"))));
		req.setAttribute("cart", list);
		log.info(image);
	}

}
