function doCheck() {
    let rv_star = document.getElementsByClassName("rate_radio");
    let rv_content = document.getElementById("wr_review");
    let rv_form = document.getElementById("rv_check_form");

    if (rv_form.rv_star.value == "") {
        rv_form.rv_star.focus();
        alert("별점을 선택해주세요");
        
        return false;
    }

    if (rv_form.rv_content.value == "") {
        rv_form.rv_content.focus();
        alert("내용을 입력해주세요");
        if (rv_form.rv_content.value.length < 5) {
            alert("5자 이상 적어주세요");
        }

        return false;
	}
	return true;
}

