-- phpMyAdmin SQL Dump
-- version 4.9.0.1
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Jun 04, 2020 at 11:27 AM
-- Server version: 5.7.24
-- PHP Version: 7.2.19

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `trymultiplescreen`
--

-- --------------------------------------------------------

--
-- Table structure for table `multiplescreens`
--

CREATE TABLE `multiplescreens` (
  `id` int(11) UNSIGNED NOT NULL,
  `screen1` varchar(50) DEFAULT NULL,
  `screen2` varchar(50) DEFAULT NULL,
  `screen3` varchar(50) DEFAULT NULL,
  `screen4` varchar(50) DEFAULT NULL,
  `user_id` int(11) UNSIGNED NOT NULL,
  `activescreen` varchar(191) DEFAULT NULL,
  `screen_1_used` varchar(100) NOT NULL DEFAULT 'NO',
  `screen_2_used` varchar(100) NOT NULL DEFAULT 'NO',
  `screen_3_used` varchar(100) NOT NULL DEFAULT 'NO',
  `screen_4_used` varchar(100) NOT NULL DEFAULT 'NO',
  `device_mac_1` varchar(100) DEFAULT NULL,
  `device_mac_2` varchar(100) DEFAULT NULL,
  `device_mac_3` varchar(100) DEFAULT NULL,
  `device_mac_4` varchar(100) DEFAULT NULL,
  `download_1` smallint(6) DEFAULT NULL,
  `download_2` smallint(6) DEFAULT NULL,
  `download_3` smallint(6) DEFAULT NULL,
  `download_4` smallint(6) DEFAULT NULL,
  `pkg_id` int(11) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COMMENT='Table for multiple screens for user ';

--
-- Indexes for dumped tables
--

--
-- Indexes for table `multiplescreens`
--
ALTER TABLE `multiplescreens`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `multiplescreens`
--
ALTER TABLE `multiplescreens`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
