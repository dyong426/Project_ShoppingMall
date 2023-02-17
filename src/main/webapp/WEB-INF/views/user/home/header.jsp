<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>


<!DOCTYPE html>
<html lang="ko">

<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>JUHEE CUSTOM - 나만의 물건 제작하기</title>

<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
<link rel="stylesheet" href="assets/user/home/css/main.css">
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
				<button>고객센터</button>
			</div>
		</div>

		<!--로고, 카테고리, 프로필-->
		<div class="header_container_bottom">

			<div>
				<img src="assets/common/cstm_img/logo.png" alt="로고" width="170px" />
			</div>


			<div>
				<a href="category_clothes.html">의류</a> <a href="#">액자</a> <a
					href="#">폰케이스/테크</a> <a href="#">홈데코/리빙</a>
			</div>

			<div>
			<span id="user_welcome_text">정수정님, 환영합니다.</span>
				<button id="myPage">
					<img width=30px; src="assets/common/cstm_img/profile.png" alt="" />
					<span id="drop-down_arrow" class="material-symbols-outlined"> arrow_drop_down </span>
				</button>
			</div>
		</div>
	</div>

	<!--마이페이지 드롭다운-->
	<div class="hidden container" id="myPage_drop-down">
		<button>주문 내역</button>
		<button>나의 리뷰</button>
		<button>나의 정보</button>
		<button>1:1 문의</button>
	</div>