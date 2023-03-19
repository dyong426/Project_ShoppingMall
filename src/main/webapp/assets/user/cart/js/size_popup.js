// const modal = document.querySelector(".modal");
// const edit = document.getElementsByClassName("edit");
// const closeButton = document.querySelector(".close-button");
// const mainBox = document.querySelector('.pd_main_box');
// const subTitle = document.querySelector('.sub_title');
// const sizes = document.getElementsByClassName('size');

// // function windowOnClick(e) {
// //     if (e.target.classList.contains('modal')) {
        
// //     }
// // }

// for (i = 0; i < edit.length; ++i) {
//     let prodDetail = prodDetails[i];
//     edit[i].addEventListener("click", (e) => {
//         const xhttp = new XMLHttpRequest();
//         let totalQty = 0;
        
//         xhttp.addEventListener('readystatechange', (e) => {
//             if (xhttp.readyState == 4 && xhttp.status == 200) {
//                 const result = JSON.parse(e.target.responseText);
//                 mainBox.innerHTML = `<div class="sub">${prodDetail.dataset.p_name} [${prodDetail.dataset.pc_name}]</div>`;
//                 for (j = 0; j < result.length; ++j) {
//                     sizeQty = 0;
//                     for (j = 0; j < sizes.length; ++j) {
//                         if (result[i].ps_name == sizes[j].innerText) {

//                         }
//                     }
//                     mainBox.innerHTML += `
// 					<div class="pd_size">
//                     <div class="size_input">
//                     <span>${result[i].ps_name}</span>
//                     <div class="pd_amount">
//                     <div class="minusBtn" data-action="decrement"></div>
//                     <div class="quantity">1</div>
//                     <div class="plusBtn" data-action="increment"></div>
//                     </div>
//                     </div>
//                     </div>
//                     `;
//                     console.dir(quantity);
//                     totalQty += parseInt(quantity.innerText);
//                 }
//             }
//         });
//         xhttp.open('GET', `getSizes?p_num=${e.target.dataset.p_num}`);
//         xhttp.send();
        
//         subTitle.innerText = totalQty + '개 상품의 금액';
//         modal.classList.toggle('show-modal');
//     });
//     closeButton.addEventListener("click", (e) => {
//         modal.classList.toggle('show-modal');
//     });
// }

// window.addEventListener("click", (e) => {
//     if (e.target.classList.contains('modal')) {
//         modal.classList.toggle('show-modal');
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
    totalQuantity.innerText = qty + '개';
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
