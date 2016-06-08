-- phpMyAdmin SQL Dump
-- version 4.5.4.1deb2ubuntu1
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: Jun 08, 2016 at 06:17 PM
-- Server version: 5.7.12-0ubuntu1
-- PHP Version: 7.0.4-7ubuntu2.1

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
-- Table structure for table `sls_faq`
--

DROP TABLE IF EXISTS `sls_faq`;
CREATE TABLE `sls_faq` (
  `id` int(11) NOT NULL,
  `id_sls` int(11) NOT NULL,
  `faq_title` text NOT NULL,
  `faq_content` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `sls_faq`
--

INSERT INTO `sls_faq` (`id`, `id_sls`, `faq_title`, `faq_content`) VALUES
(0, 4, 'Il servizio ha scadenza?', 'No, una volta attivato non vi è una scadenza, sarà dunque possibile usufruire del servizio finche rimarrai in possesso di un dispositivo abilitato.'),
(0, 4, 'È possibile ricevere rimborsi in caso di problemi?', 'In generale non abbiamo una politica di "soddisfatto o rimborsato" ma ogni caso verrà valutato a sè.'),
(1, 0, 'Chi può scegliere TIMTag', 'L\'offerta è valida per i clienti ricaricabili, residenti nel territorio italiano e che ne fruiscano per scopi estranei alla loro eventuale attività imprenditoriale o professionale.'),
(2, 0, 'Cosa succede se recedo anticipatamente dall\'offerta TIMTag?', 'Il cliente potrà recedere in qualsiasi momento dall\'offerta chiamando il Servizio Clienti 119. A seguito del predetto recesso la TIM Card rimarrà attiva ed il cliente potrà continuare a fruire del relativo servizio telefonico ricaricabile. '),
(3, 0, 'Quale garanzia hanno i prodotti presenti Pack TIM Tag?', 'I prodotti commercializzati da TIM sono assistiti, per il periodo di vigenza della garanzia, direttamente dai costruttori tramite i loro Centri di Assistenza. Le condizioni di garanzia sono contenute all\'interno della confezione contenente il Modem Internet.\r\n'),
(4, 2, 'Quanto dura la garanzia?', ' La garanzia per vizi e/o difetti e/o malfunzionamenti decorre dalla consegna del Prodotto, \r\nha una validità di 2 (due) anni e \r\nviene \r\nassicurata da TIM\r\n, anche avvalendosi di \r\nsoggetti  terzi  da  essa  inca\r\nricati,  nell’ambito  del  territorio  italiano. '),
(5, 2, 'È possibile dismettere il servizio?', ' Il Cliente, in conformità alle disposizioni normative in materia di contratti a distanza e di contratti negoziati \r\nfuori dai locali commerciali, può esercitare anche il diritto di \r\nrecesso  nelle  forme  e  modalità  prev\r\niste  dagli\r\n  articoli  52  e  seguenti  del  D.Lgs  206/2005.'),
(6, 1, 'TODO', 'TODO'),
(7, 1, 'TODO', 'TODO');

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
