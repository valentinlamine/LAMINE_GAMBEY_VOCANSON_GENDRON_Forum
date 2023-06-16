    window.onload = function() {
        console.log("loaded")
        let arrowUp = document.querySelector(".topic-up-down-ctn .arrow-ctn.up");
        let arrowDown = document.querySelector(".topic-up-down-ctn .arrow-ctn.down");
        let checkboxUp = document.querySelector(".topic-up-down-ctn input.up");
        let checkboxDown = document.querySelector(".topic-up-down-ctn input.down");
        console.log(arrowUp)
        console.log(arrowDown)
        console.log(checkboxUp)
        console.log(checkboxDown)

        checkboxUp.addEventListener("change", function() {
            if (checkboxUp.checked) {
                arrowUp.classList.add("selected");
                checkboxDown.checked = false;
                arrowDown.classList.remove("selected");
            } else {
                arrowUp.classList.remove("selected");
            }
        });

        checkboxDown.addEventListener("change", function() {
            if (checkboxDown.checked) {
                arrowDown.classList.add("selected");
                checkboxUp.checked = false;
                arrowUp.classList.remove("selected")
            } else {
                arrowDown.classList.remove("selected");
            }
        });

    }