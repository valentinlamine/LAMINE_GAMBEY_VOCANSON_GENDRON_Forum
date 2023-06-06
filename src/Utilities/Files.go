package utilities

import (
	"database/sql"
	"fmt"
)

func FilesAdd(db *sql.DB, name string, file string) {
	_, err := db.Exec(`Insert INTO files (name,file) VALUES (?,?)`, name, file)
	if err != nil {
		panic(err.Error())
	}

}

func FilesGet(db *sql.DB, id int) {
	rows, err := db.Query(`SELECT files.id,files.name,files.file FROM files WHERE id = ?`, id)

	if err != nil {
		panic(err.Error())
	}
	defer rows.Close()

	var files []GetFile
	for rows.Next() {
		var f GetFile

		err := rows.Scan(&f.Id, &f.Name, &f.File)
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

func FilesUpdate(db *sql.DB, id int, name string, file string) {
	_, err := db.Exec(`UPDATE files SET name = ?, file = ? WHERE id = ?`, name, file, id)
	if err != nil {
		panic(err.Error())
	}
}

func FilesDelete(db *sql.DB, id int) {
	_, err := db.Exec(`DELETE FROM files WHERE id = ?`, id)
	if err != nil {
		panic(err.Error())
	}
}
