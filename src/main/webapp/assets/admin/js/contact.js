
function modifyBtn(contactNum) {
	var contact_num = contactNum;
    var replyBtnForm = $('#reply_button_form');
    var adminReply = $('#admin_reply_reg');
    var completeBtn = `<button type="submit" class="btn btn-dark btn-sm" formaction="/jhc/admin/contact/content/reply/update">완료</button>`;

    adminReply.prop('readonly', false);
    console.log('modify');
    replyBtnForm.empty();

    replyBtnForm.append(completeBtn);


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

    var modifyBtn = '<button type="button" class="btn btn-dark"><i class="fa-solid fa-pen" onclick="modifyBtn(${content.contact_num})"></i></button>';
    replyBtnForm.empty();
    replyBtnForm.append(modifyBtn);
	
}