<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<jsp:include page="/WEB-INF/views/user/common/header.jsp" />
<link rel="stylesheet" href="<%=request.getContextPath() %>/assets/user/mypage/review/css/wr_review.css">
<link rel="stylesheet" href="<%=request.getContextPath() %>/assets/user/mypage/review/css/clipfile.css?ver1.1">
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
 <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>


  <!-- main -->
  <div class="rv_container2">
        <div class="rv_body2">
            <div class="header_title2">
                <span class="wr_review">리뷰 작성하기</span>
            </div>
            <!-- <input type="hidden" name="p_num" id="rate" value="${pd_info.p_num}"/>
            <input type="hidden" name="pc_num" id="rate" value="${pd_info.pc_num}"/>
            <input type="hidden" name="ps_num" id="rate" value="${pd_info.ps_num}"/>  -->
	            <div class="pd_info">
	                <div class="pd_image">
	                    <img style="width: 100px; height: 100px;" src="<%=request.getContextPath() %>/${review_pd[0].origin_img_path} " alt="">
	                </div>
	                <div class="pd_check">
	                    <div><span>${review_pd[0].p_name}</span></div>
	                    <div class="pd_color"><span>${review_pd[0].pc_name}</span></div>
	                    <div class="ps_size">${review_pd[0].ps_name} size</div>
	                </div>
	            </div>
	             <form onsubmit="return doCheck();" id="rv_check_form" action="<%=request.getContextPath() %>/add_review?mem_num=${member.mem_num}&page=1" method="POST"> 
	            <c:set var="member" value="${sessionScope.member }"/>
	            <input type="hidden" name="mem_num" id="rate" value="${member.mem_num}"/>
	            <input type="hidden" name="p_num" id="rate" value="${pd_info.p_num}"/>
	            <input type="hidden" name="od_num" id="rate" value="${pd_info.od_num}"/>
	            <div class="check_box">
	            	<div class="mb-1" name="myform" id="myform" >
	            	<div class="warning_msg">별점을 선택해 주세요.</div>
	                    <fieldset>  
	                        <input type="radio" name="review_star" value="5" id="rate1" class="review_star"><label
	                            for="rate1">★</label>
	                        <input type="radio" name="review_star" value="4" id="rate2" class="review_star"><label
	                            for="rate2">★</label>
	                        <input type="radio" name="review_star" value="3" id="rate3" class="review_star"><label
	                            for="rate3">★</label>
	                        <input type="radio" name="review_star" value="2" id="rate4" class="review_star"><label
	                            for="rate4">★</label>
	                        <input type="radio" name="review_star" value="1" id="rate5" class="review_star"><label
	                            for="rate5">★</label>
	                    </fieldset>
	                    </div>
	             
	            </div>
	            <div class="main_box">
	                <div class="write_box">
	                    <textarea name="review_content" id="review_content" cols="110" rows="11" spellcheck="false" class="review_textarea" placeholder="5자 이상으로 작성해 주세요."/></textarea>
	                </div>
	                <div class="filebox">
					    <input class="upload-name" placeholder="Image Name" disabled="disabled">
					    <label for="file">파일 찾기</label> 
					    <input type="file" name=review_image_path id="file">
						    <div class="button_box" style="float:right">
		                    	<input type="submit" value="리뷰 등록" class="registration" />
		                	</div>
					</div>
	                <div id="uploadResult">
					</div>
	            </div>
	       </form> 
        </div>
  </div>
  
 <script>
 function doCheck = () => {
	    let rv_star = document.getElementsByClassName("review_star");
	    let rv_content = document.getElementById("review_content");
	    let rv_form = document.getElementById("rv_check_form");

	    if (rv_form.rv_star.value == "") {
	        rv_form.rv_star.focus();
	        alert("별점을 선택해주세요");
	        
	        return false;
	    }

	    if (rv_form.rv_content.value == "") {
	        rv_form.rv_content.focus();
	        alert("내용을 입력해주세요");
	        if (rv_form.rv_content.value.length > 5) {
	            alert("5자 이상 적어주세요");
	        } else if (rv_form.rv_content.value.length < 100) {
	        	alert("100자 이하로 적어주세요");
	        }
	        

	        return false;
		}
		return true;
	}

 </script>
  
<!-- 첨부파일 이미지 이름 자르기 -->
<script>
$("#file").on('change',function(){
    let lastIndex = $("#file").val().lastIndexOf("\\")
    var fileName = $("#file").val().substr(lastIndex+1);
    $(".upload-name").val(fileName);
   
  });

</script>

<script>
	/* 이미지 업로드 */
	$("input[type='file']").on("change", function(e){
		
		/* 이미지 존재시 삭제 */
		if($(".imgDeleteBtn").length > 0){
			deleteFile();
		}
		
		let formData = new FormData();
		let fileInput = $('input[name="review_image_path"]');
		let fileList = fileInput[0].files;
		let fileObj = fileList[0];

		/* if(!fileCheck(fileObj.name, fileObj.size)){
			return false;
		} */
		
		for(let i = 0; i < fileList.length; i++){
			formData.append("uploadFile", fileList[i]);
		}
		
		$.ajax({
			url: '/jhc/uploadAjaxAction',
	    	processData : false,
	    	contentType : false,
	    	data : formData,
	    	type : 'POST',
	    	dataType : 'json',
	    	success : function(result){
	    		console.log(result);
	    		showUploadImage(result);
	    	},
	    	error : function(result){
	    		alert("이미지 파일이 아닙니다.");
	    	}
		});
	});
	
	/* var, method related with attachFile */
	let regex = new RegExp("(.*?)\.(jpg|png)$");
	let maxSize = 1048576; //1MB	
	
	function fileCheck(fileName, fileSize){

		if(fileSize >= maxSize){
			alert("파일 사이즈 초과");
			return false;
		}
			  
		if(!regex.test(fileName)){
			alert("해당 종류의 파일은 업로드할 수 없습니다.");
			return false;
		}
		
		return true;		
		
	}
	
	/* 이미지 출력 */
	function showUploadImage(uploadResultArr){
		
		
	
		
		/* 전달받은 데이터 검증 */
		if(!uploadResultArr || uploadResultArr.length == 0){return}
		
		let uploadResult = $("#uploadResult");
		
		let obj = uploadResultArr[0];
		
		let str = "";
		
		let fileCallPath = encodeURIComponent(obj.uploadPath.replace(/\\/g, '/') + "/s_" + obj.uuid + "_" + obj.fileName);
		
		str += "<div id='result_card'>";
		str += "<img src='/jhc/display/image?fileName=" + fileCallPath +"'>";
		str += "<div class='imgDeleteBtn' data-file='" + fileCallPath + "'>x</div>";
		str += "<input type='hidden' name='imageList[0].fileName' value='"+ obj.fileName +"'>";
		str += "<input type='hidden' name='imageList[0].uuid' value='"+ obj.uuid +"'>";
		str += "<input type='hidden' name='imageList[0].uploadPath' value='"+ obj.uploadPath +"'>";
		str += "</div>";		
		
   		uploadResult.append(str); 
		
		
	}
	
	/* 이미지 삭제 버튼 동작 */
	$("#uploadResult").on("click", ".imgDeleteBtn", function(e){
		
		deleteFile();
		
	});
	
	/* 파일 삭제 메서드 */
	function deleteFile(){
		
		let targetFile = $(".imgDeleteBtn").data("file");
		
		let targetDiv = $("#result_card");
		
		$.ajax({
			url: '/jhc/deleteFile',
			data : {fileName : targetFile},
			dataType : 'text',
			type : 'POST',
			success : function(result){
				console.log(result);
				
				targetDiv.remove();
				$("input[type='file']").val("");
				
			},
			error : function(result){
				console.log(result);
				
				alert("파일을 삭제하지 못하였습니다.")
			}
		});
	}
	
</script>



 <footer>
   <jsp:include page="/WEB-INF/views/user/common/footer.jsp" />
<script src="https://kit.fontawesome.com/3a90129dcf.js" crossorigin="anonymous"></script>
<script type="text/javascript" src="<%=request.getContextPath() %>/assets/user/mypage/js/review.js?ver=1"></script>


