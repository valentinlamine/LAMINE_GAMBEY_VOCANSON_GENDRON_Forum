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
INSERT INTO topic_tags (topic_id,tag_id) VALUES (5,1);

INSERT INTO users_followed_topics (user_id,topic_id) VALUES (1,1);
INSERT INTO users_followed_topics (user_id,topic_id) VALUES (1,4);
INSERT INTO users_followed_topics (user_id,topic_id) VALUES (6,2);
INSERT INTO users_followed_topics (user_id,topic_id) VALUES (5,3);
INSERT INTO users_followed_topics (user_id,topic_id) VALUES (4,4);
INSERT INTO users_followed_topics (user_id,topic_id) VALUES (3,5);


INSERT INTO permissions (name, description) VALUES ("change_own_nickname", "Allow to change own user nickname"); --1
INSERT INTO permissions (name, description) VALUES ("change_own_avatar", "Allow to change own user avatar"); --2
INSERT INTO permissions (name, description) VALUES ("change_own_description", "Allow to change own user description"); --3
INSERT INTO permissions (name, description) VALUES ("change_any_nickname", "Allow to change any user nickname"); --4
INSERT INTO permissions (name, description) VALUES ("delete_any_avatar", "Allow to delete any user avatar"); --5 
INSERT INTO permissions (name, description) VALUES ("delete_any_description", "Allow to delete any user description"); --6
INSERT INTO permissions (name, description) VALUES ("delete_user", "Allow to delete any user"); --7

INSERT INTO permissions (name, description) VALUES ("send_messages", "Allow to send messages"); --8
INSERT INTO permissions (name, description) VALUES ("edit_messages", "Allow to edit own messages"); --9
INSERT INTO permissions (name, description) VALUES ("delete_own_messages", "Allow to delete own messages"); --10
INSERT INTO permissions (name, description) VALUES ("react_messages", "Allow to react to any messages"); --11
INSERT INTO permissions (name, description) VALUES ("delete_any_messages", "Allow to delete any messages"); --12

INSERT INTO permissions (name, description) VALUES ("upload_files", "Allow to upload files"); --13
INSERT INTO permissions (name, description) VALUES ("download_files", "Allow to download any files"); --14
INSERT INTO permissions (name, description) VALUES ("delete_any_files", "Allow to delete any files"); --15

INSERT INTO permissions (name, description) VALUES ("create_topics", "Allow to create topics"); --16 
INSERT INTO permissions (name, description) VALUES ("delete_own_topics", "Allow to delete own topics"); --17
INSERT INTO permissions (name, description) VALUES ("edit_own_topics", "Allow to edit own topics"); --18 
INSERT INTO permissions (name, description) VALUES ("follow_topics", "Allow to follow topics"); --19
INSERT INTO permissions (name, description) VALUES ("delete_any_topics", "Allow to delete any topics"); --20
INSERT INTO permissions (name, description) VALUES ("edit_any_topics", "Allow to edit any topics"); --21
 
INSERT INTO permissions (name, description) VALUES ("create_roles", "Allow to create roles"); --22
INSERT INTO permissions (name, description) VALUES ("delete_roles", "Allow to delete roles"); --23
INSERT INTO permissions (name, description) VALUES ("edit_roles", "Allow to edit roles"); --24
INSERT INTO permissions (name, description) VALUES ("assign_roles", "Allow to assign roles"); --25 
INSERT INTO permissions (name, description) VALUES ("unassign_roles", "Allow to unassign roles"); --26

INSERT INTO roles (name, color) VALUES ("admin", "#e74c3c");
INSERT INTO roles (name, color) VALUES ("moderator", "#e67e22");
INSERT INTO roles (name, color) VALUES ("user", "#99aab5");
INSERT INTO roles (name, color) VALUES ("guest", "#2c2f33");

INSERT INTO roles_permissions (role_id, permission_id) VALUES (1, 1);
INSERT INTO roles_permissions (role_id, permission_id) VALUES (1, 2);
INSERT INTO roles_permissions (role_id, permission_id) VALUES (1, 3);
INSERT INTO roles_permissions (role_id, permission_id) VALUES (1, 4);
INSERT INTO roles_permissions (role_id, permission_id) VALUES (1, 5);
INSERT INTO roles_permissions (role_id, permission_id) VALUES (1, 6);
INSERT INTO roles_permissions (role_id, permission_id) VALUES (1, 7);
INSERT INTO roles_permissions (role_id, permission_id) VALUES (1, 8);
INSERT INTO roles_permissions (role_id, permission_id) VALUES (1, 9);
INSERT INTO roles_permissions (role_id, permission_id) VALUES (1, 10);
INSERT INTO roles_permissions (role_id, permission_id) VALUES (1, 11);
INSERT INTO roles_permissions (role_id, permission_id) VALUES (1, 12);
INSERT INTO roles_permissions (role_id, permission_id) VALUES (1, 13);
INSERT INTO roles_permissions (role_id, permission_id) VALUES (1, 14);
INSERT INTO roles_permissions (role_id, permission_id) VALUES (1, 15);
INSERT INTO roles_permissions (role_id, permission_id) VALUES (1, 16);
INSERT INTO roles_permissions (role_id, permission_id) VALUES (1, 17);
INSERT INTO roles_permissions (role_id, permission_id) VALUES (1, 18);
INSERT INTO roles_permissions (role_id, permission_id) VALUES (1, 19);
INSERT INTO roles_permissions (role_id, permission_id) VALUES (1, 20);
INSERT INTO roles_permissions (role_id, permission_id) VALUES (1, 21);
INSERT INTO roles_permissions (role_id, permission_id) VALUES (1, 22);
INSERT INTO roles_permissions (role_id, permission_id) VALUES (1, 23);
INSERT INTO roles_permissions (role_id, permission_id) VALUES (1, 24);
INSERT INTO roles_permissions (role_id, permission_id) VALUES (1, 25);
INSERT INTO roles_permissions (role_id, permission_id) VALUES (1, 26);

INSERT INTO roles_permissions (role_id, permission_id) VALUES (3, 1);
INSERT INTO roles_permissions (role_id, permission_id) VALUES (3, 2);
INSERT INTO roles_permissions (role_id, permission_id) VALUES (3, 3);
INSERT INTO roles_permissions (role_id, permission_id) VALUES (3, 8);
INSERT INTO roles_permissions (role_id, permission_id) VALUES (3, 9);
INSERT INTO roles_permissions (role_id, permission_id) VALUES (3, 10);
INSERT INTO roles_permissions (role_id, permission_id) VALUES (3, 11);
INSERT INTO roles_permissions (role_id, permission_id) VALUES (3, 13);
INSERT INTO roles_permissions (role_id, permission_id) VALUES (3, 14);
INSERT INTO roles_permissions (role_id, permission_id) VALUES (3, 15);
INSERT INTO roles_permissions (role_id, permission_id) VALUES (3, 16);
INSERT INTO roles_permissions (role_id, permission_id) VALUES (3, 17);
INSERT INTO roles_permissions (role_id, permission_id) VALUES (3, 18);
INSERT INTO roles_permissions (role_id, permission_id) VALUES (3, 19);

INSERT INTO roles_permissions (role_id, permission_id) VALUES (2, 1);
INSERT INTO roles_permissions (role_id, permission_id) VALUES (2, 2);
INSERT INTO roles_permissions (role_id, permission_id) VALUES (2, 3);
INSERT INTO roles_permissions (role_id, permission_id) VALUES (2, 4);
INSERT INTO roles_permissions (role_id, permission_id) VALUES (2, 5);
INSERT INTO roles_permissions (role_id, permission_id) VALUES (2, 6);
INSERT INTO roles_permissions (role_id, permission_id) VALUES (2, 8);
INSERT INTO roles_permissions (role_id, permission_id) VALUES (2, 9);
INSERT INTO roles_permissions (role_id, permission_id) VALUES (2, 10);
INSERT INTO roles_permissions (role_id, permission_id) VALUES (2, 11);
INSERT INTO roles_permissions (role_id, permission_id) VALUES (2, 12);
INSERT INTO roles_permissions (role_id, permission_id) VALUES (2, 13);
INSERT INTO roles_permissions (role_id, permission_id) VALUES (2, 14);
INSERT INTO roles_permissions (role_id, permission_id) VALUES (2, 16);
INSERT INTO roles_permissions (role_id, permission_id) VALUES (2, 17);
INSERT INTO roles_permissions (role_id, permission_id) VALUES (2, 18);
INSERT INTO roles_permissions (role_id, permission_id) VALUES (2, 19);
INSERT INTO roles_permissions (role_id, permission_id) VALUES (2, 20);
INSERT INTO roles_permissions (role_id, permission_id) VALUES (2, 21);


INSERT INTO users_roles (user_id, role_id) VALUES (1, 1);
INSERT INTO users_roles (user_id, role_id) VALUES (1, 3);
INSERT INTO users_roles (user_id, role_id) VALUES (2, 2);
INSERT INTO users_roles (user_id, role_id) VALUES (2, 3);
INSERT INTO users_roles (user_id, role_id) VALUES (4, 3);
INSERT INTO users_roles (user_id, role_id) VALUES (5, 4);

--Get all permissions of a user 
SELECT DISTINCT permissions.id, permissions.name, permissions.description
FROM users
INNER JOIN users_roles ON users.id = users_roles.user_id
INNER JOIN roles ON users_roles.role_id = roles.id
INNER JOIN roles_permissions ON roles.id = roles_permissions.role_id
INNER JOIN permissions ON roles_permissions.permission_id = permissions.id
WHERE users.id = 1 AND permissions.id = 1; 




--Topic 1--
INSERT INTO users_messages_interactions (user_id, message_id, status) VALUES (1, 1, 'upvote');
INSERT INTO users_messages_interactions (user_id, message_id, status) VALUES (2, 1, 'upvote');
INSERT INTO users_messages_interactions (user_id, message_id, status) VALUES (3, 1, 'upvote');
INSERT INTO users_messages_interactions (user_id, message_id, status) VALUES (4, 1, 'downvote');
INSERT INTO users_messages_interactions (user_id, message_id, status) VALUES (5, 1, 'downvote');

INSERT INTO users_messages_interactions (user_id, message_id, status) VALUES (1, 2, 'upvote');
INSERT INTO users_messages_interactions (user_id, message_id, status) VALUES (2, 2, 'upvote');
INSERT INTO users_messages_interactions (user_id, message_id, status) VALUES (3, 2, 'downvote');
INSERT INTO users_messages_interactions (user_id, message_id, status) VALUES (4, 2, 'downvote');
INSERT INTO users_messages_interactions (user_id, message_id, status) VALUES (5, 2, 'downvote');

INSERT INTO users_messages_interactions (user_id, message_id, status) VALUES (1, 3, 'upvote');
INSERT INTO users_messages_interactions (user_id, message_id, status) VALUES (2, 3, 'upvote');
INSERT INTO users_messages_interactions (user_id, message_id, status) VALUES (3, 3, 'upvote');
INSERT INTO users_messages_interactions (user_id, message_id, status) VALUES (4, 3, 'upvote');
INSERT INTO users_messages_interactions (user_id, message_id, status) VALUES (5, 3, 'upvote');

--Topic 2--
INSERT INTO users_messages_interactions (user_id, message_id, status) VALUES (1, 4, 'upvote');
INSERT INTO users_messages_interactions (user_id, message_id, status) VALUES (2, 4, 'upvote');
INSERT INTO users_messages_interactions (user_id, message_id, status) VALUES (3, 4, 'upvote');
INSERT INTO users_messages_interactions (user_id, message_id, status) VALUES (4, 4, 'upvote');
INSERT INTO users_messages_interactions (user_id, message_id, status) VALUES (5, 4, 'upvote');

INSERT INTO users_messages_interactions (user_id, message_id, status) VALUES (1, 5, 'upvote');
INSERT INTO users_messages_interactions (user_id, message_id, status) VALUES (2, 5, 'upvote');
INSERT INTO users_messages_interactions (user_id, message_id, status) VALUES (3, 5, 'upvote');
INSERT INTO users_messages_interactions (user_id, message_id, status) VALUES (4, 5, 'upvote');
INSERT INTO users_messages_interactions (user_id, message_id, status) VALUES (5, 5, 'downvote');

INSERT INTO users_messages_interactions (user_id, message_id, status) VALUES (1, 6, 'upvote');
INSERT INTO users_messages_interactions (user_id, message_id, status) VALUES (2, 6, 'upvote');
INSERT INTO users_messages_interactions (user_id, message_id, status) VALUES (3, 6, 'upvote');
INSERT INTO users_messages_interactions (user_id, message_id, status) VALUES (4, 6, 'upvote');
INSERT INTO users_messages_interactions (user_id, message_id, status) VALUES (5, 6, 'downvote');

--Topic 3--
INSERT INTO users_messages_interactions (user_id, message_id, status) VALUES (1, 7, 'upvote');
INSERT INTO users_messages_interactions (user_id, message_id, status) VALUES (2, 7, 'upvote');
INSERT INTO users_messages_interactions (user_id, message_id, status) VALUES (3, 7, 'upvote');
INSERT INTO users_messages_interactions (user_id, message_id, status) VALUES (4, 7, 'downvote');
INSERT INTO users_messages_interactions (user_id, message_id, status) VALUES (5, 7, 'downvote');

INSERT INTO users_messages_interactions (user_id, message_id, status) VALUES (1, 8, 'upvote');
INSERT INTO users_messages_interactions (user_id, message_id, status) VALUES (2, 8, 'upvote');
INSERT INTO users_messages_interactions (user_id, message_id, status) VALUES (3, 8, 'upvote');
INSERT INTO users_messages_interactions (user_id, message_id, status) VALUES (4, 8, 'downvote');
INSERT INTO users_messages_interactions (user_id, message_id, status) VALUES (5, 8, 'downvote');

INSERT INTO users_messages_interactions (user_id, message_id, status) VALUES (1, 9, 'downvote');
INSERT INTO users_messages_interactions (user_id, message_id, status) VALUES (2, 9, 'downvote');
INSERT INTO users_messages_interactions (user_id, message_id, status) VALUES (3, 9, 'downvote');
INSERT INTO users_messages_interactions (user_id, message_id, status) VALUES (4, 9, 'downvote');
INSERT INTO users_messages_interactions (user_id, message_id, status) VALUES (5, 9, 'downvote');
INSERT INTO users_messages_interactions (user_id, message_id, status) VALUES (6, 9, 'downvote');
INSERT INTO users_messages_interactions (user_id, message_id, status) VALUES (7, 9, 'downvote');

--Topic 4--
INSERT INTO users_messages_interactions (user_id, message_id, status) VALUES (1, 10, 'upvote');
INSERT INTO users_messages_interactions (user_id, message_id, status) VALUES (2, 10, 'upvote');
INSERT INTO users_messages_interactions (user_id, message_id, status) VALUES (3, 10, 'upvote');

INSERT INTO users_messages_interactions (user_id, message_id, status) VALUES (1, 11, 'upvote');
INSERT INTO users_messages_interactions (user_id, message_id, status) VALUES (2, 11, 'upvote');
INSERT INTO users_messages_interactions (user_id, message_id, status) VALUES (3, 11, 'downvote');

INSERT INTO users_messages_interactions (user_id, message_id, status) VALUES (1, 12, 'upvote');
INSERT INTO users_messages_interactions (user_id, message_id, status) VALUES (2, 12, 'upvote');
INSERT INTO users_messages_interactions (user_id, message_id, status) VALUES (3, 12, 'downvote');
INSERT INTO users_messages_interactions (user_id, message_id, status) VALUES (4, 12, 'downvote');
INSERT INTO users_messages_interactions (user_id, message_id, status) VALUES (5, 12, 'downvote');

--Topic 5--
INSERT INTO users_messages_interactions (user_id, message_id, status) VALUES (1, 13, 'upvote');
INSERT INTO users_messages_interactions (user_id, message_id, status) VALUES (2, 13, 'upvote');
INSERT INTO users_messages_interactions (user_id, message_id, status) VALUES (3, 13, 'upvote');
INSERT INTO users_messages_interactions (user_id, message_id, status) VALUES (4, 13, 'upvote');

INSERT INTO users_messages_interactions (user_id, message_id, status) VALUES (1, 14, 'downvote');
INSERT INTO users_messages_interactions (user_id, message_id, status) VALUES (2, 14, 'downvote');
INSERT INTO users_messages_interactions (user_id, message_id, status) VALUES (3, 14, 'downvote');
INSERT INTO users_messages_interactions (user_id, message_id, status) VALUES (4, 14, 'downvote');

INSERT INTO users_messages_interactions (user_id, message_id, status) VALUES (1, 15, 'upvote');
INSERT INTO users_messages_interactions (user_id, message_id, status) VALUES (2, 15, 'upvote');
INSERT INTO users_messages_interactions (user_id, message_id, status) VALUES (3, 15, 'downvote');
INSERT INTO users_messages_interactions (user_id, message_id, status) VALUES (4, 15, 'downvote');



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

-- algorithme de recommandation 
/*
total_up = nombre total de upvote du topic
total_down = nombre total de downvote du topic
nb_vue_du_topic = nombre de vue du topic
nb_follow_du_topic = nombre de follow du topic

ratio_upvote_downvote = (total_up / (total_up + total_down)) * 100

score = (ratio_upvote_downvote * nb_vue_du_topic) + (nb_follow_du_topic * 10)
*/


-- recupere le total des upvote et downvote d'un topic
---- upvote
SELECT COUNT(users_messages_interactions.status) AS total_upvote, messages.topic_id
FROM users_messages_interactions
INNER JOIN messages ON users_messages_interactions.message_id = messages.id
WHERE users_messages_interactions.status = 'upvote'
GROUP BY messages.topic_id
---- downvote
SELECT COUNT(users_messages_interactions.status) AS total_downvote, messages.topic_id
FROM users_messages_interactions
INNER JOIN messages ON users_messages_interactions.message_id = messages.id
WHERE users_messages_interactions.status = 'downvote'
GROUP BY messages.topic_id

-- ratio upvote / downvote sur un topic
SELECT (total_upvote / (total_upvote + total_downvote)) * 100 AS ratio_upvote_downvote, messages.topic_id
FROM messages
INNER JOIN users_messages_interactions ON messages.id = users_messages_interactions.message_id
INNER JOIN (
    SELECT COUNT(users_messages_interactions.status) AS total_upvote, messages.topic_id
    FROM users_messages_interactions
    INNER JOIN messages ON users_messages_interactions.message_id = messages.id
    WHERE users_messages_interactions.status = 'upvote'
    GROUP BY messages.topic_id
) AS total_upvote ON messages.topic_id = total_upvote.topic_id
INNER JOIN (
    SELECT COUNT(users_messages_interactions.status) AS total_downvote, messages.topic_id
    FROM users_messages_interactions
    INNER JOIN messages ON users_messages_interactions.message_id = messages.id
    WHERE users_messages_interactions.status = 'downvote'
    GROUP BY messages.topic_id
) AS total_downvote ON messages.topic_id = total_downvote.topic_id
GROUP BY messages.topic_id

-- nombre de vue est stocké dans la table topic sur l'attribut nb_views
-- nombre de follow d'un topic est stocké dans sa propre table user_followed_topic contenant user id et topic id
---- calcul nb total user_followed_topic
SELECT COUNT(users_followed_topics.topic_id) AS nb_follow_du_topic, messages.topic_id
FROM users_followed_topics
INNER JOIN messages ON users_followed_topics.topic_id = messages.topic_id
GROUP BY messages.topic_id

-- calcul du score
SELECT (ratio_upvote_downvote * topic.nb_views) + (nb_follow_du_topic * 10) AS score, messages.topic_id
FROM messages
INNER JOIN users_messages_interactions ON messages.id = users_messages_interactions.message_id
INNER JOIN topic on messages.topic_id = topic.id 
INNER JOIN (
    SELECT (total_upvote / (total_upvote + total_downvote)) * 100 AS ratio_upvote_downvote, messages.topic_id
    FROM messages
    INNER JOIN users_messages_interactions ON messages.id = users_messages_interactions.message_id
    INNER JOIN (
        SELECT COUNT(users_messages_interactions.status) AS total_upvote, messages.topic_id
        FROM users_messages_interactions
        INNER JOIN messages ON users_messages_interactions.message_id = messages.id
        WHERE users_messages_interactions.status = 'upvote'
        GROUP BY messages.topic_id
    ) AS total_upvote ON messages.topic_id = total_upvote.topic_id
    INNER JOIN (
        SELECT COUNT(users_messages_interactions.status) AS total_downvote, messages.topic_id
        FROM users_messages_interactions
        INNER JOIN messages ON users_messages_interactions.message_id = messages.id
        WHERE users_messages_interactions.status = 'downvote'
        GROUP BY messages.topic_id
    ) AS total_downvote ON messages.topic_id = total_downvote.topic_id
    GROUP BY messages.topic_id
) AS ratio_upvote_downvote ON messages.topic_id = ratio_upvote_downvote.topic_id
INNER JOIN (
    SELECT COUNT(users_followed_topics.topic_id) AS nb_follow_du_topic, messages.topic_id
    FROM users_followed_topics
    INNER JOIN messages ON users_followed_topics.topic_id = messages.topic_id
    GROUP BY messages.topic_id
) AS nb_follow_du_topic ON messages.topic_id = nb_follow_du_topic.topic_id
GROUP BY messages.topic_id



-- topic join avec user.username et tag et topic_tags
(SELECT topic.id, topic.name, topic.private, topic.description, users.username
FROM topic
INNER JOIN users ON topic.user_id = users.id
WHERE topic.id = 2);
(SELECT tag.id, tag.name, tag.color
FROM tag
INNER JOIN topic_tags ON tag.id = topic_tags.tag_id
WHERE topic_tags.topic_id = 2);


SELECT title, p.content, u.username, GROUP_CONCAT(DISTINCT tags.name SEPARATOR ";") as "tags", 
(SELECT COUNT(pr.post_id) from post_reactions as pr where pr.post_id = p.id and pr.reaction_id = 1) as "upvote",
(SELECT COUNT(pr.post_id) from post_reactions as pr where pr.post_id = p.id and pr.reaction_id = 2) as "downvote"
    FROM topics as t
    LEFT JOIN topic_tags AS tag ON t.id = tag.topic_id
    JOIN tags ON tag.tag_id = tags.id
    JOIN topic_first_posts AS fp ON t.id = fp.topic_id
    JOIN posts AS p ON fp.post_id = p.id
    LEFT JOIN users as u ON t.user_id = u.id
    WHERE t.id = 1


    (SELECT topic.id, topic.name, topic.private, topic.description, users.username
    FROM topic
    INNER JOIN users ON topic.user_id = users.id
    WHERE topic.id = 2);
    (SELECT tag.id, tag.name, tag.color
    FROM tag
    INNER JOIN topic_tags ON tag.id = topic_tags.tag_id
    WHERE topic_tags.topic_id = 2);

SELECT COUNT(messages.id) FROM messages  JOIN topic ON messages.topic_id=topic.id WHERE topic.id = 2


-- récupère la liste de msg d'un topic
SELECT DISTINCT messages.id, messages.content,messages.creation_date, messages.user_id,messages.topic_id,users.username
FROM messages 
INNER JOIN users_messages_interactions ON messages.user_id = users_messages_interactions.user_id
INNER JOIN users ON messages.user_id = users.id
WHERE messages.topic_id = 1
ORDER BY users_messages_interactions.status = "upvote" DESC 

-- récupère le nombre de upvote d'un message
SELECT COUNT(*) AS nb_upvote_msg
FROM users_messages_interactions
WHERE users_messages_interactions.message_id = 2 AND users_messages_interactions.status = "upvote"

-- ajoute à la liste de msg d'un topic le nombre de upvote
SELECT DISTINCT messages.id, messages.content,messages.creation_date, messages.user_id,messages.topic_id,users.username, (
    SELECT COUNT(*) AS nb_upvote_msg
    FROM users_messages_interactions
    WHERE users_messages_interactions.message_id = messages.id AND users_messages_interactions.status = "upvote") AS nb_upvote_msg
FROM messages
INNER JOIN users_messages_interactions ON messages.user_id = users_messages_interactions.user_id
INNER JOIN users ON messages.user_id = users.id
WHERE messages.topic_id = 1
ORDER BY users_messages_interactions.status = "upvote" DESC
