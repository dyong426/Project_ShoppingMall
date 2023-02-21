<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>


<jsp:include page="../body/body.jsp" />


<th colspan="2">
	<table id="faq_category_box" style="width: 1000px;">
		<tr class="cs_cate_body" style="width: 1000px;">
			<th><a href="<%=request.getContextPath() %>/cs/order_pay"> 주문 / 결제 </a></th>
			<th><a href="<%=request.getContextPath() %>/cs/shipping"> 배송 </a></th>
			<th><a href="<%=request.getContextPath() %>/cs/cancel_refund"> 취소 / 환불 </a></th>
			<th><a href="<%=request.getContextPath() %>/cs/return_exchange"> 반품 / 교환 </a></th>
			<th><a href="<%=request.getContextPath() %>/cs/etc"> 기타 </a></th>
		</tr>