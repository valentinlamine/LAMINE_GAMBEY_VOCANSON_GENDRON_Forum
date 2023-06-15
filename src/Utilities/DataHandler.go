package utilities

import "database/sql"

func (data *Data) GetData(db *sql.DB) []TopicSortedDrop {
	data.Data = []TopicSortedDrop{}
	var resultAlgoPopular = GetTopicsSorted(db)
	// fmt.Println(utilities.GetTopicsSorted(db))
	for i := 0; i != len(resultAlgoPopular); i++ {
		//fmt.Println(resultAlgoPopular[i].Topic_id)
		data.Data = append(data.Data, GetTopicById(db, resultAlgoPopular[i].Topic_id))
	}
	return data.Data
}
