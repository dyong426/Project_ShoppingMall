<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">

<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1, minimum-scale=1">
<link rel="stylesheet" href="<%=request.getContextPath() %>/assets/user/common/css/header.css?after">
<link rel="stylesheet" href="<%=request.getContextPath() %>/assets/user/common/css/footer.css">
<link href="<%=request.getContextPath() %>/assets/common/cstm_img/logo/logo_mini.png" rel="shortcut icon" type="image/x-icon">
<link rel="stylesheet"
   href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@48,400,0,0" />
</head>

<body>
   <!-- header -->
   <div class="header_container">

      <!--회원가입, 로그인, 고객센터-->
      <div id="header_top">
         <div>
            <button class="sign_up" id="sign_up">회원가입</button>
            <button class="sign_in" id="sign_in" value="login">로그인</button>
            <button onclick="location.href='<%=request.getContextPath() %>/cs'">고객센터</button>
         </div>
      </div>
      
      <!--로고, 카테고리, 프로필-->
      <div class="header_container_bottom">
			<div class="header_container_bottom_contents">
				<a href="<%=request.getContextPath() %>/main">
				<img src="<%=request.getContextPath() %>/assets/common/cstm_img/logo/logo.png" alt="로고" width="170px" />
				</a>
			</div>

			<div class="header_container_bottom_contents">
				<a href="/jhc/main_category?m_ctgr_num=1">의류</a>
				<a href="/jhc/main_category?m_ctgr_num=2">폰케이스/테크</a>
				<a href="/jhc/main_category?m_ctgr_num=3">홈데코/리빙</a>
				<a href="/jhc/main_category?m_ctgr_num=4">액자</a>
			</div>
		<c:set var="member" value="${sessionScope.member }"/>
		
			<div class="header_container_bottom_contents">
				<span class="user_welcome_text hidden_visilbility" id="user_welcome_text">${member.mem_name}님, 환영합니다.</span>
				<button id="myCart">
				<span class="material-symbols-outlined">shopping_cart</span>
				</button>
				<button id="myPage">

				<div>
					<span class="material-symbols-outlined">person</span>

					<span id="drop-down_arrow" class="material-symbols-outlined">
						arrow_drop_down </span>
				</div>
				
				</button>
			</div>
		</div>
	</div>

	<!--마이페이지 드롭다운-->
	<div class="hidden myPage_container" id="myPage_drop-down">
      <button onclick="location.href='<%=request.getContextPath() %>/history'">주문 내역</button>
      <button onclick="location.href='<%=request.getContextPath() %>/writeable_reviews'">나의 리뷰</button>
      <button onclick="location.href='<%=request.getContextPath() %>/info'">나의 정보</button>
      <button onclick="location.href='#'">문의 내역</button>
   </div>

   <!--로그인-->
   <!-- 로그인 팝업 -->
   <div class="login_popup hidden">
      <div class="login_container">
         <!-- 로고 & 닫기 버튼 -->
         <div class="popup_logo">
            <div> <img src="<%=request.getContextPath() %>/assets/common/cstm_img/logo/logo.png"
               width="135px" alt="로고">
            </div>
            <button type="button" class="login_closeBtn">
               <span class="material-symbols-outlined"> close </span>
            </button>
         </div>

         <div id="bar"></div>
         <div>
            <div id="text_login">로그인</div>
            <form>
               <input id="login_email" type="text" placeholder="이메일 주소" />
               <input id="login_pw" type="password" placeholder="비밀번호" />
               <input id="login_submit" type="submit" value="로그인" />
            </form>

            <div class="or_container">
               <div></div>
               <div>또는</div>
               <div></div>
            </div>


            <button id="kakao_login" onclick="kakaoLogin(); requestUserInfo();">
               <img src="<%=request.getContextPath() %>/assets/common/cstm_img/kakao_login.png" alt="">
            </button>
            <button id="naver_login" onclick="naverIdLogin_loginButton();">
               <img width=20px; src="<%=request.getContextPath() %>/assets/common/cstm_img/naver_logo.png" alt="">네이버 로그인
            </button>



         </div>
      </div>

   </div>
      <!-- 회원가입 팝업 -->
      <div class="join_popup hidden">
         <div class="join_container">
            <!-- 로고 & 닫기 버튼 -->
            <div class="popup_logo">
               <div> <img src="<%=request.getContextPath() %>/assets/common/cstm_img/logo/logo.png" width="135px" alt="로고">
               </div>
               <button type="button" class="join_closeBtn">
                  <span class="material-symbols-outlined"> close </span>
               </button>
            </div>

            <div id="bar"></div>
            <div>
               <div id="text_join">회원가입</div>
               <form action="/jhc/join_member" method="POST" >
                  <input id="mem_email" name="mem_email" type="text" placeholder="이메일 주소" />
                  <input id="mem_name" name="mem_name" type="text" placeholder="이름" />
                  <input id="mem_pw" name="mem_pw" type="password" placeholder="비밀번호" />
                  <input id="join_submit" type="submit" onclick="join_check();" value="가입하기" />
               </form>
               
               ${email }

					<div class="join_error_wrap hidden_visibility" id="error_message_join" style="display: block;">에러 메세지</div>
                                
					<div class="or_container">
						<div></div>
						<div>또는</div>
						<div></div>
					</div>


               <div class="login_error_wrap" id="err_empty_pw" style="display: block;">
                        <div class="error_message">
                            <strong>비밀번호</strong>를 입력해 주세요.
                        </div>
                    </div>
                                
               <div class="or_container">
                  <div></div>
                  <div>또는</div>
                  <div></div>
               </div>
               <button id="kakao_login" onclick="kakaoLogin(); requestUserInfo();">
                  <img src="<%=request.getContextPath() %>/assets/common/cstm_img/kakao_join.png" alt="카카오로 시작하기">
               </button>

               <button id="naver_login" onclick="naverIdLogin_loginButton;">
                  <img width=20px; src="<%=request.getContextPath() %>/assets/common/cstm_img/naver_logo.png" alt="">네이버 계정으로 가입
               </button>

            </div>
         </div>
      </div>