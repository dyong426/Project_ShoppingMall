join_check = () => {

    var email = document.getElementById("join_email");
    var name = document.getElementById("join_name");
    var pw = document.getElementById("join_pw");
    

    if(email.value == ""){
        alert("이메일 주소를 입력하세요.");
 		email.focus();
        return false;
        }
        
     if (name.value == ""){
        alert("이름을 입력하세요.");
        name.focus();
        return false;
        }
        
    if (pw.value == ""){
        alert("비밀번호를 입력하세요.");
        pw.focus();
        return false;
    }
    
    	alert("제출");
        
    

}