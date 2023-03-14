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
                            <button type="button" class="btn btn-sales btn-primary"  onclick="location.href='<%=request.getContextPath()%>/admin/sales'">일일 매출</button>

                            <button type="button" class="btn btn-sales btn-secondary" onclick="location.href='<%=request.getContextPath()%>/admin/sales/weekly'">요일별 매출</button>

                            <button type="button" class="btn btn-sales btn-secondary" onclick="location.href='<%=request.getContextPath()%>/admin/sales/monthly'">월간 매출</button>

                            <button type="button" class="btn btn-sales btn-secondary" onclick="location.href='<%=request.getContextPath()%>/admin/sales/period'">기간별 매출</button>
                        </div>

                        <div class="sales-table col-lg-12">

                            <!-- 일일매출 -->
                            <div class="sales-type-content" id="daily-sales">

                                <div class="dflex-column">
                                	<div class="dflex-row">
                                		<canvas id="dailySalesBarChart" width="600" height="400"></canvas>
                                		<canvas id="dailyAmountBarChart" width=600" height="400"></canvas>
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
													<c:when test="${dailysales.m_ctgr_num eq mCtgr.m_ctgr_num}">
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
  

		<script>
    function colorize() {
    	var r = Math.floor(Math.random()*200);
    	var g = Math.floor(Math.random()*200);
    	var b = Math.floor(Math.random()*200);
    	var color = 'rgba(' + r + ', ' + g + ', ' + b + ', 0.5)';
    	return color;
    }
	
	var jsonData = ${json};
	var jsonObj = JSON.stringify(jsonData);
    var jData = JSON.parse(jsonObj);
    
    var labelList = new Array();
    var salesList = new Array();
    var amountList = new Array();
    var colorList = new Array();
    		
    for(var i = 0; i<jData.length; i++) {
    	var d = jData[i];
        
    	labelList.push(d.s_ctgr_name);
       
    	salesList.push(d.daily_sales);
       	
    	amountList.push(d.daily_amount);
    	colorList.push(colorize());
    }

    var dailySalesData = {
        labels: labelList,
        datasets: [{
                backgroundColor: colorList,
                data : salesList,
                hoverOffset: 5
        }],
        options :{
        scales: {
            y: {
                beginAtZero: true
            }
        },
        responsive: false
        }
    };
    
    var dailyAmountData = {
          labels: labelList,
          datasets: [{
                  backgroundColor: colorList,
                  data : amountList,
                  hoverOffset: 5
          }],
          options :{
          scales: {
              y: {
                  beginAtZero: true
              }
          },
          responsive: false
          }
     };
    
    var dailySalesChart = document.getElementById('dailySalesBarChart');
	var dailyAmountChart = document.getElementById('dailyAmountBarChart');
	
	
	var getDailySalesChart = new Chart(dailySalesChart, {
		type : 'bar',
		label : '',
	    barPercentage: 0.1,
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
	    barPercentage: 0.1,
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
		<!-- include footer -->
		<%@ include file="../include/footer.jsp"%>
