package utilities

import (
	"database/sql"
	"fmt"
	"log"
	"strings"
)

func TopicsAdd(db *sql.DB, name string, description string, private bool, user_id int) (bool, string, int) {
	if name == "" {
		return false, "Name is empty", 0
	}
	if user_id == 0 {
		return false, "User id is empty", 0
	}
	if CheckPermission(db, user_id, 16) {
		_, err := db.Exec(`Insert INTO topic (name,description,private,user_id) VALUES (?,?,?,?)`, name, description, private, user_id)
		if err != nil {
			if strings.Contains(err.Error(), "Duplicate entry") {
				return false, "Topic already exists", 0
			} else {
				return false, err.Error(), 0
			}
		}

		var result int
		rows, err := db.Query(`SELECT id FROM topic WHERE name = ? `, name)
		if err != nil {
			panic(err.Error())
		}
		defer func(rows *sql.Rows) {
			err := rows.Close()
			if err != nil {
				panic(err.Error())
			}
		}(rows)
		var topic_id int
		for rows.Next() {
			err := rows.Scan(&result)
			if err != nil {
				panic(err.Error())
			}
			topic_id = result

		}
		if err := rows.Err(); err != nil {
			panic(err.Error())
		}
		msg := "Bienvenue dans le topic " + name + " !"
		_, err2 := db.Exec(`INSERT INTO messages (content,topic_id,user_id) VALUES (?,?,?)`, msg, topic_id, user_id)
		if err2 != nil {
			panic(err2.Error())
		}

		rows2, err2 := db.Query(`SELECT id FROM messages WHERE topic_id = ? `, topic_id)
		if err2 != nil {
			panic(err2.Error())
		}
		defer func(rows2 *sql.Rows) {
			err := rows2.Close()
			if err != nil {
				panic(err.Error())
			}
		}(rows2)
		var message_id int
		for rows2.Next() {
			err := rows2.Scan(&result)
			if err != nil {
				panic(err.Error())
			}
			message_id = result
		}
		_, err3 := db.Exec(`INSERT INTO users_messages_interactions (user_id,message_id,status) VALUES (3,?,"upvote")`, message_id)
		if err3 != nil {
			panic(err3.Error())
		}
		_, err4 := db.Exec(`INSERT INTO users_messages_interactions (user_id,message_id,status) VALUES (3,?,"downvote")`, message_id)
		if err4 != nil {
			panic(err4.Error())
		}
		_, err5 := db.Exec(`INSERT INTO users_followed_topics (user_id,topic_id) VALUES (?,?)`, user_id, topic_id)
		if err5 != nil {
			panic(err5.Error())
		}

		return true, "Topic added", topic_id
	} else {
		return false, "You don't have the permission", 0
	}
}

func TopicsGet(db *sql.DB, id int) GetTopic {
	rows, err := db.Query(`SELECT topic.name, topic.description, topic.private, topic.creation_date, topic.nb_views FROM topic WHERE topic.id = ?`, id)

	if err != nil {
		panic(err.Error())
	}
	defer func(rows *sql.Rows) {
		err := rows.Close()
		if err != nil {

		}
	}(rows)

	var topics []GetTopic
	for rows.Next() {
		var t GetTopic

		err := rows.Scan(&t.Name, &t.Description, &t.Private, &t.Creation_date, &t.Nb_views)
		if err != nil {
			panic(err.Error())
		}
		topics = append(topics, t)

	}
	if err := rows.Err(); err != nil {
		panic(err.Error())
	}
	return topics[0]
}

func TopicsGetAll(db *sql.DB) []GetTopic {
	rows, err := db.Query(`SELECT topic.id,topic.name,topic.description,topic.private,topic.user_id FROM topic`)

	if err != nil {
		panic(err.Error())
	}
	defer func(rows *sql.Rows) {
		err := rows.Close()
		if err != nil {

		}
	}(rows)

	var topics []GetTopic
	for rows.Next() {
		var t GetTopic

		err := rows.Scan(&t.Id, &t.Name, &t.Description, &t.Private, &t.User_id)
		if err != nil {
			panic(err.Error())
		}
		topics = append(topics, t)

	}
	if err := rows.Err(); err != nil {
		panic(err.Error())
	}
	return topics
}

func TopicsUpdate(db *sql.DB, id int, name string, description string, private bool, user_id int) {
	if CheckPermission(db, user_id, 21) {
		_, err := db.Exec(`UPDATE topic SET name = ?, description = ?, private = ?, user_id = ? WHERE id = ? AND user_id=?`, name, description, private, user_id, id, user_id)
		if err != nil {
			panic(err.Error())
		}
	} else if CheckPermission(db, user_id, 18) {
		_, err := db.Exec(`UPDATE topic SET name = ?, description = ?, private = ?, user_id = ? WHERE id = ?`, name, description, private, user_id, id)
		if err != nil {
			panic(err.Error())
		}
	}
}

func TopicsDelete(db *sql.DB, topicId int, userId int) {
	if CheckPermission(db, userId, 20) { //can delete any topic
		_, err := db.Exec(`DELETE FROM topic WHERE id = ?`, topicId) //delete topic
		if err != nil {
			panic(err.Error())
		}
	} else if CheckPermission(db, userId, 17) { //can delete own topic
		_, err := db.Exec(`DELETE FROM topic WHERE id = ? AND user_id = ?`, topicId, userId) //delete topic
		if err != nil {
			panic(err.Error())
		}
	}
}

func TopicTag(db *sql.DB, id int) {
	rows, err := db.Query(`SELECT tag.name,tag.color FROM topic_tags INNER JOIN tag ON topic_tags.tag_id = tag.id WHERE topic_tags.topic_id = ?`, id)

	if err != nil {
		panic(err.Error())
	}
	defer func(rows *sql.Rows) {
		err := rows.Close()
		if err != nil {

		}
	}(rows)

	var roles []TagTopic
	for rows.Next() {
		var r TagTopic

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
