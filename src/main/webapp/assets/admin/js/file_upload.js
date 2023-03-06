// 이미지 업로드
$(":file").on('change', function(e) {
    
    // FormData.append(key, value)
    var formData = new FormData();

    var fileInput = $('input[name="origin_img_path"]');
    console.log(fileInput);

    var fileList = fileInput[0].files;
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
        dataType : 'json'
    });
});

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


