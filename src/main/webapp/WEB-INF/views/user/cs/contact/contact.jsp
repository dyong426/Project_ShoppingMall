<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<jsp:include page="../body/body.jsp" />

<tr>
	<th colspan="2">
	<div id="cs_contact_box">
			<br>
			<br>
			<div id="cs_contact_title">
			<h3>1:1 대화</h3>
			</div>

			<div id="oneOn_box">

				<form id="oneOnOne_form" action="" method="POST">

					<div id="oneOnOne_title" class="oneOnOne inside_form">
						<label for="">제목 </label> <input type="text" name="contact_title"
							style="width: 300px;" />
					</div>
					<br>
					<div id="oneOnOne_file" class="oneOnOne inside_form">

						<label for="">첨부파일 </label> <input type="file" name="contact_image_path" accept="image/png, image/jpeg/">

					</div>
					<br>
					
					<div id="oneOnOne_cate" class="oneOnOne inside_form">

						<label><input type="radio" value="0" name="contact_ctgr">주문/배송</input></label>
						<label><input type="radio" value="0" name="contact_ctgr">주문/배송</input></label>
						<label><input type="radio" value="0" name="contact_ctgr">주문/배송</input></label>
						<label><input type="radio" value="0" name="contact_ctgr">주문/배송</input></label>

					</div>
					<br>
					
					<div id="oneOnOne_contents" class="oneOnOne inside_form">
						<label for="">문의사항 </label>
						<div>
							<textarea name="contact_content" style="resize: none;" id="" cols="100"
								rows="15"></textarea>

						</div>
					</div>

						<a href="<%=request.getContextPath()%>/customerservice">
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