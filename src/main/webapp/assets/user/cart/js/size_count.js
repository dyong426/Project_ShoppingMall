const minusBtns = document.getElementsByClassName('minus');
const plusBtns = document.getElementsByClassName('plus');
const total_amts = document.getElementsByClassName('total_amt');
const prices = document.getElementsByClassName('price');
const totalPrices = document.getElementsByClassName('sb_tt_price');
const val = document.getElementsByClassName('val');

const deleteBtns = document.getElementsByClassName('delete');
const prodDetails = document.getElementsByClassName('prodDetail');
const basket_bottoms = document.getElementsByClassName('basket_bottom');

const submits = document.getElementsByClassName('submit');
const initQuantities = document.getElementsByClassName('initQuantity');

// for (i = 0; i < submits.length; ++i) {
//     let total_amt = total_amts[i];
//     let price = prices[i];
//     let totalPrice = totalPrices[i];
//     let submit = submits[i];
//     let initQuantity = initQuantities[i];
//     let closeButton = closeButtons[i];

//     submit.addEventListener('click', (e) => {
//         initQuantity.lastElementChild.innerText = totalQuantity;
//         price.innerText = totalPrice.innerText;

//         closeButton.click();
//     });
// }

for (i = 0; i < minusBtns.length; ++i) {
    let totalQty = parseInt(prices[i].innerText.substring(0, prices[i].innerText.length - 1));
    let qtyVal = val[i];
    let price = prices[i];
    let cartNum = prodDetails[i].dataset.cart_num;

    minusBtns[i].addEventListener('click', (e) => {
        let quantity = parseInt(e.target.nextElementSibling.innerText);
        if (quantity > 0) {
            qtyVal.innerText = quantity - 1;
            price.innerText = (parseInt(qtyVal.innerText) * parseInt(price.dataset.price)).toLocaleString('ko-KR') + '원';

            const xhttp = new XMLHttpRequest();

            xhttp.open('POST', 'update/decreaseQty');
            xhttp.setRequestHeader('Content-Type', 'application/x-www-form-urlencoded');
            xhttp.send(`cart_num=${cartNum}&p_price=${price.dataset.price}`);
        }
        updateSummary();
    });
    
    plusBtns[i].addEventListener('click', (e) => {
        let quantity = parseInt(e.target.previousElementSibling.innerText);
        if (quantity < 100) {
            qtyVal.innerText = quantity + 1;
            price.innerText = (parseInt(qtyVal.innerText) * parseInt(price.dataset.price)).toLocaleString('ko-KR') + '원';
            
            const xhttp = new XMLHttpRequest();

            xhttp.open('POST', 'update/increaseQty');
            xhttp.setRequestHeader('Content-Type', 'application/x-www-form-urlencoded');
            xhttp.send(`cart_num=${cartNum}&p_price=${price.dataset.price}`);
        }
        updateSummary();
    });

    let basket_bottom = basket_bottoms[i];
    deleteBtns[i].addEventListener('click', (e) => {
        if (confirm('정말로 삭제하시겠습니까?')) {

            const xhttp = new XMLHttpRequest();

            xhttp.open('POST', '/jhc/deleteCart');
            xhttp.setRequestHeader('Content-Type', 'application/x-www-form-urlencoded');
            xhttp.send(`cart_num=${cartNum}`);

            basket_bottom.remove();
        }
    });
}
