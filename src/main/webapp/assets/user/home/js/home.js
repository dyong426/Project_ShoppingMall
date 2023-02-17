const click = () => {

  console.log(document.querySelector("#myPage_drop-down").classList);
  document.querySelector("#myPage_drop-down").classList.toggle('hidden');
}

document.querySelector("#myPage").addEventListener("click", click);


const open = () => {
  console.log(document.querySelector(".login_popup").classList);
  document.querySelector(".login_popup").classList.remove('hidden');
}

const close = () => {
  console.log(document.querySelector(".login_popup").classList);
  document.querySelector(".login_popup").classList.add('hidden');

}

document.querySelector(".sign_in").addEventListener("click", open);
document.querySelector(".closeBtn").addEventListener("click", close);

