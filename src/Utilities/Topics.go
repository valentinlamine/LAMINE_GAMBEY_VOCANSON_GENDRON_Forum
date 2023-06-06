package utilities

import (
	"database/sql"
	"fmt"
	"log"
)

func TopicsAdd(db *sql.DB, name string, description string, private bool, user_id int) {
	_, err := db.Exec(`Insert INTO topic (name,description,private,user_id) VALUES (?,?,?,?)`, name, description, private, user_id)
	if err != nil {
		panic(err.Error())
	}
}

func TopicsGet(db *sql.DB, id int) {
	rows, err := db.Query(`SELECT topic.id,topic.name,topic.description,topic.private,topic.user_id FROM topic WHERE id = ?`, id)

	if err != nil {
		panic(err.Error())
	}
	defer rows.Close()

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
	fmt.Println(topics)
}

func TopicsGetAll(db *sql.DB) []GetTopic {
	rows, err := db.Query(`SELECT topic.id,topic.name,topic.description,topic.private,topic.user_id FROM topic`)

	if err != nil {
		panic(err.Error())
	}
	defer rows.Close()

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
	_, err := db.Exec(`UPDATE topic SET name = ?, description = ?, private = ?, user_id = ? WHERE id = ?`, name, description, private, user_id, id)
	if err != nil {
		panic(err.Error())
	}
}

func TopicsDelete(db *sql.DB, id int) {
	_, err := db.Exec(`DELETE FROM topic WHERE id = ?`, id)
	if err != nil {
		panic(err.Error())
	}
}

func TopicTag(db *sql.DB, id int) {
	rows, err := db.Query(`SELECT tag.name,tag.color FROM topic_tags INNER JOIN tag ON topic_tags.tag_id = tag.id WHERE topic_tags.topic_id = ?`, id)

	if err != nil {
		panic(err.Error())
	}
	defer rows.Close()

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
