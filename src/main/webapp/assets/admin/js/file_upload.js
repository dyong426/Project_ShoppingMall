// 이미지 업로드
$("#prod-upload-img").on('change', function(e) {

    // FormData.append(key, value)
    var formData = new FormData();

    var fileInput = $('input[name="p_info_img_path"]');

    var fileList = fileInput[0].files;
    console.log(fileInput[0]);
    console.log(fileList);

    var fileObj = fileList[0];
    console.log(fileObj);
    console.log(fileObj.name);
    console.log(fileObj.size);
    console.log(fileObj.type);

    if (!fileCheck(fileObj.name, fileObj.size)) {
        return false;
    }

    for (var i = 0; i < fileList.length; i++) {
        formData.append("uploadFile", fileList[i]);
    }

    $.ajax({
        url: '/jhc/admin/uploadAjaxAction',
        processData : false,
        contentType : false,
        data : formData,
        type : 'POST',
        dataType : 'json',
        success: function(result) {
        	console.log(result);
            showUploadImage(result);
        },
        error : function(result) {
        	alert('이미지 파일이 아닙니다.');
        } 
    });
});

// 이미지 삭제 버튼 이벤트 추가
$('.upload-img').on("click", ".upload-img-delete-btn", function(e) {
	
	console.log('삭제');
    deleteFile(e.target);
});

// 업로드 이미지 출력
function showUploadImage(uploadResultList) {

    // 전달 받은 데이터 검증
    if (!uploadResultList || uploadResultList.length == 0) return;

    var uploadResult = $('#uploadResult');
    console.log(uploadResult.length);
    var obj = uploadResultList[0];

    var fileCallPath = encodeURIComponent(obj.uploadPath + '/s_' + obj.uuid + '_' + obj.fileName);
    
    // var str = '';

    // str += `<div id="${obj.fileName}-div" class="upload-img">`;
    // str += '<img src="/jhc/display/image?fileName=' + fileCallPath +'">';
    // str += `<button type="button" id="${obj.fileName}-btn" class="upload-img-delete-btn btn btn-minus fa-solid fa-circle-minus btn-danger" data-file="` + fileCallPath + '" onclick="deleteFile(event)"></button>'
    // str += '</div>';

    var showImgHtml = showProdImg(obj, fileCallPath);

    uploadResult.append(showImgHtml); 
}

function showProdImg(obj, fileCallPath) {

    var str = '';

    str += `<div id="${obj.fileName}-div" class="upload-prod-img">`;
    str += '<img src="/jhc/display/image?fileName=' + fileCallPath +'">';
    str += `<button type="button" id="${obj.fileName}-btn" class="upload-img-delete-btn btn btn-minus fa-solid fa-circle-minus btn-danger" data-file="` + fileCallPath + '" onclick="deleteFile(event)"></button>'
    str += '<input type="hidden" name="imageList[0].fileName" value="' + obj.fileName +'">';
    str += '<input type="hidden" name="imageList[0].uuid" value="' + obj.uuid +'">';
    str += '<input type="hidden" name="imageList[0].uploadPath" value="' + obj.uploadPath +'">';
    str += '</div>';

    return str;
}

// 업로드 이미지 삭제 메서드
function deleteFile(event) {
    console.log("삭제실행");
    var targetFile = $('.upload-img-delete-btn').data('file');
    console.log(targetFile);

    
    var targetDiv = $(event.target).parent();
    console.log(targetDiv);
    
    $.ajax({
        url : '/jhc/deleteFile',
        data : {fileName : targetFile},
        dataType : 'text',
        type : 'POST',
        success : function(result) {
                console.log(result);

                targetDiv.remove();
                console.log(targetDiv.remove());
                $('input[name="origin_img_path"]').val("");
        },
        error : function(result) {
                console.log(result);

                alert('파일을 삭하제지 못하였습니다.');
        }
    });
    console.log("삭제완료");
}

var regex = new RegExp("(.*?)\.(jpg|png)$");
var maxSize = 1048576; // 1MB

function fileCheck(fileName, fileSize) {

    if (fileSize >= maxSize) {
        alert("파일 사이즈 초과");
        return false;
    }

    if (!regex.test(fileName)) {
        alert("해당 종류의 파일은 업로드 할 수 없습니다.");
        return false;
    }
    return true;
}

// product color image
function inputColorImg(event) {

    console.log(event.target);
    deleteColorImgFile(event);

    // FormData.append(key, value)
    var formData = new FormData();

    var fileInput = $(event.target);

    var fileList = fileInput[0].files;
    console.log(fileInput[0]);
    console.log(fileList);

    var fileObj = fileList[0];
    console.log(fileObj);
    console.log(fileObj.name);
    console.log(fileObj.size);
    console.log(fileObj.type);

    if (!fileCheck(fileObj.name, fileObj.size)) {
        return false;
    }

    for (var i = 0; i < fileList.length; i++) {
        formData.append("uploadFile", fileList[i]);
    }

    $.ajax({
        url: '/jhc/admin/uploadAjaxAction',
        processData : false,
        contentType : false,
        data : formData,
        type : 'POST',
        dataType : 'json',
        success: function(result) {
        	console.log(result);
            showUploadColorImage(result, event);
        },
        error : function(result) {
        	alert('이미지 파일이 아닙니다.');
        } 
    });
}

// 업로드 컬러이미지 출력
function showUploadColorImage(uploadResultList, event) {
	
	console.log("showupload");
    var targetName = event.target.name;
    var uploadTargetId = targetName.replace(".pc_img_filename", "-uploadImg");
    var prodColors = targetName.replace(".pc_img_filename", "");

    // 전달 받은 데이터 검증
    if (!uploadResultList || uploadResultList.length == 0) return;

    var uploadResult = document.getElementById(uploadTargetId);
	console.log(targetName);
	console.log(uploadTargetId);
	console.log(uploadResult);
    var obj = uploadResultList[0];

    console.log(obj);
    
    var fileCallPath = encodeURIComponent(obj.uploadPath + '/s_' + obj.uuid + '_' + obj.fileName);
    var objFileName = obj.fileName;
    
    console.log(objFileName);
    console.log(fileCallPath);
    // var str = '';

    // str += `<div id="${obj.fileName}-div" class="upload-img">`;
    // str += '<img src="/jhc/display/image?fileName=' + fileCallPath +'">';
    // str += `<button type="button" id="${obj.fileName}-btn" class="upload-img-delete-btn btn btn-minus fa-solid fa-circle-minus btn-danger" data-file="` + fileCallPath + '" onclick="deleteFile(event)"></button>'
    // str += '</div>';

    var showColorImgHtml = showColorImg(prodColors, obj, fileCallPath);

    uploadResult.innerHTML += showColorImgHtml; 
    console.log(uploadResult);
}

function showColorImg(prodColors, obj, fileCallPath) {

    var str = '';

    str += '<div id="' + obj.FileName + '-div" data-file="' + fileCallPath + '" class="upload-color-img">';
    str += '<img src="/jhc/display/image?fileName=' + fileCallPath +  '"' + 'id="' + obj.FileName + '">';
    str += '<input type="hidden" name="' + prodColors + '.pc_img_path" value="' + fileCallPath + '">';
    str += '<input type="hidden" name="' + prodColors +  '.pc_img_uploadpath" value="' + obj.uploadPath + '">';
    str += '<input type="hidden" name="' + prodColors + '.pc_img_uuid" value="' + obj.uuid+ '">';
    str += '</div>';

    console.log(str);
    return str;
}

// 업로드 컬러 이미지 삭제 메서드
function deleteColorImgFile(event) {
    console.log("삭제실행");
    var targetName = event.target;

    var uploadTargetId = targetName.name.replace(".pc_img_filename", "-uploadImg");

    var uploadTarget = document.getElementById(uploadTargetId);

    if (uploadTarget.children.length == 0) return;
    console.log(targetName);
    var uploadTargetDataId = event.target.value;
    console.log(uploadTargetDataId);
    console.log(uploadTarget.children[0]);
    var targetFile = uploadTarget.children[0].dataset['file'];
    console.log(targetFile);

    $.ajax({
        url : '/jhc/deleteFile',
        data : {fileName : targetFile},
        dataType : 'text',
        type : 'POST',
        success : function(result) {
                console.log('삭제');
                uploadTarget.children[0].remove();
        },
        error : function(result) {
                console.log(result);

                alert('파일을 삭하제지 못하였습니다.');
        }
    });
    console.log("삭제완료");
}