<!-- 정수정, 로그인 요청 페이지 -->
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <link rel="stylesheet" href="assets/user/common/css/loginPlease.css" />
<jsp:include page="/WEB-INF/views/user/common/header.jsp"/>

<div class="please_login_container">
<span class="material-symbols-outlined" id="lock_person">
lock_person
</span>
    <h2><strong>로그인</strong>이 필요한 서비스입니다.<br></h2>
    <h4>홈페이지 우측 상단에서 로그인을 해주세요.</h4>
</div>
    
<jsp:include page="/WEB-INF/views/user/common/footer.jsp"/>