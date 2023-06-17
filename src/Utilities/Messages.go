package utilities

import (
	"database/sql"
	"fmt"
)

func MessagesAdd(db *sql.DB, content string, user_id int, topic_id int) (bool, string, int) {
	if content == "" {
		return false, "Content is empty", 0
	}
	if user_id == 0 {
		return false, "User id is empty", 0
	}
	if CheckPermission(db, user_id, 8) {
		_, err := db.Exec(`Insert INTO messages (content,user_id,topic_id) VALUES (?,?,?)`, content, user_id, topic_id)
		if err != nil {
			return false, err.Error(), 0
		}
	}
	var AnneMsgID int
	AnneTracker, err2 := db.Query(`SELECT id FROM messages WHERE messages.user_id = 3 AND messages.topic_id = ?`, topic_id)
	if err2 != nil {
		panic(err2.Error())
	}
	defer func(AnneTracker *sql.Rows) {
		err := AnneTracker.Close()
		if err != nil {
			panic(err.Error())
		}
	}(AnneTracker)
	for AnneTracker.Next() {
		err := AnneTracker.Scan(&AnneMsgID)
		if err != nil {
			panic(err.Error())
		}
	}
	if err := AnneTracker.Err(); err != nil {
		panic(err.Error())
	}
	if AnneMsgID != 0 {
		fmt.Println("Anne is deleting her message", AnneMsgID)
		MessagesDelete(db, AnneMsgID, 3)
	}

	var result int
	rows, err := db.Query(`SELECT id FROM messages WHERE messages.content = ? ORDER BY messages.creation_date DESC`, content)
	if err != nil {
		panic(err.Error())
	}
	defer func(rows *sql.Rows) {
		err := rows.Close()
		if err != nil {
			panic(err.Error())
		}
	}(rows)
	var message_id int
	for rows.Next() {
		err := rows.Scan(&result)
		if err != nil {
			panic(err.Error())
		}
		message_id = result

	}
	if err := rows.Err(); err != nil {
		panic(err.Error())
	}
	messageUpvoteDownvote(db, message_id)
	return true, "message successfully send", message_id
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
}

func MessagesGetAllTopic(db *sql.DB, id int) []GetMessage {
	rows, err := db.Query(`SELECT DISTINCT messages.id, messages.content,messages.creation_date, messages.user_id,messages.topic_id,users.username, (
		SELECT COUNT(*) AS NbUpvote
		FROM users_messages_interactions
		WHERE users_messages_interactions.message_id = messages.id AND users_messages_interactions.status = "upvote") AS NbUpvote
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

		err := rows.Scan(&m.Id, &m.Content, &m.Created_at, &m.User_id, &m.Topic_id, &m.Username, &m.NbUpvote)
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
		_, err := db.Exec(`DELETE FROM users_messages_interactions WHERE message_id = ?`, id)
		if err != nil {
			panic(err.Error())
		}
		_, err = db.Exec(`DELETE FROM messages WHERE id = ?`, id)
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
	var rows *sql.Rows
	var err error
	if id != 0 {
		rows, err = db.Query(`SELECT * FROM users_messages_interactions WHERE users_messages_interactions.user_id = ?`, id)
	} else {
		rows, err = db.Query(`SELECT * FROM users_messages_interactions`)
	}
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

func messageUpvoteDownvote(db *sql.DB, message_id int) {
	//add one upvote and one downvote to the message
	_, err := db.Exec(`INSERT INTO users_messages_interactions (user_id, message_id, status) VALUES (3, ?, "upvote"), (3, ?, "downvote")`, message_id, message_id)
	if err != nil {
		panic(err.Error())
	}
}
