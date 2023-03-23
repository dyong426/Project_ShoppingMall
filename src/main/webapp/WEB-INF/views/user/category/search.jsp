<!-- 정수정, 제품 검색 -->
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ include file="../common/header.jsp"%>
<title>juhee custom - 검색 결과</title>
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/assets/user/category/css/search.css" />

	<div class="research_result">
		<h1>"${keyword }"의 검색 결과입니다.</h1>
	</div>
	
	<div id="category_main_products">

	<c:if test="${empty products || empty keyword }">
		<div>
		검색 결과가 없습니다.
		</div>
	</c:if>


		<c:if test="${not empty keyword }">
	
	
			<c:forEach items="${products}" var="prod">
				<div class="products">
					<a href="<%=request.getContextPath()%>/product_details?product_num=${prod.p_num}">
					<img
						src="<%=request.getContextPath() %>/${prod.p_info_img_path }" alt="" />
					</a>
					<!--상품명-->
					<div class="product_name">${prod.p_name }</div>
					<!--상품가격-->
					<div class="product_price">
						<fmt:formatNumber value="${prod.p_price }" pattern="￦#,###" />
					</div>
				</div>
			</c:forEach>
		</c:if>
		


	</div>


<%@ include file="../common/footer.jsp"%>