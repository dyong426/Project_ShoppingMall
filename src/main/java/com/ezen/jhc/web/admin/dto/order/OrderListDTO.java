package com.ezen.jhc.web.admin.dto.order;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;

import lombok.Data;

@Data
public class OrderListDTO {	
	
	private List<OrderDetailDTO> orderDetails;

}
