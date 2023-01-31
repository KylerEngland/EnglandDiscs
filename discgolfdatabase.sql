-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Dec 10, 2022 at 07:26 PM
-- Server version: 10.4.25-MariaDB
-- PHP Version: 8.1.10

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `discgolf`
--
CREATE DATABASE IF NOT EXISTS `discgolf` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `discgolf`;

-- --------------------------------------------------------

--
-- Table structure for table `brand`
--

CREATE TABLE `brand` (
  `brandcode` varchar(2) NOT NULL,
  `brandname` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `brand`
--

INSERT INTO `brand` (`brandcode`, `brandname`) VALUES
('AX', 'Axiom'),
('DC', 'Discraft'),
('DD', 'Dynamic Discs'),
('DM', 'Discmania'),
('IF', 'Infinite Discs'),
('IN', 'Innova'),
('LA', 'Latitude 64'),
('MV', 'MVP'),
('WD', 'Westside Discs');

-- --------------------------------------------------------

--
-- Table structure for table `cart`
--

CREATE TABLE `cart` (
  `discid` int(11) NOT NULL,
  `discname` varchar(70) CHARACTER SET utf8 NOT NULL,
  `imagename` varchar(15) CHARACTER SET utf8 NOT NULL,
  `brandcode` varchar(2) CHARACTER SET utf8 NOT NULL,
  `stabilitycode` varchar(2) CHARACTER SET utf8 NOT NULL,
  `quantity` int(11) NOT NULL DEFAULT 1,
  `price` float NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `cart`
--

INSERT INTO `cart` (`discid`, `discname`, `imagename`, `brandcode`, `stabilitycode`, `quantity`, `price`) VALUES
(34, 'Halo Valkyrie', 'PXL_30', 'IN', 'NE', 1, 19.99);

-- --------------------------------------------------------

--
-- Table structure for table `disc`
--

CREATE TABLE `disc` (
  `id` int(11) NOT NULL,
  `name` varchar(70) CHARACTER SET utf8 NOT NULL,
  `stabilitycode` varchar(2) CHARACTER SET utf8 NOT NULL,
  `typecode` varchar(2) NOT NULL,
  `price` float(11,2) NOT NULL,
  `flightnums` varchar(20) NOT NULL,
  `imgname` varchar(15) NOT NULL,
  `brandcode` varchar(2) NOT NULL,
  `quantity` int(1) NOT NULL DEFAULT 1,
  `incart` tinyint(1) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `disc`
--

INSERT INTO `disc` (`id`, `name`, `stabilitycode`, `typecode`, `price`, `flightnums`, `imgname`, `brandcode`, `quantity`, `incart`) VALUES
(1, 'Star Teebird3', 'OS', 'FD', 17.99, '8/4/0/2', 'PXL_23', 'IN', 1, 0),
(2, 'Grand Orbit Grace KT 2022 World Champion', 'OS', 'DD', 29.99, '11/6/-1/2', 'PXL_35', 'LA', 1, 0),
(3, 'GStar Destroyer', 'US', 'DD', 11.99, '12/5/-1/3', 'PXL_36', 'IN', 1, 0),
(4, 'Champion Firebird', 'OS', 'FD', 16.99, '9/3/0/4', 'PXL_33', 'IN', 1, 0),
(5, 'Neo Essence', 'US', 'FD', 14.99, '8/6/-2/1', 'PXL_21', 'DM', 1, 0),
(6, 'ESP Buzzz', 'NE', 'MD', 16.99, '5/4/-1/1', 'PXL_18', 'DC', 1, 0),
(7, 'VIP ICE Tursas', 'US', 'MD', 11.99, '5/5/-3/1', 'PXL_16', 'WS', 1, 0),
(8, 'Neutron Paradox', 'US', 'MD', 11.99, '5/4/-4/0', 'PXL_14', 'AX', 1, 0),
(9, 'ESP Malta', 'OS', 'MD', 11.99, '5/4/1/3', 'PXL_15', 'DC', 1, 0),
(10, 'Special Edition Neutron Uplink', 'US', 'MD', 16.99, '5/5/-3/0.5', 'PXL_17', 'MV', 1, 0),
(11, 'Prime Burst Judge', 'NE', 'PT', 9.99, '2/4/0/1', 'PXL_1', 'DD', 1, 0),
(12, 'Prime Burst Emac Judge', 'NE', 'PT', 9.99, '2/4/0/1', 'PXL_2', 'DD', 1, 0),
(13, 'Electron Soft Nomad', 'US', 'PT', 9.99, '2/4/0/1.5', 'PXL_3', 'MV', 1, 0),
(14, 'DX Aviar', 'US', 'PT', 8.99, '2/3/0/1', 'PXL_4', 'IN', 1, 0),
(15, 'Prime Guard', 'US', 'PT', 9.99, '2/5/0/0.5', 'PXL_5', 'DD', 1, 0),
(16, 'Cosmic Neutron Envy', 'OS', 'PT', 11.99, '3/3/0/2', 'PXL_6', 'AX', 1, 0),
(17, 'R-Pro Pig', 'OS', 'AD', 10.99, '3/1/0/3', 'PXL_7', 'IN', 1, 0),
(18, 'BT-Medium Harp', 'OS', 'AD', 10.99, '4/3/0/3', 'PXL_8', 'WD', 1, 0),
(19, 'DX Cobra', 'US', 'MD', 8.99, '4/5/-2/2', 'PXL_9', 'IN', 1, 0),
(20, 'Exo Soft Tactic', 'OS', 'AD', 11.99, '4/2/0/3', 'PXL_10', 'DM', 1, 0),
(21, 'Razor Claw 3', 'OS', 'AD', 25.99, '4/2/0/4', 'PXL_11', 'DM', 1, 0),
(22, 'DX Roc3', 'NE', 'MD', 10.99, '5/4/0/3', 'PXL_12', 'IN', 1, 0),
(23, 'Exo Hard Method', 'OS', 'MD', 14.99, '5/5/0/3', 'PXL_13', 'DM', 1, 0),
(24, 'VIP Tursas', 'NE', 'MD', 15.99, '5/5/-3/1', 'PXL_16', 'WD', 1, 0),
(25, 'Fusion Burst Maverick', 'US', 'FD', 15.99, '7/4/-1.5/2', 'PXL_19', 'DD', 1, 0),
(26, 'Star Teebird', 'OS', 'FD', 15.99, '7/5/0/2', 'PXL_20', 'IN', 1, 0),
(27, 'Electron Volt', 'US', 'FD', 13.99, '8/5/-2/1.5', 'PXL_22', 'MV', 1, 0),
(28, 'Photon UV Wildcat', 'US', 'DD', 10.99, '11/5/-2/3', 'PXL_24', 'DC', 1, 0),
(29, 'Hailey King Metallic Z Heat', 'US', 'FD', 16.99, '9/6/-3/1', 'PXL_25', 'DC', 1, 0),
(30, 'Lucid Vandal', 'US', 'FD', 14.99, '9/5/-1.5/2', 'PXL_26', 'DD', 1, 0),
(31, 'TC Gold Saint', 'US', 'FD', 14.99, '9/7/-1/2', 'PXL_27', 'LA', 1, 0),
(32, 'Champion Viking', 'NE', 'FD', 14.99, '9/4/-1/2', 'PXL_28', 'IN', 1, 0),
(33, 'Opto Saint Pro', 'OS', 'FD', 13.99, '8/5/-0.5/2', 'PXL_29', 'LA', 1, 0),
(34, 'Halo Valkyrie', 'NE', 'FD', 19.99, '9/4/-2/2', 'PXL_30', 'IN', 1, 0),
(35, 'EO S-Blend Dynasty', 'NE', 'FD', 19.99, '9/5/-1/2', 'PXL_31', 'IF', 1, 0),
(36, 'ESP Raptor', 'OS', 'FD', 16.99, '9/4/0/3', 'PXL_32', 'DC', 1, 0),
(37, 'Star Mamba', 'US', 'DD', 13.99, '11/6/-5/1', 'PXL_34', 'IN', 1, 0),
(38, 'Halo Tern', 'US', 'DD', 19.99, '12/6/-3/2', 'PXL_37', 'IN', 1, 0),
(39, 'Lucid Defender', 'OS', 'DD', 15.99, '13/5/0/3', 'PXL_38', 'DD', 1, 0);

-- --------------------------------------------------------

--
-- Table structure for table `stability`
--

CREATE TABLE `stability` (
  `stabilitycode` varchar(2) NOT NULL,
  `stabilityname` varchar(20) NOT NULL,
  `sortvalue` int(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `stability`
--

INSERT INTO `stability` (`stabilitycode`, `stabilityname`, `sortvalue`) VALUES
('NE', 'Neutral', 2),
('OS', 'Overstable', 3),
('US', 'Understable', 1);

-- --------------------------------------------------------

--
-- Table structure for table `type`
--

CREATE TABLE `type` (
  `typecode` varchar(2) CHARACTER SET utf8 NOT NULL,
  `typename` varchar(20) CHARACTER SET utf8 NOT NULL,
  `sortvalue` int(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `type`
--

INSERT INTO `type` (`typecode`, `typename`, `sortvalue`) VALUES
('AD', 'Approach Discs', 4),
('DD', 'Distance Drivers', 1),
('FD', 'Fairway Drivers', 2),
('MD', 'Midrange Drivers', 3),
('PT', 'Putters', 5);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `brand`
--
ALTER TABLE `brand`
  ADD PRIMARY KEY (`brandcode`);

--
-- Indexes for table `disc`
--
ALTER TABLE `disc`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `stability`
--
ALTER TABLE `stability`
  ADD PRIMARY KEY (`stabilitycode`);

--
-- Indexes for table `type`
--
ALTER TABLE `type`
  ADD PRIMARY KEY (`typecode`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `disc`
--
ALTER TABLE `disc`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=40;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
