package utilities

import (
	"database/sql"
	"fmt"
	"regexp"

	"golang.org/x/crypto/bcrypt"
)

var token GetUser

func getAllUsersLoginInfo(db *sql.DB) []GetUser {
	rows, err := db.Query(`SELECT users.email, users.password, users.id FROM users`)

	if err != nil {
		panic(err.Error())
	}
	defer rows.Close()

	var users []GetUser
	for rows.Next() {
		var u GetUser

		err := rows.Scan(&u.Email, &u.Password, &u.Id)
		if err != nil {
			panic(err.Error())
		}
		users = append(users, u)

	}
	if err := rows.Err(); err != nil {
		panic(err.Error())
	}
	return (users)
}

func Login(name string, password string, db *sql.DB) (bool, int) {
	users := getAllUsersLoginInfo(db)
	for i := 0; i != len(users); i++ {
		if users[i].Email == name {
			if bcrypt.CompareHashAndPassword([]byte(users[i].Password), []byte(password)) == nil {
				return true, users[i].Id
			}
		}
	}
	return false, 0
}

func Register(email string, username string, password string, db *sql.DB) (bool, int) {
	var cryptedPassword, _ = bcrypt.GenerateFromPassword([]byte(password), 10)
	if !Security(email, 0) || !Security(username, 1) || !Security(password, 2) {
		return false, 0
	} else {
		err := UsersAdd(db, email, username, string(cryptedPassword)) == nil
		if err {
			return true, UsersGetByEmail(db, email).Id
		} else {
			return false, 0
		}
	}
}

func Security(input string, i int) bool {
	switch i {
	case 0: //email
		if m, err := regexp.MatchString(`^[a-zA-Z0-9_.+-]+@[a-zA-Z0-9-]+\.[a-zA-Z0-9-.]+$`, input); !m {
			fmt.Println(err)
			return false
		}
	case 1: //username
		if m, err := regexp.MatchString(`^[a-zA-Z0-9_.+\-À-ſ]+$`, input); !m {
			fmt.Println(err)
			return false
		}
	case 2: //password
		if m, err := regexp.MatchString(`^[a-zA-Z0-9_.+\-À-ſ]+$`, input); !m {
			fmt.Println(err)
			return false
		}
	}
	return true
}
