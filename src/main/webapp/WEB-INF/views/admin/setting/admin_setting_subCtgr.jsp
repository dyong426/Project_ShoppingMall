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
                                                    <h3 class="mb-0 fw-bold mb-4">카드 제목</h3>
                                                    <button class="btn btn-primary btn-sm me-3" style="height: 30px;"
                                                        onclick="location.href='./reg'">옵션 버튼</button>
                                                </div>


                                                <!-- Content wrapper -->

                                                <div class="card-body d-flex flex-column">

                                                    <div class="row">

                                                        <div class="col-6">
                                                            <button type="button" class="btn btn-sales btn-secondary"
                                                                onclick="location.href='<%=request.getContextPath()%>/admin/setting/mctgr'">메인카테고리</button>

                                                            <button type="button" class="btn btn-sales btn-dark"
                                                                onclick="location.href='<%=request.getContextPath()%>/admin/setting/sctgr'">서브카테고리</button>

                                                            <button type="button" class="btn btn-sales btn-secondary"
                                                                onclick="location.href='<%=request.getContextPath()%>/admin/setting/bn'">배너</button>

                                                            <button type="button" class="btn btn-sales btn-secondary"
                                                                onclick="location.href='<%=request.getContextPath()%>/admin/sales/monthly'">자주하는
                                                                질문</button>
                                                        </div>
                                                    </div>

                                                    <div class="btn-group col-md-2">
                                                        <button type="button" class="btn btn-dark dropdown-toggle"
                                                            data-bs-toggle="dropdown" aria-expanded="false">
                                                            메인카테고리 선택
                                                        </button>
                                                        <ul class="dropdown-menu">
                                                            <c:forEach items="${mCtgrs}" var="mCtgr">
                                                                <li><a class="dropdown-item"
                                                                        href="./sctgr?m_ctgr_num=${mCtgr.m_ctgr_num}">${mCtgr.m_ctgr_name}</a>
                                                                </li>
                                                            </c:forEach>

                                                        </ul>
                                                    </div>

                                                    <div class="row d-flex justify-content-center">


                                                        <div class="col-lg-6">

                                                            <table class="table">
                                                                <thead>
                                                                    <tr>
                                                                        <th>서브 카테고리명</th>
                                                                        <th>메인 카테고리</th>
                                                                        <th></th>
                                                                    </tr>
                                                                </thead>
                                                                <tbody>

                                                                    <c:forEach items="${sCtgrs}" var="sCtgr">
                                                                        <form method="POST">
                                                                            <tr>
                                                                                <td>
                                                                                    <input type="hidden"
                                                                                        name="s_ctgr_num"
                                                                                        value="${sCtgr.s_ctgr_num}">
                                                                                    <input type="text"
                                                                                        name="s_ctgr_name"
                                                                                        class="form-control"
                                                                                        value="${sCtgr.s_ctgr_name}">
                                                                                </td>
                                                                                <td>
                                                                                    <select class="form-control"
                                                                                        name="m_ctgr_num">
                                                                                        <c:forEach items="${mCtgrs}"
                                                                                            var="mCtgr">
                                                                                            <c:choose>
                                                                                                <c:when
                                                                                                    test="${sCtgr.m_ctgr_num eq mCtgr.m_ctgr_num}">
                                                                                                    <option
                                                                                                        name="m_ctgr_num"
                                                                                                        value="${mCtgr.m_ctgr_num}"
                                                                                                        selected>
                                                                                                        ${mCtgr.m_ctgr_name}
                                                                                                    </option>
                                                                                                </c:when>
                                                                                                <c:otherwise>
                                                                                                    <option
                                                                                                        name="m_ctgr_num"
                                                                                                        value="${mCtgr.m_ctgr_num}">
                                                                                                        ${mCtgr.m_ctgr_name}
                                                                                                    </option>
                                                                                                </c:otherwise>
                                                                                            </c:choose>
                                                                                        </c:forEach>
                                                                                    </select>
                                                                                </td>
                                                                                <td>
                                                                                    <button type="submit"
                                                                                        class="btn btn-warning"
                                                                                        formaction="/jhc/admin/setting/sctgr/modify">수정</button>
                                                                                    <button type="submit"
                                                                                        class="btn btn-danger"
                                                                                        formaction="/jhc/admin/setting/sctgr/delete">삭제</button>
                                                                                </td>
                                                                            </tr>
                                                                        </form>
                                                                    </c:forEach>

                                                                    <tr>
                                                                        <form method="post">
                                                                            <td>
                                                                                <input type="text" class="form-control"
                                                                                    name="s_ctgr_name"
                                                                                    placeholder="서브카테고리명">
                                                                                <input type="hidden" name="m_ctgr_num"
                                                                                    value="${m_ctgr_num}">
                                                                            </td>
                                                                            <td>
                                                                            </td>
                                                                            <td>
                                                                                <button type="submit"
                                                                                    class="btn btn-primary"
                                                                                    formaction="/jhc/admin/setting/sctgr/reg">등록</button>
                                                                            </td>
                                                                        </form>
                                                                    </tr>
                                                                </tbody>
                                                            </table>
                                                        </div>
                                                    </div>

                                                </div>

                                                <!-- / Content -->



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