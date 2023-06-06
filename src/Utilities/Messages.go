package utilities

import (
	"database/sql"
	"fmt"
)

func MessagesAdd(db *sql.DB, content string, user_id int, topic_id int) {
	_, err := db.Exec(`Insert INTO messages (content,user_id,topic_id) VALUES (?,?,?)`, content, user_id, topic_id)
	if err != nil {
		panic(err.Error())
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
	rows, err := db.Query(`SELECT messages.id,messages.content,messages.user_id,messages.topic_id FROM messages WHERE topic_id = ?`, id)

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
	return messages
}

func MessagesUpdate(db *sql.DB, id int, content string, user_id int, topic_id int) {
	_, err := db.Exec(`UPDATE messages SET content = ?, user_id = ?, topic_id = ? WHERE id = ?`, content, user_id, topic_id, id)
	if err != nil {
		panic(err.Error())
	}
}

func MessagesDelete(db *sql.DB, id int) {
	_, err := db.Exec(`DELETE FROM messages WHERE id = ?`, id)
	if err != nil {
		panic(err.Error())
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
