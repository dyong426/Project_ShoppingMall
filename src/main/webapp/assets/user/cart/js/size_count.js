const minusBtns = document.getElementsByClassName('minus');
const plusBtns = document.getElementsByClassName('plus');
const quantities = document.getElementsByClassName('quantity');
const total_amt = document.getElementById('total_amt');
const price = document.getElementsByClassName('price')[0];
const totalPrice = document.getElementsByClassName('sb_tt_price')[0];

let totalQuantity = 0;

for (i = 0; i < quantities.length; ++i) {
    totalQuantity = parseInt(totalQuantity) + parseInt(quantities[i].value);
}

for (i = 0; i < minusBtns.length; ++i) {
    minusBtns[i].addEventListener('click', (e) => {
        let quantity = e.target.nextElementSibling.value;
        if (quantity > 0) {
            e.target.nextElementSibling.value -= 1;
            totalQuantity -= 1;
            total_amt.value = totalQuantity;
            totalPrice.innerText = (parseInt(totalQuantity) * parseInt(price.innerText)).toLocaleString('ko-KR') + '원';
        }
    });

    plusBtns[i].addEventListener('click', (e) => {
        let quantity = e.target.previousElementSibling.value;
        if (quantity < 100) {
            e.target.previousElementSibling.value = parseInt(quantity) + 1;
            totalQuantity = parseInt(totalQuantity) + 1;
            total_amt.value = totalQuantity;
            totalPrice.innerText = (parseInt(totalQuantity) * parseInt(price.innerText)).toLocaleString('ko-KR') + '원';
        }
    });
}

const submit = document.getElementById('submit');
const initQuantity = document.getElementsByClassName('initQuantity')[0];

submit.addEventListener('click', (e) => {
  initQuantity.lastElementChild.innerText = totalQuantity;
  price.innerText = totalPrice.innerText;
  closeButton.click();
});
