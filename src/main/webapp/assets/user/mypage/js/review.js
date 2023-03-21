 const myForm = document.getElementById('rv_check_form');
 myForm.addEventListener('submit', function(event) {
	// form의 submit 기능 막음
	 event.preventDefault(); 
   
	 const checkedStars = myForm.querySelectorAll('input[type="radio"]:checked');

	 if (checkedStars.length === 0) {
		//안내메시지 표시
         document.querySelector('.check_box .warning_msg').style.display = 'block';
         //지정된 시간 후 안내 메시지 감춤
         setTimeout(function(){
             document.querySelector('.check_box .warning_msg').style.display = 'none';
         },2000);            
	        
	        return false;
	    }
	 
	 	const rv_content = document.getElementById("review_content");
	 	
	    if (rv_content.value.trim() == "") {
	    	rv_content.focus();
	        alert("내용을 입력해주세요");

	        return false;
		}
	    
	    if (rv_content.value.length < 5 && rv_content.value.length < 100) {
            alert("5자 이상으로 작성해 주세요");
            
            return false;
        }
	    
	    if (rv_content.value.length > 100) {
            alert("100자 이하로 작성해 주세요");
            
            return false;
        }
	    
   // form의 submit 기능 실행
   myForm.submit();
 });

