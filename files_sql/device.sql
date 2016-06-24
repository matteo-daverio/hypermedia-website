-- phpMyAdmin SQL Dump
-- version 4.1.7
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: Jun 24, 2016 at 05:50 PM
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
-- Table structure for table `device`
--

DROP TABLE IF EXISTS `device`;
CREATE TABLE IF NOT EXISTS `device` (
  `id` int(6) unsigned NOT NULL AUTO_INCREMENT,
  `nome` varchar(35) NOT NULL,
  `categoria` varchar(150) NOT NULL,
  `sottoCategoria` varchar(150) DEFAULT NULL,
  `gridImagePath` varchar(300) NOT NULL,
  `promo` tinyint(1) NOT NULL,
  `nuovo` tinyint(1) NOT NULL,
  `piuVenduto` tinyint(1) NOT NULL,
  `compraSubito` tinyint(1) DEFAULT '1',
  `aRate` tinyint(1) NOT NULL,
  `noleggio` tinyint(1) NOT NULL,
  `marca` varchar(100) NOT NULL,
  `prezzo` decimal(10,2) NOT NULL,
  `prezzoScontato` decimal(10,2) NOT NULL,
  `prezzoARate` varchar(100) NOT NULL,
  `prezzoANoleggio` decimal(10,2) NOT NULL,
  `descrizione` text NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=15 ;

--
-- Dumping data for table `device`
--

INSERT INTO `device` (`id`, `nome`, `categoria`, `sottoCategoria`, `gridImagePath`, `promo`, `nuovo`, `piuVenduto`, `compraSubito`, `aRate`, `noleggio`, `marca`, `prezzo`, `prezzoScontato`, `prezzoARate`, `prezzoANoleggio`, `descrizione`) VALUES
(1, 'Iphone6s', 'smartphone_telefoni', 'smartphone', 'images/grid200x276/iPhone6s1.png', 1, 0, 1, 1, 1, 1, 'Apple', 820.00, 800.00, '35.00 &euro; 24/mesi', 35.00, 'iPhone 6s mantiene tutte le caratteristiche che hanno reso straordinaria la generazione precedente di iPhone, e le spingono a un livello ancora pi&ugrave; avanzato. Viene realizzato in alluminio serie 7000, la lega pi&ugrave; robusta mai utilizzata per un iPhone. Il suo display Retina HD &egrave; fatto del vetro pi&ugrave; resistente che uno smartphone abbia mai avuto.'),
(2, 'Samsung Galaxy S7 Edge', 'smartphone_telefoni', 'smartphone', 'images/grid200x276/samsungGalaxyS7Edge1.png', 0, 1, 0, 1, 1, 0, 'Samsung', 820.00, 800.00, '35.00 &euro; 24/mesi', 35.00, 'Caratteristiche:'),
(3, 'Huawei P9 Plus', 'smartphone_telefoni', 'smartphone', 'images/grid200x276/huaweiP9Plus1.png', 1, 0, 0, 1, 1, 0, 'Huawei', 749.90, 650.00, '30.00 &euro; 24/mesi', 30.00, 'Caratteristiche:'),
(4, 'Cordless Facile Maxi', 'smartphone_telefoni', 'telefoni', 'images/grid200x276/cordlessFacileMaxi1.png', 0, 0, 0, 1, 0, 0, 'Tim', 35.90, 29.95, '5.00 &euro; 24/mesi', 5.00, 'Caratteristiche:'),
(5, 'IPad Air 2', 'tablet_computer', 'tablet', 'images/grid200x276/ipadAir2_1.png', 0, 1, 1, 1, 1, 0, 'Apple', 520.00, 450.00, '37.00 &euro; 24/mesi', 37.00, 'Caratteristiche:'),
(6, 'Decoder TIMvision', 'tv_smart_living', 'smart living', 'images/grid200x276/decoderTimVision.png', 0, 1, 1, 1, 0, 1, 'Tim', 49.00, 40.00, '15.00 &euro; 24/mesi', 2.00, 'Con il decoder TIMvision hai a disposizione pi&ugrave; di 8.000 titoli tra cartoni, film, serie e documentari sempre on demand per creare il tuo palinsesto senza interruzioni pubblicitarie. Puoi goderti la visione anche su Smart TV, su timvision.it e su app TIMvision per Smartphone, Tablet e PC, utilizzando le credenziali scelte al momento della registrazione al servizio TIMvision.'),
(7, 'Samsung Smart TV 50', 'tv_smart_living', 'tv', 'images/grid200x276/samsungSmartTv.png', 0, 1, 1, 1, 1, 0, 'Samsung', 936.00, 850.00, '40.00 &euro; 24/mesi', 15.00, 'Caratteristiche:'),
(8, 'Samsung Galaxy TabPro S 12', 'tablet_computer', 'computer', 'images/grid200x276/samsungGalaxyTabProS12_1.png', 0, 1, 1, 1, 1, 0, 'Samsung', 1299.90, 850.00, '35.00 &euro; 24/mesi', 35.00, 'Caratteristiche:'),
(9, 'Olivetti My Way', 'outlet', 'outlet', 'images/grid200x276/olivettiMyWay.png', 1, 0, 1, 1, 0, 0, 'Olivetti', 49.00, 19.00, '15.00 &euro; 24/mesi', 2.00, 'Caratteristiche:'),
(10, 'Modem ADSL Wi-Fi', 'modem_networking', 'modem', 'images/grid200x276/modemAdsl.png', 0, 1, 1, 1, 0, 1, 'Tim', 69.00, 59.00, '5.00 &euro; 24/mesi', 3.00, 'Caratteristiche:'),
(11, 'Polar Loop Activity Tracker', 'tv_smart_living', 'bracciali', 'images/grid200x276/polarLoop1.png', 0, 0, 1, 1, 0, 0, 'Polar', 99.90, 89.00, '4.00 &euro; 24/mesi', 5.00, 'Caratteristiche:'),
(12, 'Sony Smart Band Fifa Edition', 'tv_smart_living', 'bracciali', 'images/grid200x276/smartBandSony1.png', 1, 0, 1, 1, 0, 0, 'Sony', 79.90, 49.00, '3.50 &euro; 24/mesi', 3.00, 'Caratteristiche:'),
(13, 'Tim Tag', 'tv_smart_living', 'smart_living', 'images/grid200x276/timTag1.png', 1, 0, 1, 1, 0, 0, 'Tim', 129.90, 120.00, '5.00 &euro; 24/mesi', 5.00, 'Caratteristiche:'),
(14, 'Ihealth HS5', 'tv_smart_living', 'smart_living', 'images/grid200x276/IhealthHS5.png', 0, 0, 1, 1, 0, 0, 'iHealth', 119.90, 100.00, '5.00 &euro; 24/mesi', 5.00, 'Caratteristiche:');

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
