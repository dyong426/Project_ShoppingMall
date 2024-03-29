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
							<img style="max-width: 300px; max-height: 300px;"
					src="<%=request.getContextPath()%>/display/image?fileName=${r.review_image_path}" />
						</c:if>
						</div>

			<div id="review_content_box">
				<div id="re_info">

					<div id="re_user_name">${r.user_name}</div>
					<div class="re_star">${r.star}</div>
					<div id="re_created_at">${r.review_regdate }</div>


				</div>

				<div id="review_contents">
					<div id="re_comment"><pre><p>${r.review_content}<p></pre></div>
				</div>


			</div>
		</div>

		<div id="review_pro_box">

			<a href="<%=request.getContextPath()%>/prodDetail?p_num=${r.p_num}">
				<div id="review_pro" style="padding:0px;">
					<div id="review_info_img" style="padding:5px;">
						<img src="<%=request.getContextPath() %>/${r.origin_img_path }" style="width: 70px; padding-top:0px;"/>
					</div>
					<div style="padding:20px;">
						<p>${r.p_name}</p>
					</div>
				</div>
			</a>
			<a id="review_back" href="<%=request.getContextPath()%>/main">
				HOME 
			</a>
			<a id="review_all" href="<%=request.getContextPath()%>/allreview">
				전체리뷰
			</a>
			
		</div>
</c:forEach>
	</div>

</div>


<footer>
	<jsp:include page="/WEB-INF/views/user/common/footer.jsp" />