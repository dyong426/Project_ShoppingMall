<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

 <%@ include file="jsj/header.jsp" %>

  <!-- main -->
  <div id="myCarousel" class="carousel slide" data-bs-ride="carousel">
    <div class="carousel-indicators">
      <button type="button" data-bs-target="#myCarousel" data-bs-slide-to="0" class="" aria-label="Slide 1"></button>
      <button type="button" data-bs-target="#myCarousel" data-bs-slide-to="1" aria-label="Slide 2" class="active"
        aria-current="true"></button>
      <button type="button" data-bs-target="#myCarousel" data-bs-slide-to="2" aria-label="Slide 3" class=""></button>
    </div>

    <div class="carousel-inner">
      <div class="carousel-item active">
        <img width=100%
          src="https://s3.marpple.co/files/u_1686012/2023/2/original/b3fcd9b3f11f67a7673069e1a189454872ade1c31.jpg"
          alt="" />
      </div>
      <div class="carousel-item active">
        <img width=100%
          src="https://s3.marpple.co/files/u_1686012/2023/1/original/6a1acb8c70c5b2016ae5706829e6fd2aff227d121.png"
          alt="" />
      </div>
      <div class="carousel-item">
        <img width=100%
          src="https://s3.marpple.co/files/u_1686012/2023/2/original/30d78a6a6eabb8af69a54a059c9fd5b35fac6b071.jpg"
          alt="" />
      </div>
    </div>

    <button class="carousel-control-prev" type="button" data-bs-target="#myCarousel" data-bs-slide="prev">
      <span class="carousel-control-prev-icon" aria-hidden="true"></span>
      <span class="visually-hidden">Previous</span>
    </button>
    <button class="carousel-control-next" type="button" data-bs-target="#myCarousel" data-bs-slide="next">
      <span class="carousel-control-next-icon" aria-hidden="true"></span>
      <span class="visually-hidden">Next</span>
    </button>
  </div>

  <div id="home-category-item__btns" class="container d-flex justify-content-center">
    <a href="category_clothes.html">
      <div class="home-category-item__bg" style="background-color: #F5B959;">
        <img width=100px src="resources/images/의류.png" alt="">
      </div>
    </a>
    <a href="#">
      <div class="home-category-item__bg" style="background-color: #945335;">
        <img width=100px src="resources/images/액자.png" alt="">
      </div>
    </a>
    <a href="#">
      <div class="home-category-item__bg" style="background-color: #B86C96;">
        <img width=100px src="resources/images/폰케이스.png" alt="">
      </div>
    </a>
    <a href="#">
      <div class="home-category-item__bg" style="background-color: #4B3733;">
        <img width=100px src="resources/images/홈데코.png" alt="">
      </div>
    </a>
  </div>

  <div class="container d-flex justify-content-center">
    <div class="home-category-item__name">의류</div>
    <div class="home-category-item__name">액자</div>
    <div class="home-category-item__name">폰케이스/테크</div>
    <div class="home-category-item__name">홈데코/리빙</div>

  </div>

  
  <!-- 리뷰 -->
  <div style="font-size: 180%; font-weight:large; margin-left:350px; margin-top:150px">회원 리뷰</div>
  <div id="main_reviews" class="container d-flex justify-content-center">
    <div class="card" style="width: 18rem;">
      <img src="resources/images/착샷.jpg" class="card-img-top" alt="...">
      <div class="card-body">
        <span>★★★</span>
        <p class="card-text">따뜻한 후드티네요</p>
        <span class="review_date">2023-02-11 </span>
        <span class="review_user">정수*</span>
      </div>
    </div>
    <div class="card" style="width: 18rem;">
      <img src="resources/images/착샷2.jpg" class="card-img-top" alt="...">
      <div class="card-body">
        <span>★★★★</span>
        <p class="card-text">세트로 샀어요 맘에 들어요 놀러...</p>
        <span class="review_date">2023-02-11 </span>
        <span class="review_user">구지*</span>
      </div>
    </div>
    <div class="card" style="width: 18rem;">
      <img src="resources/images/착샷3.jpg" class="card-img-top" alt="...">
      <div class="card-body">
        <span>★★★★★</span>
        <p class="card-text">강아지 옷 잘하네요</p>
        <span class="review_date">2023-02-11 </span>
        <span class="review_user">강경*</span>
      </div>
    </div>
    <div class="card" style="width: 18rem;">
      <img src="resources/images/착샷4.jpg" class="card-img-top" alt="...">
      <div class="card-body">
        <span>★★★★★</span>
        <p class="card-text">친구들끼리 옷 맞췄어요</p>
        <span class="review_date">2023-01-16 </span>
        <span class="review_user">이동*</span>
      </div>
    </div>

  </div>

 <br><br><br>
  <!--장점(임시)-->
  <div style="display:flex; justify-content: center;">
    <img src="resources/images/장점.png" alt="" />
  </div>
  <br><br><br><br>
  <!-- footer -->
  <div class="footer_container">
    <div class="container">
      <div id="footer_logo" class="d-flex align-items-start">
        <a href="/" class="mb-3 me-2 mb-md-0 text-muted text-decoration-none">
          <img width=230px src="resources/images/logo_white.png" alt="" />
        </a>
        
      </div>

      <div id="footer_description" >
        <div class="d-flex justify-content-between"  id="footer_bottom">
          <div>
            (주)JUHEE CUSTOM ㅣ 대표 김주희 ㅣ 사업자등록번호 031-555-4449 ㅣ 통신판매업신고 2023-경기구리-0228<br>
            경기도 구리시 인창동 670-1 태영빌딩 4층 409호 ㅣ 고객센터 031-555-4449 ㅣ 팩스 031-555-4449<br>
            JUHEE CUSTOM 콘텐츠의 저작권은 저작권자 또는 제공처에 있으며, <br>이를 무단 사용 및 도용하는 경우 저작권법 등에 따라 법적 책임을 질 수 있음을 알려드립니다.<br>
            © 2023 JUHEE CUSTOM Corp. All rights reserved.
          </div>

          <div>
            <img src="resources/images/brands.png" alt="" />
          </div>
        </div>
      </div>
    </div>
  </div>

   <%@ include file="jsj/footer.jsp" %>