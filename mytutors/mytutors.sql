-- phpMyAdmin SQL Dump
-- version 5.0.4
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Dec 29, 2021 at 06:36 AM
-- Server version: 5.7.24
-- PHP Version: 8.0.1

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `mytutors`
--

-- --------------------------------------------------------

--
-- Table structure for table `availabilities`
--

CREATE TABLE `availabilities` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `day` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `time` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `Tutor` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `availabilities`
--

INSERT INTO `availabilities` (`id`, `day`, `time`, `Tutor`) VALUES
(99, 'Mon', '1pm', 'tutor1'),
(100, 'Tue', '2pm', 'tutor1'),
(101, 'Fri', '11am', 'tutor1'),
(120, 'Mon', '3pm', 'tutor2'),
(121, 'Tue', '1pm', 'tutor2'),
(122, 'Thu', '3pm', 'tutor2'),
(123, 'Tue', '11am', 'tutor3'),
(124, 'Wed', '2pm', 'tutor3'),
(125, 'Thu', '3pm', 'tutor3'),
(126, 'Wed', '4pm', 'tutor4'),
(127, 'Thu', '11am', 'tutor4'),
(128, 'Fri', '3pm', 'tutor4');

-- --------------------------------------------------------

--
-- Table structure for table `courses`
--

CREATE TABLE `courses` (
  `Number` int(11) NOT NULL,
  `School` text COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `courses`
--

INSERT INTO `courses` (`Number`, `School`) VALUES
(2200, 'CS'),
(3012, 'MATH'),
(4400, 'CS'),
(4630, 'MUSI');

-- --------------------------------------------------------

--
-- Table structure for table `gta`
--

CREATE TABLE `gta` (
  `Course` int(11) NOT NULL,
  `Tutor` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL,
  `Year` int(11) NOT NULL,
  `Semester` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'Fall'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `gta`
--

INSERT INTO `gta` (`Course`, `Tutor`, `Year`, `Semester`) VALUES
(2200, 'tutor1', 2021, 'Fall'),
(3012, 'tutor1', 2021, 'Fall'),
(4400, 'tutor1', 2021, 'Spring'),
(4630, 'tutor1', 2021, 'Spring'),
(2200, 'tutor2', 2021, 'Fall'),
(3012, 'tutor2', 2021, 'Fall'),
(4400, 'tutor2', 2021, 'Fall'),
(4630, 'tutor2', 2021, 'Fall'),
(2200, 'tutor3', 2021, 'Fall'),
(3012, 'tutor3', 2021, 'Fall'),
(4400, 'tutor3', 2021, 'Fall'),
(4630, 'tutor3', 2021, 'Fall'),
(2200, 'tutor4', 2021, 'Fall'),
(3012, 'tutor4', 2021, 'Fall'),
(4400, 'tutor4', 2021, 'Fall'),
(4630, 'tutor4', 2021, 'Fall');

-- --------------------------------------------------------

--
-- Table structure for table `professor_recommendations`
--

CREATE TABLE `professor_recommendations` (
  `Professor` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL,
  `Tutor` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL,
  `Evaluation` int(11) NOT NULL DEFAULT '1',
  `Description` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `Year` int(11) NOT NULL,
  `Semester` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `professor_recommendations`
--

INSERT INTO `professor_recommendations` (`Professor`, `Tutor`, `Evaluation`, `Description`, `Year`, `Semester`) VALUES
('professor', 'Professor', 3, 'Well done', 2021, 'Fall'),
('professor', 'tutor1', 4, 'Excellent skills!', 2021, 'Fall'),
('professor', 'tutor2', 2, 'Need to improve!', 2021, 'Fall'),
('professor', 'tutor4', 2, 'Need to improve!', 2021, 'Fall');

-- --------------------------------------------------------

--
-- Table structure for table `schedules`
--

CREATE TABLE `schedules` (
  `Student` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL,
  `Tutor` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL,
  `Course` int(11) NOT NULL,
  `day` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `time` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `Year` int(11) NOT NULL,
  `Semester` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `schedules`
--

INSERT INTO `schedules` (`Student`, `Tutor`, `Course`, `day`, `time`, `Year`, `Semester`) VALUES
('student1', 'tutor1', 2200, 'Mon', '1pm', 2021, 'Fall'),
('student1', 'tutor2', 4400, 'Mon', '3pm', 2021, 'Spring'),
('student1', 'tutor4', 3012, 'Wed', '4pm', 2021, 'Fall'),
('student1', 'tutor4', 4630, 'Fri', '3pm', 2021, 'Fall'),
('student2', 'tutor1', 2200, 'Fri', '11am', 2021, 'Fall'),
('student2', 'tutor1', 3012, 'Fri', '11am', 2021, 'Fall'),
('student2', 'tutor1', 4400, 'Tue', '2pm', 2021, 'Spring'),
('student2', 'tutor2', 4630, 'Tue', '1pm', 2021, 'Summer'),
('student3', 'tutor1', 4630, 'Mon', '1pm', 2021, 'Spring'),
('student3', 'tutor3', 2200, 'Wed', '2pm', 2021, 'Summer'),
('student3', 'tutor3', 3012, 'Tue', '11am', 2021, 'Summer'),
('student3', 'tutor3', 4400, 'Thu', '3pm', 2021, 'Spring'),
('student4', 'tutor1', 2200, 'Fri', '11am', 2021, 'Fall'),
('student4', 'tutor2', 3012, 'Thu', '3pm', 2021, 'Summer'),
('student4', 'tutor3', 4400, 'Tue', '11am', 2021, 'Spring'),
('student4', 'tutor4', 4630, 'Fri', '3pm', 2021, 'Fall'),
('student5', 'tutor1', 4630, 'Mon', '1pm', 2021, 'Spring'),
('student5', 'tutor2', 2200, 'Tue', '1pm', 2021, 'Spring'),
('student5', 'tutor3', 3012, 'Wed', '2pm', 2021, 'Summer'),
('student5', 'tutor4', 4400, 'Fri', '3pm', 2021, 'Fall');

-- --------------------------------------------------------

--
-- Table structure for table `student_recommendations`
--

CREATE TABLE `student_recommendations` (
  `Student` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL,
  `Tutor` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL,
  `Course` int(11) NOT NULL,
  `Evaluation` int(11) NOT NULL DEFAULT '1',
  `Description` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `Year` int(11) NOT NULL,
  `Semester` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `student_recommendations`
--

INSERT INTO `student_recommendations` (`Student`, `Tutor`, `Course`, `Evaluation`, `Description`, `Year`, `Semester`) VALUES
('student1', 'tutor1', 2200, 4, 'Very understandable!', 2021, 'Fall'),
('student1', 'tutor2', 4400, 2, 'Teaching too fast', 2021, 'Spring'),
('student1', 'tutor4', 3012, 4, 'Excellent!', 2021, 'Fall'),
('student1', 'tutor4', 4630, 3, 'Fine', 2021, 'Fall'),
('student2', 'tutor1', 2200, 4, 'Perfect', 2021, 'Fall'),
('student2', 'tutor1', 3012, 4, 'Very nice!', 2021, 'Fall'),
('student2', 'tutor1', 4400, 4, 'Excellent teaching', 2021, 'Spring'),
('student2', 'tutor2', 4630, 3, 'Good', 2021, 'Summer'),
('student3', 'tutor1', 4630, 2, 'A little bit boring', 2021, 'Spring'),
('student3', 'tutor3', 2200, 4, 'Excellent', 2021, 'Summer'),
('student3', 'tutor3', 3012, 4, 'Very good', 2021, 'Summer'),
('student3', 'tutor3', 4400, 4, 'Very understandable', 2021, 'Spring'),
('student4', 'tutor1', 2200, 4, 'Perfect', 2021, 'Fall'),
('student4', 'tutor2', 3012, 2, 'Too fast teaching', 2021, 'Fall'),
('student4', 'tutor3', 4400, 3, 'Fine', 2021, 'Fall'),
('student4', 'tutor4', 4630, 4, 'Very understandable', 2021, 'Fall'),
('student5', 'tutor1', 4630, 4, 'No complaint', 2021, 'Spring'),
('student5', 'tutor2', 2200, 4, 'Good tutor', 2021, 'Spring'),
('student5', 'tutor3', 3012, 4, 'Excellent job', 2021, 'Summer'),
('student5', 'tutor4', 4400, 4, 'I like it', 2021, 'Fall');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `Username` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL,
  `Password` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL,
  `FirstName` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `LastName` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `Email` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL,
  `Phone` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL,
  `Position` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL,
  `GPA` decimal(5,1) NOT NULL,
  `Gradulate` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`Username`, `Password`, `FirstName`, `LastName`, `Email`, `Phone`, `Position`, `GPA`, `Gradulate`) VALUES
('admin', '123', 'Vincent', 'Administrator', 'administrator@gmail.com', '0129995533', 'Administrator', '0.0', 0),
('professor', '123', 'Jonathan', 'Professor', 'professor@gmail.com', '0128885555', 'Professor', '0.0', 0),
('student1', '123', 'Ali', 'Student', 'student1@gmail.com', '0124005050', 'Student', '0.0', 0),
('student2', '123', 'Irish', 'Student', 'student2@gmail.com', '01258886622', 'Student', '0.0', 0),
('student3', '123', 'Mutu', 'Student', 'student3@gmail.com', '0193005225', 'Student', '0.0', 0),
('student4', '123', 'Abas', 'Student', 'student4@gmail.com', '0122008080', 'Student', '0.0', 0),
('student5', '123', 'Siti', 'Student', 'student5@gmail.com', '0125221188', 'Student', '0.0', 0),
('tutor1', '123', 'John', 'Tutor1', 'tutor1@gmail.com', '0175558844', 'Tutor', '4.0', 1),
('tutor2', '123', 'Jackson', 'Tutor2', 'tutor2@gmail.com', '0178885544', 'Tutor', '3.5', 0),
('tutor3', '123', 'Jason', 'Tutor3', 'tutor3@gmail.com', '0178334411', 'Tutor', '4.0', 0),
('tutor4', '123', 'Jane', 'Tutor4', 'tutor4@gmail.com', '0125004422', 'Tutor', '3.8', 1);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `availabilities`
--
ALTER TABLE `availabilities`
  ADD PRIMARY KEY (`id`),
  ADD KEY `availabilities_tutor_foreign` (`Tutor`);

--
-- Indexes for table `courses`
--
ALTER TABLE `courses`
  ADD PRIMARY KEY (`Number`);

--
-- Indexes for table `gta`
--
ALTER TABLE `gta`
  ADD PRIMARY KEY (`Tutor`,`Course`),
  ADD UNIQUE KEY `Course_Tutor_unique` (`Tutor`,`Course`),
  ADD KEY `gta_course_foreign` (`Course`);

--
-- Indexes for table `professor_recommendations`
--
ALTER TABLE `professor_recommendations`
  ADD PRIMARY KEY (`Professor`,`Tutor`),
  ADD UNIQUE KEY `Professor_Tutor_unique` (`Professor`,`Tutor`),
  ADD KEY `professor_recommendations_tutor_foreign` (`Tutor`);

--
-- Indexes for table `schedules`
--
ALTER TABLE `schedules`
  ADD PRIMARY KEY (`Student`,`Tutor`,`Course`),
  ADD UNIQUE KEY `Student_Tutor_unique` (`Student`,`Tutor`,`Course`),
  ADD KEY `schedules_tutor_foreign` (`Tutor`),
  ADD KEY `schedules_course_foreign` (`Course`);

--
-- Indexes for table `student_recommendations`
--
ALTER TABLE `student_recommendations`
  ADD PRIMARY KEY (`Student`,`Tutor`,`Course`),
  ADD UNIQUE KEY `Student_Tutor_unique` (`Student`,`Tutor`,`Course`),
  ADD KEY `student_recommendations_tutor_foreign` (`Tutor`),
  ADD KEY `student_recommendations_course_foreign` (`Course`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`Username`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `availabilities`
--
ALTER TABLE `availabilities`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=129;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `availabilities`
--
ALTER TABLE `availabilities`
  ADD CONSTRAINT `availabilities_tutor_foreign` FOREIGN KEY (`Tutor`) REFERENCES `users` (`Username`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `gta`
--
ALTER TABLE `gta`
  ADD CONSTRAINT `gta_course_foreign` FOREIGN KEY (`Course`) REFERENCES `courses` (`Number`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `gta_tutor_foreign` FOREIGN KEY (`Tutor`) REFERENCES `users` (`Username`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `professor_recommendations`
--
ALTER TABLE `professor_recommendations`
  ADD CONSTRAINT `professor_recommendations_professor_foreign` FOREIGN KEY (`Professor`) REFERENCES `users` (`Username`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `professor_recommendations_tutor_foreign` FOREIGN KEY (`Tutor`) REFERENCES `users` (`Username`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `schedules`
--
ALTER TABLE `schedules`
  ADD CONSTRAINT `schedules_course_foreign` FOREIGN KEY (`Course`) REFERENCES `courses` (`Number`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `schedules_student_foreign` FOREIGN KEY (`Student`) REFERENCES `users` (`Username`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `schedules_tutor_foreign` FOREIGN KEY (`Tutor`) REFERENCES `users` (`Username`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `student_recommendations`
--
ALTER TABLE `student_recommendations`
  ADD CONSTRAINT `student_recommendations_course_foreign` FOREIGN KEY (`Course`) REFERENCES `courses` (`Number`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `student_recommendations_student_foreign` FOREIGN KEY (`Student`) REFERENCES `users` (`Username`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `student_recommendations_tutor_foreign` FOREIGN KEY (`Tutor`) REFERENCES `users` (`Username`) ON DELETE NO ACTION ON UPDATE NO ACTION;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
