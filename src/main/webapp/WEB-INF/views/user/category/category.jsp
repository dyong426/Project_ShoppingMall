<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<%@ include file="../common/header.jsp" %>
<link rel="stylesheet" href="<%=request.getContextPath() %>/assets/user/home/css/category.css" />
<title>juhee custom - ${mainCtgr}</title>

  <div class="main_container_category">

   <%@ include file="side_bar.jsp" %>

    <!-- 본문 (상품)-->
    <div id="category_main_products">
      <!-- 검색 창 -->
      <c:forEach items="${products}" var="prod">
      <div class="products">
        <a href="#">
        	<img src="<%=request.getContextPath() %>/${prod.p_info_img_path }" alt="" />
        </a>
        <!--상품명-->
        <div class="product_name">${prod.p_name }</div>
        <!--상품가격-->
        <div class="product_price"><fmt:formatNumber value="${prod.p_price }" pattern="￦#,###"/></div>
      </div>
      </c:forEach>

    </div>

  </div>

<%@ include file="../common/footer.jsp" %>