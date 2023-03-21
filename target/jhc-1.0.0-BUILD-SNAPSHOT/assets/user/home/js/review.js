let page_box = document.getElementById('all_review_page');
let hihello = "안녕하세요";


console.log(hihello);
console.log(total);
function createPageBtn(cnt) {
    page_box.innerHTML += '<input type="submit" name="page">' +  cnt + '</input>'; 
}

let total_page = 1;

if(total % 10 == 0) {
    total_page = total/10;
} else {
    total_page = total/10 + 1;
}

console.log(total_page);