-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3306
-- Generation Time: Oct 20, 2023 at 06:48 AM
-- Server version: 8.0.31
-- PHP Version: 8.0.26

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `csmstest`
--

-- --------------------------------------------------------

--
-- Table structure for table `bid`
--

DROP TABLE IF EXISTS `bid`;
CREATE TABLE IF NOT EXISTS `bid` (
  `BID` int NOT NULL AUTO_INCREMENT,
  `status` varchar(50) NOT NULL,
  `UID` int NOT NULL,
  `WID` int NOT NULL,
  PRIMARY KEY (`BID`),
  KEY `bid_fk_users_idx` (`UID`),
  KEY `bid_fk_workslots_idx` (`WID`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `bid`
--
/*hi fergus im klaus KKB*/
INSERT INTO `bid` (`BID`, `status`, `UID`, `WID`) VALUES
(1, 'Approved', 4, 1),
(2, 'Pending', 5, 2),
(3, 'Rejected', 6, 3);

-- --------------------------------------------------------

--
-- Table structure for table `caferole`
--

DROP TABLE IF EXISTS `caferole`;
CREATE TABLE IF NOT EXISTS `caferole` (
  `Crole` varchar(50) NOT NULL,
  PRIMARY KEY (`Crole`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `caferole`
--

INSERT INTO `caferole` (`Crole`) VALUES
('Cashier'),
('Chef'),
('Waiter');

-- --------------------------------------------------------

--
-- Table structure for table `userprofile`
--

DROP TABLE IF EXISTS `userprofile`;
CREATE TABLE IF NOT EXISTS `userprofile` (
  `profile` varchar(50) NOT NULL,
  PRIMARY KEY (`profile`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `userprofile`
--

INSERT INTO `userprofile` (`profile`) VALUES
('Cafe Manager'),
('Cafe Owner'),
('Cafe Staff'),
('System Admin');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
CREATE TABLE IF NOT EXISTS `users` (
  `UID` int NOT NULL AUTO_INCREMENT,
  `Name` varchar(50) NOT NULL,
  `Phone` varchar(50) NOT NULL,
  `Username` varchar(50) NOT NULL,
  `password` varchar(32) NOT NULL,
  `Email` varchar(50) NOT NULL,
  `status` varchar(40) NOT NULL,
  `profile` varchar(50) NOT NULL,
  PRIMARY KEY (`UID`),
  KEY `users_fk_userprofile` (`profile`)
) ENGINE=MyISAM AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`UID`, `Name`, `Phone`, `Username`, `password`, `Email`, `status`, `profile`) VALUES
(1, 'John', '9292', 'jon', '12345', 'jon@gmail.com', 'Active', 'System Admin'),
(2, 'yohn', '9292', 'yon', '12345', 'yon@gmail.com', 'Active', 'Cafe Owner'),
(3, 'uohn', '9292', 'uon', '12345', 'uon@gmail.com', 'Active', 'Cafe Manager'),
(4, 'iohn', '9292', 'ion', '12345', 'ion@gmail.com', 'Active', 'Cafe Staff'),
(5, 'may', '9292', 'may', '12345', 'may@gmail.com', 'Active', 'Cafe Staff'),
(6, 'jay', '9292', 'jay', '12345', 'jay@gmail.com', 'Active', 'Cafe Staff');

-- --------------------------------------------------------

--
-- Table structure for table `workslots`
--

DROP TABLE IF EXISTS `workslots`;
CREATE TABLE IF NOT EXISTS `workslots` (
  `WID` int NOT NULL AUTO_INCREMENT,
  `WSDate` date NOT NULL,
  `WSDesc` varchar(50) NOT NULL,
  `Crole` varchar(50) NOT NULL,
  `NoOfWorkslot` int NOT NULL,
  `NoOfWorkSlotFilled` int NOT NULL,
  `UID` int DEFAULT NULL,
  PRIMARY KEY (`WID`),
  KEY `workslots_fk_users` (`UID`),
  KEY `workslots_fk_caferole_idx` (`Crole`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `workslots`
--

INSERT INTO `workslots` (`WID`, `WSDate`, `WSDesc`, `Crole`, `NoOfWorkslot`, `NoOfWorkSlotFilled`, `UID`) VALUES
(1, '2023-10-20', 'cook in cafe', 'Chef', 5, 3, 4),
(2, '2023-10-20', 'handle cash in cafe', 'Cashier', 2, 1, 5),
(3, '2023-10-20', 'take customer orders', 'Waiter', 3, 2, 6);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
