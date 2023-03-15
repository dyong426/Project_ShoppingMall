<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!-- include header -->

<%@ include file="../include/header.jsp"%>

<!-- admin_prod_reg -->

<body>

	<div class="main-container">

		<!-- include left Nav Bar -->

		<%@ include file="../include/left_nav_bar.jsp"%>
		<div class="content-container-prod">

            <div class="card grid-top">탑</div>

            <div class="card grid-main">
                <div class="card-body">

                    <div class="row">
                        <h1>매출 조회</h1>
                        <div class="col-12">
                  			<button type="button" class="btn btn-sales btn-secondary"  onclick="location.href='<%=request.getContextPath()%>/admin/sales'">일일 매출</button>

                            <button type="button" class="btn btn-sales btn-secondary" onclick="location.href='<%=request.getContextPath()%>/admin/sales/weekly'">요일별 매출</button>

                            <button type="button" class="btn btn-sales btn-primary" onclick="location.href='<%=request.getContextPath()%>/admin/sales/monthly'">월간 매출</button>

                            <button type="button" class="btn btn-sales btn-secondary" onclick="location.href='<%=request.getContextPath()%>/admin/sales/period'">기간별 매출</button>
                        </div>

                        <div class="sales-table col-lg-12">

                            <!-- 월간 매출-->

                            <div class="sales-type-content" id="monthly-sales">
                                <div class="card-dflex-column">
                                    <canvas id="rateCompareLastMonthChart" width="400" height="200"></canvas>
                                    <label><h3>전달 대비 : -25%</h3></label>
                                </div>
                                <table class="table">

                                    <thead>
                                        <tr>
                                            <th>월</th>
                                            <th>주문 수</th>
                                            <th>매출</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <tr>
                                            <td>1월</td>
                                            <td>30</td>
                                            <td>200,000</td>
                                        </tr>
                                        <tr>
                                            <td>2월</td>
                                            <td>30</td>
                                            <td>200,000</td>
                                        </tr>
                                        <tr>
                                            <td>3월</td>
                                            <td>30</td>
                                            <td>200,000</td>
                                        </tr>
                                        <tr>
                                            <td>4월</td>
                                            <td>30</td>
                                            <td>200,000</td>
                                        </tr>
                                    </tbody>
                                </table>

                            </div>
                            <!-- 월간매출 끝 -->
            

                        </div>
                    </div>

                </div>
            </div>
        </div>
    </div>

		<script>
    function colorize() {
    	var r = Math.floor(Math.random()*200);
    	var g = Math.floor(Math.random()*200);
    	var b = Math.floor(Math.random()*200);
    	var color = 'rgba(' + r + ', ' + g + ', ' + b + ', 0.5)';
    	return color;
    }
	
		</script>
		<!-- include footer -->
		<%@ include file="../include/footer.jsp"%>
