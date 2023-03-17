// var modal = document.getElementsByClassName("modal");
// var edit = document.getElementsByClassName("edit");

// function windowOnClick(e) {
//     if (e.target.classList.contains('modal')) {
        
//     }
// }

// let mod;
// for (i = 0; i < modal.length; ++i) {
//     mod = modal[i];
//     edit[i].addEventListener("click", (e) => {
//         // const xhttp = new XMLHttpRequest();
        
//         // xhttp.addEventListener('readystatechange', (e) => {
//         //     if (xhttp.readyState == 4 && xhttp.status == 200) {
                
//         //     }
//         // });
//         // xhttp.open('GET', `getSizes?pNum=${e.target.dataset.pnum}`);
//         // xhttp.send();
        
//         // mod.classList.toggle('show-modal');
//     });
//     closeButtons[i].addEventListener("click", (e) => {
//         mod.classList.toggle('show-modal');
//     });
// }

// window.addEventListener("click", (e) => {
//     if (e.target.classList.contains('modal')) {
//         mod.classList.toggle('show-modal');
//     }
// });


const totalQuantity = document.querySelector('.total_quantity');
const deliveryCharge = document.querySelector('.delivery_charge');
const allPrice = document.querySelector('.all_price');
const totalPrice = document.querySelector('.total_price');

function updateSummary() {
    let qty = 0;
    let ap = 0;
    for (i = 0; i < val.length; ++i) {
        qty += parseInt(val[i].innerText);
        ap += (parseInt(prices[i].dataset.price) * parseInt(val[i].innerText));
    }
    totalQuantity.innerText = qty;
    allPrice.innerText = ap.toLocaleString('ko-KR') + '원';
    if (ap > 50000) {
        deliveryCharge.innerText = '0원';
        totalPrice.innerText = allPrice.innerText;
    } else {
        deliveryCharge.innerText = '3000원';
        totalPrice.innerText = (ap + 3000).toLocaleString('ko-KR') + '원';
    }
}

updateSummary();
