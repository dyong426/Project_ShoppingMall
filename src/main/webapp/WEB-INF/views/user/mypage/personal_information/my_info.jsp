<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<jsp:include page="/WEB-INF/views/user/common/header.jsp" />
<link rel="stylesheet" href="<%=request.getContextPath() %>/assets/user/mypage/css/info.css">
	<c:set var="member" value="${sessionScope.member}" />

  <!-- main -->
  <div class="main">
    <div class="info_modify">
        <h1>나의 정보</h1>
        <div class="controls">
            <div class="email_ctr">
                <label>이메일</label>
                <div class="input">${member.mem_email }</div>
            </div>
            <div class="pw_ctr">
                <label for="">비밀번호</label>
                <div class="input">
                
                    <button class="btn_change_pw" type="submit" onclick="location.href='/jhc/password/change'">비밀번호 변경 이메일 받기</button>
                
                </div>
            </div>
    
            <div class="name_ctr">
                <label for="">이름</label>
                <div class="input">${member.mem_name }</div>
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
            <button class="modify" type="button">변경</button>
            <button class="withdrawal" type="button">회원 탈퇴</button>
        </div>
    </div>
  </div>

 <footer>
   <jsp:include page="/WEB-INF/views/user/common/footer.jsp" />