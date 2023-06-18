function upvote(element, user_id, message_id) {
    if (element.checked) {
        element.nextElementSibling.classList.add("selected");
        if (element.parentElement.nextElementSibling.nextElementSibling.children[0].checked) {
            element.parentElement.nextElementSibling.nextElementSibling.children[0].checked = false;
            UpdateStatus("remove", "downvote", user_id, message_id);
        }
        element.parentElement.nextElementSibling.nextElementSibling.children[1].classList.remove("selected");
        UpdateStatus("add", "upvote", user_id, message_id);
        element.parentElement.nextElementSibling.textContent++;

    } else {
        element.nextElementSibling.classList.remove("selected");
        UpdateStatus("remove", "upvote", user_id, message_id);
        element.parentElement.nextElementSibling.textContent--;
    }
}

function downvote(element, user_id, message_id) {
    if (element.checked) {
        element.nextElementSibling.classList.add("selected");
        if (element.parentElement.previousElementSibling.previousElementSibling.children[0].checked) {
            element.parentElement.previousElementSibling.previousElementSibling.children[0].checked = false;
            UpdateStatus("remove", "upvote", user_id, message_id);
            element.parentElement.previousElementSibling.textContent--;
        }
        element.parentElement.previousElementSibling.previousElementSibling.children[1].classList.remove("selected");
        UpdateStatus("add", "downvote", user_id, message_id);
    } else {
        element.nextElementSibling.classList.remove("selected");
        UpdateStatus("remove", "downvote", user_id, message_id);
    }
}

function report(element, user_id, message_id) {
    confirm("Are you sure you want to report this message?");
    UpdateStatus("add", "report", user_id, message_id);
    alert("Thank you for your report. We will review this message as soon as possible.");
}

function UpdateStatus(type, status, user_id, message_id) {
    fetch('/messageInteractions', {
        method: 'POST',
        headers: {
            'Content-Type': 'application/json'
        },
        body: JSON.stringify({
            Type: type,
            Status: status,
            UserID: user_id,
            MsgID: message_id
        })
    })
    .then(response => response.text())
    .then(data => {
        return data;
    })
    .catch(error => console.error(error));
}

function deleteMessage(user_id, message_id) {
    if (confirm("Are you sure you want to delete this message?")) {
        fetch('/messageDelete', {
            method: 'POST',
            headers: {
                'Content-Type': 'application/json'
            },
            body: JSON.stringify({
                UserID: user_id,
                MsgID: message_id
            })
        })
        .then(response => response.text())
        .then(data => {
            data = JSON.parse(data);
            if (data.success) {
                alert(data.info);
                location.reload();
            } else {
                alert(data.info);
            }
        })
        .catch(error => console.error(error));
    }
}