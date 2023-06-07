package utilities

import (
	"database/sql"
	"fmt"
)

// topic join avec user.username et tag et topic_tag

func GetTopicsSorted(db *sql.DB) {

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
		return
	}
	defer rows.Close()

	var sorted []TopicSorted
	for rows.Next() {
		var s TopicSorted
		err = rows.Scan(&s.Score, &s.Topic_id)
		if err != nil {
			fmt.Println(err)
			return
		}
		sorted = append(sorted, s)

	}
	if err := rows.Err(); err != nil {
		panic(err.Error())
	}
	fmt.Println(sorted)
}
