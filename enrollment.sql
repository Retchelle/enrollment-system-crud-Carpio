-- phpMyAdmin SQL Dump
-- version 5.2.2
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Sep 19, 2025 at 12:46 PM
-- Server version: 8.0.30
-- PHP Version: 8.1.10

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `enrollment`
--

-- --------------------------------------------------------

--
-- Table structure for table `institute_tbl`
--

CREATE TABLE `institute_tbl` (
  `ins_id` int NOT NULL,
  `ins_name` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `institute_tbl`
--

INSERT INTO `institute_tbl` (`ins_id`, `ins_name`) VALUES
(1, 'College of Engineering'),
(2, 'College of Information Technology'),
(3, 'College of Business'),
(4, 'College of Education'),
(5, 'College of Arts and Sciences');

-- --------------------------------------------------------

--
-- Table structure for table `program_tbl`
--

CREATE TABLE `program_tbl` (
  `program_id` int NOT NULL,
  `program_name` varchar(100) DEFAULT NULL,
  `ins_id` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `program_tbl`
--

INSERT INTO `program_tbl` (`program_id`, `program_name`, `ins_id`) VALUES
(1, 'BS Civil Engineering', 1),
(2, 'BS Computer Science', 2),
(3, 'BS Information Systems', 2),
(4, 'BS Accountancy', 3),
(5, 'BSEd Major in Math', 4),
(6, 'BSIT', 2);

-- --------------------------------------------------------

--
-- Table structure for table `semester_tbl`
--

CREATE TABLE `semester_tbl` (
  `sem_id` int NOT NULL,
  `sem_name` varchar(50) DEFAULT NULL,
  `year_id` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `semester_tbl`
--

INSERT INTO `semester_tbl` (`sem_id`, `sem_name`, `year_id`) VALUES
(1, '1st Semester', 5),
(2, '2nd Semester', 1),
(3, '1st Semester', 2),
(4, '2nd Semester', 2),
(5, 'Summer', 2),
(6, '3rd Semester', 4);

-- --------------------------------------------------------

--
-- Table structure for table `student`
--

CREATE TABLE `student` (
  `stud_id` int NOT NULL,
  `full_name` varchar(30) NOT NULL,
  `program_id` int NOT NULL,
  `allowance` float(10,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `student_load`
--

CREATE TABLE `student_load` (
  `load_id` int NOT NULL,
  `stud_id` int DEFAULT NULL,
  `subject_id` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `student_load`
--

INSERT INTO `student_load` (`load_id`, `stud_id`, `subject_id`) VALUES
(4, 15, 5),
(5, 41, 2),
(6, 43, 3);

-- --------------------------------------------------------

--
-- Table structure for table `student_tbl`
--

CREATE TABLE `student_tbl` (
  `stud_id` int NOT NULL,
  `name` varchar(100) DEFAULT NULL,
  `program_id` int DEFAULT NULL,
  `allowance` float(10,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `student_tbl`
--

INSERT INTO `student_tbl` (`stud_id`, `name`, `program_id`, `allowance`) VALUES
(8, 'Anna Maria Lim', 1, 1000.00),
(15, 'Mia Santos', 5, 910.00),
(20, 'Shana Coz', 3, 300.00),
(41, 'Retchelle Carpio', 3, 500.00),
(42, 'Kobe T. Deacosta', 3, 900.00),
(43, 'Janeth Cajara', 3, 1000.00),
(44, 'Rana Cruz', 1, 400.00);

-- --------------------------------------------------------

--
-- Table structure for table `subject_tbl`
--

CREATE TABLE `subject_tbl` (
  `subject_id` int NOT NULL,
  `subject_name` varchar(100) DEFAULT NULL,
  `sem_id` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `subject_tbl`
--

INSERT INTO `subject_tbl` (`subject_id`, `subject_name`, `sem_id`) VALUES
(1, 'JavaScript', 6),
(2, 'Computer Programming', 5),
(3, 'Database Management', 3),
(5, 'Educational Psychology', 4);

-- --------------------------------------------------------

--
-- Stand-in structure for view `view_all_students`
-- (See below for the actual view)
--
CREATE TABLE `view_all_students` (
`name` varchar(100)
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `view_students_above_average_allowance`
-- (See below for the actual view)
--
CREATE TABLE `view_students_above_average_allowance` (
`allowance` float(10,2)
,`name` varchar(100)
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `view_students_bsed_major_math`
-- (See below for the actual view)
--
CREATE TABLE `view_students_bsed_major_math` (
`name` varchar(100)
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `view_students_bs_accountancy`
-- (See below for the actual view)
--
CREATE TABLE `view_students_bs_accountancy` (
`name` varchar(100)
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `view_students_bs_civil_engineering`
-- (See below for the actual view)
--
CREATE TABLE `view_students_bs_civil_engineering` (
`name` varchar(100)
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `view_students_bs_computer_science`
-- (See below for the actual view)
--
CREATE TABLE `view_students_bs_computer_science` (
`name` varchar(100)
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `view_students_bs_information_systems`
-- (See below for the actual view)
--
CREATE TABLE `view_students_bs_information_systems` (
`name` varchar(100)
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `view_students_with_programs`
-- (See below for the actual view)
--
CREATE TABLE `view_students_with_programs` (
`name` varchar(100)
,`program_name` varchar(100)
);

-- --------------------------------------------------------

--
-- Table structure for table `year_tbl`
--

CREATE TABLE `year_tbl` (
  `year_id` int NOT NULL,
  `year_from` int DEFAULT NULL,
  `year_to` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `year_tbl`
--

INSERT INTO `year_tbl` (`year_id`, `year_from`, `year_to`) VALUES
(1, 2023, 2026),
(2, 2024, 2026),
(3, 2025, 2026),
(4, 2026, 2027),
(5, 2027, 2028),
(6, 2029, 2030);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `institute_tbl`
--
ALTER TABLE `institute_tbl`
  ADD PRIMARY KEY (`ins_id`);

--
-- Indexes for table `program_tbl`
--
ALTER TABLE `program_tbl`
  ADD PRIMARY KEY (`program_id`),
  ADD KEY `ins_id` (`ins_id`);

--
-- Indexes for table `semester_tbl`
--
ALTER TABLE `semester_tbl`
  ADD PRIMARY KEY (`sem_id`),
  ADD KEY `year_id` (`year_id`);

--
-- Indexes for table `student_load`
--
ALTER TABLE `student_load`
  ADD PRIMARY KEY (`load_id`),
  ADD KEY `stud_id` (`stud_id`),
  ADD KEY `subject_id` (`subject_id`);

--
-- Indexes for table `student_tbl`
--
ALTER TABLE `student_tbl`
  ADD PRIMARY KEY (`stud_id`),
  ADD KEY `program_id` (`program_id`);

--
-- Indexes for table `subject_tbl`
--
ALTER TABLE `subject_tbl`
  ADD PRIMARY KEY (`subject_id`),
  ADD KEY `sem_id` (`sem_id`);

--
-- Indexes for table `year_tbl`
--
ALTER TABLE `year_tbl`
  ADD PRIMARY KEY (`year_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `student_load`
--
ALTER TABLE `student_load`
  MODIFY `load_id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

-- --------------------------------------------------------

--
-- Structure for view `view_all_students`
--
DROP TABLE IF EXISTS `view_all_students`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `view_all_students`  AS SELECT `student_tbl`.`name` AS `name` FROM `student_tbl` ;

-- --------------------------------------------------------

--
-- Structure for view `view_students_above_average_allowance`
--
DROP TABLE IF EXISTS `view_students_above_average_allowance`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `view_students_above_average_allowance`  AS SELECT `student_tbl`.`name` AS `name`, `student_tbl`.`allowance` AS `allowance` FROM `student_tbl` WHERE (`student_tbl`.`allowance` > (select avg(`student_tbl`.`allowance`) from `student_tbl`)) ;

-- --------------------------------------------------------

--
-- Structure for view `view_students_bsed_major_math`
--
DROP TABLE IF EXISTS `view_students_bsed_major_math`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `view_students_bsed_major_math`  AS SELECT `student_tbl`.`name` AS `name` FROM `student_tbl` WHERE (`student_tbl`.`program_id` = (select `program_tbl`.`program_id` from `program_tbl` where (`program_tbl`.`program_name` = 'BSED Major in Math'))) ;

-- --------------------------------------------------------

--
-- Structure for view `view_students_bs_accountancy`
--
DROP TABLE IF EXISTS `view_students_bs_accountancy`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `view_students_bs_accountancy`  AS SELECT `student_tbl`.`name` AS `name` FROM `student_tbl` WHERE (`student_tbl`.`program_id` = (select `program_tbl`.`program_id` from `program_tbl` where (`program_tbl`.`program_name` = 'BS Accountancy'))) ;

-- --------------------------------------------------------

--
-- Structure for view `view_students_bs_civil_engineering`
--
DROP TABLE IF EXISTS `view_students_bs_civil_engineering`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `view_students_bs_civil_engineering`  AS SELECT `student_tbl`.`name` AS `name` FROM `student_tbl` WHERE (`student_tbl`.`program_id` = (select `program_tbl`.`program_id` from `program_tbl` where (`program_tbl`.`program_name` = 'BS Civil Engineering'))) ;

-- --------------------------------------------------------

--
-- Structure for view `view_students_bs_computer_science`
--
DROP TABLE IF EXISTS `view_students_bs_computer_science`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `view_students_bs_computer_science`  AS SELECT `student_tbl`.`name` AS `name` FROM `student_tbl` WHERE (`student_tbl`.`program_id` = (select `program_tbl`.`program_id` from `program_tbl` where (`program_tbl`.`program_name` = 'BS COmputer Science'))) ;

-- --------------------------------------------------------

--
-- Structure for view `view_students_bs_information_systems`
--
DROP TABLE IF EXISTS `view_students_bs_information_systems`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `view_students_bs_information_systems`  AS SELECT `student_tbl`.`name` AS `name` FROM `student_tbl` WHERE (`student_tbl`.`program_id` = (select `program_tbl`.`program_id` from `program_tbl` where (`program_tbl`.`program_name` = 'BS Information Systems'))) ;

-- --------------------------------------------------------

--
-- Structure for view `view_students_with_programs`
--
DROP TABLE IF EXISTS `view_students_with_programs`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `view_students_with_programs`  AS SELECT `s`.`name` AS `name`, `p`.`program_name` AS `program_name` FROM (`student_tbl` `s` join `program_tbl` `p` on((`s`.`program_id` = `p`.`program_id`))) ;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `program_tbl`
--
ALTER TABLE `program_tbl`
  ADD CONSTRAINT `program_tbl_ibfk_1` FOREIGN KEY (`ins_id`) REFERENCES `institute_tbl` (`ins_id`);

--
-- Constraints for table `semester_tbl`
--
ALTER TABLE `semester_tbl`
  ADD CONSTRAINT `semester_tbl_ibfk_1` FOREIGN KEY (`year_id`) REFERENCES `year_tbl` (`year_id`);

--
-- Constraints for table `student_load`
--
ALTER TABLE `student_load`
  ADD CONSTRAINT `student_load_ibfk_1` FOREIGN KEY (`stud_id`) REFERENCES `student_tbl` (`stud_id`),
  ADD CONSTRAINT `student_load_ibfk_2` FOREIGN KEY (`subject_id`) REFERENCES `subject_tbl` (`subject_id`);

--
-- Constraints for table `student_tbl`
--
ALTER TABLE `student_tbl`
  ADD CONSTRAINT `student_tbl_ibfk_1` FOREIGN KEY (`program_id`) REFERENCES `program_tbl` (`program_id`);

--
-- Constraints for table `subject_tbl`
--
ALTER TABLE `subject_tbl`
  ADD CONSTRAINT `subject_tbl_ibfk_1` FOREIGN KEY (`sem_id`) REFERENCES `semester_tbl` (`sem_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
