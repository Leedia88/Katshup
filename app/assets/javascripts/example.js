var checkboxes = document.querySelectorAll(".category-checkboxes");
var cards = document.querySelectorAll(".cardy-container");;

checkboxes.forEach((checkbox) => {
	checkbox.addEventListener("change", () => {
		cards.forEach((card) => {
			card.style.display = "none";
			var stayHidden = true;
			var checkedBoxes = document.querySelectorAll('input[type=checkbox]:checked');
			checkedBoxes.forEach(function(elem) {

				if(card.classList.contains(elem.id)){
					stayHidden = false;
				};
			});
			if(!stayHidden) {card.style.display = "";}
		});
	});
});

