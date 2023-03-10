<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<%@ include file="../common/header.jsp"%>
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.6.1/css/all.css">
<link rel="stylesheet" href="<%=request.getContextPath()%>/assets/user/category/css/category.css" />
<title>juhee custom - ${mainCtgr}</title>

<div class="main_container_category">

	<%@ include file="side_bar.jsp"%>


	<!-- 검색 창 -->

	 <div class="search-box">
	 	<form id="search_box" action="/jhc/products/search">
	     <input type="text" class="search-txt" name="keyword" placeholder="검색어를 입력하세요.">
	     <button type="submit" class="search-btn"><i class="fas fa-search"></i></button>
	 	</form>
	   </div>


	<!-- 본문 (상품)-->
	<div id="category_main_products">
		<c:forEach items="${products}" var="prod">
			<div class="products">
				<a href="/jhc/product_details?product_num=${prod.p_num}">
				
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

	</div>

</div>

<%@ include file="../common/footer.jsp"%>