-- phpMyAdmin SQL Dump
-- version 4.9.1
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Feb 05, 2020 at 07:25 AM
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
-- Database: `dump_2.7`
--

-- --------------------------------------------------------

--
-- Table structure for table `adsenses`
--

CREATE TABLE `adsenses` (
  `id` int(11) NOT NULL,
  `code` longtext NOT NULL,
  `status` tinyint(1) NOT NULL,
  `ishome` tinyint(1) NOT NULL,
  `isviewall` tinyint(1) NOT NULL,
  `issearch` tinyint(1) NOT NULL,
  `iswishlist` tinyint(1) NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `adsenses`
--

INSERT INTO `adsenses` (`id`, `code`, `status`, `ishome`, `isviewall`, `issearch`, `iswishlist`, `created_at`, `updated_at`) VALUES
(1, '<script type=\"text/javascript\">\r\n    google_ad_client = \"ca-pub-51*****673\";  \r\n    google_ad_slot = \"59*****49\"; \r\n    google_ad_width = 728;\r\n    google_ad_height =  90; \r\n \r\n    </script>', 0, 0, 0, 0, 0, '2019-09-09 12:43:44', '2019-12-28 06:19:03');

-- --------------------------------------------------------

--
-- Table structure for table `blogs`
--

CREATE TABLE `blogs` (
  `id` int(13) NOT NULL,
  `user_id` int(11) NOT NULL,
  `title` varchar(60) NOT NULL,
  `slug` varchar(191) NOT NULL,
  `image` varchar(255) NOT NULL,
  `detail` varchar(5000) NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `is_active` int(2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `comments`
--

CREATE TABLE `comments` (
  `id` int(13) NOT NULL,
  `name` varchar(30) NOT NULL,
  `email` varchar(191) NOT NULL,
  `blog_id` int(11) NOT NULL,
  `comment` varchar(255) NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `cp_cp_callback_addresses`
--

CREATE TABLE `cp_cp_callback_addresses` (
  `id` int(10) UNSIGNED NOT NULL,
  `address` varchar(128) COLLATE utf8mb4_unicode_ci NOT NULL,
  `currency` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL,
  `pubkey` text COLLATE utf8mb4_unicode_ci,
  `ipn_url` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `dest_tag` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `cp_cp_conversions`
--

CREATE TABLE `cp_cp_conversions` (
  `id` int(10) UNSIGNED NOT NULL,
  `amount` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `ref_id` varchar(32) COLLATE utf8mb4_unicode_ci NOT NULL,
  `from` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL,
  `to` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL,
  `address` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `dest_tag` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `cp_cp_deposits`
--

CREATE TABLE `cp_cp_deposits` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `address` varchar(128) COLLATE utf8mb4_unicode_ci NOT NULL,
  `txn_id` varchar(128) COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` tinyint(4) NOT NULL,
  `status_text` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `currency` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL,
  `confirms` tinyint(3) UNSIGNED NOT NULL,
  `amount` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `amounti` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `fee` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `feei` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `dest_tag` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `cp_cp_ipns`
--

CREATE TABLE `cp_cp_ipns` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `ipn_version` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL,
  `ipn_id` varchar(128) COLLATE utf8mb4_unicode_ci NOT NULL,
  `ref_id` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `ipn_mode` varchar(32) COLLATE utf8mb4_unicode_ci NOT NULL,
  `merchant` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `ipn_type` varchar(32) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `address` varchar(128) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `txn_id` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` smallint(6) DEFAULT NULL,
  `status_text` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `currency` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `currency1` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `currency2` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `confirms` tinyint(3) UNSIGNED DEFAULT NULL,
  `amount` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `amounti` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `amount1` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `amount2` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `fee` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `feei` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `dest_tag` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `buyer_name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `item_name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `item_number` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `invoice` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `custom` text COLLATE utf8mb4_unicode_ci,
  `send_tx` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `received_amount` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `received_confirms` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `cp_cp_log`
--

CREATE TABLE `cp_cp_log` (
  `id` int(10) UNSIGNED NOT NULL,
  `type` varchar(32) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `log` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `cp_cp_mass_withdrawals`
--

CREATE TABLE `cp_cp_mass_withdrawals` (
  `id` int(10) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `cp_cp_transactions`
--

CREATE TABLE `cp_cp_transactions` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `amount1` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `amount2` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `currency1` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL,
  `currency2` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL,
  `fee` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `address` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `dest_tag` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `buyer_email` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `buyer_name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `item_name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `item_number` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `invoice` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `custom` text COLLATE utf8mb4_unicode_ci,
  `ipn_url` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `txn_id` varchar(128) COLLATE utf8mb4_unicode_ci NOT NULL,
  `confirms_needed` tinyint(3) UNSIGNED NOT NULL,
  `timeout` int(10) UNSIGNED NOT NULL,
  `status_url` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `qrcode_url` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `status` smallint(6) DEFAULT NULL,
  `status_text` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `received_confirms` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `received_amount` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `cp_cp_transfers`
--

CREATE TABLE `cp_cp_transfers` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `amount` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `currency` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL,
  `merchant` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `pbntag` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `auto_confirm` tinyint(1) NOT NULL DEFAULT '0',
  `ref_id` varchar(128) COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` smallint(6) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `cp_cp_withdrawals`
--

CREATE TABLE `cp_cp_withdrawals` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `mass_withdrawal_id` int(10) UNSIGNED DEFAULT NULL,
  `amount` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `amount2` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `amounti` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `currency` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL,
  `currency2` varchar(10) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `address` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `pbntag` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `dest_tag` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `ipn_url` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `auto_confirm` tinyint(1) NOT NULL DEFAULT '0',
  `note` text COLLATE utf8mb4_unicode_ci,
  `ref_id` varchar(128) COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` smallint(6) NOT NULL,
  `status_text` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `txn_id` varchar(128) COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `donater_lists`
--

CREATE TABLE `donater_lists` (
  `id` int(11) NOT NULL,
  `user_id` int(11) UNSIGNED DEFAULT NULL,
  `method` varchar(191) DEFAULT NULL,
  `donor_msg` longtext,
  `amount` varchar(191) DEFAULT NULL,
  `payment_id` varchar(191) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `front_slider_updates`
--

CREATE TABLE `front_slider_updates` (
  `id` int(10) UNSIGNED NOT NULL,
  `item_show` int(11) UNSIGNED DEFAULT NULL,
  `orderby` int(11) DEFAULT '1',
  `sliderview` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `front_slider_updates`
--

INSERT INTO `front_slider_updates` (`id`, `item_show`, `orderby`, `sliderview`) VALUES
(1, 6, 1, 1),
(2, 6, 0, 1),
(3, 3, 1, 1),
(4, 3, 0, 0),
(5, 2, 1, 0),
(6, 1, 1, 0),
(7, 1, 1, 0),
(8, 2, 1, 0),
(9, 1, 1, 1),
(10, 1, 1, 0);

-- --------------------------------------------------------

--
-- Table structure for table `jobs`
--

CREATE TABLE `jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `queue` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `attempts` tinyint(3) UNSIGNED NOT NULL,
  `reserved_at` int(10) UNSIGNED DEFAULT NULL,
  `available_at` int(10) UNSIGNED NOT NULL,
  `created_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `likes`
--

CREATE TABLE `likes` (
  `id` int(13) NOT NULL,
  `user_id` int(11) NOT NULL,
  `blog_id` int(11) NOT NULL,
  `added` varchar(11) NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `movie_comments`
--

CREATE TABLE `movie_comments` (
  `id` int(11) NOT NULL,
  `name` varchar(200) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `movie_id` int(11) DEFAULT NULL,
  `tv_series_id` int(11) DEFAULT NULL,
  `comment` longtext,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `movie_subcomments`
--

CREATE TABLE `movie_subcomments` (
  `id` int(11) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `comment_id` int(11) DEFAULT NULL,
  `reply` varchar(200) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

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
  `screen5` varchar(50) DEFAULT NULL,
  `screen6` varchar(50) DEFAULT NULL,
  `user_id` int(11) UNSIGNED NOT NULL,
  `activescreen` varchar(191) DEFAULT NULL,
  `pkg_id` int(11) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COMMENT='Table for multiple screens for user ';

-- --------------------------------------------------------

--
-- Table structure for table `notifications`
--

CREATE TABLE `notifications` (
  `id` char(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `notifiable_id` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL,
  `notifiable_type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `title` varchar(200) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `data` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `movie_id` int(11) DEFAULT NULL,
  `tv_id` int(11) DEFAULT NULL,
  `read_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `package_menu`
--

CREATE TABLE `package_menu` (
  `id` int(10) UNSIGNED NOT NULL,
  `menu_id` int(11) NOT NULL,
  `package_id` varchar(200) NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `pricing_texts`
--

CREATE TABLE `pricing_texts` (
  `id` int(11) NOT NULL,
  `package_id` int(11) NOT NULL,
  `title1` mediumtext,
  `title2` mediumtext,
  `title3` mediumtext,
  `title4` mediumtext,
  `title5` mediumtext,
  `title6` mediumtext,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `subcomments`
--

CREATE TABLE `subcomments` (
  `id` int(13) NOT NULL,
  `user_id` int(11) NOT NULL,
  `blog_id` int(11) NOT NULL,
  `comment_id` int(11) NOT NULL,
  `reply` varchar(255) NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `user_ratings`
--

CREATE TABLE `user_ratings` (
  `id` int(11) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `tv_id` int(11) DEFAULT NULL,
  `movie_id` int(11) DEFAULT NULL,
  `rating` double DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `watch_histories`
--

CREATE TABLE `watch_histories` (
  `id` int(11) NOT NULL,
  `movie_id` int(11) DEFAULT NULL,
  `tv_id` int(11) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `adsenses`
--
ALTER TABLE `adsenses`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `blogs`
--
ALTER TABLE `blogs`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `comments`
--
ALTER TABLE `comments`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `cp_cp_callback_addresses`
--
ALTER TABLE `cp_cp_callback_addresses`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `cp_callback_addresses_address_currency_unique` (`address`,`currency`);

--
-- Indexes for table `cp_cp_conversions`
--
ALTER TABLE `cp_cp_conversions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `cp_conversions_ref_id_unique` (`ref_id`),
  ADD KEY `cp_conversions_from_index` (`from`),
  ADD KEY `cp_conversions_to_index` (`to`);

--
-- Indexes for table `cp_cp_deposits`
--
ALTER TABLE `cp_cp_deposits`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `cp_deposits_txn_id_unique` (`txn_id`),
  ADD KEY `cp_deposits_address_index` (`address`);

--
-- Indexes for table `cp_cp_ipns`
--
ALTER TABLE `cp_cp_ipns`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `cp_ipns_ipn_id_unique` (`ipn_id`),
  ADD KEY `cp_ipns_address_index` (`address`);

--
-- Indexes for table `cp_cp_log`
--
ALTER TABLE `cp_cp_log`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `cp_cp_mass_withdrawals`
--
ALTER TABLE `cp_cp_mass_withdrawals`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `cp_cp_transactions`
--
ALTER TABLE `cp_cp_transactions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `cp_transactions_txn_id_unique` (`txn_id`);

--
-- Indexes for table `cp_cp_transfers`
--
ALTER TABLE `cp_cp_transfers`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `cp_transfers_ref_id_unique` (`ref_id`),
  ADD KEY `cp_transfers_status_index` (`status`);

--
-- Indexes for table `cp_cp_withdrawals`
--
ALTER TABLE `cp_cp_withdrawals`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `cp_withdrawals_ref_id_unique` (`ref_id`),
  ADD UNIQUE KEY `cp_withdrawals_txn_id_unique` (`txn_id`),
  ADD KEY `cp_withdrawals_mass_withdrawal_id_index` (`mass_withdrawal_id`);

--
-- Indexes for table `donater_lists`
--
ALTER TABLE `donater_lists`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `front_slider_updates`
--
ALTER TABLE `front_slider_updates`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `jobs`
--
ALTER TABLE `jobs`
  ADD PRIMARY KEY (`id`),
  ADD KEY `jobs_queue_index` (`queue`);

--
-- Indexes for table `likes`
--
ALTER TABLE `likes`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `movie_comments`
--
ALTER TABLE `movie_comments`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `movie_subcomments`
--
ALTER TABLE `movie_subcomments`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `multiplescreens`
--
ALTER TABLE `multiplescreens`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `notifications`
--
ALTER TABLE `notifications`
  ADD PRIMARY KEY (`id`),
  ADD KEY `notifications_notifiable_id_notifiable_type_index` (`notifiable_id`(191),`notifiable_type`);

--
-- Indexes for table `package_menu`
--
ALTER TABLE `package_menu`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `pricing_texts`
--
ALTER TABLE `pricing_texts`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `subcomments`
--
ALTER TABLE `subcomments`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `user_ratings`
--
ALTER TABLE `user_ratings`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `watch_histories`
--
ALTER TABLE `watch_histories`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `adsenses`
--
ALTER TABLE `adsenses`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `blogs`
--
ALTER TABLE `blogs`
  MODIFY `id` int(13) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `comments`
--
ALTER TABLE `comments`
  MODIFY `id` int(13) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `cp_cp_callback_addresses`
--
ALTER TABLE `cp_cp_callback_addresses`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `cp_cp_conversions`
--
ALTER TABLE `cp_cp_conversions`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `cp_cp_deposits`
--
ALTER TABLE `cp_cp_deposits`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `cp_cp_ipns`
--
ALTER TABLE `cp_cp_ipns`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `cp_cp_log`
--
ALTER TABLE `cp_cp_log`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `cp_cp_mass_withdrawals`
--
ALTER TABLE `cp_cp_mass_withdrawals`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `cp_cp_transactions`
--
ALTER TABLE `cp_cp_transactions`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `cp_cp_transfers`
--
ALTER TABLE `cp_cp_transfers`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `cp_cp_withdrawals`
--
ALTER TABLE `cp_cp_withdrawals`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `donater_lists`
--
ALTER TABLE `donater_lists`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `front_slider_updates`
--
ALTER TABLE `front_slider_updates`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `jobs`
--
ALTER TABLE `jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `likes`
--
ALTER TABLE `likes`
  MODIFY `id` int(13) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `movie_comments`
--
ALTER TABLE `movie_comments`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `movie_subcomments`
--
ALTER TABLE `movie_subcomments`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `multiplescreens`
--
ALTER TABLE `multiplescreens`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `package_menu`
--
ALTER TABLE `package_menu`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `pricing_texts`
--
ALTER TABLE `pricing_texts`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `subcomments`
--
ALTER TABLE `subcomments`
  MODIFY `id` int(13) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `user_ratings`
--
ALTER TABLE `user_ratings`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `watch_histories`
--
ALTER TABLE `watch_histories`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `cp_cp_deposits`
--
ALTER TABLE `cp_cp_deposits`
  ADD CONSTRAINT `cp_deposits_address_foreign` FOREIGN KEY (`address`) REFERENCES `cp_cp_callback_addresses` (`address`) ON UPDATE CASCADE;

--
-- Constraints for table `cp_cp_withdrawals`
--
ALTER TABLE `cp_cp_withdrawals`
  ADD CONSTRAINT `cp_withdrawals_mass_withdrawal_id_foreign` FOREIGN KEY (`mass_withdrawal_id`) REFERENCES `cp_cp_mass_withdrawals` (`id`) ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
