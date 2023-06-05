package main

import (
	"html/template"
	// "log"
	"fmt"
	"net/http"
)

type User struct {
	Id       int
	Name     string
	Password string
}

var u []User = getUsers()

func main() {
	fmt.Println("server is running on port 8080 : http://localhost:8080")
	fs := http.FileServer(http.Dir("css"))
	http.Handle("/css/", http.StripPrefix("/css/", fs))
	http.HandleFunc("/", Index)
	http.ListenAndServe(":8080", nil)
}

func getUsers() []User {
	var ret []User
	var user1 = User{0, "test1", "root"}
	var user2 = User{1, "test2", "root"}
	var user3 = User{2, "test3", "root"}
	var user4 = User{3, "test4", "root"}
	var user5 = User{4, "test5", "root"}
	ret = append(ret, user1, user2, user3, user4, user5)
	return ret
}

func Index(w http.ResponseWriter, r *http.Request) {
	tmpl1 := template.Must(template.ParseFiles("index.html"))

	if r.Method != http.MethodPost {
		tmpl1.Execute(w, nil)
		return
	}
	details := User{}
	tmpl1.Execute(w, details)
	Test(r, w)
}

func Test(r *http.Request, w http.ResponseWriter) {
	var name = r.FormValue("nameLogin")
	var password = r.FormValue("passwordLogin")
	if name == "" {
		fmt.Println("Login: " + name + ", " + password)
	} else {
		fmt.Println("register: " + r.FormValue("name") + ", " + r.FormValue("password"))
	}
	//fmt.Println(logCmp(name, password))
}

func logCmp(name string, password string) bool {
	for i := 0; i != len(u); i++ {
		if u[i].Name == name {
			if u[i].Password == password {
				return true
			}
		}
	}
	return false
}
