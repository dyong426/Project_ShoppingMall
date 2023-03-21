 <%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <!-- include header -->
 
 <%@ include file="../include/header.jsp" %>
 
 
 <!-- admin_home -->
 
 <body>

    <div class="main-container">

		<!-- include left Nav Bar -->
        <%@ include file="../include/left_nav_bar.jsp" %>


        <!-- content-container -->
        <div class="content-container-home">

            <div class="card grid-top">탑</div>

            <div class="card grid-main">
                <div class="card-header">매출현황</div>
                <div class="card-body">
                    <canvas id="barChart" style="width: 100%; height: 100%;"></canvas>
                    <div class="card-dflex-column">
                        <canvas id="rateCompareLastMonthChart" style="width: 100%; height: 100%;"></canvas>
                        <label>
                            <h3>-25%</h3>
                        </label>
                    </div>
                </div>
            </div>

            <div class="card grid-sub">
                <div class="card-header">
                    주문통계
                </div>
                <div class="card-body">
                    <canvas id="doughnutChart" style="width: 100%; height: 100%;"></canvas>
                    <table class="basic-table">
                        <tr>
                            <th></th>
                            <th></th>
                            <th></th>
                        </tr>
                        <tr>
                            <td><i class="fa-solid fa-shirt"></i></td>
                            <td>의류</td>
                            <td>300</td>
                        </tr>
                        <tr>
                            <td><i class="fa-solid fa-mobile-screen-button"></i></td>
                            <td>폰케이스</td>
                            <td>100</td>
                        </tr>
                        <tr>
                            <td><i class="fa-solid fa-mug-saucer"></i></td>
                            <td>홈 데코</td>
                            <td>50</td>
                        </tr>
                        <tr>
                            <td><i class="fa-solid fa-image"></i></td>
                            <td>액자</td>
                            <td>30</td>
                        </tr>
                    </table>
                </div>
            </div>

            <div class="card grid-news1">

                <div class="card-header">
                    <i class="fa-solid fa-cart-plus fa-lg"></i>
                    신규주문
                </div>
                <div class="card-body">
                    <table class="basic-table">
                        <tr>
                            <th></th>
                            <th></th>
                            <th></th>
                        </tr>
                        <tr>
                            <td><i class="fa-solid fa-shirt"></i></td>
                            <td>의류</td>
                            <td>9</td>
                        </tr>
                        <tr>
                            <td><i class="fa-solid fa-mobile-screen-button"></i></td>
                            <td>폰케이스</td>
                            <td>5</td>
                        </tr>
                        <tr>
                            <td><i class="fa-solid fa-mug-saucer"></i></td>
                            <td>홈 데코</td>
                            <td>1</td>
                        </tr>
                        <tr>
                            <td><i class="fa-solid fa-image"></i></td>
                            <td>액자</td>
                            <td>0</td>
                        </tr>
                    </table>
                </div>
            </div>
            <div class="card grid-news2">
                <div class="card-header">
                    <i class="fa-solid fa-headset fa-lg"></i>
                    게시판 문의
                </div>
            </div>
            <div class="card grid-news3">
                <div class="card-header">
                    <i class="fa-solid fa-comment-dots fa-lg"></i>
                    신규 리뷰
                </div>
            </div>
            <div class="card grid-news4">
                <div class="card-header">
                    <i class="fa-solid fa-user-plus fa-lg"></i>
                    신규 회원
                </div>
            </div>
        </div>
        
        <!-- include footer -->
        <%@ include file="../include/footer.jsp" %>
