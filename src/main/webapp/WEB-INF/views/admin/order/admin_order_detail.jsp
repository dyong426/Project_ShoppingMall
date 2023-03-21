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
                                      <div class="row g-0 border rounded flex-md-row mb-4 shadow-sm h-md-250 position-relative">
                                        <div class="col p-4 d-flex flex-column position-static">
                                          <div class="d-flex flex-row justify-content-between">
                                            <h3 class="mb-0 fw-bold mb-4">주문 상세 정보</h3>
                                            <button class="btn btn-primary btn-sm me-3" style="height: 30px;"
                                              onclick="location.href='./'">뒤로가기</button>
                                          </div>
                          
   
                          
                                            <div class="d-flex flex-row">
                                              <div class="col-md-3">
                                                <table class="table">
                                                  <thead>
                                                    <tr class="table-dark">
                                                      <td></td>
                                                      <td class="fw-semibold">주문자 정보</td>
                                                    </tr>
                                                  </thead>
                                                  <tbody>
                                                    <tr>
                                                      <th class="table-secondary"><label class="badge text-bg-dark">회원 이름</label></th>
                                                      <td><label id="mem_num">${order.mem_name}</label>
                                                      <td>
                                                    </tr>
                                                    <tr>
                                                      <th class="table-secondary"><label class="badge text-bg-dark">회원 이메일</label></th>
                                                      <td><label id="mem_email">${order.mem_email}</label></td>
                                                    </tr>
                                                    <tr>
                                                      <th class="table-secondary"><label class="badge text-bg-dark">회원 연락처</label></th>
                                                      <td><label id="mem_phone">${order.mem_phone}</label></td>
                                                    </tr>
                                                    <tr>
                                                      <th class="table-secondary"><label class="badge text-bg-dark">결제</label></th>
                                                      <td><label id="payment_name">${order.payment_name}</label></td>
                                                    </tr>
                                                  </tbody>
                                                </table>
                                              
                          
                                              	
                                                <table class="table">
                                                  <thead>
                                                    <tr class="table-dark">
                                                      <td></td>
                                                      <td class="fw-semibold">수령자 정보</td>
                                                    </tr>
                                                  </thead>
                                                  <tbody>
                                                    <tr>
                                                      <th class="table-secondary"><label for="ord_num" class="badge text-bg-dark">주문번호</label>
                                                      </th>
                                                      <td><label id="ord_num">${order.ord_num}</label>
                                                      <td>
                                                    </tr>
                                                    <tr>
                                                      <th class="table-secondary"><label for="ord_date" class="badge text-bg-dark">주문날짜</label>
                                                      </th>
                                                      <td><label id="ord_date">${order.ord_date}</label></td>
                                                    </tr>
                                                    <tr>
                                                      <th class="table-secondary"><label for="receiver_name" class="badge text-bg-dark">수령자
                                                          이름</label></th>
                                                      <td><label id="receiver_name">${order.receiver_name}</label></td>
                                                    </tr>
                                                    <tr>
                                                      <th class="table-secondary"><label for="receiver_phone" class="badge text-bg-dark">수령자
                                                          연락처</label></th>
                                                      <td><label id="receiver_phone">${order.receiver_phone}</label></td>
                                                    </tr>
                                                    <tr rowspan="3">
                                                      <th class="table-secondary"></th>
                                                      <td><label id="ord_zipcode">${order.ord_zipcode}</label></td>
                                                    </tr>
                                                    <tr>
                                                      <th class="table-secondary"><label class="badge text-bg-dark">주소</label></th>
                                                      <td><label id="ord_addr1">${order.ord_addr1}</label></td>
                                                    </tr>
                                                    <tr>
                                                      <th class="table-secondary"></th>
                                                      <td><label id="ord_addr2">${order.ord_addr2}</label></td>
                                                    </tr>
                                                    <tr>
                                                      <th class="table-secondary"><label for="ord_request" class="badge text-bg-dark">요청
                                                          사항</label></th>
                                                      <td><label id="ord_request">${order.ord_request}</label></td>
                                                    </tr>
                                                  </tbody>
                                                </table>
                                              </div>
                          
                          					<div class="col-md-9">
                                              <table class="table text-center text-nowrap" id="order_details">
                                                <thead>
                                                  <tr class="table-dark">
                                                    <th>주문 상세 번호</th>
                                                    <th>제품명</th>
                                                    <th>제품색상</th>
                                                    <th>제품사이즈</th>
                                                    <th>수량</th>
                                                    <th>가격</th>
                                                    <th style="width: 20%;">커스텀이미지</th>
                                                  </tr>
                                                </thead>
                                                <tbody>
                                                  <c:forEach items="${orderDetails}" var="od">
                                                    <tr>
                                                      <td>${od.od_num}</td>
                                                      <td>${od.p_name}</td>
                                                      <td>${od.pc_name}</td>
                                                      <td>${od.ps_name}</td>
                                                      <td>${od.od_quantity}</td>
                                                      <td>${od.od_amount}</td>
                                                      <td><img src="<%=request.getContextPath()%>/display/image?fileName=${od.mem_cstm_path}"></td>
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
</body>

        </html>