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
                                                    <h3 class="mb-0 fw-bold mb-4">주문 관리</h3>
                                                    <button class="btn btn-primary btn-sm me-3" style="height: 30px;"
                                                        onclick="location.href='./reg'">옵션 버튼</button>
                                                </div>

                                                <div class="d-flex flex-row table-responsive text-nowrap">
                                                    <table class="table text-center">
                                                        <thead class="table-dark">
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
                                                                    <td><button type="button"
                                                                            class="btn btn-sm btn-outline-dark"
                                                                            onclick="location.href=`./detail?ord_num=${order.ord_num}`">상세보기</button>
                                                                    </td>
                                                                    <td>${order.ord_date}</td>
                                                                    <td>
                                                                        <c:choose>
                                                                            <c:when test="${order.ord_status eq 0}">
                                                                                <span
                                                                                    class="badge bg-warning fs-6 me-1">${order.status_name}</span>
                                                                            </c:when>
                                                                            <c:when test="${order.ord_status eq 1}">
                                                                                <span
                                                                                    class="badge bg-success fs-6 me-1">${order.status_name}</span>
                                                                            </c:when>
                                                                            <c:when test="${order.ord_status eq 2}">
                                                                                <span
                                                                                    class="badge bg-info fs-6 me-1">${order.status_name}</span>
                                                                            </c:when>
                                                                            <c:when test="${order.ord_status eq 3}">
                                                                                <span
                                                                                    class="badge bg-info fs-6 me-1">${order.status_name}</span>
                                                                            </c:when>
                                                                            <c:when test="${order.ord_status eq 4}">
                                                                                <span
                                                                                    class="badge bg-primary fs-6 me-1">${order.status_name}</span>
                                                                            </c:when>
                                                                            <c:when test="${order.ord_status eq 5}">
                                                                                <span
                                                                                    class="badge bg-danger fs-6 me-1">${order.status_name}</span>
                                                                            </c:when>
                                                                            <c:when test="${order.ord_status eq 6}">
                                                                                <span
                                                                                    class="badge bg-danger fs-6 me-1">${order.status_name}</span>
                                                                            </c:when>
                                                                            <c:when test="${order.ord_status eq 7}">
                                                                                <span
                                                                                    class="badge bg-danger fs-6 me-1">${order.status_name}</span>
                                                                            </c:when>
                                                                        </c:choose>
                                                                    </td>

                                                                    <c:choose>
                                                                        <c:when test="${order.ord_status eq 1}">
                                                                            <form method="POST">
                                                                                <input type="hidden" name="ord_num"
                                                                                    value="${order.ord_num}">
                                                                                <input type="hidden" name="ord_status"
                                                                                    value="${order.ord_status}">
                                                                                <td>
                                                                                    <button type="submit"
                                                                                        class="btn btn-sm btn-outline-success fs-6 fw-bold"
                                                                                        formaction="/jhc/admin/order/recieved">접수</button>
                                                                                    /
                                                                                    <button type="submit"
                                                                                        class="btn btn-sm btn-outline-danger fs-6 fw-bold"
                                                                                        formaction="/jhc/admin/order/cancel">취소</button>
                                                                                    /
                                                                                    <button type="submit"
                                                                                        class="btn btn-sm btn-outline-warning fs-6 fw-bold"
                                                                                        formaction="/jhc/admin/order/exchange">교환</button>
                                                                                    /
                                                                                    <button type="submit"
                                                                                        class="btn btn-sm btn-outline-dark fs-6 fw-bold"
                                                                                        formaction="/jhc/admin/order/refund">환불</button>
                                                                                </td>
                                                                            </form>
                                                                        </c:when>
                                                                        <c:when
                                                                            test="${order.ord_status eq 0 || order.ord_status eq 2 || order.ord_status eq 4}">
                                                                            <form method="POST">
                                                                                <input type="hidden" name="ord_num"
                                                                                    value="${order.ord_num}">
                                                                                <input type="hidden" name="ord_status"
                                                                                    value="${order.ord_status}">
                                                                                <td>
                                                                                    <button type="submit"
                                                                                        class="btn btn-sm btn-outline-danger fs-6 fw-bold"
                                                                                        formaction="/jhc/admin/order/cancel">취소</button>
                                                                                    /<button type="submit"
                                                                                        class="btn btn-sm btn-outline-warning fs-6 fw-bold"
                                                                                        formaction="/jhc/admin/order/exchange">교환</button>
                                                                                    /<button type="submit"
                                                                                        class="btn btn-sm btn-outline-dark fs-6 fw-bold"
                                                                                        formaction="/jhc/admin/order/refund">환불</button>
                                                                                </td>
                                                                            </form>
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