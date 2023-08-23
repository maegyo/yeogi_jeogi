const slides = document.querySelectorAll('.slide');
const toggleButtons = document.querySelectorAll('.toggle button');

let currentSlide = 0;

function showSlide(slideNumber) {
for (let i = 0; i < slides.length; i++) {
slides[i].classList.remove('active');
toggleButtons[i].classList.remove('active');
}
slides[slideNumber].classList.add('active');
toggleButtons[slideNumber].classList.add('active');
}

function nextSlide() {
currentSlide = (currentSlide + 1) % slides.length;
showSlide(currentSlide);
}

function prevSlide() {
currentSlide = (currentSlide - 1 + slides.length) % slides.length;
showSlide(currentSlide);
}

showSlide(0);
for (let i = 0; i < toggleButtons.length; i++) {
toggleButtons[i].addEventListener('click', function() {
    showSlide(Number(this.dataset.slide) - 1);
    currentSlide = Number(this.dataset.slide) - 1;
});
}

const interval = setInterval(nextSlide, 3000);
