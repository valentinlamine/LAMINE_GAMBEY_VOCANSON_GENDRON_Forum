package utilities

import (
	"database/sql"
	"fmt"
	"math/rand"
	"time"

	"github.com/lucasb-eyer/go-colorful"
)

func TagsAdd(db *sql.DB, name string, color string) {
	_, err := db.Exec(`Insert INTO tag (name,color) VALUES (?,?)`, name, color)
	if err != nil {
		panic(err.Error())
	}

}

func generateRandomTagColor() string {
	s1 := rand.NewSource(time.Now().UnixNano())
	h := rand.New(s1).Intn(255)
	var s = 22
	var l = 35
	newColor := colorful.Hsl(float64(h), float64(s)/100, float64(l)/100)
	hexColor := fmt.Sprintf("#%02x%02x%02x", int(newColor.R*255), int(newColor.G*255), int(newColor.B*255))
	return hexColor
}

func CreateTag(taglist []string, id_topic int, db *sql.DB) bool {
	var tags []GetTag = TagsGetAll(db)
	var exist bool
	for i := 0; i != len(taglist); i++ {
		exist = false
		for j := 0; j != len(tags); j++ {
			if taglist[i] == tags[j].Name {
				exist = true
			}
			if exist == true {
				//TagsAdd(db, taglist[i], generateRandomTagColor())
				return false
			}
		}
	}
	return true
}

func TagsGet(db *sql.DB, id int) {
	rows, err := db.Query(`SELECT tag.id,tag.name,tag.color FROM tag WHERE id = ?`, id)

	if err != nil {
		panic(err.Error())
	}
	defer rows.Close()

	var tags []GetTag
	for rows.Next() {
		var t GetTag

		err := rows.Scan(&t.Id, &t.Name, &t.Color)
		if err != nil {
			panic(err.Error())
		}
		tags = append(tags, t)

	}
	if err := rows.Err(); err != nil {
		panic(err.Error())
	}
	fmt.Println(tags)
}

func TagsGetAll(db *sql.DB) []GetTag {
	taglist, err := db.Query(`SELECT tag.id,tag.name,tag.color
	FROM tag
	GROUP BY tag.id`)

	topiclist, err2 := db.Query(`SELECT topic.id,topic.name,topic_tags.tag_id,topic_tags.topic_id
	FROM topic
	INNER JOIN topic_tags ON topic.id = topic_tags.topic_id
	`)

	if err2 != nil {
		panic(err2.Error())
	}
	defer topiclist.Close()

	var topics []GetTopic
	for topiclist.Next() {
		var t GetTopic

		err2 := topiclist.Scan(&t.Id, &t.Name, &t.Tag_id, &t.Tag_Topic_id)
		if err2 != nil {
			panic(err2.Error())
		}
		topics = append(topics, t)

	}

	if err != nil {
		panic(err.Error())
	}
	defer taglist.Close()

	var tags []GetTag
	for taglist.Next() {
		var t GetTag

		err := taglist.Scan(&t.Id, &t.Name, &t.Color)
		if err != nil {
			panic(err.Error())
		}
		for i := 0; i < len(topics); i++ {
			if topics[i].Tag_id == t.Id {
				t.Topic = append(t.Topic, topics[i])

			}

		}
		tags = append(tags, t)

	}
	if err := taglist.Err(); err != nil {
		panic(err.Error())
	}
	fmt.Println(tags)
	return tags
}

func TagsUpdate(db *sql.DB, id int, name string, color string) {
	_, err := db.Exec(`UPDATE tag SET name = ?, color = ? WHERE id = ?`, name, color, id)
	if err != nil {
		panic(err.Error())
	}
}

func TagsDelete(db *sql.DB, id int) {
	_, err := db.Exec(`DELETE FROM tag WHERE id = ?`, id)
	if err != nil {
		panic(err.Error())
	}
}
