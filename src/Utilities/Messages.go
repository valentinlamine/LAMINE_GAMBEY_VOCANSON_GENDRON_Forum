package utilities

import (
	"database/sql"
	"fmt"
)

func MessagesAdd(db *sql.DB, content string, user_id int, topic_id int) (bool, string, int) {
	fmt.Println("message add function")
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
	} else {
		return false, "User does not have permission", 0
	}
	var message_id int
	message_id = 0
	rows, err := db.Query(`SELECT id FROM messages WHERE messages.user_id = ? AND messages.topic_id = ? AND messages.content = ? ORDER BY messages.id DESC LIMIT 1`, user_id, topic_id, content)
	if err != nil {
		panic(err.Error())
	}
	defer func(rows *sql.Rows) {
		err := rows.Close()
		if err != nil {
			panic(err.Error())
		}
	}(rows)
	for rows.Next() {
		err := rows.Scan(&message_id)
		if err != nil {
			panic(err.Error())
		}
	}
	if err := rows.Err(); err != nil {
		panic(err.Error())
	}
	fmt.Println("message id", message_id)
	rows2, err2 := db.Query(`SELECT count(*) FROM messages WHERE messages.topic_id = ?`, topic_id)
	if err2 != nil {
		panic(err2.Error())
	}
	defer func(rows2 *sql.Rows) {
		err := rows2.Close()
		if err != nil {
			panic(err.Error())
		}
	}(rows2)
	var count int
	for rows2.Next() {
		err := rows2.Scan(&count)
		if err != nil {
			panic(err.Error())
		}
	}
	if err := rows2.Err(); err != nil {
		panic(err.Error())
	}
	fmt.Println("count", count)
	if count > 1 {
		fmt.Println("count is bigger than 1")
		rows3, err3 := db.Query(`SELECT count(*) FROM messages WHERE messages.user_id = 3 AND messages.topic_id = ?`, topic_id)
		if err3 != nil {
			panic(err3.Error())
		}
		defer func(rows3 *sql.Rows) {
			err := rows3.Close()
			if err != nil {
				panic(err.Error())
			}
		}(rows3)
		for rows3.Next() {
			err := rows3.Scan(&count)
			if err != nil {
				panic(err.Error())
			}
		}
		if err := rows3.Err(); err != nil {
			panic(err.Error())
		}
		if count == 1 {
			DeleteDefaultMessage(db, topic_id)
		}
	}
	messageUpvoteDownvote(db, message_id)
	return true, "message successfully send", message_id
}

func DeleteDefaultMessage(db *sql.DB, topic_id int) {
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
	rows, err := db.Query(`SELECT messages.id, messages.content, messages.creation_date, messages.user_id, messages.topic_id, users.username, (
		SELECT COUNT(*) AS NbUpvote
		FROM users_messages_interactions
		WHERE users_messages_interactions.message_id = messages.id AND users_messages_interactions.status = "upvote"
	) AS NbUpvote
	FROM messages
	INNER JOIN users ON messages.user_id = users.id
	WHERE messages.topic_id = ?
	ORDER BY NbUpvote DESC`, id)

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

func MessagesDelete(db *sql.DB, message_id int, user_id int) (bool, string) {
	if CheckPermission(db, user_id, 12) {
		_, err := db.Exec(`DELETE FROM users_messages_interactions WHERE message_id = ?`, message_id)
		if err != nil {
			fmt.Println(err.Error())
			return false, err.Error()
		}
		_, err = db.Exec(`DELETE FROM messages WHERE id = ?`, message_id)
		if err != nil {
			fmt.Println(err.Error())
			return false, err.Error()
		}
		return true, "message successfully deleted by an admin"
	} else if CheckPermission(db, user_id, 10) {
		if CheckMessageOwner(db, message_id, user_id) {
			_, err := db.Exec(`DELETE FROM users_messages_interactions WHERE message_id = ?`, message_id)
			if err != nil {
				fmt.Println(err.Error())
				return false, err.Error()
			}
			_, err = db.Exec(`DELETE FROM messages WHERE id = ?`, message_id)
			if err != nil {
				fmt.Println(err.Error())
				return false, err.Error()
			}
			return true, "message successfully deleted by the user"
		}
	}
	return false, "you don't have the permission to delete this message"
}

func CheckMessageOwner(db *sql.DB, message_id int, user_id int) bool {
	var msg_user_id int
	err := db.QueryRow(`SELECT user_id FROM messages WHERE id = ?`, message_id).Scan(&msg_user_id)
	if err != nil {
		panic(err.Error())
	}
	if msg_user_id == user_id {
		return true
	}
	return false
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

func GetUsersMessagesInteractions(db *sql.DB, user_id int) []UsersMessagesInteractions {
	var rows *sql.Rows
	var err error
	if user_id != 0 {
		rows, err = db.Query(`SELECT * FROM users_messages_interactions WHERE users_messages_interactions.user_id = ?`, user_id)
	}
	if err != nil {
		panic(err.Error())
	}
	defer rows.Close()

	var interaction []UsersMessagesInteractions
	for rows.Next() {
		var i UsersMessagesInteractions

		err := rows.Scan(&i.UserId, &i.MessageId, &i.Status)
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
	MessageInteractions(db, "add", "upvote", 3, message_id)
	MessageInteractions(db, "add", "downvote", 3, message_id)
}

func MessageInteractions(db *sql.DB, requestType string, status string, userId int, msgId int) (bool, string) {
	if requestType == "add" {
		if status == "upvote" || status == "downvote" || status == "report" {
			_, err := db.Exec(`INSERT INTO users_messages_interactions (user_id, message_id, status) VALUES (?, ?, ?)`, userId, msgId, status)
			if err != nil {
				return false, err.Error()
			}
			return true, "Successfully added"
		}
		return false, "Error, status not found"
	} else if requestType == "remove" {
		if status == "upvote" || status == "downvote" || status == "report" {
			_, err := db.Exec(`DELETE FROM users_messages_interactions WHERE user_id = ? AND message_id = ? AND status = ?`, userId, msgId, status)
			if err != nil {
				return false, err.Error()
			}
			return true, "Successfully removed"
		}
		return false, "Error, status not found"
	}
	return false, "Error, request type not found"
}

func GetReportedMessages(db *sql.DB) []GetMessage {
	rows, err := db.Query(`SELECT messages.id, messages.content, messages.creation_date, messages.user_id, messages.topic_id, users.username, (
		SELECT COUNT(*) AS NbUpvote
		FROM users_messages_interactions
		WHERE users_messages_interactions.message_id = messages.id AND users_messages_interactions.status = "upvote"
	) AS NbUpvote
	FROM messages
	INNER JOIN users ON messages.user_id = users.id
	INNER JOIN users_messages_interactions ON messages.id = users_messages_interactions.message_id
	WHERE users_messages_interactions.status = "report"`)

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
	fmt.Println(messages)
	if err := rows.Err(); err != nil {
		panic(err.Error())
	}
	return messages
}
