<!-- 정수정, 메일 전송 완료 페이지-->
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<link rel="stylesheet"
	href="<%=request.getContextPath() %>/assets/user/mypage/personal_information/css/mail.css" />
<jsp:include page="/WEB-INF/views/user/common/header.jsp" />


<c:set var="member" value="${sessionScope.member }" />

<div class="mail_container">
	<span class="material-symbols-outlined" id="mail"> mail </span>
	<h3>비밀번호 변경 링크를 다음 메일 주소로 보냈습니다.</h3>
	<h4 style="color:gray">메일함을 확인해주세요.</h4>
	<div class="mail_mem_email">「${member.mem_email }」</div>
</div>


<jsp:include page="/WEB-INF/views/user/common/footer.jsp" />