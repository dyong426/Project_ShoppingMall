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
                        <%@ include file="../include/left_nav_bar.jsp" %>


                            <!-- content-container -->
                            <main class="col-md-9 ms-sm-auto col-lg-10 px-md-4">



                                <div class="row mt-4">
                                    <div class="col-lg-12">
                                        <div
                                            class="row g-0 border rounded flex-md-row mb-4 shadow-sm h-md-250 position-relative">
                                            <div class="col p-4 d-flex flex-column position-static">
                                                <div class="d-flex flex-row justify-content-between">
                                                    <h3 class="mb-0 fw-bold mb-4">매출차트</h3>


                                                    <form action="<%=request.getContextPath()%>/admin/sales/period"
                                                        method="GET">
                                                        <div class="col-md-12 d-flex flex-row justify-content-evenly">
                                                            <div class="col-md-5 mb-3">
                                                                <label for="startDate"
                                                                    class="form-label">시작일</label>
                                                                <input type="date" class="form-control" id="startDate"
                                                                    name="startDate">
                                                            </div>
                                                            <div class="col-md-5">
                                                                <label for="endDate"
                                                                    class="form-label">종료일</label>
                                                                <input type="date" class="form-control" id="endDate"
                                                                    name="endDate">
                                                            </div>
                                                            <div class="d-flex flex-column justify-content-center mt-2">
	                                                            <button type="submit" class="btn btn-sm btn-dark" style="height:50%;">검색</button>
                                                            </div>
                                                        </div>
                                                    </form>

                                                    <!--<div class="d-flex gap-5 justify-content-center">-->
                                                    <div class="dropdown">
                                                        <a class="btn btn-dark dropdown-toggle" href="#" role="button"
                                                            data-bs-toggle="dropdown" aria-expanded="false">
                                                            차트 종류
                                                        </a>
                                                        <ul
                                                            class="dropdown-menu dropdown-menu-dark gap-1 p-2 rounded-3 mx-0 border-0 shadow w-220px">
                                                            <li><a class="dropdown-item rounded-2"
                                                                    href="<%=request.getContextPath()%>/admin/sales">일일
                                                                    차트</a>
                                                            </li>
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

                                                        <!-- 기간별 차트 -->

                                                        <div class="sales-type-content" id="period-sales">

                                                            <div class="d-flex flex-column">
                                                                <canvas id="periodLineChart" width="1200"
                                                                    height="400"></canvas>
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
                                                                    <c:forEach items="${periodSalesList}"
                                                                        var="periodSales">
                                                                        <tr>
                                                                            <td class="table-secondary col-md-2">
                                                                                ${periodSales.ord_date}</td>
                                                                            <td class="table-light">${periodSales.count}
                                                                            </td>
                                                                            <td class="table-light">
                                                                                ${periodSales.total_amount}</td>
                                                                        </tr>
                                                                    </c:forEach>

                                                                </tbody>
                                                            </table>
                                                        </div>
                                                        <!-- 기간별 차트 끝-->

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
</body>
</html>
