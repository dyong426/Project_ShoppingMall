<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<jsp:include page="/WEB-INF/views/user/common/header.jsp" />
<link rel="stylesheet" href="<%=request.getContextPath() %>/assets/user/mypage/css/info.css">


  <!-- main -->
  <div class="main">
    <div class="info_modify">
        <h1>개인 정보</h1>
        <div class="controls">
            <div class="email_ctr">
                <label for="">이메일</label>
                <div class="input">
                    abc123@naver.com
                    <button class="btn_change_email" type="button">이메일 변경</button>
                </div>
            </div>
            <div class="pw_ctr">
                <label for="">비밀번호</label>
                <div class="input">
                    <button class="btn_change_pw" type="button">비밀번호 변경 이메일 받기</button>
                </div>
            </div>
            <div class="point_ctr">
                <label for="">포인트</label>
                <div class="input">
                    0p
                </div>
            </div>
            <div class="nn_ctr">
                <label for="">닉네임</label>
                <div class="input">
                    <input type="text" name="nick_name" value>
                </div>
            </div>
            <div class="birth_ctr">
                <label for="">생년월일</label>
                <div class="input">
                    <input type="text" inputmode="numeric" pattern="[0-9]" name="birth" value>
                    <span>ex) 19990111</span>
                </div>
            </div>
            <div class="name_ctr">
                <label for="">이름</label>
                <div class="input">
                    <input type="text" name="name" value="이젠">
                </div>
            </div>
            <div class="pn_ctr">
                <label for="">휴대전화번호</label>
                <div class="input">
                    <input type="text" inputmode="numeric" pattern="[0-9]" name="pn" value>
                    <span>- 없이 숫자만 입력해주세요</span>
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