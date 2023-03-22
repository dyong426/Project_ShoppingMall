<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<jsp:include page="/WEB-INF/views/user/common/header.jsp" />
<link rel="stylesheet" href="<%=request.getContextPath() %>/assets/user/mypage/css/cancel.css">

 <!-- main -->
  <div class="cc_background">
        <div class="cc_body">
            <h2>주문 취소</h2>
                <div class="cc_contents">
                        <div class="cc_info">
                            <div>
                                주문번호&nbsp;&nbsp;<a href="<%=request.getContextPath() %>/details">[20220929-0001079]</a>
                            </div>
                        </div>
                            <div class="cc_guide_box">
                                <span class="cc_guide">
                                    주문하신 상품 단위로 취소요청이 가능합니다 (수량 부분취소 불가) <br>
                                    상품이 발송되기 전에 취소요청을 하실 수 있습니다.</span><br>
                                <span class="cc_explanation">
                                    단, 상품을 이미 발송한 경우 취소처리가 거부될 수 있습니다.
                                </span>
                            </div>

                            <br>
                            <br>
                            
                            <div class="cc_form">
                                <div class="category_box" id="ct_box">
                                    <div class="cc_reason"><span>취소 사유 선택</span></div>
                                        <div class="select_box" >
                                            <select name="" id="">
                                                <option selected>취소사유를 선택해주세요</option>
                                                <option value="배송지연">배송지연</option>
                                                <option value="재주문">재주문</option>
                                                <option value="사이즈 변경">단순 변심</option>
                                            </select>
                                        </div>
                                        <div class="detailed_reason">
                                            <textarea name="cc_reason" id="cc_reason" cols="50" rows="8" placeholder="상세사유를 입력해주세요(선택사항)"></textarea>
                                        </div>
                                        <div class="cc_btn"><button type="button" value="주문 취소">주문 취소</button></div>
                                </div>
                                <div class="cc_pd_box">
                                    <div class="cc_or_info">
                                        <div class="cc_pd_title"><span>취소 상품 선택</span></div>
                                        <div class="cc_pd_info">
                                            <input type="checkbox" name="" id="" checked style="margin-right: 10px;">
                                            <img src="../images/착샷2.jpg" alt="" style="width: 70px; height: 70px;">
                                            <div class="cc_or_name">
                                                <span>간지작살 브라운 셋업</span> <br>
                                                <span style="color: gray; font-size: 13px;">29,000원 / 1</span>
                                            </div>
                                        </div>
                                    </div>
                                    
                                    <div class="cc_or_price">
                                        <div class="cc_pd_title2"><span>환불 예정 금액</span></div>
                                        <div class="cc_double_ck">
                                            <div class="pd_price">
                                                <div>취소 상품 금액 합계</div>
                                                <div>29,000원</div>
                                            </div>
                                            <div class="pd_price">
                                                <div>취소 배송비 합계</div>
                                                <div>3,000원</div>
                                            </div>
                                        </div>
                                        <div class="cc_total_price">
                                            <div class="cc_tt_title"><span>취소상품 총 금액 합계</span></div>
                                            <div class="cc_tt_price">32,000원</div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            
                </div>
        </div>
  </div>

<footer>
   <jsp:include page="/WEB-INF/views/user/common/footer.jsp" />