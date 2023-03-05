<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<jsp:include page="/WEB-INF/views/user/common/header.jsp" />
<link rel="stylesheet" href="<%=request.getContextPath() %>/assets/user/mypage/css/er.css">

<!-- main -->
  <div class="er_background">
        <div class="er_body">
            <h2>교환/환불 신청하기</h2>
                <div class="er_contents">
                        <div class="er_info">
                            <div>
                                주문번호&nbsp;&nbsp;<a href="<%=request.getContextPath() %>/details">[20220929-0001079]</a>
                            </div>
                        </div>
                            <div class="er_guide_box">
                                <span class="er_guide">교환/환불 안내</span> <br>
                                <span class="er_explanation">교환 및 반품 신청 페이지에 모든 항목을 기재하신 후, 상품을 우체국을 이용해 착불로 보내주세요.</span>
                            </div>

                            <br>
                            <br>
                            
                            <div class="er_form">
                                <div class="category_box" id="ct_box">
                                    <div class="radio_box">
                                        <input type="radio" name="er" id="exchange" value="교환" onclick="javascript:contentsView(exchange); contentsView2(exchange);" checked="checked"><label for="" class="radio_label">&nbsp;교환</label>&nbsp;&nbsp;&nbsp;&nbsp;
                                        <input type="radio" name="er" id="refund" value="반품" onclick="javascript:contentsView(refund); contentsView2(refund)" ><label for="" class="radio_label">&nbsp;반품</label>
                                    </div>
                                    <div id="sb1">
                                        <div class="select_box" >
                                            <select name="" id="">
                                                <option selected>교환사유를 선택해주세요</option>
                                                <option value="상품훼손">상품훼손</option>
                                                <option value="사이즈 변경">사이즈 변경</option>
                                                <option value="상품정보와 상이">상품정보와 상이</option>
                                            </select>
                                        </div>
                                        <div class="detailed_reason">
                                            <textarea name="er_reason" id="er_reason" cols="50" rows="12" placeholder="상세사유를 입력해주세요(선택사항)"></textarea>
                                        </div>
                                    </div>
                                    <div id="sb2" style="display:none;">
                                        <div class="select_box"  >
                                            <select name="" id="">
                                                <option selected>반품사유를 선택해주세요</option>
                                                <option value="상품훼손">상품훼손</option>
                                                <option value="배송지연">배송지연</option>
                                                <option value="상품정보와 상이">상품정보와 상이</option>
                                            </select>
                                        </div>
                                        <div class="detailed_reason">
                                            <textarea name="er_reason" id="er_reason" cols="50" rows="4" placeholder="상세사유를 입력해주세요(선택사항)"></textarea>
                                        </div>
                                        <div class="bank_info">
                                            <div class="bank">
                                                <input type="text" placeholder="은행명" >
                                            </div>
                                            <div class="bank_number">
                                                <input type="text" placeholder="계좌번호" >
                                            </div>
                                            <div class="bank_user">
                                                <input type="text" placeholder="예금주">
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="er_pd_box">
                                    <div class="or_info" id="sb3" style="display:none;">
                                        <div class="er_pd_title"><span>반품 상품 선택</span></div>
                                        <div class="or_pd_info">
                                            <input type="checkbox" name="" id="" checked style="margin-right: 10px;">
                                            <img src="../images/착샷2.jpg" alt="" style="width: 70px; height: 70px;">
                                            <div class="or_name">
                                                <span>간지작살 브라운 셋업</span> <br>
                                                <span style="color: gray; font-size: 13px;">29,000원 / 1</span>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="or_info" id="sb4">
                                        <div class="er_pd_title"><span>교환 상품 선택</span></div>
                                        <div class="or_pd_info">
                                            <input type="checkbox" name="" id="" checked style="margin-right: 10px;">
                                            <img src="../images/착샷2.jpg" alt="" style="width: 70px; height: 70px;">
                                            <div class="or_name">
                                                <span>간지작살 브라운 셋업</span> <br>
                                                <span style="color: gray; font-size: 13px;">29,000원 / 1</span>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="or_price">
                                        <div class="er_pd_title"><span>환불 예정 금액</span></div>
                                        <div class="double_ck">
                                            <div class="pd_price">
                                                <div>취소 상품 금액 합계</div>
                                                <div>29,000원</div>
                                            </div>
                                            <div class="pd_price">
                                                <div>취소 배송비 합계</div>
                                                <div>3,000원</div>
                                            </div>
                                        </div>
                                        <div class="er_total_price">
                                            <div class="total_title"><span>환불상품 총 금액 합계</span></div>
                                            <div class="er_price">32,000원</div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            
                </div>
        </div>
  </div>
  
<footer>
   <jsp:include page="/WEB-INF/views/user/common/footer.jsp" />