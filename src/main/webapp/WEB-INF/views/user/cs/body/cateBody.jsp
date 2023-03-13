<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/assets/user/cs/css/category.css?after">

<jsp:include page="../body/body.jsp" />

<th colspan="2">
	<table id="faq_category_box" style="width: 1000px;">
		<tr class="cs_cate_body" style="width: 1000px;">
			<c:forEach items="${ctgr}" var="c">
			<th><a class="cate_body_ctgr" href="<%=request.getContextPath() %>/customerservice/cate?cs_ctgr_num=${c.cs_ctgr_num}"> ${c.cs_ctgr_name} </a></th>
			</c:forEach>
		</tr>