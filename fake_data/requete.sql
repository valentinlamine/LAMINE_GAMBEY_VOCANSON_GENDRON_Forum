Insert INTO users (email,username,password) VALUES ( "noagambey@proton.me", "mistersquare7", "c4ca4238a0b923820dcc509a6f75849b");

INSERT INTO topic (name,private,user_id) VALUES ("L'intelligence artificielle et son impact sur la société","true",1);
INSERT INTO topic (name,private,user_id) VALUES ("Les voyages et le tourisme","true",1);
INSERT INTO topic (name,private,user_id) VALUES ("La santé mentale et le bien-être","true",1);
INSERT INTO topic (name,private,user_id) VALUES ("Les jeux vidéo","true",1);
INSERT INTO topic (name,private,user_id) VALUES ("L'environnement et le changement climatique","true",1);

INSERT INTO messages (content,user_id,topic_id) VALUES ("Je suis fasciné par les progrès de l'intelligence artificielle ! Pensez-vous que l'IA finira par remplacer certains emplois traditionnels ? Quels secteurs seront les plus touchés selon vous ?",1,1);
INSERT INTO messages (content,user_id,topic_id) VALUES ("Je suis d'accord avec toi, l'IA est un sujet passionnant ! Je pense que les emplois les plus touchés seront ceux qui sont répétitifs et qui ne nécessitent pas de prise de décision. Par exemple, les caissiers dans les supermarchés.",1,1);
INSERT INTO messages (content,user_id,topic_id) VALUES ("Les IA sont déjà capables de battre les meilleurs joueurs d'échecs et de Go. Je pense que les emplois qui nécessitent de la créativité et de l'adaptation seront les moins touchés.",1,1);

INSERT INTO messages (content,user_id,topic_id) VALUES ("Découvrez les merveilles du monde à travers les voyages et le tourisme. Explorez des destinations uniques, des paysages à couper le souffle et plongez-vous dans de nouvelles cultures.",1,2);
INSERT INTO messages (content,user_id,topic_id) VALUES ("Plongez dans l'aventure et l'émerveillement grâce aux voyages et au tourisme. Élargissez vos horizons en visitant des endroits exotiques, des sites historiques et en goûtant aux saveurs locales.",1,2);
INSERT INTO messages (content,user_id,topic_id) VALUES ("Le voyage et le tourisme sont une porte ouverte vers l'évasion et la découverte. Partez à la rencontre de nouveaux horizons, de paysages à couper le souffle et de moments inoubliables.",1,2);

INSERT INTO messages (content,user_id,topic_id) VALUES ("La santé mentale est un sujet qui me tient à coeur. Je pense que nous devrions tous prendre le temps de nous occuper de notre bien-être et de notre santé mentale.",1,3);
INSERT INTO messages (content,user_id,topic_id) VALUES ("Je suis d'accord avec toi, la santé mentale est un sujet important. Je pense que nous devrions tous prendre le temps de nous occuper de notre bien-être et de notre santé mentale.",1,3);
INSERT INTO messages (content,user_id,topic_id) VALUES ("La santé mentale et le bien-être sont des éléments essentiels pour une vie équilibrée et épanouissante. Explorez des conseils, des pratiques de bien-être et des approches pour cultiver une bonne santé mentale et un équilibre émotionnel.",1,3);

INSERT INTO messages (content,user_id,topic_id) VALUES ("Les jeux vidéo sont un sujet qui me tient à coeur. Je pense que nous devrions tous prendre le temps de nous occuper de notre bien-être et de notre santé mentale.",1,4);
INSERT INTO messages (content,user_id,topic_id) VALUES ("Les jeux vidéo sont un univers captivant où l'imagination prend vie. Découvrez les dernières sorties, des astuces et des recommandations pour vivre des expériences de jeu inoubliables et développer votre passion pour cette forme de divertissement interactive.",1,4);
INSERT INTO messages (content,user_id,topic_id) VALUES ("Plongez dans l'univers fascinant des jeux vidéo. Explorez des mondes virtuels, défiez vos compétences, et découvrez les dernières sorties, astuces et recommandations pour vivre des expériences de jeu passionnantes.",1,4);

INSERT INTO messages (content,user_id,topic_id) VALUES ("L'environnement et le changement climatique sont des sujets qui me tiennent à coeur. Je pense que nous devrions tous prendre le temps de nous occuper de notre bien-être et de notre santé mentale.",1,5);
INSERT INTO messages (content,user_id,topic_id) VALUES ("L'environnement et le changement climatique sont des sujets qui me tiennent à coeur. Je pense que nous devrions tous prendre le temps de nous occuper de notre bien-être et de notre santé mentale.",1,5);
INSERT INTO messages (content,user_id,topic_id) VALUES ("L'environnement et le changement climatique sont des sujets qui me tiennent à coeur. Je pense que nous devrions tous prendre le temps de nous occuper de notre bien-être et de notre santé mentale.",1,5);

INSERT INTO tag (name, color) VALUES ("IA", "#FF0000");
INSERT INTO tag (name, color) VALUES ("Voyage", "#0000FF");
INSERT INTO tag (name, color) VALUES ("Tourisme", "#0000FF");
INSERT INTO tag (name, color) VALUES ("Santé mentale", "#00FF00");
INSERT INTO tag (name, color) VALUES ("Bien-être", "#00FF00");
INSERT INTO tag (name, color) VALUES ("Jeux vidéo", "#FFFF00");

INSERT INTO topic_tags (topic_id,tag_id) VALUES (1,1);
INSERT INTO topic_tags (topic_id,tag_id) VALUES (2,2);
INSERT INTO topic_tags (topic_id,tag_id) VALUES (2,3);
INSERT INTO topic_tags (topic_id,tag_id) VALUES (3,4);
INSERT INTO topic_tags (topic_id,tag_id) VALUES (3,5);
INSERT INTO topic_tags (topic_id,tag_id) VALUES (4,6);

INSERT INTO users_followed_topics (user_id,topic_id) VALUES (1,1);
INSERT INTO users_followed_topics (user_id,topic_id) VALUES (1,4);
INSERT INTO users_followed_topics (user_id,topic_id) VALUES (6,2);
INSERT INTO users_followed_topics (user_id,topic_id) VALUES (5,3);
INSERT INTO users_followed_topics (user_id,topic_id) VALUES (4,4);

INSERT INTO roles (name,color) VALUES ("admin","red");

INSERT INTO permissions (name) VALUES ("create_topic");
INSERT INTO permissions (name) VALUES ("edit_topic");

INSERT INTO roles_permissions (role_id,permission_id) VALUES (1,1);
INSERT INTO roles_permissions (role_id,permission_id) VALUES (1,2);

INSERT INTO users_roles (user_id,role_id) VALUES (1,1);

INSERT INTO users_messages_interactions (user_id, message_id, status) VALUES (1, 1, 'upvote');
INSERT INTO users_messages_interactions (user_id, message_id, status) VALUES (1, 3, 'downvote');
INSERT INTO users_messages_interactions (user_id, message_id, status) VALUES (4, 1, 'report');

INSERT INTO users_messages_interactions (user_id, message_id, status) VALUES (1, 2, 'upvote');
INSERT INTO users_messages_interactions (user_id, message_id, status) VALUES (2, 3, 'upvote');
INSERT INTO users_messages_interactions (user_id, message_id, status) VALUES (3, 5, 'upvote');

INSERT INTO users_messages_interactions (user_id, message_id, status) VALUES (1, 4, 'downvote');
INSERT INTO users_messages_interactions (user_id, message_id, status) VALUES (2, 4, 'downvote');
INSERT INTO users_messages_interactions (user_id, message_id, status) VALUES (1, 3, 'downvote');


INSERT INTO files (name, file) VALUES ("test", "test");
INSERT INTO files (name, file) VALUES ("test2", "test2");

INSERT INTO messages_files (message_id, file_id) VALUES (1, 1);
INSERT INTO messages_files (message_id, file_id) VALUES (1, 2);
INSERT INTO messages_files (message_id, file_id) VALUES (2, 1);

-- recupere les messages d'un topic avec l'id d'un topic
SELECT messages.content, messages.user_id, messages.topic_id, users.username, topic.name
FROM messages
INNER JOIN users ON messages.user_id = users.id
INNER JOIN topic ON messages.topic_id = topic.id
WHERE messages.topic_id = 3
ORDER BY messages.id DESC

-- recupere les follow d'un utilisateur
SELECT users_followed_topics.user_id, users_followed_topics.topic_id, users.username, topic.name
FROM users_followed_topics
INNER JOIN users ON users_followed_topics.user_id = users.id
INNER JOIN topic ON users_followed_topics.topic_id = topic.id
WHERE users.username = 'mistersquare7'

-- recupere les follow d'un utilisateur et les permissions et rôles associés
SELECT users.username, users_followed_topics.topic_id, permissions.name, roles.name
FROM users_followed_topics
INNER JOIN users ON users_followed_topics.user_id = users.id
INNER JOIN topic ON users_followed_topics.topic_id = topic.id
INNER JOIN roles ON users.id = roles.id
INNER JOIN roles_permissions ON roles.id = roles_permissions.role_id
INNER JOIN permissions ON roles_permissions.permission_id = permissions.id
WHERE users.username = 'mistersquare7'