package utilities

import (
	"database/sql"
	"fmt"
)

// topic join avec user.username et tag et topic_tag

func GetTopicsSorted(db *sql.DB) []TopicSorted {
	rows, err := db.Query(`SELECT (ratio_upvote_downvote * topic.nb_views) + (nb_follow_du_topic * 10) AS score, messages.topic_id
	FROM messages
	INNER JOIN users_messages_interactions ON messages.id = users_messages_interactions.message_id
	INNER JOIN topic on messages.topic_id = topic.id 
	INNER JOIN (
		SELECT (total_upvote / (total_upvote + total_downvote)) * 100 AS ratio_upvote_downvote, messages.topic_id
		FROM messages
		INNER JOIN users_messages_interactions ON messages.id = users_messages_interactions.message_id
		INNER JOIN (
			SELECT COUNT(users_messages_interactions.status) AS total_upvote, messages.topic_id
			FROM users_messages_interactions
			INNER JOIN messages ON users_messages_interactions.message_id = messages.id
			WHERE users_messages_interactions.status = 'upvote'
			GROUP BY messages.topic_id
		) AS total_upvote ON messages.topic_id = total_upvote.topic_id
		INNER JOIN (
			SELECT COUNT(users_messages_interactions.status) AS total_downvote, messages.topic_id
			FROM users_messages_interactions
			INNER JOIN messages ON users_messages_interactions.message_id = messages.id
			WHERE users_messages_interactions.status = 'downvote'
			GROUP BY messages.topic_id
		) AS total_downvote ON messages.topic_id = total_downvote.topic_id
		GROUP BY messages.topic_id
	) AS ratio_upvote_downvote ON messages.topic_id = ratio_upvote_downvote.topic_id
	INNER JOIN (
		SELECT COUNT(users_followed_topics.topic_id) AS nb_follow_du_topic, messages.topic_id
		FROM users_followed_topics
		INNER JOIN messages ON users_followed_topics.topic_id = messages.topic_id
		GROUP BY messages.topic_id
	) AS nb_follow_du_topic ON messages.topic_id = nb_follow_du_topic.topic_id
	GROUP BY messages.topic_id
	ORDER BY score DESC`)
	if err != nil {
		fmt.Println(err)
	}
	defer rows.Close()

	var sorted []TopicSorted
	for rows.Next() {
		var s TopicSorted
		err = rows.Scan(&s.Score, &s.Topic_id)
		if err != nil {
			fmt.Println(err)
		}
		sorted = append(sorted, s)

	}
	if err := rows.Err(); err != nil {
		panic(err.Error())
	}
	return sorted
}

func GetTopicsSortedFollowed(db *sql.DB, User_id int) []TopicSorted {
	//get all the topic that are followed by the user
	rows, err := db.Query(`SELECT topic.id FROM topic
	INNER JOIN users_followed_topics ON topic.id = users_followed_topics.topic_id
	WHERE users_followed_topics.user_id = ?;`, User_id)
	if err != nil {
		fmt.Println(err)
	}
	defer rows.Close()

	var sorted []TopicSorted
	for rows.Next() {
		var s TopicSorted
		err = rows.Scan(&s.Topic_id)
		if err != nil {
			fmt.Println(err)
		}
		sorted = append(sorted, s)

	}
	if err := rows.Err(); err != nil {
		panic(err.Error())
	}
	return sorted
}

func GetTopicById(db *sql.DB, id int) TopicSortedDrop {
	rows, err := db.Query(`(SELECT topic.creation_date,topic.nb_views,topic.id, topic.name, topic.private, topic.description, users.username
		FROM topic
		INNER JOIN users ON topic.user_id = users.id
		WHERE topic.id = ?);
		`, id)

	rows2, err2 := db.Query(`(SELECT tag.id, tag.name, tag.color
		FROM tag
		INNER JOIN topic_tags ON tag.id = topic_tags.tag_id
		WHERE topic_tags.topic_id = ?);`, id)

	rows3, err3 := db.Query(`SELECT COUNT(messages.id) FROM messages  JOIN topic ON messages.topic_id=topic.id WHERE topic.id = ?;`, id)

	if err != nil {
		fmt.Println(err)
	}
	defer rows.Close()

	if err2 != nil {
		fmt.Println(err2)
	}
	defer rows2.Close()

	if err3 != nil {
		fmt.Println(err3)
	}
	defer rows3.Close()

	var sorted []TopicSortedDrop
	for rows.Next() {
		var s TopicSortedDrop
		err = rows.Scan(&s.Topic_created_at, &s.Topic_nb_views, &s.Topic_id, &s.Topic_name, &s.Topic_private, &s.Topic_description, &s.User_username)
		if err != nil {
			fmt.Println(err)
		}
		sorted = append(sorted, s)

	}
	var tmp []GetTag
	for rows2.Next() {
		var t GetTag
		err2 = rows2.Scan(&t.Id, &t.Name, &t.Color)

		if err2 != nil {
			fmt.Println(err2)
		}
		tmp = append(tmp, t)
	}

	var nb_messages int
	for rows3.Next() {
		err3 = rows3.Scan(&nb_messages)
		if err3 != nil {
			fmt.Println(err3)
		}
	}
	var tmp2 []GetMessage
	tmp2 = MessagesGetAllTopic(db, id)
	sorted[0].All_Messages = tmp2
	sorted[0].Tags = tmp
	sorted[0].Nb_messages = nb_messages
	if err := rows.Err(); err != nil {
		panic(err.Error())
	}
	return sorted[0]

}
