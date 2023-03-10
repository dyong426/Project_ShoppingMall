window.onload = function(){
var modal = document.querySelector(".modal");
var ec_wr_name = document.querySelector(".ec_wr_name");
var closeButton = document.querySelector(".close-button");

//console.log(modal);

function toggleModal() {
	modal.classList.toggle("show-modal");
}

function windowOnClick(event) {
	if (event.target === modal) {
		toggleModal();
	}
}

ec_wr_name.addEventListener("click", toggleModal);
closeButton.addEventListener("click", toggleModal);
window.addEventListener("click", windowOnClick);
}
