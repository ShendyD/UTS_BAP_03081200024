-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Oct 20, 2022 at 07:43 PM
-- Server version: 10.4.21-MariaDB
-- PHP Version: 8.1.2

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `KRS`
--

-- --------------------------------------------------------

--
-- Table structure for table `KRS`
--

CREATE TABLE `KRS` (
  `StudentID` varchar(12) NOT NULL,
  `kode_term` varchar(4) NOT NULL,
  `keterangan` text NOT NULL,
  `kode_krs` varchar(15) NOT NULL,
  `id_KRS` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `KRS`
--

INSERT INTO `KRS` (`StudentID`, `kode_term`, `keterangan`, `kode_krs`, `id_KRS`) VALUES
('03081200024', '1212', '-', '', 1);

-- --------------------------------------------------------

--
-- Table structure for table `krs_detail`
--

CREATE TABLE `krs_detail` (
  `kode_krsdetail` varchar(15) NOT NULL,
  `kode_krs` varchar(15) NOT NULL,
  `kode_matakuliah` varchar(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `krs_detail`
--

INSERT INTO `krs_detail` (`kode_krsdetail`, `kode_krs`, `kode_matakuliah`) VALUES
('10000000101', '100000001', 'MK0001'),
('10000000102', '100000001', 'MK0003'),
('10000000201', '100000002', 'MK0002'),
('10000000202', '100000002', 'MK0001'),
('10000000301', '100000003', 'MK0002'),
('10000000302', '100000003', 'MK0001'),
('10000000401', '100000004', 'MK0002'),
('10000000402', '100000004', 'MK0001');

-- --------------------------------------------------------

--
-- Table structure for table `Mahasiswa`
--

CREATE TABLE `Mahasiswa` (
  `Nama` varchar(50) NOT NULL,
  `Jurusan` varchar(30) NOT NULL,
  `Tahun_masuk` varchar(4) NOT NULL,
  `ID` int(11) NOT NULL,
  `StudentID` varchar(12) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `Mahasiswa`
--

INSERT INTO `Mahasiswa` (`Nama`, `Jurusan`, `Tahun_masuk`, `ID`, `StudentID`) VALUES
('Shendy Dennison', 'Sistem Informasi', '2020', 1, '03081200024');

-- --------------------------------------------------------

--
-- Table structure for table `Matakuliah`
--

CREATE TABLE `Matakuliah` (
  `kode_matakuliah` varchar(6) NOT NULL,
  `nama_matakuliah` varchar(50) NOT NULL,
  `sks` int(11) NOT NULL,
  `id_matkul` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `Matakuliah`
--

INSERT INTO `Matakuliah` (`kode_matakuliah`, `nama_matakuliah`, `sks`, `id_matkul`) VALUES
('MK0001', 'BUSINESS APPLICATION PROGRAMMING', 4, 1),
('MK0002', 'AUDIT DAN KONTROL SISTEM INFROMASI', 4, 2),
('MK003', 'PEMROGRAMAN BERORIENTASI OBJEK', 4, 3),
('MK0055', 'MANAJEMEN STRATEGIS PERUSAHAAN', 3, 4),
('MK0088', 'DIGITAL MARKETING', 3, 5),
('MK0078', 'ENTERPRISE INFORMATION SYSTEMS', 3, 6),
('MK0068', 'DASAR MANAJEMEN KEUANGAN', 3, 7);

-- --------------------------------------------------------

--
-- Table structure for table `term`
--

CREATE TABLE `term` (
  `kode_term` varchar(4) NOT NULL,
  `tahun_ajar` varchar(4) NOT NULL,
  `semester` varchar(10) NOT NULL,
  `keterangan` text NOT NULL,
  `id_term` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `term`
--

INSERT INTO `term` (`kode_term`, `tahun_ajar`, `semester`, `keterangan`, `id_term`) VALUES
('1212', '2020', 'GANJIL', '', 1),
('1213', '2020', 'GENAP', '', 2);

-- --------------------------------------------------------

--
-- Stand-in structure for view `vjlhmhskrs`
-- (See below for the actual view)
--
CREATE TABLE `vjlhmhskrs` (
`StudentID` varchar(12)
,`Nama` varchar(50)
,`JLHKRS` bigint(21)
);

-- --------------------------------------------------------

--
-- Structure for view `vjlhmhskrs`
--
DROP TABLE IF EXISTS `vjlhmhskrs`;

CREATE ALGORITHM=UNDEFINED DEFINER=`appMahasiswa`@`localhost` SQL SECURITY DEFINER VIEW `krs`.`vjlhmhskrs`  AS SELECT `MHS`.`StudentID` AS `StudentID`, `MHS`.`Nama` AS `Nama`, count(`krs`.`krs`.`StudentID`) AS `JLHKRS` FROM (`krs`.`mahasiswa` `MHS` join `krs`.`krs` on(`MHS`.`StudentID` = `krs`.`krs`.`StudentID`)) GROUP BY `MHS`.`StudentID`, `MHS`.`Nama` ;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `KRS`
--
ALTER TABLE `KRS`
  ADD PRIMARY KEY (`id_KRS`);

--
-- Indexes for table `krs_detail`
--
ALTER TABLE `krs_detail`
  ADD PRIMARY KEY (`kode_krsdetail`);

--
-- Indexes for table `Mahasiswa`
--
ALTER TABLE `Mahasiswa`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `Matakuliah`
--
ALTER TABLE `Matakuliah`
  ADD PRIMARY KEY (`id_matkul`);

--
-- Indexes for table `term`
--
ALTER TABLE `term`
  ADD PRIMARY KEY (`id_term`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `KRS`
--
ALTER TABLE `KRS`
  MODIFY `id_KRS` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `Mahasiswa`
--
ALTER TABLE `Mahasiswa`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `Matakuliah`
--
ALTER TABLE `Matakuliah`
  MODIFY `id_matkul` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `term`
--
ALTER TABLE `term`
  MODIFY `id_term` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
