package com.ezen.jhc.web.user.mapper.order;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import com.ezen.jhc.web.user.dto.order.OrderDTO;
import com.ezen.jhc.web.user.dto.order.OrderDetailDTO;

/**@author SUJEONG*/
public interface OrderMapper {

	
	// 전체 조회
	@Select("SELECT t.status_name, t.ord_date, t.p_num, t.ord_num, t.p_name, t.origin_img_path, t.od_quantity, t.od_amount, t.ord_status FROM (SELECT os.status_name, ord.ord_date, p.p_num, ord.ord_num, p.p_name, pi.origin_img_path, od.od_quantity, od.od_amount, ord.ord_status, ROW_NUMBER() OVER (PARTITION BY ord.ord_num ORDER BY ord.ord_date DESC, ord.ord_num DESC) as rn FROM order_statuses os, order_details od, orders ord, prod_images pi, prods p, prod_details pd WHERE pd.pd_num = od.pd_num AND p.p_num = pd.p_num AND pi.p_num = p.p_num AND od.ord_num = ord.ord_num AND ord.ord_status = os.ord_status AND ord.mem_num = #{mem_num}) t WHERE t.rn = 1")
	public List<OrderDTO> selectOrderHistory(@Param("mem_num") Integer mem_num);

	// 상태 & 날짜별 조회
	@Select("SELECT t.status_name, t.ord_date, t.p_num, t.ord_num, t.p_name, t.origin_img_path, t.od_quantity, t.od_amount, t.ord_status FROM (SELECT os.status_name, ord.ord_date, p.p_num, ord.ord_num, p.p_name, pi.origin_img_path, od.od_quantity, od.od_amount, ord.ord_status, ROW_NUMBER() OVER (PARTITION BY ord.ord_num ORDER BY ord.ord_date DESC, ord.ord_num DESC) as rn FROM order_statuses os, order_details od, orders ord, prod_images pi, prods p, prod_details pd WHERE pd.pd_num = od.pd_num AND p.p_num = pd.p_num AND pi.p_num = p.p_num AND od.ord_num = ord.ord_num AND ord.ord_status = os.ord_status AND ord.mem_num = #{mem_num} AND ord.ord_status = #{ord_status} AND ord.ord_date >= TO_DATE(#{start_date}, 'YY/MM/DD') AND ord.ord_date <=TO_DATE(#{end_date},'YY/MM/DD')) t WHERE t.rn = 1")
	public List<OrderDTO> selectOrderHistorySelected(@Param("mem_num") Integer mem_num, @Param("ord_status")String ord_status, @Param("start_date")String start_date, @Param("end_date")String end_date);
	
	// 상태만 조회
	@Select("SELECT t.status_name, t.ord_date, t.p_num, t.ord_num, t.p_name, t.origin_img_path, t.od_quantity, t.od_amount, t.ord_status FROM (SELECT os.status_name, ord.ord_date, p.p_num, ord.ord_num, p.p_name, pi.origin_img_path, od.od_quantity, od.od_amount, ord.ord_status, ROW_NUMBER() OVER (PARTITION BY ord.ord_num ORDER BY ord.ord_date DESC, ord.ord_num DESC) as rn FROM order_statuses os, order_details od, orders ord, prod_images pi, prods p, prod_details pd WHERE pd.pd_num = od.pd_num AND p.p_num = pd.p_num AND pi.p_num = p.p_num AND od.ord_num = ord.ord_num AND ord.ord_status = os.ord_status AND ord.mem_num = #{mem_num} AND ord.ord_status = #{ord_status} AND ord.ord_date >= TO_DATE(ADD_MONTHS(TO_DATE(sysdate, 'YY/MM/DD'), -3), 'YY/MM/DD') AND ord.ord_date <= sysdate) t WHERE t.rn = 1")
	public List<OrderDTO> selectOrderHistoryStatusSelected(@Param("mem_num")Integer mem_num, @Param("ord_status")String ord_status);
	
	// 날짜만 조회
	@Select("SELECT t.status_name, t.ord_date, t.p_num, t.ord_num, t.p_name, t.origin_img_path, t.od_quantity, t.od_amount, t.ord_status FROM (SELECT os.status_name, ord.ord_date, p.p_num, ord.ord_num, p.p_name, pi.origin_img_path, od.od_quantity, od.od_amount, ord.ord_status, ROW_NUMBER() OVER (PARTITION BY ord.ord_num ORDER BY ord.ord_date DESC, ord.ord_num DESC) as rn FROM order_statuses os, order_details od, orders ord, prod_images pi, prods p, prod_details pd WHERE pd.pd_num = od.pd_num AND p.p_num = pd.p_num AND pi.p_num = p.p_num AND od.ord_num = ord.ord_num AND ord.ord_status = os.ord_status AND ord.mem_num = #{mem_num} AND ord.ord_date >= TO_DATE(#{start_date}, 'YY/MM/DD') AND ord.ord_date <=TO_DATE(#{end_date},'YY/MM/DD')) t WHERE t.rn = 1")
	public List<OrderDTO> selectOrderHistoryDateSelected(@Param("mem_num")Integer mem_num, @Param("start_date")String start_date, @Param("end_date")String end_date);
	
	@Select("select * from order_statuses os, orders ord, payments p where mem_num =  #{mem_num} and ord_num = #{ord_num} and ord.payment_num = p.payment_num and ord.ord_status = os.ord_status")
	public OrderDTO selectAll(@Param("mem_num") Integer mem_num, @Param("ord_num") Integer ord_num);

	@Select("select * from prods p, prod_images pi, prod_details pd, order_details od where pd.pd_num = od.pd_num and pd.p_num = p.p_num and pi.p_num = p.p_num and od.ord_num = #{ord_num}")
	public List<OrderDetailDTO> selectOrderDetails(Integer ord_num);
	
	@Update("update orders set ord_status = 5 where ord_num = #{ord_num}")
	public void cancleOrder(Integer ord_num);
	
	// 주문 상품 교환
	@Update("update orders set ord_status = 6 where ord_num = #{ord_num}")
	public void exchangeOrder(Integer ord_num);
	
	// 주문 상품 환불
	@Update("update orders set ord_status = 7 where ord_num = #{ord_num}")
	public void refundOrder(Integer ord_num);
}

