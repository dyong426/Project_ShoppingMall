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
                  <div class="col-lg-8">
                    <div class="row g-0 border rounded flex-md-row mb-4 shadow-sm h-md-250 position-relative">
                      <div class="col p-4 d-flex flex-column position-static">
                      	<div class="d-flex flex-row justify-content-between">
	                        <h3 class="mb-0 fw-bold mb-4">월매출현황</h3>
	                        <button class="btn btn-dark btn-sm" style="height: 30px;" onclick="location.href='<%=request.getContextPath()%>/admin/sales/monthly'">더보기</button>
                      	</div>
                        <canvas id="dash-monthly-amount-chart" style="width: 100%; height: 300px;"></canvas>
                      </div>
                    </div>
                  </div>

                  <div class="col-lg-4">
                    <div class="row g-0 border rounded flex-md-row mb-4 shadow-sm h-md-250 position-relative">
                      <div class="col p-4 d-flex flex-column position-static">
                        <div class="d-flex flex-row justify-content-between">
                        	<h3 class="mb-0 fw-bold mb-4">신규주문</h3>
                        	<button class="btn btn-dark btn-sm" style="height: 30px;" onclick="location.href='<%=request.getContextPath()%>/admin/order'">더보기</button>
                      	</div>
                        <table class="table">
                          <thead>
                              <tr>
                                <th></th>
                                <th>카테고리</th>
                                <th>주문수</th>
                              </tr>
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
                  </div>
                 </div>

                  <div class="row">
                    <div class="col-lg-8">
                      <div class="row g-0 border rounded flex-md-row mb-4 shadow-sm h-md-250 position-relative">
                        <div class="col p-4 d-flex flex-column position-static">
                          <div class="d-flex flex-row justify-content-between">
                        	<h3 class="mb-0 fw-bold mb-4">주문현황</h3>
                        	<button class="btn btn-dark btn-sm" style="height: 30px;" onclick="location.href='<%=request.getContextPath()%>/admin/sales'">더보기</button>
                      	  </div>
						  <div class="col d-flex flex-row position-static">
                          <canvas id="dash-monthly-sales-chart" style="width: 100%; height: 100%;"></canvas>
                          <table class="table">
                            <thead>
                              <tr>
                                <th></th>
                                <th>카테고리</th>
                                <th>주문수</th>
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
                      </div>
                    </div>

                    <div class="col-lg-4">
                      <div class="row g-0 border rounded flex-md-row mb-4 shadow-sm h-md-250 position-relative">
                        <div class="col p-4 d-flex flex-column position-static">
                          <div class="d-flex flex-row justify-content-between">
                        	<h3 class="mb-0 fw-bold mb-4">게시판 문의</h3>
                        	<button class="btn btn-dark btn-sm" style="height: 30px;" onclick="location.href='<%=request.getContextPath()%>/admin/contact'">더보기</button>
                      	  </div>
                          <table class="table">
                          	<thead>
                          		<th>문의사항</th>
                          		<th></th>
                          	</thead>
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

        <script type="text/javascript">

          function colorize() {
            var r = Math.floor(Math.random() * 200);
            var g = Math.floor(Math.random() * 200);
            var b = Math.floor(Math.random() * 200);
            var color = 'rgba(' + r + ', ' + g + ', ' + b + ', 0.7)';
            return color;
          }

          const dashMonthlySalesChart = document.getElementById('dash-monthly-sales-chart');

          var jsonString = ${ mCtgrOrdersJson };
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

          for (var i = 0; i < jsonData.length; i++) {
            var d = jsonData[i];

            labelList.push(d.m_ctgr_name);

            salesList.push(d.sales);

            colorList.push(colorize());
            console.log(colorList);
          }

          const doughnutCategory = {
            labels: labelList,
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
              cutout: 30,
              radius: 60
            }

          });


          const dashMonthlyAmountChart = document.getElementById('dash-monthly-amount-chart');


          var monthlyJsonString = ${ monthlySalesJson };
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
            colorList.push(colorize());
          }

          const lineCategory = {
            labels: monthList,
            datasets: [{
              label: '판매량',
              type: 'line',
              fill: false,
              lineTension: 0.2,
              data: monthlySalesList,
              backgroundColor: 'rgba(75, 192, 192, 0.7)',
              borderColor: 'rgba(75, 192, 192, 0.7)',
              hoverOffset: 10,
            }, {
              label: '매출 (단위: 십만)',
              type: 'line',
              fill: false,
              lineTension: 0.2,
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
    </body>
</html>