package utilities

import "database/sql"

func OpenDB() *sql.DB {
	db, err := sql.Open("mysql", "root:@(127.0.0.1:3306)/forum?parseTime=true")
	if err != nil {
		panic(err.Error())
	}
	// defer db.Close()
	return db
}
