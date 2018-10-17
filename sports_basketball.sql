-- phpMyAdmin SQL Dump
-- version 4.7.8
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Oct 16, 2018 at 08:32 PM
-- Server version: 5.5.57-0ubuntu0.14.04.1
-- PHP Version: 5.5.9-1ubuntu4.22

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `sports`
--

-- --------------------------------------------------------

--
-- Table structure for table `sports_basketball`
--

CREATE TABLE `sports_basketball` (
  `playerId` int(3) NOT NULL,
  `playerName` varchar(255) NOT NULL,
  `playerImage` varchar(255) NOT NULL,
  `playerPos` varchar(255) NOT NULL,
  `playerTeam` varchar(255) NOT NULL,
  `price` int(3) NOT NULL,
  `catId` int(3) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `sports_basketball`
--

INSERT INTO `sports_basketball` (`playerId`, `playerName`, `playerImage`, `playerPos`, `playerTeam`, `price`, `catId`) VALUES
(1, 'LeBron James', 'https://d2cwpp38twqe55.cloudfront.net/req/201810111/images/players/jamesle01.jpg', 'Power Forward and Shooting Guard and Small Forward', 'Lakers', 300, 3),
(2, 'Kevin Durant', 'https://d2cwpp38twqe55.cloudfront.net/req/201810111/images/players/duranke01.jpg', 'Shooting Guard and Power Forward and Small Forward', 'Warriors', 300, 3),
(3, 'Kawhi Leonard', 'https://d2cwpp38twqe55.cloudfront.net/req/201810111/images/players/leonaka01.jpg', 'Small Forward', 'Raptors', 300, 3),
(4, 'Stephen Curry', 'https://d2cwpp38twqe55.cloudfront.net/req/201810111/images/players/curryst01.jpg', 'Point Guard', 'Warriors', 300, 3),
(5, 'Russell Westbrook', 'https://d2cwpp38twqe55.cloudfront.net/req/201810111/images/players/westbru01.jpg', 'Point Guard', 'Thunder', 300, 3),
(6, 'James Harden', 'https://d2cwpp38twqe55.cloudfront.net/req/201810111/images/players/hardeja01.jpg', 'Shooting Guard and Point Guard', 'Rockets', 300, 3),
(7, 'Giannis Antetokounmpo', 'https://d2cwpp38twqe55.cloudfront.net/req/201810111/images/players/antetgi01.jpg', 'Small Forward and Point Guard and Power Forward and Shooting Guard', 'Bucks', 300, 3),
(8, 'Anthony Davis', 'https://d2cwpp38twqe55.cloudfront.net/req/201810111/images/players/davisan02.jpg', 'Center and Power Forward', 'Pelicans', 300, 3),
(9, 'Jimmy Butler', 'https://d2cwpp38twqe55.cloudfront.net/req/201810111/images/players/butleji01.jpg', 'Shooting Guard and Small Forward', 'Timberwolves', 300, 3),
(10, 'Karl-Anthony Towns', 'https://d2cwpp38twqe55.cloudfront.net/req/201810111/images/players/townska01.jpg', 'Center', 'Timberwolves', 300, 3);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `sports_basketball`
--
ALTER TABLE `sports_basketball`
  ADD PRIMARY KEY (`playerId`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `sports_basketball`
--
ALTER TABLE `sports_basketball`
  MODIFY `playerId` int(3) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
