package com.ezen.jhc.web.user.mapper.order;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import com.ezen.jhc.web.user.dto.order.OrderDTO;
import com.ezen.jhc.web.user.dto.order.OrderDetailDTO;

public interface OrderMapper {

	@Select("SELECT t.ord_date, t.p_num, t.ord_num, t.p_name, t.origin_img_path, t.od_quantity, t.od_amount, t.ord_status FROM (SELECT ord.ord_date, p.p_num, ord.ord_num, p.p_name, pi.origin_img_path, od.od_quantity, od.od_amount, ord.ord_status, ROW_NUMBER() OVER (PARTITION BY ord.ord_num ORDER BY ord.ord_date DESC, ord.ord_num DESC) as rn FROM order_details od, orders ord, prod_images pi, prods p, prod_details pd WHERE pd.pd_num = od.pd_num AND p.p_num = pd.p_num AND pi.p_num = p.p_num AND od.ord_num = ord.ord_num AND ord.mem_num = #{mem_num}) t WHERE t.rn = 1")
	public List<OrderDTO> selectOrderHistory(@Param("mem_num") Integer mem_num);

	@Select("select * from orders ord, payments p where mem_num =  #{mem_num} and ord_num = #{ord_num} and ord.payment_num = p.payment_num")
	public OrderDTO selectAll(@Param("mem_num") Integer mem_num, @Param("ord_num") Integer ord_num);

	@Select("select * from prods p, prod_images pi, prod_details pd, order_details od where pd.pd_num = od.pd_num and pd.p_num = p.p_num and pi.p_num = p.p_num and od.ord_num = #{ord_num}")
	public List<OrderDetailDTO> selectOrderDetails(Integer ord_num);

	@Update("update orders set ord_status = 4 where ord_num = #{ord_num}")
	public void cancleOrder(Integer ord_num);
}

