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
                        <button type="button" class="btn btn-dark dropdown-toggle" data-bs-toggle="dropdown" aria-expanded="false">
                          메인카테고리 선택
                        </button>
                        <ul class="dropdown-menu">                          
                          <c:forEach items="${mCtgrs}" var="mCtgr">
                          	<li><a class="dropdown-item" href="./sctgr?m_ctgr_num=${mCtgr.m_ctgr_num}">${mCtgr.m_ctgr_name}</a></li>
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
												<input type="hidden" name="s_ctgr_num" value="${sCtgr.s_ctgr_num}">
												<input type="text" name="s_ctgr_name" class="form-control" value="${sCtgr.s_ctgr_name}">
											</td>
											<td>
                                        		<select class="form-control" name="m_ctgr_num">
                                        			<c:forEach items="${mCtgrs}" var="mCtgr"> 
                                        				<c:choose>
                                        					<c:when test="${sCtgr.m_ctgr_num eq mCtgr.m_ctgr_num}">
                                        						<option name="m_ctgr_num" value="${mCtgr.m_ctgr_num}" selected>${mCtgr.m_ctgr_name}</option>
                                        					</c:when>
                                        					<c:otherwise>
                                        						<option name="m_ctgr_num" value="${mCtgr.m_ctgr_num}">${mCtgr.m_ctgr_name}</option>
                                        					</c:otherwise>
                                        				</c:choose>                                       			
                                        			</c:forEach>
                                        		</select>
                                        	</td>
											<td>
												<button type="submit" class="btn btn-warning"formaction="/jhc/admin/setting/sctgr/modify">수정</button> 
												<button type="submit" class="btn btn-danger"formaction="/jhc/admin/setting/sctgr/delete">삭제</button>
											</td>
										</tr>
                                		</form>
									</c:forEach>
									
                                    <tr>
                                    	<form method="post">
                                        <td>
                                            <input type="text" class="form-control" name="s_ctgr_name" placeholder="서브카테고리명">
                                            <input type="hidden" name="m_ctgr_num" value="${m_ctgr_num}"> 
                                        </td>
                                        <td>
                                        </td>
                                        <td>
                                            <button type="submit" class="btn btn-primary" formaction="/jhc/admin/setting/sctgr/reg">등록</button>
                                        </td>
                                    	</form>
                                    </tr>
                                </tbody>
                            </table>
                        </div>
                    </div>
                        
                </div>
          
        <!-- / Content -->


		<!-- include footer -->
		<%@ include file="../include/footer.jsp"%>