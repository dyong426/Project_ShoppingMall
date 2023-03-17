// 제목 및 내용 미입력시 insert 되지 않고 focus
function doAction() {
	let con_title = document.getElementById("contact_title");
	let con_content = document.getElementById("contact_content");
	let con_form = document.getElementById("oneOnOne_form");

	if (oneOnOne_form.contact_title.value == "") {
		oneOnOne_form.contact_title.focus();
		alert("제목을 입력해주세요");
		
		return false;
	}
	
	if (oneOnOne_form.contact_content.value == "") {
		oneOnOne_form.contact_content.focus();
		alert("내용을 입력해주세요");

		return false;

	}
		return true;
}

// 파일 업로드

let regex = new RegExp("(.*?)\.(jpg|png)$"); //파일 종류
let maxSize = 1048576; //1MB

// 이미지 업로드
$("input[type='file']").on("change", function(e){
	
	/* 이미지 존재시 삭제 */
		if($(".imgDeleteBtn").length > 0){
			deleteFile();
		}
	
	
	let formData = new FormData();
	
	let fileInput = $('input[name="contact_image_path"]');
	let fileList = fileInput[0].files;
	let fileObj = fileList[0];
	
	//if(!fileCheck(fileObj.name, fileObj.size)){
	//		return false;
	//}
	 //파일 여러개 받아올 때 multiple
	for (let i = 0; i < fileList.length; ++i){
		formData.append("uploadFile", fileList[i]);
	}
	
	//formData.append("uploadFile", fileObj);
	//alert("통과");
	
	// processData,contentType 의 속성값을 false로 해야 첨부파일이 서버로 전송됨
	
	$.ajax({
			url: '/jhc/uploadAjaxAction_contact',
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
		/*
			$.ajax({
			url: 서버로 요청을 보낼 url
	    	processData : 서버로 전송할 데이터를 queryString 형태로 반환할지 여부
	    	contentType : 서버로 전송되는 데이터의 content-type
	    	data : 서버로 전송할 데이터
	    	type : 서버 요청 타입(GET/POST)
	    	dataType : 서버로부터 반환받을 데이터 타입
		});*/
});


// 파일 사이즈 및 파일종류 확인
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
		
		let uploadResult = $("#uploadResult_con");
		
		let obj = uploadResultArr[0];
		
		let str = "";
		
		// 변경 후
		let fileCallPath = obj.uploadPath.replace(/\\/g, '/') + "/s_" + obj.uuid + "_" + obj.fileName;

		str += "<div id='result_card_con'>";
		str += "<img class='img_con' src='/jhc/display?fileName=" + fileCallPath +"'>";
		str += "<div class='imgDeleteBtn_con' data-file='" + fileCallPath + "'>x</div>";
		str += "<input type='hidden' name='imageList[0].fileName' value='"+ obj.fileName +"'>";
		str += "<input type='hidden' name='imageList[0].uuid' value='"+ obj.uuid +"'>";
		str += "<input type='hidden' name='imageList[0].uploadPath' value='"+ obj.uploadPath +"'>";		
		str += "</div>";		
		
   		uploadResult.append(str);  
   		console.log(str);

}

/* 이미지 삭제 버튼 동작 */
	$("#uploadResult_con").on("click", ".imgDeleteBtn_con", function(e){
		deleteFile();
	});



/* 파일 삭제 메서드 */
function deleteFile(){
	
	let targetFile = $(".imgDeleteBtn_con").data("file");
		
	let targetDiv = $("#result_card_con");
	
		$.ajax({
			url: '/jhc/con/deleteFile',
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















