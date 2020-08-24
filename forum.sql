-- phpMyAdmin SQL Dump
-- version 4.8.5
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3306
-- Generation Time: Aug 24, 2020 at 12:54 PM
-- Server version: 5.7.26
-- PHP Version: 7.2.18

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `forum`
--
CREATE DATABASE IF NOT EXISTS `forum` DEFAULT CHARACTER SET latin1 COLLATE latin1_swedish_ci;
USE `forum`;

-- --------------------------------------------------------

--
-- Table structure for table `comments`
--

DROP TABLE IF EXISTS `comments`;
CREATE TABLE IF NOT EXISTS `comments` (
  `cid` int(11) NOT NULL AUTO_INCREMENT,
  `uid` int(11) NOT NULL,
  `tid` int(11) NOT NULL,
  `date` datetime NOT NULL,
  `message` text NOT NULL,
  PRIMARY KEY (`cid`)
) ENGINE=MyISAM AUTO_INCREMENT=116 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `comments`
--

INSERT DELAYED INTO `comments` (`cid`, `uid`, `tid`, `date`, `message`) VALUES
(4, 14, 5, '2020-07-20 15:02:05', 'ggggggfggggggyftygty'),
(79, 5, 4, '2020-07-28 15:16:31', ''),
(106, 7, 6, '2020-08-07 17:10:10', 'skjdflksdjflksdjflksdjflksdjflksdjflksdjl'),
(81, 6, 4, '2020-08-06 16:20:00', 'dd'),
(107, 7, 6, '2020-08-07 17:10:44', ''),
(108, 7, 6, '2020-08-08 11:15:24', ''),
(109, 7, 6, '2020-08-08 11:15:27', ''),
(112, 1339, 1338, '2020-08-24 12:50:36', 'tgyuygtftgtftft'),
(114, 1339, 1341, '2020-08-24 14:08:16', 'salut'),
(115, 1340, 1341, '2020-08-24 14:19:20', 'Topic 2'),
(113, 1339, 1, '2020-08-24 13:19:24', 'Hello ');

-- --------------------------------------------------------

--
-- Table structure for table `conversations`
--

DROP TABLE IF EXISTS `conversations`;
CREATE TABLE IF NOT EXISTS `conversations` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nom` varchar(255) NOT NULL,
  `id_auteur` int(11) NOT NULL,
  `id_topic` int(11) NOT NULL,
  `creation` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `verrouillage` tinyint(1) NOT NULL DEFAULT '0',
  `epingle` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `id_topic` (`id_topic`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `conversations`
--

INSERT DELAYED INTO `conversations` (`id`, `nom`, `id_auteur`, `id_topic`, `creation`, `verrouillage`, `epingle`) VALUES
(1, 'Premiere conversation', 1, 1, '2019-12-17 19:39:41', 1, 1),
(2, 'Seconde conversation Ã©ditÃ©e', 1, 1, '2019-12-17 20:13:15', 1, 1),
(6, 'TroisiÃ¨me topic!', 1, 1, '2020-01-06 07:48:39', 0, 0),
(9, 'Conversation crÃ©e par un membre', 2, 1, '2020-01-08 18:18:52', 0, 0);

-- --------------------------------------------------------

--
-- Table structure for table `messages`
--

DROP TABLE IF EXISTS `messages`;
CREATE TABLE IF NOT EXISTS `messages` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `contenu` text NOT NULL,
  `id_auteur` int(11) NOT NULL,
  `id_conversation` int(11) NOT NULL,
  `time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `id_conversation` (`id_conversation`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `reaction`
--

DROP TABLE IF EXISTS `reaction`;
CREATE TABLE IF NOT EXISTS `reaction` (
  `reaction_id` int(11) NOT NULL AUTO_INCREMENT,
  `content_type` varbinary(25) NOT NULL,
  `message_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`reaction_id`)
) ENGINE=MyISAM AUTO_INCREMENT=61 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `reaction`
--

INSERT DELAYED INTO `reaction` (`reaction_id`, `content_type`, `message_id`, `user_id`) VALUES
(6, 0x6c696b65, 72, 6),
(24, 0x6c696b65, 81, 6),
(25, 0x6469736c696b65, 79, 6),
(36, 0x6c696b65, 106, 7),
(33, 0x6c696b65, 80, 7),
(38, 0x6c696b65, 110, 1339),
(39, 0x6469736c696b65, 110, 1339),
(40, 0x6c696b65, 111, 1339),
(41, 0x6469736c696b65, 111, 1339),
(53, 0x6469736c696b65, 113, 1339),
(44, 0x6469736c696b65, 112, 1339);

-- --------------------------------------------------------

--
-- Table structure for table `reactions`
--

DROP TABLE IF EXISTS `reactions`;
CREATE TABLE IF NOT EXISTS `reactions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_rang` int(11) NOT NULL,
  `rang` tinyint(1) NOT NULL,
  `id_utilisateur` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `id_message` (`id_rang`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `reply`
--

DROP TABLE IF EXISTS `reply`;
CREATE TABLE IF NOT EXISTS `reply` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `content` text NOT NULL,
  `uid` int(11) NOT NULL,
  `cid` int(11) NOT NULL,
  `time` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=56 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `reply`
--

INSERT DELAYED INTO `reply` (`id`, `content`, `uid`, `cid`, `time`) VALUES
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
(47, 'dd\r\n', 6, 79, '2020-08-06 16:20:00'),
(48, 'good man\r\n', 7, 85, '2020-08-07 15:15:15'),
(49, 'jlkjk', 7, 85, '2020-08-07 15:18:16'),
(50, 'dfgdfgdfg', 7, 106, '2020-08-07 17:10:43'),
(51, 'afldjkflksdjfslkdfjlksdfj', 1339, 110, '2020-08-24 11:20:40'),
(52, 'afldjkflksdjfslkdfjlksdfj', 1339, 110, '2020-08-24 11:20:40'),
(53, 'hi ', 1339, 111, '2020-08-24 12:23:38'),
(54, 'jhj', 1339, 113, '2020-08-24 13:19:45'),
(55, 'hey', 1339, 114, '2020-08-24 14:09:08');

-- --------------------------------------------------------

--
-- Table structure for table `subcategories`
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
-- Table structure for table `topics`
--

DROP TABLE IF EXISTS `topics`;
CREATE TABLE IF NOT EXISTS `topics` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nom` varchar(255) NOT NULL,
  `description` varchar(255) DEFAULT NULL,
  `rang_min` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1343 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `topics`
--

INSERT DELAYED INTO `topics` (`id`, `nom`, `description`, `rang_min`) VALUES
(1, 'Test', 'Description', 1),
(1337, 'admin', '', 1337),
(1338, 'zaef', 'ezaf', 2),
(1339, 'ee', 'eezeze', 3),
(1340, 'oooo', 'zzz', 3),
(1341, 'TEST', 'TEST', 1),
(1342, 'hey ', 'sdfksdjflksdjfksld', 4);

-- --------------------------------------------------------

--
-- Table structure for table `utilisateurs`
--

DROP TABLE IF EXISTS `utilisateurs`;
CREATE TABLE IF NOT EXISTS `utilisateurs` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(80) NOT NULL,
  `password` varchar(100) NOT NULL,
  `email` varchar(255) NOT NULL,
  `permission` int(10) NOT NULL DEFAULT '42',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=1343 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `utilisateurs`
--

INSERT DELAYED INTO `utilisateurs` (`id`, `username`, `password`, `email`, `permission`) VALUES
(1342, 'admin', '$2y$12$GBbtyGaTGENne.QgAtt3leMLwmNIe5JhOPf8OdwMiv4jDJbDe/B92', 'baktashwaqibeen12@gmail.com', 1);

--
-- Constraints for dumped tables
--

--
-- Constraints for table `conversations`
--
ALTER TABLE `conversations`
  ADD CONSTRAINT `conversations_ibfk_1` FOREIGN KEY (`id_topic`) REFERENCES `topics` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `messages`
--
ALTER TABLE `messages`
  ADD CONSTRAINT `messages_ibfk_1` FOREIGN KEY (`id_conversation`) REFERENCES `conversations` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `reactions`
--
ALTER TABLE `reactions`
  ADD CONSTRAINT `reactions_ibfk_1` FOREIGN KEY (`id_rang`) REFERENCES `messages` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `subcategories`
--
ALTER TABLE `subcategories`
  ADD CONSTRAINT `subcategories_ibfk_1` FOREIGN KEY (`parent_id`) REFERENCES `subcategories` (`subcat_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
