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

                                                </div>
                                                
                                                
                                                <!-- Content wrapper -->
				<div class="card-body d-flex flex-column">
                    <div class="row">

                        <div class="col-12">
                            <button type="button" class="btn btn-sales btn-dark"
                                onclick="location.href='<%=request.getContextPath()%>/admin/setting/mctgr'">메인카테고리</button>

                            <button type="button" class="btn btn-sales btn-secondary"
                                onclick="location.href='<%=request.getContextPath()%>/admin/setting/sctgr'">서브카테고리</button>

                            <button type="button" class="btn btn-sales btn-secondary"
                                onclick="location.href='<%=request.getContextPath()%>/admin/setting/bn'">배너</button>

                        </div>
                    </div>

                    <div class="row d-flex justify-content-center">
                        <div class="col-lg-12">

                            <table class="table">
                                <thead>
                                    <tr>
                                        <th>메인 카테고리명</th>
                                        <th>카테고리 색상</th>
                                        <th>카테고리 아이콘</th>
                                        <th></th>
                                        <th></th>
                                    </tr>
                                </thead>
                                <tbody>
                                	
                                	<c:forEach items="${mCtgrs}" var="mCtgr">
                                	<tr>
                                		<form method="POST" name="mCtgrs">
                                		<input type="hidden" name="m_ctgr_num" value="${mCtgr.m_ctgr_num}">
                                        <td>
                                            <input type="text"  name="m_ctgr_name" class="form-control" value="${mCtgr.m_ctgr_name}">
                                        </td>
                                        <td>
                                            <input type="color" name="m_ctgr_color_code" class="form-control form-control-color" value="${mCtgr.m_ctgr_color_code}">
                                        </td>
                                        <td>
                                            <input type="file" id="${mCtgr.m_ctgr_name}-upload-img" class="form-control" onchange="modifyMctgrImg(`${mCtgr.m_ctgr_name}-upload-img`)">
                                        </td>
                                        <td>
                                            <div id="${mCtgr.m_ctgr_name}-upload-icon">
                                            	<img alt="메인카테고리아이콘" src="/jhc/display/image?fileName=${mCtgr.m_ctgr_icon_path}">
                                            </div>
                                            <input type="hidden" name="m_ctgr_icon_path" id="${mCtgr.m_ctgr_name}-IconPath">
                                        </td>
                                        <td>
                                            <button type="submit" class="btn btn-warning" formaction="/jhc/admin/setting/mctgr/modify">수정</button>
                                            <button type="submit" class="btn btn-danger" formaction="/jhc/admin/setting/mctgr/delete">삭제</button>
                                        </td>
                                		</form>
                                    </tr>
                                	
                                	</c:forEach>

                                    <form method="POST" name="mCtgrs">
                                    <tr>
                                        	<td>
                                            	<input type="text"  class="form-control" name="m_ctgr_name" placeholder="카테고리명">
                                        	</td>
                                        	<td>
                                            	<input type="color"  class="form-control form-control-color" name="m_ctgr_color_code">
                                       	 	</td>
                                        	<td>
                                            	<input type="file" name="uploadCtgrIcon" class="mCtgr-icon form-control" onchange="inputMctgrImg(this)">
                                        	</td>
                                        	<td>
                                            	<div id="ctgr-upload-icon">

                                            	</div>
                                        	</td>
                                        	<td>
                                        		<input type="hidden" name="m_ctgr_icon_path" id="regIconPath">
                                            	<button type="submit"  class="btn btn-primary" formaction="/jhc/admin/setting/mctgr/reg">등록</button>
                                        	</td>
                                    </tr>
                                    </form>
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