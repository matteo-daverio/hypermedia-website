-- phpMyAdmin SQL Dump
-- version 4.5.4.1deb2ubuntu1
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: Jun 05, 2016 at 07:39 PM
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
(0, 0, 'FAQ title 0', 'FAQ content 0'),
(1, 0, 'title 2', 'bla bla blabla bla blabla bla blabla bla blabla bla blabla bla blabla bla blabla bla bla'),
(3, 2, 'test', 'test content'),
(4, 4, 'Title sls 4', 'Content sls 4'),
(5, 1, 'Title sls 1', 'Content sls 1');

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
