package main

import (
	"fmt"
	utilities "forum/Utilities"
	"log"
	"net/http"

	_ "github.com/go-sql-driver/mysql"
	"github.com/gorilla/mux"
)

func main() {
	//statics files
	r := mux.NewRouter()
	r.PathPrefix("/assets/").Handler(http.StripPrefix("/assets/", http.FileServer(http.Dir("./assets"))))
	r.PathPrefix("/CSS/").Handler(http.StripPrefix("/CSS/", http.FileServer(http.Dir("./CSS"))))
	r.PathPrefix("/JS/").Handler(http.StripPrefix("/JS/", http.FileServer(http.Dir("./JS"))))

	//handle routing
	r.HandleFunc("/", utilities.IndexHandler)
	r.HandleFunc("/topic/{id}", utilities.TopicHandler)
	r.HandleFunc("/termsofservice", utilities.TermsOfServiceHandler)
	r.HandleFunc("/privacypolicy", utilities.PrivacyPolicyHandler)
	r.HandleFunc("/test", utilities.TestHandler)

	r.HandleFunc("/helloworld", func(w http.ResponseWriter, r *http.Request) { fmt.Fprintf(w, "Hello World2") }).Methods("GET")

	r.HandleFunc("/login", utilities.LoginHandler).Methods("POST")
	r.HandleFunc("/register", utilities.RegisterHandler).Methods("POST")
	r.HandleFunc("/topicCreate", utilities.TopicCreateHandler).Methods("POST")
	r.HandleFunc("/topicDelete", utilities.TopicDeleteHandler).Methods("POST")
	r.HandleFunc("/messageCreate", utilities.MessageCreateHandler).Methods("POST")

	r.HandleFunc("/bookmarkAdd", utilities.BookmarkAddHandler).Methods("POST")
	r.HandleFunc("/bookmarkRemove", utilities.BookmarkRemoveHandler).Methods("POST")

	fmt.Println("server is running on port 8080 : http://localhost:8080")
	if err := http.ListenAndServe(":8080", r); err != nil {
		log.Fatal(err)
	}
}
