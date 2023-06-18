package utilities

import (
	"database/sql"
)

func (data *IndexData) GetData(db *sql.DB) []TopicSortedDrop {
	data.SortedTopics = []TopicSortedDrop{}
	var resultAlgoPopular = GetTopicsSorted(db)
	// fmt.Println(utilities.GetTopicsSorted(db))
	for i := 0; i != len(resultAlgoPopular); i++ {
		//fmt.Println(resultAlgoPopular[i].Topic_id)
		data.SortedTopics = append(data.SortedTopics, GetTopicById(db, resultAlgoPopular[i].Topic_id))
		data.SortedTopics[i].AllFollowers = GetFollowers(db, resultAlgoPopular[i].Topic_id)
	}
	return data.SortedTopics
}

func (data *IndexData) GetDataFollowed(db *sql.DB, User_id int) []TopicSortedDrop {
	data.SortedTopics = []TopicSortedDrop{}
	var resultAlgoFollowed = GetTopicsSortedFollowed(db, User_id)
	for i := 0; i != len(resultAlgoFollowed); i++ {
		data.SortedTopics = append(data.SortedTopics, GetTopicById(db, resultAlgoFollowed[i].Topic_id))
		data.SortedTopics[i].AllFollowers = GetFollowers(db, resultAlgoFollowed[i].Topic_id)
	}
	return data.SortedTopics
}
