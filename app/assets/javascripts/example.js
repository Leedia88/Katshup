var checkboxes = document.querySelectorAll(".category-checkboxes");
var cards = document.querySelectorAll(".cardy-container");;

function otherBoxesUnchecked(checkbox) {
	var answer = true;
	checkboxes.forEach((box) => {
		if (box.checked && box != checkbox) {
			answer = false;
		}
	});
	return answer;
}

checkboxes.forEach((checkbox) => {
	checkbox.addEventListener("change", () => {
		var checkboxCard = document.querySelectorAll(`.cardy-container.${checkbox.getAttribute("id")}`);
		if (otherBoxesUnchecked(checkbox)) {
			if(checkbox.checked){
			cards.forEach((card) => {card.classList.add("collapse")});
			checkboxCard.forEach((card) => {card.classList.remove("collapse")});
			} else {
				cards.forEach((card) => {card.classList.remove("collapse")});
			}
		} else {
			if(checkbox.checked){
				checkboxCard.forEach((card) => {card.classList.remove("collapse")});
			} else {
				checkboxCard.forEach((card) => {card.classList.add("collapse")});
				checkboxes.forEach((checkbox) => {
				if(checkbox.checked) {
					var checkboxCard = document.querySelectorAll(`.cardy-container.${checkbox.getAttribute("id")}`);
					checkboxCard.forEach((card) => {card.classList.remove("collapse")});
				}})
			}
		}
	})});