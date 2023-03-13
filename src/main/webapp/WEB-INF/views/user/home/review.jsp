<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<jsp:include page="/WEB-INF/views/user/common/header.jsp" />

<link rel="stylesheet"
	href="<%=request.getContextPath()%>/assets/user/home/css/review.css?after">

<div id="review_main_container">
	<div id="re_title">
		<h1>REVIEW</h1>
	</div>
	<div id="re_box">

	<c:forEach items="${review}" var="r">

		<div id="review_con">
			<div id="review_img">
				<c:if test="${not empty r.review_image_path}">	
							<img
					src="<%=request.getContextPath()%>/${r.review_image_path}" />
						</c:if>
						</div>

			<div id="review_content_box">
				<div id="re_info">

					<div id="re_user_name">${r.user_name}</div>
					<div class="re_star">${r.star}</div>
					<div id="re_created_at">${r.review_regdate }</div>


				</div>

				<div id="review_contents">
					<div id="re_comment">${r.review_content}</div>
				</div>


			</div>
		</div>

		<div id="review_pro_box">

			<a href="<%=request.getContextPath()%>/product_details?product_num=${p_num}">
				<div id="review_pro">
					<div>
						<img src="<%=request.getContextPath()%>/${r.sm_img_path}">
					</div>
					<div>
						<p>${r.p_name}</p>
					</div>
				</div>
			</a>
			<a id="review_back" href="<%=request.getContextPath()%>/main">
				돌아가기 
			</a>
			<a id="review_all" href="<%=request.getContextPath()%>/allreview?page=1">
				전체리뷰
			</a>
			
		</div>
</c:forEach>
	</div>

</div>


<footer>
	<jsp:include page="/WEB-INF/views/user/common/footer.jsp" />