-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jul 29, 2021 at 10:38 AM
-- Server version: 10.4.20-MariaDB
-- PHP Version: 8.0.8

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `buku_kita`
--
CREATE DATABASE IF NOT EXISTS `buku_kita` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `buku_kita`;

-- --------------------------------------------------------

--
-- Table structure for table `buku`
--

DROP TABLE IF EXISTS `buku`;
CREATE TABLE `buku` (
  `id` int(10) UNSIGNED NOT NULL,
  `judul` varchar(100) NOT NULL,
  `penerbit` varchar(50) DEFAULT NULL,
  `pengarang` varchar(50) DEFAULT NULL,
  `tahun` varchar(4) DEFAULT NULL,
  `kategori_id` int(11) UNSIGNED DEFAULT NULL,
  `harga` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `buku`
--

INSERT INTO `buku` (`id`, `judul`, `penerbit`, `pengarang`, `tahun`, `kategori_id`, `harga`) VALUES
(1, 'Komik One Piece Vol. 501', 'Gramedia', 'Eichiro Oda', '2020', 1, 35000);

-- --------------------------------------------------------

--
-- Table structure for table `kategori`
--

DROP TABLE IF EXISTS `kategori`;
CREATE TABLE `kategori` (
  `id` int(11) UNSIGNED NOT NULL,
  `nama_kategori` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `kategori`
--

INSERT INTO `kategori` (`id`, `nama_kategori`) VALUES
(1, 'Komik'),
(2, 'Dogeng');

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
CREATE TABLE `user` (
  `id` int(10) UNSIGNED NOT NULL,
  `nama` varchar(50) DEFAULT NULL,
  `username` varchar(25) NOT NULL,
  `password` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`id`, `nama`, `username`, `password`) VALUES
(1, 'Muhammad Edya Rosadi', 'edya', 'edya');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `buku`
--
ALTER TABLE `buku`
  ADD PRIMARY KEY (`id`),
  ADD KEY `kategori_id` (`kategori_id`);

--
-- Indexes for table `kategori`
--
ALTER TABLE `kategori`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `buku`
--
ALTER TABLE `buku`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `kategori`
--
ALTER TABLE `kategori`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `buku`
--
ALTER TABLE `buku`
  ADD CONSTRAINT `buku_ibfk_1` FOREIGN KEY (`kategori_id`) REFERENCES `kategori` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
