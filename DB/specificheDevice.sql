-- phpMyAdmin SQL Dump
-- version 4.1.7
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: Jun 24, 2016 at 05:51 PM
-- Server version: 5.6.29-log
-- PHP Version: 5.3.10

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `my_timhypermedia`
--

-- --------------------------------------------------------

--
-- Table structure for table `specificheDevice`
--

CREATE TABLE IF NOT EXISTS `specificheDevice` (
  `id` int(6) unsigned NOT NULL AUTO_INCREMENT,
  `titolo` varchar(150) NOT NULL,
  `dettaglio` varchar(300) NOT NULL,
  PRIMARY KEY (`id`,`titolo`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=15 ;

--
-- Dumping data for table `specificheDevice`
--

INSERT INTO `specificheDevice` (`id`, `titolo`, `dettaglio`) VALUES
(1, 'Colori:', 'Argento, oro, grigio siderale, oro rosa'),
(1, 'Capacit&agrave;:', '16GB 64GB 128GB'),
(1, 'Display:', 'Display Retina HD con 3D Touch Widescreen retroilluminato LED da 4,7'),
(1, 'Chip:', 'Chip A9 con architettura a 64 bit'),
(1, 'Fotocamera iSight:', 'Fotocamera iSight da 12 megapixel con pixel da 1,22&micro;'),
(1, 'Registrazione video:', 'Registrazione video 4K (3840x2160) a 30 fps'),
(1, 'Videocamera FaceTime HD:', 'Foto da 5 megapixel'),
(1, 'Touch ID:', 'Sensore di impronte digitali integrato nel tasto Home'),
(1, 'Geolocalizzazione:', 'GPS assistito e GLONASS'),
(2, 'Sistema Operativo:', 'Android 6.0'),
(2, 'Schermo:', '5.5&rsquo;&rsquo;'),
(2, 'Processore:', 'OctaCore (QuadCore 2.3 Ghz + QuadCore 1.6 Ghz)'),
(3, 'Sistema Operativo:', 'Android 6.0'),
(3, 'Schermo:', 'Full HD Amoled da 5.5&rsquo;&rsquo;'),
(3, 'Fotocamera:', 'Doppia Fotocamera Leica da 12 Mpxl Dual Flash + anteriore da 8 Mpxl'),
(3, 'Processore:', 'Kirin 955 - Octa-Core (4x2,5 GHz + 4x1,8 GHz)'),
(4, 'Schermo:', 'Ampio'),
(4, 'Tasti:', 'Grandi retroilluminati'),
(4, 'Risparmio energetico:', 'Tasto ECO mode plus per risparmio energetico'),
(6, 'Dimensioni (LxPxA):', '210 mm x 210 mm x 40 mm'),
(6, 'Processore:', 'Processore Intel ATOM CE 4230'),
(6, 'Confezione:', 'Decoder - Cavo alimentazione - Cavo HDMI - Telecomando universale - Batterie - Guida'),
(6, 'Connettivita:', 'HDMI 1.3 - Ethernet - Connessione Wireless 802.11 b/g/n'),
(6, 'Modalità Video PAL:', '576p - 720p - 1080i - 1080p'),
(7, 'Modello:', ' 50JU6400 - 50&ldquo;'),
(7, 'Display:', ' Ultra HD - 4K 3840 x 2160'),
(7, 'Soundbar:', ' HW-J250 inclusa'),
(8, 'Display:', ' 12&rdquo; FHD+, 2160x1440 SuperAmoled'),
(8, 'Sistema Operativo:', ' Windows 10 Pro'),
(8, 'Memoria interna:', ' 128GB SSD'),
(8, 'Fotocamera:', '(Front: 5 MP AF, Back: 5 MP )'),
(9, 'Modali&agrave; utilizzo:', ' Stampante, scanner, copiatrice'),
(9, 'Tecnologia:', ' ink-jet a colori'),
(9, 'Connettivit&agrave;:', ' Stampa via Bluetooth'),
(9, 'Opzioni:', ' Programmazione foto'),
(10, 'Navigazione:', ' senza fili pi&ugrave; veloce'),
(10, 'Connessione:', ' Connessione possibile con pi&ugrave; dispositivi'),
(10, 'Connettivit&agrave;:', ' Stampa via Bluetooth'),
(10, 'Risparmio energetico:', ' Funzione Eco per risparmio energetico'),
(11, 'Misura l’attivit&agrave; fisica:', ' 24h/24 - 7gg/7'),
(11, 'Conta passi', ''),
(11, 'Calcola le calorie consumate', ''),
(11, 'Monitoraggio attivit&agrave; del sonno', ''),
(11, 'Definisce obiettivi giornalieri personalizzati.', ''),
(12, 'Conta passi', ''),
(12, 'Calcola le calorie consumate', ''),
(12, 'Monitoraggio attivit&agrave; del sonno', ''),
(13, 'Resistente all’acqua', ''),
(13, 'Fornisce allarmi di movimento', ''),
(13, 'Batteria di lunga durata', ''),
(13, 'Dimensioni:', ' 49 x 47 x 17 mm'),
(14, 'Bilancia digitale di alta qualit&agrave;', ''),
(14, 'Compatibile con i dispositivi Apple iOS (versione iOS 5.0 o successiva)', ''),
(14, 'Compatibile con i dispositivi Android (sistema operativo 3.0 o successivo)', ''),
(14, 'Comprende un servizio gratuito iHealth Cloud.', '');

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
