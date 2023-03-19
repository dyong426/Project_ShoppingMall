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


// 전화번호 입력칸 문자 입력하면 초기화하는 함수
function isNumber(target) {
	if (isNaN(target.value)) {
		console.log(target.value);
		target.value = "";
	}
}


// 다음 주소 API 설정
const zipCode = document.getElementById('zipCode');
const addr1 = document.getElementById('addr1');

function searchPostNumber() {
	var popUpWidth = 500; //팝업의 너비
	var popUpHeight = 600; //팝업의 높이
	new daum.Postcode({
		width: popUpWidth, //생성자에 크기 값을 명시적으로 지정해야 합니다.
		height: popUpHeight,
		oncomplete: function (data) {
			// 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분입니다.
			// 예제를 참고하여 다양한 활용법을 확인해 보세요.
			zipCode.value = data.zoneCode;
			addr1.value = data.address;
		}
	}).open({
		left: (window.screen.width / 2) - (popUpWidth / 2),
		top: (window.screen.height / 2) - (popUpHeight / 2)
	});
}



// 네이버페이 API 설정
// var oPay = Naver.Pay.create({ //SDK Parameters를 참고 바랍니다.
// 	"mode" : 'development',
// 	"clientId": 'u86j4ripEt8LRfPGzQ8'
// });

//직접 만드신 네이버페이 결제버튼에 click Event를 할당하세
// const naverPay = document.getElementById('naverPay');

// naverPay.addEventListener("click", function() {
//   oPay.open({ // Pay Reserve Parameters를 참고 바랍니다.
// 	"merchantUserKey": "partner-userkey",
// 	"merchantPayKey": "partmenr-orderkey",
// 	"productName": "{#_productName}",
// 	"totalPayAmount": 50000,
// 	"taxScopeAmount": 50000,
// 	"taxExScopeAmount": 0,
// 	"returnUrl": "{#_returnUrl}"
//   });
// });


// 구매 제품 정보 fixed 범위 지정
const rightOuter = document.getElementById('rightOuter');
const leftOuter = document.getElementById('leftOuter');

window.onscroll = () => {
	let rightOuterBottom = window.scrollY + rightOuter.clientHeight;

	if (leftOuter.clientHeight <= rightOuterBottom) {
		rightOuter.style.position = 'absolute';
		rightOuter.style.top = (leftOuter.clientHeight - rightOuter.clientHeight + leftOuter.offsetTop) + 'px';
	} else {
		rightOuter.style.position = 'fixed';
		rightOuter.style.top = null;
	}
}



// 포인트 관련 설정
const useAllPoint = document.getElementById('useAllPoint');
const pointInput = document.getElementById('pointInput');
const pointSpan = document.getElementById('pointSpan');
const userPoint = parseInt(pointSpan.innerText);

useAllPoint.addEventListener('click', (e) => {
	pointInput.value = userPoint;
	pointSpan.innerText = 0;
});

pointInput.onchange = (e) => {
	let remainPoint = userPoint - e.target.value;
	if (remainPoint < 0) {
		pointInput.value = null;
		pointSpan.innerText = userPoint;
	} else {
		pointSpan.innerText = remainPoint;
	}
};



// 주소 관련 설정
const saveDestination = document.getElementById('saveDestination');
const addr2 = document.getElementById('addr2');

// 배송지 저장 되어 있으면 체크, 기존 배송지 채우기
window.onload = () => {
	if (memberAddress.addr_save == 1) {
		saveDestination.checked = true;
		zipCode.value = memberAddress.mem_zipcode;
		addr1.value = memberAddress.mem_addr1;
		addr2.value = memberAddress.mem_addr2;
	}
};



// 총 결제 금액 관련 설정
const total_amount = document.getElementById('total_amount');
const shipping_price = document.getElementById('shipping_price');
const total_price = document.getElementById('total_price');
const total_price2 = document.getElementById('total_price2');

total_amount.innerText = parseInt(total_amount.innerText).toLocaleString('ko-KR') + '원';
if (total_amount.dataset.totalprice >= 50000) {
	shipping_price.innerText = 0 + '원';
} else {
	shipping_price.innerText = 3000 + '원';
}
total_price.innerText = (parseInt(total_amount.dataset.totalprice)).toLocaleString('ko-KR') + '원';
total_price2.innerText = total_price.innerText;

const cstmImg = document.getElementsByClassName('cstmImg')[0];
