
function toggleContent(element) {
    let ContentList = element.nextElementSibling;
    let arrow = element.querySelector(".arrow");

    if (ContentList.style.display === 'flex') {
        ContentList.style.display = 'none';
        arrow.style.transform = 'rotate(0deg)';
    } else {
        ContentList.style.display = 'flex';
        arrow.style.transform = 'rotate(180deg)';
    }
}

