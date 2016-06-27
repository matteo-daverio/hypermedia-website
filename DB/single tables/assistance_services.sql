-- phpMyAdmin SQL Dump
-- version 4.5.2
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Creato il: Giu 08, 2016 alle 15:14
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
-- Struttura della tabella `assistance_services`
--

DROP TABLE IF EXISTS `assistance_services`;
CREATE TABLE IF NOT EXISTS `assistance_services` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `Service` text NOT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;

--
-- Dump dei dati per la tabella `assistance_services`
--

INSERT INTO `assistance_services` (`Id`, `Service`) VALUES
(1, 'Gestione Linea e Servizi'),
(2, 'Controllo Costi e Pagamenti'),
(3, 'Supporto Tecnico e Configurazione'),
(4, 'Contenuti e Smart Life');

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
