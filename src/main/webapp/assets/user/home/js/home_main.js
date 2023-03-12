// 이미지 container
let container = document.querySelector('.img_container');

// 이미지 개수
let img_count = container.childElementCount;

// 이미지 개수만큼 container 사이즈 변경
container.style.width = img_count * 100 + 'vw';

let prevBtn = document.querySelector('.prev');
let nextBtn = document.querySelector('.next');

let currCnt = 1;

//console.log(nextCnt);
function next(){
    console.log(currCnt);
    container.style.transform = 'translate(' + ( currCnt * (-100)) + 'vw)';
    currCnt++;    
    if (currCnt == img_count){
        currCnt = 0;
    }
};


function prev() {
    console.log(currCnt);
    container.style.transform = 'translate(' + ( currCnt * (-100)) + 'vw)';
    --currCnt;    
    if (currCnt < 0){
        currCnt = img_count - 1;
    }
}

// 자동 슬라이드
setInterval(next, 5000);
// next 버튼이 눌리면 다음거로 이동
nextBtn.addEventListener('click', next);
prevBtn.addEventListener('click', prev);
