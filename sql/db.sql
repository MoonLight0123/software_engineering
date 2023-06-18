-- phpMyAdmin SQL Dump
-- version 4.8.5
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3306
-- Generation Time: Jun 18, 2023 at 10:22 AM
-- Server version: 10.1.38-MariaDB
-- PHP Version: 7.1.26

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `db`
--

-- --------------------------------------------------------

--
-- Table structure for table `course`
--

CREATE TABLE `course` (
  `cno` int(11) NOT NULL,
  `cname` varchar(20) COLLATE utf8_danish_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_danish_ci;

--
-- Dumping data for table `course`
--

INSERT INTO `course` (`cno`, `cname`) VALUES
(1, '英语六级'),
(2, '英语四级');

-- --------------------------------------------------------

--
-- Table structure for table `exam`
--

CREATE TABLE `exam` (
  `eid` int(11) NOT NULL,
  `pname` varchar(20) COLLATE utf8_danish_ci NOT NULL,
  `cno` int(11) NOT NULL,
  `userid` int(11) NOT NULL,
  `classid` int(11) NOT NULL,
  `singlenumber` int(11) NOT NULL,
  `singlecore` int(11) NOT NULL,
  `multiplenumber` int(11) NOT NULL,
  `multiplecore` int(11) NOT NULL,
  `examdate` date NOT NULL,
  `examtime` date NOT NULL,
  `testtime` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_danish_ci;

--
-- Dumping data for table `exam`
--

INSERT INTO `exam` (`eid`, `pname`, `cno`, `userid`, `classid`, `singlenumber`, `singlecore`, `multiplenumber`, `multiplecore`, `examdate`, `examtime`, `testtime`) VALUES
(2, '2023六月六级考试', 1, 2, 1, 1, 10, 0, 0, '2023-06-03', '2023-06-03', 15),
(3, '2023六月四级考试', 1, 2, 1, 3, 10, 0, 0, '2023-06-03', '2023-06-03', 15);

-- --------------------------------------------------------

--
-- Table structure for table `paper`
--

CREATE TABLE `paper` (
  `pid` int(11) NOT NULL,
  `eid` int(11) NOT NULL,
  `sid` int(11) NOT NULL,
  `cno` int(11) NOT NULL,
  `stype` int(11) NOT NULL,
  `scontent` varchar(255) COLLATE utf8_danish_ci NOT NULL,
  `sa` varchar(255) COLLATE utf8_danish_ci NOT NULL,
  `sb` varchar(255) COLLATE utf8_danish_ci NOT NULL,
  `sc` varchar(255) COLLATE utf8_danish_ci NOT NULL,
  `sd` varchar(255) COLLATE utf8_danish_ci NOT NULL,
  `skey` varchar(255) COLLATE utf8_danish_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_danish_ci;

--
-- Dumping data for table `paper`
--

INSERT INTO `paper` (`pid`, `eid`, `sid`, `cno`, `stype`, `scontent`, `sa`, `sb`, `sc`, `sd`, `skey`) VALUES
(2, 2, 4, 0, 1, 'Give me your telephone number __ I need your help.', 'in case', 'so that', 'unless', 'test', 'A'),
(3, 3, 4, 0, 1, 'Give me your telephone number __ I need your help.', 'in case', 'so that', 'unless', 'test', 'A'),
(4, 3, 5, 0, 1, 'He was knocked down by a car and badly _', 'injured', 'damaged', 'hurted', 'ruined', 'C'),
(5, 3, 1, 0, 1, 'The book contained a large__ of information', 'deal', 'amount', 'number', 'sum', 'B');

-- --------------------------------------------------------

--
-- Table structure for table `pjclass`
--

CREATE TABLE `pjclass` (
  `classid` int(11) NOT NULL,
  `classname` varchar(20) COLLATE utf8_danish_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_danish_ci;

--
-- Dumping data for table `pjclass`
--

INSERT INTO `pjclass` (`classid`, `classname`) VALUES
(1, 'A卷'),
(2, 'B卷'),
(6, '备用卷');

-- --------------------------------------------------------

--
-- Table structure for table `role`
--

CREATE TABLE `role` (
  `roleid` int(11) NOT NULL,
  `rolename` varchar(20) COLLATE utf8_danish_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_danish_ci;

--
-- Dumping data for table `role`
--

INSERT INTO `role` (`roleid`, `rolename`) VALUES
(1, '老师'),
(2, '学生'),
(3, '管理员');

-- --------------------------------------------------------

--
-- Table structure for table `studentexam`
--

CREATE TABLE `studentexam` (
  `seid` int(11) NOT NULL,
  `userid` int(11) NOT NULL,
  `classid` int(11) NOT NULL,
  `eid` int(11) NOT NULL,
  `pname` varchar(20) COLLATE utf8_danish_ci NOT NULL,
  `zscore` int(11) NOT NULL,
  `score` int(11) NOT NULL,
  `tjtime` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_danish_ci;

--
-- Dumping data for table `studentexam`
--

INSERT INTO `studentexam` (`seid`, `userid`, `classid`, `eid`, `pname`, `zscore`, `score`, `tjtime`) VALUES
(1, 3, 1, 2, '2023六月六级考试', 10, 0, '2023-06-03 00:56:42');

-- --------------------------------------------------------

--
-- Table structure for table `studentsubject`
--

CREATE TABLE `studentsubject` (
  `ssid` int(11) NOT NULL,
  `seid` int(11) NOT NULL,
  `userid` int(11) NOT NULL,
  `eid` int(11) NOT NULL,
  `sid` int(11) NOT NULL,
  `studentkey` varchar(10) COLLATE utf8_danish_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_danish_ci;

--
-- Dumping data for table `studentsubject`
--

INSERT INTO `studentsubject` (`ssid`, `seid`, `userid`, `eid`, `sid`, `studentkey`) VALUES
(1, 1, 3, 2, 4, 'D');

-- --------------------------------------------------------

--
-- Table structure for table `subject`
--

CREATE TABLE `subject` (
  `sid` int(11) NOT NULL,
  `cno` int(11) NOT NULL,
  `stype` int(11) NOT NULL,
  `scontent` varchar(255) COLLATE utf8_danish_ci NOT NULL,
  `sa` varchar(255) COLLATE utf8_danish_ci NOT NULL,
  `sb` varchar(255) COLLATE utf8_danish_ci NOT NULL,
  `sc` varchar(255) COLLATE utf8_danish_ci NOT NULL,
  `sd` varchar(255) COLLATE utf8_danish_ci NOT NULL,
  `skey` varchar(255) COLLATE utf8_danish_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_danish_ci;

--
-- Dumping data for table `subject`
--

INSERT INTO `subject` (`sid`, `cno`, `stype`, `scontent`, `sa`, `sb`, `sc`, `sd`, `skey`) VALUES
(1, 1, 1, 'The book contained a large__ of information', 'deal', 'amount', 'number', 'sum', 'B'),
(4, 1, 1, 'Give me your telephone number __ I need your help.', 'in case', 'so that', 'unless', 'test', 'A'),
(5, 1, 1, 'He was knocked down by a car and badly _', 'injured', 'damaged', 'hurted', 'ruined', 'C');

-- --------------------------------------------------------

--
-- Table structure for table `type`
--

CREATE TABLE `type` (
  `stype` int(11) NOT NULL,
  `name` varchar(30) COLLATE utf8_danish_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_danish_ci;

--
-- Dumping data for table `type`
--

INSERT INTO `type` (`stype`, `name`) VALUES
(1, '一，单选题'),
(2, '二，多选题');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `userid` int(11) NOT NULL,
  `roleid` int(11) DEFAULT NULL,
  `username` varchar(20) COLLATE utf8_danish_ci DEFAULT NULL,
  `userpwd` varchar(20) COLLATE utf8_danish_ci DEFAULT NULL,
  `truename` varchar(30) COLLATE utf8_danish_ci DEFAULT NULL,
  `classid` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_danish_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`userid`, `roleid`, `username`, `userpwd`, `truename`, `classid`) VALUES
(1, 3, 'admin', '12345', '管理员', 1),
(2, 1, 'teacher1', '12345', '老师1', 1),
(3, 2, 'student1', '12345', '学生1', 1),
(5, 2, 'student2', '12345', '学生2', 2);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `course`
--
ALTER TABLE `course`
  ADD PRIMARY KEY (`cno`);

--
-- Indexes for table `exam`
--
ALTER TABLE `exam`
  ADD PRIMARY KEY (`eid`),
  ADD KEY `fk_relationship_2` (`userid`),
  ADD KEY `fk_relationship_3` (`classid`),
  ADD KEY `fk_relationship_4` (`cno`);

--
-- Indexes for table `paper`
--
ALTER TABLE `paper`
  ADD PRIMARY KEY (`pid`),
  ADD KEY `fk_relationship_13` (`eid`),
  ADD KEY `fk_relationship_14` (`sid`);

--
-- Indexes for table `pjclass`
--
ALTER TABLE `pjclass`
  ADD PRIMARY KEY (`classid`);

--
-- Indexes for table `role`
--
ALTER TABLE `role`
  ADD PRIMARY KEY (`roleid`);

--
-- Indexes for table `studentexam`
--
ALTER TABLE `studentexam`
  ADD PRIMARY KEY (`seid`),
  ADD KEY `fk_relationship_6` (`userid`),
  ADD KEY `fk_relationship_7` (`classid`),
  ADD KEY `fk_relationship_8` (`eid`);

--
-- Indexes for table `studentsubject`
--
ALTER TABLE `studentsubject`
  ADD PRIMARY KEY (`ssid`),
  ADD KEY `fk_relationship_9` (`seid`),
  ADD KEY `fk_relationship_10` (`userid`),
  ADD KEY `fk_relationship_11` (`eid`),
  ADD KEY `fk_relationship_12` (`sid`);

--
-- Indexes for table `subject`
--
ALTER TABLE `subject`
  ADD PRIMARY KEY (`sid`),
  ADD UNIQUE KEY `scontent` (`scontent`),
  ADD KEY `fk_relationship_5` (`cno`);

--
-- Indexes for table `type`
--
ALTER TABLE `type`
  ADD PRIMARY KEY (`stype`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`userid`),
  ADD UNIQUE KEY `username` (`username`),
  ADD KEY `fk_relationship_1` (`roleid`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `course`
--
ALTER TABLE `course`
  MODIFY `cno` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `exam`
--
ALTER TABLE `exam`
  MODIFY `eid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `paper`
--
ALTER TABLE `paper`
  MODIFY `pid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `pjclass`
--
ALTER TABLE `pjclass`
  MODIFY `classid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `role`
--
ALTER TABLE `role`
  MODIFY `roleid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `studentexam`
--
ALTER TABLE `studentexam`
  MODIFY `seid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `studentsubject`
--
ALTER TABLE `studentsubject`
  MODIFY `ssid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `subject`
--
ALTER TABLE `subject`
  MODIFY `sid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `type`
--
ALTER TABLE `type`
  MODIFY `stype` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `userid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `exam`
--
ALTER TABLE `exam`
  ADD CONSTRAINT `fk_relationship_2` FOREIGN KEY (`userid`) REFERENCES `users` (`userid`),
  ADD CONSTRAINT `fk_relationship_3` FOREIGN KEY (`classid`) REFERENCES `pjclass` (`classid`),
  ADD CONSTRAINT `fk_relationship_4` FOREIGN KEY (`cno`) REFERENCES `course` (`cno`);

--
-- Constraints for table `paper`
--
ALTER TABLE `paper`
  ADD CONSTRAINT `fk_relationship_13` FOREIGN KEY (`eid`) REFERENCES `exam` (`eid`),
  ADD CONSTRAINT `fk_relationship_14` FOREIGN KEY (`sid`) REFERENCES `subject` (`sid`);

--
-- Constraints for table `studentexam`
--
ALTER TABLE `studentexam`
  ADD CONSTRAINT `fk_relationship_6` FOREIGN KEY (`userid`) REFERENCES `users` (`userid`),
  ADD CONSTRAINT `fk_relationship_7` FOREIGN KEY (`classid`) REFERENCES `pjclass` (`classid`),
  ADD CONSTRAINT `fk_relationship_8` FOREIGN KEY (`eid`) REFERENCES `exam` (`eid`);

--
-- Constraints for table `studentsubject`
--
ALTER TABLE `studentsubject`
  ADD CONSTRAINT `fk_relationship_10` FOREIGN KEY (`userid`) REFERENCES `users` (`userid`),
  ADD CONSTRAINT `fk_relationship_11` FOREIGN KEY (`eid`) REFERENCES `exam` (`eid`),
  ADD CONSTRAINT `fk_relationship_12` FOREIGN KEY (`sid`) REFERENCES `subject` (`sid`),
  ADD CONSTRAINT `fk_relationship_9` FOREIGN KEY (`seid`) REFERENCES `studentexam` (`seid`);

--
-- Constraints for table `subject`
--
ALTER TABLE `subject`
  ADD CONSTRAINT `fk_relationship_5` FOREIGN KEY (`cno`) REFERENCES `course` (`cno`);

--
-- Constraints for table `users`
--
ALTER TABLE `users`
  ADD CONSTRAINT `fk_relationship_1` FOREIGN KEY (`roleid`) REFERENCES `role` (`roleid`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
