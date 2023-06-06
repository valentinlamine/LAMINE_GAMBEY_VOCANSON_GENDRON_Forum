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
	Id            int
	Username      string
	Password      string
	Email         string
	Register_date string
	Birth_date    string
}

type GetUsersAll struct {
	Id            int
	Username      string
	Password      string
	Email         string
	Register_date string
}

type GetTopic struct {
	Id          int
	Name        string
	Description string
	Private     bool
	User_id     int
}

type GetRole struct {
	Id    int
	Name  string
	Color string
}
type RoleUser struct {
	Id       int
	Name     string
	Color    string
	Username string
}
type TagTopic struct {
	Name  string
	Color string
}

type MessageUser struct {
	Id            int
	Content       string
	Creation_date string
	Updated_at    string
	Username      string
	Topic_id      int
	Status        string
	User_id       int
}

type GetPermission struct {
	Id          int
	Name        string
	Description string
}

type GetMessage struct {
	Id         int
	Content    string
	User_id    int
	Topic_id   int
	Created_at string
	Updated_at string
}

type GetFile struct {
	Id         int
	Name       string
	File       string
	Created_at string
}

type GetTag struct {
	Id    int
	Name  string
	Color string
}

type Ratio struct {
	Id    int
	Ratio float64
}

type TopicSorted struct {
	topics []Topic
}