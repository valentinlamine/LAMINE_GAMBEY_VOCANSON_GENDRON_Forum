package utilities

import (
	"database/sql"
	"fmt"
)

//algorithme de recommandations des topics :

// ratio_upvote_downvote = (tt_les_upvote_du_topic / tt_les_downvote_du_topic) / nb_msg_du_topic
// ratio_vue_follow = nb_vue_du_topic / nb_follow_du_topic

// algorithme = ratio_upvote_downvote * ratio_vue_follow

func RatioVote(db *sql.DB, id int) {
	fmt.Println(MessagesGetAllTopic(db, id))
}

func RatioVueFollow(db *sql.DB, id int) []Ratio {
	rows, err := db.Query(`SELECT
	((SELECT COUNT(users_messages_interactions.user_id) FROM users_messages_interactions INNER JOIN messages ON users_messages_interactions.message_id=messages.id WHERE users_messages_interactions.status = "upvote" AND messages.topic_id=?)/
	(SELECT COUNT(users_messages_interactions.user_id) FROM users_messages_interactions INNER JOIN messages ON users_messages_interactions.message_id=messages.id WHERE users_messages_interactions.status = "downvote" AND messages.topic_id=?))/ 
	(SELECT COUNT(messages.id) FROM messages WHERE messages.topic_id=?) AS "count"`, id, id, id)

	if err != nil {
		panic(err.Error())
	}
	defer rows.Close()

	var ratio []Ratio
	for rows.Next() {
		var r Ratio

		err := rows.Scan(&r.Ratio)
		if err != nil {
			r.Ratio = 0
		}
		r.Id = id
		ratio = append(ratio, r)
	}
	if err := rows.Err(); err != nil {
		panic(err.Error())
	}
	return ratio
}

func SortTopics(db *sql.DB) []GetTopic {
	var aled [][]Ratio
	var r []Ratio
	var TopicSorted []GetTopic = TopicsGetAll(db)
	var NewTopicSort []GetTopic
	var isDone = false
	fmt.Println(RatioVueFollow(db, 2))
	fmt.Println(len(TopicSorted))
	for i := 1; i <= len(TopicSorted); i++ {
		aled = append(aled, RatioVueFollow(db, i))
	}
	fmt.Println(aled[0])

	for !isDone {
		isDone = true
		var i = 0
		for i < len(r)-1 {
			if r[i].Ratio > r[i+1].Ratio {
				r[i].Ratio, r[i+1].Ratio = r[i+1].Ratio, r[i].Ratio
				isDone = false
			}
			i++
		}
	}
	for i := 0; i < len(r); i++ {
		NewTopicSort = append(NewTopicSort, TopicSorted[r[i].Id])
	}
	return NewTopicSort
}
