package main

import (
	"fmt"
	utilities "forum/Utilities"
	"html/template"
	"log"
	"net/http"

	_ "github.com/go-sql-driver/mysql"
	"github.com/gorilla/mux"
)

var db = utilities.OpenDB()

func main() {
	// fmt.Println(utilities.MessagesGetAllTopic(db, 1))

	//statics files
	r := mux.NewRouter()
	r.PathPrefix("/assets/").Handler(http.StripPrefix("/assets/", http.FileServer(http.Dir("./assets"))))
	r.PathPrefix("/CSS/").Handler(http.StripPrefix("/CSS/", http.FileServer(http.Dir("./CSS"))))
	r.PathPrefix("/JS/").Handler(http.StripPrefix("/JS/", http.FileServer(http.Dir("./JS"))))

	//handle routing
	r.HandleFunc("/", IndexHandler)
	//r.HandleFunc("/topic/{id}", utilities.TopicHandler)
	r.HandleFunc("/termsofservice", TermsOfServiceHandler)
	r.HandleFunc("/privacypolicy", PrivacyPolicyHandler)

	fmt.Println("server is running on port 8080 : http://localhost:8080")
	if err := http.ListenAndServe(":8080", r); err != nil {
		log.Fatal(err)
	}
}

func GetData() []utilities.TopicSortedDrop {
	var data []utilities.TopicSortedDrop
	var resultAlgoPopular = utilities.GetTopicsSorted(db)
	// fmt.Println(utilities.GetTopicsSorted(db))
	for i := 0; i != len(resultAlgoPopular); i++ {
		//fmt.Println(resultAlgoPopular[i].Topic_id)
		data = append(data, utilities.GetTopicById(db, resultAlgoPopular[i].Topic_id))
	}
	return data
}

func generateTemplate(templateName string, filepaths []string) *template.Template {
	tmpl, err := template.New(templateName).ParseFiles(filepaths...)
	// Error check:
	if err != nil {
		panic(err)
	}
	return tmpl
}

func IndexHandler(w http.ResponseWriter, r *http.Request) {
	var data utilities.Data
	data.Data = GetData()
	// *Generates and executes templates:
	tmpl := generateTemplate("index.html", []string{"index.html", "template/header.html", "template/headerConnect.html", "template/leftnavbar.html", "template/topic.html"})
	//tmpl.ExecuteTemplate(w, "login", data)
	data = utilities.Data{
		Data:     GetData(),
		Token:    utilities.GetLoginRegister(r, w, db),
		IsLogged: utilities.GetLogoutInfo(r, w),
	}

	err := tmpl.Execute(w, data)
	if err != nil {
		fmt.Println("err : ", err)
	}
}

func TermsOfServiceHandler(w http.ResponseWriter, r *http.Request) {
	var data utilities.Data
	data.Data = GetData()
	// *Generates and executes templates:
	tmpl := generateTemplate("termsofservice.html", []string{"termsofservice.html", "template/header.html", "template/headerConnect.html", "template/leftnavbar.html"})
	//tmpl.ExecuteTemplate(w, "login", data)
	data = utilities.Data{
		Data:     GetData(),
		Token:    utilities.GetLoginRegister(r, w, db),
		IsLogged: utilities.GetLogoutInfo(r, w),
	}

	err := tmpl.Execute(w, data)
	if err != nil {
		fmt.Println("err : ", err)
	}
}

func PrivacyPolicyHandler(w http.ResponseWriter, r *http.Request) {
	var data utilities.Data
	data.Data = GetData()
	// *Generates and executes templates:
	tmpl := generateTemplate("privacypolicy.html", []string{"privacypolicy.html", "template/header.html", "template/headerConnect.html", "template/leftnavbar.html"})
	//tmpl.ExecuteTemplate(w, "login", data)
	data = utilities.Data{
		Data:     GetData(),
		Token:    utilities.GetLoginRegister(r, w, db),
		IsLogged: utilities.GetLogoutInfo(r, w),
	}

	err := tmpl.Execute(w, data)
	if err != nil {
		fmt.Println("err : ", err)
	}
}
