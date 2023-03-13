package com.ezen.jhc.web.user.mapper.order;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;

import com.ezen.jhc.web.user.dto.order.OrderDTO;

public interface OrderMapper {

@Select("select ord.ord_date, ord.ord_num, p.p_name, pi.origin_img_path, od.od_quantity, od.od_amount, ord_status from order_details od, orders ord, prod_images pi, prods p, prod_details pd where pd.pd_num = od.pd_num and p.p_num = pd.p_num and pi.p_num = p.p_num and od.ord_num = ord.ord_num and ord.mem_num = 3 order by ord.ord_date")
public List<OrderDTO> selectOrderHistory(@Param("mem_num")Integer mem_num);	
	
	
}
