package main

import (
	"fmt"
	utilities "forum/Utilities"
	"html/template"
	"net/http"
	"regexp"

	_ "github.com/go-sql-driver/mysql"
)

var db = utilities.OpenDB()
var u []utilities.GetUsersAll = utilities.UsersGetAll(db)

func main() {
	db := utilities.OpenDB()
	utilities.GetTopicsSorted(db)
	fmt.Println("server is running on port 8080 : http://localhost:8080")
	fs := http.FileServer(http.Dir("css"))
	http.Handle("/css/", http.StripPrefix("/css/", fs))
	http.HandleFunc("/", Index)
	http.ListenAndServe(":8080", nil)
}

func Index(w http.ResponseWriter, r *http.Request) {
	tmpl1 := template.Must(template.ParseFiles("index.html"))

	if r.Method != http.MethodPost {
		tmpl1.Execute(w, nil)
		return
	}
	details := utilities.Ratio{}
	Test(r, w)
	tmpl1.Execute(w, details)
}

func Test(r *http.Request, w http.ResponseWriter) {
	if r.FormValue("submit") == "login" {
		fmt.Println(login(r.FormValue("loginName"), r.FormValue("loginPassword")))
	} else if r.FormValue("submit") == "register" {
		fmt.Println(register(r.FormValue("email"), r.FormValue("username"), r.FormValue("password")))
	}
}

func login(name string, password string) bool {
	for i := 0; i != len(u); i++ {
		if u[i].Email == name {
			if u[i].Password == password {
				return true
			}
		}
	}
	return false
}

func register(email string, username string, password string) bool {
	if !Security(email, 0) || !Security(username, 1) || !Security(password, 2) {
		return false
	} else {

		if utilities.UsersAdd(db, email, username, password) == nil {
			return true
		}
		return false
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
