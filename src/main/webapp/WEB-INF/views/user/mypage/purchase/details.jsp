<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
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
                                    <td>20220929-0001079</td>
                                </tr>
                                <tr>
                                    <th scope="row">주문일자</th>
                                    <td>2022-09-29 18:55:24</td>
                                </tr>
                                <tr>
                                    <th scope="row">주문자</th>
                                    <td>
                                        <span>김주희</span>
                                    </td>
                                </tr>
                                <tr>
                                    <th scope="row">주문처리상태</th>
                                    <td>
                                        입금 전
                                        <button type="submit" class="order_cancellation" onclick="location.href='<%=request.getContextPath() %>/cancel'">주문취소</button>
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
                                        <th scope="row">총 주문금액</th>
                                        <td>
                                            <span>
                                                <strong>29,000</strong>원
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
                                        <th scope="row">총 결제금액</th>
                                        <td>
                                            <span class="txtEm">
                                                <strong class="txt18">29,000</strong>원
                                                <!-- <span class="dispaynone"></span> -->
                                            </span>
                                        </td>
                                    </tr>
                                    <tr>
                                        <th scope="row">결제수단</th>
                                        <td>
                                            <strong>
                                                <span>카드결제</span>
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
                                        <col style="width: 95px;">
                                        <col style="width: 110px;">
                                        <col style="width: 110px;">
                                    </colgroup>
                                    <thead class="info_box">
                                        <tr>
                                            <th scope="col">이미지</th>
                                            <th scope="col">상품정보</th>
                                            <th scope="col">수량</th>
                                            <th scope="col">판매가</th>
                                            <th scope="col">배송구분</th>
                                            <th scope="col">주문처리상태</th>
                                            <th scope="col">취소/교환/반품</th>
                                        </tr>
                                    </thead>
                                    <tfoot class="individual_delivery">
                                        <tr>
                                            <td colspan="7">
                                                <span class="shipping_method">[개별배송]</span>
                                                상품구매금액
                                                <strong>0</strong>
                                                <span class="displaynone"> + 부가세 0</span>
                                                + 배송비 0 + 지역별배송비 0"
                                                <span class="displaynone"> - 상품할인금액</span>
                                                = 합계 :
                                                <strong class="txtEm">
                                                    <span class="txt18">0원</span>
                                                </strong>
                                                <!-- <span class="dispaynone"></span> -->
                                            </td>
                                        </tr>
                                    </tfoot>
                                    <tbody class="product_link">
                                        <tr class="link_record">
                                            <td class="thumb">
                                                <a href="<%=request.getContextPath() %>/history">
                                                    <img id="pd_img" src="<%=request.getContextPath() %>/assets/common/cstm_img/products/clothes/착샷.jpg" alt="예쁜 옷">
                                                </a>
                                            </td>
                                            <td class="product_info">
                                                <strong class="name">
                                                    <a href=""></a>
                                                </strong>
                                                <div class="option"></div>
                                            </td>
                                            <td>1</td>
                                            <td class="product_price">
                                                <div>
                                                    <strong>0원</strong>
                                                    <!-- <div class="displaynone"></div> -->
                                                </div>
                                                <!-- <div class="displaynone">
                                                    <strong>0원</strong>
                                                    <div class="displaynone"></div>
                                                </div> -->
                                            </td>
                                            <td class="delivery_state">
                                               <p class="txtEm">배송준비중</p>
                                            </td>
                                            <td>
                                                <p>취소/교환/반품 상태값</p>
                                            </td>
                                            <td>
                                                <p>-</p>
                                            </td>
                                        </tr>
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
                                            <span>김주희</span>
                                        </td>
                                    </tr>
                                    <tr>
                                        <th scope="row">우편번호</th>
                                        <td>
                                            <span>11921</span>
                                        </td>
                                    </tr>
                                    <tr>
                                        <th scope="row">주소</th>
                                        <td>
                                            <span>경기도 구리시 건원대로 44 태영빌딩 4층 409호</span>
                                        </td>
                                    </tr>
                                    <tr>
                                        <th scope="row">휴대전화</th>
                                        <td>
                                            <span>010-1234-1234</span>
                                        </td>
                                    </tr>
                                    <tr>
                                        <th scope="row">배송메시지</th>
                                        <td>
                                            <span>
                                                문앞에 두고가주세요.
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