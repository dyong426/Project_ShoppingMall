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

				<div class="card-header">제품등록</div>
		
		<!-- Content wrapper -->
          <div class="content-wrapper">
            <!-- Content -->

            <div class="container-xxl flex-grow-1 container-p-y">
                
                 <!-- Bootstrap Table with Header - Light -->
                <div class="card">
                    <h5 class="card-header">주문 조회</h5>
                    <div class="table-responsive text-nowrap">
                      <table class="table">
                        <thead class="table-light">
                          <tr>
                            <th>주문 번호</th>
                            <th>회원 아이디</th>
                            <th>주문 상세</th>
                            <th>주문 날짜</th>
                            <th>처리 상태</th>
                            <th>주문 접수</th>
                          </tr>
                        </thead>
                        <tbody class="table-border-bottom-0">
                        
                        	<c:forEach items="${orders}" var="order">
                        	
                        		<tr>
                        			<td>${order.ord_num}</td>
                        			<td>${order.mem_email}</td>
                        			<td><button type="button" class="btn btn-xs btn-outline-dark" id="">상세보기</button></td>
                        			<td>${order.ord_date}</td>
                        			<td>
                        			<c:choose>
                        				<c:when test="${order.ord_status eq 0}">
                        					<span class="badge bg-warning me-1">${order.status_name}</span>
                        				</c:when>
                        				<c:when test="${order.ord_status eq 1}">
                        					<span class="badge bg-primary me-1">${order.status_name}</span>
                        				</c:when>
                        				<c:when test="${order.ord_status eq 2}">
                        					<span class="badge bg-info me-1">${order.status_name}</span>
                        				</c:when>
                        				<c:when test="${order.ord_status eq 3}">
                        					<span class="badge bg-info me-1">${order.status_name}</span>
                        				</c:when>
                        				<c:when test="${order.ord_status eq 4}">
                        					<span class="badge bg-info me-1">${order.status_name}</span>
                        				</c:when>
                        				<c:when test="${order.ord_status eq 5}">
                        					<span class="badge bg-danger me-1">${order.status_name}</span>
                        				</c:when>
                        				<c:when test="${order.ord_status eq 6}">
                        					<span class="badge bg-danger me-1">${order.status_name}</span>
                        				</c:when>
                        				<c:when test="${order.ord_status eq 7}">
                        					<span class="badge bg-danger me-1">${order.status_name}</span>
                        				</c:when>
                        			</c:choose>
                        			</td>
                        		
                        		<c:choose>
                        			<c:when test="${order.ord_status eq 0 || order.ord_status eq 1}">
                        				<td>
                               			<button type="button" class="btn btn-xs btn-outline-dark">접수</button>
                                		/
                                		<button type="button" class="btn btn-xs btn-outline-dark">취소</button>
                                		/
                                		<button type="button" class="btn btn-xs btn-outline-dark">교환</button>
                                		/
                                		<button type="button" class="btn btn-xs btn-outline-dark">환불</button>
                                		
                            			</td>
                        			</c:when>
                        			<c:when test="${order.ord_status eq 2 || order.ord_status eq 3 || order.ord_status eq 4}">
                        				<td>
                        				<button type="button" class="btn btn-xs btn-outline-dark">취소</button>
                                		/
                                		<button type="button" class="btn btn-xs btn-outline-dark">교환</button>
                                		/
                                		<button type="button" class="btn btn-xs btn-outline-dark">환불</button>
                                		</td>
                        			</c:when>
                        			<c:otherwise>
                        				<td>
                        				</td>
                        			</c:otherwise>
                        		</c:choose>
                        		</tr>
                        	</c:forEach>
                          
                        </tbody>
                      </table>
                    </div>
                  </div>
                  <!-- Bootstrap Table with Header - Light -->

                  <div>

                      <ul class="pagination justify-content-center">
                          <li class="page-item first">
                              <a class="page-link" href="javascript:void(0);"
                              ><i class="tf-icon bx bx-chevrons-left"></i
                                ></a>
                            </li>
                            <li class="page-item prev">
                                <a class="page-link" href="javascript:void(0);"
                                ><i class="tf-icon bx bx-chevron-left"></i
                                    ></a>
                                </li>
                                <li class="page-item active">
                                    <a class="page-link" href="javascript:void(0);">1</a>
                                </li>
                                <li class="page-item">
                                    <a class="page-link" href="javascript:void(0);">2</a>
                    </li>
                    <li class="page-item">
                        <a class="page-link" href="javascript:void(0);">3</a>
                    </li>
                    <li class="page-item">
                        <a class="page-link" href="javascript:void(0);">4</a>
                    </li>
                    <li class="page-item">
                        <a class="page-link" href="javascript:void(0);">5</a>
                    </li>
                    <li class="page-item next">
                        <a class="page-link" href="javascript:void(0);"
                        ><i class="tf-icon bx bx-chevron-right"></i
                            ></a>
                        </li>
                        <li class="page-item last">
                            <a class="page-link" href="javascript:void(0);"
                            ><i class="tf-icon bx bx-chevrons-right"></i
                                ></a>
                            </li>
                        </ul>
                        
                    </div>
                        
                        
            </div>
            <!-- / Content -->


		<!-- include footer -->
		<%@ include file="../include/footer.jsp"%>