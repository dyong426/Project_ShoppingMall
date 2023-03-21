<!-- 정수정 -->
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<jsp:include page="/WEB-INF/views/user/common/header.jsp" />
<link rel="stylesheet" href="<%=request.getContextPath() %>/assets/user/mypage/personal_information/css/passwordChangeComplete.css" />

<div class="passwordChangeComplete_container">
		<span class="material-symbols-outlined" id="lock_reset">lock_reset</span>
		<h2>비밀번호 변경 완료<br></h2>
		<div>비밀번호 변경이 완료 되었습니다.<br>새로운 비밀번호로 로그인해주세요.</div>
</div>
		
		
<jsp:include page="/WEB-INF/views/user/common/footer.jsp" />
