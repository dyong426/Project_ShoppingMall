<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="ko">

<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
 <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1, minimum-scale=1">
<title>juhee custom - 나만의 물건 제작하기</title>

<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65"
	crossorigin="anonymous">
<link rel="stylesheet" href="<%=request.getContextPath() %>/assets/user/home/css/main.css">
<link href="images/logo_mini.png" rel="shortcut icon"
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
				<button class="sign_in">로그인</button>
				<button onclick="location.href='<%=request.getContextPath() %>/cs'">고객센터</button>
			</div>
		</div>

		<!--로고, 카테고리, 프로필-->
		<div class="header_container_bottom">


			<div class="header_container_bottom_contents">
				<a href="<%=request.getContextPath() %>/main">
				<img src="<%=request.getContextPath() %>/assets/common/cstm_img/logo.png" alt="로고" width="170px" />
				</a>
			</div>


			<div class="header_container_bottom_contents">
				<a href="category_clothes.html">의류</a>
				<a href="#">액자</a>
				<a href="#">폰케이스/테크</a>
				<a href="#">홈데코/리빙</a>
			</div>

			<div class="header_container_bottom_contents">
				<span id="user_welcome_text">정수정님, 환영합니다.</span>
				<button id="myCart">
				<span class="material-symbols-outlined">shopping_cart</span>
				</button>
				<button id="myPage">

				<div>
					<span class="material-symbols-outlined">account_circle</span>

					<span id="drop-down_arrow" class="material-symbols-outlined">
						arrow_drop_down </span>
				</div>
				
				</button>
			</div>
		</div>
	</div>

	<!--마이페이지 드롭다운-->
	<div class="hidden myPage_container" id="myPage_drop-down">
		<button>주문 내역</button>
		<button>나의 리뷰</button>
		<button>나의 정보</button>
		<button>1:1 문의</button>
	</div>

	<!--로그인-->
	<!-- 로그인 팝업 -->
	<div class="login_popup hidden">
		<div class="login_container">
			<!-- 로고 & 닫기 버튼 -->
			<div>
				<span> <img src="<%=request.getContextPath() %>/assets/common/cstm_img/logo.png"
					width="135px" alt="로고">
				</span>
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


				<button id="kakao_login">
					<img width=20px; src="<%=request.getContextPath() %>/assets/common/cstm_img/kakao_logo.png" alt="">카카오 로그인
				</button>
				<button id="naver_login">
					<img width=20px; src="<%=request.getContextPath() %>/assets/common/cstm_img/naver_logo.png" alt="">네이버 로그인
				</button>



			</div>
		</div>

	</div>
		<!-- 회원가입 팝업 -->
		<div class="join_popup hidden">
			<div class="join_container">
				<!-- 로고 & 닫기 버튼 -->
				<div>
					<span> <img src="<%=request.getContextPath() %>/assets/common/cstm_img/logo.png" width="135px" alt="로고">
					</span>
					<button type="button" class="join_closeBtn">
						<span class="material-symbols-outlined"> close </span>
					</button>
				</div>

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

					<button id="kakao_login">
						<img width=20px; src="<%=request.getContextPath() %>/assets/common/cstm_img/kakao_logo.png" alt="">카카오 계정으로 가입
					</button>
					<button id="naver_login">
						<img width=20px; src="<%=request.getContextPath() %>/assets/common/cstm_img/naver_logo.png" alt="">네이버 계정으로 가입
					</button>


				</div>
			</div>
		</div>
