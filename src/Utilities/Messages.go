package utilities

import (
	"database/sql"
	"fmt"
)

func MessagesAdd(db *sql.DB, content string, user_id int, topic_id int) {
	if CheckPermission(db, user_id, 8) {
		_, err := db.Exec(`Insert INTO messages (content,user_id,topic_id) VALUES (?,?,?)`, content, user_id, topic_id)
		if err != nil {
			panic(err.Error())
		}
	}

}

func MessagesGet(db *sql.DB, id int) {
	rows, err := db.Query(`SELECT messages.id,messages.content,messages.user_id,messages.topic_id FROM messages WHERE id = ?`, id)

	if err != nil {
		panic(err.Error())
	}
	defer rows.Close()

	var messages []GetMessage
	for rows.Next() {
		var m GetMessage

		err := rows.Scan(&m.Id, &m.Content, &m.User_id, &m.Topic_id)
		if err != nil {
			panic(err.Error())
		}
		messages = append(messages, m)

	}
	if err := rows.Err(); err != nil {
		panic(err.Error())
	}
	fmt.Println(messages)
}

func MessagesGetAllTopic(db *sql.DB, id int) []GetMessage {
	rows, err := db.Query(`SELECT DISTINCT messages.id, messages.content,messages.creation_date, messages.user_id,messages.topic_id,users.username, (
		SELECT COUNT(*) AS nb_upvote_msg
		FROM users_messages_interactions
		WHERE users_messages_interactions.message_id = messages.id AND users_messages_interactions.status = "upvote") AS nb_upvote_msg
	FROM messages
	INNER JOIN users_messages_interactions ON messages.user_id = users_messages_interactions.user_id
	INNER JOIN users ON messages.user_id = users.id
	WHERE messages.topic_id = ?
	ORDER BY users_messages_interactions.status = "upvote" DESC`, id)

	if err != nil {
		panic(err.Error())
	}
	defer rows.Close()

	var messages []GetMessage
	for rows.Next() {
		var m GetMessage

		err := rows.Scan(&m.Id, &m.Content, &m.Created_at, &m.User_id, &m.Topic_id, &m.Username, &m.Upvote)
		if err != nil {
			panic(err.Error())
		}
		messages = append(messages, m)

	}
	if err := rows.Err(); err != nil {
		panic(err.Error())
	}
	return messages
}

func MessagesUpdate(db *sql.DB, id int, content string, user_id int, topic_id int) {
	if CheckPermission(db, user_id, 9) {
		_, err := db.Exec(`UPDATE messages SET content = ?, user_id = ?, topic_id = ? WHERE id = ?`, content, user_id, topic_id, id)
		if err != nil {
			panic(err.Error())
		}
	}
}

func MessagesDelete(db *sql.DB, id int, user_id int) {
	if CheckPermission(db, user_id, 12) {
		_, err := db.Exec(`DELETE FROM messages WHERE id = ?`, id)
		if err != nil {
			panic(err.Error())
		}
	}
}

func MessageFile(db *sql.DB, id int) {
	rows, err := db.Query(`SELECT files.name,files.file FROM messages_files INNER JOIN files ON messages_files.file_id = files.id WHERE messages_files.message_id = ?`, id)

	if err != nil {
		panic(err.Error())
	}
	defer rows.Close()

	var files []GetFile
	for rows.Next() {
		var f GetFile

		err := rows.Scan(&f.Name, &f.File)
		if err != nil {
			panic(err.Error())
		}
		files = append(files, f)

	}
	if err := rows.Err(); err != nil {
		panic(err.Error())
	}
	fmt.Println(files)
}

func GetUsersMessagesInteractions(db *sql.DB, id int) []UsersMessagesInteractions {
	rows, err := db.Query(`SELECT * FROM users_messages_interactions WHERE users_messages_interactions.user_id = ?`, id)

	if err != nil {
		panic(err.Error())
	}
	defer rows.Close()

	var interaction []UsersMessagesInteractions
	for rows.Next() {
		var i UsersMessagesInteractions

		err := rows.Scan(&i.User_id, &i.Message_id, &i.Status)
		if err != nil {
			panic(err.Error())
		}
		interaction = append(interaction, i)

	}
	if err := rows.Err(); err != nil {
		panic(err.Error())
	}
	return interaction
}
