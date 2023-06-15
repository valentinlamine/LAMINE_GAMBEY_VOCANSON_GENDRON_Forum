package main

import (
	"encoding/json"
	"fmt"
	utilities "forum/Utilities"
	"html/template"
	"log"
	"net/http"
	"strconv"

	_ "github.com/go-sql-driver/mysql"
	"github.com/gorilla/mux"
)

var db = utilities.OpenDB()
var data utilities.Data

func main() {
	//statics files
	r := mux.NewRouter()
	r.PathPrefix("/assets/").Handler(http.StripPrefix("/assets/", http.FileServer(http.Dir("./assets"))))
	r.PathPrefix("/CSS/").Handler(http.StripPrefix("/CSS/", http.FileServer(http.Dir("./CSS"))))
	r.PathPrefix("/JS/").Handler(http.StripPrefix("/JS/", http.FileServer(http.Dir("./JS"))))

	//handle routing
	r.HandleFunc("/", IndexHandler)
	r.HandleFunc("/topic/{id}", TopicHandler)
	r.HandleFunc("/termsofservice", TermsOfServiceHandler)
	r.HandleFunc("/privacypolicy", PrivacyPolicyHandler)
	r.HandleFunc("/test", TestHandler)

	r.HandleFunc("/helloworld", func(w http.ResponseWriter, r *http.Request) {
		fmt.Fprintf(w, "Hello World2")
	}).Methods("GET")

	r.HandleFunc("/login", LoginHandler).Methods("POST")
	r.HandleFunc("/register", RegisterHandler).Methods("POST")

	fmt.Println("server is running on port 8080 : http://localhost:8080")
	if err := http.ListenAndServe(":8080", r); err != nil {
		log.Fatal(err)
	}
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
	fmt.Println("IndexHandler")
	if r.Method == "POST" {
		token := r.FormValue("token")
		if token != "" {
			var user utilities.GetUser
			Token, _ := strconv.Atoi(token)
			user = utilities.GetUserById(db, Token)
			if user.Id != 0 { //if user is connected
				tmpl := generateTemplate("indexConnect.html", []string{"template/base/connected/indexConnect.html", "template/componants/headerConnect.html", "template/componants/leftnavbar.html", "template/componants/topic.html"})

				data = utilities.Data{
					Data: data.GetData(db),
					User: user.Username,
				}
				tmpl.Execute(w, data)
				return
			}
		}
	}
	tmpl := generateTemplate("index.html", []string{"template/base/disconnected/index.html", "template/componants/header.html", "template/componants/leftnavbar.html", "template/componants/topic.html"})
	data = utilities.Data{
		Data: data.GetData(db),
	}
	tmpl.Execute(w, data)
}

func TopicHandler(w http.ResponseWriter, r *http.Request) {
	fmt.Println("TopicHandler")
	if r.Method == "POST" {
		token := r.FormValue("token")
		if token != "" {
			var user utilities.GetUser
			Token, _ := strconv.Atoi(token)
			user = utilities.GetUserById(db, Token)
			if user.Id != 0 { //if user is connected
				tmpl := generateTemplate("topicConnect.html", []string{"topicConnect.html", "template/headerConnect.html", "template/leftnavbar.html", "template/topic.html"})
				//get data from form
				tmpl.Execute(w, data)
				return
			}
		}
	}
	tmpl := generateTemplate("topic.html", []string{"topic.html", "template/header.html", "template/leftnavbar.html", "template/topic.html"})
	//get data from form
	tmpl.Execute(w, data)
}

func TermsOfServiceHandler(w http.ResponseWriter, r *http.Request) {
	fmt.Println("TermsOfServiceHandler")
	if r.Method == "POST" {
		token := r.FormValue("token")
		if token != "" {
			var user utilities.GetUser
			Token, _ := strconv.Atoi(token)
			user = utilities.GetUserById(db, Token)
			if user.Id != 0 { //if user is connected
				tmpl := generateTemplate("termsofserviceConnect.html", []string{"template/base/connected/termsofserviceConnect.html", "template/componants/headerConnect.html", "template/componants/leftnavbar.html"})
				data = utilities.Data{
					Data: data.GetData(db),
					User: user.Username,
				}
				tmpl.Execute(w, data)
				return
			}
		}
	}
	tmpl := generateTemplate("termsofservice.html", []string{"template/base/disconnected/termsofservice.html", "template/componants/header.html", "template/componants/leftnavbar.html"})
	data = utilities.Data{
		Data: data.GetData(db),
	}
	tmpl.Execute(w, data)
}

func PrivacyPolicyHandler(w http.ResponseWriter, r *http.Request) {
	fmt.Println("PrivacyPolicyHandler")
	if r.Method == "POST" {
		token := r.FormValue("token")
		if token != "" {
			var user utilities.GetUser
			Token, _ := strconv.Atoi(token)
			user = utilities.GetUserById(db, Token)
			if user.Id != 0 { //if user is connected
				tmpl := generateTemplate("privacypolicyConnect.html", []string{"template/base/connected/privacypolicyConnect.html", "template/componants/headerConnect.html", "template/componants/leftnavbar.html"})
				data = utilities.Data{
					Data: data.GetData(db),
					User: user.Username,
				}
				tmpl.Execute(w, data)
				return
			}
		}
	}
	tmpl := generateTemplate("privacypolicy.html", []string{"template/base/disconnected/privacypolicy.html", "template/componants/header.html", "template/componants/leftnavbar.html"})
	data = utilities.Data{
		Data: data.GetData(db),
	}
	tmpl.Execute(w, data)
}

func TestHandler(w http.ResponseWriter, r *http.Request) {
	fmt.Println("TestHandler")
	if r.Method == "POST" {
		token := r.FormValue("token")
		if token != "" {
			var user utilities.GetUser
			Token, _ := strconv.Atoi(token)
			user = utilities.GetUserById(db, Token)
			if user.Id != 0 { //if user is connected
				tmpl := generateTemplate("testConnect.html", []string{"template/base/connected/testConnect.html", "template/componants/headerConnect.html", "template/componants/leftnavbar.html"})
				data = utilities.Data{
					Data: data.GetData(db),
					User: user.Username,
				}
				tmpl.Execute(w, data)
				return
			}
		}
	}
	tmpl := generateTemplate("test.html", []string{"template/base/disconnected/test.html", "template/componants/header.html", "template/componants/leftnavbar.html"})
	data = utilities.Data{
		Data: data.GetData(db),
	}
	tmpl.Execute(w, data)
}

func LoginHandler(w http.ResponseWriter, r *http.Request) {
	if r.Method != "POST" { //si la méthode n'est pas POST
		http.Error(w, "Method not allowed", http.StatusMethodNotAllowed)
		return
	}

	// Parse the request body
	var data struct {
		Email    string `json:"email"`
		Password string `json:"password"`
	}
	if err := json.NewDecoder(r.Body).Decode(&data); err != nil {
		http.Error(w, err.Error(), http.StatusBadRequest)
		return
	}

	success, id := utilities.Login(data.Email, data.Password, db)
	if success {
		response := struct {
			Info string `json:"info"`
			ID   int    `json:"id"`
		}{
			Info: "Login successful",
			ID:   id,
		}
		jsonResponse, err := json.Marshal(response)
		if err != nil {
			http.Error(w, err.Error(), http.StatusInternalServerError)
			return
		}
		w.Header().Set("Content-Type", "application/json")
		w.Write(jsonResponse)
	} else {
		response := struct {
			Info string `json:"info"`
			ID   int    `json:"id"`
		}{
			Info: "Email or password incorrect",
			ID:   0,
		}
		jsonResponse, err := json.Marshal(response)
		if err != nil {
			http.Error(w, err.Error(), http.StatusInternalServerError)
			return
		}
		w.Header().Set("Content-Type", "application/json")
		w.Write(jsonResponse)
	}
}

func RegisterHandler(w http.ResponseWriter, r *http.Request) {
	if r.Method != "POST" { //si la méthode n'est pas POST
		http.Error(w, "Method not allowed", http.StatusMethodNotAllowed)
		return
	}

	// Parse the request body
	var data struct {
		Email    string `json:"email"`
		Username string `json:"username"`
		Password string `json:"password"`
	}
	if err := json.NewDecoder(r.Body).Decode(&data); err != nil {
		http.Error(w, err.Error(), http.StatusBadRequest)
		return
	}

	success, id := utilities.Register(data.Email, data.Username, data.Password, db)
	if success {
		response := struct {
			Info string `json:"info"`
			ID   int    `json:"id"`
		}{
			Info: "Register successful",
			ID:   id,
		}
		jsonResponse, err := json.Marshal(response)
		if err != nil {
			http.Error(w, err.Error(), http.StatusInternalServerError)
			return
		}
		w.Header().Set("Content-Type", "application/json")
		w.Write(jsonResponse)
	} else {
		response := struct {
			Info string `json:"info"`
			ID   int    `json:"id"`
		}{
			Info: "Email or username already used",
			ID:   0,
		}
		jsonResponse, err := json.Marshal(response)
		if err != nil {
			http.Error(w, err.Error(), http.StatusInternalServerError)
			return
		}
		w.Header().Set("Content-Type", "application/json")
		w.Write(jsonResponse)
	}
}
