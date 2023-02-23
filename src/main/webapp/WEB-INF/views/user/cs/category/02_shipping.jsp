<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<jsp:include page="/WEB-INF/views/user/cs/body/cateBody.jsp" />
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/assets/user/cs/css/category.css">


<tr>
	<th colspan="5">



		<div class="faq_box">
			<h3>배송</h3>
			<div class="fap_accordion">
				<input type="checkbox" id="faq_answer01"> 
				
				<label for="faq_answer01">Q 제목 부분 <em></em></label>
				<div>
					
					<p>A 답변부분</p>
				</div>
				
				<input type="checkbox" id="faq_answer02"> 
				
				<label for="faq_answer02">Q 제목 부분 <em></em></label>
				<div>
					
					<p>A 답변부분</p>
				</div>
				
				<input type="checkbox" id="faq_answer03"> 
				
				<label for="faq_answer03">Q 제목 부분 <em></em></label>
				<div>
					
					<p>A 답변부분</p>
				</div>
				
			</div>
		</div>


		</div>
	</th>
</tr>
</table>
</table>
</div>

</div>
<footer>
	<jsp:include page="/WEB-INF/views/user/common/footer.jsp" />