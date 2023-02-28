const click = () => {


  document.querySelector("#myPage_drop-down").classList.toggle('hidden');
}

document.querySelector("#myPage").addEventListener("click", click);


const open_login = () => {
console.log(login_value);

if(login_value==='logout'){
	logout();
	
} else if(login_value ==='login') {
 
  document.querySelector(".login_popup").classList.remove('hidden');
}

}
const open_join = () => {

  document.querySelector(".join_popup").classList.remove('hidden');
}


const close_login = () => {
  
  document.querySelector(".login_popup").classList.add('hidden');

}


const close_join = () => {

  console.log(document.querySelector(".join_popup").classList);
  
  document.querySelector(".join_popup").classList.add('hidden');

}



document.querySelector(".sign_in").addEventListener("click", open_login);
document.querySelector(".sign_up").addEventListener("click", open_join);
document.querySelector(".login_closeBtn").addEventListener("click", close_login);
document.querySelector(".join_closeBtn").addEventListener("click", close_join);