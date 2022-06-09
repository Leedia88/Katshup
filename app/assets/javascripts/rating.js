const starEditPage = document.querySelector("[data-startEditPage]")

const grade = () => {
  let stars = document.querySelector(".star-grade").childNodes;

  stars.forEach(button => {button.addEventListener('mouseover', () => {
    button.firstElementChild.classList.add('fa-solid');
    button.firstElementChild.classList.remove('fa-regular');
    let e = button.previousElementSibling;
    let j = button.nextElementSibling;
    while (e != null) {
      e.firstElementChild?.classList.add('fa-solid');
      e.firstElementChild?.classList.remove('fa-regular');
      e = e.previousElementSibling;
    }
    while (j != null) {
      j.firstElementChild?.classList.add('fa-regular');
      j.firstElementChild?.classList.remove('fa-solid');
      j = j.nextElementSibling;
    }
  })})
}

if (starEditPage != null) {
  grade();
}