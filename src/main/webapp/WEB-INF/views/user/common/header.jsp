<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="ko">

<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<<<<<<< HEAD
 <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1, minimum-scale=1">


=======
<meta name="viewport"
	content="width=device-width, initial-scale=1.0, maximum-scale=1, minimum-scale=1">
<title>JUHEE CUSTOM - 나만의 물건 제작하기</title>
<!--  부트스트랩  -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
>>>>>>> refs/heads/je

<<<<<<< HEAD
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65"
	crossorigin="anonymous">

<link rel="stylesheet" href="<%=request.getContextPath() %>/assets/user/common/css/header.css">
<link rel="stylesheet" href="<%=request.getContextPath() %>/assets/user/common/css/footer.css">
<link href="<%=request.getContextPath() %>/assets/common/cstm_img/logo/logo_mini.png" rel="shortcut icon"
=======

<link rel="stylesheet"
	href="<%=request.getContextPath()%>/assets/user/home/css/main.css">
<link href="images/logo_mini.png" rel="shortcut icon"
>>>>>>> refs/heads/je
	type="image/x-icon">

<link rel="stylesheet"
	href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@48,400,0,0" />

</head>


<body>

	<!-- header -->

	<div class="header_container">

		<!--회원가입, 로그인, 고객센터-->
		<div id="header_top">
			<div>
				<button class="sign_up">회원가입</button>
<<<<<<< HEAD
				<button class="sign_in" id="sign_in" onclick="logout();">로그인</button>
				<button onclick="location.href='<%=request.getContextPath() %>/cs'">고객센터</button>
=======
				<button class="sign_in">로그인</button>
				<button onclick="location.href='<%=request.getContextPath()%>/cs'">고객센터</button>
>>>>>>> refs/heads/je
			</div>
		</div>

		<!--로고, 카테고리, 프로필-->
		<div class="header_container_bottom">

<<<<<<< HEAD

			<div class="header_container_bottom_contents">
=======
			<div>

>>>>>>> refs/heads/je
				<a href="<%=request.getContextPath() %>/main">
<<<<<<< HEAD
				<img src="<%=request.getContextPath() %>/assets/common/cstm_img/logo/logo.png" alt="로고" width="170px" />
=======
				<img src="<%=request.getContextPath() %>/assets/common/cstm_img/logo.png" alt="로고" width="170px" />
>>>>>>> refs/heads/je
				</a>
			</div>

			<div class="header_container_bottom_contents">
				<a href="/category_clothes">의류</a>
				<a href="/category_phone_case">폰케이스/테크</a>
				<a href="/category_home">홈데코/리빙</a>
				<a href="/category_frame">액자</a>
			</div>

			<div class="header_container_bottom_contents">
				<span class="hidden_visibility user_welcome_text">정수정님, 환영합니다.</span>
				<button id="myCart">
				<span class="material-symbols-outlined">shopping_cart</span>
				</button>
				<button id="myPage">
<<<<<<< HEAD

				<div>
					<span class="material-symbols-outlined">person</span>

					<span id="drop-down_arrow" class="material-symbols-outlined">
						arrow_drop_down </span>
				</div>
				
=======
					<img width=30px;
						src="<%=request.getContextPath()%>/assets/common/cstm_img/profile.png"
						alt="" /> <span id="drop-down_arrow"
						class="material-symbols-outlined"> arrow_drop_down </span>
>>>>>>> refs/heads/je
				</button>
			</div>
		</div>
	</div>

	<!--마이페이지 드롭다운-->
	<div class="hidden myPage_container" id="myPage_drop-down">
		<button>주문 내역</button>
		<button>나의 리뷰</button>
		<button>나의 정보</button>
		<button onclick="location.href='#'">문의 내역</button>
	</div>

	<!--로그인-->
	<!-- 로그인 팝업 -->
	<div class="login_popup hidden">
		<div class="login_container">
			<!-- 로고 & 닫기 버튼 -->
<<<<<<< HEAD
			<div class="popup_logo">
				<div> <img src="<%=request.getContextPath() %>/assets/common/cstm_img/logo/logo.png"
=======
			<div>
				<span> <img
					src="<%=request.getContextPath()%>/assets/common/cstm_img/logo.png"
>>>>>>> refs/heads/je
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
					<input id="login_email" type="text" placeholder="이메일 주소" /> <input
						id="login_pw" type="password" placeholder="비밀번호" /> <input
						id="login_submit" type="submit" value="로그인" />
				</form>

				<div class="or_container">
					<div></div>
					<div>또는</div>
					<div></div>
				</div>


<<<<<<< HEAD
				<button id="kakao_login" onclick="kakaoLogin(); requestUserInfo();">
					<img src="<%=request.getContextPath() %>/assets/common/cstm_img/kakao_login.png" alt="">
=======
				<button id="kakao_login">
					<img width=20px;
						src="<%=request.getContextPath()%>/assets/common/cstm_img/kakao_logo.png"
						alt="">카카오 로그인
>>>>>>> refs/heads/je
				</button>
<<<<<<< HEAD
				<button id="naver_login" onclick="naverIdLogin_loginButton();">
					<img width=20px; src="<%=request.getContextPath() %>/assets/common/cstm_img/naver_logo.png" alt="">네이버 로그인
=======
				<button id="naver_login">
					<img width=20px;
						src="<%=request.getContextPath()%>/assets/common/cstm_img/naver_logo.png"
						alt="">네이버 로그인
>>>>>>> refs/heads/je
				</button>



			</div>
		</div>

	</div>
<<<<<<< HEAD
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
=======
	<!-- 회원가입 팝업 -->
	<div class="join_popup hidden">
		<div class="join_container">
			<!-- 로고 & 닫기 버튼 -->
			<div>
				<span> <img
					src="<%=request.getContextPath()%>/assets/common/cstm_img/logo.png"
					width="135px" alt="로고">
				</span>
				<button type="button" class="join_closeBtn">
					<span class="material-symbols-outlined"> close </span>
				</button>
			</div>

			<div id="bar"></div>
			<div>
				<div id="text_join">회원가입</div>
				<form onsubmit="return false;">
					<input id="join_email" type="text" placeholder="이메일 주소" /> <input
						id="join_name" type="text" placeholder="이름" /> <input
						id="join_pw" type="password" placeholder="비밀번호" /> <input
						id="join_submit" onclick="join_check();" type="submit"
						value="가입하기" />
				</form>

				<div class="or_container">
					<div></div>
					<div>또는</div>
					<div></div>
>>>>>>> refs/heads/je
				</div>

<<<<<<< HEAD
				<div id="bar"></div>
				<div>
					<div id="text_join">회원가입</div>
					<form onsubmit="return false;">
						<input id="join_email" type="text" placeholder="이메일 주소" />
						<input id="join_name" type="text" placeholder="이름" />
						<input id="join_pw" type="password" placeholder="비밀번호" />
						<input id="join_submit" onclick="join_check();" type="submit" value="가입하기" />
					</form>

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
=======
				<button id="kakao_login">
					<img width=20px;
						src="<%=request.getContextPath()%>/assets/common/cstm_img/kakao_logo.png"
						alt="">카카오 계정으로 가입
				</button>
				<button id="naver_login">
					<img width=20px;
						src="<%=request.getContextPath()%>/assets/common/cstm_img/naver_logo.png"
						alt="">네이버 계정으로 가입
				</button>
>>>>>>> refs/heads/je


			</div>
		</div>
	</div>