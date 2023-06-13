package utilities

import (
	"database/sql"
	"fmt"
	"net/http"
	"regexp"
	"strconv"

	"github.com/go-humble/locstor"
)

var token GetUser

func GetLoginRegister(r *http.Request, w http.ResponseWriter, db *sql.DB, u []GetUsersAll) GetUser {
	var defaultUser GetUser
	if r.FormValue("submit") == "login" {
		if login(r.FormValue("loginName"), r.FormValue("loginPassword"), u) {
			token = UsersGetByEmail(db, r.FormValue("loginName"))
			item := locstor.SetItem("token", strconv.Itoa(token.Id))
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

func login(name string, password string, u []GetUsersAll) bool {
	for i := 0; i != len(u); i++ {
		if u[i].Email == name {
			if u[i].Password == password {
				return true
			}
		}
	}
	return false
}

func register(email string, username string, password string, db *sql.DB) bool {
	if !Security(email, 0) || !Security(username, 1) || !Security(password, 2) {
		fmt.Println("false")
		return false
	} else {
		return UsersAdd(db, email, username, password) == nil
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
