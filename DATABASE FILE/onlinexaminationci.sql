-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: May 14, 2024 at 03:08 PM
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
-- Database: `onlinexaminationci`
--

-- --------------------------------------------------------

--
-- Table structure for table `dosen`
--

CREATE TABLE `dosen` (
  `id_dosen` int(11) NOT NULL,
  `nip` char(12) NOT NULL,
  `nama_dosen` varchar(50) NOT NULL,
  `email` varchar(254) NOT NULL,
  `matkul_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `dosen`
--

INSERT INTO `dosen` (`id_dosen`, `nip`, `nama_dosen`, `email`, `matkul_id`) VALUES
(1, '00000001', 'Anmol Kashap', 'Anmol123@gmail.com', 1),
(2, '00000002', 'Aniket Sharma', 'aniketsharma05032001@gmail.com', 2),
(3, '00000003', 'Anurag Agrawal', 'anurag0707@gmail.com', 3),
(4, '00000004', 'Ayush Gupta', 'ayush@gmail.com', 4);

--
-- Triggers `dosen`
--
DELIMITER $$
CREATE TRIGGER `edit_user_dosen` BEFORE UPDATE ON `dosen` FOR EACH ROW UPDATE `users` SET `email` = NEW.email, `username` = NEW.nip WHERE `users`.`username` = OLD.nip
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `hapus_user_dosen` BEFORE DELETE ON `dosen` FOR EACH ROW DELETE FROM `users` WHERE `users`.`username` = OLD.nip
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `groups`
--

CREATE TABLE `groups` (
  `id` mediumint(8) UNSIGNED NOT NULL,
  `name` varchar(20) NOT NULL,
  `description` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `groups`
--

INSERT INTO `groups` (`id`, `name`, `description`) VALUES
(1, 'admin', 'Administrator'),
(2, 'Lecturer', 'For making and checking Questions. And also conducting examinations'),
(3, 'Student', 'Exam Participants');

-- --------------------------------------------------------

--
-- Table structure for table `h_ujian`
--

CREATE TABLE `h_ujian` (
  `id` int(11) NOT NULL,
  `ujian_id` int(11) NOT NULL,
  `mahasiswa_id` int(11) NOT NULL,
  `list_soal` longtext NOT NULL,
  `list_jawaban` longtext NOT NULL,
  `jml_benar` int(11) NOT NULL,
  `nilai` decimal(10,2) NOT NULL,
  `nilai_bobot` decimal(10,2) NOT NULL,
  `tgl_mulai` datetime NOT NULL,
  `tgl_selesai` datetime NOT NULL,
  `status` enum('Y','N') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `h_ujian`
--

INSERT INTO `h_ujian` (`id`, `ujian_id`, `mahasiswa_id`, `list_soal`, `list_jawaban`, `jml_benar`, `nilai`, `nilai_bobot`, `tgl_mulai`, `tgl_selesai`, `status`) VALUES
(1, 2, 4, '3,4,5', '3:A:N,4:B:N,5:A:N', 2, 66.00, 100.00, '2024-05-14 19:07:52', '2024-05-14 19:12:52', 'N');

-- --------------------------------------------------------

--
-- Table structure for table `jurusan`
--

CREATE TABLE `jurusan` (
  `id_jurusan` int(11) NOT NULL,
  `nama_jurusan` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `jurusan`
--

INSERT INTO `jurusan` (`id_jurusan`, `nama_jurusan`) VALUES
(1, 'CS '),
(2, 'IT');

-- --------------------------------------------------------

--
-- Table structure for table `jurusan_matkul`
--

CREATE TABLE `jurusan_matkul` (
  `id` int(11) NOT NULL,
  `matkul_id` int(11) NOT NULL,
  `jurusan_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `jurusan_matkul`
--

INSERT INTO `jurusan_matkul` (`id`, `matkul_id`, `jurusan_id`) VALUES
(2, 1, 1),
(3, 4, 1),
(4, 2, 2),
(5, 3, 2);

-- --------------------------------------------------------

--
-- Table structure for table `kelas`
--

CREATE TABLE `kelas` (
  `id_kelas` int(11) NOT NULL,
  `nama_kelas` varchar(30) NOT NULL,
  `jurusan_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `kelas`
--

INSERT INTO `kelas` (`id_kelas`, `nama_kelas`, `jurusan_id`) VALUES
(1, '1st', 1),
(2, '2nd', 1),
(3, '1st', 2),
(4, '2nd', 2);

-- --------------------------------------------------------

--
-- Table structure for table `kelas_dosen`
--

CREATE TABLE `kelas_dosen` (
  `id` int(11) NOT NULL,
  `kelas_id` int(11) NOT NULL,
  `dosen_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `kelas_dosen`
--

INSERT INTO `kelas_dosen` (`id`, `kelas_id`, `dosen_id`) VALUES
(1, 3, 1),
(2, 1, 1),
(3, 2, 2),
(4, 4, 4),
(5, 2, 3),
(6, 4, 3);

-- --------------------------------------------------------

--
-- Table structure for table `login_attempts`
--

CREATE TABLE `login_attempts` (
  `id` int(11) UNSIGNED NOT NULL,
  `ip_address` varchar(45) NOT NULL,
  `login` varchar(100) NOT NULL,
  `time` int(11) UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `login_attempts`
--

INSERT INTO `login_attempts` (`id`, `ip_address`, `login`, `time`) VALUES
(8, '::1', 'admin@skit.ac.in', 1715663415),
(9, '::1', 'admin@skit.ac.in', 1715663416),
(11, '::1', 'ani05@gmail.com', 1715687196),
(12, '::1', 'ani05@gmail.com', 1715687211),
(13, '::1', 'ani05@gmail.com', 1715687212),
(14, '::1', 'anyushi@gmail.com', 1715687561),
(15, '::1', 'anyushi@gmail.com', 1715687562),
(16, '::1', 'anyushi@gmail.com', 1715687562),
(17, '::1', 'admin@skit.ac.in', 1715687940),
(18, '::1', 'admin@skit.ac.in', 1715687942);

-- --------------------------------------------------------

--
-- Table structure for table `mahasiswa`
--

CREATE TABLE `mahasiswa` (
  `id_mahasiswa` int(11) NOT NULL,
  `nama` varchar(50) NOT NULL,
  `nim` char(20) NOT NULL,
  `email` varchar(254) NOT NULL,
  `jenis_kelamin` enum('L','P') NOT NULL,
  `kelas_id` int(11) NOT NULL COMMENT 'kelas&jurusan'
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `mahasiswa`
--

INSERT INTO `mahasiswa` (`id_mahasiswa`, `nama`, `nim`, `email`, `jenis_kelamin`, `kelas_id`) VALUES
(1, 'Ani', '00000005', 'ani05@gmail.com', '', 1),
(2, 'anyushi', '00000006', 'anyushi@gmail.com', '', 4),
(3, 'ankit', '00000007', 'ankit123@gmail.com', '', 2),
(4, 'muskan', '00000008', 'muskan07@gmail.com', '', 3);

-- --------------------------------------------------------

--
-- Table structure for table `matkul`
--

CREATE TABLE `matkul` (
  `id_matkul` int(11) NOT NULL,
  `nama_matkul` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `matkul`
--

INSERT INTO `matkul` (`id_matkul`, `nama_matkul`) VALUES
(1, 'Cloud Computing'),
(2, 'AI'),
(3, 'ML'),
(4, 'DSA');

-- --------------------------------------------------------

--
-- Table structure for table `m_ujian`
--

CREATE TABLE `m_ujian` (
  `id_ujian` int(11) NOT NULL,
  `dosen_id` int(11) NOT NULL,
  `matkul_id` int(11) NOT NULL,
  `nama_ujian` varchar(200) NOT NULL,
  `jumlah_soal` int(11) NOT NULL,
  `waktu` int(11) NOT NULL,
  `jenis` enum('Random','Sort') NOT NULL,
  `tgl_mulai` datetime NOT NULL,
  `terlambat` datetime NOT NULL,
  `token` varchar(5) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `m_ujian`
--

INSERT INTO `m_ujian` (`id_ujian`, `dosen_id`, `matkul_id`, `nama_ujian`, `jumlah_soal`, `waktu`, `jenis`, `tgl_mulai`, `terlambat`, `token`) VALUES
(2, 1, 1, 'cloud computing', 3, 5, 'Random', '2024-05-14 17:36:09', '2024-05-16 17:36:11', 'VPUQT');

-- --------------------------------------------------------

--
-- Table structure for table `tb_soal`
--

CREATE TABLE `tb_soal` (
  `id_soal` int(11) NOT NULL,
  `dosen_id` int(11) NOT NULL,
  `matkul_id` int(11) NOT NULL,
  `bobot` int(11) NOT NULL,
  `file` varchar(255) NOT NULL,
  `tipe_file` varchar(50) NOT NULL,
  `soal` longtext NOT NULL,
  `opsi_a` longtext NOT NULL,
  `opsi_b` longtext NOT NULL,
  `opsi_c` longtext NOT NULL,
  `opsi_d` longtext NOT NULL,
  `opsi_e` longtext NOT NULL,
  `file_a` varchar(255) NOT NULL,
  `file_b` varchar(255) NOT NULL,
  `file_c` varchar(255) NOT NULL,
  `file_d` varchar(255) NOT NULL,
  `file_e` varchar(255) NOT NULL,
  `jawaban` varchar(5) NOT NULL,
  `created_on` int(11) NOT NULL,
  `updated_on` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `tb_soal`
--

INSERT INTO `tb_soal` (`id_soal`, `dosen_id`, `matkul_id`, `bobot`, `file`, `tipe_file`, `soal`, `opsi_a`, `opsi_b`, `opsi_c`, `opsi_d`, `opsi_e`, `file_a`, `file_b`, `file_c`, `file_d`, `file_e`, `jawaban`, `created_on`, `updated_on`) VALUES
(1, 2, 2, 1, '', '', '<p><span xss=removed>Which technique in AI involves training a model with labeled data to make predictions or decisions?</span><br></p>', '<p><span xss=removed>Supervised Learning</span><br></p>', '<p><span xss=removed>Unsupervised Learning</span><br></p>', '<p><span xss=removed>Reinforcement Learning</span><br></p>', '<p><span xss=removed>Deep Learning</span><br></p>', '', '', '', '', '', '', 'A', 1715686658, 1715686658),
(2, 2, 2, 1, '', '', '<p><span xss=removed>What branch of AI focuses on enabling computers to understand, interpret, and generate human language?</span><br></p>', '<p><span xss=removed>Natural Language Processing (NLP)</span><br></p>', '<p><span xss=removed>Computer Vision</span><br></p>', '<p><span xss=removed>Robotics</span><br></p>', '<p xss=removed>Expert Systems</p><div><br></div>', '', '', '', '', '', '', 'A', 1715686904, 1715686904),
(3, 1, 1, 1, '', '', '<p><span xss=removed>Which cloud computing service model provides users with access to virtualized hardware resources over the internet on a pay-per-use basis?</span><br></p>', '<p><span xss=removed> Infrastructure as a Service (IaaS)</span><br></p>', '<p><span xss=removed>Platform as a Service (PaaS)</span><br></p>', '<p><span xss=removed>Software as a Service (SaaS)</span><br></p>', '<p><span xss=removed>Function as a Service (FaaS)</span><br></p>', '', '', '', '', '', '', 'A', 1715688068, 1715688068),
(4, 1, 1, 1, '', '', '<p><span xss=removed>What type of cloud deployment model involves sharing computing resources across multiple organizations while maintaining isolation?</span><br></p>', '<p><span xss=removed>Public Cloud</span><br></p>', '<p><span xss=removed>Private Cloud</span><br></p>', '<p><span xss=removed> Hybrid Cloud</span><br></p>', '<p><span xss=removed>Community Cloud</span><br></p>', '', '', '', '', '', '', 'B', 1715688299, 1715688299),
(5, 1, 1, 1, '', '', '<p><span xss=removed>Which cloud computing service model provides users with ready-to-use applications accessed over the internet, eliminating the need for installation and maintenance?</span><br></p>', '<p><span xss=removed> Infrastructure as a Service (IaaS)</span><br></p>', '<p><span xss=removed>Platform as a Service (PaaS)</span><br></p>', '<p><span xss=removed>Software as a Service (SaaS)</span><br></p>', '<p><span xss=removed>Function as a Service (FaaS)</span><br></p>', '', '', '', '', '', '', 'C', 1715688338, 1715688338);

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(11) UNSIGNED NOT NULL,
  `ip_address` varchar(45) NOT NULL,
  `username` varchar(100) DEFAULT NULL,
  `password` varchar(255) NOT NULL,
  `email` varchar(254) DEFAULT NULL,
  `activation_selector` varchar(255) DEFAULT NULL,
  `activation_code` varchar(255) DEFAULT NULL,
  `forgotten_password_selector` varchar(255) DEFAULT NULL,
  `forgotten_password_code` varchar(255) DEFAULT NULL,
  `forgotten_password_time` int(11) UNSIGNED DEFAULT NULL,
  `remember_selector` varchar(255) DEFAULT NULL,
  `remember_code` varchar(255) DEFAULT NULL,
  `created_on` int(11) UNSIGNED NOT NULL,
  `last_login` int(11) UNSIGNED DEFAULT NULL,
  `active` tinyint(1) UNSIGNED DEFAULT NULL,
  `first_name` varchar(50) DEFAULT NULL,
  `last_name` varchar(50) DEFAULT NULL,
  `company` varchar(100) DEFAULT NULL,
  `phone` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `ip_address`, `username`, `password`, `email`, `activation_selector`, `activation_code`, `forgotten_password_selector`, `forgotten_password_code`, `forgotten_password_time`, `remember_selector`, `remember_code`, `created_on`, `last_login`, `active`, `first_name`, `last_name`, `company`, `phone`) VALUES
(1, '127.0.0.1', 'Administrator', '$2y$12$JjM5xBghu01DOMBL4./8M.V54I2CIuLNqQ1dHTRPbnHCprQRa3FKq', 'admin@mail.com', NULL, '', NULL, NULL, NULL, NULL, NULL, 1268889823, 1715687948, 1, 'Admin', 'Williams', 'ADMIN', '0'),
(15, '::1', '00000001', '$2y$10$W/zikQVvV4id2E.jWh4f5O97flhlriFGyuEYDdtImbiiyrDf23dES', 'Anmol123@gmail.com', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1715686333, 1715689188, 1, 'Anmol', 'Kashap', NULL, NULL),
(16, '::1', '00000002', '$2y$10$ofkzrUnqx.UFuDkNC1lSJOzVNdABJHt9B6gL31UxfxOEHoLpZilQu', 'aniketsharma05032001@gmail.com', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1715686342, NULL, 1, 'Aniket', 'Sharma', NULL, NULL),
(17, '::1', '00000003', '$2y$10$/Ovmpsl69CpYVHLnu.U6qOYlXXaLMPRmifJx7bIltV7ZLVNOBXWIi', 'anurag0707@gmail.com', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1715686344, NULL, 1, 'Anurag', 'Agrawal', NULL, NULL),
(18, '::1', '00000004', '$2y$10$KlOMOyFeGp/pW5Z7yK48a.3OlFCJU2/M4tpm3P6NePqTJUF.zO7xm', 'ayush@gmail.com', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1715686345, NULL, 1, 'Ayush', 'Gupta', NULL, NULL),
(19, '::1', '00000005', '$2y$10$eoVXAud./D4ZorQ1JWzjhOpqeRjuSCrepkDuJ9c2RSSo8yZLdD0N6', '	ani05@gmail.com', NULL, NULL, '9d2a6cabf1a756c3d41e', '$2y$10$rz.iQAtp58Kiw2ydNTfbiOHtMy7BX41sQMarZYYgaWE4yq5ZbDXs.', 1715687317, NULL, NULL, 1715687278, NULL, 1, 'Ani', 'Ani', NULL, NULL),
(20, '::1', '00000006', '$2y$10$NK7xn0rtSZYYeV6eeG73kuvwrgWR0rM88l2ofn96VzvNdMVXeoH7.', 'anyushi@gmail.com', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1715687725, NULL, 1, 'anyushi', 'anyushi', NULL, NULL),
(21, '::1', '00000007', '$2y$10$vHBdgAyDxjgvxZllRYWzpOWxxwxl/QIrr1cvT2DYZzoUxmendJF6K', 'ankit123@gmail.com', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1715687780, NULL, 1, 'ankit', 'ankit', NULL, NULL),
(22, '::1', '00000008', '$2y$10$JSgh9nfYrTVw2Ykd6mDCkusC5XNoxX7Xch2NYst0jndtsGYOYeJaS', 'muskan07@gmail.com', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1715687838, 1715691457, 1, 'muskan', 'muskan', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `users_groups`
--

CREATE TABLE `users_groups` (
  `id` int(11) UNSIGNED NOT NULL,
  `user_id` int(11) UNSIGNED NOT NULL,
  `group_id` mediumint(8) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `users_groups`
--

INSERT INTO `users_groups` (`id`, `user_id`, `group_id`) VALUES
(3, 1, 1),
(17, 15, 2),
(18, 16, 2),
(19, 17, 2),
(20, 18, 2),
(21, 19, 3),
(22, 20, 3),
(23, 21, 3),
(24, 22, 3);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `dosen`
--
ALTER TABLE `dosen`
  ADD PRIMARY KEY (`id_dosen`),
  ADD UNIQUE KEY `email` (`email`),
  ADD UNIQUE KEY `nip` (`nip`),
  ADD KEY `matkul_id` (`matkul_id`);

--
-- Indexes for table `groups`
--
ALTER TABLE `groups`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `h_ujian`
--
ALTER TABLE `h_ujian`
  ADD PRIMARY KEY (`id`),
  ADD KEY `ujian_id` (`ujian_id`),
  ADD KEY `mahasiswa_id` (`mahasiswa_id`);

--
-- Indexes for table `jurusan`
--
ALTER TABLE `jurusan`
  ADD PRIMARY KEY (`id_jurusan`);

--
-- Indexes for table `jurusan_matkul`
--
ALTER TABLE `jurusan_matkul`
  ADD PRIMARY KEY (`id`),
  ADD KEY `jurusan_id` (`jurusan_id`),
  ADD KEY `matkul_id` (`matkul_id`);

--
-- Indexes for table `kelas`
--
ALTER TABLE `kelas`
  ADD PRIMARY KEY (`id_kelas`),
  ADD KEY `jurusan_id` (`jurusan_id`);

--
-- Indexes for table `kelas_dosen`
--
ALTER TABLE `kelas_dosen`
  ADD PRIMARY KEY (`id`),
  ADD KEY `kelas_id` (`kelas_id`),
  ADD KEY `dosen_id` (`dosen_id`);

--
-- Indexes for table `login_attempts`
--
ALTER TABLE `login_attempts`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `mahasiswa`
--
ALTER TABLE `mahasiswa`
  ADD PRIMARY KEY (`id_mahasiswa`),
  ADD UNIQUE KEY `nim` (`nim`),
  ADD UNIQUE KEY `email` (`email`),
  ADD KEY `kelas_id` (`kelas_id`);

--
-- Indexes for table `matkul`
--
ALTER TABLE `matkul`
  ADD PRIMARY KEY (`id_matkul`);

--
-- Indexes for table `m_ujian`
--
ALTER TABLE `m_ujian`
  ADD PRIMARY KEY (`id_ujian`),
  ADD KEY `matkul_id` (`matkul_id`),
  ADD KEY `dosen_id` (`dosen_id`);

--
-- Indexes for table `tb_soal`
--
ALTER TABLE `tb_soal`
  ADD PRIMARY KEY (`id_soal`),
  ADD KEY `matkul_id` (`matkul_id`),
  ADD KEY `dosen_id` (`dosen_id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `uc_activation_selector` (`activation_selector`),
  ADD UNIQUE KEY `uc_forgotten_password_selector` (`forgotten_password_selector`),
  ADD UNIQUE KEY `uc_remember_selector` (`remember_selector`),
  ADD UNIQUE KEY `uc_email` (`email`) USING BTREE;

--
-- Indexes for table `users_groups`
--
ALTER TABLE `users_groups`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `uc_users_groups` (`user_id`,`group_id`),
  ADD KEY `fk_users_groups_users1_idx` (`user_id`),
  ADD KEY `fk_users_groups_groups1_idx` (`group_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `dosen`
--
ALTER TABLE `dosen`
  MODIFY `id_dosen` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `groups`
--
ALTER TABLE `groups`
  MODIFY `id` mediumint(8) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `h_ujian`
--
ALTER TABLE `h_ujian`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `jurusan`
--
ALTER TABLE `jurusan`
  MODIFY `id_jurusan` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `jurusan_matkul`
--
ALTER TABLE `jurusan_matkul`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `kelas`
--
ALTER TABLE `kelas`
  MODIFY `id_kelas` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `kelas_dosen`
--
ALTER TABLE `kelas_dosen`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `login_attempts`
--
ALTER TABLE `login_attempts`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT for table `mahasiswa`
--
ALTER TABLE `mahasiswa`
  MODIFY `id_mahasiswa` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `matkul`
--
ALTER TABLE `matkul`
  MODIFY `id_matkul` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `m_ujian`
--
ALTER TABLE `m_ujian`
  MODIFY `id_ujian` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `tb_soal`
--
ALTER TABLE `tb_soal`
  MODIFY `id_soal` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;

--
-- AUTO_INCREMENT for table `users_groups`
--
ALTER TABLE `users_groups`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=25;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `dosen`
--
ALTER TABLE `dosen`
  ADD CONSTRAINT `dosen_ibfk_1` FOREIGN KEY (`matkul_id`) REFERENCES `matkul` (`id_matkul`);

--
-- Constraints for table `h_ujian`
--
ALTER TABLE `h_ujian`
  ADD CONSTRAINT `h_ujian_ibfk_1` FOREIGN KEY (`ujian_id`) REFERENCES `m_ujian` (`id_ujian`),
  ADD CONSTRAINT `h_ujian_ibfk_2` FOREIGN KEY (`mahasiswa_id`) REFERENCES `mahasiswa` (`id_mahasiswa`);

--
-- Constraints for table `jurusan_matkul`
--
ALTER TABLE `jurusan_matkul`
  ADD CONSTRAINT `jurusan_matkul_ibfk_1` FOREIGN KEY (`jurusan_id`) REFERENCES `jurusan` (`id_jurusan`),
  ADD CONSTRAINT `jurusan_matkul_ibfk_2` FOREIGN KEY (`matkul_id`) REFERENCES `matkul` (`id_matkul`);

--
-- Constraints for table `kelas_dosen`
--
ALTER TABLE `kelas_dosen`
  ADD CONSTRAINT `kelas_dosen_ibfk_1` FOREIGN KEY (`dosen_id`) REFERENCES `dosen` (`id_dosen`),
  ADD CONSTRAINT `kelas_dosen_ibfk_2` FOREIGN KEY (`kelas_id`) REFERENCES `kelas` (`id_kelas`);

--
-- Constraints for table `mahasiswa`
--
ALTER TABLE `mahasiswa`
  ADD CONSTRAINT `mahasiswa_ibfk_2` FOREIGN KEY (`kelas_id`) REFERENCES `kelas` (`id_kelas`);

--
-- Constraints for table `m_ujian`
--
ALTER TABLE `m_ujian`
  ADD CONSTRAINT `m_ujian_ibfk_1` FOREIGN KEY (`dosen_id`) REFERENCES `dosen` (`id_dosen`),
  ADD CONSTRAINT `m_ujian_ibfk_2` FOREIGN KEY (`matkul_id`) REFERENCES `matkul` (`id_matkul`);

--
-- Constraints for table `tb_soal`
--
ALTER TABLE `tb_soal`
  ADD CONSTRAINT `tb_soal_ibfk_1` FOREIGN KEY (`matkul_id`) REFERENCES `matkul` (`id_matkul`),
  ADD CONSTRAINT `tb_soal_ibfk_2` FOREIGN KEY (`dosen_id`) REFERENCES `dosen` (`id_dosen`);

--
-- Constraints for table `users_groups`
--
ALTER TABLE `users_groups`
  ADD CONSTRAINT `fk_users_groups_groups1` FOREIGN KEY (`group_id`) REFERENCES `groups` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_users_groups_users1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
