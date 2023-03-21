/* 정수정, footer */

<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<!-- footer-->

  <div class="footer_container">
       <div class="footer_logo">
           <a href="/main">
               <img width=230px src="<%=request.getContextPath() %>/assets/common/cstm_img/logo/logo_white.png"alt="" />
           </a>
       </div>

       <div class="footer_description">
           <div class="footer_bottom">
               <div>
                   (주)juhee custom ㅣ 대표 김주희 ㅣ 사업자등록번호 031-555-4449 ㅣ 통신판매업신고
                   2023-경기구리-0228<br> 경기도 구리시 인창동 670-1 태영빌딩 4층 409호 ㅣ 고객센터
                   031-555-4449 ㅣ 팩스 031-555-4449<br> juhee custom 콘텐츠의 저작권은 저작권자
                   또는 제공처에 있으며, <br>이를 무단 사용 및 도용하는 경우 저작권법 등에 따라 법적 책임을 질 수 있음을
                   알려드립니다.<br> © 2023 juhee custom Corp. All rights reserved.
               </div>

               <div>
                   <img src="<%=request.getContextPath() %>/assets/common/cstm_img/brands.png" alt="" />
               </div>
           </div>
       </div>
   </div>

<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js" integrity="sha512-894YE6QWD5I59HgZOGReFYm4dnWc1Qt5NtvYSaNcOP+u1T9qYdvdihz0PPSiiqn/+/3e7Jo4EaG7TubfWGUrMQ==" crossorigin="anonymous" referrerpolicy="no-referrer"></script> 
<script src="https://developers.kakao.com/sdk/js/kakao.js"></script>
<script src="https://static.nid.naver.com/js/naveridlogin_js_sdk_2.0.2.js" charset="utf-8"></script>

<script type="text/javascript" src="<%=request.getContextPath() %>/assets/user/mypage/js/details.js"></script>
<script type="text/javascript" src="<%=request.getContextPath() %>/assets/user/mypage/js/my_info.js"></script>
<script type="text/javascript" src="<%=request.getContextPath() %>/assets/user/home/js/home.js"></script>
<script type="text/javascript" src="<%=request.getContextPath() %>/assets/user/common/js/join.js"></script>
<script type="text/javascript" src="<%=request.getContextPath() %>/assets/user/common/js/login.js"></script>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.min.js" integrity="sha384-cuYeSxntonz0PPNlHhBs68uyIAVpIIOZZ5JqeqvYYIcEL727kskC66kF92t6Xl2V" crossorigin="anonymous"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/assets/user/common/js/account_validation_check.js"></script>


<script src="<%=request.getContextPath()%>/assets/user/cs/js/contact.js"></script>

</body>

</html>
