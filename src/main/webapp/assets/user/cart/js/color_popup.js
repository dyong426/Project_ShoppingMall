var cl_modal = document.querySelector(".cl_modal");
var add_color = document.querySelector(".add_color");
var cl_closeButton = document.querySelector(".cl_close-button");

function toggleModal() {
    cl_modal.classList.toggle("show-cl_modal");
}

function windowOnClick(event) {
    if (event.target === cl_modal) {
        toggleModal();
    }
}

add_color.addEventListener("click", toggleModal);
cl_closeButton.addEventListener("click", toggleModal);
window.addEventListener("click", windowOnClick);
