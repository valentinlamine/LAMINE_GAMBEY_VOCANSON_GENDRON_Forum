package utilities

import (
	"encoding/json"
	"fmt"
	"html/template"
	"net/http"
	"strconv"

	_ "github.com/go-sql-driver/mysql"
	"github.com/gorilla/mux"
)

var db = OpenDB()
var data Data

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
			var user GetUser
			Token, _ := strconv.Atoi(token)
			user = GetUserById(db, Token)
			if user.Id != 0 { //if user is connected
				tmpl := generateTemplate("indexConnect.html", []string{"template/base/connected/indexConnect.html", "template/componants/headerConnect.html", "template/componants/leftnavbar.html", "template/componants/topic.html"})

				data = Data{
					Data: data.GetData(db),
					User: user.Username,
					Tags: TagsGetAll(db),
				}
				tmpl.Execute(w, data)
				return
			}
		}
	}
	tmpl := generateTemplate("index.html", []string{"template/base/disconnected/index.html", "template/componants/header.html", "template/componants/leftnavbar.html", "template/componants/topic.html"})
	data = Data{
		Data: data.GetData(db),
		Tags: TagsGetAll(db),
	}
	tmpl.Execute(w, data)
}

func TopicHandler(w http.ResponseWriter, r *http.Request) {
	fmt.Println("TopicHandler")
	if r.Method == "POST" {
		token := r.FormValue("token")
		if token != "" {
			var user GetUser
			Token, _ := strconv.Atoi(token)
			user = GetUserById(db, Token)
			if user.Id != 0 { //if user is connected
				tmpl := generateTemplate("topicdetailsConnect.html", []string{"template/base/connected/topicdetailsConnect.html", "template/componants/headerConnect.html", "template/componants/leftnavbar.html", "template/componants/message.html"})
				vars := mux.Vars(r)
				tmp := vars["id"]
				topic_id, _ := strconv.Atoi(tmp)
				TopicHandlerData := DataTopic{
					Id:                   topic_id,
					User:                 user.Username,
					Topic:                TopicsGet(db, topic_id),
					TopicMessages:        MessagesGetAllTopic(db, topic_id),
					MessagesInteractions: GetUsersMessagesInteractions(db, user.Id),
				}

				tmpl.Execute(w, TopicHandlerData)
				return
			}
		}
	}
	tmpl := generateTemplate("topicdetails.html", []string{"template/base/disconnected/topicdetails.html", "template/componants/header.html", "template/componants/leftnavbar.html", "template/componants/message.html"})
	vars := mux.Vars(r)
	tmp := vars["id"]
	topic_id, _ := strconv.Atoi(tmp)
	TopicHandlerData := DataTopic{
		Id:                   topic_id,
		User:                 "",
		Topic:                TopicsGet(db, topic_id),
		TopicMessages:        MessagesGetAllTopic(db, topic_id),
		MessagesInteractions: GetUsersMessagesInteractions(db, 0),
	}
	tmpl.Execute(w, TopicHandlerData)
}

func TermsOfServiceHandler(w http.ResponseWriter, r *http.Request) {
	fmt.Println("TermsOfServiceHandler")
	if r.Method == "POST" {
		token := r.FormValue("token")
		if token != "" {
			var user GetUser
			Token, _ := strconv.Atoi(token)
			user = GetUserById(db, Token)
			if user.Id != 0 { //if user is connected
				tmpl := generateTemplate("termsofserviceConnect.html", []string{"template/base/connected/termsofserviceConnect.html", "template/componants/headerConnect.html", "template/componants/leftnavbar.html"})
				data = Data{
					Data: data.GetData(db),
					User: user.Username,
					Tags: TagsGetAll(db),
				}
				tmpl.Execute(w, data)
				return
			}
		}
	}
	tmpl := generateTemplate("termsofservice.html", []string{"template/base/disconnected/termsofservice.html", "template/componants/header.html", "template/componants/leftnavbar.html"})
	data = Data{
		Data: data.GetData(db),
	}
	tmpl.Execute(w, data)
}

func PrivacyPolicyHandler(w http.ResponseWriter, r *http.Request) {
	fmt.Println("PrivacyPolicyHandler")
	if r.Method == "POST" {
		token := r.FormValue("token")
		if token != "" {
			var user GetUser
			Token, _ := strconv.Atoi(token)
			user = GetUserById(db, Token)
			if user.Id != 0 { //if user is connected
				tmpl := generateTemplate("privacypolicyConnect.html", []string{"template/base/connected/privacypolicyConnect.html", "template/componants/headerConnect.html", "template/componants/leftnavbar.html"})
				data = Data{
					Data: data.GetData(db),
					User: user.Username,
					Tags: TagsGetAll(db),
				}
				tmpl.Execute(w, data)
				return
			}
		}
	}
	tmpl := generateTemplate("privacypolicy.html", []string{"template/base/disconnected/privacypolicy.html", "template/componants/header.html", "template/componants/leftnavbar.html"})
	data = Data{
		Data: data.GetData(db),
	}
	tmpl.Execute(w, data)
}

func TestHandler(w http.ResponseWriter, r *http.Request) {
	fmt.Println("TestHandler")
	if r.Method == "POST" {
		token := r.FormValue("token")
		if token != "" {
			var user GetUser
			Token, _ := strconv.Atoi(token)
			user = GetUserById(db, Token)
			if user.Id != 0 { //if user is connected
				tmpl := generateTemplate("testConnect.html", []string{"template/base/connected/testConnect.html", "template/componants/headerConnect.html", "template/componants/leftnavbar.html", "template/componants/formTopic.html"})
				data = Data{
					Data: data.GetData(db),
					User: user.Username,
				}
				tmpl.Execute(w, data)
				return
			}
		}
	}
	tmpl := generateTemplate("test.html", []string{"template/base/disconnected/test.html", "template/componants/header.html", "template/componants/leftnavbar.html", "template/componants/formTopic.html"})
	data = Data{
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

	success, id := Login(data.Email, data.Password, db)
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

	success, id := Register(data.Email, data.Username, data.Password, db)
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

func TopicCreateHandler(w http.ResponseWriter, r *http.Request) {
	if r.Method != "POST" { //si la méthode n'est pas POST
		http.Error(w, "Method not allowed", http.StatusMethodNotAllowed)
		return
	}

	// Parse the request body
	var data struct {
		Title   string `json:"Title"`
		Content string `json:"Content"`
		Private bool   `json:"Private"`
		UserID  int    `json:"UserID"`
	}
	if err := json.NewDecoder(r.Body).Decode(&data); err != nil {
		http.Error(w, err.Error(), http.StatusBadRequest)
		return
	}
	success, info, id := TopicsAdd(db, data.Title, data.Content, data.Private, data.UserID)
	if success {
		response := struct {
			Sucess  bool   `json:"success"`
			Info    string `json:"info"`
			TopicId int    `json:"topic_id"`
		}{
			Sucess:  true,
			Info:    info,
			TopicId: id,
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
			Sucess  bool   `json:"success"`
			Info    string `json:"info"`
			TopicId int    `json:"topic_id"`
		}{
			Sucess:  false,
			Info:    info,
			TopicId: id,
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
