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
var indexData IndexData

func generateTemplate(templateName string, filepaths []string) *template.Template {
	tmpl, err := template.New(templateName).ParseFiles(filepaths...)
	// Error check:
	if err != nil {
		panic(err)
	}
	return tmpl
}

func IndexHandler(w http.ResponseWriter, r *http.Request) {
	if r.Method == "POST" {
		token := r.FormValue("token")
		if token != "" {
			var user GetUser
			Token, _ := strconv.Atoi(token)
			user = GetUserById(db, Token)
			if user.Id != 0 { //if user is connected
				tmpl := generateTemplate("indexConnect.html", []string{"template/base/connected/indexConnect.html", "template/componants/headerConnect.html", "template/componants/leftnavbarconnect.html", "template/componants/topic.html", "template/componants/creationTopic.html"})
				indexData = IndexData{
					SortedTopics: indexData.GetData(db),
					User:         user,
					Tags:         TagsGetAll(db),
				}
				tmpl.Execute(w, indexData)
				return
			}
		}
	}
	tmpl := generateTemplate("index.html", []string{"template/base/disconnected/index.html", "template/componants/header.html", "template/componants/leftnavbar.html", "template/componants/topic.html"})
	indexData = IndexData{
		SortedTopics: indexData.GetData(db),
		Tags:         TagsGetAll(db),
	}
	tmpl.Execute(w, indexData)
}

func TopicHandler(w http.ResponseWriter, r *http.Request) {
	fmt.Println("TopicHandler")
	if r.Method == "POST" {
		token := r.FormValue("token")
		if token != "" {
			var user GetUser
			Token, _ := strconv.Atoi(token)
			user = GetUserById(db, Token)
			if user.Id != 0 {
				tmpl := generateTemplate("topicdetailsConnect.html", []string{"template/base/connected/topicdetailsConnect.html", "template/componants/headerConnect.html", "template/componants/leftnavbarconnect.html", "template/componants/message.html", "template/componants/creationMessage.html"})
				vars := mux.Vars(r)
				tmp := vars["id"]
				topicId, _ := strconv.Atoi(tmp)
				TopicHandlerData := DataTopic{
					Id:                   topicId,
					User:                 user,
					Topic:                TopicsGet(db, topicId),
					TopicMessages:        MessagesGetAllTopic(db, topicId),
					MessagesInteractions: GetUsersMessagesInteractions(db, user.Id),
					Tags:                 TagsGetAll(db),
				}
				AddView(db, topicId)
				tmpl.Execute(w, TopicHandlerData)
				return
			}
		}
	}
	tmpl := generateTemplate("topicdetails.html", []string{"template/base/disconnected/topicdetails.html", "template/componants/header.html", "template/componants/leftnavbar.html", "template/componants/message.html", "template/componants/creationMessage.html"})
	vars := mux.Vars(r)
	tmp := vars["id"]
	topicId, _ := strconv.Atoi(tmp)
	TopicHandlerData := DataTopic{
		Id:            topicId,
		Topic:         TopicsGet(db, topicId),
		TopicMessages: MessagesGetAllTopic(db, topicId),
		Tags:          TagsGetAll(db),
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
				tmpl := generateTemplate("termsofserviceConnect.html", []string{"template/base/connected/termsofserviceConnect.html", "template/componants/headerConnect.html", "template/componants/leftnavbarconnect.html"})
				indexData = IndexData{
					SortedTopics: indexData.GetData(db),
					User:         user,
					Tags:         TagsGetAll(db),
				}
				tmpl.Execute(w, indexData)
				return
			}
		}
	}
	tmpl := generateTemplate("termsofservice.html", []string{"template/base/disconnected/termsofservice.html", "template/componants/header.html", "template/componants/leftnavbar.html"})
	indexData = IndexData{
		SortedTopics: indexData.GetData(db),
	}
	tmpl.Execute(w, indexData)
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
				tmpl := generateTemplate("privacypolicyConnect.html", []string{"template/base/connected/privacypolicyConnect.html", "template/componants/headerConnect.html", "template/componants/leftnavbarconnect.html"})
				indexData = IndexData{
					SortedTopics: indexData.GetData(db),
					User:         user,
					Tags:         TagsGetAll(db),
				}
				tmpl.Execute(w, indexData)
				return
			}
		}
	}
	tmpl := generateTemplate("privacypolicy.html", []string{"template/base/disconnected/privacypolicy.html", "template/componants/header.html", "template/componants/leftnavbar.html"})
	indexData = IndexData{
		SortedTopics: indexData.GetData(db),
	}
	tmpl.Execute(w, indexData)
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
				tmpl := generateTemplate("testConnect.html", []string{"template/base/connected/testConnect.html", "template/componants/headerConnect.html", "template/componants/leftnavbarconnect.html", "template/componants/creationTopic.html"})
				indexData = IndexData{
					SortedTopics: indexData.GetData(db),
					User:         user,
				}
				tmpl.Execute(w, indexData)
				return
			}
		}
	}
	tmpl := generateTemplate("test.html", []string{"template/base/disconnected/test.html", "template/componants/header.html", "template/componants/leftnavbar.html", "template/componants/creationTopic.html"})
	indexData = IndexData{
		SortedTopics: indexData.GetData(db),
	}
	tmpl.Execute(w, indexData)
}

// API HANDLERS
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
		Title   string   `json:"Title"`
		Content string   `json:"Content"`
		Private bool     `json:"Private"`
		UserID  int      `json:"UserID"`
		Tags    []string `json:"Tags"`
	}
	if err := json.NewDecoder(r.Body).Decode(&data); err != nil {
		http.Error(w, err.Error(), http.StatusBadRequest)
		return
	}
	success, info, topic_id := TopicsAdd(db, data.Title, data.Content, data.Private, data.UserID)
	if success {
		CreateTag(data.Tags, topic_id, db)
		response := struct {
			Sucess  bool   `json:"success"`
			Info    string `json:"info"`
			TopicId int    `json:"topic_id"`
		}{
			Sucess:  true,
			Info:    info,
			TopicId: topic_id,
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
			Success bool   `json:"success"`
			Info    string `json:"info"`
			TopicId int    `json:"topic_id"`
		}{
			Success: false,
			Info:    info,
			TopicId: topic_id,
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

func TopicDeleteHandler(w http.ResponseWriter, r *http.Request) {
	if r.Method != "POST" { //si la méthode n'est pas POST
		http.Error(w, "Method not allowed", http.StatusMethodNotAllowed)
		return
	}

	// Parse the request body
	var data struct {
		TopicID int `json:"TopicID"`
		UserID  int `json:"UserID"`
	}
	if err := json.NewDecoder(r.Body).Decode(&data); err != nil {
		http.Error(w, err.Error(), http.StatusBadRequest)
		return
	}
	success, info := TopicsDelete(db, data.TopicID, data.UserID)
	if success {
		response := struct {
			Sucess bool   `json:"success"`
			Info   string `json:"info"`
		}{
			Sucess: true,
			Info:   info,
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
			Sucess bool   `json:"success"`
			Info   string `json:"info"`
		}{
			Sucess: false,
			Info:   info,
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

func MessageCreateHandler(w http.ResponseWriter, r *http.Request) {
	if r.Method != "POST" { //si la méthode n'est pas POST
		http.Error(w, "Method not allowed", http.StatusMethodNotAllowed)
		return
	}

	// Parse the request body
	var data struct {
		Content string `json:"Content"`
		UserID  int    `json:"UserID"`
		TopicID int    `json:"TopicID"`
	}
	if err := json.NewDecoder(r.Body).Decode(&data); err != nil {
		http.Error(w, err.Error(), http.StatusBadRequest)
		return
	}
	success, info, message_id := MessagesAdd(db, data.Content, data.UserID, data.TopicID)
	fmt.Println(success, info, message_id)
	if success {
		response := struct {
			Sucess    bool   `json:"success"`
			Info      string `json:"info"`
			MessageId int    `json:"message_id"`
		}{
			Sucess:    true,
			Info:      info,
			MessageId: message_id,
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
			Sucess    bool   `json:"success"`
			Info      string `json:"info"`
			MessageId int    `json:"topic_id"`
		}{
			Sucess:    false,
			Info:      info,
			MessageId: message_id,
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

func MessageDeleteHandler(w http.ResponseWriter, r *http.Request) {
	if r.Method != "POST" { //si la méthode n'est pas POST
		http.Error(w, "Method not allowed", http.StatusMethodNotAllowed)
		return
	}

	// Parse the request body
	var data struct {
		MsgID  int `json:"MsgID"`
		UserID int `json:"UserID"`
	}
	if err := json.NewDecoder(r.Body).Decode(&data); err != nil {
		http.Error(w, err.Error(), http.StatusBadRequest)
		return
	}
	success, info := MessagesDelete(db, data.MsgID, data.UserID)
	if success {
		response := struct {
			Sucess bool   `json:"success"`
			Info   string `json:"info"`
		}{
			Sucess: true,
			Info:   info,
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
			Sucess bool   `json:"success"`
			Info   string `json:"info"`
		}{
			Sucess: false,
			Info:   info,
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

func BookmarkAddHandler(w http.ResponseWriter, r *http.Request) {
	if r.Method != "POST" { //si la méthode n'est pas POST
		http.Error(w, "Method not allowed", http.StatusMethodNotAllowed)
		return
	}

	// Parse the request body
	var data struct {
		UserID  int `json:"UserID"`
		TopicID int `json:"TopicID"`
	}
	if err := json.NewDecoder(r.Body).Decode(&data); err != nil {
		http.Error(w, err.Error(), http.StatusBadRequest)
		return
	}
	success, info := BookmarksAdd(db, data.UserID, data.TopicID)
	if success {
		response := struct {
			Sucess bool   `json:"success"`
			Info   string `json:"info"`
		}{
			Sucess: true,
			Info:   info,
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
			Sucess bool   `json:"success"`
			Info   string `json:"info"`
		}{
			Sucess: false,
			Info:   info,
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

func BookmarkRemoveHandler(w http.ResponseWriter, r *http.Request) {
	if r.Method != "POST" { //si la méthode n'est pas POST
		http.Error(w, "Method not allowed", http.StatusMethodNotAllowed)
		return
	}

	// Parse the request body
	var data struct {
		UserID  int `json:"UserID"`
		TopicID int `json:"TopicID"`
	}
	if err := json.NewDecoder(r.Body).Decode(&data); err != nil {
		http.Error(w, err.Error(), http.StatusBadRequest)
		return
	}
	success, info := BookmarksDelete(db, data.UserID, data.TopicID)
	if success {
		response := struct {
			Sucess bool   `json:"success"`
			Info   string `json:"info"`
		}{
			Sucess: true,
			Info:   info,
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
			Sucess bool   `json:"success"`
			Info   string `json:"info"`
		}{
			Sucess: false,
			Info:   info,
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

func MessageInteractionsHandler(w http.ResponseWriter, r *http.Request) {
	if r.Method != "POST" { //si la méthode n'est pas POST
		http.Error(w, "Method not allowed", http.StatusMethodNotAllowed)
		return
	}

	// Parse the request body
	var data struct {
		Type   string `json:"Type"`
		Status string `json:"Status"`
		UserID int    `json:"UserID"`
		MsgID  int    `json:"MsgID"`
	}
	if err := json.NewDecoder(r.Body).Decode(&data); err != nil {
		http.Error(w, err.Error(), http.StatusBadRequest)
		return
	}
	success, info := MessageInteractions(db, data.Type, data.Status, data.UserID, data.MsgID)
	if success {
		response := struct {
			Sucess bool   `json:"success"`
			Info   string `json:"info"`
		}{
			Sucess: true,
			Info:   info,
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
			Sucess bool   `json:"success"`
			Info   string `json:"info"`
		}{
			Sucess: false,
			Info:   info,
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
