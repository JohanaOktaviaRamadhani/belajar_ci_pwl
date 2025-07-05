-- phpMyAdmin SQL Dump
-- version 4.8.5
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Jul 04, 2025 at 03:50 PM
-- Server version: 5.7.24
-- PHP Version: 7.4.19

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `db_ci4`
--

-- --------------------------------------------------------

--
-- Table structure for table `diskon`
--

CREATE TABLE `diskon` (
  `id` int(11) NOT NULL,
  `tanggal` date NOT NULL,
  `nominal` double NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `diskon`
--

INSERT INTO `diskon` (`id`, `tanggal`, `nominal`, `created_at`, `updated_at`) VALUES
(2, '2025-07-05', 57388, '2025-07-04 04:18:58', '2025-07-04 04:18:58'),
(3, '2025-07-06', 82758, '2025-07-04 04:18:58', '2025-07-04 04:18:58'),
(4, '2025-07-07', 64704, '2025-07-04 04:18:58', '2025-07-04 04:18:58'),
(5, '2025-07-08', 57940, '2025-07-04 04:18:58', '2025-07-04 04:18:58'),
(6, '2025-07-09', 116130, '2025-07-04 04:18:58', '2025-07-04 04:18:58'),
(7, '2025-07-10', 148212, '2025-07-04 04:18:58', '2025-07-04 04:18:58'),
(8, '2025-07-11', 75695, '2025-07-04 04:18:58', '2025-07-04 04:18:58'),
(9, '2025-07-12', 78044, '2025-07-04 04:18:58', '2025-07-04 04:18:58'),
(10, '2025-07-13', 56229, '2025-07-04 04:18:58', '2025-07-04 04:18:58'),
(17, '2025-07-04', 50000, '2025-07-04 15:07:24', '2025-07-04 15:07:24');

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `version` varchar(255) NOT NULL,
  `class` varchar(255) NOT NULL,
  `group` varchar(255) NOT NULL,
  `namespace` varchar(255) NOT NULL,
  `time` int(11) NOT NULL,
  `batch` int(11) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `version`, `class`, `group`, `namespace`, `time`, `batch`) VALUES
(1, '2025-05-07-143702', 'App\\Database\\Migrations\\User', 'default', 'App', 1746628925, 1),
(2, '2025-05-07-143715', 'App\\Database\\Migrations\\Product', 'default', 'App', 1746628925, 1),
(3, '2025-05-07-143722', 'App\\Database\\Migrations\\Transaction', 'default', 'App', 1746628925, 1),
(4, '2025-05-07-143729', 'App\\Database\\Migrations\\TransactionDetail', 'default', 'App', 1746628925, 1),
(5, '2025-05-07-150057', 'App\\Database\\Migrations\\CreateProductCategoryTable', 'default', 'App', 1746630222, 2),
(6, '2025-05-07-150057', 'App\\Database\\Migrations\\ProductCategory', 'default', 'App', 1751600227, 3),
(7, '2025-07-04-031512', 'App\\Database\\Migrations\\CreateDiskonTable', 'default', 'App', 1751600227, 3);

-- --------------------------------------------------------

--
-- Table structure for table `product`
--

CREATE TABLE `product` (
  `id` int(11) UNSIGNED NOT NULL,
  `nama` varchar(255) NOT NULL,
  `harga` double NOT NULL,
  `jumlah` int(5) NOT NULL,
  `foto` varchar(255) NOT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `product`
--

INSERT INTO `product` (`id`, `nama`, `harga`, `jumlah`, `foto`, `created_at`, `updated_at`) VALUES
(1, 'ASUS TUF A15 FA506NF', 10899000, 5, 'asus_tuf_a15.jpg', '2025-05-07 14:45:15', NULL),
(2, 'Asus Vivobook 14 A1404ZA', 6899000, 7, 'asus_vivobook_14.jpg', '2025-05-07 14:45:15', NULL),
(3, 'Lenovo IdeaPad Slim 3-14IAU7', 6299000, 5, 'lenovo_idepad_slim_3.jpg', '2025-05-07 14:45:15', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `product_category`
--

CREATE TABLE `product_category` (
  `id` int(10) UNSIGNED NOT NULL,
  `category_name` varchar(100) NOT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `product_category`
--

INSERT INTO `product_category` (`id`, `category_name`, `created_at`, `updated_at`) VALUES
(1, 'Laptop Gaming ', '2025-05-07 15:13:09', '2025-05-23 15:48:23'),
(3, 'keyboard ', '2025-05-07 15:13:09', '2025-05-23 15:49:46');

-- --------------------------------------------------------

--
-- Table structure for table `transaction`
--

CREATE TABLE `transaction` (
  `id` int(11) UNSIGNED NOT NULL,
  `username` varchar(255) NOT NULL,
  `total_harga` double NOT NULL,
  `alamat` text NOT NULL,
  `ongkir` double DEFAULT NULL,
  `status` int(1) NOT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `transaction`
--

INSERT INTO `transaction` (`id`, `username`, `total_harga`, `alamat`, `ongkir`, `status`, `created_at`, `updated_at`) VALUES
(5, 'jeonjungkook', 10910000, 'semarang', 11000, 0, '2025-07-03 14:50:50', '2025-07-03 14:50:50'),
(6, 'jeonjungkook', 11104608, 'semarang', 350000, 0, '2025-07-04 08:14:51', '2025-07-04 08:14:51'),
(7, 'jeonjungkook', 6699000, 'semarang', 0, 0, '2025-07-04 13:07:35', '2025-07-04 13:07:35'),
(8, 'jeonjungkook', 6099000, 'pati', 0, 0, '2025-07-04 13:18:27', '2025-07-04 13:18:27'),
(9, 'taehyung', 6111000, 'pati', 12000, 0, '2025-07-04 13:28:30', '2025-07-04 13:28:30'),
(10, 'taehyung', 6849000, 'pati', 600000, 0, '2025-07-04 15:08:42', '2025-07-04 15:08:42');

-- --------------------------------------------------------

--
-- Table structure for table `transaction_detail`
--

CREATE TABLE `transaction_detail` (
  `id` int(11) UNSIGNED NOT NULL,
  `transaction_id` int(11) UNSIGNED NOT NULL,
  `product_id` int(11) UNSIGNED NOT NULL,
  `jumlah` int(5) NOT NULL,
  `diskon` double DEFAULT NULL,
  `subtotal_harga` double NOT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `transaction_detail`
--

INSERT INTO `transaction_detail` (`id`, `transaction_id`, `product_id`, `jumlah`, `diskon`, `subtotal_harga`, `created_at`, `updated_at`) VALUES
(1, 1, 1, 1, 0, 10899000, '2025-06-13 15:18:45', '2025-06-13 15:18:45'),
(2, 2, 2, 1, 0, 6899000, '2025-06-13 15:21:50', '2025-06-13 15:21:50'),
(3, 3, 1, 1, 0, 10899000, '2025-06-18 06:13:52', '2025-06-18 06:13:52'),
(4, 4, 2, 1, 0, 6899000, '2025-07-03 14:35:54', '2025-07-03 14:35:54'),
(5, 5, 1, 1, 0, 10899000, '2025-07-03 14:50:52', '2025-07-03 14:50:52'),
(6, 6, 1, 1, 0, 10754608, '2025-07-04 08:14:53', '2025-07-04 08:14:53'),
(7, 7, 2, 1, 0, 6699000, '2025-07-04 13:07:37', '2025-07-04 13:07:37'),
(8, 8, 3, 1, 0, 6099000, '2025-07-04 13:18:29', '2025-07-04 13:18:29'),
(9, 9, 3, 1, 0, 6099000, '2025-07-04 13:28:33', '2025-07-04 13:28:33'),
(10, 10, 3, 1, 0, 6249000, '2025-07-04 15:08:44', '2025-07-04 15:08:44');

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `id` int(10) UNSIGNED NOT NULL,
  `username` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `role` varchar(50) NOT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`id`, `username`, `email`, `password`, `role`, `created_at`, `updated_at`) VALUES
(1, 'jeonjungkook', 'betania.halim@yahoo.com', '$2y$10$p1rJNolYteMseG/Rd8w1XeVepXSOseRxmuJfS491qF37G3ANebIjy', 'guest', '2025-05-07 14:46:11', NULL),
(2, 'johana1', 'eli95@nashiruddin.co.id', '$2y$10$XN8.qP0kocTIoJL/TCVaY.iGbaaFDGcIGBUkFA.P/YinPgBtKTY6i', 'admin', '2025-05-07 14:46:11', NULL);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `diskon`
--
ALTER TABLE `diskon`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `product`
--
ALTER TABLE `product`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `product_category`
--
ALTER TABLE `product_category`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `transaction`
--
ALTER TABLE `transaction`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `transaction_detail`
--
ALTER TABLE `transaction_detail`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `username` (`username`),
  ADD UNIQUE KEY `email` (`email`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `diskon`
--
ALTER TABLE `diskon`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `product`
--
ALTER TABLE `product`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `product_category`
--
ALTER TABLE `product_category`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `transaction`
--
ALTER TABLE `transaction`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `transaction_detail`
--
ALTER TABLE `transaction_detail`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
