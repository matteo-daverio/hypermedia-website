-- phpMyAdmin SQL Dump
-- version 4.5.4.1deb2ubuntu1
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: Jun 05, 2016 at 07:35 PM
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
-- Table structure for table `sls`
--

DROP TABLE IF EXISTS `sls`;
CREATE TABLE `sls` (
  `id` int(11) NOT NULL,
  `titolo` varchar(50) NOT NULL,
  `tipo` varchar(50) NOT NULL,
  `promozione` tinyint(1) NOT NULL,
  `img_land` varchar(150) NOT NULL,
  `des_offerta` text NOT NULL,
  `des_img` varchar(150) NOT NULL,
  `des_specifiche` text NOT NULL,
  `act_act` text NOT NULL,
  `act_timricorda` text NOT NULL,
  `act_img` varchar(150) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `sls`
--

INSERT INTO `sls` (`id`, `titolo`, `tipo`, `promozione`, `img_land`, `des_offerta`, `des_img`, `des_specifiche`, `act_act`, `act_timricorda`, `act_img`) VALUES
(0, 'Test 0', 'salute_benessere', 1, '../images/smartLifeServices/salute_benessere_land.jpg', 'test offerta', '../images/smartLifeServices/salute_benessere/SonySmartbandFE.jpg', 'test specifiche', 'test act', 'test tim ricorda', '../images/smartLifeServices/salute_benessere/SonySmartbandFE.jpg'),
(1, 'Ihealth HS5 ', 'salute_benessere', 0, '../images/smartLifeServices/salute_benessere_land.jpg', 'Registra le calorie e le attività giornaliere, pianifica gli obiettivi di peso. Organizza le registrazioni, i grafici, lo storico delle letture e visualizza le tendenze ', '../images/smartLifeServices/salute_benessere/IhealthHS5.jpg', 'Bilancia digitale di alta qualità\r\n<br>\r\n&#10095; Compatibile con i dispositivi Apple iOS (versione iOS 5.0 o successiva)\r\n<br>\r\n&#10095;  Compatibile con i dispositivi Android (sistema operativo 3.0 o successivo)\r\n<br>\r\n&#10095;  Comprende un servizio gratuito iHealth Cloud.', 'Recarsi in un centro tim e richiedere l\'attivazione.\r\nSarà necessario acquistare il prodotto linkato.', '\r\n\r\niHEALTH ha sviluppato una linea di prodotti innovativi, per la gestione della salute personale su smartphone o tablet. I prodotti wireless iHealth con connessione bluetooth per iPad, iPhone, iPod e Android consentono di misurare facilmente, memorizzare e condividere immediatamente i risultati con la famiglia o il medico.\r\n<br>\r\nLa potente applicazione iHealth MyVitals permette di gestire tutti i dati relativi alla propria salute con grafici, statistiche e tendenze.\r\n<br>\r\nQuesta applicazione, unica nel suo genere, traccia la relazione tra vari parametri come la pressione sanguigna, il peso, l’apporto calorico e l’attività fisica. Compatibile con tutte le piattaforme Apple e Android. Comprende un servizio gratuito iHealth Cloud.', '../images/smartLifeServices/salute_benessere/IhealthHS5.jpg'),
(2, 'TIM vision ', 'tv_entertainment', 1, '../images/smartLifeServices/tv_entertainment_land.jpg', 'Scegli tra cinema, serie, cartoni e documentari, sempre on demand, per creare il tuo palinsesto TV senza interruzioni pubblicitarie.', '../images/smartLifeServices/tv_entertainment/tim_vision.png', '', '', 'Cartoni, cinema, serie tv, documentari e concerti sempre on demand per creare il tuo palinsesto senza pubblicità. Più di 8\'000 titoli in un abbonamento, senza vincoli di durata, anche in HD ', '../images/smartLifeServices/tv_entertainment/tim_vision.png'),
(4, 'Sony Smartband FE', 'salute_benessere', 0, '../images/smartLifeServices/salute_benessere_land.jpg', 'Un innovativo braccialetto da polso in grado di registrare automaticamente le tue attivit fisiche, sociali e di intrattenimento', '../images/smartLifeServices/salute_benessere/SonySmartbandFE.jpg', 'Un innovativo braccialetto da polso in grado di registrare automaticamente le tue attivit&agrave;\r\n fisiche, sociali e di intrattenimento\r\n\r\nUn innovativo braccialetto da polso in grado di registrare automaticamente le tue attivit&agrave;\r\n fisiche, sociali e di intrattenimento\r\n\r\nUn innovativo braccialetto da polso in grado di registrare automaticamente le tue attivit&agrave;\r\n fisiche, sociali e di intrattenimento', 'Recarsi a un centro tim e richiedere l\'attivazione.', 'Un innovativo braccialetto da polso in grado di registrare automaticamente le tue attività;\r\n fisiche, sociali e di intrattenimento\r\n\r\nUn innovativo braccialetto da polso in grado di registrare automaticamente le tue attivit fisiche, sociali e di intrattenimento', '../images/smartLifeServices/salute_benessere/SonySmartbandFE.jpg');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `sls`
--
ALTER TABLE `sls`
  ADD PRIMARY KEY (`id`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
