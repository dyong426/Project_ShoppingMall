<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
    <!-- include header -->

    <%@ include file="../include/header.jsp" %>


        <!-- admin_home -->

        <body>

            <!-- include top search bar -->

            <%@ include file="../include/top_search_bar.jsp" %>

	<div class="container-fluid">
		<div class="row">

			<!-- include left Nav Bar -->
			<%@ include file="../include/left_nav_bar.jsp"%>


			<!-- content-container -->
			<main class="col-md-9 ms-sm-auto col-lg-10 px-md-4">


				<div class="row mt-4">
					<div class="col-lg-12">
						<div
							class="row g-0 border rounded flex-md-row mb-4 shadow-sm h-md-250 position-relative">
							<div class="col p-4 d-flex flex-column position-static">
								<div class="d-flex flex-row justify-content-between">
									<h3 class="mb-0 fw-bold mb-4">매출차트</h3>

									<!--<div class="d-flex gap-5 justify-content-center">-->
									<div class="dropdown">
										<a class="btn btn-dark dropdown-toggle" href="#" role="button"
											data-bs-toggle="dropdown" aria-expanded="false"> 차트 종류 </a>
										<ul
											class="dropdown-menu dropdown-menu-dark gap-1 p-2 rounded-3 mx-0 border-0 shadow w-220px">
											<li><a class="dropdown-item rounded-2"
												href="<%=request.getContextPath()%>/admin/sales">일일 차트</a></li>
											<li><a class="dropdown-item rounded-2"
												href="<%=request.getContextPath()%>/admin/sales/weekly">요일별
													차트</a></li>
											<li><a class="dropdown-item rounded-2"
												href="<%=request.getContextPath()%>/admin/sales/monthly">월간
													차트</a></li>
											<li><a class="dropdown-item rounded-2"
												href="<%=request.getContextPath()%>/admin/sales/period">기간별
													차트</a></li>
										</ul>
									</div>
								</div>

								<div class="row">

									<div class="sales-table col-lg-12">

										<!-- 일일매출 -->
										<div class="sales-type-content" id="daily-sales">

											<div class="dflex-column">
												<div class="dflex-row">
													<canvas id="dailySalesBarChart" width="575" height="400"></canvas>
													<canvas id="dailyAmountBarChart" width="575" height="400"></canvas>
												</div>

												<table class="table">
													<thead>
														<tr class="table-dark">
															<th>카테고리</th>
															<th>주문 수</th>
															<th>매출</th>
														</tr>
													</thead>
													<tbody>
														<c:forEach items="${mCtgrs}" var="mCtgr">
															<tr class="table-secondary">
																<th>${mCtgr.m_ctgr_name}</th>
																<td></td>
																<td></td>
															</tr>
															<c:forEach items="${dailySales}" var="dailysales">

																<c:choose>
																	<c:when
																		test="${dailysales.m_ctgr_num eq mCtgr.m_ctgr_num}">
																		<tr>
																			<td>${dailysales.s_ctgr_name}</td>
																			<td>${dailysales.daily_sales}</td>
																			<td>${dailysales.daily_amount}</td>
																		</tr>
																	</c:when>
																	<c:otherwise></c:otherwise>
																</c:choose>
															</c:forEach>
														</c:forEach>
													</tbody>
												</table>
											</div>
										</div>
										<!-- 일일 매출 끝-->

									</div>
								</div>



							</div>
						</div>
					</div>
				</div>



			</main>

		</div>
	</div>
<script src="<%=request.getContextPath()%>/assets/admin/bootstrap/js/bootstrap.bundle.min.js"></script>
	
	<script
		src="https://cdn.jsdelivr.net/npm/feather-icons@4.28.0/dist/feather.min.js"
		integrity="sha384-uO3SXW5IuS1ZpFPKugNNWqTZRRglnUJK6UAZ/gxOX80nxEkN9NcGZTftn6RzhGWE"
		crossorigin="anonymous"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/chart.js@2.9.4/dist/Chart.min.js"
		integrity="sha384-zNy6FEbO50N+Cg5wap8IKA4M/ZnLJgzc6w2NqACZaK0u0FXfOWRRJOnQtpZun8ha"
		crossorigin="anonymous"></script>
<script src="<%=request.getContextPath()%>/assets/admin/js/dashboard.js"></script>
	<script>
    function colorize() {
    	var r = Math.floor(Math.random()*200);
    	var g = Math.floor(Math.random()*200);
    	var b = Math.floor(Math.random()*200);
    	var color = 'rgba(' + r + ', ' + g + ', ' + b + ', 0.5)';
    	return color;
    }
	
	var jsonData = ${json}
		;
		var jsonObj = JSON.stringify(jsonData);
		var jData = JSON.parse(jsonObj);

		var labelList = new Array();
		var salesList = new Array();
		var amountList = new Array();
		var colorList = new Array();

		for (var i = 0; i < jData.length; i++) {
			var d = jData[i];

			labelList.push(d.s_ctgr_name);

			salesList.push(d.daily_sales);

			amountList.push(d.daily_amount);
			colorList.push(colorize());
		}

		var dailySalesData = {
			labels : labelList,
			datasets : [ {
				backgroundColor : colorList,
				data : salesList,
				hoverOffset : 5
			} ],
			options : {
				scales : {
					y : {
						beginAtZero : true
					}
				},
				responsive : false
			}
		};

		var dailyAmountData = {
			labels : labelList,
			datasets : [ {
				backgroundColor : colorList,
				data : amountList,
				hoverOffset : 5
			} ],
			options : {
				scales : {
					y : {
						beginAtZero : true
					}
				},
				responsive : false
			}
		};

		var dailySalesChart = document.getElementById('dailySalesBarChart');
		var dailyAmountChart = document.getElementById('dailyAmountBarChart');

		var getDailySalesChart = new Chart(dailySalesChart, {
			type : 'bar',
			label : '',
			barPercentage : 0.1,
			data : dailySalesData,
			options : {
				scales : {
					y : {
						beginAtZero : true
					}
				},
				responsive : false
			},
			borderWidth : 1,
			hoverOffset : 5,
		});

		var getDailyAmountChart = new Chart(dailyAmountChart, {
			type : 'bar',
			label : '',
			barPercentage : 0.1,
			data : dailyAmountData,
			options : {
				scales : {
					y : {
						beginAtZero : true
					}
				},
				responsive : false
			},
			borderWidth : 1,
			hoverOffset : 5,
		});
	</script>
</body>

</html>
  