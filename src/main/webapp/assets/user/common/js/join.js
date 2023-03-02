

join_check = () => {

    const email = document.getElementById("mem_email");
    const name = document.getElementById("mem_name");
    const pw = document.getElementById("mem_pw");
    

    if(email.value == ""){
        
 		email.focus();
        return false;
        }
        
    if (name.value == ""){
        
        name.focus();
        return false;
        }
        
    if (pw.value == ""){
       
        pw.focus();
        return false;
    }
    
   	check_email(); 	
    check_name();
    check_pw();

}

// 유효성 체크
check_email = () => {

}

check_name = () => {


}

check_pw = () => {


}

function please_insert(num){
    if(num === 1){
        // email를 입력해주세요
    } else if (num === 2){
        // 이름
    } else if (num ===3){
        // 비번
    }

}