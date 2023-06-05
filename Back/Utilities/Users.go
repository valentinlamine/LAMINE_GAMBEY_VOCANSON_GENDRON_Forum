package utilities

import (
	"database/sql"
	"fmt"
	"log"
)

func Usertest(db *sql.DB) {
	// Executes the SQL query our database. Check err to ensure there was no error.
	rows, err := db.Query(`SELECT users.username, users_followed_topics.topic_id, permions.name, roles.name
    FROM users_followed_topics
    INNER JOIN users ON users_lowed_topics.user_id = users.id
    INNER JOIN topic ON users_followed_topics.topic_id = topic.i
    INNER JOIN roles ON users.id = roles.id
    INNER JOIN roles_permissions ON roles.i
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

func UsersGet(db *sql.DB, id int) {
	// Executes the SQL query in our database. Check err to ensure there was no error.
	rows, err := db.Query(`SELECT users.id,users.username,users.email,users.password,users.register_date,users.birth_date FROM users WHERE id = ?`, id)

	if err != nil {
		panic(err.Error())
	}
	defer rows.Close()

	var users []GetUser
	for rows.Next() {
		var u GetUser

		err := rows.Scan(&u.username, &u.username, &u.email, &u.password, &u.register_date, &u.birth_date)
		if err != nil {
			log.Fatal(err)
		}
		users = append(users, u)

	}
	if err := rows.Err(); err != nil {
		log.Fatal(err)
	}
	fmt.Println(users)
}

func UsersUpdate(db *sql.DB, id int, email string, username string, password string, description string, birth_date string) {
	// Executes the SQL query in our database. Check err to ensure there was no error.
	if description == "" {
		description = "Not set"
	}
	_, err := db.Exec(`UPDATE users SET email = ?, username = ?, password = ?,description =?,birth_date=? WHERE id = ?`, email, username, password, description, birth_date, id)
	if err != nil {
		panic(err.Error())
	}
}

func UsersDelete(db *sql.DB, id int) {
	// Executes the SQL query in our datae. Check err to ensure there was no error.
	_, err := db.Exec(`DELETE FROM users WHERE id = ?`, id)

	if err != nil {
		panic(err.Error())
	}
}
