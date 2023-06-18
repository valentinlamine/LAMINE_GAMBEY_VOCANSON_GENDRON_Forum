package utilities

import (
	"database/sql"
	"fmt"
	"log"
)

func UsersAdd(db *sql.DB, email string, username string, password string) error {

	_, err := db.Exec(`Insert INTO users (email,username,password) VALUES (?,?,?)`, email, username, password)
	if err == nil {
		User := UsersGetByEmail(db, email)
		UserAddRole(db, User.Id, 3)
	}
	return err
}

func UsersGet(db *sql.DB, id int) {
	rows, err := db.Query(`SELECT users.id,users.username,users.email,users.password,users.register_date,users.birth_date FROM users WHERE users.id = ?`, id)

	if err != nil {
		panic(err.Error())
	}
	defer rows.Close()

	var users []GetUser
	for rows.Next() {
		var u GetUser

		err := rows.Scan(&u.Id, &u.Username, &u.Email, &u.Password, &u.Register_date, &u.Birth_date)
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

func UsersGetByEmail(db *sql.DB, email string) GetUser {
	rows, err := db.Query(`SELECT users.id,users.username FROM users WHERE users.email = ?`, email)

	if err != nil {
		panic(err.Error())
	}
	defer rows.Close()

	var users GetUser
	for rows.Next() {
		var u GetUser

		err := rows.Scan(&u.Id, &u.Username)
		if err != nil {
			log.Fatal(err)
		}
		users = u

	}
	if err := rows.Err(); err != nil {
		log.Fatal(err)
	}
	return users
}

func GetUserById(db *sql.DB, id int) GetUser {
	rows, err := db.Query(`SELECT users.id,users.username FROM users WHERE users.id = ?`, id)

	if err != nil {
		panic(err.Error())
	}
	defer rows.Close()

	var users GetUser
	for rows.Next() {
		var u GetUser

		err := rows.Scan(&u.Id, &u.Username)
		if err != nil {
			log.Fatal(err)
		}
		users = u

	}
	if err := rows.Err(); err != nil {
		log.Fatal(err)
	}

	return users
}

func UsersGetAll(db *sql.DB) []GetUser {
	rows, err := db.Query(`SELECT users.id,users.username,users.email,users.password,users.register_date FROM users`)

	if err != nil {
		panic(err.Error())
	}
	defer rows.Close()

	var users []GetUser
	for rows.Next() {
		var u GetUser

		err := rows.Scan(&u.Id, &u.Username, &u.Email, &u.Password, &u.Register_date)
		if err != nil {
			log.Fatal(err)
		}
		users = append(users, u)

	}
	if err := rows.Err(); err != nil {
		log.Fatal(err)
	}
	return users
}

func UsersUpdateUsername(db *sql.DB, username string, user_id_to_edit int, request_from_user_id int) {
	if CheckPermission(db, user_id_to_edit, 4) { //can edit any username
		_, err := db.Exec(`UPDATE users SET  username = ? WHERE id = ?`, username, user_id_to_edit) //update username
		if err != nil {
			panic(err.Error())
		}
	} else if CheckPermission(db, user_id_to_edit, 1) { //can edit only his username
		if user_id_to_edit == request_from_user_id {
			_, err := db.Exec(`UPDATE users SET  username = ? WHERE id = ?`, username, user_id_to_edit) //update username
			if err != nil {
				panic(err.Error())
			}
		} else {
			fmt.Println("You can't edit this username")
		}
	}
}
func UsersUpdatePicture(db *sql.DB, picture string, user_id_to_edit int, request_from_user_id int) {
	if CheckPermission(db, user_id_to_edit, 5) {
		_, err := db.Exec(`UPDATE users SET profile_picture = ? WHERE id = ?`, picture, user_id_to_edit)
		if err != nil {
			panic(err.Error())
		}
	} else if CheckPermission(db, user_id_to_edit, 2) { //can edit only his picture
		if user_id_to_edit == request_from_user_id {
			_, err := db.Exec(`UPDATE users SET  profile_picture = ? WHERE id = ?`, picture, user_id_to_edit) //update picture
			if err != nil {
				panic(err.Error())
			}
		} else {
			fmt.Println("You can't edit this picture")
		}
	}
}
func UsersUpdateDescription(db *sql.DB, description string, user_id_to_edit int, request_from_user_id int) {
	if CheckPermission(db, user_id_to_edit, 6) {
		_, err := db.Exec(`UPDATE users SET description = ? WHERE id = ?`, description, user_id_to_edit)
		if err != nil {
			panic(err.Error())
		}
	} else if CheckPermission(db, user_id_to_edit, 3) { //can edit only his description
		if user_id_to_edit == request_from_user_id {
			_, err := db.Exec(`UPDATE users SET  description = ? WHERE id = ?`, description, user_id_to_edit) //update description
			if err != nil {
				panic(err.Error())
			}
		} else {
			fmt.Println("You can't edit this description")
		}
	}
}

func UsersDelete(db *sql.DB, user_id int) {
	if CheckPermission(db, user_id, 7) {
		_, err := db.Exec(`DELETE FROM users WHERE id = ?`, user_id)

		if err != nil {
			panic(err.Error())
		}
	}
}

func UserRoles(db *sql.DB, id int) {
	rows, err := db.Query(`SELECT roles.name,roles.color FROM users_roles INNER JOIN roles ON users_roles.role_id = roles.id WHERE users_roles.user_id = ?`, id)

	if err != nil {
		panic(err.Error())
	}
	defer rows.Close()

	var roles []RoleUser
	for rows.Next() {
		var r RoleUser

		err := rows.Scan(&r.Name, &r.Color)
		if err != nil {
			log.Fatal(err)
		}
		roles = append(roles, r)

	}
	if err := rows.Err(); err != nil {
		log.Fatal(err)
	}
	fmt.Println(roles)
}

func UserFollowedTopics(db *sql.DB, id int) {
	rows, err := db.Query(`SELECT topic.name FROM users_followed_topics INNER JOIN topic ON users_followed_topics.topic_id = topic.id WHERE users_followed_topics.user_id = ?`, id)

	if err != nil {
		panic(err.Error())
	}
	defer rows.Close()

	var topics []string
	for rows.Next() {
		var t string

		err := rows.Scan(&t)
		if err != nil {
			log.Fatal(err)
		}
		topics = append(topics, t)

	}
	if err := rows.Err(); err != nil {
		log.Fatal(err)
	}
	fmt.Println(topics)
}

func UserMessagesInteractions(db *sql.DB, id int) {
	rows, err := db.Query(`SELECT messages.id,messages.content,messages.creation_date,messages.user_id,messages.topic_id,users_messages_interactions.status FROM users_messages_interactions INNER JOIN messages ON users_messages_interactions.message_id = messages.id WHERE users_messages_interactions.user_id = ?`, id)

	if err != nil {
		panic(err.Error())
	}
	defer rows.Close()

	var messages []MessageUser
	for rows.Next() {
		var m MessageUser

		err := rows.Scan(&m.Id, &m.Content, &m.Creation_date, &m.User_id, &m.Topic_id, &m.Status)
		if err != nil {
			log.Fatal(err)
		}
		messages = append(messages, m)

	}
	if err := rows.Err(); err != nil {
		log.Fatal(err)
	}
	fmt.Println(messages)
}

func IsAdmin(db *sql.DB, id int) bool {
	rows, err := db.Query(`SELECT roles.id FROM users_roles INNER JOIN roles ON users_roles.role_id = roles.id WHERE users_roles.user_id = ?`, id)
	if err != nil {
		panic(err.Error())
	}
	defer rows.Close()

	var roles []string
	for rows.Next() {
		var r string

		err := rows.Scan(&r)
		if err != nil {
			log.Fatal(err)
		}
		roles = append(roles, r)

	}
	if err := rows.Err(); err != nil {
		log.Fatal(err)
	}
	for _, role := range roles {
		if role == "admin" {
			return true
		}
	}
	return false
}
