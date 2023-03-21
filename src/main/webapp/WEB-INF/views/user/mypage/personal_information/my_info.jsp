<!-- 김주희, 정수정 - 나의 정보 -->
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<jsp:include page="/WEB-INF/views/user/common/header.jsp" />
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/assets/user/mypage/css/info.css">
<c:set var="member" value="${sessionScope.member}" />


<!-- main -->
<div class="main">
	<div class="info_modify">
		<h1>나의 정보</h1>
		<div class="controls">
			<div class="email_ctr">
				<label>이메일 또는 아이디</label>
				<div class="input">${member.mem_email }</div>
			</div>
			<div class="pw_ctr">
				<label for="">비밀번호</label>
				<div class="input">
					<button class="btn_change_pw" type="submit">비밀번호 변경 링크 받기 (이메일 전송)</button>

				</div>
			</div>

			<div class="name_ctr">
				<label for="">이름</label>
				<div class="input">${member.mem_name }</div>
			</div>
			<div class="point_ctr">
				<label for="">보유 포인트</label>
				<div class="input"><fmt:formatNumber value="${member.mem_point }" type="number"
						pattern="#,##0" />포인트</div>
			</div>

			<form>
				
				<div class="birth_ctr">
					<label for="">생년월일</label>
					<div class="input">
						<input id="myInfo_birth" type="text" inputmode="numeric"
							pattern="[0-9]" name="birth" value="${member.mem_birth }"
							placeholder="예) 990110">
	
					</div>
				</div>
				<div class="pn_ctr">
					<label for="">휴대전화번호</label>
					<div class="input">
						<input id="myInfo_phone" type="text" inputmode="numeric"
							pattern="[0-9]" name="pn" value="${member.mem_phone }"
							placeholder="예) 010-1234-1234">
					</div>
				</div>
				
				<div>
				<input class="modify" type="submit" value="정보 변경" /> 
				</div>
			</form>
			
		</div>
			<div class="buttons">
			<button class="withdrawal" type="button">회원 탈퇴</button>
			</div>
	</div>
</div>
<script>
	var mem_num = "${member.mem_num}";
</script>

	<jsp:include page="/WEB-INF/views/user/common/footer.jsp" />