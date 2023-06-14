-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1:3306
-- Généré le : mar. 06 juin 2023 à 19:30
-- Version du serveur : 8.0.31
-- Version de PHP : 8.0.26

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données : `forum`
--

-- --------------------------------------------------------

--
-- Structure de la table `files`
--

DROP TABLE IF EXISTS `files`;
CREATE TABLE IF NOT EXISTS `files` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE latin1_bin NOT NULL,
  `creation_date` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `file` mediumblob NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1 COLLATE=latin1_bin;

--
-- Déchargement des données de la table `files`
--

INSERT INTO `files` (`id`, `name`, `creation_date`, `file`) VALUES
(1, 'test', '2023-06-06 00:07:11', 0x74657374),
(2, 'test2', '2023-06-06 00:07:11', 0x7465737432);

-- --------------------------------------------------------

--
-- Structure de la table `messages`
--

DROP TABLE IF EXISTS `messages`;
CREATE TABLE IF NOT EXISTS `messages` (
  `id` int NOT NULL AUTO_INCREMENT,
  `content` varchar(255) COLLATE latin1_bin NOT NULL,
  `creation_date` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `update_date` datetime DEFAULT NULL,
  `user_id` int NOT NULL,
  `topic_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `user_id` (`user_id`),
  KEY `topic_id` (`topic_id`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=latin1 COLLATE=latin1_bin;

--
-- Déchargement des données de la table `messages`
--

INSERT INTO `messages` (`id`, `content`, `creation_date`, `update_date`, `user_id`, `topic_id`) VALUES
(1, 'Je suis fasciné par les progrès de l\'intelligence artificielle ! Pensez-vous que l\'IA finira par remplacer certains emplois traditionnels ? Quels secteurs seront les plus touchés selon vous ?', '2023-06-05 20:45:30', NULL, 1, 1),
(2, 'Je suis d\'accord avec toi, l\'IA est un sujet passionnant ! Je pense que les emplois les plus touchés seront ceux qui sont répétitifs et qui ne nécessitent pas de prise de décision. Par exemple, les caissiers dans les supermarchés.', '2023-06-05 20:45:31', NULL, 1, 1),
(3, 'Les IA sont déjà capables de battre les meilleurs joueurs d\'échecs et de Go. Je pense que les emplois qui nécessitent de la créativité et de l\'adaptation seront les moins touchés.', '2023-06-05 20:45:31', NULL, 1, 1),
(4, 'Découvrez les merveilles du monde à travers les voyages et le tourisme. Explorez des destinations uniques, des paysages à couper le souffle et plongez-vous dans de nouvelles cultures.', '2023-06-05 20:45:31', NULL, 1, 2),
(5, 'Plongez dans l\'aventure et l\'émerveillement grâce aux voyages et au tourisme. Élargissez vos horizons en visitant des endroits exotiques, des sites historiques et en goûtant aux saveurs locales.', '2023-06-05 20:45:31', NULL, 1, 2),
(6, 'Le voyage et le tourisme sont une porte ouverte vers l\'évasion et la découverte. Partez à la rencontre de nouveaux horizons, de paysages à couper le souffle et de moments inoubliables.', '2023-06-05 20:45:31', NULL, 1, 2),
(7, 'La santé mentale est un sujet qui me tient à coeur. Je pense que nous devrions tous prendre le temps de nous occuper de notre bien-être et de notre santé mentale.', '2023-06-05 20:45:31', NULL, 1, 3),
(8, 'Je suis d\'accord avec toi, la santé mentale est un sujet important. Je pense que nous devrions tous prendre le temps de nous occuper de notre bien-être et de notre santé mentale.', '2023-06-05 20:45:31', NULL, 1, 3),
(9, 'La santé mentale et le bien-être sont des éléments essentiels pour une vie équilibrée et épanouissante. Explorez des conseils, des pratiques de bien-être et des approches pour cultiver une bonne santé mentale et un équilibre émotionnel.', '2023-06-05 20:45:31', NULL, 1, 3),
(10, 'Les jeux vidéo sont un sujet qui me tient à coeur. Je pense que nous devrions tous prendre le temps de nous occuper de notre bien-être et de notre santé mentale.', '2023-06-05 20:45:31', NULL, 1, 4),
(11, 'Les jeux vidéo sont un univers captivant où l\'imagination prend vie. Découvrez les dernières sorties, des astuces et des recommandations pour vivre des expériences de jeu inoubliables et développer votre passion pour cette forme de divertissement interact', '2023-06-05 20:45:31', NULL, 1, 4),
(12, 'Plongez dans l\'univers fascinant des jeux vidéo. Explorez des mondes virtuels, défiez vos compétences, et découvrez les dernières sorties, astuces et recommandations pour vivre des expériences de jeu passionnantes.', '2023-06-05 20:45:31', NULL, 1, 4),
(13, 'L\'environnement et le changement climatique sont des sujets qui me tiennent à coeur. Je pense que nous devrions tous prendre le temps de nous occuper de notre bien-être et de notre santé mentale.', '2023-06-05 20:45:31', NULL, 1, 5),
(14, 'L\'environnement et le changement climatique sont des sujets qui me tiennent à coeur. Je pense que nous devrions tous prendre le temps de nous occuper de notre bien-être et de notre santé mentale.', '2023-06-05 20:45:31', NULL, 1, 5),
(15, 'L\'environnement et le changement climatique sont des sujets qui me tiennent à coeur. Je pense que nous devrions tous prendre le temps de nous occuper de notre bien-être et de notre santé mentale.', '2023-06-05 20:45:31', NULL, 1, 5);

-- --------------------------------------------------------

--
-- Structure de la table `messages_files`
--

DROP TABLE IF EXISTS `messages_files`;
CREATE TABLE IF NOT EXISTS `messages_files` (
  `message_id` int NOT NULL,
  `file_id` int NOT NULL,
  PRIMARY KEY (`message_id`,`file_id`),
  KEY `file_id` (`file_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_bin;

--
-- Déchargement des données de la table `messages_files`
--

INSERT INTO `messages_files` (`message_id`, `file_id`) VALUES
(1, 1),
(2, 1),
(1, 2);

-- --------------------------------------------------------

--
-- Structure de la table `permissions`
--

DROP TABLE IF EXISTS `permissions`;
CREATE TABLE IF NOT EXISTS `permissions` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE latin1_bin NOT NULL,
  `description` varchar(255) COLLATE latin1_bin NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1 COLLATE=latin1_bin;

--
-- Déchargement des données de la table `permissions`
--

INSERT INTO `permissions` (`id`, `name`, `description`) VALUES
(1, 'create_topic', ''),
(2, 'edit_topic', '');

-- --------------------------------------------------------

--
-- Structure de la table `roles`
--

DROP TABLE IF EXISTS `roles`;
CREATE TABLE IF NOT EXISTS `roles` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(32) COLLATE latin1_bin NOT NULL,
  `color` varchar(32) COLLATE latin1_bin NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1 COLLATE=latin1_bin;

--
-- Déchargement des données de la table `roles`
--

INSERT INTO `roles` (`id`, `name`, `color`) VALUES
(1, 'admin', 'red');

-- --------------------------------------------------------

--
-- Structure de la table `roles_permissions`
--

DROP TABLE IF EXISTS `roles_permissions`;
CREATE TABLE IF NOT EXISTS `roles_permissions` (
  `role_id` int NOT NULL,
  `permission_id` int NOT NULL,
  PRIMARY KEY (`role_id`,`permission_id`),
  KEY `permission_id` (`permission_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_bin;

--
-- Déchargement des données de la table `roles_permissions`
--

INSERT INTO `roles_permissions` (`role_id`, `permission_id`) VALUES
(1, 1),
(1, 2);

-- --------------------------------------------------------

--
-- Structure de la table `tag`
--

DROP TABLE IF EXISTS `tag`;
CREATE TABLE IF NOT EXISTS `tag` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE latin1_bin NOT NULL,
  `color` varchar(32) COLLATE latin1_bin NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=latin1 COLLATE=latin1_bin;

--
-- Déchargement des données de la table `tag`
--

INSERT INTO `tag` (`id`, `name`, `color`) VALUES
(1, 'IA', '#FF0000'),
(2, 'Voyage', '#0000FF'),
(3, 'Tourisme', '#0000FF'),
(4, 'Santé mentale', '#00FF00'),
(5, 'Bien-être', '#00FF00'),
(6, 'Jeux vidéo', '#FFFF00');

-- --------------------------------------------------------

--
-- Structure de la table `topic`
--

DROP TABLE IF EXISTS `topic`;
CREATE TABLE IF NOT EXISTS `topic` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE latin1_bin NOT NULL,
  `description` varchar(255) COLLATE latin1_bin NOT NULL,
  `private` tinyint(1) NOT NULL DEFAULT '0',
  `creation_date` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `nb_views` int NOT NULL DEFAULT '0',
  `user_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`),
  KEY `user_id` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=latin1 COLLATE=latin1_bin;

--
-- Déchargement des données de la table `topic`
--

INSERT INTO `topic` (`id`, `name`, `description`, `private`, `creation_date`, `nb_views`, `user_id`) VALUES
(1, 'L\'intelligence artificielle et son impact sur la société', '', 0, '2023-06-05 20:45:07', 0, 1),
(2, 'Les voyages et le tourisme', '', 0, '2023-06-05 20:45:07', 0, 1),
(3, 'La santé mentale et le bien-être', '', 0, '2023-06-05 20:45:07', 0, 1),
(4, 'Les jeux vidéo', '', 0, '2023-06-05 20:45:07', 0, 1),
(5, 'L\'environnement et le changement climatique', '', 0, '2023-06-05 20:45:07', 0, 1);

-- --------------------------------------------------------

--
-- Structure de la table `topic_tags`
--

DROP TABLE IF EXISTS `topic_tags`;
CREATE TABLE IF NOT EXISTS `topic_tags` (
  `topic_id` int NOT NULL,
  `tag_id` int NOT NULL,
  PRIMARY KEY (`topic_id`,`tag_id`),
  KEY `tag_id` (`tag_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_bin;

--
-- Déchargement des données de la table `topic_tags`
--

INSERT INTO `topic_tags` (`topic_id`, `tag_id`) VALUES
(1, 1),
(2, 2),
(2, 3),
(3, 4),
(3, 5),
(4, 6);

-- --------------------------------------------------------

--
-- Structure de la table `users`
--

DROP TABLE IF EXISTS `users`;
CREATE TABLE IF NOT EXISTS `users` (
  `id` int NOT NULL AUTO_INCREMENT,
  `email` varchar(255) COLLATE latin1_bin NOT NULL,
  `password` varchar(255) COLLATE latin1_bin NOT NULL,
  `username` varchar(32) COLLATE latin1_bin NOT NULL,
  `register_date` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `description` varchar(255) COLLATE latin1_bin DEFAULT NULL,
  `birth_date` date DEFAULT NULL,
  `profile_picture` mediumblob,
  PRIMARY KEY (`id`),
  UNIQUE KEY `email` (`email`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=392 DEFAULT CHARSET=latin1 COLLATE=latin1_bin;

--
-- Déchargement des données de la table `users`
--

INSERT INTO `users` (`id`, `email`, `password`, `username`, `register_date`, `description`, `birth_date`, `profile_picture`) VALUES
(1, 'Valentinlamine@proton.me', 'UgXRb7wZfKM5rkd', 'Valouz', '2023-06-05 20:44:20', NULL, '1984-06-09', NULL),
(2, 'mistersquare7@gmail.com', 'zfzfyzbzebuazoiud', 'Mistersquare7', '2023-06-05 20:44:20', NULL, '1993-10-30', NULL),
(3, 'valentinlamine@proton.me', '1234', 'Valou', '2023-06-05 20:47:57', NULL, NULL, NULL),
(4, 'Mariah77@hotmail.com', 'P4ZBQPolH97DxDl', 'XanderSipes', '2023-06-05 20:44:20', NULL, '1999-10-05', NULL),
(5, 'Cary_Davis67@yahoo.com', 'dAWE1M3hvFtK0lq', 'LilyanBoyle17', '2023-06-05 20:44:20', NULL, '1999-07-22', NULL),
(6, 'Rogers_Maggio93@hotmail.com', 'GIeHmy9YPHFMpJ0', 'JonathanMosciski', '2023-06-05 20:44:20', NULL, '1991-09-22', NULL),
(7, 'Columbus_Reilly58@hotmail.com', '8b3EZyChcpztrPN', 'Hertha77', '2023-06-05 20:44:20', NULL, '1982-08-21', NULL),
(8, 'Macey.Heathcote61@gmail.com', 'e30rf4jjRMk4tg2', 'Ollie33', '2023-06-05 20:44:20', NULL, '1996-12-12', NULL),
(9, 'Clair_Rippin@yahoo.com', '9CTTm53QUP8cCxg', 'Jovani35', '2023-06-05 20:44:20', NULL, '1998-11-30', NULL),
(10, 'Sandrine_Greenfelder89@gmail.com', 'A47bMEWWSS9poWS', 'KenyaBlick76', '2023-06-05 20:44:20', NULL, '1987-10-30', NULL),
(11, 'Magnolia_Tillman@yahoo.com', 'Ws08ltHNG_3Fcq4', 'RobertoJohns', '2023-06-05 20:44:21', NULL, '1990-03-07', NULL),
(12, 'Adell87@gmail.com', 'RtBKJwaaf1anpE_', 'AydenKoch', '2023-06-05 20:44:21', NULL, '1996-04-23', NULL),
(13, 'Abigayle.Marvin90@yahoo.com', 'dUq0Bpn4kuaOfh4', 'KalebYost61', '2023-06-05 20:44:21', NULL, '1989-07-14', NULL),
(14, 'Neil.Hane@gmail.com', '_HPIz7gKrxlUwRw', 'NeldaSenger76', '2023-06-05 20:44:21', NULL, '1993-08-30', NULL),
(15, 'Orlo.Nolan@gmail.com', 'DVsAf9MSk2uRszG', 'SantiagoThompson15', '2023-06-05 20:44:21', NULL, '1992-03-28', NULL),
(16, 'Carolina_Morar@gmail.com', 'bz1fC8tPsSbZBIW', 'Oran56', '2023-06-05 20:44:21', NULL, '1989-06-21', NULL),
(17, 'Eugenia.Auer@gmail.com', '5GDtVpqwQiEn1CE', 'HobartMertz', '2023-06-05 20:44:21', NULL, '1983-10-23', NULL),
(18, 'Elenora31@yahoo.com', 'BihQgd43aojw0ry', 'Sim26', '2023-06-05 20:44:21', NULL, '1993-10-23', NULL),
(19, 'Paul10@yahoo.com', 'KW8DJAQCFODpZkv', 'Dario20', '2023-06-05 20:44:21', NULL, '1988-11-04', NULL),
(20, 'Edward_Tromp@gmail.com', '93I4S7t5GThxbTU', 'DianaWisozk31', '2023-06-05 20:44:21', NULL, '1995-02-23', NULL),
(21, 'Toby31@gmail.com', 'G15xYCirCQIHtQG', 'KasandraFeeney', '2023-06-05 20:44:21', NULL, '1987-10-26', NULL),
(22, 'Christ91@hotmail.com', 'ew4o_tCo8KkraJc', 'Violette29', '2023-06-05 20:44:21', NULL, '1997-08-24', NULL),
(23, 'Angelita.Hand@hotmail.com', 'WbWCg11Jq9ACXLV', 'QuintenLuettgen', '2023-06-05 20:44:21', NULL, '1991-03-18', NULL),
(24, 'Alek89@gmail.com', 'IO59VfyMwMrYI5_', 'DorthyYost79', '2023-06-05 20:44:21', NULL, '1985-06-20', NULL),
(25, 'Katheryn_Cole@yahoo.com', '7KbHf1CQP7VVGF4', 'Hudson83', '2023-06-05 20:44:21', NULL, '1988-07-17', NULL),
(26, 'Lilla.Ruecker@hotmail.com', 'RhI7J_U2wL5dhah', 'Shana6', '2023-06-05 20:44:21', NULL, '1995-01-17', NULL),
(27, 'Queenie.Flatley@gmail.com', 'FkQr8yBuL4ZB0WR', 'ZolaBeahan56', '2023-06-05 20:44:21', NULL, '1992-04-17', NULL),
(28, 'Jason.Rohan55@hotmail.com', 'qNiqVpZf4ru8Z0q', 'DariusLarkin', '2023-06-05 20:44:21', NULL, '1991-02-14', NULL),
(29, 'Dedric66@gmail.com', '_9vAcQmfyx6eVCX', 'Wyman31', '2023-06-05 20:44:21', NULL, '1991-07-04', NULL),
(30, 'Malinda74@yahoo.com', 'pkmIqEQO8Zm56Ll', 'IvyDurgan90', '2023-06-05 20:44:21', NULL, '1993-12-08', NULL),
(31, 'Kamron60@yahoo.com', 'ROrlLp4Wz3jkliw', 'MelisaSkiles', '2023-06-05 20:44:21', NULL, '1987-04-19', NULL),
(32, 'Jeff14@yahoo.com', 'BYl8RedYqcjFBE4', 'RyanBarton34', '2023-06-05 20:44:21', NULL, '1986-05-06', NULL),
(33, 'Hattie.Rath37@gmail.com', 'o_wUNLAtT1ehHCV', 'CarletonGoldner86', '2023-06-05 20:44:21', NULL, '1982-07-02', NULL),
(34, 'Amanda.Conroy@gmail.com', 'Fi4pV9H_15aaQ3L', 'TateHarvey', '2023-06-05 20:44:21', NULL, '1996-01-15', NULL),
(35, 'Jerad98@hotmail.com', 'fbIMQUbyIuQg9hg', 'Adelia39', '2023-06-05 20:44:21', NULL, '1996-07-11', NULL),
(36, 'Allison_Beier27@gmail.com', 'eow2GL59OUwxOix', 'LoyStokes', '2023-06-05 20:44:21', NULL, '1982-07-05', NULL),
(37, 'Shaun_Jaskolski50@yahoo.com', 'XGL9c7Ags25NG_m', 'Berta99', '2023-06-05 20:44:21', NULL, '1986-11-20', NULL),
(38, 'Briana_Muller@gmail.com', 'aC5zR38H8vFgtJy', 'AbbeyCassin', '2023-06-05 20:44:21', NULL, '1989-05-14', NULL),
(39, 'Laverna.Leuschke@gmail.com', 'g6_qs48jIOuBI9z', 'VernerFunk', '2023-06-05 20:44:21', NULL, '1988-02-02', NULL),
(40, 'Gay_Schaefer70@yahoo.com', 'RfHAN79DIVIiWKe', 'CrawfordSchoen', '2023-06-05 20:44:21', NULL, '1989-03-11', NULL),
(41, 'Bernice_Moen@gmail.com', 'hffxOjGyaNSt5HE', 'JeffSchmitt', '2023-06-05 20:44:21', NULL, '1999-02-17', NULL),
(42, 'Amelia74@gmail.com', 'NZ4JVBWUOQpvqG9', 'HalieJones', '2023-06-05 20:44:21', NULL, '1994-02-04', NULL),
(43, 'Julianne_Herman99@yahoo.com', 'f6IWu7sxOuxU656', 'KathlynWaelchi', '2023-06-05 20:44:21', NULL, '1982-02-09', NULL),
(44, 'Sterling78@gmail.com', 'QIDJMkG3w1RfOJR', 'LinwoodGrady89', '2023-06-05 20:44:22', NULL, '1995-08-23', NULL),
(45, 'Ike82@hotmail.com', 'tgXCOYvOSJgu_dH', 'CollinUllrich87', '2023-06-05 20:44:22', NULL, '1998-05-27', NULL),
(46, 'Jeanne82@yahoo.com', 'jLJR1gKQ0kQEzsZ', 'LorenzoCollins18', '2023-06-05 20:44:22', NULL, '1994-12-22', NULL),
(47, 'Marilou45@hotmail.com', 'diimFS4bNeKbLmz', 'CamdenQuitzon', '2023-06-05 20:44:22', NULL, '1995-01-21', NULL),
(48, 'Muriel_Kihn19@yahoo.com', 'c7MDUEoZcqD08fr', 'WiltonYost88', '2023-06-05 20:44:22', NULL, '1982-08-07', NULL),
(49, 'Milan_Deckow86@hotmail.com', '7iKYchhBYtkxPrt', 'Javon11', '2023-06-05 20:44:22', NULL, '1982-01-24', NULL),
(50, 'Lue_Thompson2@yahoo.com', '2Dt1fji8VfIQdpm', 'Louie57', '2023-06-05 20:44:22', NULL, '1982-06-28', NULL),
(51, 'Camille_Bahringer@hotmail.com', 'I5DgYgNHlL0c5or', 'PatVonRueden52', '2023-06-05 20:44:22', NULL, '1995-08-04', NULL),
(52, 'Garnett.Weimann68@yahoo.com', 'bzFFqZASRlPVq_S', 'LaviniaTurcotte22', '2023-06-05 20:44:22', NULL, '1984-04-28', NULL),
(53, 'Kraig.OConner27@gmail.com', 'lH0WCWr_drQzQYF', 'ArvelBuckridge', '2023-06-05 20:44:23', NULL, '1997-09-22', NULL),
(54, 'Carmen84@yahoo.com', 'Xt9VGU_EWPU_3Zv', 'TomKuphal', '2023-06-05 20:44:23', NULL, '1991-02-12', NULL),
(55, 'Jermaine_Auer@yahoo.com', 'OXsNGkWeAYRpQI3', 'OpheliaLabadie', '2023-06-05 20:44:23', NULL, '1988-11-25', NULL),
(56, 'Dorian_Bosco@yahoo.com', 'm3jNpSQai_m5CyQ', 'EsperanzaPrice', '2023-06-05 20:44:23', NULL, '1987-04-04', NULL),
(57, 'Meagan_Hills@hotmail.com', 'DhXd_FXqGwdBS6V', 'JohnpaulDeckow', '2023-06-05 20:44:23', NULL, '1993-11-14', NULL),
(58, 'Thurman.Yost68@yahoo.com', 'BRoGxGnoTmfRczf', 'TyreeHeidenreich', '2023-06-05 20:44:23', NULL, '1998-09-15', NULL),
(59, 'Domenic79@gmail.com', 'D6BOlCBA0RfpST4', 'Alice68', '2023-06-05 20:44:23', NULL, '1985-06-07', NULL),
(60, 'Bart55@gmail.com', 'VMBtPFjIItzVW__', 'Marilie63', '2023-06-05 20:44:23', NULL, '1982-04-15', NULL),
(61, 'Damaris83@gmail.com', 'pIkDh56rerM5kvp', 'HallieReichert', '2023-06-05 20:44:23', NULL, '1998-05-06', NULL),
(62, 'Lisa.Franecki@yahoo.com', '7TBVZJChPeT5Xhn', 'AngusCremin', '2023-06-05 20:44:23', NULL, '1989-04-02', NULL),
(63, 'Oral8@hotmail.com', 'cldcFe6HTPGljxT', 'Delphia48', '2023-06-05 20:44:23', NULL, '1997-03-25', NULL),
(64, 'Emory80@hotmail.com', 'NykBc6xrMKnIMQx', 'Emile60', '2023-06-05 20:44:23', NULL, '1991-04-19', NULL),
(65, 'Amanda_Jerde@hotmail.com', 'bV0IoTir33yOBLz', 'CharleneLittel91', '2023-06-05 20:44:23', NULL, '1997-08-11', NULL),
(66, 'Ursula.Spinka31@hotmail.com', 'QYieV0oA9_pzxMY', 'ChandlerDare', '2023-06-05 20:44:23', NULL, '1996-09-04', NULL),
(67, 'Aaliyah.Bernhard57@yahoo.com', 'aFgOjHWuBk5ab8I', 'HeavenGoldner', '2023-06-05 20:44:23', NULL, '1991-08-13', NULL),
(68, 'Hugh.Nienow@yahoo.com', 'QTxYOXRoKWC3NpO', 'CamrenSauer87', '2023-06-05 20:44:23', NULL, '1985-07-13', NULL),
(69, 'Alysha44@gmail.com', 'wq4XqMo0TQwLDVj', 'Prince99', '2023-06-05 20:44:23', NULL, '1996-04-13', NULL),
(70, 'Salma.Ruecker@hotmail.com', 'wEsv2mJu6OnxtQM', 'JakeOndricka77', '2023-06-05 20:44:24', NULL, '1982-07-16', NULL),
(71, 'Kolby18@yahoo.com', '9i8f6WwaNJFLj0G', 'RosieMitchell', '2023-06-05 20:44:24', NULL, '1982-11-09', NULL),
(72, 'Marie.Armstrong@yahoo.com', 'YGAmkc2ss9GqguT', 'Conor73', '2023-06-05 20:44:24', NULL, '1999-06-02', NULL),
(73, 'Cassandra.Towne76@gmail.com', 'tnjwzgRnHpOxS8G', 'FranzFritsch28', '2023-06-05 20:44:24', NULL, '1984-02-27', NULL),
(74, 'Marjory_Bogan42@hotmail.com', 'L4bwm3IPzkR9Gju', 'Jose43', '2023-06-05 20:44:24', NULL, '1988-01-11', NULL),
(75, 'Gabriel_Smitham34@gmail.com', 'YYCP2admg0JHF5g', 'Elaina52', '2023-06-05 20:44:24', NULL, '1987-02-24', NULL),
(76, 'Nelda_Lowe@yahoo.com', '7yUuqYgWMZNmQIp', 'SolonRunte', '2023-06-05 20:44:24', NULL, '1995-08-01', NULL),
(77, 'Autumn_Hackett21@yahoo.com', '4uc5dDAU7eFdSA9', 'HarleyKlein77', '2023-06-05 20:44:24', NULL, '1993-12-22', NULL),
(78, 'Yvonne_Volkman97@hotmail.com', 'ybTWH9TqwR5g1uo', 'Efrain18', '2023-06-05 20:44:24', NULL, '1982-10-10', NULL),
(79, 'Clyde42@hotmail.com', 'Bwrc8abtaVyszVn', 'Ansel69', '2023-06-05 20:44:24', NULL, '1997-08-10', NULL),
(80, 'Magali.Torphy@gmail.com', 'ii7LEMuxHfO79w9', 'ConnieGraham', '2023-06-05 20:44:24', NULL, '1988-12-11', NULL),
(81, 'Alivia0@gmail.com', 'Ybu4h0dns0vgoig', 'Evalyn57', '2023-06-05 20:44:24', NULL, '1994-05-10', NULL),
(82, 'Kenton.Douglas60@yahoo.com', 'gRPrW1F6QCJfFa6', 'Dixie89', '2023-06-05 20:44:24', NULL, '1986-03-05', NULL),
(83, 'Hellen_Schinner@hotmail.com', 'U5ETtSkjKcee3gU', 'RogelioSmitham', '2023-06-05 20:44:24', NULL, '1999-02-04', NULL),
(84, 'Gabriella10@gmail.com', '2ny3EopjThSEIR4', 'MittieMills30', '2023-06-05 20:44:24', NULL, '1991-11-22', NULL),
(85, 'Arlene23@hotmail.com', 'Tmy6b5oaT2267bS', 'Lenna34', '2023-06-05 20:44:24', NULL, '1986-10-20', NULL),
(86, 'Lynn.OKeefe@hotmail.com', 'QHvQ8d7nAGXc9GU', 'NicklausReinger', '2023-06-05 20:44:24', NULL, '1991-10-17', NULL),
(87, 'Adrien.Schmidt@gmail.com', '_YAYrBIki60tY5s', 'Sibyl74', '2023-06-05 20:44:24', NULL, '1996-10-21', NULL),
(88, 'Deion.Hayes@yahoo.com', '8NQrLBB825bjt17', 'RemingtonMcCullough', '2023-06-05 20:44:24', NULL, '1997-05-07', NULL),
(89, 'Nova.Pouros77@gmail.com', 'hv7C2OQPCW9lVf6', 'Vicente76', '2023-06-05 20:44:24', NULL, '1990-08-12', NULL),
(90, 'Shawn.Armstrong26@gmail.com', 'f2CCSE1Tpg7TZO7', 'Hannah27', '2023-06-05 20:44:24', NULL, '1983-05-27', NULL),
(91, 'Clinton_Lubowitz@yahoo.com', '8rqFcLPTwp49uop', 'BrandonSmitham', '2023-06-05 20:44:24', NULL, '1991-09-20', NULL),
(92, 'Rickey24@yahoo.com', 'xqq8zJwy5QYfaAB', 'LisaGreenholt34', '2023-06-05 20:44:24', NULL, '1983-10-27', NULL),
(93, 'Jaiden.Hoeger@yahoo.com', 'ONt7zZCka4R9Igb', 'CarletonRohan24', '2023-06-05 20:44:24', NULL, '1998-05-26', NULL),
(94, 'Maryam.Keeling@hotmail.com', 'dzRwPpmO2l5pBH9', 'Dannie16', '2023-06-05 20:44:24', NULL, '1985-11-02', NULL),
(95, 'Francesco.Parisian78@gmail.com', 'r7qnlWXP414O83s', 'DaltonFerry61', '2023-06-05 20:44:24', NULL, '1997-09-08', NULL),
(96, 'Jerrod_Hane@hotmail.com', 'n_AyKrLyOk5oI3q', 'Cindy22', '2023-06-05 20:44:24', NULL, '1986-11-02', NULL),
(97, 'Charlotte.Harvey40@gmail.com', 'ldweuYO_nEVoc5Q', 'Shana56', '2023-06-05 20:44:24', NULL, '1982-09-01', NULL),
(98, 'Eleanora.Pfannerstill9@hotmail.com', 'U3jo_Pvbppfc3vS', 'GianniWalsh51', '2023-06-05 20:44:24', NULL, '1996-03-14', NULL),
(99, 'Mohammad_Boyer@yahoo.com', 'H9KmhTR9q6SYBBL', 'Rachel44', '2023-06-05 20:44:24', NULL, '1996-06-07', NULL),
(100, 'Violette.Ratke28@gmail.com', 'WN6Vg9u0iXFvvtu', 'AndersonZboncak', '2023-06-05 20:44:24', NULL, '1985-04-03', NULL),
(101, 'Alexandre_Stamm@yahoo.com', 'Z1wiaz8j8Sei0CX', 'ArdenMurphy', '2023-06-05 20:44:24', NULL, '1993-08-10', NULL),
(102, 'Eleazar_Blanda21@gmail.com', '8QLdnAHIjWYKSB9', 'GwenWeimann78', '2023-06-05 20:44:24', NULL, '1984-12-13', NULL),
(103, 'Rowena_Schowalter83@hotmail.com', 'ypjWZ7pxD5zUIDk', 'StevieTrantow', '2023-06-05 20:44:24', NULL, '1983-03-01', NULL),
(104, 'Dejon86@hotmail.com', 'wgsEPAQeFkTzf7q', 'KaraWilderman', '2023-06-05 20:44:24', NULL, '1986-04-30', NULL),
(105, 'Malika_Carroll@gmail.com', 'D9EytRfqzQws3K5', 'EudoraRippin', '2023-06-05 20:44:24', NULL, '1989-05-25', NULL),
(106, 'Alfonzo_West82@gmail.com', 'qLWPVdal2Bo3Qyc', 'GeorgiannaSchroeder22', '2023-06-05 20:44:25', NULL, '1994-09-12', NULL),
(107, 'Minnie_Steuber@hotmail.com', 'wlwlfbfdzJ3xulU', 'Bernardo7', '2023-06-05 20:44:25', NULL, '1999-01-16', NULL),
(108, 'Amina_Cruickshank27@hotmail.com', '3SIJ2owju4Dgavw', 'Norma88', '2023-06-05 20:44:25', NULL, '1997-09-15', NULL),
(109, 'Douglas68@hotmail.com', 'hcouJnBd1390Tzk', 'WainoHowell', '2023-06-05 20:44:25', NULL, '1994-07-15', NULL),
(110, 'Sheridan.Price@hotmail.com', 'mcELlRcKr89EqUK', 'HadleySatterfield89', '2023-06-05 20:44:25', NULL, '1989-12-12', NULL),
(111, 'Louvenia.Olson@yahoo.com', 'YsC26qu4MNUa0gR', 'Adela98', '2023-06-05 20:44:25', NULL, '1989-10-04', NULL),
(112, 'Era_Crist74@gmail.com', 'anaZlUnNqgKr_2T', 'HeleneTreutel', '2023-06-05 20:44:25', NULL, '1997-05-16', NULL),
(113, 'Rudolph.Bartell@hotmail.com', 'EFC6Q91pUtif57Z', 'UriahVeum36', '2023-06-05 20:44:25', NULL, '1994-05-16', NULL),
(114, 'Rhiannon8@hotmail.com', 'z2uhCoUD_7kJi1b', 'RomainePurdy90', '2023-06-05 20:44:25', NULL, '1982-05-26', NULL),
(115, 'Ava.Wolf77@yahoo.com', 'bENgIZe3FupUQ6z', 'SheldonBailey86', '2023-06-05 20:44:25', NULL, '1984-07-08', NULL),
(116, 'Cordie_Kling@hotmail.com', 'A_SpMaOrEmcroES', 'Osvaldo93', '2023-06-05 20:44:25', NULL, '1997-03-18', NULL),
(117, 'Michele53@gmail.com', '4YkqTazh0_1iL57', 'Garland99', '2023-06-05 20:44:25', NULL, '1998-02-17', NULL),
(118, 'Michel94@hotmail.com', 'ce8aTAePc1Y64vS', 'IlianaJohnson44', '2023-06-05 20:44:25', NULL, '1989-04-24', NULL),
(119, 'Chaz.OReilly16@hotmail.com', '2Cc6ab6mldAk3OR', 'StantonCummerata', '2023-06-05 20:44:25', NULL, '1986-06-08', NULL),
(120, 'Flossie.McKenzie@yahoo.com', '31tN_NoPZ1488Y_', 'PhoebeRyan30', '2023-06-05 20:44:25', NULL, '1999-09-26', NULL),
(121, 'Wyman3@gmail.com', 'WteaTnuA3AakfUJ', 'Murphy70', '2023-06-05 20:44:25', NULL, '1996-09-22', NULL),
(122, 'Mireille_Gaylord47@hotmail.com', '9btsjQfN29Flrmr', 'Vladimir92', '2023-06-05 20:44:25', NULL, '1988-08-16', NULL),
(123, 'Kenya63@yahoo.com', 'AGe6tF7H5XZtWPi', 'Providenci63', '2023-06-05 20:44:25', NULL, '1985-12-01', NULL),
(124, 'Gustave_Koss@gmail.com', 'NCVWSawr1UxN5NL', 'ChanelStiedemann', '2023-06-05 20:44:25', NULL, '1998-02-22', NULL),
(125, 'Maud86@gmail.com', 'VxUaIB6HFKNSkAi', 'ImogeneCruickshank', '2023-06-05 20:44:25', NULL, '1994-01-05', NULL),
(126, 'Janiya13@gmail.com', '7Q83KQG5GpPg_RA', 'GreenKshlerin', '2023-06-05 20:44:25', NULL, '1995-09-05', NULL),
(127, 'Dell_Von54@yahoo.com', '944wD82e8Gzx46n', 'Elinore24', '2023-06-05 20:44:25', NULL, '1992-11-19', NULL),
(128, 'Norene_Cartwright@hotmail.com', '4QcgGYzY7gBzLmJ', 'ChrisAbernathy56', '2023-06-05 20:44:25', NULL, '1982-05-31', NULL),
(129, 'Ally41@yahoo.com', 'Dnx6pOkf_RiNG1P', 'Winnifred40', '2023-06-05 20:44:26', NULL, '1991-02-16', NULL),
(130, 'Maxie38@hotmail.com', 'Pgdkg6fzVKKphpB', 'GiovanniWhite', '2023-06-05 20:44:26', NULL, '1997-07-28', NULL),
(131, 'Juwan.Dicki@hotmail.com', 'uoZWZ7x9EuWRbQF', 'JammieNitzsche', '2023-06-05 20:44:26', NULL, '1982-07-26', NULL),
(132, 'Enola_Bartell@gmail.com', '975EMtqIf_LhR2W', 'AugustaConn19', '2023-06-05 20:44:26', NULL, '1995-01-12', NULL),
(133, 'America.Brekke@hotmail.com', 'WWEyyOZERTKhIAm', 'WillaGrady10', '2023-06-05 20:44:26', NULL, '1985-01-05', NULL),
(134, 'Theresa_Fay19@yahoo.com', 'CwA33lxzaTjT0Bp', 'Rosalinda70', '2023-06-05 20:44:26', NULL, '1983-12-16', NULL),
(135, 'Haven.Rice84@yahoo.com', 'v77vIPiLLW3YT7t', 'KarlieStrosin81', '2023-06-05 20:44:26', NULL, '1996-07-27', NULL),
(136, 'Geovany.Fahey76@yahoo.com', 'o_TLGFjgNohB7M7', 'GenovevaDicki', '2023-06-05 20:44:26', NULL, '1993-05-16', NULL),
(137, 'Chester_Pfeffer@hotmail.com', 'xIO1XBx5k5hII4U', 'MitchelMertz35', '2023-06-05 20:44:26', NULL, '1982-08-10', NULL),
(138, 'Moses.Runte@yahoo.com', 'qXfeS6NFTKfgrSI', 'BrennanSteuber', '2023-06-05 20:44:26', NULL, '1987-11-09', NULL),
(139, 'Marcelo.Walsh49@gmail.com', 'AIydg6XkY1NSyn_', 'HalieHeaney8', '2023-06-05 20:44:26', NULL, '1997-11-03', NULL),
(140, 'Princess_Schulist42@gmail.com', 'meKXiIfNjnw5frC', 'Edna59', '2023-06-05 20:44:26', NULL, '1990-12-21', NULL),
(141, 'Rachel39@hotmail.com', '06rI10yoNe_8GnZ', 'CesarBrekke', '2023-06-05 20:44:26', NULL, '1992-04-08', NULL),
(142, 'Kellie58@hotmail.com', 'vEAjUjTPVm5hWj4', 'Charlie41', '2023-06-05 20:44:26', NULL, '1987-02-12', NULL),
(143, 'Nestor_Schulist7@gmail.com', 'VNQoYmUVgSmFrlF', 'JoseBergstrom88', '2023-06-05 20:44:26', NULL, '1992-01-24', NULL),
(144, 'Antonio38@hotmail.com', 'bkbpYaKWD5rB3BT', 'Rhea2', '2023-06-05 20:44:26', NULL, '1986-03-06', NULL),
(145, 'Zola_Cormier@gmail.com', 'PIEERjkaVpswldV', 'KarlieSkiles92', '2023-06-05 20:44:26', NULL, '1998-08-23', NULL),
(146, 'Loren_Orn21@hotmail.com', 'cjFnnm8vhEqm6sl', 'JessycaHerman', '2023-06-05 20:44:26', NULL, '1982-06-07', NULL),
(147, 'Hayley74@yahoo.com', 'Zm7yrbFKnEpaUSI', 'OranMertz8', '2023-06-05 20:44:26', NULL, '1989-05-31', NULL),
(148, 'Leonie.Veum@hotmail.com', 'VjVukGVBIX_kgw_', 'NyahSpencer55', '2023-06-05 20:44:26', NULL, '1983-01-30', NULL),
(149, 'Constance.Heidenreich@gmail.com', 'NGv4jrY2W2BNBPj', 'Chase57', '2023-06-05 20:44:26', NULL, '1998-01-17', NULL),
(150, 'Mariela.Heidenreich4@yahoo.com', 'cxou_QH48UqBiPN', 'Rosalee38', '2023-06-05 20:44:26', NULL, '1987-05-06', NULL),
(151, 'Dario_Kulas@hotmail.com', '3JasX0EvLDhIEdk', 'Kenton12', '2023-06-05 20:44:26', NULL, '1984-03-28', NULL),
(152, 'Nathanial_Reilly@yahoo.com', 'oZGZtlWiJl3CFL_', 'KyraBosco98', '2023-06-05 20:44:26', NULL, '1984-03-07', NULL),
(153, 'Jadyn_Ritchie@hotmail.com', 'nFcdcgNddh6320h', 'Emmy90', '2023-06-05 20:44:26', NULL, '1996-06-20', NULL),
(154, 'Maxine17@hotmail.com', 'FDHrZvVJvrAdpUv', 'KelvinDaniel', '2023-06-05 20:44:26', NULL, '1989-06-10', NULL),
(155, 'Elliot.Schiller1@yahoo.com', 'buXp0FzoIH0uXXm', 'JoanieBerge', '2023-06-05 20:44:26', NULL, '1993-04-17', NULL),
(156, 'Enid.Hammes13@yahoo.com', 'wvGb4l5iLqLXx5h', 'ShanelJohns', '2023-06-05 20:44:26', NULL, '1996-12-04', NULL),
(157, 'Kay.Okuneva67@yahoo.com', 'IRRPjMXe_rHno8q', 'LinnieBartoletti87', '2023-06-05 20:44:27', NULL, '1996-02-02', NULL),
(158, 'Jess.Bartell28@yahoo.com', 'paGSmRpiJhUcMEG', 'Jermey81', '2023-06-05 20:44:27', NULL, '1994-09-03', NULL),
(159, 'Gennaro.Jerde@hotmail.com', 'IH5r7ra0eRPG45D', 'Rosella76', '2023-06-05 20:44:27', NULL, '1999-10-26', NULL),
(160, 'Ruthie.Wyman35@yahoo.com', 'GRz0zdUCnM6DZnC', 'Milo50', '2023-06-05 20:44:27', NULL, '1991-07-28', NULL),
(161, 'Otilia_Block@hotmail.com', '8YetUOawtdJu0yi', 'DanikaReinger18', '2023-06-05 20:44:27', NULL, '1985-06-10', NULL),
(162, 'Rae.Huels@yahoo.com', 'F1VhYQ4dwLggKLI', 'Kattie82', '2023-06-05 20:44:27', NULL, '1988-03-30', NULL),
(163, 'Andrew.Abbott@hotmail.com', 'LdNWlhJYdHydXU4', 'Helen50', '2023-06-05 20:44:27', NULL, '1984-02-09', NULL),
(164, 'Jazlyn_Stoltenberg@gmail.com', 'l2qz0cWGM1ifGkR', 'RaleighQuigley22', '2023-06-05 20:44:27', NULL, '1996-07-30', NULL),
(165, 'Isac42@yahoo.com', 'Hg_M8meIlnHzu8Z', 'ArielBahringer', '2023-06-05 20:44:27', NULL, '1997-03-14', NULL),
(166, 'Lloyd_Considine@hotmail.com', '5phQRGf4Uot72iS', 'Hiram91', '2023-06-05 20:44:27', NULL, '1991-10-28', NULL),
(167, 'Richmond.Quitzon11@hotmail.com', 'abammvOQ3ijRj8O', 'GinoWindler78', '2023-06-05 20:44:27', NULL, '1991-12-12', NULL),
(168, 'Pete_Nikolaus@hotmail.com', 'rJ6aSIC2QsNO7Ht', 'Emil37', '2023-06-05 20:44:27', NULL, '1992-03-01', NULL),
(169, 'Richie28@gmail.com', 'ZSc5TNcFnQVvfde', 'MayeSchaden7', '2023-06-05 20:44:27', NULL, '1996-12-19', NULL),
(170, 'Freida62@gmail.com', '4antDtKUvqTQyv7', 'Madison36', '2023-06-05 20:44:27', NULL, '1997-07-28', NULL),
(171, 'Megane.Bechtelar@gmail.com', 'qgLK7t_jlj3nIFX', 'NicoletteCasper34', '2023-06-05 20:44:27', NULL, '1998-04-06', NULL),
(172, 'Cristian53@yahoo.com', 'wWfFqS94ERJ3mVJ', 'Lawson95', '2023-06-05 20:44:27', NULL, '1993-12-16', NULL),
(173, 'Mariane.Daniel96@gmail.com', 'mWe6TBozHHU6jVf', 'Hulda36', '2023-06-05 20:44:27', NULL, '1984-12-30', NULL),
(174, 'Edwardo40@hotmail.com', 'I6f9LfkEyGLJIRu', 'JewelHarber93', '2023-06-05 20:44:27', NULL, '1988-09-24', NULL),
(175, 'Peggie.Muller21@yahoo.com', 'MnxrYmRaRXVFMgl', 'OfeliaSteuber', '2023-06-05 20:44:27', NULL, '1999-07-02', NULL),
(176, 'Vena9@hotmail.com', '1VJXsUprCQImVIU', 'KennediMayert', '2023-06-05 20:44:27', NULL, '1995-07-02', NULL),
(177, 'Enoch68@yahoo.com', 'n7pjPJGbmzkR5eD', 'RowlandQuigley', '2023-06-05 20:44:28', NULL, '1991-05-18', NULL),
(178, 'Dereck_DAmore73@hotmail.com', 'xfdf6z4Cp41i04k', 'CasandraMarvin90', '2023-06-05 20:44:28', NULL, '1989-08-27', NULL),
(179, 'Evan.Franecki8@gmail.com', '6yhW2vyebUoyony', 'Nigel20', '2023-06-05 20:44:28', NULL, '1999-03-19', NULL),
(180, 'Chanel_Nitzsche@yahoo.com', 'pJjTq5IbQFxEDWv', 'LukasArmstrong', '2023-06-05 20:44:28', NULL, '1997-12-11', NULL),
(181, 'Margarita71@hotmail.com', 'iOiEM1gW0mlg_Gz', 'Madilyn48', '2023-06-05 20:44:28', NULL, '1988-01-15', NULL),
(182, 'Julius_Fay@gmail.com', 'rcud5F6I8XDtUkp', 'EdmondEffertz', '2023-06-05 20:44:28', NULL, '1984-10-17', NULL),
(183, 'Elmira99@gmail.com', 'DOTgfQn9mrZMlFd', 'AylinMcClure72', '2023-06-05 20:44:28', NULL, '1984-01-13', NULL),
(184, 'Tessie96@yahoo.com', 'G7Y3vrH8Dzr7r5C', 'BlancheHeller', '2023-06-05 20:44:28', NULL, '1985-12-27', NULL),
(185, 'Zackary_McLaughlin55@hotmail.com', 'ar7QyvSwkRgMNet', 'Bill31', '2023-06-05 20:44:28', NULL, '1993-03-09', NULL),
(186, 'Juvenal59@gmail.com', 'AcgpnII_6BULuj8', 'EveDooley60', '2023-06-05 20:44:28', NULL, '1995-11-04', NULL),
(187, 'Napoleon79@hotmail.com', 'HqI4IukvF8zJSnM', 'ShayleeGerlach47', '2023-06-05 20:44:28', NULL, '1996-03-04', NULL),
(188, 'Eloisa_Skiles@gmail.com', 'slibjzY1ZZ1CdcQ', 'Kaylee18', '2023-06-05 20:44:28', NULL, '1983-03-24', NULL),
(189, 'Colton.Ernser59@yahoo.com', 'Tje_z0P29VbNc3h', 'Corine5', '2023-06-05 20:44:28', NULL, '1992-04-14', NULL),
(190, 'Godfrey5@hotmail.com', '8tbDajmIgvdXo0Q', 'CarlottaDare91', '2023-06-05 20:44:28', NULL, '1997-09-23', NULL),
(191, 'Kariane_Pfeffer@yahoo.com', '9J7cOqS54prxnrW', 'KaceyLarkin57', '2023-06-05 20:44:28', NULL, '1989-12-07', NULL),
(192, 'Dayton.Sporer35@hotmail.com', 'FGZ62fhTv6spbiE', 'BobbyGraham', '2023-06-05 20:44:28', NULL, '1982-10-21', NULL),
(193, 'Ludie.Kessler62@gmail.com', 'S06JYZDTl3mxZvt', 'JimmieWalter', '2023-06-05 20:44:28', NULL, '1987-10-31', NULL),
(194, 'Shaun37@yahoo.com', 'jVDLIUOLz2w3NF3', 'AracelyMiller', '2023-06-05 20:44:28', NULL, '1994-09-05', NULL),
(195, 'Eileen_Dach@gmail.com', 'BAsjmbx31hWCZwl', 'HazlePagac86', '2023-06-05 20:44:28', NULL, '1998-07-12', NULL),
(196, 'Van.Bartoletti16@gmail.com', 'xL6gmsjjTs_2Eho', 'Gideon7', '2023-06-05 20:44:28', NULL, '1995-10-09', NULL),
(197, 'Rosemary_Jast@hotmail.com', 'KJjvyhWMAlACtH0', 'RosellaBayer42', '2023-06-05 20:44:29', NULL, '1992-05-17', NULL),
(198, 'Sunny38@yahoo.com', 'JazqrfwwCIMs3it', 'AlKling', '2023-06-05 20:44:29', NULL, '1993-10-25', NULL),
(199, 'Alf_Schneider34@yahoo.com', 'iRGub_kFGypftRb', 'TrevionBlick28', '2023-06-05 20:44:29', NULL, '1996-04-19', NULL),
(200, 'Rebeka_Bartoletti@yahoo.com', 'OfvWrw3kslLSQtj', 'Anibal11', '2023-06-05 20:44:29', NULL, '1990-04-03', NULL),
(201, 'Daphney.Lebsack@hotmail.com', 'igogTQsvX6X7rIb', 'StanfordLynch21', '2023-06-05 20:44:29', NULL, '1990-06-08', NULL),
(202, 'Skye.Sipes@gmail.com', 'SeqzctlpUPP7qTs', 'Mikayla13', '2023-06-05 20:44:29', NULL, '1994-05-28', NULL),
(203, 'Rosalind50@yahoo.com', 'WZJwjIOZfYiZhHp', 'QuentinMraz', '2023-06-05 20:44:29', NULL, '1985-07-31', NULL),
(204, 'Rossie.Erdman21@gmail.com', 'CobxX6wrv5WIWGa', 'OleZieme40', '2023-06-05 20:44:29', NULL, '1997-01-04', NULL),
(205, 'Esmeralda_Hahn@gmail.com', 'XeCKZYBFEzkobaL', 'Jarred73', '2023-06-05 20:44:29', NULL, '1996-01-22', NULL),
(206, 'Crawford_Stamm@gmail.com', 'Ie2koH2ArnF2YIt', 'FlorenceGislason', '2023-06-05 20:44:29', NULL, '1982-04-16', NULL),
(207, 'Melvin_Breitenberg45@yahoo.com', 'QbfhUpLh_TROB5N', 'JarredKunde43', '2023-06-05 20:44:29', NULL, '1995-02-25', NULL),
(208, 'Dejah38@gmail.com', 'gob5Q2mHyPFRKaK', 'ZacharyConn', '2023-06-05 20:44:29', NULL, '1995-04-22', NULL),
(209, 'Maggie_Hoppe@hotmail.com', 'vmHPRQ3u8cLkqZ1', 'LyricKozey28', '2023-06-05 20:44:29', NULL, '1994-01-25', NULL),
(210, 'Heaven32@yahoo.com', 'YfgCkJxd572Ae24', 'VicenteWalter58', '2023-06-05 20:44:29', NULL, '1988-07-10', NULL),
(211, 'Rolando_Bashirian14@hotmail.com', 'Ki74Di4i2mRUhox', 'CaleighHayes50', '2023-06-05 20:44:29', NULL, '1984-09-29', NULL),
(212, 'Urban.Larkin98@gmail.com', '_QwGzYOHAr4TFNM', 'RafaelBerge72', '2023-06-05 20:44:29', NULL, '1982-03-10', NULL),
(213, 'Spencer.Kirlin33@gmail.com', 'nPVasg_pTB_g75F', 'ConnieHarber74', '2023-06-05 20:44:29', NULL, '1993-09-16', NULL),
(214, 'Maude_Nitzsche21@gmail.com', 'GR2bAlzgIaV2FpC', 'MelvinRussel47', '2023-06-05 20:44:29', NULL, '1983-07-27', NULL),
(215, 'Kaitlyn87@hotmail.com', 'Huc_eorMVt9rFwH', 'JettieJast79', '2023-06-05 20:44:29', NULL, '1996-03-03', NULL),
(216, 'Ethyl.Abbott@yahoo.com', 'xzJkJUSLfqC2Rv8', 'Corbin31', '2023-06-05 20:44:29', NULL, '1987-03-05', NULL),
(217, 'Johnathon.Christiansen@hotmail.com', 'nkcY7F0VBopG2Rr', 'Harmony31', '2023-06-05 20:44:29', NULL, '1989-08-24', NULL),
(218, 'Marcellus.Koch9@yahoo.com', 'fDF26bUBU7DBfdB', 'CoryBeer', '2023-06-05 20:44:29', NULL, '1999-04-14', NULL),
(219, 'Luigi.Simonis59@yahoo.com', 'UuM5cS_zSgZzxqJ', 'FreddyBednar61', '2023-06-05 20:44:30', NULL, '1991-02-28', NULL),
(220, 'Lewis_Hegmann51@hotmail.com', 'olrqtsYiEdooeTP', 'ErvinBogisich', '2023-06-05 20:44:30', NULL, '1995-09-27', NULL),
(221, 'Lauryn11@gmail.com', 'VCoceyBpEiUCz2b', 'WebsterLittel', '2023-06-05 20:44:30', NULL, '1985-05-24', NULL),
(222, 'Leonard_Daniel62@gmail.com', 'ZbDermQ4XYO2H5t', 'Brandt93', '2023-06-05 20:44:30', NULL, '1996-12-09', NULL),
(223, 'Brooks.Bogisich54@yahoo.com', 'P7u6p0W1i4aHimM', 'LexieEmmerich', '2023-06-05 20:44:30', NULL, '1992-08-20', NULL),
(224, 'Melisa_Barton27@gmail.com', 'McaUEGGKAoub1Co', 'Adeline85', '2023-06-05 20:44:30', NULL, '1995-05-22', NULL),
(225, 'Floyd_Gleason81@yahoo.com', '1GyGoYDq_LFH8K4', 'Lillian39', '2023-06-05 20:44:30', NULL, '1998-04-20', NULL),
(226, 'Rhea_Langosh@yahoo.com', 'Z6T9QlwOwo1aHYj', 'ShannaHalvorson63', '2023-06-05 20:44:30', NULL, '1998-08-05', NULL),
(227, 'Bette.Rogahn@yahoo.com', 'ud8N0sQY33ZsR1L', 'Dina86', '2023-06-05 20:44:30', NULL, '1985-05-14', NULL),
(228, 'Alexander64@hotmail.com', 'Qn0wsC8n0oSwm4w', 'PeterTremblay22', '2023-06-05 20:44:30', NULL, '1998-11-05', NULL),
(229, 'Maureen.Ryan18@yahoo.com', 'EoiiPlrYLu2Vlq8', 'SkylarRice11', '2023-06-05 20:44:30', NULL, '1996-02-28', NULL),
(230, 'Mona26@yahoo.com', '3JrRiCQQQ56DTZR', 'AgustinDeckow', '2023-06-05 20:44:30', NULL, '1986-05-23', NULL),
(231, 'Amira.Wehner31@yahoo.com', 'sENxj6c8E7AFhpU', 'LeopoldHammes11', '2023-06-05 20:44:30', NULL, '1993-12-05', NULL),
(232, 'Carole.Botsford7@gmail.com', 'GyjQ8YnxS88YQ72', 'TamiaKiehn66', '2023-06-05 20:44:30', NULL, '1984-06-26', NULL),
(233, 'Benjamin_Hickle19@yahoo.com', 'xWODWnzcpcKK2kd', 'JeromeHagenes', '2023-06-05 20:44:30', NULL, '1985-03-01', NULL),
(234, 'Aaron.Grimes@gmail.com', 'LFD8KIg9UEhN8mK', 'KendraHudson77', '2023-06-05 20:44:30', NULL, '1982-08-23', NULL),
(235, 'Janet.Murphy84@hotmail.com', 'VFaUicxAfbtTIim', 'AnthonyKub61', '2023-06-05 20:44:30', NULL, '1987-05-11', NULL),
(236, 'Anais32@gmail.com', 'UDzDNb4N5ebdxRj', 'Justus67', '2023-06-05 20:44:31', NULL, '1994-09-19', NULL),
(237, 'Pierce55@yahoo.com', '9Sqhl_o_uV8VAsq', 'HymanCasper11', '2023-06-05 20:44:31', NULL, '1996-04-09', NULL),
(238, 'Delia56@yahoo.com', '9AyDlBWLkrv2aaO', 'Tre10', '2023-06-05 20:44:31', NULL, '1982-11-18', NULL),
(239, 'Aleen.Hansen47@hotmail.com', 'PFmmdhNK74Kie5E', 'ThurmanSchuppe92', '2023-06-05 20:44:31', NULL, '1999-04-01', NULL),
(240, 'Antonietta14@hotmail.com', 'IQlzpFWAp5IA1Cl', 'Vince42', '2023-06-05 20:44:31', NULL, '1987-12-04', NULL),
(241, 'Jalon_Homenick52@hotmail.com', 'nOxc8REo3C3UfSY', 'DominiqueKilback', '2023-06-05 20:44:31', NULL, '1998-04-03', NULL),
(242, 'Camden_Nikolaus@yahoo.com', 'B3hBfuInKOW6spx', 'EthelKerluke', '2023-06-05 20:44:31', NULL, '1995-11-28', NULL),
(243, 'Rebekah.Considine@hotmail.com', '0b9snznuRwr9_lZ', 'RessieZemlak45', '2023-06-05 20:44:31', NULL, '1993-07-18', NULL),
(244, 'Kenna.Rippin@hotmail.com', 'r_0lEngddCtNYlG', 'RainaDare', '2023-06-05 20:44:31', NULL, '1998-03-27', NULL),
(245, 'Hilbert88@gmail.com', 'XAmDJ719LBOlvxT', 'AllieKihn60', '2023-06-05 20:44:31', NULL, '1988-08-02', NULL),
(246, 'Davon19@hotmail.com', 'w4IHVnvl8XMwGiK', 'JuwanJaskolski28', '2023-06-05 20:44:31', NULL, '1983-04-25', NULL),
(247, 'Nedra_Greenholt89@gmail.com', 'MfHVU32SAoVqAlc', 'Torrance57', '2023-06-05 20:44:31', NULL, '1986-07-29', NULL),
(248, 'Jamaal.Jakubowski66@yahoo.com', 'DFK4aUwi859o9zh', 'RaleighBatz37', '2023-06-05 20:44:31', NULL, '1984-03-06', NULL),
(249, 'Kyra_Schmeler@yahoo.com', 'RFAYb3E4h4AZ9VI', 'Morgan79', '2023-06-05 20:44:31', NULL, '1987-09-30', NULL),
(250, 'Jovany.Weissnat98@hotmail.com', 'A__OpEuG2QDVndQ', 'MargarettGoldner', '2023-06-05 20:44:31', NULL, '1991-03-10', NULL),
(251, 'Jewell_Smith@hotmail.com', 'Xl8ANxBb_RdaauF', 'LeanneKlocko', '2023-06-05 20:44:31', NULL, '1997-01-30', NULL),
(252, 'Alaina53@yahoo.com', 'fwW5HUn0f4HRlnY', 'MeredithKuhic51', '2023-06-05 20:44:31', NULL, '1994-08-08', NULL),
(253, 'Shanel_Kutch@gmail.com', 'qpkntD9B6JN0PCk', 'JacquesSchinner90', '2023-06-05 20:44:31', NULL, '1998-07-30', NULL),
(254, 'Matilde.Waelchi60@yahoo.com', 'WmgsFsrCfZo7K_k', 'Rhoda51', '2023-06-05 20:44:32', NULL, '1985-11-03', NULL),
(255, 'Susan27@hotmail.com', 'UsQTAPkKuolapDr', 'LonConsidine97', '2023-06-05 20:44:32', NULL, '1983-09-23', NULL),
(256, 'Sydnie_Schmeler@gmail.com', 'K3jbwH660Bd6rcI', 'Adah36', '2023-06-05 20:44:32', NULL, '1985-02-20', NULL),
(257, 'Lavada_Reichert34@yahoo.com', 'UODVBGoh5zyYCIw', 'NettieOKon', '2023-06-05 20:44:32', NULL, '1986-11-05', NULL),
(258, 'Guadalupe_Morar70@gmail.com', '3T2xHpRWMGv7mAw', 'CharleneSipes', '2023-06-05 20:44:32', NULL, '1992-08-22', NULL),
(259, 'Arielle98@hotmail.com', 'xW3A1r88Chn803F', 'MadgeBernier35', '2023-06-05 20:44:32', NULL, '1991-12-27', NULL),
(260, 'Kurt_Boehm@hotmail.com', 'XnLFLls2Ct8aqvr', 'LeaFisher', '2023-06-05 20:44:32', NULL, '1999-10-03', NULL),
(261, 'Vivianne40@yahoo.com', '8Olg3KlinFzSrg1', 'EwaldPagac', '2023-06-05 20:44:32', NULL, '1995-01-12', NULL),
(262, 'Maria_Schimmel56@hotmail.com', 'jn9jmq5T5VbUcgW', 'Brenden36', '2023-06-05 20:44:32', NULL, '1990-10-04', NULL),
(263, 'Pierce.OHara89@gmail.com', 'Yd4ryvY9YVA3iEK', 'CloydGleason50', '2023-06-05 20:44:32', NULL, '1984-11-28', NULL),
(264, 'Patrick17@hotmail.com', 'AgyisHUOPSwq5bH', 'BradlyQuigley', '2023-06-05 20:44:32', NULL, '1983-04-11', NULL),
(265, 'Betty.Leffler@gmail.com', 'GQozpIimpJuPUqH', 'HermanCrist', '2023-06-05 20:44:32', NULL, '1989-08-11', NULL),
(266, 'Dillan94@gmail.com', 'pFCKSaZrrjoSNmp', 'SavannahHodkiewicz31', '2023-06-05 20:44:32', NULL, '1983-09-30', NULL),
(267, 'Jewel.Toy0@yahoo.com', 'fbaeEduVwcUht65', 'MaximillianJaskolski91', '2023-06-05 20:44:33', NULL, '1996-10-07', NULL),
(268, 'Vena32@gmail.com', '_ffErnPOXyl8_3Q', 'HaileyBuckridge63', '2023-06-05 20:44:33', NULL, '1993-05-12', NULL),
(269, 'Liliane81@hotmail.com', '5WuLKo19xgLkSqg', 'MyrnaCarroll58', '2023-06-05 20:44:33', NULL, '1986-04-06', NULL),
(270, 'Susie_Pollich@yahoo.com', 'u9MXTdLbR9LFVS1', 'RitaHeidenreich', '2023-06-05 20:44:33', NULL, '1986-11-27', NULL),
(271, 'Makayla_Terry70@hotmail.com', 'fMJHjs8Vn23ETT0', 'ElianLang48', '2023-06-05 20:44:33', NULL, '1990-06-24', NULL),
(272, 'Leonora_Fahey56@gmail.com', 'LeFBH64j3zO_AwK', 'RobbKautzer50', '2023-06-05 20:44:33', NULL, '1999-07-11', NULL),
(273, 'Kiarra.Schamberger@gmail.com', '9Rfc5vMHWirx5RW', 'RichmondMoen56', '2023-06-05 20:44:33', NULL, '1999-05-15', NULL),
(274, 'Mertie_Strosin49@yahoo.com', 'o40Rhes0_JnVh3l', 'EddieBorer9', '2023-06-05 20:44:33', NULL, '1999-06-17', NULL),
(275, 'Kiarra_Zulauf16@hotmail.com', 'Xh_GiTkpb7zJbj7', 'Annette39', '2023-06-05 20:44:33', NULL, '1991-04-08', NULL),
(276, 'Adan.Schroeder18@yahoo.com', 'QPlYd4B1wwmetXI', 'PeteAdams', '2023-06-05 20:44:33', NULL, '1996-02-21', NULL),
(277, 'Leopold_Reichel33@hotmail.com', 'aFrpQALI7Z1a3U3', 'ShermanMcClure5', '2023-06-05 20:44:33', NULL, '1989-10-21', NULL),
(278, 'Ned.Senger91@hotmail.com', '23KUwpbHSzPaJqo', 'Maximillia0', '2023-06-05 20:44:33', NULL, '1998-08-10', NULL),
(279, 'Oceane21@hotmail.com', 'tEcjf8hGVAZy33k', 'DavonMayer19', '2023-06-05 20:44:33', NULL, '1992-01-14', NULL),
(280, 'Vivienne93@hotmail.com', 'FHQQBmS3RSleCYK', 'Gia75', '2023-06-05 20:44:33', NULL, '1986-07-21', NULL),
(281, 'Muriel84@hotmail.com', 'gcIGONoF1WTjZIA', 'UnaGreen', '2023-06-05 20:44:33', NULL, '1988-10-26', NULL),
(282, 'Tremayne75@gmail.com', 'HQ_ufdj38E6i7eN', 'JohannWilliamson21', '2023-06-05 20:44:33', NULL, '1986-08-22', NULL),
(283, 'Leatha64@yahoo.com', 'XdrIGr7CSY3OiDd', 'BlancheConnelly', '2023-06-05 20:44:33', NULL, '1986-08-28', NULL),
(284, 'Joshua.Dicki@gmail.com', 'UHVX3iKmaLSVTyp', 'PresleyMertz3', '2023-06-05 20:44:33', NULL, '1993-06-28', NULL),
(285, 'Cordie91@yahoo.com', 'URkN0H_5_tw093i', 'DaneMurray', '2023-06-05 20:44:33', NULL, '1985-07-24', NULL),
(286, 'Grant37@yahoo.com', 'KYI9oijKUsmcHhV', 'TiaraOndricka74', '2023-06-05 20:44:33', NULL, '1999-10-20', NULL),
(287, 'Yasmeen66@hotmail.com', 'xSFYZw6N5IDKd1v', 'AlaynaKerluke84', '2023-06-05 20:44:33', NULL, '1996-08-24', NULL),
(288, 'Bridget61@yahoo.com', 'hlK1EGidUSzcr1s', 'SalvadorSauer44', '2023-06-05 20:44:34', NULL, '1993-12-04', NULL),
(289, 'Adeline_Lubowitz28@gmail.com', 'DiZN9wYeJlznlgQ', 'Esther64', '2023-06-05 20:44:34', NULL, '1986-11-23', NULL),
(290, 'Antonio.Muller50@yahoo.com', 'QMF27aDugCbgpcC', 'Coty94', '2023-06-05 20:44:34', NULL, '1996-10-26', NULL),
(291, 'Rosendo_Durgan33@gmail.com', 'TWi_oatTH1aEY6a', 'Zena41', '2023-06-05 20:44:34', NULL, '1997-09-20', NULL),
(292, 'Alexandria12@hotmail.com', 'cBzx545pHAFnhWG', 'KiannaHintz52', '2023-06-05 20:44:34', NULL, '1984-08-02', NULL),
(293, 'Harrison.Hammes@hotmail.com', 'jzKq_9c18rUR6uL', 'TomasaQuitzon', '2023-06-05 20:44:34', NULL, '1986-01-19', NULL),
(294, 'Darlene_Feil44@hotmail.com', 'GUclgSlakqo7FOy', 'Carlotta92', '2023-06-05 20:44:34', NULL, '1984-03-29', NULL),
(295, 'Kiley50@hotmail.com', 'cYzUOJoFoIS1nKz', 'ElisabethGleason', '2023-06-05 20:44:34', NULL, '1995-06-06', NULL),
(296, 'Dessie.Schinner@gmail.com', 'Yj1282k6OpR71Ly', 'Gayle22', '2023-06-05 20:44:34', NULL, '1987-03-20', NULL),
(297, 'Jamel.Kunde@hotmail.com', 'MQe43wrN4gQydyQ', 'Rickie43', '2023-06-05 20:44:34', NULL, '1984-12-17', NULL),
(298, 'Marshall73@hotmail.com', '5lSSRK7QlQsMLnu', 'GarthKonopelski61', '2023-06-05 20:44:34', NULL, '1991-03-19', NULL),
(299, 'Nora.Vandervort@yahoo.com', 'r0dijZ8mvsukKkZ', 'Winston65', '2023-06-05 20:44:34', NULL, '1983-10-12', NULL),
(300, 'Andreanne.Keebler26@hotmail.com', 'yN2KKMF6g1kWOMb', 'ShaniyaMorar', '2023-06-05 20:44:34', NULL, '1986-01-08', NULL),
(301, 'Kenna38@yahoo.com', '3StaTSh1elDyJ5S', 'DamienKemmer74', '2023-06-05 20:44:34', NULL, '1991-07-20', NULL),
(302, 'Bethel26@hotmail.com', 'xaHcA7hEfOzKaq4', 'LavernaConsidine', '2023-06-05 20:44:34', NULL, '1982-05-07', NULL),
(303, 'Taylor_Gaylord@gmail.com', 'RehPNfry8xN4Omf', 'JorgeJones', '2023-06-05 20:44:34', NULL, '1985-09-11', NULL),
(304, 'Maurine28@gmail.com', 'ev08MLU2H2H9kVh', 'HayleeWillms48', '2023-06-05 20:44:34', NULL, '1987-05-31', NULL),
(305, 'Elsie_Treutel@gmail.com', 'dZ9jB4CiAwGUpNc', 'JovanCarter', '2023-06-05 20:44:35', NULL, '1995-09-08', NULL),
(306, 'Josh_Stoltenberg@gmail.com', 'uEAQXvmLyVRi57L', 'Werner79', '2023-06-05 20:44:35', NULL, '1997-02-25', NULL),
(307, 'Dane.Labadie@hotmail.com', 'dov0ElQSL4JM0Cv', 'Camron9', '2023-06-05 20:44:35', NULL, '1998-05-04', NULL),
(308, 'Isabelle.Lesch@gmail.com', '2ykrOAe5MGN30Pw', 'RahsaanSchamberger', '2023-06-05 20:44:35', NULL, '1995-05-23', NULL),
(309, 'Isaac_OConnell37@gmail.com', 'oJX7vxNEVB2dT0F', 'Johnpaul91', '2023-06-05 20:44:35', NULL, '1984-03-11', NULL),
(310, 'Kaelyn_Kovacek@gmail.com', 'QGb5gkTNoiaB1nE', 'Jose70', '2023-06-05 20:44:35', NULL, '1994-02-13', NULL),
(311, 'Ines_Murphy@hotmail.com', '0McCjsFS0TW7Mjv', 'DonnellBoehm72', '2023-06-05 20:44:35', NULL, '1993-11-09', NULL),
(312, 'Emmalee35@yahoo.com', '9QnmiTLRxXWBSAz', 'Harrison2', '2023-06-05 20:44:35', NULL, '1992-01-28', NULL),
(313, 'Nick18@yahoo.com', 'T6BodtDmpiV1t8i', 'SydneeWilkinson', '2023-06-05 20:44:35', NULL, '1983-02-02', NULL),
(314, 'Lyla33@hotmail.com', 'iUiv_C1rbnjY2iR', 'LindseyBeier', '2023-06-05 20:44:35', NULL, '1988-02-28', NULL),
(315, 'Mathilde_Wisozk@yahoo.com', 'pcMY3un8sXMRXuT', 'Brooke59', '2023-06-05 20:44:35', NULL, '1993-10-28', NULL),
(316, 'Enid80@yahoo.com', 'NnOW62b6vDxaSQn', 'Collin72', '2023-06-05 20:44:35', NULL, '1988-09-17', NULL),
(317, 'Luz94@yahoo.com', 'VBAJasFuae8gP_D', 'JudgeCorkery', '2023-06-05 20:44:35', NULL, '1996-11-22', NULL),
(318, 'Charity.Little57@gmail.com', 'oVY6uKe9umj0bKN', 'TiffanyHane', '2023-06-05 20:44:35', NULL, '1982-12-19', NULL),
(319, 'Nyah_Powlowski33@gmail.com', '5fkdLQ3_9ceTqSG', 'DavinLeannon', '2023-06-05 20:44:35', NULL, '1989-06-26', NULL),
(320, 'Dennis_Bogisich@gmail.com', 'fHLpxyGuND0erdY', 'Abdullah8', '2023-06-05 20:44:35', NULL, '1993-05-19', NULL),
(321, 'Nathaniel57@yahoo.com', 'Nah9ZJ7mMnasz8Y', 'LillaFritsch', '2023-06-05 20:44:35', NULL, '1982-03-14', NULL),
(322, 'Burdette_Hills@hotmail.com', 'nXCieyIEu9nEg0a', 'IzabellaBreitenberg', '2023-06-05 20:44:35', NULL, '1988-09-17', NULL),
(323, 'Angelo_Schulist3@gmail.com', 'EbPIuu0feL3glq5', 'Bonnie72', '2023-06-05 20:44:35', NULL, '1991-09-26', NULL),
(324, 'Winona_Schmeler45@yahoo.com', 'QE9XZ5zYboksj9c', 'ErikaGreenfelder', '2023-06-05 20:44:35', NULL, '1991-03-09', NULL),
(325, 'Aurore_Kris@hotmail.com', 'NTSTvgT0Rtnl02s', 'CorbinTrantow', '2023-06-05 20:44:36', NULL, '1995-09-30', NULL),
(326, 'Rashawn47@hotmail.com', 'dqRrGlZ1mX9Eohx', 'Garfield77', '2023-06-05 20:44:36', NULL, '1996-11-18', NULL),
(327, 'Cloyd.Barrows@hotmail.com', 'GQmNF3OYfLLNihj', 'FlorencioMorissette19', '2023-06-05 20:44:36', NULL, '1985-11-15', NULL),
(328, 'Alisha5@yahoo.com', 'YpEqbI6clWDWOku', 'Reece25', '2023-06-05 20:44:36', NULL, '1995-02-12', NULL),
(329, 'Delilah.Waters@gmail.com', 'B3Q9mXIYnLhwtsQ', 'DarianSawayn66', '2023-06-05 20:44:36', NULL, '1991-03-01', NULL),
(330, 'Zetta_Blanda@yahoo.com', 'vUQMc5iJ_5BgRd7', 'ReubenDaugherty84', '2023-06-05 20:44:36', NULL, '1999-10-07', NULL),
(331, 'Juliet_Marquardt@gmail.com', '6T3BEZUXm506FNn', 'AnahiKing', '2023-06-05 20:44:36', NULL, '1982-03-13', NULL),
(332, 'Hazle.Wintheiser@gmail.com', 'BN5wuuQ3hEAFXFq', 'MarleneSenger', '2023-06-05 20:44:36', NULL, '1998-07-24', NULL),
(333, 'Pat_Robel@hotmail.com', '5qQ4BpVJEq5ECm1', 'MarvinKlocko', '2023-06-05 20:44:36', NULL, '1987-08-28', NULL),
(334, 'Kennith_Witting37@gmail.com', 'DiZRffiB6aJGcqm', 'BettyeFeest23', '2023-06-05 20:44:36', NULL, '1997-09-28', NULL),
(335, 'Elian_Baumbach39@hotmail.com', 'Y40eHu8G82tuOk0', 'RansomRitchie13', '2023-06-05 20:44:36', NULL, '1982-03-27', NULL),
(336, 'Nichole.Crist@yahoo.com', 'ZFKy1cGedTtafU4', 'MikaylaPredovic', '2023-06-05 20:44:36', NULL, '1987-07-09', NULL),
(337, 'Jadyn.Prohaska@yahoo.com', 'jzlKF5ZzT9C_bzu', 'GunnerTremblay74', '2023-06-05 20:44:36', NULL, '1983-09-19', NULL),
(338, 'Marvin.Glover@hotmail.com', 'hrUbKbATpdW1w4K', 'Edna62', '2023-06-05 20:44:36', NULL, '1993-10-10', NULL),
(339, 'Selina62@hotmail.com', '4I9W8DscYjCzasd', 'CoralieOConnell74', '2023-06-05 20:44:36', NULL, '1996-03-02', NULL),
(340, 'Stephanie78@hotmail.com', 'naeZIklI7FoD_GD', 'JosueHackett24', '2023-06-05 20:44:36', NULL, '1994-07-17', NULL),
(341, 'Nasir34@hotmail.com', 'X2xQ9_44oo9ZG3u', 'JoshuaBoyle', '2023-06-05 20:44:36', NULL, '1992-08-05', NULL),
(342, 'Berniece.DuBuque@gmail.com', 'fMjniqUCczkyNGK', 'CordeliaCrist64', '2023-06-05 20:44:36', NULL, '1989-07-29', NULL),
(343, 'Carole.Cronin@hotmail.com', 'aY3vF_YDI9DOKFt', 'Susan62', '2023-06-05 20:44:36', NULL, '1985-03-16', NULL),
(344, 'Dayton76@hotmail.com', '0IUqQThC8cb0Cvf', 'KittyWest', '2023-06-05 20:44:37', NULL, '1983-01-18', NULL),
(345, 'Monique14@yahoo.com', 'hBcpr_kNNpBdm9A', 'DollySchmidt', '2023-06-05 20:44:37', NULL, '1985-05-08', NULL),
(346, 'Lilian82@yahoo.com', 'A8_mb5Woa9_pg9K', 'Van92', '2023-06-05 20:44:37', NULL, '1989-01-08', NULL),
(347, 'Melody_Maggio73@hotmail.com', 'L0JPgo6lApk3Kh2', 'BessieBode1', '2023-06-05 20:44:37', NULL, '1983-09-26', NULL),
(348, 'Gillian99@gmail.com', 'Vu8OCjHA4hLIxqm', 'Lou26', '2023-06-05 20:44:37', NULL, '1996-08-05', NULL),
(349, 'Joany_Hackett63@yahoo.com', 'XIxT_1pxcSJ6QEQ', 'Kathleen78', '2023-06-05 20:44:37', NULL, '1986-05-15', NULL),
(350, 'Athena.Renner@hotmail.com', 'e0c1e6RZMywj9VR', 'JeffZulauf', '2023-06-05 20:44:37', NULL, '1985-08-04', NULL),
(351, 'Lourdes.Brakus2@yahoo.com', 'gZL9pEBKeN4i7mD', 'Rhianna68', '2023-06-05 20:44:37', NULL, '1986-11-14', NULL),
(352, 'Makenna95@yahoo.com', '_fGwoYSNsx4Kip_', 'Shaina68', '2023-06-05 20:44:37', NULL, '1992-11-10', NULL),
(353, 'Amira.Wisoky@yahoo.com', '_nR26TEmWu1a48L', 'WilberCarter', '2023-06-05 20:44:37', NULL, '1998-06-03', NULL),
(354, 'Kristy_Dickens@hotmail.com', 'nfRaPmT1SlzXwdt', 'Kasey54', '2023-06-05 20:44:37', NULL, '1990-05-08', NULL),
(355, 'Rahsaan_Kerluke77@gmail.com', 'leJvnOeCipiMT1F', 'JensenMayert59', '2023-06-05 20:44:37', NULL, '1992-12-23', NULL),
(356, 'Gisselle_Kutch18@gmail.com', 'hA9OZ2hiH4AfZes', 'DenaWolf72', '2023-06-05 20:44:37', NULL, '1997-04-20', NULL),
(357, 'Alexie_Lindgren77@hotmail.com', 'kfJf0VzexP4B9qE', 'MajorLangosh37', '2023-06-05 20:44:37', NULL, '1984-04-08', NULL),
(358, 'Oleta.Toy@gmail.com', '4pUPGnqsgh8uZXm', 'Icie16', '2023-06-05 20:44:37', NULL, '1993-06-02', NULL),
(359, 'Chet74@yahoo.com', 'a81DzVA58uJgiwY', 'DaphneArmstrong', '2023-06-05 20:44:37', NULL, '1986-11-23', NULL),
(360, 'Emely_Greenholt96@gmail.com', 'WAC2Anel1aGOJXQ', 'MckaylaRohan61', '2023-06-05 20:44:37', NULL, '1987-03-02', NULL),
(361, 'Aidan32@yahoo.com', '1bH3u8leWcXMXDz', 'NoahMayer', '2023-06-05 20:44:37', NULL, '1984-06-17', NULL),
(362, 'Oma4@gmail.com', 'c259jQH2ckvVjLC', 'ShermanKuhic38', '2023-06-05 20:44:37', NULL, '1997-09-06', NULL),
(363, 'Johnpaul.Nader89@gmail.com', 'PxiqbR0kT191KJQ', 'NicoletteFranecki18', '2023-06-05 20:44:37', NULL, '1984-03-03', NULL),
(364, 'Brown_Cronin94@gmail.com', 'dasbd1RDOhKx7wj', 'KrystalMorissette', '2023-06-05 20:44:37', NULL, '1986-07-24', NULL),
(365, 'Keegan3@hotmail.com', 'LLq7i5XgxKOvih8', 'RettaMurray95', '2023-06-05 20:44:37', NULL, '1995-04-17', NULL),
(366, 'Harmony70@hotmail.com', 'jwsDXxs0XeicPuX', 'KaileeKuvalis91', '2023-06-05 20:44:38', NULL, '1982-05-24', NULL),
(367, 'Bella_Fisher@gmail.com', '4fYhwSKWNg8h3zW', 'Jarrett62', '2023-06-05 20:44:38', NULL, '1998-07-20', NULL),
(368, 'Petra_Wolff@gmail.com', '5j_YNJB7rVrd9e8', 'Jaquan59', '2023-06-05 20:44:38', NULL, '1997-01-24', NULL),
(369, 'Alfredo34@hotmail.com', 'eVF_HFoVJyvu0z1', 'NicholeZiemann42', '2023-06-05 20:44:38', NULL, '1991-04-05', NULL),
(370, 'Mariana.Wyman61@hotmail.com', 'BZflOAJuGVjOT_J', 'ChristopStroman', '2023-06-05 20:44:38', NULL, '1984-12-02', NULL),
(371, 'Malvina.Price17@hotmail.com', 'Y_M_JGCgJZii8W8', 'TomasVolkman25', '2023-06-05 20:44:38', NULL, '1999-03-19', NULL),
(372, 'Else18@yahoo.com', 'KeH90MUQ_H6yP3i', 'IdellaSpinka', '2023-06-05 20:44:38', NULL, '1987-05-15', NULL),
(373, 'Joany.Ruecker@gmail.com', 'EJWrPgUvBIePvTU', 'Laury3', '2023-06-05 20:44:38', NULL, '1984-11-17', NULL),
(374, 'Juwan11@gmail.com', 'S6KYEiv4YUUj6XF', 'SamsonHammes', '2023-06-05 20:44:38', NULL, '1993-09-22', NULL),
(375, 'Daphne.Kunze@hotmail.com', 'GGR7C4pphKcYzF6', 'Winston73', '2023-06-05 20:44:38', NULL, '1995-07-07', NULL),
(376, 'Missouri_Hand65@gmail.com', 'WWSR26oD4VyWlMP', 'ColtenSchuster11', '2023-06-05 20:44:38', NULL, '1997-07-29', NULL),
(377, 'Kiarra_Morar56@yahoo.com', 'Uh2uUL8yY2m0Era', 'ChristaTillman44', '2023-06-05 20:44:38', NULL, '1989-01-17', NULL),
(378, 'Antwan78@yahoo.com', 'o8FIFZG1j6Jyb8k', 'Reid51', '2023-06-05 20:44:38', NULL, '1994-01-30', NULL),
(379, 'Devan22@yahoo.com', 'U6tG46rodsXntZy', 'Jazmin67', '2023-06-05 20:44:38', NULL, '1997-12-06', NULL),
(380, 'Hildegard9@yahoo.com', 'n55zxObNoTHVaN4', 'BlaiseDenesik', '2023-06-05 20:44:38', NULL, '1991-12-07', NULL),
(381, 'Adella32@gmail.com', 'wMvMWz_wDLiICuw', 'BlazeRunte68', '2023-06-05 20:44:38', NULL, '1994-11-21', NULL),
(382, 'Shanelle_Parisian54@gmail.com', '3miktb5TFQka_1b', 'EllisBogan', '2023-06-05 20:44:38', NULL, '1984-02-19', NULL),
(383, 'Floyd.Gottlieb89@yahoo.com', 'BWK8jhuCyzl3V13', 'LorineJaskolski64', '2023-06-05 20:44:38', NULL, '1988-05-29', NULL),
(384, 'Alexandre_Koepp51@hotmail.com', 'e34UXmiZXIxGjDs', 'EmelyRippin', '2023-06-05 20:44:38', NULL, '1985-07-05', NULL),
(385, 'Keagan48@hotmail.com', 'IyAI7CW_b2h78Rb', 'OttisBarton', '2023-06-05 20:44:38', NULL, '1989-09-15', NULL),
(386, 'Hadley.Blick@gmail.com', 'ouopuVC5qOUw8kT', 'NedJohnston', '2023-06-05 20:44:38', NULL, '1983-08-02', NULL),
(387, 'Payton90@hotmail.com', 'v09GLruXL9YycLD', 'DewittKoelpin3', '2023-06-05 20:44:38', NULL, '1993-12-15', NULL),
(389, 'test@znertf', 'test', 'test', '2023-06-05 23:06:34', NULL, NULL, NULL),
(391, 'tet@znertf', 'test', 'tet', '2023-06-05 23:13:09', NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Structure de la table `users_followed_topics`
--

DROP TABLE IF EXISTS `users_followed_topics`;
CREATE TABLE IF NOT EXISTS `users_followed_topics` (
  `user_id` int NOT NULL,
  `topic_id` int NOT NULL,
  PRIMARY KEY (`user_id`,`topic_id`),
  KEY `topic_id` (`topic_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_bin;

--
-- Déchargement des données de la table `users_followed_topics`
--

INSERT INTO `users_followed_topics` (`user_id`, `topic_id`) VALUES
(1, 1),
(6, 2),
(5, 3),
(1, 4),
(4, 4);

-- --------------------------------------------------------

--
-- Structure de la table `users_messages_interactions`
--

DROP TABLE IF EXISTS `users_messages_interactions`;
CREATE TABLE IF NOT EXISTS `users_messages_interactions` (
  `user_id` int NOT NULL,
  `message_id` int NOT NULL,
  `status` varchar(32) COLLATE latin1_bin NOT NULL,
  PRIMARY KEY (`user_id`,`message_id`),
  KEY `message_id` (`message_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_bin;

--
-- Déchargement des données de la table `users_messages_interactions`
--

INSERT INTO `users_messages_interactions` (`user_id`, `message_id`, `status`) VALUES
(1, 1, 'like'),
(1, 2, 'upvote'),
(1, 3, 'like'),
(1, 4, 'downvote'),
(2, 3, 'upvote'),
(2, 4, 'downvote'),
(3, 5, 'upvote'),
(4, 1, 'like');

-- --------------------------------------------------------

--
-- Structure de la table `users_roles`
--

DROP TABLE IF EXISTS `users_roles`;
CREATE TABLE IF NOT EXISTS `users_roles` (
  `user_id` int NOT NULL,
  `role_id` int NOT NULL,
  PRIMARY KEY (`user_id`,`role_id`),
  KEY `role_id` (`role_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_bin;

--
-- Déchargement des données de la table `users_roles`
--

INSERT INTO `users_roles` (`user_id`, `role_id`) VALUES
(1, 1);

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `messages`
--
ALTER TABLE `messages`
  ADD CONSTRAINT `messages_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`),
  ADD CONSTRAINT `messages_ibfk_2` FOREIGN KEY (`topic_id`) REFERENCES `topic` (`id`);

--
-- Contraintes pour la table `messages_files`
--
ALTER TABLE `messages_files`
  ADD CONSTRAINT `messages_files_ibfk_1` FOREIGN KEY (`message_id`) REFERENCES `messages` (`id`),
  ADD CONSTRAINT `messages_files_ibfk_2` FOREIGN KEY (`file_id`) REFERENCES `files` (`id`);

--
-- Contraintes pour la table `roles_permissions`
--
ALTER TABLE `roles_permissions`
  ADD CONSTRAINT `roles_permissions_ibfk_1` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`),
  ADD CONSTRAINT `roles_permissions_ibfk_2` FOREIGN KEY (`permission_id`) REFERENCES `permissions` (`id`);

--
-- Contraintes pour la table `topic`
--
ALTER TABLE `topic`
  ADD CONSTRAINT `topic_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);

--
-- Contraintes pour la table `topic_tags`
--
ALTER TABLE `topic_tags`
  ADD CONSTRAINT `topic_tags_ibfk_1` FOREIGN KEY (`topic_id`) REFERENCES `topic` (`id`),
  ADD CONSTRAINT `topic_tags_ibfk_2` FOREIGN KEY (`tag_id`) REFERENCES `tag` (`id`);

--
-- Contraintes pour la table `users_followed_topics`
--
ALTER TABLE `users_followed_topics`
  ADD CONSTRAINT `users_followed_topics_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`),
  ADD CONSTRAINT `users_followed_topics_ibfk_2` FOREIGN KEY (`topic_id`) REFERENCES `topic` (`id`);

--
-- Contraintes pour la table `users_messages_interactions`
--
ALTER TABLE `users_messages_interactions`
  ADD CONSTRAINT `users_messages_interactions_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`),
  ADD CONSTRAINT `users_messages_interactions_ibfk_2` FOREIGN KEY (`message_id`) REFERENCES `messages` (`id`);

--
-- Contraintes pour la table `users_roles`
--
ALTER TABLE `users_roles`
  ADD CONSTRAINT `users_roles_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`),
  ADD CONSTRAINT `users_roles_ibfk_2` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
