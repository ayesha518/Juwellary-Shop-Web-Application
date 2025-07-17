-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jun 24, 2025 at 07:53 PM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `juwellary_cart`
--

-- --------------------------------------------------------

--
-- Table structure for table `cart`
--

CREATE TABLE `cart` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `name` varchar(100) DEFAULT NULL,
  `category` varchar(100) DEFAULT NULL,
  `price` double DEFAULT NULL,
  `quantity` int(11) DEFAULT NULL,
  `total` double DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `oderds`
--

CREATE TABLE `oderds` (
  `0_id` int(11) NOT NULL,
  `p_id` int(11) NOT NULL,
  `u_id` int(11) NOT NULL,
  `o_quantity` int(255) NOT NULL,
  `o_date` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

CREATE TABLE `products` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `category` varchar(225) NOT NULL,
  `price` int(255) NOT NULL,
  `image` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`id`, `name`, `category`, `price`, `image`) VALUES
(0, 'Necklace 1', 'Necklace', 50000, 'pendan.jpeg'),
(1, 'Necklace 2', 'Necklace', 200000, 'm2.jpeg'),
(2, 'Necklace 3', 'Necklace', 70000, 'm3.jpeg'),
(4, 'Necklace 4', 'Necklace', 80000, 'm4.jpeg'),
(5, 'Bangle  1', 'Bangle ', 7000, 'k1.jpeg'),
(6, 'Bangle 2', 'Bangle ', 6000, 'k2.jpeg'),
(7, 'Bangle 4', 'Bangle ', 9000, 'k5.jpeg'),
(8, 'Bangle 3', 'Bangle ', 9000, 'k3.jpeg'),
(9, 'Bangle 5', 'Bangle ', 15000, 'k10.jpeg'),
(10, 'Bangle 5', 'Bangle ', 9000, 'k6.jpeg'),
(11, 'Bangle 7', 'Bangle ', 14000, 'k11.jpeg'),
(12, 'Ring 1', 'Ring', 15000, 'n1.jpeg'),
(13, 'Ring 1', 'Ring ', 12000, 'n1.jpeg'),
(14, 'Ring 2', 'Ring ', 25000, 'n2.jpeg'),
(15, 'Ring 3', 'Ring ', 15000, 'n3.fe.jpeg'),
(16, 'Ring 6', 'Ring', 5000, 'n6.fe.jpeg'),
(17, 'Ring 7', 'Ring', 5000, 'n8.fe.jpeg'),
(18, 'Ring 4', 'Ring', 10000, 'n.fe12.jpeg'),
(19, 'pendan', 'pendan', 80000, 'pendan.jpeg'),
(20, 'Others 3', 'Other', 822000, 'oth8.jpeg'),
(21, 'other', 'other', 120000, 'other1.jpeg'),
(22, 'other', 'other', 120000, 'other4.jpeg'),
(23, 'Others 3', 'Other', 82000, 'n.fe14.jpeg');

-- --------------------------------------------------------

--
-- Table structure for table `register`
--

CREATE TABLE `register` (
  `id` int(11) NOT NULL,
  `fullname` varchar(100) NOT NULL,
  `address` varchar(255) NOT NULL,
  `email` varchar(100) NOT NULL,
  `password` varchar(255) NOT NULL,
  `mobile` varchar(20) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `register`
--

INSERT INTO `register` (`id`, `fullname`, `address`, `email`, `password`, `mobile`, `created_at`) VALUES
(1, 'ayesha', 'kandy', 'ayesha12@gmail.com', '1278', '07894561230', '2025-06-19 05:33:31'),
(2, 'chama', 'monaragala', 'chama1234@gmail.com', 'ch12', '07894561230', '2025-06-19 05:42:10'),
(4, 'rukshani', 'kandy', 'ruka12@gmail.com', '098', '0985421659', '2025-06-19 06:19:02'),
(5, 'rukshani', 'monaragala', 'ruwi123@gmail.com', 'ru12', '0784512369', '2025-06-19 06:25:53'),
(6, 'malidi', 'ampara', 'malid123@gmail.com', 'malee', '0987456123', '2025-06-19 06:34:32'),
(7, 'wasana', 'kurunagala', 'wasana12@gmail.com', 'qd12', '0785412589', '2025-06-19 07:29:05'),
(8, 'kamal', 'dddd', 'dddddd@gmail.com', 'dddd', '0845127895', '2025-06-19 07:54:47'),
(9, 'kavidu', 'monaragala', 'kavidu@gmail.com', 'kavi', '0987456123', '2025-06-20 07:34:29'),
(10, 'nadeesha', 'dehiattakandiya', 'nadee@gmail.com', 'nadee', '0987456123', '2025-06-20 08:55:55'),
(11, 'nimmi', 'namaloya', 'nimmi12@gmail.com', 'nima', '0275741523', '2025-06-24 17:24:00');

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `password` varchar(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`id`, `name`, `email`, `password`) VALUES
(1, 'amila', 'amila@gmail.com', '1234');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `cart`
--
ALTER TABLE `cart`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `oderds`
--
ALTER TABLE `oderds`
  ADD PRIMARY KEY (`0_id`);

--
-- Indexes for table `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `register`
--
ALTER TABLE `register`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `email` (`email`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `cart`
--
ALTER TABLE `cart`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `register`
--
ALTER TABLE `register`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
