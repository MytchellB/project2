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
-- Table structure for table `sports_baseball`
--

CREATE TABLE `sports_baseball` (
  `playerId` int(3) NOT NULL,
  `playerName` varchar(255) NOT NULL,
  `playerImage` varchar(255) NOT NULL,
  `playerPos` varchar(255) NOT NULL,
  `playerTeam` varchar(255) NOT NULL,
  `price` int(3) NOT NULL,
  `catId` int(3) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `sports_baseball`
--

INSERT INTO `sports_baseball` (`playerId`, `playerName`, `playerImage`, `playerPos`, `playerTeam`, `price`, `catId`) VALUES
(1, 'Mike Trout', 'https://d3k2oh6evki4b7.cloudfront.net/req/201810091/images/headshots/f/f322d40f_mlbam.jpg', 'Center Fielder', 'Angels', 200, 2),
(2, 'Jose Altuve', 'https://d3k2oh6evki4b7.cloudfront.net/req/201810091/images/headshots/f/f0e8fd62_mlbam.jpg', 'Second Baseman', 'Astros', 200, 2),
(3, 'Kris Bryant', 'https://d3k2oh6evki4b7.cloudfront.net/req/201810091/images/headshots/1/1d358f93_mlbam.jpg', 'Third Baseman and Outfielder', 'Cubs', 200, 2),
(4, 'Max Scherzer', 'https://d3k2oh6evki4b7.cloudfront.net/req/201810091/images/headshots/6/65381047_mlbam.jpg', 'Pitcher', 'Nationals', 200, 2),
(5, 'Joey Votto', 'https://d3k2oh6evki4b7.cloudfront.net/req/201810091/images/headshots/9/9f4721ab_mlbam.jpg', 'First Baseman', 'Reds', 200, 2),
(6, 'Mookie Betts', 'https://d3k2oh6evki4b7.cloudfront.net/req/201810091/images/headshots/f/f3a0cc68_mlbam.jpg', 'Right Fielder', 'Red Sox', 200, 2),
(7, 'Clayton Kershaw', 'https://d3k2oh6evki4b7.cloudfront.net/req/201810091/images/headshots/0/0caa3053_mlbam.jpg', 'Pitcher', 'Dodgers', 200, 2),
(8, 'Nolan Arenado', 'https://d3k2oh6evki4b7.cloudfront.net/req/201810091/images/headshots/4/4009314f_mlbam.jpg', 'Third Baseman', 'Rockies', 200, 2),
(9, 'Carlos Correa', 'https://d3k2oh6evki4b7.cloudfront.net/req/201810091/images/headshots/3/33687c9b_mlbam.jpg', 'Short Stop', 'Astros', 200, 2),
(10, 'Paul Goldschimidt', 'https://d3k2oh6evki4b7.cloudfront.net/req/201810091/images/headshots/6/6b37a7f2_mlbam.jpg', 'First Baseman', 'Diamondbacks', 200, 2);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `sports_baseball`
--
ALTER TABLE `sports_baseball`
  ADD PRIMARY KEY (`playerId`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `sports_baseball`
--
ALTER TABLE `sports_baseball`
  MODIFY `playerId` int(3) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
