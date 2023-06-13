package utilities

import (
	"database/sql"
	"fmt"
	"net/http"
	"regexp"

	"github.com/go-humble/locstor"
	"golang.org/x/crypto/bcrypt"
)

var token GetUser

func GetLoginRegister(r *http.Request, w http.ResponseWriter, db *sql.DB) GetUser { //PROBLEME PAS DE []GetUsersAll
	var defaultUser GetUser
	fmt.Println(r.FormValue("submit"))
	if r.FormValue("submit") == "login" {
		fmt.Println("login")
		if login(r.FormValue("loginName"), r.FormValue("loginPassword"), db) {
			fmt.Println("matching password")
			token = UsersGetByEmail(db, r.FormValue("loginName"))
			item := locstor.SetItem("token", "test")
			fmt.Println(item)
		} else {
			token = defaultUser
		}
	} else if r.FormValue("submit") == "register" {
		fmt.Println(register(r.FormValue("email"), r.FormValue("username"), r.FormValue("password"), db))
	}
	return token
}

func GetLogoutInfo(r *http.Request, w http.ResponseWriter) bool {
	if token.Id == 0 {
		return true
	}
	fmt.Println(r.FormValue("resetToken"))
	if r.FormValue("resetToken") == "logout" {
		//if err := locstor.Clear(); err != nil {
		// Handle err
		//}
		return true
	}
	return false
}

func getAllUsersLoginInfo(db *sql.DB) []GetUser {
	rows, err := db.Query(`SELECT users.email, users.password FROM users`)

	if err != nil {
		panic(err.Error())
	}
	defer rows.Close()

	var users []GetUser
	for rows.Next() {
		var u GetUser

		err := rows.Scan(&u.Email, &u.Password)
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

func login(name string, password string, db *sql.DB) bool {
	users := getAllUsersLoginInfo(db)
	for i := 0; i != len(users); i++ {
		if users[i].Email == name {
			fmt.Println(users[i])
			if bcrypt.CompareHashAndPassword([]byte(users[i].Password), []byte(password)) == nil {
				fmt.Println("true")
				return true
			}
		}
	}
	return false
}

func register(email string, username string, password string, db *sql.DB) bool {
	var cryptedPassword, _ = bcrypt.GenerateFromPassword([]byte(password), 10)
	if !Security(email, 0) || !Security(username, 1) || !Security(password, 2) {
		fmt.Println("false")
		return false
	} else {
		return UsersAdd(db, email, username, string(cryptedPassword)) == nil
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
