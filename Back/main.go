package main

import (
	"database/sql"
	"forum/utilities"

	_ "github.com/go-sql-driver/mysql"
)

func main() {
	// Configure the database connection (always check errors)
	db, err := sql.Open("mysql", "root:@(127.0.0.1:3306)/forum?parseTime=true")
	if err != nil {
		panic(err.Error())
	}
	defer db.Close()
	utilities.TagsDelete(db, 7)

}
