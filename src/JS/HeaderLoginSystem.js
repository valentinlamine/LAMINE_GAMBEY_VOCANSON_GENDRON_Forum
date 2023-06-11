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
    const btnSubmit = document.querySelector('.modal-register button[type="submmit"]');

    if(password.value === comfirmPassword.value) {
        btnSubmit.disabled = false;
    } else {
        btnSubmit.disabled = true;
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

document.querySelector('.modal-register').addEventListener('keyup', verifyPassword);
document.querySelector('.modal-register').addEventListener('click', verifyPassword);
document.querySelector('.modal-register').addEventListener('change', verifyPassword);