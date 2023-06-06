package main

import (
	"fmt"
	utilities "forum/Utilities"
	"html/template"
	"net/http"

	_ "github.com/go-sql-driver/mysql"
)

var db = utilities.OpenDB()
var u []utilities.GetUsersAll = utilities.UsersGetAll(db)

func main() {
	// db := utilities.OpenDB()
	// fmt.Println(utilities.UsersGetAll(db))
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
	details := utilities.GetUsersAll{}
	Test(r, w)
	tmpl1.Execute(w, details)
}

func Test(r *http.Request, w http.ResponseWriter) {
	if r.FormValue("submit") == "login" {
		fmt.Println(logCmp(r.FormValue("loginName"), r.FormValue("loginPassword")))
	}
}

func logCmp(name string, password string) bool {
	for i := 0; i != len(u); i++ {
		if u[i].Username == name {
			if u[i].Password == password {
				return true
			}
		}
	}
	return false
}
