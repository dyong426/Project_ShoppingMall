window.onload = function(){
	var rv_modal = document.querySelector(".rv_modal");
	var ec_wr_names = document.querySelectorAll(".ec_wr_name");
	var rv_closeButton = document.querySelector(".rv_close-button");

	function toggleModal() {
		rv_modal.classList.toggle("show-rv_modal");
	}

	function windowOnClick(event) {
		if (event.target === rv_modal) {
			toggleModal();
		}
	}

	ec_wr_names.forEach( (ec_wr_name) => {
		ec_wr_name.addEventListener('click', toggleModal)
	});
	rv_closeButton.addEventListener("click", toggleModal);
	window.addEventListener("click", windowOnClick);
}
