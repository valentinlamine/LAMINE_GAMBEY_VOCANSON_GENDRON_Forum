function AddRole(role, username) {
    console.log("add role")
    fetch('/addRoleHandler', {
        method: 'POST',
        headers: {
            'Content-Type': 'application/json'
        },
        body: JSON.stringify({
            Role: role,
            UserName: username,
        })
    })
    .then(response => response.text())
    .then(data => {
        console.log(data);
        document.getElementById("create-topic-info").innerHTML = data;
    })
    .catch(error => console.error(error));
}

function SupprUserRole(username) {
    console.log("suppr role")
    fetch('/SupprUserRoleHandler', {
        method: 'POST',
        headers: {
            'Content-Type': 'application/json'
        },
        body: JSON.stringify({
            UserName: username,
        })
    })
    .then(response => response.text())
    .then(data => {
        console.log(data);
        document.getElementById("create-topic-info").innerHTML = data;
    })
    .catch(error => console.error(error));
}

function CreateRole(rolename, color) {
    console.log("create role")
    var selectedPerms = []
    var list = document.getElementsByClassName("permsClass")
    for (i = 0; i != list.length; i++) {
        if (list[i].checked) {
            selectedPerms.push(parseInt(list[i].id))
        }
    }
    fetch('/createRoleHandler', {
        method: 'POST',
        headers: {
            'Content-Type': 'application/json'
        },
        body: JSON.stringify({
            RoleName: rolename,
            Color: color,
            Roles: selectedPerms
        })
    })
    .then(response => response.text())
    .then(data => {
        console.log(data);
        document.getElementById("create-topic-info").innerHTML = data;
    })
    .catch(error => console.error(error));
}

function SupprRole(rolename) {
    console.log("suppr role")
    fetch('/SupprRoleHandler', {
        method: 'POST',
        headers: {
            'Content-Type': 'application/json'
        },
        body: JSON.stringify({
            RoleName: rolename,
        })
    })
    .then(response => response.text())
    .then(data => {
        console.log(data);
        document.getElementById("create-topic-info").innerHTML = data;
    })
    .catch(error => console.error(error));
}

function rickroll() {
    var content = document.getElementsByClassName("content")[0].style.backgroundImage = "url('../assets/images/rick.gif')";
}