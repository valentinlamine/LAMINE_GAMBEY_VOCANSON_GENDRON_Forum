function upvote(element) {
    if (element.checked) {
        element.nextElementSibling.classList.add("selected");
        console.log(element.nextElementSibling);
        console.log(element.parentElement.nextElementSibling.nextElementSibling);
        console.log(element.parentElement.nextElementSibling.nextElementSibling.children[0]);
        element.parentElement.nextElementSibling.nextElementSibling.children[0].checked = false;
        element.parentElement.nextElementSibling.nextElementSibling.children[1].classList.remove("selected");
    } else {
        element.nextElementSibling.classList.remove("selected");
    }
}

function downvote(element) {
    if (element.checked) {
        element.nextElementSibling.classList.add("selected");
        element.parentElement.previousElementSibling.previousElementSibling.children[0].checked = false;
        element.parentElement.previousElementSibling.previousElementSibling.children[1].classList.remove("selected");
    } else {
        element.nextElementSibling.classList.remove("selected");
    }
}
