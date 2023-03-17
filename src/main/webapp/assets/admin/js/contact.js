
function modifyBtn(contactNum) {
	var contact_num = contactNum;
    var replyBtnForm = $('#reply_button_form');
    var adminReply = $('#admin_reply_reg');
    var completeBtn = `<button type="button" class="form-control" onclick="modifyReply(${contact_num});">완료</button>`;

    console.log('modify');
    replyBtnForm.empty();

    replyBtnForm.append(completeBtn);

    adminReply.prop('readonly', false);

}

function modifyReply(contactNum) {
    var contact_num = contactNum;
    var adminReply = $('#admin_reply_reg');
    var admin_reply = adminReply.val();

    var replyBtnForm = $('#reply_button_form');
  	
  	const obj = {
  		"contact_num": contact_num, 
  		"admin_reply": admin_reply
  	};
    console.log(JSON.stringify(obj));
    $.ajax({

        url: '/jhc/admin/contact/reply/modify',
        processData : false,
        contentType : 'application/json',
        data : JSON.stringify(obj),
        type : 'POST',
        dataType : 'json',
        success: function(result) {
        	if (result = 'success') {
        	console.log(result);
            alert('수정 완료');
        	}
        }        
    });

    var modifyBtn = '<button type="button" class="form-control" style="width: 50px;"><i class="fa-solid fa-pen" onclick="modifyBtn(contat_num)"></i></button>'
					+'<button type="button" class="form-control" style="width: 50px;"><i class="fa-solid fa-trash-can" onclick="deleteReply()"></i></button>'
    replyBtnForm.empty();
    replyBtnForm.append(modifyBtn);
	
}