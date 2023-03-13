<%@ page language="java" contentType="text/html; charset=EUC-KR"
   pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<jsp:include page="/WEB-INF/views/user/common/header.jsp" />
<link rel="stylesheet" href="<%=request.getContextPath() %>/assets/user/mypage/css/orderList.css">

  <!-- main -->
  <div class="background">
        <div class="ctr">
            <h1>주문 내역</h1>
                <div class="contents">
                        <div class="search">주문내역조회</div>
                            <div class="search_form">
                                <div class="search_date">
                                    <select name="" id="">
                                        <option value="">전체 주문 처리 상태</option>
                                        <option value="0">입금전</option>
                                        <option value="1">배송준비중</option>
                                        <option value="2">배송중</option>
                                        <option value="3">배송완료</option>
                                        <option value="4">취소</option>
                                        <option value="5">교환</option>
                                        <option value="6">반품</option>
                                    </select> &nbsp; &nbsp;

                                    <input class="select_date" type="date"><span class="symbol">&nbsp; ~ &nbsp;</span>
                                    <input class="select_date" type="date"> &nbsp;
                                    
                                    &nbsp;<button type="button" class="inquiry">조회</button>
                                </div>

                                <ol class="explanation" style="list-style-type:disc;">
                                    <li>기본적으로 최근 3개월간의 자료가 조회되며, 기간 검색시 지난 주문내역을 조회하실 수 있습니다.</li>
                                    <li>주문번호를 클릭하시면 해당 주문에 대한 상세내역을 확인하실 수 있습니다.</li>
                                    <li>취소/교환/반품 신청은 주문완료일 기준 30일까지 가능합니다.</li>
                                </ol>
                            </div>

                            <br>
                            <br>
                            
                            <p>주문일자(주문번호) : <strong>2022-01-02 (2201021303351347)</strong></p>
                            <table class="pd_info">
                            <colgroup>
                                     <col style="width: 100px;">
                                     <col style="width: 100px;">
                                     <col style="width: 200px;">
                                     <col style="width: 110px;">
                                     <col style="width: 110px;">
                                     <col style="width: 100px;">
                                        </colgroup>
                                <thead>
                                    <tr>
                                        <th>주문일자<br>[주문번호]</th>
                                        <th>이미지</th>
                                        <th>상품정보/주문금액/수량</th>
                                        <th>결제 금액</th>
                                        <th>주문처리상태</th>
                                        <th>취소/교환/반품</th>
                                    </tr>
                                </thead>
				<c:forEach var="order" items="${history }" >
                                <tbody class="product_list">
                                    <tr class="product">
                                       <td>${order.ord_date }</td>
                                       <td><img width=100px; src="${order.origin_img_path }" alt="" /></td>
                                       <td>${order.p_name }</td>
                                       <td>${order.od_amount }</td>
                                       <td>${order.ord_status }</td>
                                       <td><a href="#">취소</a><a href="#">교환/반품</a></td>
                                    </tr>
                                </tbody>
				</c:forEach>
    
                            </table>
                            
                </div>
        </div>
  </div>


    
 <footer>
   <jsp:include page="/WEB-INF/views/user/common/footer.jsp" />
