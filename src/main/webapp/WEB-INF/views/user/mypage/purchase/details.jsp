<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>   
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %> 
<jsp:include page="/WEB-INF/views/user/common/header.jsp" />
<link rel="stylesheet" href="<%=request.getContextPath() %>/assets/user/mypage/css/pd_detail_page.css">


  <!-- main -->
  <div class="pd_container">
    <div class="pd_detail_main">
        <div class="title_area">
            <h2 id="main_title">주문 상세 내역</h2>
        </div>
        <div class="detail_main">
            <form action="">
                <div class="order_area">
                    <div class="title">
                        <h3>주문정보</h3>
                    </div>
                    <div class="base_table">
                        <table>
                            <!-- <caption>주문정보</caption> -->
                            <colgroup>
                                <col style="width: 160px;">
                                <col style="width: auto;">
                            </colgroup>
                            <tbody>
                                <tr>
                                    <th scope="row">주문번호</th>
                                    <td>${order.new_order_num }</td>
                                </tr>
                                <tr>
                                    <th scope="row">주문일자</th>
                                    <td>${order.od_ord_date }</td>
                                </tr>
                                <tr>
                                    <th scope="row">주문자</th>
                                    <td>
                                        <span>${mem_name }</span>
                                    </td>
                                </tr>
                                <tr>
	                                     
                                    <th scope="row">주문처리상태</th>
                                    <td>
                                        <c:if test="${order.ord_statusKor  eq '입금 전' }" >
	                                     ${order.ord_statusKor }
	                                     <script>
	                                     const ord_num = parseInt("${order.ord_num}");
										  </script>
	                                      <button type="submit" class="order_cancellation">주문취소</button>
	                
                                        </c:if>
                                        <c:if test="${order.ord_statusKor ne '입금 전' }">
                                        ${order.ord_statusKor }
                                        </c:if>
                                    </td>
                                </tr>
                            </tbody>
                        </table>
                    </div>
                    <br> <br> <br>
                    <div class="order_area">
                        <div class="title">
                            <h3>결제정보</h3>
                        </div>
                        <div class="base_table">
                            <table>
                                <!-- <caption>결제정보</caption> -->
                                <colgroup>
                                    <col style="width: 160px;">
                                    <col style="width: auto;">
                                </colgroup>
                                <tbody>
                                    <tr class="sum">
                                        <th scope="row">총 주문 금액</th>
                                        <td>
                                            <span>
                                                <strong><fmt:formatNumber value="${order.total_amount }" pattern="#,###,##0" /></strong>원
                                                <!-- <span class="dispaynone"></span> -->
                                            </span>
                                        </td>
                                    </tr>
                                </tbody>
                            </table>
                        </div>
                        <div class="base_table_total">
                            <table>
                                <!-- <caption>결제정보</caption> -->
                                <colgroup>
                                    <col style="width: 160px;">
                                    <col style="width: auto;">
                                </colgroup>
                                <tbody>
                                    <tr>
										<!-- 포인트 제외 금액 넣어야 합니다-->
                                        <th scope="row">총 결제 금액</th>
                                        <td>
                                            <span class="txtEm">
                                                <strong class="txt18"><fmt:formatNumber value="${order.total_amount }" pattern="#,###,##0" /></strong>원
                                                
                                            </span>
                                        </td>
                                    </tr>
                                    <tr>
                                        <th scope="row">결제수단</th>
                                        <td>
                                            <strong>
                                                <span>${order.payment_name }</span>
                                            </strong>
                                        </td>
                                    </tr>
                                </tbody>
                            </table>
                        </div>
                    </div>
                    <br> <br> <br>
                    <div class="order_area">
                        <div class="title">
                            <h3>주문 상품 정보</h3>
                        </div>
                            <div class="base_table_type">
                                <table>
                                    <!-- <caption>주문 상품 정보</caption> -->
                                    <colgroup>
                                        <col style="width: 92px;">
                                        <col style="width: auto;">
                                        <col style="width: 60px;">
                                        <col style="width: 100px;">
                                      
                                    
                                        <col style="width: 110px;">
                                    </colgroup>
                                    <thead class="info_box">
                                        <tr>
                                            <th scope="col">이미지</th>
                                            <th scope="col">상품정보</th>
                                            <th scope="col">수량</th>
                                            <th scope="col">판매가</th>
                             
                                            <th scope="col">주문처리상태</th>
                               
                                        </tr>
                                    </thead>
                                    <tfoot class="individual_delivery">
                                        <tr>
                                            <td colspan="9">
                                    
                                                상품 구매 금액
                                                <strong><fmt:formatNumber value="${order.total_amount * 0.9}" pattern="###,##0"/></strong>
                                                <span class="displaynone"> + 부가세 <fmt:formatNumber value="${order.total_amount * 0.1 }" pattern="###,##0"/></span>
                                                + 배송비 3,000
                                                <span class="displaynone"> - 상품할인금액 1,500</span>
                                                = 합계 :
                                                <strong class="txtEm">
                                                    <span class="txt18"><fmt:formatNumber value="${order.total_amount -1500+ 3000}" pattern="#,###,##0"/>원</span>
                                                </strong>
                                                <!-- <span class="dispaynone"></span> -->
                                            </td>
                                        </tr>
                                    </tfoot>
                                    <tbody class="product_link">
                                    
                                    <c:forEach items="${orderDetails }" var="od">
                               
                                        <tr class="link_record">
                                            <td class="thumb">                                              
                                               <img id="pd_img" src="${od.origin_img_path }" alt="상품 사진">                      
                                            </td>
                                            <td class="product_info">
                                                    <a href="/jhc/product_details?p_num=${od.p_num}">${od.p_name }</a>                            
                                                <div class="option"></div>
                                            </td>
                                            <td>${od.od_quantity}</td>
                                            <td class="product_price">
                                                <div>
                                                    <fmt:formatNumber value="${od.od_amount }" pattern="#,###,##0"/>
                                                </div>
                                              
                                            </td>
                                            <c:if test="${order.ord_statusKor eq '주문 취소'}">
	                                            <td class="order_status" style="color:red">
	                                              ${order.ord_statusKor }
	                                            </td>
                                            </c:if>
                                            <c:if test="${order.ord_statusKor ne '주문 취소'}">
                                             <td class="order_status">
	                                              ${order.ord_statusKor }
	                                            </td>
                                            </c:if>
                                     
                                           
                                        </tr>
                                        </c:forEach>
                                    </tbody>
                                </table>
                            </div>
                        
                    </div>
                    <br> <br> <br>
                    <div class="order_area">
                        <div class="title">
                            <h3>배송지정보</h3>
                        </div>
                        <div class="base_table">
                            <table>
                                <!-- <caption>배송지정보</caption> -->
                                <colgroup>
                                    <col style="width: 160px;">
                                    <col style="width: auto;">
                                </colgroup>
                                <tbody>
                                    <tr>
                                        <th scope="row">받으시는분</th>
                                        <td>
                                            <span>${order.receiver_name }</span>
                                        </td>
                                    </tr>
                                    <tr>
                                        <th scope="row">우편번호</th>
                                        <td>
                                            <span>${order.ord_zipcode }</span>
                                        </td>
                                    </tr>
                                    <tr>
                                        <th scope="row">주소</th>
                                        <td>
                                            <span>${order.ord_addr1}&nbsp;${order.ord_addr2 }</span>
                                        </td>
                                    </tr>
                                    <tr>
                                        <th scope="row">휴대전화</th>
                                        <td>
                                            <span>${order.receiver_phone}</span>
                                        </td>
                                    </tr>
                                    <tr>
                                        <th scope="row">배송메시지</th>
                                        <td>
                                            <span>
                                                ${order.ord_request }
                                            </span>
                                        </td>
                                    </tr>
                                </tbody>
                            </table>
                        </div>
                    </div>
                    <br>

                    
                </div>
                
            </form>
            
        </div>
        <div class="order_list_btn">
            <button onclick="location.href='<%=request.getContextPath() %>/history'" class="list_button" type="button">주문목록보기</button>
            <!-- ::after -->
        </div>
    </div>
  </div>

 <footer>
   <jsp:include page="/WEB-INF/views/user/common/footer.jsp" />