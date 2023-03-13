<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<jsp:include page="/WEB-INF/views/user/common/header.jsp" />
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/assets/user/mypage/contact/css/mp_contact_list.css?after">

<div class="mp_contact_main">
	<div class="mp_contact_container">

		<div class="mp_my_contact_title">
			<h1>나의 문의</h1>
		</div>
		<c:forEach items="${contact}" var="c">
			<div id="my_con_box">
				<div id="mp_con_cont">
					<div class="mp_cont">
						<label for="">제목 </label>
						<div class="mp_container mp_title">${c.contact_title}</div>
					</div>

					<br>

					<div class="mp_cont">
						<label for="">문의사항 </label>
						<div class="mp_container mp_contents">

							<c:if test="${!empty c.contact_image_path}">
								<div id="mp_contact_img_container">

									<img
										src="<%=request.getContextPath()%>/assets/user/mypage/contact/img/026.jpg"
										style="width: 300px; heigth: 300px;">
								</div>
							</c:if>

							${c.contact_content} 

						</div>
					</div>

					<br>



					<div id="mp_con_answer">
						<div class="mp_cont">
							<label for="">답변 </label>
							<div class="mp_container mp_contents">${c.admin_reply}</div>
						</div>

					</div>

					<div class="mp_cont">
						<div id="mp_list_back">
							<a href="<%=request.getContextPath()%>/contact"> 돌아가기 </a>
						</div>
					</div>

				</div>


			</div>

		</c:forEach>
	</div>

</div>



<footer>
	<jsp:include page="/WEB-INF/views/user/common/footer.jsp" />