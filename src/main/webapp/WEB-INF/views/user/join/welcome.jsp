<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../common/header.jsp"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<link rel="stylesheet" href="<%=request.getContextPath() %>/assets/user/member/css/welcome.css" />

<div class="join_welcome_container">
	<span class="join_welcome_image">
	<img width=270px; src="<%=request.getContextPath() %>/assets/common/cstm_img/member/welcome.png" alt="welcome" />
	</span>
	
	<div class="join_welcome_text">
		
		<div>환영합니다!</div>
		<div>${mem_name }님, 회원가입을 축하합니다.</div>
		<div class="join_welcome_text_bar"></div>
		<div class="join_welcome_text_email">이메일 주소<span>${mem_email }</span></div>
		<div class="join_welcome_text_date">가입일
			<span>
				<script>
				date = new Date().toLocaleDateString();
				document.write(date);
				</script>
			</span>
		</div>
		<div class="join_welcome_text_bar_2"></div>
		<div class="join_user_benefits_container">
			<div>회원혜택</div>
			<div>
				<ul class="join_welcome_benefits_list">
					<li>회원 등급별 다양한 이벤트 및 쿠폰 제공</li>
					<li>쇼핑 구매액의 5% 포인트 적립</li>
					<li>상품평 작성하면 최대 25,000포인트 적립</li>
				</ul>
			</div>
		</div>
		
		<div class="join_welcome_text_bar"></div>
	</div>
</div>




<%@ include file="../common/footer.jsp"%>