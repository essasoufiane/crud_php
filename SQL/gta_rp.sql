-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1:3306
-- Généré le : lun. 09 mai 2022 à 16:37
-- Version du serveur : 8.0.27
-- Version de PHP : 7.4.26

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données : `gta_rp`
--

-- --------------------------------------------------------

--
-- Structure de la table `addon_account`
--

DROP TABLE IF EXISTS `addon_account`;
CREATE TABLE IF NOT EXISTS `addon_account` (
  `name` varchar(60) COLLATE utf8mb4_general_ci NOT NULL,
  `label` varchar(100) COLLATE utf8mb4_general_ci NOT NULL,
  `shared` int NOT NULL,
  PRIMARY KEY (`name`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Structure de la table `addon_account_data`
--

DROP TABLE IF EXISTS `addon_account_data`;
CREATE TABLE IF NOT EXISTS `addon_account_data` (
  `id` int NOT NULL AUTO_INCREMENT,
  `account_name` varchar(100) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `money` int NOT NULL,
  `owner` varchar(100) COLLATE utf8mb4_general_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `index_addon_account_data_account_name_owner` (`account_name`,`owner`),
  KEY `index_addon_account_data_account_name` (`account_name`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Structure de la table `addon_inventory`
--

DROP TABLE IF EXISTS `addon_inventory`;
CREATE TABLE IF NOT EXISTS `addon_inventory` (
  `name` varchar(60) COLLATE utf8mb4_general_ci NOT NULL,
  `label` varchar(255) COLLATE utf8mb4_general_ci NOT NULL,
  `shared` int NOT NULL,
  PRIMARY KEY (`name`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Structure de la table `billing`
--

DROP TABLE IF EXISTS `billing`;
CREATE TABLE IF NOT EXISTS `billing` (
  `id` int NOT NULL AUTO_INCREMENT,
  `identifier` varchar(40) COLLATE utf8mb4_general_ci NOT NULL,
  `sender` varchar(40) COLLATE utf8mb4_general_ci NOT NULL,
  `target_type` varchar(50) COLLATE utf8mb4_general_ci NOT NULL,
  `target` varchar(40) COLLATE utf8mb4_general_ci NOT NULL,
  `label` varchar(255) COLLATE utf8mb4_general_ci NOT NULL,
  `amount` int NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Structure de la table `characters`
--

DROP TABLE IF EXISTS `characters`;
CREATE TABLE IF NOT EXISTS `characters` (
  `identifier` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `firstname` varchar(255) COLLATE utf8mb4_general_ci NOT NULL,
  `lastname` varchar(255) COLLATE utf8mb4_general_ci NOT NULL,
  `dateofbirth` varchar(255) COLLATE utf8mb4_general_ci NOT NULL,
  `sex` varchar(1) COLLATE utf8mb4_general_ci NOT NULL DEFAULT 'f',
  `height` varchar(128) COLLATE utf8mb4_general_ci NOT NULL,
  PRIMARY KEY (`identifier`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `characters`
--

INSERT INTO `characters` (`identifier`, `firstname`, `lastname`, `dateofbirth`, `sex`, `height`) VALUES
('steam:11000014a925488', '', '', '', '', '');

-- --------------------------------------------------------

--
-- Structure de la table `datastore`
--

DROP TABLE IF EXISTS `datastore`;
CREATE TABLE IF NOT EXISTS `datastore` (
  `name` varchar(60) COLLATE utf8mb4_general_ci NOT NULL,
  `label` varchar(100) COLLATE utf8mb4_general_ci NOT NULL,
  `shared` int NOT NULL,
  PRIMARY KEY (`name`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Structure de la table `datastore_data`
--

DROP TABLE IF EXISTS `datastore_data`;
CREATE TABLE IF NOT EXISTS `datastore_data` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(60) COLLATE utf8mb4_general_ci NOT NULL,
  `owner` varchar(40) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `data` longtext COLLATE utf8mb4_general_ci,
  PRIMARY KEY (`id`),
  UNIQUE KEY `index_datastore_data_name_owner` (`name`,`owner`),
  KEY `index_datastore_data_name` (`name`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Structure de la table `items`
--

DROP TABLE IF EXISTS `items`;
CREATE TABLE IF NOT EXISTS `items` (
  `name` varchar(50) COLLATE utf8mb4_general_ci NOT NULL,
  `label` varchar(50) COLLATE utf8mb4_general_ci NOT NULL,
  `limit` int NOT NULL DEFAULT '-1',
  `rare` int NOT NULL DEFAULT '0',
  `can_remove` int NOT NULL DEFAULT '1',
  PRIMARY KEY (`name`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Structure de la table `jobs`
--

DROP TABLE IF EXISTS `jobs`;
CREATE TABLE IF NOT EXISTS `jobs` (
  `name` varchar(50) COLLATE utf8mb4_general_ci NOT NULL,
  `label` varchar(50) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `SecondaryJob` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`name`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `jobs`
--

INSERT INTO `jobs` (`name`, `label`, `SecondaryJob`) VALUES
('unemployed', 'chômeur ', 0),
('unemployed2', 'Sans emplois', 0);

-- --------------------------------------------------------

--
-- Structure de la table `job_grades`
--

DROP TABLE IF EXISTS `job_grades`;
CREATE TABLE IF NOT EXISTS `job_grades` (
  `id` int NOT NULL AUTO_INCREMENT,
  `job_name` varchar(50) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `grade` int NOT NULL,
  `name` varchar(50) COLLATE utf8mb4_general_ci NOT NULL,
  `label` varchar(50) COLLATE utf8mb4_general_ci NOT NULL,
  `salary` int NOT NULL,
  `skin_male` longtext COLLATE utf8mb4_general_ci NOT NULL,
  `skin_female` longtext COLLATE utf8mb4_general_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `job_grades`
--

INSERT INTO `job_grades` (`id`, `job_name`, `grade`, `name`, `label`, `salary`, `skin_male`, `skin_female`) VALUES
(1, 'unemployed', 0, 'unemployed', 'Chomeur', 1000, '{}', '{}'),
(2, 'unemployed2', 0, 'rsa', 'Secondaire', 0, '{}', '{}');

-- --------------------------------------------------------

--
-- Structure de la table `licenses`
--

DROP TABLE IF EXISTS `licenses`;
CREATE TABLE IF NOT EXISTS `licenses` (
  `type` varchar(60) COLLATE utf8mb4_general_ci NOT NULL,
  `label` varchar(60) COLLATE utf8mb4_general_ci NOT NULL,
  PRIMARY KEY (`type`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Structure de la table `society_moneywash`
--

DROP TABLE IF EXISTS `society_moneywash`;
CREATE TABLE IF NOT EXISTS `society_moneywash` (
  `id` int NOT NULL AUTO_INCREMENT,
  `identifier` varchar(60) COLLATE utf8mb4_general_ci NOT NULL,
  `society` varchar(60) COLLATE utf8mb4_general_ci NOT NULL,
  `amount` int NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Structure de la table `users`
--

DROP TABLE IF EXISTS `users`;
CREATE TABLE IF NOT EXISTS `users` (
  `identifier` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `license` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL,
  `money` int DEFAULT NULL,
  `name` varchar(50) COLLATE utf8mb4_bin DEFAULT '',
  `skin` longtext COLLATE utf8mb4_bin,
  `job` varchar(50) COLLATE utf8mb4_bin DEFAULT 'unemployed',
  `job_grade` int DEFAULT '0',
  `job2` varchar(255) COLLATE utf8mb4_bin DEFAULT 'unemployed2',
  `job2_grade` int DEFAULT '0',
  `loadout` longtext COLLATE utf8mb4_bin,
  `position` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL,
  `bank` int DEFAULT NULL,
  `permission_level` int DEFAULT NULL,
  `group` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL,
  `firstname` varchar(50) COLLATE utf8mb4_bin DEFAULT '',
  `lastname` varchar(50) COLLATE utf8mb4_bin DEFAULT '',
  `dateofbirth` varchar(25) COLLATE utf8mb4_bin DEFAULT '',
  `sex` varchar(10) COLLATE utf8mb4_bin DEFAULT '',
  `height` varchar(5) COLLATE utf8mb4_bin DEFAULT '',
  PRIMARY KEY (`identifier`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

-- --------------------------------------------------------

--
-- Structure de la table `user_accounts`
--

DROP TABLE IF EXISTS `user_accounts`;
CREATE TABLE IF NOT EXISTS `user_accounts` (
  `id` int NOT NULL AUTO_INCREMENT,
  `identifier` varchar(22) COLLATE utf8mb4_general_ci NOT NULL,
  `name` varchar(50) COLLATE utf8mb4_general_ci NOT NULL,
  `money` double NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `user_accounts`
--

INSERT INTO `user_accounts` (`id`, `identifier`, `name`, `money`) VALUES
(1, 'steam:11000014a925488', 'black_money', 0);

-- --------------------------------------------------------

--
-- Structure de la table `user_inventory`
--

DROP TABLE IF EXISTS `user_inventory`;
CREATE TABLE IF NOT EXISTS `user_inventory` (
  `id` int NOT NULL AUTO_INCREMENT,
  `identifier` varchar(22) COLLATE utf8mb4_general_ci NOT NULL,
  `item` varchar(50) COLLATE utf8mb4_general_ci NOT NULL,
  `count` int NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Structure de la table `user_licenses`
--

DROP TABLE IF EXISTS `user_licenses`;
CREATE TABLE IF NOT EXISTS `user_licenses` (
  `id` int NOT NULL AUTO_INCREMENT,
  `type` varchar(60) COLLATE utf8mb4_general_ci NOT NULL,
  `owner` varchar(60) COLLATE utf8mb4_general_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Structure de la table `utilisateur`
--

DROP TABLE IF EXISTS `utilisateur`;
CREATE TABLE IF NOT EXISTS `utilisateur` (
  `id_user` int NOT NULL AUTO_INCREMENT,
  `nom` varchar(255) COLLATE utf8mb4_general_ci NOT NULL,
  `prenon` varchar(255) COLLATE utf8mb4_general_ci NOT NULL,
  `code_postal` int NOT NULL,
  `celibataire` tinyint(1) NOT NULL,
  `salaire` int DEFAULT NULL,
  `photo` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `loyauter` int NOT NULL,
  `date-creation` date NOT NULL,
  PRIMARY KEY (`id_user`)
) ENGINE=MyISAM AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
