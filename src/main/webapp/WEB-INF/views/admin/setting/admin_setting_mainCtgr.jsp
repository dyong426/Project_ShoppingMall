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
				<div class="card-body d-flex flex-column">
                    <div class="row">

                        <div class="col-12">
                            <button type="button" class="btn btn-sales btn-dark"
                                onclick="location.href='<%=request.getContextPath()%>/admin/setting/mctgr'">메인카테고리</button>

                            <button type="button" class="btn btn-sales btn-secondary"
                                onclick="location.href='<%=request.getContextPath()%>/admin/setting/sctgr'">서브카테고리</button>

                            <button type="button" class="btn btn-sales btn-secondary"
                                onclick="location.href='<%=request.getContextPath()%>/admin/setting/bn'">배너</button>

                            <button type="button" class="btn btn-sales btn-secondary"
                                onclick="location.href='<%=request.getContextPath()%>/admin/sales/monthly'">자주하는
                                질문</button>
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


		<!-- include footer -->
		<%@ include file="../include/footer.jsp"%>