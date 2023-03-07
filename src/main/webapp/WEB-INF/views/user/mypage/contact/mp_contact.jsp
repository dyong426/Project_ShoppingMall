<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="UTF-8"%>

<jsp:include page="/WEB-INF/views/user/common/header.jsp" />
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/assets/user/mypage/contact/css/mp_contact_list.css">

<div class="mp_contact_main">
	<div class="mp_contact_box">

		<div class="mp_contact_title">
			<h1>나의 문의</h1>
		</div>

		<div>
			<div id="mp_con_cont">
				<div class="mp_cont">
					<label for="">제목 </label>
					<div class="mp_container mp_title">제목입니다 제목</div>
				</div>

				<br>

				<div class="mp_cont">
					<label for="">문의사항 </label>
					<div class="mp_container mp_contents">
						<img
							src="<%=request.getContextPath()%>/assets/user/mypage/contact/img/026.jpg"
							style="width: 300px; heigth: 300px;">


					</div>
				</div>
				
				<br>

				
				
				<div id="mp_con_answer">
				<div class="mp_cont">
					<label for="">답변 </label>
					<div class="mp_container mp_contents">
						답변입니다 답변답변

					</div>
				</div>
			
			</div>
			<div class="mp_cont">
					<div id="mp_list_back">
						<a href="<%=request.getContextPath()%>/contact"> 돌아가기 </a>
					</div>
				</div>
			</div>
			
			
		</div>


	</div>

</div>



<footer>
	<jsp:include page="/WEB-INF/views/user/common/footer.jsp" />