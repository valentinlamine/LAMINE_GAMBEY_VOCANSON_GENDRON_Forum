
function toggleContent(element) {
    let ContentList = element.nextElementSibling;
    let arrow = element.querySelector(".arrow");

    if (ContentList.style.display === 'flex') {
        ContentList.style.display = 'none';
        arrow.textContent = '▶';
    } else {
        ContentList.style.display = 'flex';
        arrow.textContent = '▼';
    }
}

