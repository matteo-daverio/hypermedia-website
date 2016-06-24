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
-- Table structure for table `immaginiDevice`
--

DROP TABLE IF EXISTS `immaginiDevice`;
CREATE TABLE IF NOT EXISTS `immaginiDevice` (
  `id` int(6) unsigned NOT NULL AUTO_INCREMENT,
  `alt` varchar(150) NOT NULL,
  `frontImagePath` varchar(300) NOT NULL,
  `sideImagePath` varchar(300) DEFAULT NULL,
  `backImagePath` varchar(300) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=15 ;

--
-- Dumping data for table `immaginiDevice`
--

INSERT INTO `immaginiDevice` (`id`, `alt`, `frontImagePath`, `sideImagePath`, `backImagePath`) VALUES
(1, 'Iphone6s', 'images/dispositivi/iPhone6s1.png', 'images/dispositivi/iPhone6s2.png', 'images/dispositivi/iPhone6s3.png'),
(2, 'SamsungGalaxyS7Edge', 'images/dispositivi/samsungGalaxyS7Edge1.png', 'images/dispositivi/samsungGalaxyS7Edge2.png', 'images/dispositivi/samsungGalaxyS7Edge3.png'),
(8, 'Samsung Galaxy TabPro S 12', 'images/dispositivi/samsungGalaxyTabProS12_1.png', 'images/dispositivi/samsungGalaxyTabProS12_2.png', 'images/dispositivi/samsungGalaxyTabProS12_3.png'),
(3, 'Huawei P9 Plus', 'images/dispositivi/huaweiP9Plus1.png', NULL, NULL),
(4, 'Cordless Facile Maxi', 'images/dispositivi/cordlessFacileMaxi1.png', NULL, NULL),
(5, 'IPad Air 2', 'images/dispositivi/ipadAir2_1.png', NULL, NULL),
(6, 'Decoder TIMvision', 'images/dispositivi/decoderTimvision1.png', NULL, NULL),
(9, 'Olivetti My Way', 'images/dispositivi/olivettiMyWay1.png', NULL, NULL),
(10, 'Modem ADSL Wi-Fi', 'images/dispositivi/modemAdsl1.png', NULL, NULL),
(11, 'Polar Loop Activity Tracker', 'images/dispositivi/polarLoop1.png', NULL, NULL),
(12, 'Sony Smart Band Fifa Edition', 'images/dispositivi/smartBandSony1.png', NULL, NULL),
(13, 'Tim Tag', 'images/dispositivi/timTag1.png', NULL, NULL),
(14, 'Ihealth HS5', 'images/dispositivi/IhealthHS51.png', NULL, NULL),
(7, 'Samsung Smart TV 50  + Soundbar con TIMvision', 'images/dispositivi/samsungSmartTv1.png', 'images/dispositivi/samsungSmartTv2.png', NULL);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
