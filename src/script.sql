CREATE TABLE IF NOT EXISTS users (
    id INT AUTO_INCREMENT PRIMARY KEY,
    email VARCHAR(255) UNIQUE NOT NULL,
    password VARCHAR(255) NOT NULL,
    username VARCHAR(32) UNIQUE NOT NULL,
    register_date DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    description VARCHAR(255),
    birth_date DATE,
    profile_picture MEDIUMBLOB DEFAULT NULL
) ENGINE = InnoDB;

CREATE TABLE IF NOT EXISTS roles(
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(32) UNIQUE NOT NULL,
    color VARCHAR(32) NOT NULL
) ENGINE = InnoDB;

CREATE TABLE IF NOT EXISTS permissions(
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(255) UNIQUE NOT NULL,
    description VARCHAR(255) NOT NULL
) ENGINE = InnoDB;

CREATE TABLE IF NOT EXISTS topic(
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(255) UNIQUE NOT NULL,
    description VARCHAR(255) NOT NULL,
    private BOOLEAN NOT NULL DEFAULT FALSE,
    creation_date DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    nb_views INT NOT NULL DEFAULT 0,
    user_id INT NOT NULL,
    FOREIGN KEY(user_id) REFERENCES users(id)
) ENGINE = InnoDB;

CREATE TABLE IF NOT EXISTS tag (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(255) UNIQUE NOT NULL,
    color VARCHAR(32) NOT NULL
) ENGINE = InnoDB;

CREATE TABLE IF NOT EXISTS files (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(255) NOT NULL,
    creation_date DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    file MEDIUMBLOB NOT NULL
) ENGINE = InnoDB;

CREATE TABLE IF NOT EXISTS messages(
    id INT AUTO_INCREMENT PRIMARY KEY,
    content VARCHAR(255) NOT NULL,
    creation_date DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP, 
    update_date DATETIME DEFAULT NULL,
    user_id INT NOT NULL,
    FOREIGN KEY(user_id) REFERENCES users(id),
    topic_id INT NOT NULL,
    FOREIGN KEY(topic_id) REFERENCES topic(id)
) ENGINE = InnoDB;

    CREATE TABLE IF NOT EXISTS messages_files(
        message_id INT NOT NULL,
        file_id INT NOT NULL,
        PRIMARY KEY(message_id, file_id),
        FOREIGN KEY(message_id) REFERENCES messages(id),
        FOREIGN KEY(file_id) REFERENCES files(id)
    ) ENGINE = InnoDB;

    CREATE TABLE IF NOT EXISTS roles_permissions(
        role_id INT NOT NULL,
        permission_id INT NOT NULL,
        PRIMARY KEY(role_id, permission_id),
        FOREIGN KEY(role_id) REFERENCES roles(id),
        FOREIGN KEY(permission_id) REFERENCES permissions(id)
    ) ENGINE = InnoDB;

    CREATE TABLE IF NOT EXISTS users_roles(
        user_id INT NOT NULL,
        role_id INT NOT NULL,
        PRIMARY KEY(user_id, role_id),
        FOREIGN KEY(user_id) REFERENCES users(id),
        FOREIGN KEY(role_id) REFERENCES roles(id)
    ) ENGINE = InnoDB;

    CREATE TABLE IF NOT EXISTS topic_tags(
        topic_id INT NOT NULL,
        tag_id INT NOT NULL,
        PRIMARY KEY(topic_id, tag_id),
        FOREIGN KEY(topic_id) REFERENCES topic(id),
        FOREIGN KEY(tag_id) REFERENCES tag(id)
    ) ENGINE = InnoDB;

    CREATE TABLE IF NOT EXISTS users_messages_interactions(
        user_id INT NOT NULL,
        message_id INT NOT NULL,
        status VARCHAR(32) NOT NULL,
        PRIMARY KEY(user_id, message_id),
        FOREIGN KEY(user_id) REFERENCES users(id),
        FOREIGN KEY(message_id) REFERENCES messages(id)
    ) ENGINE = InnoDB;

    CREATE TABLE IF NOT EXISTS users_followed_topics(
        user_id INT NOT NULL,
        topic_id INT NOT NULL,
        PRIMARY KEY(user_id, topic_id),
        FOREIGN KEY(user_id) REFERENCES users(id),
        FOREIGN KEY(topic_id) REFERENCES topic(id)
    ) ENGINE = InnoDB;
