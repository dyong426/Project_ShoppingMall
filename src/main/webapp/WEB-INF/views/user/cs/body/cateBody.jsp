<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>


<jsp:include page="../body/body.jsp" />


<th colspan="2">
	<table id="faq_category_box" style="width: 1000px;">
		<tr class="cs_cate_body" style="width: 1000px;">
			<th><a href="<%=request.getContextPath() %>/customerservice/cate?faq_ctgr=0"> 주문 / 결제 </a></th>
			<th><a href="<%=request.getContextPath() %>/customerservice/cate?faq_ctgr=1"> 배송 </a></th>
			<th><a href="<%=request.getContextPath() %>/customerservice/cate?faq_ctgr=2"> 취소 / 환불 </a></th>
			<th><a href="<%=request.getContextPath() %>/customerservice/cate?faq_ctgr=3"> 반품 / 교환 </a></th>
			<th><a href="<%=request.getContextPath() %>/customerservice/cate?faq_ctgr=4"> 기타 </a></th>
		</tr>