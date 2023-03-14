// 이미지 container
let container = document.querySelector('.img_container');

// 이미지 개수
let img_count = container.childElementCount;

// 이미지 개수만큼 container 사이즈 변경
container.style.width = img_count * 100 + 'vw';

let prevBtn = document.querySelector('.prev');
let nextBtn = document.querySelector('.next');

let currCnt = 1;

// 다음으로 넘어가는 함수
function next(){
    container.style.transform = 'translate(' + ( currCnt * (-100)) + 'vw)';
    container.style.transition = '0.5s';
    console.log('함수 시작' + currCnt);
    
    //마지막 페이지(복사한 첫번째 파일)일 경우
    if(currCnt === img_count - 1) {
        setTimeout(function(){
            container.style.transform = 'translate(-100vw)';
            container.style.transition = '0s';
        }, 500);
        currCnt = 1;
    }
    if(currCnt >= img_count-1 ){
        currCnt = 0;
    }
    currCnt++; 
    console.log('함수끝' + currCnt);
    
};

// 전으로 돌아가는 함수
function prev() {
    currCnt--;
    
    // 돌아가기 버튼을 누르면 앞 vw로 이동한다
     container.style.transform = 'translate(' + ( (currCnt) * (-100)) + 'vw)';
    container.style.transition = '0.5s';

    console.log('함수 시작 때 현재번호' + currCnt);
    
    // 첫 페이지(마지막복사)일 떄 
        if(currCnt === 0) {
            
            setTimeout(function(){
            container.style.transform = 'translate(' + ((img_count - 2) * (-100))+ 'vw)';
            container.style.transition = '0s';
        }, 500);
        currCnt = img_count - 2;
        }
          
        if (currCnt < 0){
            currCnt = img_count - 2;
        } 

        
        console.log('함수끝날때현재번호' + currCnt);
   
}

// 무한으로 돌려면  맨 앞 맨 뒤를 복사함 
// 





// 자동 슬라이드(마우스가 올라가잇으면 자동 슬라이드 멈춤)
let auto = setInterval(next, 3000);
let container2 = document.querySelector('#home_banner_container');


container2.addEventListener('mouseover', () => {
    clearInterval(auto);
});

container2.addEventListener('mouseout', () => {
    clearInterval(auto);
    auto = setInterval(next, 3000);
});


// next 버튼이 눌리면 다음 이미지로 이동
nextBtn.addEventListener('click', next);
prevBtn.addEventListener('click', prev);


