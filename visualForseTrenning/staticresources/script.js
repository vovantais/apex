function openModal() {
        const popup = document.querySelector('.popup');
        popup.style = 'display: block';
}

function closeModal() {
        const popup = document.querySelector('.popup');
        popup.style = 'display: none';
}

function closeSuccessMessage() {
  const popup = document.querySelector('.content__formOrder-SuccessSend');
  popup.style = 'display: none';
}

function displayCurrentPrice() {
  const slider = document.querySelector(".slider");
  const output = document.querySelector(".price");
  output.innerHTML = slider.value + '$';

  slider.oninput = function() {
    output.innerHTML = this.value + '$';
  }
}

(function init() {
  displayCurrentPrice();
})();
