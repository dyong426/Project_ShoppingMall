const sameBtn = document.getElementById('sameWithOrderer');

const recipient = document.getElementById('recipient');
const recipientPhone = document.getElementById('recipientPhone');

const ordererName = document.getElementById('ordererName');
const ordererPhone = document.getElementById('ordererPhone');

sameBtn.onchange = (e) => {
	if (e.srcElement.checked == true) {
		if (ordererName.value != null && ordererPhone.value != null) {
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
			zipCode.value = data.zonecode;
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

window.addEventListener('resize', () => {
	rightOuter.style.left = leftOuter.offsetLeft + leftOuter.clientWidth - 5 + 'px';
});

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


// 주소 관련 설정
const saveDestination = document.getElementById('saveDestination');
const addr2 = document.getElementById('addr2');

// 총 결제 금액 관련 설정
const total_amount = document.getElementById('total_amount');
const shipping_price = document.getElementById('shipping_price');
const total_price = document.getElementById('total_price');
const total_price2 = document.getElementById('total_price2');
let totalPriceOnlyNumber = null;

window.onload = () => {
	rightOuter.style.left = leftOuter.offsetLeft + leftOuter.clientWidth - 5 + 'px';
	// 주소 관련 설정
	// 배송지 저장 되어 있으면 체크, 기존 배송지 채우기
	if (memberAddress.addr_save == 1) {
		saveDestination.checked = true;
		zipCode.value = memberAddress.mem_zipcode;
		addr1.value = memberAddress.mem_addr1;
		addr2.value = memberAddress.mem_addr2;
	}
	
	// 총 결제 금액 관련 설정
	total_amount.innerText = parseInt(total_amount.innerText).toLocaleString('ko-KR') + '원';
	if (total_amount.dataset.totalprice >= 50000) {
		shipping_price.innerText = 0 + '원';
	} else {
		shipping_price.innerText = 3000 + '원';
	}
	totalPriceOnlyNumber = parseInt(total_amount.dataset.totalprice) + parseInt(shipping_price.innerText.substring(0, shipping_price.innerText.length - 1));
	total_price.innerText = (totalPriceOnlyNumber).toLocaleString('ko-KR') + '원';
	total_price2.innerText = total_price.innerText;

	const pc_name = document.getElementsByClassName('pc_name');
	const p_price = document.getElementsByClassName('p_price');

	for (i = 0; i < pc_name.length; ++i) {
		if (pc_name[i].innerText.length > 8) {
			pc_name[i].style.fontSize = 'small';
		}
		if (p_price[i].innerText.length > 6) {
			p_price[i].style.fontSize = 'small';
		}
		p_price[i].innerText = parseInt(p_price[i].innerText).toLocaleString('ko-KR') + '원';
	}
};

// 포인트 관련 설정
const useAllPoint = document.getElementById('useAllPoint');
const pointInput = document.getElementById('pointInput');
const pointSpan = document.getElementById('pointSpan');
const userPoint = parseInt(pointSpan.innerText);
const discount = document.getElementById('discount');

useAllPoint.addEventListener('click', (e) => {
	if (totalPriceOnlyNumber - userPoint < 0) {
		pointInput.value = totalPriceOnlyNumber;
		pointSpan.innerText = userPoint - totalPriceOnlyNumber;
		total_price.innerText = '0원';
	} else {
		pointInput.value = userPoint;
		pointSpan.innerText = 0;
		total_price.innerText = (totalPriceOnlyNumber - userPoint).toLocaleString('ko-KR') + '원';
	}
	total_price2.innerText = total_price.innerText;
	discount.innerText = (parseInt(pointInput.value)).toLocaleString('ko-KR') + '원';
});

pointInput.onchange = (e) => {
	let remainPoint = userPoint - e.target.value;
	if (remainPoint < 0) {
		pointInput.value = null;
		pointSpan.innerText = userPoint;
		discount.innerText = '0원';
	} else if (e.target.value < 0) {
		pointInput.value = 0;
		discount.innerText = '0원';
 	} else {
		pointSpan.innerText = remainPoint;
		discount.innerText = (parseInt(pointInput.value)).toLocaleString('ko-KR') + '원';
	}
	total_price.innerText = (totalPriceOnlyNumber - e.target.value).toLocaleString('ko-KR') + '원';
	total_price2.innerText = total_price.innerText;
};


const orderCompleted = document.getElementById('orderCompleted');
const payButtons = document.getElementsByClassName('payButtons');
const inputs = document.getElementsByTagName('input');
const payment_num = document.getElementById('payment_num');
const total_amount_input = document.getElementById('total_amount_input');
const totalQuantity = document.getElementById('total_quantity');
const cart_num = document.getElementById('payment').dataset.cart_num;
const orderId = document.getElementById('payment').dataset.orderid;
let p_name = null;

if (totalQuantity.innerText != '1개') {
	p_name = document.querySelector('.p_name').innerText + ' 외 ' + (parseInt(totalQuantity.innerText.substring(0, totalQuantity.innerText.length - 1)) - 1) + '개 상품';
} else {
	p_name = document.querySelector('.p_name').innerText;
}
let tf = false;

var clientKey = 'test_ck_D5GePWvyJnrK0W0k6q8gLzN97Eoq' // 테스트용 클라이언트 키
  // 2. 초기화
var tossPayments = TossPayments(clientKey);

const phoneRegex = /01[012679]\d{7,8}/;

for (i = 0; i < payButtons.length; ++i) {
	let payment = i;
	payButtons[i].addEventListener('click', (e) => {
		e.preventDefault();
		for (j = 0; j < inputs.length; ++j) {
			if (inputs[j].className == 'emptyCheck') {
				if (inputs[j].value == '' || (inputs[j].id == 'recipientPhone' && !phoneRegex.test(inputs[j].value))) {
					inputs[j].focus();
					tf = false;
					break;
				} else {
					tf = true;
				}
			}
		}
		if (tf) {
			payment_num.value = payment + 1;
			total_amount_input.value = total_price.innerText.substring(0, total_price.innerText.length - 1).replaceAll(',', '');
			let payment_name = payment == 0 ? '가상계좌' : '카드';
			let easyPay = null;
			let flowMode = 'DIRECT';
			switch (payment) {
				case 1 :
					easyPay = 'SAMSUNGPAY'
					break;
				case 2 :
					easyPay = 'NAVERPAY'
					break;
				case 3 :
					easyPay = 'TOSSPAY'
					break;
				default :
					flowMode = 'DEFAULT'
					break;
			}
			tossPayments.requestPayment(payment_name, {
				// 결제 정보 파라미터
				'amount': total_amount_input.value,
				'orderId': orderId + orderId,
				'orderName': p_name,
				'customerName': mem_name,
				'flowMode': flowMode,
				'easyPay': easyPay
			}).then(function (result) {
				//결제 요청 성공 처리
				const data = JSON.stringify({
					"paymentKey": result.paymentKey,
					"orderId": result.orderId,
					"amount": result.amount
				  });
				  
				  const xhr = new XMLHttpRequest();
				  xhr.withCredentials = true;
				  
				  xhr.addEventListener("readystatechange", function () {
					if (this.readyState === this.DONE) {
					    orderCompleted.submit();
					}
				  });
				  
				  xhr.open("POST", "https://api.tosspayments.com/v1/payments/confirm");
				  xhr.setRequestHeader("Authorization", "Basic dGVzdF9za196WExrS0V5cE5BcldtbzUwblgzbG1lYXhZRzVSOg==");
				  xhr.setRequestHeader("Content-Type", "application/json");
				  
				  xhr.send(data);
			  })
			  .catch(function (error) {
				if (error.code === 'USER_CANCEL') {
				  // 결제 고객이 결제창을 닫았을 때 에러 처리
				} else if (error.code === 'INVALID_CARD_COMPANY') {
				  // 유효하지 않은 카드 코드에 대한 에러 처리
				  alert('유효하지 않은 카드입니다.');
				}
			})
		}
	});
}
