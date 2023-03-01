<%@ page language="java" contentType="text/html; charset=EUC-KR"
   pageEncoding="UTF-8"%>

<jsp:include page="/WEB-INF/views/user/common/header.jsp" />
<link rel="stylesheet" href="<%=request.getContextPath() %>/assets/user/mypage/css/orderList.css">

  <!-- main -->
  <div class="background">
        <div class="ctr">
            <h1>주문 내역</h1>
                <div class="contents">
                        <div class="serch">주문내역조회</div>
                            <div class="serch_form">
                                <div class="serch_date">
                                    <select name="" id="">
                                        <option value="">전체 주문처리상태</option>
                                        <option value="">입금전</option>
                                        <option value="">배송준비중</option>
                                        <option value="">배송중</option>
                                        <option value="">배송완료</option>
                                        <option value="">취소</option>
                                        <option value="">교환</option>
                                        <option value="">반품</option>
                                    </select> &nbsp; &nbsp;

                                    <input class="select_date" type="date"><span class="symbol">&nbsp; ~ &nbsp;</span><input class="select_date" type="date"> &nbsp;
                                    
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
                            
                            <span class="product_info">주문 상품 정보</span>
                            <table class="pd_info">
                                <thead>
                                    <tr>
                                        <th  style="width: 170px;">주문일자[주문번호]</th>
                                        <th style="width: 80px;">이미지</th>
                                        <th style="width: 340px;">상품정보</th>
                                        <th style="width: 60px;">수량</th>
                                        <th style="width: 120px;">상품구매금액</th>
                                        <th>주문처리상태</th>
                                        <th>취소/교환/반품</th>
                                    </tr>
                                </thead>

                                <tbody class="product_list">
                                    <tr class="product">
                                        <td class="order_number">
                                            2022-09-29
                                            <p><a href="<%=request.getContextPath() %>/details" class="order_number">[20220929-0001079]</a></p>
                                        </td >
                                        <td class="product_img">
                                            <a href=""><!-- 여기 클릭하면 판매 페이지로 이동 --></a>
                                            <img style="width: 50px; height: 50px;" src="<%=request.getContextPath() %>/assets/common/cstm_img/착샷.jpg" alt="상품 사진">
                                        </td>
                                        <td class="product_check">
                                            <strong class="product_name">
                                                <a href="" class="ec_prouduct_name">보송보송 너무나도 예쁜 하얀 목티<!-- 여기 클릭하면 판매 페이지로 이동 --></a>
                                            </strong>
                                            <div class="op">
                                                <div>옵션 :&nbsp;</div>
                                                <div>텍스트 추가, 사진 추가</div>
                                            </div>
                                        </td>
                                        <td class="product_amount">1</td>
                                        <td class="product_price">
                                            <strong>29,000원</strong>
                                        </td>
                                        <td class="product_state">
                                            <p class="txtEm" style="padding-top: 15px;">배송 완료</p>
                                        </td>
                                        <td class="order_change">
                                            <a href="">주문 취소</a> <br>
                                            <a href="">교환 신청</a> <br>
                                            <a href="">반품 신청</a> <br>
                                        </td>
                                    </tr>
                                </tbody>
    
                            </table>
                            
                </div>
        </div>
  </div>


    
 <footer>
   <jsp:include page="/WEB-INF/views/user/common/footer.jsp" />
