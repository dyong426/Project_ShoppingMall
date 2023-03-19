<!-- 정수정 -->
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<jsp:include page="/WEB-INF/views/user/common/header.jsp" />
<link rel="stylesheet" href="<%= request.getContextPath() %>/assets/user/mypage/personal_information/css/passwordChangeForm.css" />

<div class="password_change_container">

	<h3>새 비밀번호를 입력하세요.</h3>
		
	<form action="/jhc/member/reset/password" method="POST">
		<input type="password" class="password_change_input" name="mem_pw" />
		<input type="submit" class="password_change" value="변경하기"/>
		<input type="hidden" name="mem_email" value="${mem_email }"/>
	</form>
</div>



<jsp:include page="/WEB-INF/views/user/common/footer.jsp" />