var checkboxes = document.querySelectorAll(".category-checkboxes")
var cards = document.querySelectorAll(".cardy-container")

function otherBoxesUnchecked(checkbox) {
  var answer = true
  checkboxes.forEach(box => {
    if(box.checked && box != checkbox){
      answer = false;
    }});
  return answer
}

checkboxes.forEach(checkbox => {checkbox.addEventListener('change', (event) => {
  var catCheckboxes = document.querySelectorAll(`.${event.currentTarget.getAttribute("id")}`);
  if (event.currentTarget.checked) {
    catCheckboxes.forEach(card => {card.classList.toggle('collapse')});
    if(otherBoxesUnchecked(event.currentTarget)) {
      cards.forEach(card => {card.classList.toggle('collapse')});
    } 
  } else {
    if(otherBoxesUnchecked(event.currentTarget)) {
      cards.forEach(card => {card.classList.remove('collapse')});
    } else {
      catCheckboxes.forEach(card => {card.classList.add('collapse')});
    }
  }
})});