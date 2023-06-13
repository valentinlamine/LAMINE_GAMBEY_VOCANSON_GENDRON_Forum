window.onload = function() {
    let checkbox1 = document.querySelector(".topic-up-vote input[type='checkbox']");
    let checkbox2 = document.querySelector(".topic-down-vote input[type='checkbox']");

    checkbox1.addEventListener("change", function() {
        if(checkbox1.checked && checkbox2.checked) {
            checkbox2.checked = false;
        }
    });

    checkbox2.addEventListener("change", function() {
        if(checkbox1.checked && checkbox2.checked) {
            checkbox1.checked = false;
        }
    });
}