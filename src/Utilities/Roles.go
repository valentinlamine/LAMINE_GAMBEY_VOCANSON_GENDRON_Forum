package utilities

import (
	"database/sql"
	"fmt"
)

func RoleAdd(db *sql.DB, name string, color string, user_id int) {
	if CheckPermission(db, user_id, 22) {
		_, err := db.Exec(`Insert INTO roles (name,color) VALUES (?,?)`, name, color)
		if err != nil {
			panic(err.Error())
		}
	}
}

func RoleGet(db *sql.DB, id int) {
	rows, err := db.Query(`SELECT roles.id,roles.name,roles.color FROM roles WHERE id = ?`, id)

	if err != nil {
		panic(err.Error())
	}
	defer func(rows *sql.Rows) {
		err := rows.Close()
		if err != nil {

		}
	}(rows)

	var roles []GetRole
	for rows.Next() {
		var r GetRole

		err := rows.Scan(&r.Id, &r.Name, &r.Color)
		if err != nil {
			panic(err.Error())
		}
		roles = append(roles, r)

	}
	if err := rows.Err(); err != nil {
		panic(err.Error())
	}
	fmt.Println(roles)
}

func RoleGetAll(db *sql.DB) []GetRole {
	rows, err := db.Query(`SELECT roles.id,roles.name,roles.color FROM roles`)

	if err != nil {
		panic(err.Error())
	}
	defer func(rows *sql.Rows) {
		err := rows.Close()
		if err != nil {

		}
	}(rows)

	var roles []GetRole
	for rows.Next() {
		var r GetRole

		err := rows.Scan(&r.Id, &r.Name, &r.Color)
		if err != nil {
			panic(err.Error())
		}
		roles = append(roles, r)

	}
	if err := rows.Err(); err != nil {
		panic(err.Error())
	}
	return roles
}

func RoleUpdate(db *sql.DB, id int, name string, color string, user_id int) {
	if CheckPermission(db, user_id, 24) {
		_, err := db.Exec(`UPDATE roles SET name = ?, color = ? WHERE id = ?`, name, color, id)
		if err != nil {
			panic(err.Error())
		}
	}
}

func RoleDelete(db *sql.DB, id int, user_id int) {
	if CheckPermission(db, user_id, 23) {
		_, err := db.Exec(`DELETE FROM roles WHERE id = ?`, id)
		if err != nil {
			panic(err.Error())
		}
	}
}

func RolePermission(db *sql.DB, id int) {
	rows, err := db.Query(`SELECT permissions.name FROM roles_permissions INNER JOIN permissions ON roles_permissions.permission_id = permissions.id WHERE roles_permissions.role_id = ?`, id)

	if err != nil {
		panic(err.Error())
	}
	defer rows.Close()

	var permissions []string
	for rows.Next() {
		var p string

		err := rows.Scan(&p)
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

func UserAddRole(db *sql.DB, user_id int, role_id int) {
	_, err := db.Exec(`Insert INTO users_roles (user_id,role_id) VALUES (?,?)`, user_id, role_id)
	if err != nil {
		panic(err.Error())
	}
}
