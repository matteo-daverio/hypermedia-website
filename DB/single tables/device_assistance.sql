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
-- Table structure for table `device_assistance`
--

DROP TABLE IF EXISTS `device_assistance`;
CREATE TABLE IF NOT EXISTS `device_assistance` (
  `id` int(6) unsigned NOT NULL AUTO_INCREMENT,
  `id_device` int(6) NOT NULL,
  `id_assistance` int(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=7 ;

--
-- Dumping data for table `device_assistance`
--

INSERT INTO `device_assistance` (`id`, `id_device`, `id_assistance`) VALUES
(1, 1, 11),
(2, 5, 12),
(3, 2, 13),
(4, 3, 13),
(5, 6, 14),
(6, 6, 15);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
