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
-- Table structure for table `sports_football`
--

CREATE TABLE `sports_football` (
  `playerId` int(3) NOT NULL,
  `playerName` varchar(255) NOT NULL,
  `playerImage` varchar(255) NOT NULL,
  `playerPos` varchar(255) NOT NULL,
  `playerTeam` varchar(255) NOT NULL,
  `price` int(3) NOT NULL,
  `catId` int(3) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `sports_football`
--

INSERT INTO `sports_football` (`playerId`, `playerName`, `playerImage`, `playerPos`, `playerTeam`, `price`, `catId`) VALUES
(1, 'Tom Brady', 'http://static.nfl.com/static/content/public/static/img/fantasy/transparent/200x200/BRA371156.png', 'Quarter Back', 'Patriots', 100, 1),
(2, 'Antonio Brown', 'https://d395i9ljze9h3x.cloudfront.net/req/20180910/images/headshots/BrowAn04_2018.jpg', 'Wide Receiver', 'Steelers', 100, 1),
(3, 'Carson Wentz', 'https://d395i9ljze9h3x.cloudfront.net/req/20180910/images/headshots/WentCa00_2018.jpg', 'Quarter Back', 'Eagles', 100, 1),
(4, 'Julio Jones', 'https://d395i9ljze9h3x.cloudfront.net/req/20180910/images/headshots/JoneJu02_2018.jpg', 'Wide Receiver', 'Falcons', 100, 1),
(5, 'LeVeon Bell', 'https://d395i9ljze9h3x.cloudfront.net/req/20180910/images/headshots/BellLe00_2018.jpg', 'Running Back', 'Steelers', 100, 1),
(6, 'Todd Gurley', 'https://d395i9ljze9h3x.cloudfront.net/req/20180910/images/headshots/GurlTo01_2018.jpg', 'Running Back', 'Rams', 100, 1),
(7, 'Aaron Donald', 'https://d395i9ljze9h3x.cloudfront.net/req/20180910/images/headshots/DonaAa00_2018.jpg', 'Defensive Tackle', 'Rams', 100, 1),
(8, 'Drew Brees', 'https://d395i9ljze9h3x.cloudfront.net/req/20180910/images/headshots/BreeDr00_2018.jpg', 'Quarter Back', 'Saints', 100, 1),
(9, 'Von Miller', 'https://d395i9ljze9h3x.cloudfront.net/req/20180910/images/headshots/MillVo00_2018.jpg', 'Line Backer', 'Broncos', 100, 1),
(10, 'Aaron Rodgers', 'https://d395i9ljze9h3x.cloudfront.net/req/20180910/images/headshots/RodgAa00_2018.jpg', 'Quarter Back', 'Packers', 100, 1);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `sports_football`
--
ALTER TABLE `sports_football`
  ADD PRIMARY KEY (`playerId`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `sports_football`
--
ALTER TABLE `sports_football`
  MODIFY `playerId` int(3) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
