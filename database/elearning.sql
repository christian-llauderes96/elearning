-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Dec 24, 2022 at 11:26 AM
-- Server version: 10.4.22-MariaDB
-- PHP Version: 8.1.2

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `elearning`
--

-- --------------------------------------------------------

--
-- Table structure for table `academic_year`
--

CREATE TABLE `academic_year` (
  `id` int(30) NOT NULL,
  `sy` varchar(150) NOT NULL,
  `status` tinyint(5) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `academic_year`
--

INSERT INTO `academic_year` (`id`, `sy`, `status`) VALUES
(1, '2022-2023', 1);

-- --------------------------------------------------------

--
-- Table structure for table `class`
--

CREATE TABLE `class` (
  `id` int(30) NOT NULL,
  `department_id` int(30) NOT NULL,
  `course_id` int(30) NOT NULL,
  `level` varchar(50) NOT NULL,
  `section` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `class`
--

INSERT INTO `class` (`id`, `department_id`, `course_id`, `level`, `section`) VALUES
(1, 1, 1, '1', 'A'),
(2, 1, 1, '1', 'B'),
(3, 2, 2, 'IV', 'CINS');

-- --------------------------------------------------------

--
-- Table structure for table `class_subjects`
--

CREATE TABLE `class_subjects` (
  `academic_year_id` int(30) NOT NULL,
  `class_id` int(30) NOT NULL,
  `subject_id` int(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `class_subjects`
--

INSERT INTO `class_subjects` (`academic_year_id`, `class_id`, `subject_id`) VALUES
(1, 2, 1),
(1, 2, 2),
(1, 1, 1),
(1, 1, 2),
(1, 1, 3),
(1, 3, 4),
(1, 3, 5),
(1, 3, 6),
(1, 3, 7),
(1, 3, 8);

-- --------------------------------------------------------

--
-- Table structure for table `class_subjects_faculty`
--

CREATE TABLE `class_subjects_faculty` (
  `academic_year_id` int(30) NOT NULL,
  `faculty_id` varchar(50) NOT NULL,
  `class_id` int(30) NOT NULL,
  `subject_id` int(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `class_subjects_faculty`
--

INSERT INTO `class_subjects_faculty` (`academic_year_id`, `faculty_id`, `class_id`, `subject_id`) VALUES
(1, '12345', 1, 1),
(1, '12345', 2, 1),
(1, '343434334', 2, 1),
(1, '343434334', 1, 1),
(1, '123456', 3, 4),
(1, '123456', 3, 5),
(1, '123456', 3, 6),
(1, '321312312', 3, 7),
(1, '123455', 1, 1),
(1, '123455', 3, 7),
(1, '0932109', 3, 4),
(1, '0932109', 3, 5),
(1, '0932109', 3, 6),
(1, '143143', 3, 8);

-- --------------------------------------------------------

--
-- Table structure for table `course`
--

CREATE TABLE `course` (
  `id` int(30) NOT NULL,
  `course` varchar(250) NOT NULL,
  `description` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `course`
--

INSERT INTO `course` (`id`, `course`, `description`) VALUES
(1, 'BSIS', 'Bachelor of Science in Information Systems'),
(2, 'BSIT - INS', 'Bachelor of Science in Information Technology\r\nMajor in Information and Network Security');

-- --------------------------------------------------------

--
-- Table structure for table `department`
--

CREATE TABLE `department` (
  `id` int(30) NOT NULL,
  `department` varchar(250) NOT NULL,
  `description` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `department`
--

INSERT INTO `department` (`id`, `department`, `description`) VALUES
(1, 'CIT', 'College of industrial Technology'),
(2, 'CCSIS', 'College of Computing and Information Sciences');

-- --------------------------------------------------------

--
-- Table structure for table `faculty`
--

CREATE TABLE `faculty` (
  `id` int(30) NOT NULL,
  `faculty_id` varchar(50) NOT NULL,
  `department_id` int(30) NOT NULL,
  `firstname` varchar(150) NOT NULL,
  `middlename` varchar(150) NOT NULL,
  `lastname` varchar(150) NOT NULL,
  `email` varchar(250) NOT NULL,
  `contact` varchar(150) NOT NULL,
  `gender` varchar(20) NOT NULL,
  `address` text DEFAULT NULL,
  `password` text DEFAULT NULL,
  `dob` int(11) NOT NULL,
  `avatar` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `faculty`
--

INSERT INTO `faculty` (`id`, `faculty_id`, `department_id`, `firstname`, `middlename`, `lastname`, `email`, `contact`, `gender`, `address`, `password`, `dob`, `avatar`) VALUES
(2, '123455', 1, 'Vince', '', 'Puri', 'jpuriburat@gmail.com', '09502405414', 'Male', 'makati city', '00c66aaf5f2c3f49946f15c1ad2ea0d3', 2000, 'uploads/Favatar_2.jpg'),
(3, '123123', 1, 'Ed', '', 'Sherran', 'tanywew@gmail.com', '09502405414', 'Male', 'University of Makati', '4297f44b13955235245b2497399d7a93', 2010, 'uploads/Favatar_3.jpg'),
(5, '123456', 2, 'Christian James', '', 'Llauderes', 'christian.llauderes1296@gmail.com', '09953360042', 'Male', 'Makati City', 'e10adc3949ba59abbe56e057f20f883e', 1996, 'uploads/Favatar_5.jpg'),
(6, '321312312', 2, 'aljun', '', 'fasdf', 'aljunserafin1121@gmail.com', '09502405414', 'Male', 'makati', '116b1789424407d40146b88635cb9a44', 1996, 'uploads/Favatar_6.jpg'),
(7, '0932109', 2, 'James', '', 'Generale', 'aljunserafin1121@gmail.com', '09502405414', 'Male', 'jkadsadsa', 'e95585b0599379d5002f88dafba8678f', 2000, 'uploads/Favatar_7.jpg'),
(8, '55555', 2, 'Shenna', '', 'Ernacio', 'aljunserafin11231@gmail.com', '09534354534', 'Female', 'makati', 'c5fe25896e49ddfe996db7508cf00534', 2000, 'uploads/Favatar_8.jpg'),
(9, '143143', 2, 'Test', '', 'Faculty', 'df.c@dfs.nba', '094845151512', 'Male', 'Makati', 'a9575efd6da5a277322853c68081ab88', 2022, 'uploads/Favatar_9.jpg');

-- --------------------------------------------------------

--
-- Table structure for table `lessons`
--

CREATE TABLE `lessons` (
  `id` int(30) NOT NULL,
  `academic_year_id` int(30) NOT NULL,
  `subject_id` int(30) NOT NULL,
  `faculty_id` varchar(50) NOT NULL,
  `title` varchar(250) NOT NULL,
  `description` text DEFAULT NULL,
  `ppt_path` text DEFAULT NULL,
  `date_created` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `lessons`
--

INSERT INTO `lessons` (`id`, `academic_year_id`, `subject_id`, `faculty_id`, `title`, `description`, `ppt_path`, `date_created`) VALUES
(1, 1, 2, '12345', 'Lesson 101 Test', '&lt;h2 style=&quot;margin-right: 0px; margin-bottom: 15px; margin-left: 0px; padding: 0px; text-align: justify; color: rgb(0, 0, 0); font-family: &quot; open=&quot;&quot; sans&quot;,=&quot;&quot; arial,=&quot;&quot; sans-serif;&quot;=&quot;&quot;&gt;&lt;b&gt;Sample Heading 1&lt;/b&gt;&lt;/h2&gt;&lt;h2 style=&quot;margin-right: 0px; margin-bottom: 15px; margin-left: 0px; padding: 0px; text-align: justify; color: rgb(0, 0, 0); font-family: &quot; open=&quot;&quot; sans&quot;,=&quot;&quot; arial,=&quot;&quot; sans-serif;&quot;=&quot;&quot;&gt;&lt;p style=&quot;margin-right: 0px; margin-bottom: 15px; margin-left: 0px; padding: 0px; font-size: 14px;&quot;&gt;Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed enim ipsum, rutrum eu erat sed, lacinia hendrerit sapien. Ut viverra dapibus velit nec pellentesque. Morbi ac gravida tortor. Curabitur scelerisque nisl metus. Fusce diam dui, feugiat vel congue a, convallis pulvinar dui. Donec ut felis vel dolor vehicula tincidunt vitae id nibh. Mauris mollis leo pulvinar vehicula sagittis. Sed bibendum arcu at eros imperdiet pellentesque non non orci. Etiam accumsan pulvinar egestas. Orci varius natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Curabitur nec odio nec quam ultrices facilisis. Nam tempor a neque dapibus lacinia. Etiam porttitor at urna sed pellentesque. Phasellus rhoncus mi at lobortis semper. Vivamus tempus urna nec sagittis vehicula. Nam sagittis velit nec quam molestie volutpat quis et ex.&lt;/p&gt;&lt;/h2&gt;&lt;h2&gt;&lt;b&gt;Sample Heading 2&lt;/b&gt;&lt;/h2&gt;&lt;h2&gt;&lt;p style=&quot;margin-right: 0px; margin-bottom: 15px; margin-left: 0px; padding: 0px; font-size: 14px;&quot;&gt;Sed in imperdiet nisi, non ultrices lectus. Donec auctor, ante sed vestibulum cursus, ex neque scelerisque augue, a faucibus libero lectus eu mauris. Morbi ac quam non felis malesuada lacinia vel laoreet tortor. Proin euismod risus sit amet scelerisque imperdiet. Phasellus ut neque mollis, porttitor velit a, congue libero. Ut cursus accumsan lectus, vitae congue mi pellentesque vitae. Integer pulvinar accumsan dignissim. Proin bibendum dapibus risus at accumsan. Donec a sapien sed arcu malesuada maximus. Integer eu feugiat eros.&lt;/p&gt;&lt;/h2&gt;', 'uploads/slides/lesson_1', '2022-12-08 14:44:47'),
(2, 1, 1, '12345', 'Sample 101', '&lt;p style=&quot;margin-right: 0px; margin-bottom: 15px; margin-left: 0px; padding: 0px; text-align: justify; color: rgb(0, 0, 0); font-family: &amp;quot;Open Sans&amp;quot;, Arial, sans-serif;&quot;&gt;Aliquam dictum ante at dapibus luctus. Maecenas semper pulvinar congue. Pellentesque semper, velit eget auctor euismod, ante sem vulputate augue, ut volutpat felis lorem nec ex. Praesent non porttitor nunc, non ullamcorper est. Donec eu arcu viverra augue tristique fermentum. Duis scelerisque bibendum augue, id laoreet massa tempor eu. Vivamus nec ante est. Fusce eu lacus sapien. Sed viverra lorem nec ante consequat tempor. Quisque ligula dolor, feugiat nec ligula porttitor, fermentum lacinia augue. Morbi fringilla vitae massa vitae tempus. Etiam ut vehicula lectus. Fusce cursus dolor vel dignissim volutpat. Etiam iaculis, justo vel fermentum varius, sem turpis hendrerit nulla, eget dapibus neque urna vitae arcu.&lt;/p&gt;&lt;p style=&quot;margin-right: 0px; margin-bottom: 15px; margin-left: 0px; padding: 0px; text-align: justify; color: rgb(0, 0, 0); font-family: &amp;quot;Open Sans&amp;quot;, Arial, sans-serif;&quot;&gt;Ut euismod tempor turpis, quis fringilla enim varius eget. Duis id neque blandit, vehicula purus eu, molestie dolor. Aliquam erat volutpat. Pellentesque quis dapibus elit. Curabitur ac lectus tortor. Phasellus et nibh nisl. Phasellus eu imperdiet nisi, tempor semper purus&lt;/p&gt;', 'uploads/slides/lesson_2', '2022-12-08 14:44:47'),
(11, 1, 4, '123456', 'LESSON - 1 Basic Programming', 'WALA KAYO PASOK', 'uploads/slides/lesson_11', '2022-12-08 14:44:47'),
(12, 1, 5, '123456', 'math fundamentals in programming', '&lt;p&gt;SASAKIT ULO NYO DITO&lt;/p&gt;', 'uploads/slides/lesson_12', '2022-12-08 14:44:47'),
(13, 1, 6, '123456', 'bfsad', '&lt;p&gt;asdasd&lt;/p&gt;', 'uploads/slides/lesson_13', '2022-12-08 14:44:47'),
(14, 1, 4, '123456', 'LESSON - 2 Advance Programming', '&lt;p&gt;50/50 na&lt;/p&gt;', 'uploads/slides/lesson_14', '2022-12-08 14:44:47'),
(15, 1, 7, '321312312', 'Paano ang tamang pag tatanim', '&lt;p&gt;ganito lang yan ha&amp;nbsp;&lt;/p&gt;', 'uploads/slides/lesson_15', '2022-12-08 14:44:47'),
(16, 1, 4, '123456', 'LESSON 3 - LEARNING ARITHMETIC OPERATIONS', '&lt;p&gt;YUDIPINGGOL&lt;/p&gt;', 'uploads/slides/lesson_16', '2022-12-08 14:55:15'),
(17, 1, 5, '123455', 'Ethical Hacking', '&lt;p&gt;fasfasfas&lt;/p&gt;', 'uploads/slides/lesson_17', '2022-12-08 17:18:30'),
(18, 1, 4, '0932109', 'COMPROG', '&lt;p&gt;basahin nyo ito putangina nyo&lt;/p&gt;', 'uploads/slides/lesson_18', '2022-12-08 19:10:19'),
(19, 1, 8, '143143', 'Mathematics in daily life', '&lt;p&gt;Basahin ng maayos&lt;/p&gt;', 'uploads/slides/lesson_19', '2022-12-24 11:35:09');

-- --------------------------------------------------------

--
-- Table structure for table `lesson_class`
--

CREATE TABLE `lesson_class` (
  `lesson_id` int(30) NOT NULL,
  `class_id` int(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `lesson_class`
--

INSERT INTO `lesson_class` (`lesson_id`, `class_id`) VALUES
(1, 1),
(1, 2),
(1, 1),
(1, 2),
(1, 1),
(1, 2),
(1, 1),
(1, 2),
(1, 1),
(1, 2),
(1, 1),
(1, 2),
(1, 1),
(1, 2),
(1, 1),
(1, 2),
(1, 1),
(1, 2),
(1, 1),
(1, 2),
(2, 1),
(2, 2),
(12, 3),
(13, 3),
(15, 3),
(16, 3),
(11, 3),
(14, 3),
(17, 1),
(18, 3),
(19, 3);

-- --------------------------------------------------------

--
-- Table structure for table `students`
--

CREATE TABLE `students` (
  `id` int(30) NOT NULL,
  `student_id` varchar(50) NOT NULL,
  `firstname` varchar(150) NOT NULL,
  `middlename` varchar(150) NOT NULL,
  `lastname` varchar(150) NOT NULL,
  `email` varchar(250) NOT NULL,
  `contact` varchar(150) NOT NULL,
  `gender` varchar(20) NOT NULL,
  `address` text DEFAULT NULL,
  `password` text DEFAULT NULL,
  `dob` int(11) NOT NULL,
  `avatar` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `students`
--

INSERT INTO `students` (`id`, `student_id`, `firstname`, `middlename`, `lastname`, `email`, `contact`, `gender`, `address`, `password`, `dob`, `avatar`) VALUES
(1, '6231415', 'John', 'D', 'Smith', 'jsmith@sample.com', '+1234567899', 'Male', 'Sample address', '04e4ff14103f267c4b443362cefe9570', 2005, NULL),
(6, '143', 'Jonathan', '', 'Ernacio', 'tanywew@gmail.com', '09502405414', 'Male', 'umak st. san andres bukid manila', '903ce9225fca3e988c2af215d4e544d3', 2022, 'uploads/uvatar_6.jpg'),
(7, '100', 'Shenna', '', 'Ernacio', 'shenaernacio@gmail.com', '09502405414', 'Male', 'University of Makati', 'f899139df5e1059396431415e770c6dd', 2020, NULL),
(8, '123123123', 'aljun', '', 'serafin', 'aljunserafin1121@gmail.com', '093120312', 'Male', 'fsdfdasfdsafsdfas', 'f5bb0c8de146c67b44babbf4e6584cc0', 2022, NULL),
(10, '12345', 'Jonathan', '', 'Ernacio', 'tanywew@gmail.com', '', 'Male', 'Manila', '827ccb0eea8a706c4c34a16891f84e7b', 2000, NULL),
(11, '121212', 'Jonathan', '', 'Ernacio', 'tanywew@gmail.com', '234454534', 'Male', 'manila', '93279e3308bdbbeed946fc965017f67a', 1233, NULL),
(12, '0909090', 'jonas', '', 'burat', 'Jonathanczxcz@gmail.com', '', 'Male', '', 'f0a5d51d417e468f825f2a61a301d283', 2000, NULL),
(13, '12312312321', 'Aljun', '', 'Serafin', 'dasd@gmail.com', '09502405414', 'Male', '', 'aae77dd310a3d99c13ac36b042c934ee', 2000, NULL),
(14, '1212', 'cjcj', '', 'Garcia', 'barzanatian@gmail.com', '0982265462313', 'Male', 'Makati City', 'a01610228fe998f515a72dd730294d87', 1998, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `student_class`
--

CREATE TABLE `student_class` (
  `id` int(30) NOT NULL,
  `academic_year_id` int(30) NOT NULL,
  `student_id` int(30) NOT NULL,
  `class_id` int(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `student_class`
--

INSERT INTO `student_class` (`id`, `academic_year_id`, `student_id`, `class_id`) VALUES
(1, 1, 6231415, 1),
(2, 1, 143, 2),
(3, 1, 123123123, 3),
(4, 1, 2147483647, 1),
(5, 1, 2147483647, 1),
(6, 1, 100, 1),
(7, 1, 121212, 3),
(8, 1, 909090, 3);

-- --------------------------------------------------------

--
-- Table structure for table `subjects`
--

CREATE TABLE `subjects` (
  `id` int(30) NOT NULL,
  `subject_code` varchar(250) NOT NULL,
  `description` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `subjects`
--

INSERT INTO `subjects` (`id`, `subject_code`, `description`) VALUES
(1, 'S101', 'Subject 101'),
(2, 'S102', 'Subject 102'),
(3, 'English sa umak', 'fasdfasdfasd'),
(4, 'COMPROG-1', 'Computer Programming 1'),
(5, 'DISTRU', 'Discrete Structure'),
(6, 'INTROCOM', 'Introduction to Computing'),
(7, 'NSTP', 'walang rotc eh'),
(8, 'MODERNMATH', 'Modern Mathematics');

-- --------------------------------------------------------

--
-- Table structure for table `system_info`
--

CREATE TABLE `system_info` (
  `id` int(30) NOT NULL,
  `meta_field` text NOT NULL,
  `meta_value` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `system_info`
--

INSERT INTO `system_info` (`id`, `meta_field`, `meta_value`) VALUES
(1, 'name', 'Youth Learning System'),
(2, 'address', 'Philippines'),
(3, 'contact', '+1234567890'),
(4, 'email', 'info@sample.com'),
(6, 'short_name', 'YLS'),
(9, 'logo', 'uploads/1670332800_logo.png');

-- --------------------------------------------------------

--
-- Table structure for table `tblexams`
--

CREATE TABLE `tblexams` (
  `exam_id` int(11) NOT NULL,
  `faculty` varchar(50) NOT NULL,
  `exam_title` varchar(50) NOT NULL,
  `subject` varchar(100) NOT NULL,
  `description` varchar(100) DEFAULT NULL,
  `items` varchar(10) NOT NULL,
  `answer_key` varchar(255) NOT NULL,
  `date_created` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `tblexams`
--

INSERT INTO `tblexams` (`exam_id`, `faculty`, `exam_title`, `subject`, `description`, `items`, `answer_key`, `date_created`) VALUES
(1, '123456', 'Math Fundamentals', 'DISTRU', '', '5', '[\"a\",\"c\",\"b\",\"d\",\"a\"]', '2022-12-10 18:11:03'),
(2, '123456', 'COMPUTER PROGRAMMING FINAL QUIZ', 'COMPROG-1', '', '10', '[\"c\",\"a\",\"a\",\"b\",\"d\",\"c\",\"c\",\"d\",\"c\",\"d\"]', '2022-12-10 18:27:30'),
(3, '123456', 'INTRO TO COMPUTING FINAL EXAM IF YOU FAIL U GET IN', 'INTROCOM', '', '12', '[\"c\",\"d\",\"a\",\"a\",\"d\",\"d\",\"c\",\"d\",\"a\",\"c\",\"b\",\"c\"]', '2022-12-10 18:35:48'),
(10, '143143', 'Math in daily life', 'MODERNMATH', NULL, '5', '[\"d\",\"b\",\"d\",\"c\",\"d\"]', '2022-12-24 12:09:40');

-- --------------------------------------------------------

--
-- Table structure for table `tblscores`
--

CREATE TABLE `tblscores` (
  `score_id` int(11) NOT NULL,
  `exam_id` varchar(10) NOT NULL,
  `student_id` varchar(200) NOT NULL,
  `section` varchar(50) NOT NULL,
  `subject_code` varchar(50) NOT NULL,
  `items` varchar(5) NOT NULL,
  `score` varchar(5) NOT NULL,
  `faculty` varchar(50) NOT NULL,
  `date_applied` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `tblscores`
--

INSERT INTO `tblscores` (`score_id`, `exam_id`, `student_id`, `section`, `subject_code`, `items`, `score`, `faculty`, `date_applied`) VALUES
(5, '10', '121212', '3', 'MODERNMATH', '5', '3', '143143', '2022-12-24 17:56:08'),
(6, '10', '121212', '3', 'MODERNMATH', '5', '2', '143143', '2022-12-24 17:57:48'),
(7, '10', '121212', '3', 'MODERNMATH', '5', '3', '143143', '2022-12-24 17:58:41'),
(8, '10', '121212', '3', 'MODERNMATH', '5', '3', '143143', '2022-12-24 18:01:27'),
(9, '10', '121212', '3', 'MODERNMATH', '5', '3', '143143', '2022-12-24 18:02:20'),
(10, '1', '121212', '3', 'DISTRU', '5', '2', '123456', '2022-12-24 18:04:36');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(50) NOT NULL,
  `firstname` varchar(250) NOT NULL,
  `lastname` varchar(250) NOT NULL,
  `username` text NOT NULL,
  `password` text NOT NULL,
  `avatar` text DEFAULT NULL,
  `last_login` datetime DEFAULT NULL,
  `date_added` datetime NOT NULL DEFAULT current_timestamp(),
  `date_updated` datetime DEFAULT NULL ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `firstname`, `lastname`, `username`, `password`, `avatar`, `last_login`, `date_added`, `date_updated`) VALUES
(1, 'Jonathan', 'Ernacio', 'admin', '0192023a7bbd73250516f069df18b500', 'uploads/1670330340_315173383_2632121263603728_5931825183815239781_n.jpg', NULL, '2021-01-20 14:02:37', '2022-12-06 20:53:02'),
(2, 'Georgee', 'Wilson', '', '', NULL, NULL, '2021-04-28 21:01:58', NULL);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `academic_year`
--
ALTER TABLE `academic_year`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `class`
--
ALTER TABLE `class`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `course`
--
ALTER TABLE `course`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `department`
--
ALTER TABLE `department`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `faculty`
--
ALTER TABLE `faculty`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `lessons`
--
ALTER TABLE `lessons`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `students`
--
ALTER TABLE `students`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `student_class`
--
ALTER TABLE `student_class`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `subjects`
--
ALTER TABLE `subjects`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `system_info`
--
ALTER TABLE `system_info`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tblexams`
--
ALTER TABLE `tblexams`
  ADD PRIMARY KEY (`exam_id`);

--
-- Indexes for table `tblscores`
--
ALTER TABLE `tblscores`
  ADD PRIMARY KEY (`score_id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `academic_year`
--
ALTER TABLE `academic_year`
  MODIFY `id` int(30) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `class`
--
ALTER TABLE `class`
  MODIFY `id` int(30) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `course`
--
ALTER TABLE `course`
  MODIFY `id` int(30) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `department`
--
ALTER TABLE `department`
  MODIFY `id` int(30) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `faculty`
--
ALTER TABLE `faculty`
  MODIFY `id` int(30) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `lessons`
--
ALTER TABLE `lessons`
  MODIFY `id` int(30) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

--
-- AUTO_INCREMENT for table `students`
--
ALTER TABLE `students`
  MODIFY `id` int(30) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT for table `student_class`
--
ALTER TABLE `student_class`
  MODIFY `id` int(30) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `subjects`
--
ALTER TABLE `subjects`
  MODIFY `id` int(30) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `system_info`
--
ALTER TABLE `system_info`
  MODIFY `id` int(30) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `tblexams`
--
ALTER TABLE `tblexams`
  MODIFY `exam_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `tblscores`
--
ALTER TABLE `tblscores`
  MODIFY `score_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(50) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
