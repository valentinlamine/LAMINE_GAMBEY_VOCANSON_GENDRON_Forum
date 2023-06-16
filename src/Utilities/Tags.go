package utilities

import (
	"database/sql"
	"fmt"
)

func TagsAdd(db *sql.DB, name string, color string) {
	_, err := db.Exec(`Insert INTO tag (name,color) VALUES (?,?)`, name, color)
	if err != nil {
		panic(err.Error())
	}

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
	rows, err := db.Query(`SELECT * FROM tag`)

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
