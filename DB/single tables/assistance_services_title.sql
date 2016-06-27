-- phpMyAdmin SQL Dump
-- version 4.5.2
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Creato il: Giu 08, 2016 alle 15:15
-- Versione del server: 5.7.9
-- Versione PHP: 5.6.16

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `my_db`
--

-- --------------------------------------------------------

--
-- Struttura della tabella `assistance_services_title`
--

DROP TABLE IF EXISTS `assistance_services_title`;
CREATE TABLE IF NOT EXISTS `assistance_services_title` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `Service_id` int(11) NOT NULL,
  `Title` text NOT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=MyISAM AUTO_INCREMENT=8 DEFAULT CHARSET=latin1;

--
-- Dump dei dati per la tabella `assistance_services_title`
--

INSERT INTO `assistance_services_title` (`Id`, `Service_id`, `Title`) VALUES
(1, 1, 'Fisso'),
(2, 2, 'Fisso'),
(3, 2, 'Mobile'),
(4, 3, 'Smartphone e Tablet'),
(5, 3, 'Decoder e TV'),
(6, 4, 'TIMgames'),
(7, 4, 'TIMmusic');

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
