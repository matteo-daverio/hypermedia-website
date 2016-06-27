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
-- Struttura della tabella `assistance_services_element`
--

DROP TABLE IF EXISTS `assistance_services_element`;
CREATE TABLE IF NOT EXISTS `assistance_services_element` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `Subtitle_id` int(11) NOT NULL,
  `Element` text NOT NULL,
  `Link` int(11) NOT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=MyISAM AUTO_INCREMENT=21 DEFAULT CHARSET=latin1;

--
-- Dump dei dati per la tabella `assistance_services_element`
--

INSERT INTO `assistance_services_element` (`Id`, `Subtitle_id`, `Element`, `Link`) VALUES
(1, 1, 'Attivazione linea di casa', 1),
(2, 1, 'Variazione abbonamento', 2),
(3, 1, 'Restituzione prodotti', 3),
(4, 2, 'Disattivare i servizi di linea fissa', 4),
(5, 2, 'Gli elenchi telefonici a casa tua', 5),
(6, 3, 'Richiedere un rimborso', 6),
(7, 3, 'Conto Online: cosa cambia dal 1° febbraio 2016', 7),
(8, 4, 'Verifica credito e bonus disponibili', 8),
(9, 4, 'Promozioni e rinnovi automatici', 9),
(10, 5, 'Modalit&agrave; di pagamento della fattura', 10),
(11, 6, 'Configurazione Mail su iPhone', 11),
(12, 6, 'Configurazione Mail su iPad', 12),
(13, 6, 'Configurazione Mail su Android', 13),
(14, 7, 'Decoder TIMvision', 14),
(15, 7, 'TIMvision da web', 15),
(16, 8, 'Cos''&egrave; TIMgames', 16),
(17, 8, 'Tutti i modi per abbonarsi', 17),
(18, 9, 'Cos''&egrave; TIMmusic', 18),
(19, 9, '	\r\nTutti i modi per acquistare', 19),
(20, 9, 'Come ascolto in modalit&agrave; offline?', 20);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
