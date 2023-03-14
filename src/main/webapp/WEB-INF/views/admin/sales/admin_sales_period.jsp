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

                            <button type="button" class="btn btn-sales btn-secondary" onclick="location.href='<%=request.getContextPath()%>/admin/sales/monthly'">월간 매출</button>

                            <button type="button" class="btn btn-sales btn-primary" onclick="location.href='<%=request.getContextPath()%>/admin/sales/period'">기간별 매출</button>
                        </div>

                        <div class="sales-table col-lg-12">

                            <!-- 기간별 매출 -->

                            <div class="sales-type-content" id="period-sales">
                                
                                <form action="<%=request.getContextPath()%>/admin/sales/period" method="GET">
                                    <div class="card-dflex-row">

                                        <input type="date" class="form-control" name="startDate">
                                        <input type="date" class="form-control" name="endDate">
                                        <input type="submit" value="검색">
                                    </div>
                                </form>
                                <div class="card-dflex-column">
                                    <canvas id="periodLineChart" width="1200" height="400"></canvas>
                                </div>
                                
                                <table class="table" id="period-sales-table">
                                    
                                    <thead>
                                        <tr class="table-dark">
                                            <th>날짜</th>
                                            <th>판매량</th>
                                            <th>매출</th>
                                        </tr>
                                    </thead>

                                    <tbody>
                                    	<c:forEach items="${periodSalesList}" var="periodSales">                                    	
                                        <tr>
                                            <td class="table-secondary col-md-2">${periodSales.ord_date}</td>
                                            <td class="table-light">${periodSales.count}</td>
                                            <td class="table-light">${periodSales.total_amount}</td>
                                        </tr>
                                    	</c:forEach>
                                        
                                    </tbody>

                                </table>
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
	
	<!-- 기간별 차트-->
	var pJsonData = ${periodJson};
	console.log(pJsonData);
	var pjsonObj = JSON.stringify(pJsonData);
	console.log(pjsonObj);
    var pjData = JSON.parse(pjsonObj);
    console.log(pjData);
	
    var periodLabelList = new Array();
    var periodSalesList = new Array();
    var periodAmountList = new Array();
    var periodColorList = new Array();
    const lineDatas = new Array();
    for(var i = 0; i < pjData.length; i++) {
    	var pd = pjData[i];
 		
    	periodLabelList.push(pd.ord_date);
    	periodSalesList.push(pd.count);
    	periodAmountList.push(pd.total_amount);
		periodColorList.push(colorize());
    }
	
	const periodLineDatas = {
	        labels: periodLabelList,
	        datasets: [{
		        label: '판매량',
		        data: periodSalesList,
		        borderColor: 'rgba(255, 159, 64, 0.7)',
		        backgroundColor: 'rgba(255, 159, 64, 0.7)',
		        fill: false,
		        lineTension: 0
		    },{
		        label: '매출',
		        data: periodAmountList,
		        borderColor: 'rgba(255, 99, 132, 0.7)',
		        backgroundColor: 'rgba(255, 99, 132, 0.7)',
		        fill: false,
		        lineTension: 0
		    }]
	    };
	
	new Chart(document.getElementById("periodLineChart"), {
	    type: 'line',
	    data: periodLineDatas,
	    options: {
	        responsive: false,
	        title: {
	            display: true,
	            text: '기간별 차트'
	        },
	        hover: {
	            mode: 'nearest',
	            intersect: true
	        }
	    }
	});
	
		</script>
		<!-- include footer -->
		<%@ include file="../include/footer.jsp"%>
