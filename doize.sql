-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jul 31, 2021 at 08:01 PM
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
  `description_assignment` varchar(255) DEFAULT NULL,
  `course` varchar(50) NOT NULL,
  `duedate_assignment` datetime DEFAULT NULL,
  `reminder_at` datetime DEFAULT NULL,
  `priority` int(11) NOT NULL DEFAULT 0,
  `working_status` int(11) NOT NULL DEFAULT 0,
  `status` int(11) NOT NULL DEFAULT 1,
  `id_user` int(11) NOT NULL,
  `creadate` datetime NOT NULL DEFAULT current_timestamp(),
  `modidate` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `assignment`
--

INSERT INTO `assignment` (`id_assignment`, `name_assignment`, `description_assignment`, `course`, `duedate_assignment`, `reminder_at`, `priority`, `working_status`, `status`, `id_user`, `creadate`, `modidate`) VALUES
(1, 'Latihan_P5_3', 'Latihan activity', 'Pemrograman 7', '2021-07-06 10:45:00', '2021-07-05 02:46:00', 1, 0, 1, 1, '2021-07-12 23:47:48', '2021-07-12 23:47:48'),
(2, 'Latihan spring', 'latihan prg7 spring', 'Pemrograman 7', '2021-07-13 21:20:26', '2021-07-13 21:20:26', 0, 1, 0, 1, '2021-07-13 21:20:26', '2021-07-13 21:20:26'),
(3, 'Latihan jpa ku prg7', 'latihan prg7 gais', 'Pemrograman 7', '2021-07-13 21:20:26', '2021-07-13 21:20:26', 1, 1, 0, 1, '2021-07-13 21:20:26', '2021-07-13 21:20:26'),
(4, 'Latihan P6', 'latihan prg6', 'Pemrograman 6', '2021-07-13 21:20:30', '2021-07-13 21:20:30', 0, 0, 1, 1, '2021-07-12 17:41:59', '2021-07-12 17:41:59'),
(5, 'asd', 'asdasd', 'asd', '2021-07-12 12:57:00', '2021-07-14 07:57:00', 1, 0, 0, 0, '2021-07-31 14:57:22', '2021-07-31 14:57:22');

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
(1, 'Nyuci Baju', 'Mencuci Baju', '2021-07-13 21:20:26', '2021-07-12 21:20:26', 1, 0, 0, 1, '2021-07-12 21:21:04', '2021-07-12 21:21:04'),
(2, 'Membeli Sarapan', 'Ini kita beli sarapan ges', '2021-07-13 21:20:26', '2021-07-13 21:20:26', 0, 1, 0, 1, '2021-07-12 21:21:04', '2021-07-12 21:21:04'),
(3, 'Tidur', 'Ini kita beli sarapan ges', '2021-07-13 21:20:26', '2021-07-13 21:20:26', 0, 1, 0, 1, '2021-07-12 21:21:04', '2021-07-12 21:21:04'),
(4, 'Tidur 4', 'Ini kita beli sarapan ges', '2021-07-13 21:20:26', '2021-07-13 21:20:26', 0, 1, 1, 1, '2021-07-13 09:13:26', '2021-07-13 10:04:50');

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
  `creadate` datetime NOT NULL DEFAULT current_timestamp(),
  `modidate` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `detail_schedule`
--

INSERT INTO `detail_schedule` (`id_detail_schedule`, `name_detail_schedule`, `day_schedule`, `start_time`, `end_time`, `id_schedule`, `creadate`, `modidate`) VALUES
(3, 'Pemrograman 7', 'Wednesday', '13:00:00', '16:00:00', 1, '2021-07-13 07:51:21', '2021-07-13 07:51:21'),
(4, 'Pemrograman 7', 'Thursday', '13:00:00', '16:00:00', 1, '2021-07-27 18:24:02', '2021-07-27 18:24:02'),
(9, 'Pemrograman 6', 'Tuesday', '09:30:00', '12:30:00', 1, '2021-07-29 19:12:00', '2021-07-29 23:57:47'),
(10, 'PRG6', 'Friday', '10:10:00', '11:40:00', 1, '2021-07-29 19:12:21', '2021-07-29 19:12:21'),
(15, 'zxc', 'Sunday', '09:14:00', '05:14:00', 11, '2021-07-29 22:14:42', '2021-07-29 22:14:42'),
(21, 'Node js', 'Sunday', '10:39:00', '01:39:00', 10, '2021-07-29 23:39:06', '2021-07-29 23:39:06');

-- --------------------------------------------------------

--
-- Table structure for table `doize_user`
--

CREATE TABLE `doize_user` (
  `id_user` int(11) NOT NULL,
  `name` varchar(50) NOT NULL,
  `birth_date` date DEFAULT NULL,
  `phone` varchar(13) DEFAULT NULL,
  `email` varchar(50) NOT NULL,
  `password` varchar(255) NOT NULL,
  `status` int(11) NOT NULL,
  `creadate` datetime NOT NULL,
  `modidate` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `doize_user`
--

INSERT INTO `doize_user` (`id_user`, `name`, `birth_date`, `phone`, `email`, `password`, `status`, `creadate`, `modidate`) VALUES
(1, 'Samodra', '2021-06-08', '0895364578867', 'samodra.me@gmail.com', '$2y$12$rBmJzRClAl6LevV0kz1i4etvcU/JO.VxLoMeVrywQzEg3IbpA8sde', 1, '2021-07-24 12:55:09', '2021-07-27 09:31:50'),
(3, 'Meita', '2002-05-23', '087788664575', 'meita.s@gmail.com', '$2y$10$nbjxbTVmKlj4rPG9AgspKu36cNPkfng/fQIIz2OVGxuyst/FASb5u', 1, '2021-07-17 13:56:04', '2021-07-17 13:56:04'),
(5, 'Rizki', '2001-05-24', '0895364578867', 'rzkurniawati.s@gmail.com', '$2y$10$67tnid6IOnyj2Hx0Dc8lDe5we3sFdYvDrGuDysdzmQR5WbSIIEKbe', 1, '2021-07-19 00:21:38', '2021-07-24 00:59:29'),
(8, 'Iankaco', NULL, NULL, 'iankco@gmail.com', '$2y$10$8cE3Fcw2mJqcQmXds0P3b.CazrN4XzeI3fGyecomtKpr955WnK1xi', 1, '2021-07-19 17:23:50', '2021-07-19 17:23:50'),
(10, 'Pras', NULL, NULL, 'pras@gmail.com', '$2y$10$g2VuN3E5LvrRFcYEGmqb4OuAdOR3l4JdWlQ0QdmyslWnuwxGXK.bG', 1, '2021-07-19 18:19:09', '2021-07-19 18:19:09'),
(11, 'Oke', NULL, NULL, 'oke@gmail.com', '$2y$10$c7jTWIQ/N0VY2y6p90eVx.3Vhmq4zIrR5MeLaSvzKWy5TXUpyAeo.', 1, '2021-07-21 07:46:34', '2021-07-21 07:46:34'),
(12, 'Andi', NULL, NULL, 'andi@gmail.com', '$2y$10$GCNRmqxWZb8OvbtYDoJgM.m9hYkWIikqC2G2VtQZGYpbfSh15XB2C', 1, '2021-07-21 08:05:35', '2021-07-21 08:05:35');

-- --------------------------------------------------------

--
-- Table structure for table `pomodoro`
--

CREATE TABLE `pomodoro` (
  `id_pomodoro` int(11) NOT NULL,
  `id_user` int(11) NOT NULL,
  `productivity_time` time NOT NULL DEFAULT '00:25:00',
  `count` int(11) NOT NULL DEFAULT 1,
  `saved_time` time NOT NULL DEFAULT '00:00:00',
  `short_break` time NOT NULL DEFAULT '00:05:00',
  `long_break` time NOT NULL DEFAULT '00:15:00',
  `modidate` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `pomodoro`
--

INSERT INTO `pomodoro` (`id_pomodoro`, `id_user`, `productivity_time`, `count`, `saved_time`, `short_break`, `long_break`, `modidate`) VALUES
(1, 1, '00:20:00', 2, '00:13:25', '00:10:00', '00:15:00', '2021-07-31 17:53:07'),
(2, 3, '00:25:00', 1, '00:00:00', '00:05:00', '00:15:00', '2021-07-31 17:54:14');

-- --------------------------------------------------------

--
-- Table structure for table `pomodoro_activity`
--

CREATE TABLE `pomodoro_activity` (
  `id_pomodoro_activity` int(11) NOT NULL,
  `id_pomodoro` int(11) NOT NULL,
  `activity_name` varchar(100) NOT NULL,
  `working_status` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `schedule`
--

CREATE TABLE `schedule` (
  `id_schedule` int(11) NOT NULL,
  `name_schedule` varchar(50) NOT NULL,
  `description_schedule` varchar(255) DEFAULT NULL,
  `status` int(11) NOT NULL DEFAULT 1,
  `id_user` int(11) NOT NULL,
  `creadate` datetime NOT NULL DEFAULT current_timestamp(),
  `modidate` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `schedule`
--

INSERT INTO `schedule` (`id_schedule`, `name_schedule`, `description_schedule`, `status`, `id_user`, `creadate`, `modidate`) VALUES
(1, 'Poltek Astra', 'Jadwal Kuliah MI 2019 Politeknik Astra', 1, 1, '2021-07-22 18:45:34', '2021-07-22 18:45:34'),
(2, 'Poltek Astra', 'Jadwal Kuliah MI 2018 Poltek Astra', 1, 1, '2021-07-22 18:45:56', '2021-07-30 09:28:36'),
(3, 'IDCamp', 'IDCamp 2021', 1, 1, '2021-07-22 21:36:55', '2021-07-30 10:09:19'),
(10, 'Binus', 'Kuliah Binus', 0, 1, '2021-07-27 01:23:34', '2021-07-30 09:04:42'),
(11, 'tes', 'tes', 0, 1, '2021-07-27 08:16:17', '2021-07-30 09:47:18'),
(12, 'Test2', 'test3', 0, 1, '2021-07-27 09:32:30', '2021-07-30 09:04:37'),
(13, 'asda', 'sdasd', 0, 1, '2021-07-29 18:56:47', '2021-07-29 18:56:47'),
(14, 'asdzxc', 'zxczxc', 0, 1, '2021-07-29 18:56:57', '2021-07-29 18:56:57');

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
-- Indexes for table `doize_user`
--
ALTER TABLE `doize_user`
  ADD PRIMARY KEY (`id_user`);

--
-- Indexes for table `pomodoro`
--
ALTER TABLE `pomodoro`
  ADD PRIMARY KEY (`id_pomodoro`),
  ADD KEY `pomodoro_user` (`id_user`);

--
-- Indexes for table `pomodoro_activity`
--
ALTER TABLE `pomodoro_activity`
  ADD PRIMARY KEY (`id_pomodoro_activity`),
  ADD KEY `pomodoro_activity_pomodoro` (`id_pomodoro`);

--
-- Indexes for table `schedule`
--
ALTER TABLE `schedule`
  ADD PRIMARY KEY (`id_schedule`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `assignment`
--
ALTER TABLE `assignment`
  MODIFY `id_assignment` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `daily_activity`
--
ALTER TABLE `daily_activity`
  MODIFY `id_daily_activity` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `detail_schedule`
--
ALTER TABLE `detail_schedule`
  MODIFY `id_detail_schedule` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;

--
-- AUTO_INCREMENT for table `doize_user`
--
ALTER TABLE `doize_user`
  MODIFY `id_user` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `pomodoro`
--
ALTER TABLE `pomodoro`
  MODIFY `id_pomodoro` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `pomodoro_activity`
--
ALTER TABLE `pomodoro_activity`
  MODIFY `id_pomodoro_activity` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `schedule`
--
ALTER TABLE `schedule`
  MODIFY `id_schedule` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `pomodoro`
--
ALTER TABLE `pomodoro`
  ADD CONSTRAINT `pomodoro_user` FOREIGN KEY (`id_user`) REFERENCES `doize_user` (`id_user`);

--
-- Constraints for table `pomodoro_activity`
--
ALTER TABLE `pomodoro_activity`
  ADD CONSTRAINT `pomodoro_activity_pomodoro` FOREIGN KEY (`id_pomodoro`) REFERENCES `pomodoro` (`id_pomodoro`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
