<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<jsp:include page="/WEB-INF/views/user/common/header.jsp" />
<link rel="stylesheet" href="<%=request.getContextPath() %>/assets/user/mypage/contact/css/emptyContact.css">

<div id="emptyNotice">
	<span class="material-symbols-outlined">visibility_off</span>
	<div class="subTitle">문의하신 내역이 없습니다.</div>
</div>

<jsp:include page="/WEB-INF/views/user/common/footer.jsp" />