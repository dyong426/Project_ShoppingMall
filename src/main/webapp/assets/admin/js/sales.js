// function openSales(evt, salesType) {
//     var i, x;
//     var sales_type = document.getElementById(salesType);

//     x = document.getElementsByClassName("sales-type-content");
//     for (i = 0; i < x.length; i++) {
//         x[i].style.display = 'none';
//     }
//     openSalesType(evt, sales_type);

// }

// const openSalesType = (evt, sales_type) => {

//     var btnSales = document.getElementsByClassName("btn-sales");
//     for (i = 0; i < btnSales.length; i++) {
//         btnSales[i].className = btnSales[i].className.replace(" btn-primary", " btn-secondary");
//     }
    
//     sales_type.style.display = "block";

//     evt.target.className = evt.target.className.replace(" btn-secondary", " btn-primary");
// };