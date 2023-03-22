<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
    <!-- include header -->

    <%@ include file="../include/header.jsp" %>


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

										<!-- 주간 매출 -->

										<div class="sales-type-content" id="weekly-sales">
											<div>
												<canvas id="weeklyLineChart" width="1150" height="400"></canvas>
											</div>
											<!-- 주간 판매량 테이블 -->
											<div class="d-flex flex-row col-md-12">
												<table class="table text-center" id="weeklySalesTable">
													<thead>
														<tr class="table-dark">
															<th class="col-md-2" scope="col">카테고리</th>
															<th scope="col">월</th>
															<th scope="col">화</th>
															<th scope="col">수</th>
															<th scope="col">목</th>
															<th scope="col">금</th>
															<th scope="col">토</th>
															<th scope="col">일</th>
															<th scope="col">총 합</th>
														</tr>
													</thead>

													<tbody>
														<c:forEach items="${weeklySalesMcList}"
															var="weeklySalesMc">

															<tr class="table-secondary">
																<th>${weeklySalesMc.ctgr_name}</th>
																<td>${weeklySalesMc.mon}</td>
																<td>${weeklySalesMc.tues}</td>
																<td>${weeklySalesMc.wednes}</td>
																<td>${weeklySalesMc.thurs}</td>
																<td>${weeklySalesMc.fri}</td>
																<td>${weeklySalesMc.satur}</td>
																<td>${weeklySalesMc.sun}</td>
																<td>${weeklySalesMc.total}</td>
															</tr>

															<c:forEach items="${weeklySalesScList}"
																var="weeklySalesSc">
																<c:choose>
																	<c:when
																		test="${weeklySalesSc.m_ctgr_num eq weeklySalesMc.m_ctgr_num}">
																		<tr>
																			<th>${weeklySalesSc.ctgr_name}
																			</td>
																			<td>${weeklySalesSc.mon}</td>
																			<td>${weeklySalesSc.tues}</td>
																			<td>${weeklySalesSc.wednes}</td>
																			<td>${weeklySalesSc.thurs}</td>
																			<td>${weeklySalesSc.fri}</td>
																			<td>${weeklySalesSc.satur}</td>
																			<td>${weeklySalesSc.sun}</td>
																			<td>${weeklySalesSc.total}</td>
																		</tr>
																	</c:when>
																	<c:otherwise>
																	</c:otherwise>
																</c:choose>
															</c:forEach>

														</c:forEach>
													</tbody>

												</table>
											</div>
										</div>
										<!-- 주간 매출 끝-->

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

	var wJsonData = ${weeklyJson};
	console.log(wJsonData);
	var wjsonObj = JSON.stringify(wJsonData);
	console.log(wjsonObj);
    var wjData = JSON.parse(wjsonObj);
    console.log(wjData);
	
    const lineDatas = new Array();
    for(var i = 0; i < wjData.length; i++) {
    	var wd = wjData[i];
    	var weeklySalesList = new Array();
 
    	weeklySalesList.push(wd.mon);
    	weeklySalesList.push(wd.tues);
    	weeklySalesList.push(wd.wednes);
    	weeklySalesList.push(wd.thurs);
    	weeklySalesList.push(wd.fri);
    	weeklySalesList.push(wd.satur);
    	weeklySalesList.push(wd.sun);
		var color = colorize();
		var createLineData = {
	        label: wd.ctgr_name,
	        data: weeklySalesList,
	        borderColor: color,
	        backgroundColor: color,
	        fill: false,
	        lineTension: 0
	    };
		console.log(weeklySalesList);
		console.log(createLineData);
		
		lineDatas.push(createLineData);
    }
	
	const weeklyLineDatas = {
	        labels: ['월', '화', '수', '목', '금', '토', '일'],
	        datasets: lineDatas
	    };
	
	new Chart(document.getElementById("weeklyLineChart"), {
	    type: 'line',
	    data: weeklyLineDatas,
	    options: {
	        responsive: false,
	        title: {
	            display: true,
	            text: '라인 차트 테스트'
	        },
	        hover: {
	            mode: 'nearest',
	            intersect: true
	        }
	    }
	});
		</script>
</body>
</html>