<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<jsp:include page="../body/body.jsp" />

<tr>
	<th colspan="2">
	<!-- <c:set var="mem" value="${sessionScpoe.member}"/> -->
	
	
	
	<div id="cs_contact_box">
			<br>
			<br>
			<div id="cs_contact_title">
			<h3>1:1 문의</h3>
			</div>

			<div id="non-members">
			<br>
				JUHEECOSTOMER 회원 전용 서비스입니다.<br>
				로그인 및 회원가입은 페이지 상단에 위치해있으니 이용 부탁드립니다.<br>
				그 외 문의는 &nbsp;<a href="mailto:help@ezen.com">help@ezen.com</a>를 이용해주세요<br>
				<!-- 
				 ${mem.mem_name}
				 -->
			</div>
			
			
			<div id="oneOn_box">

				<form id="oneOnOne_form" action="" method="POST" enctype="multipart/form-data">

					<div id="oneOnOne_title" class="oneOnOne inside_form">
						<label for="">제목 </label> <input type="text" name="contact_title"
							style="width: 300px;"  placeholder="제목을 입력하세요." />
					</div>
					<br>
					<div id="oneOnOne_file" class="oneOnOne inside_form">

						<label for="">첨부파일 </label> <input type="file" name="contact_image_path" accept="image/png, image/jpeg/">

					</div>
					<br>
					
					<div id="oneOnOne_cate" class="oneOnOne inside_form">
						<c:forEach items="${ctgr0}" var="ct">
						<label class="con_ctgr_radio"><input type="radio" value="${ct.cs_ctgr_num }" name="contact_ctgr" checked>${ct.cs_ctgr_name} </input></label>
						</c:forEach>
						
						<c:forEach items="${ctgr}" var="ct" begin="1" >
						<label class="con_ctgr_radio"><input type="radio" value="${ct.cs_ctgr_num }" name="contact_ctgr">${ct.cs_ctgr_name} </input></label>
						</c:forEach>
						<!-- ${mem.mem_num} -->
						  <input type="hidden" name="mem_num" value="4">
					</div>
					<br>
					
					<div id="oneOnOne_contents" class="oneOnOne inside_form">
						<label for="">문의사항 </label>
						<div>
							<textarea name="contact_content" style="resize: none;" id="" cols="100"
								rows="15" placeholder="내용을 입력하세요." ></textarea>

						</div>
					</div>

						<a href="<%=request.getContextPath()%>/main">
					<div id="cs_submit" class="oneOnOne inside_form">
						<input type="submit" value="제출" style="width: 100px;" />
					</div>
						</a>

				</form>

			</div>
		</div>
	</th>
</tr>
</table>

</div>

</div>

<jsp:include page="/WEB-INF/views/user/common/footer.jsp" />