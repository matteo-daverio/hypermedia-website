-- phpMyAdmin SQL Dump
-- version 4.5.2
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Creato il: Giu 09, 2016 alle 09:34
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
-- Struttura della tabella `highlights`
--

DROP TABLE IF EXISTS `highlights`;
CREATE TABLE IF NOT EXISTS `highlights` (
  `Id` int(11) NOT NULL,
  `Title` text NOT NULL,
  `Description` text NOT NULL,
  `Link` int(11) NOT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dump dei dati per la tabella `highlights`
--

INSERT INTO `highlights` (`Id`, `Title`, `Description`, `Link`) VALUES
(1, 'Highlights', 'Attivazione linea di casa', 1),
(2, 'Highlights', 'Configurazione Mail su iPhone', 11),
(3, 'Highlights', 'Decoder TIMvision', 14),
(4, 'Highlights', 'Configurazione Mail su Android', 13),
(5, 'Highlights', 'Cos’è TIMgames', 16),
(6, 'Highlights', 'Verifica credito e bonus disponibili', 8),
(7, 'Highlights', 'Cos''è TIMmusic', 18),
(8, 'Highlights', 'Modalità di pagamento della fattura', 10),
(9, 'Highlights', 'Richiedere un rimborso', 6),
(10, 'Highlights', 'Disattivare i servizi di linea fissa', 4);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
