package utilities

import (
	"database/sql"
	"fmt"
	"reflect"
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

func CheckPermission(db *sql.DB, user_id int, permission_id int) bool {
	rows, err := db.Query(`
	SELECT DISTINCT permissions.id
	FROM users
	INNER JOIN users_roles ON users.id = users_roles.user_id
	INNER JOIN roles ON users_roles.role_id = roles.id
	INNER JOIN roles_permissions ON roles.id = roles_permissions.role_id
	INNER JOIN permissions ON roles_permissions.permission_id = permissions.id
	WHERE users.id = ? AND permissions.id = ?; `, user_id, permission_id)
	if err != nil {
		panic(err.Error())
	}
	defer rows.Close()
	for rows.Next() {
		var p GetPermission
		err := rows.Scan(&p.Id)
		if err != nil {
			panic(err.Error())
		}
		sp := int(reflect.ValueOf(p.Id).Int())
		if sp == permission_id {
			return true
		}
	}
	if err != nil {
		panic(err.Error())
	}
	return false
}
