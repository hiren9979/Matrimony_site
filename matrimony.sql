-- phpMyAdmin SQL Dump
-- version 5.1.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Mar 29, 2021 at 08:46 AM
-- Server version: 10.4.18-MariaDB
-- PHP Version: 7.3.27

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `matrimony`
--

-- --------------------------------------------------------

--
-- Table structure for table `chat`
--

CREATE TABLE `chat` (
  `id` int(10) NOT NULL,
  `sender_user` int(10) NOT NULL,
  `receiver_user` int(10) NOT NULL,
  `send_time` timestamp(6) NOT NULL DEFAULT current_timestamp(6),
  `read_time` timestamp(6) NULL DEFAULT NULL,
  `text` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `chat`
--

INSERT INTO `chat` (`id`, `sender_user`, `receiver_user`, `send_time`, `read_time`, `text`) VALUES
(1, 24, 25, '2021-03-28 06:25:18.914894', NULL, 'hi\r\n'),
(2, 25, 24, '2021-03-28 06:27:00.738259', NULL, 'hi\r\n'),
(3, 25, 24, '2021-03-28 06:27:15.412089', NULL, 'big fan '),
(4, 24, 25, '2021-03-28 06:27:45.050879', NULL, 'hi\r\n'),
(5, 24, 25, '2021-03-28 06:28:01.526076', NULL, 'hi\r\n'),
(6, 27, 24, '2021-03-29 04:49:51.683226', NULL, 'bk jb hjvbvkjbfdkh'),
(7, 27, 24, '2021-03-29 04:49:55.323673', NULL, 'bj ghh h ');

-- --------------------------------------------------------

--
-- Table structure for table `record`
--

CREATE TABLE `record` (
  `fname` varchar(60) DEFAULT NULL,
  `lname` varchar(60) DEFAULT NULL,
  `email` varchar(60) DEFAULT NULL,
  `phone` varchar(10) DEFAULT NULL,
  `password` varchar(60) NOT NULL,
  `dob` date DEFAULT NULL,
  `gender` varchar(60) DEFAULT NULL,
  `age` int(10) DEFAULT NULL,
  `religion` varchar(40) DEFAULT NULL,
  `mother_tongue` varchar(40) DEFAULT NULL,
  `education` varchar(60) DEFAULT NULL,
  `hometown` varchar(40) DEFAULT NULL,
  `image` varchar(60) DEFAULT NULL,
  `job` varchar(40) DEFAULT NULL,
  `salary` int(30) DEFAULT NULL,
  `other_details` varchar(100) DEFAULT NULL,
  `id` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `record`
--

INSERT INTO `record` (`fname`, `lname`, `email`, `phone`, `password`, `dob`, `gender`, `age`, `religion`, `mother_tongue`, `education`, `hometown`, `image`, `job`, `salary`, `other_details`, `id`) VALUES
('hiren', 'chavda', 'hirern11@gmail.com', '7016801492', '111111', '2002-07-12', 'male', 19, 'hindu', 'hindi', 'btech', '', '_DSC0088.JPG', '', 1, '                ', 16),
('harshit', 'ambaliya', 'harshit111@gmail.com', '9977868690', '12341234', '2021-03-03', 'male', 19, 'hindu', 'gujarati', 'btech', 'jamnagar', NULL, 'Student', 3000000, 'very good', 17),
('11', '22', '1111@gmail.com', '9988776655', '121212', '2002-07-12', 'on', 30, 'jain', 'marathi', 'btech', 'JaMnAgAr', '_DSC0064.JPG', 'CoMpUtEr EnGiNeErInG', 35000, '                good', 24),
('tony', 'stark', 'jarvis@gmail.com', '7016801492', 'jarvis12', '2002-07-12', 'on', 19, 'hindu', 'gujrati', 'phd', 'JaMnAgAr', NULL, 'ScIeNtIsT', 50000, 'GeNIus,PlayBoY,HeRo,PhIlAnThRoPiSt', 25),
('ronak', 'Dattani', 'ronak11@gmail.com', '9988776655', '000000', '2000-07-12', 'male', 30, 'hindu', 'hindi', 'btech', 'rajkot', '_DSC0079.JPG', 'businessman', 1, '                ', 26),
('Abhay', 'Shah', 'abhayshah1@ghail.com', '9990889067', 'abhayshah', '1996-07-12', 'male', 23, 'hindu', 'gujrati', 'Phd', 'Jamnagar', 'cartoon-boy-images-4.jpg', 'professor', 35000, 'intrest in reading books and novels                 ', 27);

-- --------------------------------------------------------

--
-- Table structure for table `review`
--

CREATE TABLE `review` (
  `name` varchar(20) DEFAULT NULL,
  `email` varchar(20) DEFAULT NULL,
  `message` varchar(20) DEFAULT NULL,
  `Rating` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `review`
--

INSERT INTO `review` (`name`, `email`, `message`, `Rating`) VALUES
('Hiren Chavda', '1111@gmail.com', '', 'Very Good'),
('', '', '', ''),
('', '', '', ''),
('', '', '', ''),
('', '', '', ''),
('', '', '', ''),
('', '', '', ''),
('', '', '', ''),
('', '', '', ''),
('', '', '', ''),
('', '', '', ''),
('', '', '', ''),
('', '', '', ''),
('', '', '', ''),
('', '', '', ''),
('', '', '', ''),
('', '', '', ''),
('', '', '', ''),
('', '', '', ''),
('Hiren Chavda', 'yash11@gmail.com', '', 'Perfect'),
('Hiren Chavda', 'yash11@gmail.com', '', 'Perfect'),
('', '', '', ''),
('', '', '', ''),
('', '', '', ''),
('', '', '', ''),
('', '', '', ''),
('', '', '', ''),
('', '', '', ''),
('', '', '', ''),
('', '', '', ''),
('', '', '', ''),
('Hiren Chavda', '19ceubg034@ddu.ac.in', '', 'Average'),
('Hiren Chavda', '19ceubg034@ddu.ac.in', '', 'Average'),
('', '', '', ''),
('Hiren Chavda', 'hirern11@gmail.com', '', 'Average'),
('', '', '', ''),
('', '', '', ''),
('', '', '', ''),
('', '', '', ''),
('', '', '', ''),
('', '', '', ''),
('', '', '', ''),
('hiren', 'hirenchavda142@gmail', 'jhvg h', '6'),
(NULL, NULL, NULL, NULL),
('hiren', 'hirenchavda141@gmail', 'jhvg h', '6'),
('hjbj ', 'h j ', 'hjbjb', 'j jg');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `chat`
--
ALTER TABLE `chat`
  ADD PRIMARY KEY (`id`),
  ADD KEY `foreign_key` (`receiver_user`),
  ADD KEY `foreign_key_2` (`sender_user`);

--
-- Indexes for table `record`
--
ALTER TABLE `record`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `chat`
--
ALTER TABLE `chat`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `record`
--
ALTER TABLE `record`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=28;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `chat`
--
ALTER TABLE `chat`
  ADD CONSTRAINT `foreign_key_2` FOREIGN KEY (`sender_user`) REFERENCES `record` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
