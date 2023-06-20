const bcrypt = require('bcryptjs');
console.log('Hello World!');
const faker = require('faker');

function GenerateUser() {
    var username = faker.internet.userName();
    username = username.replace(/[^a-zA-Z0-9]/g, '');
    var password = bcrypt.hashSync(faker.internet.password(), 10);
    var email = faker.internet.email();
    var birthdate = faker.date.past(18, new Date(2000, 0, 1));
    birthdate = birthdate.toISOString().slice(0, 10);

    //Console log the INSERT of this values 
    //example of insert : INSERT INTO users (username, password, email, birthdate) VALUES ('username', 'password', 'email', 'birthdate'); 
    console.log("INSERT INTO users (username, password, email, birth_date) VALUES ('" + username + "', '" + password + "', '" + email + "', '" + birthdate + "');");
}

for (let i = 0; i < 387; i++) {
    GenerateUser();
}