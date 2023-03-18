<!-- 정수정, 홈 화면-->

const click = () => {


  document.querySelector("#myPage_drop-down").classList.toggle('hidden');
}

document.querySelector("#myPage").addEventListener("click", click);


const open_login = () => {
 
  document.querySelector(".login_popup").classList.remove('hidden');


}
const open_join = () => {

  document.querySelector(".join_popup").classList.remove('hidden');
}


const close_login = () => {
  
  document.querySelector(".login_popup").classList.add('hidden');

}


const close_join = () => {

  
  document.querySelector(".join_popup").classList.add('hidden');

}

function isLoggedIn(callback) {
  var loggedIn = true;

  $.ajax({
    url: '/jhc/isLoggedIn',
    type: 'POST',
    data: { loggedIn: loggedIn },
    dataType: 'json',
    success: function(result) {
      callback(result);
    },
    error: function(e) {
      console.log(e.responseText);
      callback(false);
    }
  });
}


document.querySelector(".login").addEventListener("click", open_login);
document.querySelector(".join").addEventListener("click", open_join);
document.querySelector(".login_closeBtn").addEventListener("click", close_login);
document.querySelector(".join_closeBtn").addEventListener("click", close_join);