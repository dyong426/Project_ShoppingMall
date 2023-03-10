<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<jsp:include page="/WEB-INF/views/user/common/header.jsp" />
<link rel="stylesheet" href="<%=request.getContextPath() %>/assets/user/mypage/css/my_review.css">

  <!-- main -->
  <div class="rv_container">
    <div class="rv_body">
        <div class="header_title">
            <span class="my_review">나의 리뷰</span>
        </div>
        <div class="header_tab">
            <div class="tab_left" type="order_list">작성 가능한 리뷰</div>
            <div class="tab_right" type="review_list">
                <a class="writed_review" href="<%=request.getContextPath() %>/wrote_review">내가 쓴 리뷰</a>
            </div>
        </div>
        <div class="header_my_review">
       
            <div class="info1">
                작성 가능한 상품이 <span>0</span> 개 있습니다.
            </div>
            <div class="info2">
                리뷰 작성 시 적립금 100P, 사진과 함께 리뷰를 작성해주시면 500P를 지급해 드립니다.
            </div>
            <div class="info2">
                단, 주문 금액이 크더라도, 상품별 금액이 3,000원 이하일 경우 리뷰작성시 50포인트, 사진과 함께 리뷰를 작성해주시면 150포인트 적립되는 점 참고 부탁드립니다.
            </div>
       
        </div>
        <div class="write_review" total_count="0">
       <!--  <c:forEach items="${review_ch}" var="ch"> -->
          <div class="order_date"><span>주문일&nbsp;</span>&nbsp;&nbsp;${ch.ord_date}</div>
            <table class="wr_info">
                <thead>
                    <tr>
                        <th  style="width: 170px;">주문번호</th>
                        <th style="width: 120px;">이미지</th>
                        <th style="width: 340px;">상품정보</th>
                        <th style="width: 120px;">색상</th>
                        <th style="width: 180px;">리뷰 작성</th>
                    </tr>
                </thead>

                <tbody class="wr_list">
                    <tr class="wr">
                        <td class="od_number">
                            
                            <p><a href="<%=request.getContextPath() %>/details" class="order_number">[20220929-0001079]</a></p>
                        </td >
                        <td class="wr_img">
                            <a href=""><!-- 여기 클릭하면 판매 페이지로 이동 --></a>
                            <img style="width: 50px; height: 50px;" src="<%=request.getContextPath() %>/assets/common/cstm_img/products/clothes/젤란 라이트 후드집업.png" alt="상품 사진">
                        </td>
                        <td class="wr_check">
                            <strong class="wr_name">
                                <a href="" class="ec_wr_name">${ch.p_name}</a>
                            </strong>
                        </td>
                        <td>
                          <span>${ch.pc_name}</span>
                        </td>
                        
                        <td class="wr_amount">
                            <button type="button" onclick="location.href='<%=request.getContextPath() %>/writing_review'">리뷰 작성 하기</button>
                        </td>
                    </tr>
                </tbody>
            </table>
           <!--  </c:forEach> -->
        </div>
    </div>
  </div>


 <footer>
   <jsp:include page="/WEB-INF/views/user/common/footer.jsp" />