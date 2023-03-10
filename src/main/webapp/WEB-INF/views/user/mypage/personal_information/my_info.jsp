<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<jsp:include page="/WEB-INF/views/user/common/header.jsp" />
<link rel="stylesheet" href="<%=request.getContextPath() %>/assets/user/mypage/css/info.css">
	<c:set var="member" value="${sessionScope.member}" />
	

  <!-- main -->
  <div class="main">
    <div class="info_modify">
        <h1>나의 정보</h1>
        <div class="controls">
            <div class="email_ctr">
                <label for="">이메일</label>
                <div class="input">
                    <button class="btn_change_email" type="button">이메일 변경</button>
                </div>
            </div>
            <div class="pw_ctr">
                <label for="">비밀번호</label>
                <div class="input">
                <form action="/jhc/password/change" method="POST">
                    <button class="btn_change_pw" type="submit">비밀번호 변경 링크 받기 (이메일 전송)</button>
                </form>
                
                </div>
            </div>
    
            <div class="name_ctr">
                <label for="">이름</label>
                <div class="input">${member.mem_name }</div>
            </div>
                <div class="point_ctr">
                <label for="">보유 포인트</label>
                <div class="input">
                    <fmt:formatNumber value="${member.mem_point }" type="number" pattern="#,##0"/>포인트
                    
                </div>
            </div>
            
            <div class="birth_ctr">
                <label for="">생년월일</label>
                <div class="input">
                    <input type="text" inputmode="numeric" pattern="[0-9]" name="birth" value="${member.mem_birth }">
                    <span>ex) 990111</span>
                </div>
            </div>
            <div class="pn_ctr">
                <label for="">휴대전화번호</label>
                <div class="input">
                    <input type="text" inputmode="numeric" pattern="[0-9]" name="pn" value="${member.mem_phone }">
                    <span> - 없이 숫자만 입력해주세요</span>
                </div>
            </div>
            
        </div>
        <div class="buttons">
            <button class="modify" type="button" >변경</button>
            <button class="withdrawal" type="button">회원 탈퇴</button>
        </div>
    </div>
  </div>

 <footer>
   <jsp:include page="/WEB-INF/views/user/common/footer.jsp" />