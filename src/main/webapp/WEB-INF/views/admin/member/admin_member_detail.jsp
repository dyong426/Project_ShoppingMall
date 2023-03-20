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
                                                    <h3 class="mb-0 fw-bold mb-4">회원 상세 정보</h3>
                                                    <button class="btn btn-secondary btn-sm me-3" style="height: 30px;"
                                                        onclick="location.href='./'">목록</button>
                                                </div>


                                                <div class="d-flex align-items-start flex-row">
                                                	<div class="col-md-6">
                                                    <table class="table table-secondary">
                                                        <tbody>
                                                            <tr>
                                                                <td class="d-flex align-items-start flex-column"><span
                                                                        class="fs-6 fw-light">회원번호</span>
                                                                    <span
                                                                        class="fs-2 fw-semibold">${member.mem_num}</span>
                                                                </td>
                                                            </tr>

                                                            <tr>
                                                                <td class="d-flex align-items-start flex-column"><span
                                                                        class="fs-6 fw-light">이름</span> <span
                                                                        class="fs-2 fw-semibold">${member.mem_name}</span>

                                                            <tr>
                                                                <td class="d-flex align-items-start flex-column"><span
                                                                        class="fs-6 fw-light">이메일</span> <span
                                                                        class="fs-2 fw-semibold">${member.mem_email}</span>
                                                                </td>
                                                            </tr>

                                                            <tr>
                                                                <td class="d-flex align-items-start flex-column"><span
                                                                        class="fs-6 fw-light">생년월일</span>
                                                                    <span class="fs-2 fw-semibold">
                                                                        ${member.mem_birth}</span>
                                                                </td>
                                                            </tr>


                                                            <tr>
                                                                <td class="d-flex align-items-start flex-column"><span
                                                                        class="fs-6 fw-light">연락처</span> <span
                                                                        class="fs-2 fw-semibold"> ${member.mem_phone}
                                                                    </span></td>
                                                            </tr>

                                                            <tr>
                                                                <td class="d-flex align-items-start flex-column"><span
                                                                        class="fs-6 fw-light">포인트</span> <span
                                                                        class="fs-2 fw-semibold">${member.mem_point}</span>
                                                                </td>
                                                            </tr>


                                                            <tr>
                                                                <td class="d-flex align-items-start flex-column"><span
                                                                        class="fs-6 fw-light">비고</span> <span
                                                                        class="fs-2 fw-semibold">
                                                                        <input type="text" value="${member.mem_note}">
                                                                    </span></td>
                                                            </tr>


                                                            <tr>
                                                                <td class="d-flex align-items-start flex-column"><span
                                                                        class="fs-6 fw-light">등록일</span> <span
                                                                        class="fs-2 fw-semibold">${member.mem_regdate}</span>
                                                                </td>
                                                            </tr>
                                                        </tbody>
                                                    </table>
                                                	</div>
                                                	
                                                	<div class="col-md-6">
	
                                                    <span class="fs-6 fw-light">최근 주문 목록</span>
                                                    <table class="table">
                                                        <thead>
                                                            <tr class="table-dark">
                                                                <th>주문번호</th>
                                                                <th>상품명</th>
                                                                <th>색상</th>
                                                                <th>사이즈</th>
                                                                <th>이미지</th>
                                                                <th>결제 금액</th>
                                                            </tr>
                                                        </thead>
                                                        <tbody>
                                                            <c:forEach items="${orderList}" var="orderLists">
                                                                <tr class="table-light">
                                                                    <c:choose>
                                                                        <c:when test="${empty orderLists.orderDetails}">
                                                                            <td></td>
                                                                            <td></td>
                                                                            <td>구매 정보 없음</td>
                                                                            <td></td>
                                                                            <td></td>
                                                                            <td></td>

                                                                        </c:when>
                                                                        <c:otherwise>
                                                                            <td>${orderLists.orderDetails.get(0).ord_date}
                                                                            </td>
                                                                            <td>
                                                                                <c:forEach
                                                                                    items="${orderLists.orderDetails}"
                                                                                    var="order">
                                                                                    <span>${order.p_name}</span><br>
                                                                                </c:forEach>
                                                                            </td>
                                                                            <td>
                                                                                <c:forEach
                                                                                    items="${orderLists.orderDetails}"
                                                                                    var="order">
                                                                                    <span>${order.pc_name}</span><br>
                                                                                </c:forEach>
                                                                            </td>
                                                                            <td>
                                                                                <c:forEach
                                                                                    items="${orderLists.orderDetails}"
                                                                                    var="order">
                                                                                    <span>${order.ps_name}</span><br>
                                                                                </c:forEach>
                                                                            </td>
                                                                            <td>
                                                                                <c:forEach
                                                                                    items="${orderLists.orderDetails}"
                                                                                    var="order">
                                                                                    <span><img
                                                                                            src="${order.mem_cstm_path}"></span><br>
                                                                                </c:forEach>
                                                                            </td>
                                                                            <td>
                                                                                <c:forEach
                                                                                    items="${orderLists.orderDetails}"
                                                                                    var="order">
                                                                                    <span>${order.od_amount}</span><br>
                                                                                </c:forEach>
                                                                            </td>
                                                                        </c:otherwise>
                                                                    </c:choose>
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



                            </main>

                    </div>
                </div>

                <script src="../assets/dist/js/bootstrap.bundle.min.js"></script>

                <script src="https://cdn.jsdelivr.net/npm/feather-icons@4.28.0/dist/feather.min.js"
                    integrity="sha384-uO3SXW5IuS1ZpFPKugNNWqTZRRglnUJK6UAZ/gxOX80nxEkN9NcGZTftn6RzhGWE"
                    crossorigin="anonymous"></script>
                <script src="https://cdn.jsdelivr.net/npm/chart.js@2.9.4/dist/Chart.min.js"
                    integrity="sha384-zNy6FEbO50N+Cg5wap8IKA4M/ZnLJgzc6w2NqACZaK0u0FXfOWRRJOnQtpZun8ha"
                    crossorigin="anonymous"></script>
                <script src="dashboard.js"></script>
    </body>

</html>