package utilities

import (
	"database/sql"
	"fmt"
)

func PermissionsAdd(db *sql.DB, name string, description string) {
	_, err := db.Exec(`Insert INTO permissions (name,description) VALUES (?,?)`, name, description)
	if err != nil {
		panic(err.Error())
	}

}

func PermissionsGet(db *sql.DB, id int) {
	rows, err := db.Query(`SELECT permissions.id,permissions.name,permissions.description FROM permissions WHERE id = ?`, id)

	if err != nil {
		panic(err.Error())
	}
	defer rows.Close()

	var permissions []GetPermission
	for rows.Next() {
		var p GetPermission

		err := rows.Scan(&p.Id, &p.Name, &p.Description)
		if err != nil {
			panic(err.Error())
		}
		permissions = append(permissions, p)

	}
	if err := rows.Err(); err != nil {
		panic(err.Error())
	}
	fmt.Println(permissions)
}

func PermissionsUpdate(db *sql.DB, id int, name string, description string) {
	_, err := db.Exec(`UPDATE permissions SET name = ?, description = ? WHERE id = ?`, name, description, id)
	if err != nil {
		panic(err.Error())
	}
}

func PermissionsDelete(db *sql.DB, id int) {
	_, err := db.Exec(`DELETE FROM permissions WHERE id = ?`, id)
	if err != nil {
		panic(err.Error())
	}
}
