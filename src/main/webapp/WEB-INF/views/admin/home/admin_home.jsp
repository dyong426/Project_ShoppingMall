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
                <div class="card-header">매출 현황</div>
                <div class="card-body">
                	<canvas id="dash-monthly-amount-chart" style="width: 100%; height: 100%;"></canvas>
                </div>
            </div>

            <div class="card grid-sub">
                <div class="card-header">
                    주문 현황
                </div>
                <div class="card-body">
                    <canvas id="dash-monthly-sales-chart" style="width: 100%; height: 100%;"></canvas>
                    <table class="table">
						<thead>
							<tr>
								<th></th>
								<th></th>
								<th></th>
							</tr>
						</thead>
						<tbody>
							<c:forEach items="${monthlyMCtgrOrders}" var="monthlyMCtgrOrder">
								<tr>
									<td>
										<c:if test="${monthlyMCtgrOrder.m_ctgr_num eq 1}">
											<i class="fa-solid fa-shirt"></i>
										</c:if>
										<c:if test="${monthlyMCtgrOrder.m_ctgr_num eq 2}">
											<i class="fa-solid fa-mobile-screen-button"></i>
										</c:if>
										<c:if test="${monthlyMCtgrOrder.m_ctgr_num eq 3}">
											<i class="fa-solid fa-mug-saucer"></i>
										</c:if>
										<c:if test="${monthlyMCtgrOrder.m_ctgr_num eq 4}">
											<i class="fa-solid fa-image"></i>
										</c:if>
									</td>
									<td>${monthlyMCtgrOrder.m_ctgr_name}</td>
									<td>
										<c:choose>
											<c:when test="${monthlyMCtgrOrder.sales eq 0}">
												0
											</c:when>
											<c:otherwise>
												${monthlyMCtgrOrder.sales}
											</c:otherwise>
										</c:choose>
									</td>
								</tr>
							
							</c:forEach>
						</tbody>
                    </table>
                </div>
            </div>

            <div class="card grid-news1">

                <div class="card-header d-flex justify-content-between">
                	<div>
                    <i class="fa-solid fa-cart-plus fa-lg"></i>
                    <span>신규주문</span>
                	</div>
                    <button class="btn badge text-bg-primary fs-8" onclick="location.href='/jhc/admin/order'">더보기</button>
                    
                </div>
                <div class="card-body">
                    <table class="table">
                    	
                    	</thead>
						<tbody>
						
							<c:forEach items="${dailyMCtgrOrders}" var="dailyMCtgrOrder">
								<tr>
									<td>
										<c:if test="${dailyMCtgrOrder.m_ctgr_num eq 1}">
											<i class="fa-solid fa-shirt"></i>
										</c:if>
										<c:if test="${dailyMCtgrOrder.m_ctgr_num eq 2}">
											<i class="fa-solid fa-mobile-screen-button"></i>
										</c:if>
										<c:if test="${dailyMCtgrOrder.m_ctgr_num eq 3}">
											<i class="fa-solid fa-mug-saucer"></i>
										</c:if>
										<c:if test="${dailyMCtgrOrder.m_ctgr_num eq 4}">
											<i class="fa-solid fa-image"></i>
										</c:if>
									</td>
									<td>${dailyMCtgrOrder.m_ctgr_name}</td>
									<td>
										<c:choose>
											<c:when test="${dailyMCtgrOrder.sales eq 0}">
												0
											</c:when>
											<c:otherwise>
												${dailyMCtgrOrder.sales}
											</c:otherwise>
										</c:choose>
									</td>
								</tr>
							</c:forEach>
						</tbody>                        
                    </table>
                </div>
            </div>
            
            <div class="card grid-news2">
                <div class="card-header d-flex justify-content-between">
                	<div>
                    <i class="fa-solid fa-user-plus fa-lg"></i>
                    신규 회원
                	</div>
                	<button class="btn badge text-bg-primary fs-8" onclick="location.href='/jhc/admin/member'">더보기</button>
                </div>
                
                <div class="card-body">
					<button type="button" class="btn badge text-bg-dark position-relative fw-bold fs-4 disabled" style="width: 5em;">
						${newMemCnt.monthly}
						<span class="position-absolute top-0 start-100 translate-middle badge rounded-pill bg-danger">
							${newMemCnt.yesterday}+ <span class="visually-hidden">new member count</span>
						</span>
					</button>
				</div>
            </div>
            <div class="card grid-news4">
                <div class="card-header d-flex justify-content-between">
                	<div>
                    <i class="fa-solid fa-headset fa-lg"></i>
                    게시판 문의
                	</div>
                	<button class="btn badge text-bg-primary fs-8" onclick="location.href='/jhc/admin/contact'">더보기</button>
                </div>
                <div class="card-body">
                	<table class="table">
                		<tbody>
                			<c:forEach items="${csCtgrs}" var="csCtgr">
                				<tr>
                					<td class="fs-6">[${csCtgr.cs_ctgr_name}]</td>
                					<td>${csCtgr.count}</td>
                				</tr>
                			</c:forEach>
                		</tbody>
                	</table>
                
                </div>
                
            </div>
 		</div>
        
        <script type="text/javascript">
        
        function colorize() {
        	var r = Math.floor(Math.random()*200);
        	var g = Math.floor(Math.random()*200);
        	var b = Math.floor(Math.random()*200);
        	var color = 'rgba(' + r + ', ' + g + ', ' + b + ', 0.7)';
        	return color;
        }
        	
        const dashMonthlySalesChart = document.getElementById('dash-monthly-sales-chart'); 
        
        var jsonString = ${mCtgrOrdersJson};
        var jsonObj = JSON.stringify(jsonString);
        var jsonData = JSON.parse(jsonObj);
      	console.log(jsonData);
      	
      	var labelList = new Array();
        var salesList = new Array();
        var colorList = new Array();
        
        var basicColor = ['rgba(255, 99, 132, 0.7)',
        'rgba(255, 159, 64, 0.7)',
        'rgba(255, 205, 86, 0.7)',
        'rgba(75, 192, 192, 0.7)'];
        
        colorList.push(basicColor[0]);
        colorList.push(basicColor[1]);
        colorList.push(basicColor[2]);
        colorList.push(basicColor[3]);
        
        for(var i = 0; i<jsonData.length; i++) {
        	var d = jsonData[i];
            
        	labelList.push(d.m_ctgr_name);
           
        	salesList.push(d.sales);
           	
        	colorList.push(colorize());
        	console.log(colorList);
        }
        
        const doughnutCategory = {
        	    labels:labelList,
        	    datasets: [{
        	        label: 'Sales',
        	        data: salesList,
        	        backgroundColor: colorList,
        	        hoverOffset: 10,
        	    }]
        	};
        
        const chartDoughnut = new Chart(dashMonthlySalesChart, {
            type: 'doughnut',
            data: doughnutCategory,
            options: {
                responsive: false,
                cutout:30,
                radius: 60
            }

        });
        
        
		const dashMonthlyAmountChart = document.getElementById('dash-monthly-amount-chart');
        
        
        var monthlyJsonString = ${monthlySalesJson};
        var monthlyJsonObj = JSON.stringify(monthlyJsonString);
        var monthlyJsonData = JSON.parse(monthlyJsonObj);
      	console.log(monthlyJsonData);
      	
      	var monthList = new Array();
        var monthlySalesList = new Array();
        var monthlyAmountList = new Array();
        
        for(var i = 0; i<monthlyJsonData.length; i++) {
        	var d = monthlyJsonData[i];
            
        	monthList.push(d.month);
           
        	monthlySalesList.push(d.sales);
           	monthlyAmountList.push(d.total_amount);
        	colorList.push(colorize());
        }
        
        const lineCategory = {
        	    labels:monthList,
        	    datasets: [{
        	        label: '판매량',
        	    	type: 'line',
        	    	fill : false,
                    lineTension : 0.2,
        	        data: monthlySalesList,
        	        backgroundColor:  'rgba(75, 192, 192, 0.7)',
        	        borderColor:  'rgba(75, 192, 192, 0.7)',
        	        hoverOffset: 10,
        	    }, {
        	        label: '매출 (단위: 십만)',
        	        type: 'line',
        	        fill : false,
                    lineTension : 0.2,
        	        data: monthlyAmountList,
        	        borderColor: 'rgba(255, 99, 132, 0.7)',
        	        backgroundColor: 'rgba(255, 99, 132, 0.7)',
        	        hoverOffset: 10,
        	    }]
        	};
        
        const chartLine = new Chart(dashMonthlyAmountChart, {
            type: 'line',
            data: lineCategory,
            options: {
                responsive: false,
            }

        });
        
        
        	
        </script>
        
        <!-- include footer -->
        <%@ include file="../include/footer.jsp" %>
