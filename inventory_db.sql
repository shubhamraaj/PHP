-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Oct 11, 2026 at 09:12 AM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.0.30

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `inventory_db`
--

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

CREATE TABLE `products` (
  `id` int(11) NOT NULL,
  `category` varchar(100) DEFAULT NULL,
  `product_name` varchar(100) DEFAULT NULL,
  `price` decimal(10,2) DEFAULT NULL,
  `quantity` int(11) DEFAULT NULL,
  `supplier_name` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`id`, `category`, `product_name`, `price`, `quantity`, `supplier_name`) VALUES
(5, 'watch', 'casio', 19900.00, 21, 'titu'),
(7, 'watch', 'Titan', 199000.00, 10, 'best watch');

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `id` int(11) NOT NULL,
  `name` varchar(50) DEFAULT NULL,
  `email` varchar(40) DEFAULT NULL,
  `phone` varchar(70) DEFAULT NULL,
  `password` varchar(50) DEFAULT NULL,
  `city` varchar(70) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`id`, `name`, `email`, `phone`, `password`, `city`) VALUES
(1, 'Tom', 'tom@gmail.com', '123', '$2y$10$Ku8iOcjZk/iogXOgPbAAlOt98pY06OF.P4zyUkmbOHd', 'Mumbai'),
(2, 'Shubhamraj Krishnakant Pandey', 'pandeshubhamraj@gmail.com', '8369574431', '$2y$10$ImP0VnL6sOBddRgwQrrJaOKe0I0BJWeJcN5HdRk9S8.', 'Mumbai'),
(3, 'Shubhamraj Krishnakant Pandey', 'pandeshubhamraj@gmail.com', '8369574431', '$2y$10$PDYwlJW4qxqk4Ogh.D.W8.fWjGtTuyj6Xn6eeN3xVKg', 'Mumbai'),
(4, 'Shubhamraj Krishnakant Pandey', 'pandeshubhamraj@gmail.com', '8369574431', '$2y$10$UmJV10MupQciygA6jWcFK.r0rENIwkBLtgj8MgkIMS4', 'Mumbai'),
(5, 'raj', 'pandeshubhamraj@gmail.com', '8369574431', '$2y$10$vmx7Fr82SAu7hJVXaS2cIOmOWle50WLb2cJ7W84dy2r', 'Mumbai'),
(6, 'aaj', 'pandeshubhamraj@gmail.com', '8369574431', '$2y$10$1/NqYHiaM9r5bEGyuzmPQ.A0dQhPF7Y9pegACBueGiT', 'Mumbai'),
(7, 'aaaj', 'pandeshubhamraj@gmail.com', '8369574431', '$2y$10$4W05Vdnq1tBPN0gOvzXfPeNXM5aI4N.ifa6rcTJb3OX', 'Mumbai'),
(8, 'tom', 'pandeshubhamraj@gmail.com', '8369574431', '$2y$10$qkYvk8Vgmt1Dz9g4MrgS5ukZujICiKFC2egB2VgjBpW', 'Mumbai'),
(9, 'aaj', 'pandeshubhamraj@gmail.com', '8369574431', '$2y$10$XccqHBBHylmAkAyyuBPQxudB8WZ3fRY5.a4y3JbetG0', 'Mumbai');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `name` varchar(100) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `phone` int(11) DEFAULT NULL,
  `city` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `password`, `phone`, `city`) VALUES
(1, 'raj', 'pandeshubhamraj@gmail.com', '$2y$10$2WHFOs.eSNMzNYdVDxFVa.fiQMIXSleIM7lWNqKWsW/WymKVY5z.i', 2147483647, 'Mumbai'),
(2, 'aaj', 'pandeshubhamraj@gmail.com', '$2y$10$YffIZg1cC3z3A9ITsLuIweE3hKxWPW55avLQNIk/yqPrDaWBZRQrO', 2147483647, 'Mumbai'),
(3, 'Shubhamraj', 'shubhamraj@gmail.com', '$2y$10$dvCRPZrRcms8jVoImjpIJ.5B8MdKTgQ.1URo2LHbrZtBh6MOIYIvq', 2147483647, 'Thane'),
(4, 'karan', 'karan@gmail.com', '$2y$10$Y0p.2C2/6qpD2nejrK.SGeVHwdKlR.q5KL3RhZrhUtLsVQvF0zCbW', 2147483647, 'Borivali'),
(5, 'shuam', 'shuam@gmail.com', '$2y$10$EQDOSRMrOglzJ6WP/xOUQeh9j.WuRgrSE1Fj6d3C7VMdLDFbuCsf.', 2147483647, 'Mumbai'),
(6, 'tom', 'tom@gmail.com', '$2y$10$0QmaYrvsGHYUmHptR/hrVuaARCtNqRCrTDXTygPalNxgDeX.FDW6m', 2147483647, 'america'),
(7, 'kom', 'kom@gmail.com', '$2y$10$2fwxoOLElWADYGJsVoVEY.Cc.ACdQKSeeTmainNVjCU88vokoMc4G', 2147483647, 'China'),
(8, 'kom', 'kom@gmail.com', '$2y$10$j9rdTgyWLYzH4N7ILWB.YuC/f8E3cfec0WZwpJSzQLHpgcqOHEHRC', 2147483647, 'Mumbai'),
(9, 'abhijit', 'abhijit@gmail.com', '$2y$10$GX7fdFHl4dsh4cozQ0ZXcOHVgio6k.KLTkBn/8NWN.CeimjGjkmKC', 2147483647, 'Mira Bhayandar'),
(10, 'baz', 'baz@gmail.com', '$2y$10$ytn5pYOGHazBD9GCHj2HOeAgrzqksyzwTe6XuV6K.dEI6HFDmDgQ2', 2147483647, 'Mumbai');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `products`
--
ALTER TABLE `products`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
