-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jul 12, 2021 at 05:46 PM
-- Server version: 10.4.11-MariaDB
-- PHP Version: 7.4.5

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `doize`
--

-- --------------------------------------------------------

--
-- Table structure for table `assignment`
--

CREATE TABLE `assignment` (
  `id_assignment` int(11) NOT NULL,
  `name_assignment` varchar(50) NOT NULL,
  `description_assignment` varchar(255) NOT NULL,
  `course` varchar(50) NOT NULL,
  `duedate_assignment` date NOT NULL,
  `reminder_at` date NOT NULL,
  `priority` int(11) NOT NULL,
  `working_status` int(11) NOT NULL,
  `status` int(11) NOT NULL,
  `id_user` int(11) NOT NULL,
  `creaby` varchar(50) NOT NULL,
  `creadate` date NOT NULL,
  `modiby` varchar(50) NOT NULL,
  `modidate` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `daily_activity`
--

CREATE TABLE `daily_activity` (
  `id_daily_activity` int(11) NOT NULL,
  `name_daily_activity` varchar(50) NOT NULL,
  `description_daily_activity` varchar(255) DEFAULT NULL,
  `duedate_daily_activity` datetime DEFAULT NULL,
  `reminder_at` datetime DEFAULT NULL,
  `priority` int(11) NOT NULL DEFAULT 0,
  `working_status` int(11) NOT NULL DEFAULT 0,
  `status` int(11) NOT NULL DEFAULT 1,
  `id_user` int(11) NOT NULL,
  `creadate` datetime NOT NULL DEFAULT current_timestamp(),
  `modidate` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `daily_activity`
--

INSERT INTO `daily_activity` (`id_daily_activity`, `name_daily_activity`, `description_daily_activity`, `duedate_daily_activity`, `reminder_at`, `priority`, `working_status`, `status`, `id_user`, `creadate`, `modidate`) VALUES
(1, 'Nyuci Baju', 'Mencuci Baju', '2021-07-13 21:20:26', '2021-07-12 21:20:26', 1, 0, 1, 1, '2021-07-12 21:21:04', '2021-07-12 21:21:04'),
(2, 'Membeli Sarapan', 'Ini kita beli sarapan ges', '2021-07-13 21:20:26', '2021-07-13 21:20:26', 0, 1, 1, 1, '2021-07-12 21:21:04', '2021-07-12 21:21:04'),
(3, 'Tidur', 'Ini kita beli sarapan ges', '2021-07-13 21:20:26', '2021-07-13 21:20:26', 0, 1, 0, 1, '2021-07-12 21:21:04', '2021-07-12 21:21:04');

-- --------------------------------------------------------

--
-- Table structure for table `detail_schedule`
--

CREATE TABLE `detail_schedule` (
  `id_detail_schedule` int(11) NOT NULL,
  `name_detail_schedule` varchar(255) NOT NULL,
  `day_schedule` varchar(20) NOT NULL,
  `start_time` time NOT NULL,
  `end_time` time NOT NULL,
  `id_schedule` int(11) NOT NULL,
  `creaby` varchar(50) NOT NULL,
  `creadate` date NOT NULL,
  `modiby` varchar(50) NOT NULL,
  `modidate` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `schedule`
--

CREATE TABLE `schedule` (
  `id_schedule` int(11) NOT NULL,
  `name_schedule` varchar(50) NOT NULL,
  `description_schedule` varchar(255) NOT NULL,
  `status` int(11) NOT NULL,
  `id_user` int(11) NOT NULL,
  `creaby` varchar(50) NOT NULL,
  `creadate` date NOT NULL,
  `modiby` varchar(50) NOT NULL,
  `modidate` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `id_user` int(11) NOT NULL,
  `first_name` varchar(50) NOT NULL,
  `last_name` varchar(50) NOT NULL,
  `birth_date` date NOT NULL,
  `phone` varchar(13) NOT NULL,
  `email` varchar(50) NOT NULL,
  `password` varchar(20) NOT NULL,
  `status` int(11) NOT NULL,
  `creadate` datetime NOT NULL,
  `modidate` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`id_user`, `first_name`, `last_name`, `birth_date`, `phone`, `email`, `password`, `status`, `creadate`, `modidate`) VALUES
(1, 'Samodra', 'Samodra', '2000-12-08', '081234331541', 'samodra.me@gmail.com', 'Samodra1234', 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `assignment`
--
ALTER TABLE `assignment`
  ADD PRIMARY KEY (`id_assignment`);

--
-- Indexes for table `daily_activity`
--
ALTER TABLE `daily_activity`
  ADD PRIMARY KEY (`id_daily_activity`);

--
-- Indexes for table `detail_schedule`
--
ALTER TABLE `detail_schedule`
  ADD PRIMARY KEY (`id_detail_schedule`);

--
-- Indexes for table `schedule`
--
ALTER TABLE `schedule`
  ADD PRIMARY KEY (`id_schedule`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id_user`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `assignment`
--
ALTER TABLE `assignment`
  MODIFY `id_assignment` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `daily_activity`
--
ALTER TABLE `daily_activity`
  MODIFY `id_daily_activity` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `detail_schedule`
--
ALTER TABLE `detail_schedule`
  MODIFY `id_detail_schedule` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `schedule`
--
ALTER TABLE `schedule`
  MODIFY `id_schedule` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `id_user` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
