qa-- phpMyAdmin SQL Dump
-- version 4.9.0.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: May 01, 2020 at 09:41 AM
-- Server version: 10.4.6-MariaDB
-- PHP Version: 7.3.9

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `adel`
--

-- --------------------------------------------------------

--
-- Table structure for table `tb_album`
--

CREATE TABLE `tb_album` (
  `artist_id` smallint(5) NOT NULL,
  `album_id` smallint(5) NOT NULL,
  `album_name` char(128) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `tb_album`
--

INSERT INTO `tb_album` (`artist_id`, `album_id`, `album_name`) VALUES
(1, 1, 'Celengan Rindurr'),
(2, 2, 'Mantan Terindah'),
(5, 7, 'adele');

-- --------------------------------------------------------

--
-- Table structure for table `tb_artist`
--

CREATE TABLE `tb_artist` (
  `artist_id` smallint(5) NOT NULL,
  `artist_name` char(128) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `tb_artist`
--

INSERT INTO `tb_artist` (`artist_id`, `artist_name`) VALUES
(1, 'billy'),
(2, 'Raisa'),
(3, 'asdas'),
(4, 'cccc'),
(5, 'bbb'),
(6, 'vvv'),
(7, 'zz'),
(8, 'nnnn');

-- --------------------------------------------------------

--
-- Table structure for table `tb_played`
--

CREATE TABLE `tb_played` (
  `played_id` smallint(3) NOT NULL,
  `artist_id` smallint(5) NOT NULL,
  `album_id` smallint(5) NOT NULL,
  `track_id` smallint(3) NOT NULL,
  `played` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `tb_played`
--

INSERT INTO `tb_played` (`played_id`, `artist_id`, `album_id`, `track_id`, `played`) VALUES
(1, 2, 2, 1, '0000-00-00 00:00:00');

-- --------------------------------------------------------

--
-- Table structure for table `tb_track`
--

CREATE TABLE `tb_track` (
  `track_id` smallint(3) NOT NULL,
  `track_name` char(128) DEFAULT NULL,
  `artist_id` smallint(3) NOT NULL,
  `album_id` smallint(5) NOT NULL,
  `waktu` decimal(5,2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `tb_track`
--

INSERT INTO `tb_track` (`track_id`, `track_name`, `artist_id`, `album_id`, `waktu`) VALUES
(1, NULL, 2, 2, '4.00');

-- --------------------------------------------------------

--
-- Table structure for table `tb_user`
--

CREATE TABLE `tb_user` (
  `id` int(11) NOT NULL,
  `nama` varchar(100) NOT NULL,
  `email` varchar(200) NOT NULL,
  `password` varchar(200) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tb_user`
--

INSERT INTO `tb_user` (`id`, `nama`, `email`, `password`) VALUES
(1, 'adel', 'adel@gmail.com', 'adel123'),
(2, 'adel', 'adel123@gmail.com', 'adel123'),
(3, 'Azmil', 'azmil@gmail.com', 'azmil123');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `tb_album`
--
ALTER TABLE `tb_album`
  ADD PRIMARY KEY (`album_id`),
  ADD KEY `artist_id` (`artist_id`);

--
-- Indexes for table `tb_artist`
--
ALTER TABLE `tb_artist`
  ADD PRIMARY KEY (`artist_id`);

--
-- Indexes for table `tb_played`
--
ALTER TABLE `tb_played`
  ADD PRIMARY KEY (`played_id`),
  ADD KEY `artist_id` (`artist_id`),
  ADD KEY `album_id` (`album_id`),
  ADD KEY `track_id` (`track_id`);

--
-- Indexes for table `tb_track`
--
ALTER TABLE `tb_track`
  ADD PRIMARY KEY (`track_id`),
  ADD KEY `artist_id` (`artist_id`),
  ADD KEY `album_id` (`album_id`);

--
-- Indexes for table `tb_user`
--
ALTER TABLE `tb_user`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `tb_album`
--
ALTER TABLE `tb_album`
  MODIFY `album_id` smallint(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `tb_artist`
--
ALTER TABLE `tb_artist`
  MODIFY `artist_id` smallint(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `tb_played`
--
ALTER TABLE `tb_played`
  MODIFY `played_id` smallint(3) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `tb_track`
--
ALTER TABLE `tb_track`
  MODIFY `track_id` smallint(3) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `tb_user`
--
ALTER TABLE `tb_user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `tb_album`
--
ALTER TABLE `tb_album`
  ADD CONSTRAINT `tb_album_ibfk_1` FOREIGN KEY (`artist_id`) REFERENCES `tb_artist` (`artist_id`);

--
-- Constraints for table `tb_played`
--
ALTER TABLE `tb_played`
  ADD CONSTRAINT `tb_played_ibfk_1` FOREIGN KEY (`artist_id`) REFERENCES `tb_artist` (`artist_id`),
  ADD CONSTRAINT `tb_played_ibfk_2` FOREIGN KEY (`album_id`) REFERENCES `tb_album` (`album_id`),
  ADD CONSTRAINT `tb_played_ibfk_3` FOREIGN KEY (`track_id`) REFERENCES `tb_track` (`track_id`);

--
-- Constraints for table `tb_track`
--
ALTER TABLE `tb_track`
  ADD CONSTRAINT `tb_track_ibfk_1` FOREIGN KEY (`artist_id`) REFERENCES `tb_artist` (`artist_id`),
  ADD CONSTRAINT `tb_track_ibfk_2` FOREIGN KEY (`album_id`) REFERENCES `tb_album` (`album_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
