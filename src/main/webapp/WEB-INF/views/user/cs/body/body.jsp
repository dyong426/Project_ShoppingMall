<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="UTF-8"%>

<jsp:include page="/WEB-INF/views/user/common/header.jsp" />
<link rel="stylesheet" href="<%=request.getContextPath() %>/assets/user/cs/css/cs.css">

<div id="cs_center_container">
	<div id="cs_container">
		<h1>고객센터</h1>
		<table id="cs_body">

			<tr id="cs_nav">
				<th><a href="<%=request.getContextPath() %>/customerservice">FAQ</a></th>
				<th><a href="<%=request.getContextPath() %>/customerservice/con">1:1 문의</a></th>
			</tr>