// function openCity(evt, cityName) {
//     var i, x, tablinks;
//     x = document.getElementsByClassName("city");
//     for (i = 0; i < x.length; i++) {
//         x[i].style.display = "none";
//     }
//     tablinks = document.getElementsByClassName("tablink");
//     for (i = 0; i < x.length; i++) {
//         tablinks[i].className = tablinks[i].className.replace(" w3-red", " ");
//     }
//     document.getElementById(cityName).style.display = "block";
//     evt.currentTarget.className += " w3-red";
// }

// function openFaq(evt, faq_num) {
//     var i, x;
//     var faqNum = document.getElementById(faq_num);

//     if (faqNum.style.display == 'block') {
//         faqNum.style.display = 'none';
//     } else {
//         x = document.getElementsByClassName("faq-content");
//         for (i = 0; i < x.length; i++) {
//             x[i].style.display = 'none';
//         }
//         open(evt, faqNum);
//     }
// }

// const open = (evt, faqNum) => {

//     var faqLinks = document.getElementsByClassName("faq-link");
//     for (i = 0; i < faqLinks.length; i++) {
//         faqLinks[i].className = faqLinks[i].className.replace(" w3-grey", " ");
//     }
//     console.log(faqNum.style.display);
//     faqNum.style.display = "block";
//     evt.currentTarget.className += " w3-grey";
// };

function mCtgrModifyBtn(mCtgrNum) {


    var m_ctgr_num = mCtgrNum;
    var mCtgrName = `mCtgr[${m_ctgr_num}].m_ctgr_name`;
    var mCtgrColor = `mCtgr[${m_ctgr_num}].m_ctgr_color_code`;
    var mCtgrIcon = `mCtgr[${m_ctgr_num}].m_ctgr_icon_path`;
    var m_ctgr_name = document.getElementById(mCtgrName).value;
    var m_ctgr_color_code = document.getElementById(mCtgrColor).value;
    var m_ctgr_icon_path = document.getElementById(mCtgrIcon).value;
    console.log(m_ctgr_name);
    console.log(m_ctgr_color_code);
    console.log(m_ctgr_icon_path);

    const obj = {
        "m_ctgr_num": m_ctgr_num,
        "m_ctgr_name": m_ctgr_name,
        "m_ctgr_color_code": m_ctgr_color_code,
        "m_ctgr_icon_path": m_ctgr_icon_path
    }

    console.log(JSON.stringify(obj));

    $.ajax({
        url: '/jhc/admin/uploadAjaxAction',
        processData: false,
        contentType: false,
        data: formData,
        type: 'POST',
        dataType: 'json',
        success: function (result) {
            console.log(result);
            showUploadImage(result);
        },
        error: function (result) {
            alert('이미지 파일이 아닙니다.');
        }


    });

}


