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

                            <button type="button" class="btn btn-sales btn-primary" onclick="location.href='<%=request.getContextPath()%>/admin/sales/weekly'">요일별 매출</button>

                            <button type="button" class="btn btn-sales btn-secondary" onclick="location.href='<%=request.getContextPath()%>/admin/sales/monthly'">월간 매출</button>

                            <button type="button" class="btn btn-sales btn-secondary" onclick="location.href='<%=request.getContextPath()%>/admin/sales/period'">기간별 매출</button>
                        </div>

                        <div class="sales-table col-lg-12">
                        
                        	 <!-- 주간 매출 -->

                            <div class="sales-type-content" id="weekly-sales">
                           	<div>
	                            <canvas id="weeklyLineChart" width="1200" height="400"></canvas>
                           	</div>
                                <!-- 주간 판매량 테이블 -->
                                <div class="dflex-row">
                                <table class="table" id="weeklySalesTable">
                                    <thead>
                                        <tr class="table-dark">
                                            <th class="col-md-2"scope="col">카테고리</th>
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
                                        <c:forEach items="${weeklySalesMcList}" var="weeklySalesMc">
                                        
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
                                        	
                                        	<c:forEach items="${weeklySalesScList}" var="weeklySalesSc">
                                        		<c:choose>
                                        			<c:when test="${weeklySalesSc.m_ctgr_num eq weeklySalesMc.m_ctgr_num}">
                                        				<tr>
                                        					<th>${weeklySalesSc.ctgr_name}</td>
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
		<!-- include footer -->
		<%@ include file="../include/footer.jsp"%>
                            
