package utilities

type Users struct {
	id            int
	username      string
	password      string
	email         string
	register_date string
	description   string
	birth_date    string
}
type Role struct {
	id    int
	name  string
	color string
}
type Permissions struct {
	id          int
	name        string
	description string
}
type Topic struct {
	id          int
	name        string
	description string
	private     bool
	created_at  string
	nb_views    int
	user_id     int
}
type Tag struct {
	id         int
	name       string
	created_at string
	color      string
}
type Files struct {
	id         int
	name       string
	created_at string
	file       string
}
type Messages struct {
	id         int
	content    string
	created_at string
	updated_at string
	user_id    int
	topic_id   int
}

type Messages_files struct {
	id         int
	message_id int
	file_id    int
}
type Roles_permissions struct {
	role_id       int
	permission_id int
}
type Users_roles struct {
	user_id int
	role_id int
}
type Topics_tags struct {
	topic_id int
	tag_id   int
}
type Users_messages_interactions struct {
	user_id    int
	message_id int
	status     string
}
type Users_followed_topics struct {
	user_id  int
	topic_id int
}

type GetUser struct {
	id            int
	username      string
	password      string
	email         string
	register_date string
	birth_date    string
}

type GetTopic struct {
	id          int
	name        string
	description string
	private     bool
	user_id     int
}

type GetRole struct {
	id    int
	name  string
	color string
}
type RoleUser struct {
	id       int
	name     string
	color    string
	username string
}
type TagTopic struct {
	name  string
	color string
}

type MessageUser struct {
	id            int
	content       string
	creation_date string
	updated_at    string
	username      string
	topic_id      int
	status        string
	user_id       int
}

type GetPermission struct {
	id          int
	name        string
	description string
}

type GetMessage struct {
	id         int
	content    string
	user_id    int
	topic_id   int
	created_at string
	updated_at string
}

type GetFile struct {
	id         int
	name       string
	file       string
	created_at string
}

type GetTag struct {
	id    int
	name  string
	color string
}
