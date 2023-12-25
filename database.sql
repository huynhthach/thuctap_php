-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Dec 25, 2023 at 04:04 AM
-- Server version: 10.4.27-MariaDB
-- PHP Version: 8.0.25

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `yugioh`
--

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `UserID` int(11) NOT NULL,
  `Username` varchar(50) DEFAULT NULL,
  `Password` varchar(100) DEFAULT NULL,
  `Email` varchar(100) DEFAULT NULL,
  `NgayTao` datetime DEFAULT NULL,
  `IDRole` int(11) DEFAULT NULL,
  `imageus` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`UserID`, `Username`, `Password`, `Email`, `NgayTao`, `IDRole`, `imageus`) VALUES
(11, 'huynhLong', '$2y$10$ESB8t/riFBkUe8mhiQXNdewUdGFTYUxYrv2aIWEoTnLqcPaQ5u.G.', 'long@gmail.com', '2023-12-05 03:32:27', 1, NULL),
(12, 'adminUser', '$2y$10$E.wJt4g1vxXktxz6DBF2AuLg52YZe1XTQU1KEr.D2ulIckQ6XQ59.', 'haha@gmail.com', '2023-12-05 03:33:23', 2, NULL),
(15, 'nguyenThanh', '$2y$10$6Xel5.F1.h27.spTXvf2eOJuFtqtH5rK0Bd5J85zs/NnE3ozdi8je', 'long12@gmail.com', '2023-12-15 01:54:48', 1, NULL),
(19, 'long123', '$2y$10$8TevLw9KCWW6P5xRBFvy4u4OyJpym2EiV34ihwm09DCE/TuMiOdy.', '123@gmail.com', '2023-12-25 02:28:21', 1, NULL);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`UserID`),
  ADD KEY `IDRole` (`IDRole`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `UserID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `users`
--
ALTER TABLE `users`
  ADD CONSTRAINT `users_ibfk_1` FOREIGN KEY (`IDRole`) REFERENCES `roles` (`RoleID`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
