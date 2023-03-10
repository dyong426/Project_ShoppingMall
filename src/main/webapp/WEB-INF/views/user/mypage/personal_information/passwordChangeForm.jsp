<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<jsp:include page="/WEB-INF/views/user/common/header.jsp" />


	<h2>새 비밀번호를 입력하세요.</h2>
		
	<form action="/jhc/member/reset/password" method="POST">
		<input type="text" name="mem_pw" />
		<input type="submit" value="변경"/>
		<input type="hidden" name="mem_email" value="${mem_email }"/>
	</form>



<jsp:include page="/WEB-INF/views/user/common/footer.jsp" />