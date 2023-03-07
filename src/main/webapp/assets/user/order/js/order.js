const sameBtn = document.getElementById('sameWithOrderer');

const recipient = document.getElementById('recipient');
const recipientPhone = document.getElementById('recipientPhone');

const ordererName = document.getElementById('ordererName');
const ordererPhone = document.getElementById('ordererPhone');

sameBtn.onchange = (e) => {
	if (e.srcElement.checked == true) {
		if (ordererName.value != null && ordererPhone.value != null) {
			console.log(ordererName.value);
			recipient.value = ordererName.value;
			recipientPhone.value = ordererPhone.value;
		}
	} else {
		recipient.value = null;
		recipientPhone.value = null;
	}
}

ordererPhone.addEventListener('keyup', (e) => {
	isNumber(e.target);
});

recipientPhone.addEventListener('keyup', (e) => {
	isNumber(e.target);
});


// 전화번호 입력칸 문자 입력하면 초기화 함수
function isNumber(target) {
	if (isNaN(target.value)) {
		target.value = null;
	}
}


// 다음 주소 API 설정
const zoneCode = document.getElementById('zoneCode');
const address = document.getElementById('address');

function searchPostNumber() {
	var popUpWidth = 500; //팝업의 너비
	var popUpHeight = 600; //팝업의 높이
	new daum.Postcode({
		width: popUpWidth, //생성자에 크기 값을 명시적으로 지정해야 합니다.
	    height: popUpHeight,
		oncomplete : function(data) {
			// 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분입니다.
			// 예제를 참고하여 다양한 활용법을 확인해 보세요.
			zoneCode.value = data.zonecode;
			address.value = data.address;
		}
	}).open({
	    left: (window.screen.width / 2) - (popUpWidth / 2),
	    top: (window.screen.height / 2) - (popUpHeight / 2)
	});
}



// 네이버페이 API 설정
var oPay = Naver.Pay.create({ //SDK Parameters를 참고 바랍니다.
	"mode" : 'development',
	"clientId": 'u86j4ripEt8LRfPGzQ8'
});

//직접 만드신 네이버페이 결제버튼에 click Event를 할당하세
const naverPay = document.getElementById('naverPay');

naverPay.addEventListener("click", function() {
  oPay.open({ // Pay Reserve Parameters를 참고 바랍니다.
	"merchantUserKey": "partner-userkey",
	"merchantPayKey": "partmenr-orderkey",
	"productName": "{#_productName}",
	"totalPayAmount": 50000,
	"taxScopeAmount": 50000,
	"taxExScopeAmount": 0,
	"returnUrl": "{#_returnUrl}"
  });
});


const rightOuter = document.getElementById('rightOuter');
const leftOuter = document.getElementById('leftOuter');
window.onscroll = (e) => {
	console.log('leftOuter의 바닥 위치 : ', leftOuter.offsetTop + leftOuter.clientHeight);
	console.dir(rightOuter);
}
