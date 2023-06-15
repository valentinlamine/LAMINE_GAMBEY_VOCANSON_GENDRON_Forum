const modalLogin = document.querySelector('.modal-login');
const modalRegister = document.querySelector('.modal-register');
const btnLogin = document.querySelector('.login-button');
const btnRegister = document.querySelector('.signup-button');

btnLogin.addEventListener('click', () => openLogin());

btnRegister.addEventListener('click', () => openRegister());

//function that verify that the password and the comfirm password are the same
function verifyPassword() {
    const password = document.querySelector('.modal-register input[name="password"]');
    const comfirmPassword = document.querySelector('.modal-register input[name="comfirmPassword"]');
    const btnSubmit = document.querySelector('.modal-register button[type="submit"]');

    if(password.value === comfirmPassword.value) {
        btnSubmit.disabled = false;
        btnSubmit.style.cursor = 'pointer';
    } else {
        btnSubmit.disabled = true;
        btnSubmit.style.cursor = 'not-allowed';
    }
}

function closeModal() {
    modalLogin.style.display = 'none';
    modalRegister.style.display = 'none';
}

function openRegister() {
    modalLogin.style.display = 'none';
    modalRegister.style.display = 'flex';
}

function openLogin() {
    modalLogin.style.display = 'flex';
    modalRegister.style.display = 'none';
}


function Login(email, password) {
    fetch('/login', {
        method: 'POST',
        headers: {
            'Content-Type': 'application/json'
        },
        body: JSON.stringify({email, password})
    })
        .then(response => response.json())
        .then(data => {
            if (data.id === 0) {
                console.log(data.info);
                document.getElementById("login-info").innerHTML = data.info;
                localStorage.setItem("token", data.id)
            } else {
                localStorage.setItem("token", data.id);
                document.querySelector("#token-input").value = data.id;
                document.getElementById("load-log-in-page").submit();
            }
        })
        .catch(error => console.error(error));
}

function Register(username, email, password) {
    fetch('/register', {
        method: 'POST',
        headers: {
            'Content-Type': 'application/json'
        },
        body: JSON.stringify({username, email, password})
    })
        .then(response => response.json())
        .then(data => {
            if (data.id === 0) {
                console.log(data.info);
                document.getElementById("register-info").innerHTML = data.info;
                localStorage.setItem("token", data.id)
            } else {
                localStorage.setItem("token", data.id);
                document.querySelector("#token-input").value = data.id;
                document.getElementById("load-log-in-page").submit();
            }
        })
        .catch(error => console.error(error));
}

addEventListener("load" , function() {
    if (localStorage.getItem("token") !== null && localStorage.getItem("token") !== "0") {
        document.querySelector("#token-input").value = localStorage.getItem("token");
        document.getElementById("load-log-in-page").submit();
    }
});