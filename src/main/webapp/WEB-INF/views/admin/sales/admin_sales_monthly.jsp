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
            
            	<div class="card-header">매출 통계</div>
                <div class="card-body">

                    <div class="row">
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
                                    <canvas id="dash-monthly-amount-chart" style="width: 100%; height:30%;"></canvas>
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

		<script>
    
    const dashMonthlyAmountChart = document.getElementById('dash-monthly-amount-chart');
    
    
    var monthlyJsonString = ${monthlyJson};
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
		<%@ include file="../include/footer.jsp"%>
