-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Oct 30, 2025 at 08:23 AM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.0.30

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `evaluation_systemdb`
--

-- --------------------------------------------------------

--
-- Table structure for table `classes`
--

CREATE TABLE `classes` (
  `ClassID` int(11) NOT NULL,
  `CourseID` int(11) NOT NULL,
  `YearLevel` varchar(10) DEFAULT NULL,
  `Section` varchar(10) DEFAULT NULL,
  `IsActive` tinyint(1) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `classes`
--

INSERT INTO `classes` (`ClassID`, `CourseID`, `YearLevel`, `Section`, `IsActive`) VALUES
(1, 1, '1ST', 'A', 1),
(2, 1, '1ST', 'B', 1),
(3, 1, '2ND', 'A', 1),
(4, 2, '1ST', 'A', 1),
(5, 3, '1ST', 'A', 1),
(6, 3, '2ND', 'A', 1),
(7, 4, '1ST', 'A', 1),
(8, 5, '1ST', 'A', 1),
(48, 2, '2ND', 'A', 1),
(49, 4, '2ND', 'A', 1),
(50, 5, '2ND', 'A', 1),
(51, 1, '1ST', 'c', 1),
(52, 2, '1ST', 'B', 1),
(53, 1, '2ND', 'B', 1),
(54, 2, '2ND', 'B', 1);

-- --------------------------------------------------------

--
-- Table structure for table `courses`
--

CREATE TABLE `courses` (
  `CourseID` int(11) NOT NULL,
  `CourseName` varchar(100) NOT NULL,
  `DepartmentID` int(11) NOT NULL,
  `IsActive` tinyint(1) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `courses`
--

INSERT INTO `courses` (`CourseID`, `CourseName`, `DepartmentID`, `IsActive`) VALUES
(1, 'Bachelor of Science in Information Technology', 1, 1),
(2, 'Bachelor of Science in Computer Science', 1, 1),
(3, 'Bachelor of Science in Criminology', 2, 1),
(4, 'Bachelor of Science in Business Administration', 3, 1),
(5, 'Bachelor of Elementary Education', 4, 1),
(35, 'Bachelor of science information technology', 1, 0);

-- --------------------------------------------------------

--
-- Table structure for table `departments`
--

CREATE TABLE `departments` (
  `DepartmentID` int(11) NOT NULL,
  `DepartmentName` varchar(150) NOT NULL,
  `IsActive` tinyint(1) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `departments`
--

INSERT INTO `departments` (`DepartmentID`, `DepartmentName`, `IsActive`) VALUES
(1, 'College of Information Technology', 1),
(2, 'College of Criminal Justice', 1),
(3, 'College of Business Administration', 1),
(4, 'College of Education', 1),
(14, 'College of Criminology', 1);

-- --------------------------------------------------------

--
-- Table structure for table `evaluationcycles`
--

CREATE TABLE `evaluationcycles` (
  `CycleID` int(11) NOT NULL,
  `Term` varchar(50) NOT NULL,
  `Status` enum('Active','Inactive') DEFAULT 'Inactive',
  `StartDate` date DEFAULT NULL,
  `EndDate` date DEFAULT NULL,
  `CycleName` varchar(100) NOT NULL,
  `IsActive` tinyint(11) NOT NULL DEFAULT 1,
  `Notified` tinyint(4) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `evaluationcycles`
--

INSERT INTO `evaluationcycles` (`CycleID`, `Term`, `Status`, `StartDate`, `EndDate`, `CycleName`, `IsActive`, `Notified`) VALUES
(17, '2nd Semester', 'Inactive', '2025-03-15', '2025-03-22', 'Final Evaluation 2025', 1, 0),
(18, '1st Semester', 'Active', '2025-10-22', '2025-10-31', 'S.Y. 2025-2026', 1, 0);

-- --------------------------------------------------------

--
-- Table structure for table `evaluationdomains`
--

CREATE TABLE `evaluationdomains` (
  `DomainID` int(11) NOT NULL,
  `DomainName` varchar(100) NOT NULL,
  `Weight` int(11) NOT NULL,
  `IsActive` bit(1) DEFAULT b'1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `evaluationdomains`
--

INSERT INTO `evaluationdomains` (`DomainID`, `DomainName`, `Weight`, `IsActive`) VALUES
(14, 'Instructional Competence', 20, b'0'),
(15, 'Classroom and Student Management', 20, b'0'),
(16, 'Professionalism and Ethics', 20, b'0'),
(17, 'Classroom and Student Management', 25, b'1'),
(18, 'Instructional Competence', 25, b'1'),
(19, 'Professionalism and Ethics', 25, b'1'),
(20, 'Spiritual and Values Integration and Leadership', 25, b'1');

-- --------------------------------------------------------

--
-- Table structure for table `evaluationquestions`
--

CREATE TABLE `evaluationquestions` (
  `QuestionID` int(11) NOT NULL,
  `QuestionText` varchar(500) NOT NULL,
  `Scale` int(11) DEFAULT 5,
  `DomainID` int(11) DEFAULT NULL,
  `IsActive` bit(1) DEFAULT b'1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `evaluationquestions`
--

INSERT INTO `evaluationquestions` (`QuestionID`, `QuestionText`, `Scale`, `DomainID`, `IsActive`) VALUES
(36, 'Models biblical/ servant leadership.', 5, 20, b'1'),
(37, 'Demonstrate ethical decision-making in his/ her approach to teaching.', 5, 20, b'1'),
(38, 'Models and promote the Core Values of GWC - integrity, godliness, diligence, excellence, compassion, accessibility, Cristian virtue and transformation.', 5, 20, b'1'),
(39, 'Encourage moral and spiritual formation among students.', 5, 20, b'1'),
(40, 'Integrates Vision, Mission and Core Values of GWC in teaching where applicable.', 5, 20, b'1'),
(41, 'Comes to class with well-prepared lessons.', 5, 18, b'1'),
(42, 'Presents lessons clearly and understandably.', 5, 18, b'1'),
(43, 'Demonstrates mastery of the subject matter.', 5, 18, b'1'),
(44, 'Uses appropriate teaching strategies and instructional materials.', 5, 18, b'1'),
(45, 'Encourages critical thinking and active participation.', 5, 18, b'1'),
(46, 'Assesses student performance fairly and regularly.', 5, 18, b'1'),
(47, 'Utilizes multiple assessment strategies and tools.', 5, 18, b'1'),
(48, 'Provides prompt and meaningful feedback about performance and progress.', 5, 18, b'1'),
(49, 'Displays interest on the subject matter, encourages and supports your effort to learn and improve.', 5, 18, b'1'),
(50, 'Maintains discipline and a respectful classroom environment regardless of beliefs, value systems and lifestyles.', 5, 17, b'1'),
(51, 'Addresses student concerns appropriately.', 5, 17, b'1'),
(52, 'Starts and ends classes on time.', 5, 17, b'1'),
(53, 'Implements and promotes stewardship of properties and materials being used.', 5, 17, b'1'),
(54, 'Conducts himself/herself in the classroom professionally, creating a respectful environment.', 5, 17, b'1'),
(55, 'Demonstrates punctuality and regular attendance.', 5, 19, b'1'),
(56, 'Dresses appropriately and professionally.', 5, 19, b'1'),
(57, 'Observes confidentiality and integrity.', 5, 19, b'1'),
(58, 'Shows respect to colleagues, students, and administrators.', 5, 19, b'1'),
(59, 'Exemplifies teamwork and support to the institutional ways and processes to help deliver quality education to stakeholders', 5, 19, b'1'),
(60, 'Displays hard work, discipline, perseveres to deliver high-quality education to students.', 5, 19, b'1'),
(61, 'Actively seeks and responds to feedback to improve his/her teaching methods.', 5, 19, b'1');

-- --------------------------------------------------------

--
-- Table structure for table `evaluations`
--

CREATE TABLE `evaluations` (
  `EvalID` int(11) NOT NULL,
  `LoadID` int(11) DEFAULT NULL,
  `QuestionID` int(11) DEFAULT NULL,
  `Score` tinyint(4) NOT NULL CHECK (`Score` between 1 and 5),
  `SubmissionDate` timestamp NOT NULL DEFAULT current_timestamp(),
  `SubmissionID` int(11) NOT NULL,
  `CycleID` int(11) NOT NULL,
  `IsReleased` tinyint(4) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `evaluations`
--

INSERT INTO `evaluations` (`EvalID`, `LoadID`, `QuestionID`, `Score`, `SubmissionDate`, `SubmissionID`, `CycleID`, `IsReleased`) VALUES
(2796, 64, 50, 5, '2025-10-30 00:19:21', 140, 18, NULL),
(2797, 64, 51, 4, '2025-10-30 00:19:21', 140, 18, NULL),
(2798, 64, 52, 5, '2025-10-30 00:19:21', 140, 18, NULL),
(2799, 64, 53, 4, '2025-10-30 00:19:21', 140, 18, NULL),
(2800, 64, 54, 5, '2025-10-30 00:19:21', 140, 18, NULL),
(2801, 64, 41, 5, '2025-10-30 00:19:21', 140, 18, NULL),
(2802, 64, 42, 4, '2025-10-30 00:19:21', 140, 18, NULL),
(2803, 64, 43, 5, '2025-10-30 00:19:21', 140, 18, NULL),
(2804, 64, 44, 4, '2025-10-30 00:19:21', 140, 18, NULL),
(2805, 64, 45, 5, '2025-10-30 00:19:21', 140, 18, NULL),
(2806, 64, 46, 4, '2025-10-30 00:19:21', 140, 18, NULL),
(2807, 64, 47, 5, '2025-10-30 00:19:21', 140, 18, NULL),
(2808, 64, 48, 4, '2025-10-30 00:19:22', 140, 18, NULL),
(2809, 64, 49, 5, '2025-10-30 00:19:22', 140, 18, NULL),
(2810, 64, 55, 5, '2025-10-30 00:19:22', 140, 18, NULL),
(2811, 64, 56, 4, '2025-10-30 00:19:22', 140, 18, NULL),
(2812, 64, 57, 5, '2025-10-30 00:19:22', 140, 18, NULL),
(2813, 64, 58, 4, '2025-10-30 00:19:22', 140, 18, NULL),
(2814, 64, 59, 5, '2025-10-30 00:19:22', 140, 18, NULL),
(2815, 64, 60, 4, '2025-10-30 00:19:22', 140, 18, NULL),
(2816, 64, 61, 5, '2025-10-30 00:19:22', 140, 18, NULL),
(2817, 64, 36, 4, '2025-10-30 00:19:22', 140, 18, NULL),
(2818, 64, 37, 5, '2025-10-30 00:19:22', 140, 18, NULL),
(2819, 64, 38, 4, '2025-10-30 00:19:22', 140, 18, NULL),
(2820, 64, 39, 5, '2025-10-30 00:19:22', 140, 18, NULL),
(2821, 64, 40, 4, '2025-10-30 00:19:22', 140, 18, NULL),
(2822, 65, 50, 1, '2025-10-30 00:22:55', 141, 18, NULL),
(2823, 65, 51, 1, '2025-10-30 00:22:55', 141, 18, NULL),
(2824, 65, 52, 1, '2025-10-30 00:22:55', 141, 18, NULL),
(2825, 65, 53, 1, '2025-10-30 00:22:55', 141, 18, NULL),
(2826, 65, 54, 1, '2025-10-30 00:22:55', 141, 18, NULL),
(2827, 65, 41, 1, '2025-10-30 00:22:55', 141, 18, NULL),
(2828, 65, 42, 1, '2025-10-30 00:22:56', 141, 18, NULL),
(2829, 65, 43, 1, '2025-10-30 00:22:56', 141, 18, NULL),
(2830, 65, 44, 1, '2025-10-30 00:22:56', 141, 18, NULL),
(2831, 65, 45, 1, '2025-10-30 00:22:56', 141, 18, NULL),
(2832, 65, 46, 1, '2025-10-30 00:22:56', 141, 18, NULL),
(2833, 65, 47, 1, '2025-10-30 00:22:56', 141, 18, NULL),
(2834, 65, 48, 1, '2025-10-30 00:22:56', 141, 18, NULL),
(2835, 65, 49, 1, '2025-10-30 00:22:56', 141, 18, NULL),
(2836, 65, 55, 1, '2025-10-30 00:22:56', 141, 18, NULL),
(2837, 65, 56, 1, '2025-10-30 00:22:56', 141, 18, NULL),
(2838, 65, 57, 1, '2025-10-30 00:22:56', 141, 18, NULL),
(2839, 65, 58, 1, '2025-10-30 00:22:56', 141, 18, NULL),
(2840, 65, 59, 1, '2025-10-30 00:22:56', 141, 18, NULL),
(2841, 65, 60, 1, '2025-10-30 00:22:56', 141, 18, NULL),
(2842, 65, 61, 1, '2025-10-30 00:22:56', 141, 18, NULL),
(2843, 65, 36, 1, '2025-10-30 00:22:56', 141, 18, NULL),
(2844, 65, 37, 1, '2025-10-30 00:22:56', 141, 18, NULL),
(2845, 65, 38, 1, '2025-10-30 00:22:56', 141, 18, NULL),
(2846, 65, 39, 1, '2025-10-30 00:22:56', 141, 18, NULL),
(2847, 65, 40, 1, '2025-10-30 00:22:56', 141, 18, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `evaluationsubmissions`
--

CREATE TABLE `evaluationsubmissions` (
  `SubmissionID` int(11) NOT NULL,
  `LoadID` int(11) DEFAULT NULL,
  `StudentID` int(11) DEFAULT NULL,
  `SubmissionDate` datetime NOT NULL,
  `CycleID` int(11) NOT NULL,
  `AverageScore` decimal(5,2) DEFAULT NULL,
  `Strengths` text DEFAULT NULL,
  `Weaknesses` text DEFAULT NULL,
  `AdditionalMessage` text DEFAULT NULL,
  `IsReleased` tinyint(4) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `evaluationsubmissions`
--

INSERT INTO `evaluationsubmissions` (`SubmissionID`, `LoadID`, `StudentID`, `SubmissionDate`, `CycleID`, `AverageScore`, `Strengths`, `Weaknesses`, `AdditionalMessage`, `IsReleased`) VALUES
(140, 64, 42, '2025-10-30 08:19:21', 18, 90.63, 'rewfawefSEFsefWEF', 'wefWEFefweawef', 'awefwefwewewef', NULL),
(141, 65, 42, '2025-10-30 08:22:55', 18, 20.00, 'adsdfasdfasdf', 'asefefwewefWEF', 'wefWEFwefWEFewfew', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `facultyload`
--

CREATE TABLE `facultyload` (
  `LoadID` int(11) NOT NULL,
  `FacultyID` int(11) NOT NULL,
  `DepartmentID` int(100) NOT NULL,
  `CourseID` int(11) NOT NULL,
  `SubjectID` int(11) NOT NULL,
  `ClassID` int(11) NOT NULL,
  `Term` varchar(50) DEFAULT NULL,
  `IsDeleted` tinyint(1) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `facultyload`
--

INSERT INTO `facultyload` (`LoadID`, `FacultyID`, `DepartmentID`, `CourseID`, `SubjectID`, `ClassID`, `Term`, `IsDeleted`) VALUES
(64, 48, 1, 1, 2, 1, '1st Semester', 0),
(65, 48, 1, 1, 1, 1, '1st Semester', 0),
(66, 56, 1, 1, 14, 1, '1st Semester', 0);

-- --------------------------------------------------------

--
-- Table structure for table `gradesubmissions`
--

CREATE TABLE `gradesubmissions` (
  `SubmissionID` int(11) NOT NULL,
  `LoadID` int(11) NOT NULL,
  `CycleID` int(11) NOT NULL,
  `SubmissionDate` datetime NOT NULL DEFAULT current_timestamp(),
  `Status` enum('Submitted','Confirmed','Rejected') NOT NULL DEFAULT 'Submitted',
  `SubmittedBy` int(11) DEFAULT NULL,
  `FileID` int(11) DEFAULT NULL,
  `Remarks` text DEFAULT NULL,
  `IsConfirm` tinyint(4) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `gradesubmissions`
--

INSERT INTO `gradesubmissions` (`SubmissionID`, `LoadID`, `CycleID`, `SubmissionDate`, `Status`, `SubmittedBy`, `FileID`, `Remarks`, `IsConfirm`) VALUES
(46, 64, 18, '2025-10-30 09:09:41', 'Submitted', 48, 1, NULL, 0),
(47, 65, 18, '2025-10-30 09:12:42', 'Submitted', 48, 2, NULL, 0);

-- --------------------------------------------------------

--
-- Table structure for table `grade_files`
--

CREATE TABLE `grade_files` (
  `FileID` int(11) NOT NULL,
  `LoadID` int(11) NOT NULL,
  `CycleID` int(11) NOT NULL,
  `FileName` varchar(255) NOT NULL,
  `FilePath` varchar(500) NOT NULL,
  `FileSize` int(11) NOT NULL,
  `MimeType` varchar(100) NOT NULL,
  `SubmissionDate` datetime NOT NULL DEFAULT current_timestamp(),
  `Status` enum('Pending','Approved','Rejected') DEFAULT 'Pending',
  `Remarks` text DEFAULT NULL,
  `ReviewedBy` int(11) DEFAULT NULL,
  `ReviewedDate` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `grade_files`
--

INSERT INTO `grade_files` (`FileID`, `LoadID`, `CycleID`, `FileName`, `FilePath`, `FileSize`, `MimeType`, `SubmissionDate`, `Status`, `Remarks`, `ReviewedBy`, `ReviewedDate`) VALUES
(1, 64, 18, 'Faculty_Evaluation_Summary_20251025150356 (1).xlsx', 'C:\\Users\\alvin\\Desktop\\Eval\\Faculty_Evaluation_System\\Faculty_Evaluation_System\\Uploads\\GradeSheets\\4aa6e142-2388-42e3-8635-2f4de185d538.xlsx', 8237, 'application/vnd.openxmlformats-officedocument.spreadsheetml.sheet', '2025-10-30 09:09:41', 'Pending', NULL, NULL, NULL),
(2, 65, 18, 'Faculty_Evaluation_Summary_20251025150356 (1) (1).xlsx', 'C:\\Users\\alvin\\Desktop\\Eval\\Faculty_Evaluation_System\\Faculty_Evaluation_System\\Uploads\\GradeSheets\\36f23d4f-6023-463c-9aa4-028859b55c8f.xlsx', 8237, 'application/vnd.openxmlformats-officedocument.spreadsheetml.sheet', '2025-10-30 09:12:42', 'Pending', NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `passwordresettokens`
--

CREATE TABLE `passwordresettokens` (
  `TokenID` int(11) NOT NULL,
  `SchoolID` varchar(50) NOT NULL,
  `Token` varchar(6) NOT NULL,
  `Expiration` datetime NOT NULL,
  `Used` tinyint(1) NOT NULL DEFAULT 0,
  `CreatedAt` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `students`
--

CREATE TABLE `students` (
  `StudentID` int(11) NOT NULL,
  `LastName` varchar(100) NOT NULL,
  `MiddleInitial` varchar(20) DEFAULT NULL,
  `FirstName` varchar(100) NOT NULL,
  `Suffix` varchar(15) DEFAULT NULL,
  `Email` varchar(100) NOT NULL,
  `SchoolID` varchar(50) NOT NULL,
  `Password` varchar(100) NOT NULL,
  `DepartmentID` int(11) NOT NULL,
  `CourseID` int(11) DEFAULT NULL,
  `Status` enum('Active','Inactive','Graduated') DEFAULT 'Active',
  `ClassID` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `students`
--

INSERT INTO `students` (`StudentID`, `LastName`, `MiddleInitial`, `FirstName`, `Suffix`, `Email`, `SchoolID`, `Password`, `DepartmentID`, `CourseID`, `Status`, `ClassID`) VALUES
(1, 'Dela Cruz', 'M', 'Juan', '', 'juan.delacruz@student.university.edu', '2021-001', 'ef797c8118f02dfb649607dd5d3f8c7623048c9c063d532cc95c5ed7a898a64f', 1, 1, 'Active', 1),
(2, 'Santos', 'R', 'Maria', '', 'maria.santos@student.university.edu', '2021-002', 'ef797c8118f02dfb649607dd5d3f8c7623048c9c063d532cc95c5ed7a898a64f', 1, 1, 'Active', 1),
(3, 'Reyes', 'G', 'Pedro', '', 'pedro.reyes@student.university.edu', '2021-003', 'ef797c8118f02dfb649607dd5d3f8c7623048c9c063d532cc95c5ed7a898a64f', 1, 1, 'Active', 1),
(4, 'Gonzales', 'S', 'Ana', '', 'ana.gonzales@student.university.edu', '2021-004', 'ef797c8118f02dfb649607dd5d3f8c7623048c9c063d532cc95c5ed7a898a64f', 1, 1, 'Active', 1),
(5, 'Lopez', 'T', 'Carlos', '', 'carlos.lopez@student.university.edu', '2020-001', 'ef797c8118f02dfb649607dd5d3f8c7623048c9c063d532cc95c5ed7a898a64f', 1, 1, 'Active', 1),
(6, 'Mendoza', 'A', 'Sofia', '', 'sofia.mendoza@student.university.edu', '2020-002', 'ef797c8118f02dfb649607dd5d3f8c7623048c9c063d532cc95c5ed7a898a64f', 1, 1, 'Active', 1),
(7, 'Castro', 'V', 'Miguel', NULL, 'miguel.castro@student.university.edu', '2021-005', 'ef797c8118f02dfb649607dd5d3f8c7623048c9c063d532cc95c5ed7a898a64f', 1, 1, 'Active', 1),
(8, 'Fernandez', 'L', 'Elena', '', 'elena.fernandez@student.university.edu', '2021-006', 'ef797c8118f02dfb649607dd5d3f8c7623048c9c063d532cc95c5ed7a898a64f', 1, 2, 'Active', 4),
(9, 'Torres', 'B', 'Antonio', '', 'antonio.torres@student.university.edu', '2021-007', 'ef797c8118f02dfb649607dd5d3f8c7623048c9c063d532cc95c5ed7a898a64f', 2, 3, 'Active', 5),
(10, 'Rivera', 'N', 'Isabel', '', 'isabel.rivera@student.university.edu', '2020-003', 'ef797c8118f02dfb649607dd5d3f8c7623048c9c063d532cc95c5ed7a898a64f', 2, 3, 'Active', 5),
(11, 'Lim', 'C', 'Christopher', '', 'christopher.lim@student.university.edu', '2021-008', 'ef797c8118f02dfb649607dd5d3f8c7623048c9c063d532cc95c5ed7a898a64f', 3, 4, 'Active', 7),
(12, 'Chua', 'D', 'Angela', '', 'angela.chua@student.university.edu', '2021-009', 'ef797c8118f02dfb649607dd5d3f8c7623048c9c063d532cc95c5ed7a898a64f', 4, 5, 'Active', 8),
(42, 'Cj', 'D', 'Red', NULL, 'hh1511694@gmail.com', '2025it2', 'ef797c8118f02dfb649607dd5d3f8c7623048c9c063d532cc95c5ed7a898a64f', 1, 1, 'Active', 1),
(43, 'Dela Cruz', 'A', 'Juan', 'Jr', 'juan.delacruz@student.college.edu', '2025-001', '41534b302d12fd042d8758d0b9fba16aa8f60aefa50f71cdb9c1289f8e9bd110', 1, 1, 'Active', 1),
(44, 'Santos', 'R', 'Maria', NULL, 'maria.santos@student.college.edu', '2025-002', 'e39338335fe912425a3eb1ecb77d4142905fb0e83617961a057601eb81f95b45', 1, 1, 'Active', 2),
(51, 'asdad', 'q', 'sdasd', NULL, 'pularalphgabriel54@gmail.com', '2025-006', '0a88f106306dff40464525427ebf8718d038e7f2f858538635d0bb5aa7ea7ffc', 1, 1, 'Active', 1);

-- --------------------------------------------------------

--
-- Table structure for table `subjects`
--

CREATE TABLE `subjects` (
  `SubjectID` int(11) NOT NULL,
  `SubjectName` varchar(100) NOT NULL,
  `SubjectCode` varchar(20) NOT NULL,
  `IsActive` tinyint(1) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `subjects`
--

INSERT INTO `subjects` (`SubjectID`, `SubjectName`, `SubjectCode`, `IsActive`) VALUES
(1, 'Introduction to Programming', 'PROG101', 1),
(2, 'Database Management Systems', 'DBMS101', 1),
(3, 'Web Development', 'WEB101', 1),
(4, 'Data Structures and Algorithms', 'DSA101', 1),
(5, 'Criminal Law', 'CRIM101', 1),
(6, 'Forensic Science', 'FORS101', 1),
(7, 'Business Mathematics', 'BMATH101', 1),
(8, 'Principles of Management', 'MGMT101', 1),
(9, 'Child Development', 'CDEV101', 1),
(10, 'Teaching Strategies', 'TSTR101', 1),
(11, 'Engineering Mechanics', 'EMECH101', 1),
(12, 'Calculus 1', 'CALC101', 1),
(14, 'Mathematics 101', 'MATH101', 1),
(15, 'English Composition', 'ENG201', 1),
(16, 'General Science', 'SCI301', 1),
(17, 'World History', 'HIST401', 1),
(18, 'Computer Science', 'CS101', 1);

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `UserID` int(11) NOT NULL,
  `LastName` varchar(100) NOT NULL,
  `FirstName` varchar(100) NOT NULL,
  `MiddleInitial` varchar(20) NOT NULL,
  `Suffix` varchar(15) DEFAULT NULL,
  `SchoolID` varchar(50) NOT NULL,
  `Password` varchar(255) NOT NULL,
  `Role` enum('Student','Faculty','Dean','Admin','Registrar') NOT NULL,
  `DepartmentID` int(100) DEFAULT NULL,
  `Status` enum('Active','Inactive') DEFAULT 'Active',
  `Email` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`UserID`, `LastName`, `FirstName`, `MiddleInitial`, `Suffix`, `SchoolID`, `Password`, `Role`, `DepartmentID`, `Status`, `Email`) VALUES
(47, 'Admin', 'System', '', '', 'admin001', 'ef797c8118f02dfb649607dd5d3f8c7623048c9c063d532cc95c5ed7a898a64f', 'Admin', NULL, 'Active', 'admin@college.edu'),
(48, 'Pula', 'Ralph Gabriel', 'D', NULL, '2025it1', 'ef797c8118f02dfb649607dd5d3f8c7623048c9c063d532cc95c5ed7a898a64f', 'Faculty', 1, 'Active', 'ralphgabriel2222@gmail.com'),
(49, 'ralph', 'Bosz', 'D', NULL, 'Dean1', 'ef797c8118f02dfb649607dd5d3f8c7623048c9c063d532cc95c5ed7a898a64f', 'Dean', 1, 'Active', '23bossrr@gmail.com'),
(50, 'Account', 'Registrar', '', NULL, 'r123', 'ef797c8118f02dfb649607dd5d3f8c7623048c9c063d532cc95c5ed7a898a64f', 'Registrar', NULL, 'Active', NULL),
(52, 'Manuel', 'John Vianney', 'V', NULL, '1234', '6b86b273ff34fce19d6b804eff5a3f5747ada4eaa22f1d49c01e52ddb7875b4b', 'Faculty', 1, 'Active', 'johnmanuel0112@gmail.com'),
(55, 'Romasoc', 'Micah', 'R', NULL, '12345678', 'dc4fdff52fbbbb7df86cacccf0ef1dcd6fdc032a903a9173506b00f9bd6426cf', 'Faculty', 1, 'Active', 'romasocmicah@gmail.com'),
(56, 'Navarro', 'John', 'O', 'jrsriii', '2028', 'd765c5a8d506016bf34461de0d9d57d6952a2adbeba94a11e737972e7c79dd2c', 'Faculty', 1, 'Active', 'johnpaulnavarro0105@gmail.com');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `classes`
--
ALTER TABLE `classes`
  ADD PRIMARY KEY (`ClassID`),
  ADD KEY `classes_ibfk_1` (`CourseID`);

--
-- Indexes for table `courses`
--
ALTER TABLE `courses`
  ADD PRIMARY KEY (`CourseID`),
  ADD KEY `DeptID` (`DepartmentID`);

--
-- Indexes for table `departments`
--
ALTER TABLE `departments`
  ADD PRIMARY KEY (`DepartmentID`),
  ADD UNIQUE KEY `Name` (`DepartmentName`);

--
-- Indexes for table `evaluationcycles`
--
ALTER TABLE `evaluationcycles`
  ADD PRIMARY KEY (`CycleID`);

--
-- Indexes for table `evaluationdomains`
--
ALTER TABLE `evaluationdomains`
  ADD PRIMARY KEY (`DomainID`);

--
-- Indexes for table `evaluationquestions`
--
ALTER TABLE `evaluationquestions`
  ADD PRIMARY KEY (`QuestionID`),
  ADD KEY `fk_eval_domain` (`DomainID`);

--
-- Indexes for table `evaluations`
--
ALTER TABLE `evaluations`
  ADD PRIMARY KEY (`EvalID`),
  ADD KEY `fk_eval_load` (`LoadID`),
  ADD KEY `fk_eval_question` (`QuestionID`),
  ADD KEY `idx_evaluations_LoadID` (`LoadID`),
  ADD KEY `idx_evaluations_QuestionID` (`QuestionID`),
  ADD KEY `evaluations_ibfk_1` (`SubmissionID`),
  ADD KEY `FK_evaluations_Cycle` (`CycleID`);

--
-- Indexes for table `evaluationsubmissions`
--
ALTER TABLE `evaluationsubmissions`
  ADD PRIMARY KEY (`SubmissionID`),
  ADD UNIQUE KEY `uq_evalsubmission` (`LoadID`,`StudentID`,`CycleID`),
  ADD KEY `fk_sub_student` (`StudentID`),
  ADD KEY `idx_evaluationsubmissions_LoadID` (`LoadID`),
  ADD KEY `FK_EvalSubmissions_Cycle` (`CycleID`);

--
-- Indexes for table `facultyload`
--
ALTER TABLE `facultyload`
  ADD PRIMARY KEY (`LoadID`),
  ADD KEY `facultyload_ibfk_1` (`FacultyID`),
  ADD KEY `facultyload_ibfk_2` (`CourseID`),
  ADD KEY `facultyload_ibfk_3` (`SubjectID`),
  ADD KEY `facultyload_ibfk_4` (`ClassID`),
  ADD KEY `fk_facultyload_department` (`DepartmentID`),
  ADD KEY `idx_facultyload_FacultyID` (`FacultyID`),
  ADD KEY `idx_facultyload_DepartmentID` (`DepartmentID`),
  ADD KEY `idx_facultyload_CourseID` (`CourseID`),
  ADD KEY `idx_facultyload_SubjectID` (`SubjectID`);

--
-- Indexes for table `gradesubmissions`
--
ALTER TABLE `gradesubmissions`
  ADD PRIMARY KEY (`SubmissionID`),
  ADD UNIQUE KEY `UQ_Gradesubmissions_Load_Cycle` (`LoadID`,`CycleID`),
  ADD KEY `FK_Gradesubmissions_FacultyLoad` (`LoadID`),
  ADD KEY `FK_Gradesubmissions_EvalCycle` (`CycleID`),
  ADD KEY `FileID` (`FileID`);

--
-- Indexes for table `grade_files`
--
ALTER TABLE `grade_files`
  ADD PRIMARY KEY (`FileID`),
  ADD KEY `LoadID` (`LoadID`),
  ADD KEY `CycleID` (`CycleID`),
  ADD KEY `ReviewedBy` (`ReviewedBy`);

--
-- Indexes for table `passwordresettokens`
--
ALTER TABLE `passwordresettokens`
  ADD PRIMARY KEY (`TokenID`),
  ADD KEY `SchoolID` (`SchoolID`);

--
-- Indexes for table `students`
--
ALTER TABLE `students`
  ADD PRIMARY KEY (`StudentID`),
  ADD UNIQUE KEY `SchoolID` (`SchoolID`),
  ADD KEY `FK_Students_Classes` (`ClassID`),
  ADD KEY `students_ibfk_2` (`CourseID`),
  ADD KEY `students_ibfk_1` (`DepartmentID`);

--
-- Indexes for table `subjects`
--
ALTER TABLE `subjects`
  ADD PRIMARY KEY (`SubjectID`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`UserID`),
  ADD UNIQUE KEY `SchoolID` (`SchoolID`),
  ADD KEY `fk_users_department` (`DepartmentID`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `classes`
--
ALTER TABLE `classes`
  MODIFY `ClassID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=55;

--
-- AUTO_INCREMENT for table `courses`
--
ALTER TABLE `courses`
  MODIFY `CourseID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=36;

--
-- AUTO_INCREMENT for table `departments`
--
ALTER TABLE `departments`
  MODIFY `DepartmentID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT for table `evaluationcycles`
--
ALTER TABLE `evaluationcycles`
  MODIFY `CycleID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;

--
-- AUTO_INCREMENT for table `evaluationdomains`
--
ALTER TABLE `evaluationdomains`
  MODIFY `DomainID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT for table `evaluationquestions`
--
ALTER TABLE `evaluationquestions`
  MODIFY `QuestionID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=62;

--
-- AUTO_INCREMENT for table `evaluations`
--
ALTER TABLE `evaluations`
  MODIFY `EvalID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2848;

--
-- AUTO_INCREMENT for table `evaluationsubmissions`
--
ALTER TABLE `evaluationsubmissions`
  MODIFY `SubmissionID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=142;

--
-- AUTO_INCREMENT for table `facultyload`
--
ALTER TABLE `facultyload`
  MODIFY `LoadID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=67;

--
-- AUTO_INCREMENT for table `gradesubmissions`
--
ALTER TABLE `gradesubmissions`
  MODIFY `SubmissionID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=48;

--
-- AUTO_INCREMENT for table `grade_files`
--
ALTER TABLE `grade_files`
  MODIFY `FileID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `passwordresettokens`
--
ALTER TABLE `passwordresettokens`
  MODIFY `TokenID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `students`
--
ALTER TABLE `students`
  MODIFY `StudentID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=52;

--
-- AUTO_INCREMENT for table `subjects`
--
ALTER TABLE `subjects`
  MODIFY `SubjectID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `UserID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=57;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `classes`
--
ALTER TABLE `classes`
  ADD CONSTRAINT `classes_ibfk_1` FOREIGN KEY (`CourseID`) REFERENCES `courses` (`CourseID`) ON DELETE CASCADE;

--
-- Constraints for table `courses`
--
ALTER TABLE `courses`
  ADD CONSTRAINT `DeptID` FOREIGN KEY (`DepartmentID`) REFERENCES `departments` (`DepartmentID`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `evaluationquestions`
--
ALTER TABLE `evaluationquestions`
  ADD CONSTRAINT `fk_eval_domain` FOREIGN KEY (`DomainID`) REFERENCES `evaluationdomains` (`DomainID`) ON DELETE SET NULL ON UPDATE CASCADE;

--
-- Constraints for table `evaluations`
--
ALTER TABLE `evaluations`
  ADD CONSTRAINT `FK_evaluations_Cycle` FOREIGN KEY (`CycleID`) REFERENCES `evaluationcycles` (`CycleID`),
  ADD CONSTRAINT `evaluations_ibfk_1` FOREIGN KEY (`SubmissionID`) REFERENCES `evaluationsubmissions` (`SubmissionID`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `evaluations_ibfk_2` FOREIGN KEY (`QuestionID`) REFERENCES `evaluationquestions` (`QuestionID`) ON DELETE SET NULL ON UPDATE SET NULL,
  ADD CONSTRAINT `fk_eval_load` FOREIGN KEY (`LoadID`) REFERENCES `facultyload` (`LoadID`) ON DELETE SET NULL ON UPDATE CASCADE;

--
-- Constraints for table `evaluationsubmissions`
--
ALTER TABLE `evaluationsubmissions`
  ADD CONSTRAINT `FK_EvalSubmissions_Cycle` FOREIGN KEY (`CycleID`) REFERENCES `evaluationcycles` (`CycleID`),
  ADD CONSTRAINT `fk_evalsub_student` FOREIGN KEY (`StudentID`) REFERENCES `students` (`StudentID`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_sub_load` FOREIGN KEY (`LoadID`) REFERENCES `facultyload` (`LoadID`) ON DELETE SET NULL ON UPDATE CASCADE;

--
-- Constraints for table `facultyload`
--
ALTER TABLE `facultyload`
  ADD CONSTRAINT `facultyload_ibfk_1` FOREIGN KEY (`FacultyID`) REFERENCES `users` (`UserID`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `facultyload_ibfk_2` FOREIGN KEY (`CourseID`) REFERENCES `courses` (`CourseID`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `facultyload_ibfk_3` FOREIGN KEY (`SubjectID`) REFERENCES `subjects` (`SubjectID`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `facultyload_ibfk_4` FOREIGN KEY (`ClassID`) REFERENCES `classes` (`ClassID`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_facultyload_department` FOREIGN KEY (`DepartmentID`) REFERENCES `departments` (`DepartmentID`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `gradesubmissions`
--
ALTER TABLE `gradesubmissions`
  ADD CONSTRAINT `FK_Gradesubmissions_EvalCycle` FOREIGN KEY (`CycleID`) REFERENCES `evaluationcycles` (`CycleID`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_Gradesubmissions_FacultyLoad` FOREIGN KEY (`LoadID`) REFERENCES `facultyload` (`LoadID`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `gradesubmissions_ibfk_1` FOREIGN KEY (`FileID`) REFERENCES `grade_files` (`FileID`);

--
-- Constraints for table `grade_files`
--
ALTER TABLE `grade_files`
  ADD CONSTRAINT `grade_files_ibfk_1` FOREIGN KEY (`LoadID`) REFERENCES `facultyload` (`LoadID`),
  ADD CONSTRAINT `grade_files_ibfk_2` FOREIGN KEY (`CycleID`) REFERENCES `evaluationcycles` (`CycleID`),
  ADD CONSTRAINT `grade_files_ibfk_3` FOREIGN KEY (`ReviewedBy`) REFERENCES `users` (`UserID`);

--
-- Constraints for table `students`
--
ALTER TABLE `students`
  ADD CONSTRAINT `students_ibfk_1` FOREIGN KEY (`DepartmentID`) REFERENCES `departments` (`DepartmentID`) ON DELETE CASCADE,
  ADD CONSTRAINT `students_ibfk_2` FOREIGN KEY (`CourseID`) REFERENCES `courses` (`CourseID`) ON DELETE CASCADE,
  ADD CONSTRAINT `students_ibfk_3` FOREIGN KEY (`ClassID`) REFERENCES `classes` (`ClassID`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `users`
--
ALTER TABLE `users`
  ADD CONSTRAINT `fk_users_department` FOREIGN KEY (`DepartmentID`) REFERENCES `departments` (`DepartmentID`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
