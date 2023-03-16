window.onload = function () {
  function decrement(e) {
    const btn = e.target.parentNode.parentElement.querySelector(
      'div[data-action="decrement"]'
    );
    const target = btn.nextElementSibling;
    let value = Number(target.value);
    if (value > 0) {
      value--;
      target.value = value;
    } else if (value <= 0) {
      target.value = 0;
    }
  }

  function increment(e) {
    const btn = e.target.parentNode.parentElement.querySelector(
      'div[data-action="decrement"]'
    );
    const target = btn.nextElementSibling;
    let value = Number(target.value);
    value++;
    target.value = value;
  }

  const decrementButtons = document.querySelectorAll(
    `div[data-action="decrement"]`
  );

  const incrementButtons = document.querySelectorAll(
    `div[data-action="increment"]`
  );

  decrementButtons.forEach(btn => {
    btn.addEventListener("click", decrement);
  });

  incrementButtons.forEach(btn => {
    btn.addEventListener("click", increment);
  });
}
