-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3306
-- Generation Time: Feb 12, 2022 at 08:25 PM
-- Server version: 5.7.31
-- PHP Version: 7.4.9

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `chat_system`
--

-- --------------------------------------------------------

--
-- Table structure for table `chat`
--

DROP TABLE IF EXISTS `chat`;
CREATE TABLE IF NOT EXISTS `chat` (
  `chatid` int(11) NOT NULL AUTO_INCREMENT,
  `userid` int(11) NOT NULL,
  `chatroomid` int(11) NOT NULL,
  `message` varchar(200) NOT NULL,
  `chat_date` datetime NOT NULL,
  PRIMARY KEY (`chatid`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `chat`
--

INSERT INTO `chat` (`chatid`, `userid`, `chatroomid`, `message`, `chat_date`) VALUES
(2, 2, 4, 'Salam', '2021-10-04 23:03:46'),
(3, 1, 4, 'test', '2021-10-04 23:04:02'),
(4, 2, 4, 'test', '2021-10-04 23:04:08'),
(5, 2, 4, 'te', '2021-10-04 23:04:10'),
(6, 1, 4, 'test', '2021-10-04 23:04:13');

-- --------------------------------------------------------

--
-- Table structure for table `chatroom`
--

DROP TABLE IF EXISTS `chatroom`;
CREATE TABLE IF NOT EXISTS `chatroom` (
  `chatroomid` int(11) NOT NULL AUTO_INCREMENT,
  `chat_name` varchar(60) NOT NULL,
  `date_created` datetime NOT NULL,
  `chat_password` varchar(30) NOT NULL,
  `userid` int(11) NOT NULL,
  PRIMARY KEY (`chatroomid`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `chatroom`
--

INSERT INTO `chatroom` (`chatroomid`, `chat_name`, `date_created`, `chat_password`, `userid`) VALUES
(4, 'EA Devlopers', '2021-10-04 23:03:10', '', 1);

-- --------------------------------------------------------

--
-- Table structure for table `chat_member`
--

DROP TABLE IF EXISTS `chat_member`;
CREATE TABLE IF NOT EXISTS `chat_member` (
  `chat_memberid` int(11) NOT NULL AUTO_INCREMENT,
  `chatroomid` int(11) NOT NULL,
  `userid` int(11) NOT NULL,
  PRIMARY KEY (`chat_memberid`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `chat_member`
--

INSERT INTO `chat_member` (`chat_memberid`, `chatroomid`, `userid`) VALUES
(6, 4, 1),
(7, 4, 2);

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
CREATE TABLE IF NOT EXISTS `user` (
  `userid` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(30) NOT NULL,
  `password` varchar(150) NOT NULL,
  `uname` varchar(60) NOT NULL,
  `photo` varchar(200) NOT NULL,
  `access` int(1) NOT NULL,
  PRIMARY KEY (`userid`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`userid`, `username`, `password`, `uname`, `photo`, `access`) VALUES
(1, 'asefg482', 'e4b03a30de69123a3cb2c62effc21f12', 'Asef Ghorbani - Admin', '', 1),
(2, 'test', '098f6bcd4621d373cade4e832627b4f6', 'test', '', 2),
(3, 'ali', '81dc9bdb52d04dc20036dbd8313ed055', 'Ali', '', 2);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
