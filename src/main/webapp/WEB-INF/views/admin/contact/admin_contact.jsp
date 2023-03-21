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
                                            <h3 class="mb-0 fw-bold mb-4">1:1문의 게시판</h3>
                                            
                                            
                                            
                                            				<!-- 카테고리 선택 -->
									<div class="dropdown">
										<a class="btn btn-dark dropdown-toggle" href="#" role="button"
											data-bs-toggle="dropdown" aria-expanded="false"> 처리상태 </a>
										<ul
											class="dropdown-menu dropdown-menu-dark gap-1 p-2 rounded-3 mx-0 border-0 shadow w-220px">
											<li><a class="dropdown-item rounded-2"
												href="<%=request.getContextPath()%>/admin/contact?currentPage=1&category=0">전체</a></li>
											
												<li><a class="dropdown-item rounded-2"
												href="<%=request.getContextPath()%>/admin/contact?currentPage=1&category=1">대기중</a></li>
												<li><a class="dropdown-item rounded-2"
												href="<%=request.getContextPath()%>/admin/contact?currentPage=1&category=2">완료</a></li>

										</ul>
										
									</div>
                                            
                                            
                                            
                                            
                                            
                                            
                                            
                                            
                                              
                                          </div>
                          
                          
                                          <table class="table text-center">
                                            <thead>
                          
                                              <tr class="table-dark align-center">
                                                <th style="width: 10%; text-align: center;">카테고리</th>
                                                <th style="width: 60%; text-align: center;">제목</th>
                                                <th style="width: 10%; text-align: center;">작성자</th>
                                                <th style="width: 10%; text-align: center;">작성일</th>
                                                <th style="width: 10%; text-align: center;">처리상태</th>
                                              </tr>
                          
                                            </thead>
                          
                                            <tbody>
                                              <c:forEach items="${contents}" var="content">
                          
                                                <tr <c:if test="${content.admin_reply ne null}"> class="table-secondary"</c:if>>
                                                  <td style="text-align: center;">[${content.cs_ctgr_name }]</td>
                                                  <td style="text-align: center;"><a
                                                      href="<%=request.getContextPath()%>/admin/contact/content?contact_num=${content.contact_num}">${content.contact_title}</a>
                                                  </td>
                                                  <td style="text-align: center;">${content.mem_name} (${content.mem_email})</td>
                                                  <td style="text-align: center;">${content.contact_regdate}</td>
                                                  <td style="text-align: center;">
                                                    <c:choose>
                                                      <c:when test="${null eq content.admin_reply}">
                                                        <label class="badge text-bg-danger">답변 대기중</label>
                                                      </c:when>
                                                      <c:otherwise>
                                                        <label class="badge text-bg-primary">답변 완료</label>
                                                      </c:otherwise>
                                                    </c:choose>
                                                  </td>
                                                </tr>
                                              </c:forEach>
                          
                                            </tbody>
                          
                                          </table>
                                        </div>
                                        
                                        
                                        <div class="d-flex justify-content-center">

                  <div>
                    <nav>
                      <ul class="pagination">
                      
                      <!-- pagination start -->
                      <!-- previous -->
                        <li class="page-item <c:if test='${paging.startPage < 6 }'>disabled</c:if>">
                          <a class="page-link" href="<%=request.getContextPath()%>/admin/contact?currentPage=${paging.startPage-1}&category=${param.m_ctgr_num}" aria-label="Previous">
                            <span aria-hidden="true">&laquo;</span>
                          </a>
                        </li>
					
						<!-- paging num -->
						<c:forEach var="pgNo" begin="${paging.startPage }" end="${paging.endPage }" step="1">		
							<li class="page-item <c:if test='${paging.currentPage eq pgNo}'>active</c:if>">
								<a class="page-link" href="<%=request.getContextPath()%>/admin/contact?currentPage=${pgNo}&category=${param.m_ctgr_num}">${pgNo}</a>
							</li>
						</c:forEach>
						
					   <!-- next -->
                        <li class="page-item <c:if test='${paging.endPage >= paging.totalPages}'>disabled</c:if>">
                          <a class="page-link" href="<%=request.getContextPath()%>/admin/contact?currentPage=${paging.startPage+5}&category=${param.m_ctgr_num}" aria-label="Next">
                            <span aria-hidden="true">&raquo;</span>
                          </a>
                        </li>
                        
                      </ul>
                    </nav>
                  </div>

                </div>
                                      </div>
                                    </div>
                                  </div>

                            </main>

                    </div>
                </div>

              <script src="<%=request.getContextPath()%>/assets/admin/bootstrap/js/bootstrap.bundle.min.js"></script>

                <script src="https://cdn.jsdelivr.net/npm/feather-icons@4.28.0/dist/feather.min.js"
                    integrity="sha384-uO3SXW5IuS1ZpFPKugNNWqTZRRglnUJK6UAZ/gxOX80nxEkN9NcGZTftn6RzhGWE"
                    crossorigin="anonymous"></script>
                <script src="https://cdn.jsdelivr.net/npm/chart.js@2.9.4/dist/Chart.min.js"
                    integrity="sha384-zNy6FEbO50N+Cg5wap8IKA4M/ZnLJgzc6w2NqACZaK0u0FXfOWRRJOnQtpZun8ha"
                    crossorigin="anonymous"></script>
        </body>

        </html>