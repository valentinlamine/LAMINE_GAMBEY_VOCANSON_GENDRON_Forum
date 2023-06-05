package main

import (
	"database/sql"
	"fmt"
	"log"

	_ "github.com/go-sql-driver/mysql"
)

type Users struct {
	id            int
	username      string
	password      string
	email         string
	register_date string
	description   string
	birth_date    string
}
type Role struct {
	id    int
	name  string
	color string
}
type Permissions struct {
	id          int
	name        string
	description string
}
type Topic struct {
	id          int
	name        string
	description string
	private     bool
	created_at  string
	nb_views    int
	user_id     int
}
type Tag struct {
	id         int
	name       string
	created_at string
	color      string
}
type Files struct {
	id         int
	name       string
	created_at string
	file       string
}
type Messages struct {
	id         int
	content    string
	created_at string
	updated_at string
	user_id    int
	topic_id   int
}

type Messages_files struct {
	id         int
	message_id int
	file_id    int
}
type Roles_permissions struct {
	role_id       int
	permission_id int
}
type Users_roles struct {
	user_id int
	role_id int
}
type Topics_tags struct {
	topic_id int
	tag_id   int
}
type Users_messages_interactions struct {
	user_id    int
	message_id int
	status     string
}
type Users_followed_topics struct {
	user_id  int
	topic_id int
}

type test struct {
	username string
	topic_id int
	name     string
	role     string
}

func main() {
	// Configure the database connection (always check errors)
	db, err := sql.Open("mysql", "root:@(127.0.0.1:3306)/forum?parseTime=true")
	if err != nil {
		panic(err.Error())
	}
	UsersAdd(db, "valentinlamine@proton.me", "Valou", "1234")

}
func Usertest(db *sql.DB) {
	// Executes the SQL query in our database. Check err to ensure there was no error.
	rows, err := db.Query(`SELECT users.username, users_followed_topics.topic_id, permissions.name, roles.name
    FROM users_followed_topics
    INNER JOIN users ON users_followed_topics.user_id = users.id
    INNER JOIN topic ON users_followed_topics.topic_id = topic.id
    INNER JOIN roles ON users.id = roles.id
    INNER JOIN roles_permissions ON roles.id = roles_permissions.role_id
    INNER JOIN permissions ON roles_permissions.permission_id = permissions.id
    WHERE users.username = 'katsuLeBG'`)
	if err != nil {
		panic(err.Error())
	}
	defer rows.Close()

	var users []test
	for rows.Next() {
		var t test

		err := rows.Scan(&t.username, &t.topic_id, &t.name, &t.role)
		if err != nil {
			log.Fatal(err)
		}
		users = append(users, t)

	}
	if err := rows.Err(); err != nil {
		log.Fatal(err)
	}
	fmt.Println(users)
}

func UsersAdd(db *sql.DB, email string, username string, password string) {
	// fmt.Println(`Insert INTO users (email,username,password) VALUES ( ` + email + `, ` + username + `, ` + password + `);`)
	_, err := db.Exec(`Insert INTO users (email,username,password) VALUES (?,?,?)`, email, username, password)
	if err != nil {
		panic(err.Error())
	}

}
