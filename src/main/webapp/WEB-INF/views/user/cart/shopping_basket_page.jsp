<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<jsp:include page="/WEB-INF/views/user/common/header.jsp" />
<link rel="stylesheet" href="<%=request.getContextPath() %>/assets/user/mypage/css/basket.css">
<link rel="stylesheet" href="<%=request.getContextPath() %>/assets/user/mypage/css/option_popup.css">
<link rel="stylesheet" href="<%=request.getContextPath() %>/assets/user/mypage/css/color_popup.css">


  <!-- main -->
  <div class="main_body">
  <div class="cart_body"> 
    <div class="basket_top">
            <span id="my_basket">내 장바구니</span>
            <div class="basket_process">
                <span id="poket">장바구니</span>
                <span class="other">&gt;</span>
                <span class="other">주문서작성</span>
                <span class="other">&gt;</span>
                <span class="other">주문완료</span>
            </div>
        
    </div>
    <div class="basket">
        <div class="basket_middle">
            <span>상품정보</span>
            <span>사이즈/수량</span>
            <span>가격</span>
            <span>편집</span>
        </div>
        <div class="basket_bottom">
            <div class="list">
                <div class="list_top"><span>2023-02-13 12:04</span><span> | No. 9471967</span></div>
                <div class="basket_body">
                    <img id="img" src="<%=request.getContextPath() %>/assets/common/cstm_img/products/clothes/젤란 라이트 후드집업.png" alt="상품 이미지"> 
                    <div class="product_info">
                        <div class="name">
                            후드집업(남여공용)[블루]
                            <div class="print">
                                <div id="printing">인쇄 :</div><div>없음</div>
                            </div>
                        </div>
                        <div class="total_amount">
                            <div class="size">L</div>
                            <div class="blank" is_not_stock="false"></div>
                            <div class="quantity"><span class="val">1</span></div>
                        </div>
                        <div class="price">29,200원</div>
                        <div class="btn_box">
                            <button type='button' class='btn edit'>옵션 변경</button>
                            <button type='button' class='btn delete'>삭제</button>
                        </div>
                    </div>
                    
                    
                </div>
            </div>
            <div class="add_btn">
                <div class="add_color">색상추가+</div>
            </div>
        </div>
    </div>

    <div class="summary">
        <div>
            <span class="sm">총 수량</span>
            <span class='total_quantity'>1</span>
        </div>
        <div>
            <span class="sm">가격</span>
            <span class="all_price">29,200</span>
        </div>
        <div>
            <span class="sm">배송비</span>
            <span class="delivery_charge">3000</span>
        </div>
        <div>
            <span class="sm" id="total">합계</span>
            <span class="total_price">32,200</span>
        </div>
        <div class="border_bar"></div>
        <div class="math_symbol">
            <div></div>
            <div class="sm_plus">+</div>
            <div class="equal">=</div>
        </div>
        
    </div>

    <div class="checkout_btn"><span>주문서 작성</span></div>
  </div>
  </div>

  <!-- 사이즈 옵션 팝업 창-->
  <div class="main">
    <div class="modal">
        <div class="modal-content">
          <div class="or_picture_box">
            <div class="or_picture">
              <img src="<%=request.getContextPath() %>/assets/common/cstm_img/후드티.png" alt="" style="width: 450px; height: 450px;">
            </div>
          </div>
          <div class="option_box">
            <span class="close-button">&times;</span>
            <div class="title">수량을 선택해주세요</div>
            <div class="pd_main_box">
              <div class="sub">후드집업(남녀공용) [블루]</div>
              <form action="#post.php" method="POST">
                <div class="pd_size">
                  <div class="size_input">
                    <span>S(85)</span>
                    <div class="pd_amount">
                      <div class="minus" data-action="decrement"></div>
                      <input type="number" class="quantity" value="0" min="1" max="100" inputmode="numeric" pattern="[0-9]*">
                      <div class="plus" data-action="increment"></div>
                    </div>
                  </div>
                  <div class="pd_price_box" >
                    <div class="pd_price"></div>
                  </div>
                </div>
                <div class="pd_size">
                  <div class="size_input">
                    <span>M(90)</span>
                    <div class="pd_amount">
                      <div class="minus" data-action="decrement" onclick="javascript:basket.changePNum(3);"></div>
                      <input type="number" class="quantity" value="0" min="1" max="100" inputmode="numeric" pattern="[0-9]*">
                      <div class="plus" data-action="increment" onclick="javascript:basket.changePNum(3);"></div>
                    </div>
                  </div>
                  <div class="pd_price_box">
                    <div class="pd_price"></div>
                  </div>
                </div>
                <div class="pd_size">
                  <div class="size_input">
                    <span>L(95)</span>
                    <div class="pd_amount">
                      <div class="minus" data-action="decrement"></div>
                      <input type="number" class="quantity" value="0" min="1" max="100" inputmode="numeric" pattern="[0-9]*">
                      <div class="plus" data-action="increment"></div>
                    </div>
                  </div>
                  <div class="pd_price_box">
                    <div class="pd_price"></div>
                  </div>
                </div>
                <div class="pd_size">
                  <div class="size_input">
                    <span>XL(100)</span>
                    <div class="pd_amount">
                      <div class="minus" data-action="decrement"></div>
                      <input type="number" class="quantity" value="0" min="1" max="100" inputmode="numeric" pattern="[0-9]*">
                      <div class="plus" data-action="increment"></div>
                    </div>
                  </div>
                  <div class="pd_price_box">
                    <div class="pd_price"></div>
                  </div>
                </div>
              </form>
            </div>
            <div class="modal_footer">
              <div class="tt_check_box">
                <div class="sub_title"><input type="number" value="0" min="1" max="100" inputmode="numeric" id="total-amt" value="0">개 상품의 금액</div>
                <div class="sb_tt_price">29,000원</div>
              </div>
              <div class="buttons">
                <button type="button" id="submit">확인</button>
              </div>
            </div>
          </div>
        </div>
    </div>
  </div>

  <!-- 색상 추가 팝업 창-->
  <div class="cl_modal">
      <div class="cl_modal-content">
        <button class="cl_close-button"></button>
        <div class="cl_title">다른 색상</div>
        <div class="colors_container"
        _sel="user_products->(#9489628)->_->product_color->_->base_product->_->base_product_colors">

          <div _id="24405" _sel="./(#24405)" class="color_item" color_code="#ffc824">
            <div class="code_wrap">
              <div class="code non-click" style="background-color: #ffc824"></div>
            </div>
            <div class="name">노랑</div>
          </div>

          <div _id="24397" _sel="./(#24397)" class="color_item" color_code="#0a1429">
            <div class="code_wrap">
              <div class="code non-click" style="background-color: #0a1429"></div>
            </div>
            <div class="name">진곤색</div>
          </div>

          <div _id="24403" _sel="./(#24403)" class="color_item" color_code="#fa733c">
            <div class="code_wrap">
              <div class="code non-click" style="background-color: #fa733c"></div>
            </div>
            <div class="name">오렌지</div>
          </div>

          <div _id="24395" _sel="./(#24395)" class="color_item" color_code="#333333">
            <div class="code_wrap">
              <div class="code non-click" style="background-color: #333333"></div>
            </div>
            <div class="name">차콜</div>
          </div>

          <div _id="24404" _sel="./(#24404)" class="color_item" color_code="#f8f3ea">
            <div class="code_wrap">
              <div class="code non-click" style="background-color: #f8f3ea"></div>
            </div>
            <div class="name">아이보리</div>
          </div>

          <div _id="24394" _sel="./(#24394)" class="color_item" color_code="#8be31b">
            <div class="code_wrap">
              <div class="code non-click" style="background-color: #8be31b"></div>
            </div>
            <div class="name">연두</div>
          </div>

        </div>
        <button class="done" type="button" done_type="Add">상품 추가</button>
      </div>
  </div>
  
  
  <!-- 사이즈 옵션 팝업 창 -->
  <script>
  var modal = document.querySelector(".modal");
  var btn = document.querySelector(".btn");
  var closeButton = document.querySelector(".close-button");


  function toggleModal() {
      modal.classList.toggle("show-modal");
  }

  function windowOnClick(event) {
      if (event.target === modal) {
          toggleModal();
      }
  }

  btn.addEventListener("click", toggleModal);
  closeButton.addEventListener("click", toggleModal);
  window.addEventListener("click", windowOnClick);
  </script>
  
  <!-- 사이즈 옵션 카운트 js -->
  <script></script>
  
  
 <!-- 색상 팝업 창 -->
	<script>
	var cl_modal = document.querySelector(".cl_modal");
    var add_color = document.querySelector(".add_color");
    var cl_closeButton = document.querySelector(".cl_close-button");


    function toggleModal() {
      cl_modal.classList.toggle("show-cl_modal");
    }

    function windowOnClick(event) {
        if (event.target === cl_modal) {
            toggleModal();
        }
    }
    
    
    add_color.addEventListener("click", toggleModal);
    cl_closeButton.addEventListener("click", toggleModal);
    window.addEventListener("click", windowOnClick);
	</script>
	

 <footer>
   <jsp:include page="/WEB-INF/views/user/common/footer.jsp" />
   ?v=<%=System.currentTimeMillis() %>
   <script type="text/javascript" src="<%=request.getContextPath() %>/assets/user/mypage/js/size_popup.js?ver=1"></script>
   <script type="text/javascript" src="<%=request.getContextPath() %>/assets/user/mypage/js/color_popup.js?ver=1"></script>
   <script type="text/javascript" src="<%=request.getContextPath() %>/assets/user/mypage/js/size_count.js?ver=1"></script>
   <script type="text/javascript" src="<%=request.getContextPath() %>/assets/user/mypage/js/color_select.js?ver=1"></script>