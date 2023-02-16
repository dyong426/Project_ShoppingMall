const click = () => {
    
    console.log(document.querySelector("#myPage_drop-down").classList);
    document.querySelector("#myPage_drop-down").classList.toggle('hidden');
  }
  
  
  document.querySelector("#myPage").addEventListener("click", click);
  
  
  