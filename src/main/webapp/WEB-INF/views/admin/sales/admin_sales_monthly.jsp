<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!-- include header -->

<%@ include file="../include/header.jsp"%>


<!-- admin_home -->

<body>

	<!-- include top search bar -->

	<%@ include file="../include/top_search_bar.jsp"%>

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

										<!-- 월간 매출-->

										<div class="sales-type-content" id="monthly-sales">
											<div class="card-dflex-column">
												<canvas id="dash-monthly-amount-chart"
													width="1150" height="400"></canvas>
											</div>
											<table class="table">
												<thead>
													<tr class="table-dark">
														<th>월</th>
														<th>주문 수</th>
														<th style="width: 20%;">매출(단위:십만)</th>
													</tr>
												</thead>
												<tbody>
													<c:forEach items="${monthlySalesList}" var="monthlySales">
														<tr>
															<td>${monthlySales.month}</td>
															<td>${monthlySales.sales}</td>
															<td>${monthlySales.total_amount}</td>
														</tr>
													</c:forEach>
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

			</main>

		</div>
	</div>

	<script src="<%=request.getContextPath()%>/assets/admin/bootstrap/js/bootstrap.bundle.min.js"></script>
	<script src="<%=request.getContextPath()%>/assets/admin/bootstrap/js/bootstrap.bundle.js"></script>
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
		const dashMonthlyAmountChart = document
				.getElementById('dash-monthly-amount-chart');

		var monthlyJsonString = ${monthlyJson};
		var monthlyJsonObj = JSON.stringify(monthlyJsonString);
		var monthlyJsonData = JSON.parse(monthlyJsonObj);
		console.log(monthlyJsonData);

		var monthList = new Array();
		var monthlySalesList = new Array();
		var monthlyAmountList = new Array();
		for (var i = 0; i < monthlyJsonData.length; i++) {
			var d = monthlyJsonData[i];

			monthList.push(d.month);

			monthlySalesList.push(d.sales);
			monthlyAmountList.push(d.total_amount);
		}

		const lineCategory = {
			labels : monthList,
			datasets : [ {
				label : '판매량',
				type : 'line',
				fill : false,
				lineTension : 0.2,
				data : monthlySalesList,
				backgroundColor : 'rgba(75, 192, 192, 0.7)',
				borderColor : 'rgba(75, 192, 192, 0.7)',
				hoverOffset : 10,
			}, {
				label : '매출 (단위: 십만)',
				type : 'line',
				fill : false,
				lineTension : 0.2,
				data : monthlyAmountList,
				borderColor : 'rgba(255, 99, 132, 0.7)',
				backgroundColor : 'rgba(255, 99, 132, 0.7)',
				hoverOffset : 10,
			} ]
		};

		const chartLine = new Chart(dashMonthlyAmountChart, {
			type : 'line',
			data : lineCategory,
			options : {
				responsive : false,
			}

		});
	</script>
</body>
</html>
