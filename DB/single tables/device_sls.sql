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
-- Table structure for table `device_sls`
--

DROP TABLE IF EXISTS `device_sls`;
CREATE TABLE IF NOT EXISTS `device_sls` (
  `id` int(6) unsigned NOT NULL AUTO_INCREMENT,
  `id_device` int(6) NOT NULL,
  `id_sls` int(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=7 ;

--
-- Dumping data for table `device_sls`
--

INSERT INTO `device_sls` (`id`, `id_device`, `id_sls`) VALUES
(1, 13, 0),
(2, 11, 1),
(3, 12, 1),
(4, 6, 2),
(5, 7, 2),
(6, 14, 4);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
