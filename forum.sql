-- phpMyAdmin SQL Dump
-- version 4.9.2
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1:3306
-- Généré le :  jeu. 06 août 2020 à 15:54
-- Version du serveur :  10.4.10-MariaDB
-- Version de PHP :  7.3.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données :  `forum`
--

-- --------------------------------------------------------

--
-- Structure de la table `comments`
--

DROP TABLE IF EXISTS `comments`;
CREATE TABLE IF NOT EXISTS `comments` (
  `cid` int(11) NOT NULL AUTO_INCREMENT,
  `uid` int(11) NOT NULL,
  `tid` int(11) NOT NULL,
  `date` datetime NOT NULL,
  `message` text NOT NULL,
  PRIMARY KEY (`cid`)
) ENGINE=MyISAM AUTO_INCREMENT=82 DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `comments`
--

INSERT INTO `comments` (`cid`, `uid`, `tid`, `date`, `message`) VALUES
(4, 14, 5, '2020-07-20 15:02:05', 'ggggggfggggggyftygty'),
(72, 5, 1, '2020-07-28 13:49:33', ''),
(79, 5, 4, '2020-07-28 15:16:31', ''),
(80, 5, 1, '2020-07-29 13:11:50', 'test'),
(26, 14, 6, '2020-07-21 16:26:06', 'hiiiiiiiiiii'),
(81, 6, 4, '2020-08-06 16:20:00', 'dd');

-- --------------------------------------------------------

--
-- Structure de la table `conversations`
--

DROP TABLE IF EXISTS `conversations`;
CREATE TABLE IF NOT EXISTS `conversations` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nom` varchar(255) NOT NULL,
  `id_auteur` int(11) NOT NULL,
  `id_topic` int(11) NOT NULL,
  `creation` datetime NOT NULL DEFAULT current_timestamp(),
  `verrouillage` tinyint(1) NOT NULL DEFAULT 0,
  `epingle` tinyint(1) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`),
  KEY `id_topic` (`id_topic`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `conversations`
--

INSERT INTO `conversations` (`id`, `nom`, `id_auteur`, `id_topic`, `creation`, `verrouillage`, `epingle`) VALUES
(1, 'Premiere conversation', 1, 1, '2019-12-17 19:39:41', 1, 1),
(2, 'Seconde conversation Ã©ditÃ©e', 1, 1, '2019-12-17 20:13:15', 1, 1),
(6, 'TroisiÃ¨me topic!', 1, 1, '2020-01-06 07:48:39', 0, 0),
(9, 'Conversation crÃ©e par un membre', 2, 1, '2020-01-08 18:18:52', 0, 0),
(10, 'C\'est pas mal par ici', 3, 4, '2020-01-08 18:21:32', 0, 0),
(11, 'whatsaupp', 4, 6, '2020-06-28 15:58:55', 0, 0);

-- --------------------------------------------------------

--
-- Structure de la table `messages`
--

DROP TABLE IF EXISTS `messages`;
CREATE TABLE IF NOT EXISTS `messages` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `contenu` text NOT NULL,
  `id_auteur` int(11) NOT NULL,
  `id_conversation` int(11) NOT NULL,
  `time` datetime NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`),
  KEY `id_conversation` (`id_conversation`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Structure de la table `reaction`
--

DROP TABLE IF EXISTS `reaction`;
CREATE TABLE IF NOT EXISTS `reaction` (
  `reaction_id` int(11) NOT NULL AUTO_INCREMENT,
  `content_type` varbinary(25) NOT NULL,
  `message_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`reaction_id`)
) ENGINE=MyISAM AUTO_INCREMENT=26 DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `reaction`
--

INSERT INTO `reaction` (`reaction_id`, `content_type`, `message_id`, `user_id`) VALUES
(6, 0x6c696b65, 72, 6),
(24, 0x6c696b65, 81, 6),
(25, 0x6469736c696b65, 79, 6);

-- --------------------------------------------------------

--
-- Structure de la table `reactions`
--

DROP TABLE IF EXISTS `reactions`;
CREATE TABLE IF NOT EXISTS `reactions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_rang` int(11) NOT NULL,
  `rang` tinyint(1) NOT NULL,
  `id_utilisateur` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `id_message` (`id_rang`)
) ENGINE=InnoDB AUTO_INCREMENT=29 DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Structure de la table `reply`
--

DROP TABLE IF EXISTS `reply`;
CREATE TABLE IF NOT EXISTS `reply` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `content` text NOT NULL,
  `uid` int(11) NOT NULL,
  `cid` int(11) NOT NULL,
  `time` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=48 DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `reply`
--

INSERT INTO `reply` (`id`, `content`, `uid`, `cid`, `time`) VALUES
(1, 'test', 1, 2, '2020-07-22 15:05:22'),
(2, 'dfsd ', 14, 31, '2020-07-22 15:07:20'),
(3, 'dfsd ', 14, 31, '2020-07-22 15:07:42'),
(4, 'fsafs', 14, 31, '2020-07-22 15:21:11'),
(5, 'kjjk', 14, 31, '2020-07-22 15:22:50'),
(6, 'fsdasd', 14, 30, '2020-07-22 15:22:57'),
(7, '', 14, 30, '2020-07-22 15:28:57'),
(8, '', 14, 30, '2020-07-22 15:29:02'),
(9, '', 14, 30, '2020-07-22 15:29:03'),
(10, '', 14, 30, '2020-07-22 15:29:04'),
(11, '', 14, 28, '2020-07-22 15:29:24'),
(12, '', 14, 28, '2020-07-22 15:29:25'),
(13, '', 14, 28, '2020-07-22 15:29:26'),
(14, '', 14, 31, '2020-07-22 15:29:37'),
(15, '', 14, 31, '2020-07-22 15:29:38'),
(16, '', 14, 31, '2020-07-22 15:29:38'),
(17, '', 14, 31, '2020-07-22 15:30:04'),
(18, '', 14, 31, '2020-07-22 15:30:06'),
(19, '', 14, 31, '2020-07-22 15:30:23'),
(20, 'zxcx', 14, 28, '2020-07-22 15:30:52'),
(21, 'hfaksjdhfksjdhfdksjfhdkjfhsdkjfhsdkj', 14, 31, '2020-07-22 15:31:44'),
(22, 'im fine thank you ', 14, 32, '2020-07-22 15:48:16'),
(23, 'no it will not work bro ', 14, 33, '2020-07-22 15:53:11'),
(24, 'why it will not work?', 14, 33, '2020-07-22 15:53:24'),
(25, 'jlkjkl', 14, 33, '2020-07-22 16:08:00'),
(26, 'jhjh', 14, 33, '2020-07-22 16:08:29'),
(27, 'jsdlkfjsdlkfjsdlkfjsdklfjlsdkjsdlkfjsdlkfjsdlkfjsdklfjlsdkjsdlkfjsdlkfjsdlkfjsdklfjlsdkjsdlkfjsdlkfjsdlkfjsdklfjlsdkjsdlkfjsdlkfjsdlkfjsdklfjlsdkjsdlkfjsdlkfjsdlkfjsdklfjlsdkjsdlkfjsdlkfjsdlkfjsdklfjlsdk', 14, 34, '2020-07-22 16:40:33'),
(28, 'zdfdsfdskfjlksdjflsdkfjsdlkzdfdsfdskfjlksdjflsdkfjsdlkzdfdsfdskfjlksdjflsdkfjsdlkzdfdsfdskfjlksdjflsdkfjsdlkzdfdsfdskfjlksdjflsdkfjsdlk', 14, 34, '2020-07-22 16:41:14'),
(29, 'akfjalskfjldksfjsdlkfjsdlkakfjalskfjldksfjsdlkfjsdlkakfjalskfjldksfjsdlkfjsdlkakfjalskfjldksfjsdlkfjsdlk', 14, 34, '2020-07-22 16:44:23'),
(30, 'Le Lorem Ipsum est simplement du faux texte employÃ© dans la composition et la mise en page avant impression.\r\n\r\n', 14, 36, '2020-07-22 16:51:26'),
(31, 'jhjhj', 14, 37, '2020-07-22 17:46:59'),
(32, 'not really acually ', 14, 49, '2020-07-23 10:58:34'),
(33, 'not really ', 14, 50, '2020-07-23 10:59:08'),
(34, 'okay fuck off', 14, 52, '2020-07-23 11:20:44'),
(35, 'not it will not actually', 14, 53, '2020-07-23 11:29:42'),
(36, 'sjdflksdjfkldlkfj', 14, 59, '2020-07-23 15:08:54'),
(37, 'this is not a comment', 14, 64, '2020-07-23 15:16:50'),
(38, 'zcvdxv', 14, 66, '2020-07-24 14:32:59'),
(39, 'tfd', 4, 67, '2020-07-27 11:59:58'),
(40, 'hjhjkh', 5, 69, '2020-07-27 13:51:21'),
(41, 'SDFSDF', 3, 70, '2020-07-27 14:50:45'),
(42, 'my name is Alex', 5, 71, '2020-07-28 13:50:01'),
(43, 'Since how long you living in this city ', 5, 71, '2020-07-28 13:50:23'),
(44, 'i dont know since very long time', 5, 71, '2020-07-28 13:50:38'),
(45, 'ok', 5, 80, '2020-07-29 13:15:02'),
(46, 'okiiii', 5, 80, '2020-07-29 13:16:13'),
(47, 'dd\r\n', 6, 79, '2020-08-06 16:20:00');

-- --------------------------------------------------------

--
-- Structure de la table `subcategories`
--

DROP TABLE IF EXISTS `subcategories`;
CREATE TABLE IF NOT EXISTS `subcategories` (
  `subcat_id` int(3) NOT NULL AUTO_INCREMENT,
  `parent_id` int(3) NOT NULL,
  `subcategories_title` varchar(128) NOT NULL,
  `subcategories_desc` int(255) NOT NULL,
  PRIMARY KEY (`subcat_id`),
  KEY `parent_id` (`parent_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Structure de la table `topics`
--

DROP TABLE IF EXISTS `topics`;
CREATE TABLE IF NOT EXISTS `topics` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nom` varchar(255) NOT NULL,
  `description` varchar(255) DEFAULT NULL,
  `rang_min` int(11) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `topics`
--

INSERT INTO `topics` (`id`, `nom`, `description`, `rang_min`) VALUES
(1, 'Test', 'Description', 1),
(4, 'Visiteurs', 'Bienvenue !', 0),
(5, 'Admins seulement', 'Top secret!', 3),
(6, 'Coucou', 'Toto', 1);

-- --------------------------------------------------------

--
-- Structure de la table `utilisateurs`
--

DROP TABLE IF EXISTS `utilisateurs`;
CREATE TABLE IF NOT EXISTS `utilisateurs` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(80) NOT NULL,
  `password` varchar(100) NOT NULL,
  `email` varchar(255) NOT NULL,
  `permission` int(10) NOT NULL DEFAULT 1,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `utilisateurs`
--

INSERT INTO `utilisateurs` (`id`, `username`, `password`, `email`, `permission`) VALUES
(1, 'baktash', '$2y$12$jwHjo3TK8kpjS7tSg7xa0.uIXGqWhP2dvQx7YfPXKYVs1DN35Mz6W', 'clement.caillat@laplateforme.io', 1337),
(2, 'bak', '$2y$12$FJC4ZPFn5A4cig4tZx3zteHfFbzLCmR1E9jAjZDcXEieV.BfUYd5W', 'baktashwaqibeen12@gmail.com', 1),
(3, 'adrien', '$2y$12$z3iGTI2oAxCfn/QoHlhxxuUj1mOb/DOORBfvFUudXKLZHp2NODeSm', 'adrien1361@gmail.com', 1337),
(4, 'baki', '$2y$12$3yy9AdvgR16TC1xvwS768.tSIvxjKdaqOTLAy/Qj/UZGeu/oFapmC', 'baktashw@yahoo.com', 1),
(5, 'bakibaki', '$2y$12$61.PJW1BJ4bYSSYDF4FF7.bwC2xcYg00dJvNm1kv.va8OxAZ9uXqy', 'baktashw@yahoo.com', 1),
(6, 'so', '$2y$12$mBXsZdavGHl65bHP2oZ0iue0YvlW0XndC2DtWSrAMy.0T4/9Ht/0i', 'so@gmail.com', 1);

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `conversations`
--
ALTER TABLE `conversations`
  ADD CONSTRAINT `conversations_ibfk_1` FOREIGN KEY (`id_topic`) REFERENCES `topics` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Contraintes pour la table `messages`
--
ALTER TABLE `messages`
  ADD CONSTRAINT `messages_ibfk_1` FOREIGN KEY (`id_conversation`) REFERENCES `conversations` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Contraintes pour la table `reactions`
--
ALTER TABLE `reactions`
  ADD CONSTRAINT `reactions_ibfk_1` FOREIGN KEY (`id_rang`) REFERENCES `messages` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Contraintes pour la table `subcategories`
--
ALTER TABLE `subcategories`
  ADD CONSTRAINT `subcategories_ibfk_1` FOREIGN KEY (`parent_id`) REFERENCES `subcategories` (`subcat_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
