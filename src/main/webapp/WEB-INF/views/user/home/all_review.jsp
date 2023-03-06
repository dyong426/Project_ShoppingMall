<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<jsp:include page="/WEB-INF/views/user/common/header.jsp" />

<link rel="stylesheet"
	href="<%=request.getContextPath()%>/assets/user/home/css/review.css">

<div id="all_review_background">

	<div id="all_review_main_container">
		<div id="all_review_title">
			<h3>전체 리뷰</h3><p>(${review_size})</p>
		</div>
		<div id="all_review_list">
	<c:forEach items="${all_reviews}" var="r">
			<div class="all_review_list">
				<a
					href="<%=request.getContextPath()%>/review?review_num=${r.review_num}">
					<div class="all_review_list_box">
						<div class="all_reivew_info_box">
							<div class="all_review_info">

								<div class="re_created_at">${r.review_regdate }</div>
								<div class="re_star">${r.star }</div>
								<div class="re_user_name">${r.user_name }</div>
							</div>
							<div class="all_review_content">${r.review_content }</div>
						</div>

						<div class="all_review_img">
						<c:if test="${not empty r.review_image_path}">	
							<img
					src="<%=request.getContextPath()%>/${r.review_image_path}" />
						</c:if>
						</div>
						


					</div>
				</a>
			</div>

</c:forEach>
		</div>

	</div>


</div>


<footer>
	<jsp:include page="/WEB-INF/views/user/common/footer.jsp" />