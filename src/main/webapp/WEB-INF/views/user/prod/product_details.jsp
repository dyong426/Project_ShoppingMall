<!-- 정수정, 제품 상세 페이지 -->
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ include file="../common/header.jsp"%>
	<title>juhee custom - ${prod.p_name }</title>
	<link rel="stylesheet" href="assets/user/prod/css/product_detail.css" />

    <!-- main -->
    <div id="main_container">
        <!--canvas-->
        <div id="main_canvas_container"><span>canvas by 이동용, 상품 번호 = ${prod.p_num }</span></div>

        <br><br><br><br><br>
        <!-- 상품 정보 -->

        
    <!-- 리뷰 -->
    <div class="subject">고객 리뷰</div>
    <div id="main_review_container">
        <!--구매고객 총 평점-->
        <div id="customer_score_container">
            <div>구매 고객 총 평점</div>
           	<div>
           	<c:if test="${empty starAvg}">
           	0
           	</c:if>
           	<c:if test= "${not empty starAvg}">
           	<fmt:formatNumber value="${starAvg }" pattern="#.##" />
           	</c:if>
           	</div>
            <div>
          
			</div>
        </div>

        <div id="review_bar"></div>

        <!--사진 모아보기 (7개까지만)-->
        <div>
	<c:forEach var="r" items="${reviews }" begin="0" end="8">
	<c:if test="${empty r.review_image_path}">
	</c:if>
	<c:if test="${not empty r.review_image_path }">
		<img src="${r.review_image_path }" alt=""/>
	</c:if>
	</c:forEach>

        </div> 
    </div>

    <div id="separator"></div>

    <!--고객 리뷰-->
       <div id="customer_review_container">
        <c:forEach items="${reviews}" var="r">
            <div id="customer_each_review_container">
                <!--아이디-->
                <c:set var="mem_name" value="${r.mem_name }"/>
                <div id="customer_review_user_id">${fn:substring(mem_name, 0, 2)}* </div>
                <!--리뷰-->
                <div id="review_container">
                    <div id="customer_review_text_container">
                        <div id="customer_review_stars_container">
                            <span id="customer_review_stars">
                                <c:forEach begin="1" end="${r.review_star }">★</c:forEach><c:forEach begin="1" end="${5-r.review_star}">☆</c:forEach>
                            </span>
                            <span id="customer_review_stars_text">${r.review_star }</span>
                            <span id="customer_review_date">
                            <fmt:formatDate pattern="MM.dd" value="${r.review_regdate }"/>
                         </span>
                        </div>
                        <div id="customer_review_contents">
                            ${r.review_content }
                        </div>
                        	<c:if test="${empty r.review_image_path}">	
                        	</c:if>                        	
                        	<c:if test="${not empty r.review_image_path}">
		                        <div>
		                            <img src="${r.review_image_path }" alt="" />
		                        </div>                        	
                        	</c:if>

                    </div>
                </div>
            </div>
        	<hr>
        </c:forEach>
    </div>

    </div>



<%@ include file="../common/footer.jsp"%>