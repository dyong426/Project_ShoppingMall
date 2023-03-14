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
                        <div class="col-6">
                            <button type="button" class="btn btn-sales btn-primary" onclick="openSales(event, 'daily-sales')">일일 매출</button>

                            <button type="button" class="btn btn-sales btn-secondary" onclick="openSales(event, 'weekly-sales')">주간 매출</button>

                            <button type="button" class="btn btn-sales btn-secondary" onclick="openSales(event, 'monthly-sales')">월간 매출</button>

                            <button type="button" class="btn btn-sales btn-secondary" onclick="openSales(event, 'period-sales')">기간별 매출</button>
                        </div>

                        <div class="sales-table col-lg-12">

                            <!-- 일일매출 -->
                            <div class="sales-type-content" id="daily-sales" style="display: block">

                                <div class="dflex-column">
                                    <c:forEach items="${mCtgrs}" var="mCtgr">
                                    <table class="table">
										<thead>
											<tr>
												<th></th>
                                                <th>${mCtgr.m_ctgr_name}</th>
                                                <th>주문 수</th>
                                                <th>매출</th>
                                                <th></th>
											</tr>
										</thead>
										<tbody>
											<c:forEach items="${dailySales}" var="dailysales">
											
												<c:choose>
													<c:when test="${dailysales.m_ctgr_num eq mCtgr.m_ctgr_num}">
														<tr>
                                                			<td></td>
                                                			<td>${dailysales.s_ctgr_name}</td>
                                                			<td>${dailysales.daily_sales}</td>
                                                			<td>${dailysales.daily_amount}</td>
                                                			<td></td>
                                            			</tr>
													</c:when>
													<c:otherwise></c:otherwise>
												</c:choose>
											</c:forEach>
										</tbody>
									</table>
									</c:forEach>                                    
                                    <canvas id="dailyChart" width="300" height="200"></canvas>
                                </div>

                                <
                            <!-- 일일 매출 끝-->

                            <!-- 주간 매출 -->

                            <div class="sales-type-content" id="weekly-sales" style="display: none;">
                                <!-- 주간 판매량 테이블 -->
                                <div class="dflex-row">
                                <table class="table">
                                    <thead>
                                        <tr>
                                            <th scope="col">판매량</th>
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
                                        <tr>
                                            <td scope="row">의류</td>
                                            <td>1</td>
                                            <td>1</td>
                                            <td>2</td>
                                            <td>2</td>
                                            <td>2</td>
                                            <td>2</td>
                                            <td>2</td>
                                            <td>2</td>
                                        </tr>

                                        <tr>
                                            <td scope="row">폰케이스</td>
                                            <td>100</td>
                                            <td>100</td>
                                            <td>200</td>
                                            <td>300</td>
                                            <td>500</td>
                                            <td>800</td>
                                            <td>1300</td>                                            
                                            <td>3300</td>                                                                                        
                                        </tr>
                                        <tr>
                                            <td scope="row">홈 데코</td>
                                            <td>100</td>
                                            <td>100</td>
                                            <td>200</td>
                                            <td>300</td>
                                            <td>500</td>
                                            <td>800</td>
                                            <td>1300</td>                                            
                                            <td>3300</td>                                                                                        
                                        </tr>
                                        <tr>
                                            <td scope="row">액자</td>
                                            <td>100</td>
                                            <td>100</td>
                                            <td>200</td>
                                            <td>300</td>
                                            <td>500</td>
                                            <td>800</td>
                                            <td>1300</td>                                            
                                            <td>3300</td>                                                                                        
                                        </tr>

                                    </tbody>

                                </table>
                                    <canvas id="barChart" width="400" height="200"></canvas>
                                </div>
                                <div class="card-dflex-row">
                                <!-- 주간 매출 테이블-->

                                <table class="table">
                                    <thead>
                                        <tr>
                                            <th scope="col">매출</th>
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
                                        <tr>
                                            <td scope="row">의류</td>
                                            <td>1</td>
                                            <td>1</td>
                                            <td>2</td>
                                            <td>2</td>
                                            <td>2</td>
                                            <td>2</td>
                                            <td>2</td>
                                            <td>2</td>
                                        </tr>

                                        <tr>
                                            <td scope="row">폰케이스</td>
                                            <td>100</td>
                                            <td>100</td>
                                            <td>200</td>
                                            <td>300</td>
                                            <td>500</td>
                                            <td>800</td>
                                            <td>1300</td>                                            
                                            <td>3300</td>                                                                                        
                                        </tr>
                                        <tr>
                                            <td scope="row">홈 데코</td>
                                            <td>100</td>
                                            <td>100</td>
                                            <td>200</td>
                                            <td>300</td>
                                            <td>500</td>
                                            <td>800</td>
                                            <td>1300</td>                                            
                                            <td>3300</td>                                                                                        
                                        </tr>
                                        <tr>
                                            <td scope="row">액자</td>
                                            <td>100</td>
                                            <td>100</td>
                                            <td>200</td>
                                            <td>300</td>
                                            <td>500</td>
                                            <td>800</td>
                                            <td>1300</td>                                            
                                            <td>3300</td>                                                                                        
                                        </tr>

                                    </tbody>

                                </table>
                                
                                    <canvas id="barChart" width="400" height="200"></canvas>
                                </div>

                            </div>
                            <!-- 주간 매출 끝-->

                            <!-- 월간 매출-->

                            <div class="sales-type-content col-12" id="monthly-sales" style="display: none;">
                                <div class="card-dflex-column">
                                    <canvas id="rateCompareLastMonthChart" width="400" height="200"></canvas>
                                    <label><h3>전달 대비 : -25%</h3></label>
                                </div>
                                <table class="table">

                                    <thead>
                                        <tr>
                                            <th>월</th>
                                            <th>주문 수</th>
                                            <th>매출</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <tr>
                                            <td>1월</td>
                                            <td>30</td>
                                            <td>200,000</td>
                                        </tr>
                                        <tr>
                                            <td>2월</td>
                                            <td>30</td>
                                            <td>200,000</td>
                                        </tr>
                                        <tr>
                                            <td>3월</td>
                                            <td>30</td>
                                            <td>200,000</td>
                                        </tr>
                                        <tr>
                                            <td>4월</td>
                                            <td>30</td>
                                            <td>200,000</td>
                                        </tr>
                                    </tbody>
                                </table>

                            </div>

                            <!-- 월간매출 끝 -->

                            <!-- 기간별 매출 -->

                            <div class="sales-type-content" id="period-sales" style="display: none;">
                                
                                <form>
                                    <div class="card-dflex-row">

                                        <input type="date" class="form-control" id="startDate">
                                        <input type="date" class="form-control" id="endDate">
                                        <input type="submit" value="검색">
                                    </div>
                                </form>
                                <div class="card-dflex-column">
                                    <canvas id="rateCompareLastMonthChart" width="400" height="200"></canvas>
                                </div>
                                
                                <table class="table" id="period-sales-table">
                                    
                                    <thead>
                                        <tr>
                                            <th>날짜</th>
                                            <th>판매량</th>
                                            <th>매출</th>
                                        </tr>
                                    </thead>

                                    <tbody>
                                        <tr>
                                            <td>22-02-01</td>
                                            <td>100</td>
                                            <td>100,000</td>
                                        </tr>
                                        <tr>
                                            <td>22-02-02</td>
                                            <td>200</td>
                                            <td>200,000</td>
                                        </tr>
                                        <tr>
                                            <td>22-02-03</td>
                                            <td>300</td>
                                            <td>300,000</td>
                                        </tr>
                                        <tr>
                                            <td>총 합</td>
                                            <td>600</td>
                                            <td>600,000</td>
                                        </tr>
                                    </tbody>

                                </table>
                            </div>
                            

                        </div>
                    </div>

                </div>
            </div>
        </div>
    </div>
    
    
		<!-- include footer -->
		<%@ include file="../include/footer.jsp"%>
