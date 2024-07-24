-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Jul 24, 2024 at 12:09 AM
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
-- Database: `beligo_db`
--

-- --------------------------------------------------------

--
-- Stand-in structure for view `detailbarang`
-- (See below for the actual view)
--
CREATE TABLE `detailbarang` (
`foto_merek` varchar(50)
,`gambar` varchar(255)
,`harga_barang` int
,`kd_barang` varchar(7)
,`kd_distributor` varchar(7)
,`kd_merek` varchar(7)
,`keterangan` varchar(200)
,`merek` varchar(30)
,`nama_barang` varchar(40)
,`nama_distributor` varchar(40)
,`no_telp` varchar(13)
,`stok_barang` int
,`tanggal_masuk` date
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `detailtransaksi`
-- (See below for the actual view)
--
CREATE TABLE `detailtransaksi` (
`harga_barang` int
,`jumlah` int
,`jumlah_beli` int
,`kd_barang` varchar(11)
,`kd_pretransaksi` varchar(7)
,`kd_transaksi` varchar(7)
,`nama_barang` varchar(40)
,`sub_total` int
,`tanggal_beli` date
,`total_harga` int
);

-- --------------------------------------------------------

--
-- Table structure for table `table_barang`
--

CREATE TABLE `table_barang` (
  `kd_barang` varchar(7) NOT NULL,
  `nama_barang` varchar(40) NOT NULL,
  `kd_merek` varchar(7) NOT NULL,
  `kd_distributor` varchar(7) NOT NULL,
  `tanggal_masuk` date NOT NULL,
  `harga_barang` int NOT NULL,
  `stok_barang` int NOT NULL,
  `gambar` varchar(255) NOT NULL,
  `keterangan` varchar(200) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `table_barang`
--

INSERT INTO `table_barang` (`kd_barang`, `nama_barang`, `kd_merek`, `kd_distributor`, `tanggal_masuk`, `harga_barang`, `stok_barang`, `gambar`, `keterangan`) VALUES
('BR001', 'Nutrisari', 'ME001', 'DS002', '2018-09-24', 1500, 34, '1537785469748.jpg', 'Tersedia'),
('BR002', 'Saus ABC', 'ME002', 'DS002', '2018-09-24', 500, 71, '1537761405396.jpg', 'Tersedia'),
('BR003', 'Indomie Goreng', 'ME003', 'DS002', '2018-09-24', 2500, 59, '1537764343384.jpeg', 'Tersedia'),
('BR004', 'Kecap', 'ME002', 'DS001', '2022-07-30', 500, 36, '1537788240156.png', 'Tersedia');

-- --------------------------------------------------------

--
-- Table structure for table `table_distributor`
--

CREATE TABLE `table_distributor` (
  `kd_distributor` varchar(7) NOT NULL,
  `nama_distributor` varchar(40) NOT NULL,
  `alamat` varchar(255) NOT NULL,
  `no_telp` varchar(13) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `table_distributor`
--

INSERT INTO `table_distributor` (`kd_distributor`, `nama_distributor`, `alamat`, `no_telp`) VALUES
('DS001', 'Cahyono', 'Tajur Bogor', '081288819999'),
('DS002', 'Susanti', 'Bogor', '083812991999');

-- --------------------------------------------------------

--
-- Table structure for table `table_merek`
--

CREATE TABLE `table_merek` (
  `kd_merek` varchar(7) NOT NULL,
  `merek` varchar(30) NOT NULL,
  `foto_merek` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `table_merek`
--

INSERT INTO `table_merek` (`kd_merek`, `merek`, `foto_merek`) VALUES
('ME001', 'Nutrifood', '1537759572977.jpg'),
('ME002', 'ABC', '1537760002906.png'),
('ME003', 'Indofood', '1537761246445.jpg'),
('ME004', 'WEWE', '1539528847974.png'),
('ME005', 'Barrons', '1548945399328.png');

-- --------------------------------------------------------

--
-- Table structure for table `table_pretransaksi`
--

CREATE TABLE `table_pretransaksi` (
  `kd_pretransaksi` varchar(7) NOT NULL,
  `kd_transaksi` varchar(7) NOT NULL,
  `kd_barang` varchar(11) NOT NULL,
  `jumlah` int NOT NULL,
  `sub_total` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `table_pretransaksi`
--

INSERT INTO `table_pretransaksi` (`kd_pretransaksi`, `kd_transaksi`, `kd_barang`, `jumlah`, `sub_total`) VALUES
('AN001', 'TR001', 'BR001', 2, 3000),
('AN002', 'TR001', 'BR002', 6, 1500),
('AN003', 'TR002', 'BR003', 2, 5000),
('AN004', 'TR002', 'BR002', 2, 1000),
('AN005', 'TR003', 'BR002', 2, 1000),
('AN006', 'TR003', 'BR003', 2, 5000),
('AN007', 'TR004', 'BR001', 9, 10500),
('AN008', 'TR005', 'BR002', 5, 2500),
('AN009', 'TR006', 'BR001', 2, 3000),
('AN010', 'TR006', 'BR003', 2, 5000),
('AN011', 'TR007', 'BR002', 5, 2500),
('AN012', 'TR008', 'BR002', 5, 2500),
('AN013', 'TR009', 'BR003', 1, 2500),
('AN014', 'TR010', 'BR003', 2, 5000),
('AN015', 'TR011', 'BR004', 2, 1000),
('AN016', 'TR011', 'BR001', 2, 3000),
('AN018', 'TR012', 'BR001', 1, 1500),
('AN019', 'TR013', 'BR002', 4, 1000),
('AN020', 'TR013', 'BR003', 2, 2500),
('AN021', 'TR014', 'BR004', 12, 6000);

--
-- Triggers `table_pretransaksi`
--
DELIMITER $$
CREATE TRIGGER `batal_beli` AFTER DELETE ON `table_pretransaksi` FOR EACH ROW UPDATE table_barang SET
stok_barang = stok_barang + OLD.jumlah
WHERE kd_barang = OLD.kd_barang
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `transaksi` AFTER INSERT ON `table_pretransaksi` FOR EACH ROW UPDATE table_barang SET
stok_barang = stok_barang - new.jumlah
WHERE kd_barang = new.kd_barang
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `update_beli` AFTER UPDATE ON `table_pretransaksi` FOR EACH ROW UPDATE table_barang SET
stok_barang = stok_barang + OLD.jumlah - NEW.jumlah
WHERE kd_barang = new.kd_barang
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `table_transaksi`
--

CREATE TABLE `table_transaksi` (
  `kd_transaksi` varchar(7) NOT NULL,
  `kd_user` varchar(7) NOT NULL,
  `jumlah_beli` int NOT NULL,
  `total_harga` int NOT NULL,
  `tanggal_beli` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `table_transaksi`
--

INSERT INTO `table_transaksi` (`kd_transaksi`, `kd_user`, `jumlah_beli`, `total_harga`, `tanggal_beli`) VALUES
('TR001', 'US003', 8, 4500, '2018-09-25'),
('TR002', 'US003', 4, 6000, '2018-09-25'),
('TR003', 'US003', 4, 6000, '2018-09-30'),
('TR004', 'US003', 9, 10500, '2019-03-16'),
('TR005', 'US003', 5, 2500, '2019-03-16'),
('TR006', 'US004', 4, 8000, '2022-07-30'),
('TR007', 'US004', 5, 2500, '2022-07-30'),
('TR008', 'US004', 5, 2500, '2022-07-30'),
('TR009', 'US004', 1, 2500, '2022-07-30'),
('TR010', 'US004', 2, 5000, '2022-07-30'),
('TR011', 'US004', 4, 4000, '2024-06-04'),
('TR012', 'US004', 1, 1500, '2024-06-13'),
('TR013', 'US004', 6, 3500, '2024-06-30'),
('TR014', 'US004', 12, 6000, '2024-07-01');

-- --------------------------------------------------------

--
-- Table structure for table `table_user`
--

CREATE TABLE `table_user` (
  `kd_user` varchar(7) NOT NULL,
  `nama_user` varchar(20) NOT NULL,
  `username` varchar(25) NOT NULL,
  `password` varchar(25) NOT NULL,
  `foto_user` varchar(50) NOT NULL,
  `level` enum('Admin','Kasir','Manager','p') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `table_user`
--

INSERT INTO `table_user` (`kd_user`, `nama_user`, `username`, `password`, `foto_user`, `level`) VALUES
('US001', 'M. Bayu Pradana', 'manager', 'YWRtaW4xMjM=', '1538303665653.png', 'Manager'),
('US002', 'Fajar Subeki', 'admin123', 'YWRtaW4xMjM=', '153777087384.png', 'Admin'),
('US003', 'Dinda Nur Insani', 'kasir123', 'YWRtaW4xMjM=', '1537840377928.png', 'Kasir'),
('US004', 'presiden', 'presiden', 'YWRtaW4xMjM=', '1659153660853.png', 'p');

-- --------------------------------------------------------

--
-- Stand-in structure for view `transaksi`
-- (See below for the actual view)
--
CREATE TABLE `transaksi` (
`jumlah` int
,`kd_barang` varchar(11)
,`kd_pretransaksi` varchar(7)
,`kd_transaksi` varchar(7)
,`nama_barang` varchar(40)
,`sub_total` int
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `transaksi_terbaru`
-- (See below for the actual view)
--
CREATE TABLE `transaksi_terbaru` (
`jumlah_beli` int
,`kd_transaksi` varchar(7)
,`kd_user` varchar(7)
,`nama_user` varchar(20)
,`tanggal_beli` date
,`total_harga` int
);

-- --------------------------------------------------------

--
-- Structure for view `detailbarang`
--
DROP TABLE IF EXISTS `detailbarang`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `detailbarang`  AS SELECT `table_barang`.`kd_barang` AS `kd_barang`, `table_barang`.`nama_barang` AS `nama_barang`, `table_barang`.`kd_merek` AS `kd_merek`, `table_barang`.`kd_distributor` AS `kd_distributor`, `table_barang`.`tanggal_masuk` AS `tanggal_masuk`, `table_barang`.`harga_barang` AS `harga_barang`, `table_barang`.`stok_barang` AS `stok_barang`, `table_barang`.`gambar` AS `gambar`, `table_barang`.`keterangan` AS `keterangan`, `table_merek`.`merek` AS `merek`, `table_merek`.`foto_merek` AS `foto_merek`, `table_distributor`.`nama_distributor` AS `nama_distributor`, `table_distributor`.`no_telp` AS `no_telp` FROM ((`table_barang` join `table_merek` on((`table_barang`.`kd_merek` = `table_merek`.`kd_merek`))) join `table_distributor` on((`table_barang`.`kd_distributor` = `table_distributor`.`kd_distributor`)))  ;

-- --------------------------------------------------------

--
-- Structure for view `detailtransaksi`
--
DROP TABLE IF EXISTS `detailtransaksi`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `detailtransaksi`  AS SELECT `table_pretransaksi`.`kd_pretransaksi` AS `kd_pretransaksi`, `table_pretransaksi`.`kd_transaksi` AS `kd_transaksi`, `table_pretransaksi`.`kd_barang` AS `kd_barang`, `table_pretransaksi`.`jumlah` AS `jumlah`, `table_pretransaksi`.`sub_total` AS `sub_total`, `table_barang`.`nama_barang` AS `nama_barang`, `table_barang`.`harga_barang` AS `harga_barang`, `table_transaksi`.`jumlah_beli` AS `jumlah_beli`, `table_transaksi`.`total_harga` AS `total_harga`, `table_transaksi`.`tanggal_beli` AS `tanggal_beli` FROM ((`table_pretransaksi` join `table_barang` on((`table_pretransaksi`.`kd_barang` = `table_barang`.`kd_barang`))) join `table_transaksi` on((`table_transaksi`.`kd_transaksi` = `table_pretransaksi`.`kd_transaksi`)))  ;

-- --------------------------------------------------------

--
-- Structure for view `transaksi`
--
DROP TABLE IF EXISTS `transaksi`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `transaksi`  AS SELECT `table_pretransaksi`.`kd_pretransaksi` AS `kd_pretransaksi`, `table_pretransaksi`.`kd_transaksi` AS `kd_transaksi`, `table_pretransaksi`.`kd_barang` AS `kd_barang`, `table_pretransaksi`.`jumlah` AS `jumlah`, `table_pretransaksi`.`sub_total` AS `sub_total`, `table_barang`.`nama_barang` AS `nama_barang` FROM (`table_pretransaksi` join `table_barang` on((`table_pretransaksi`.`kd_barang` = `table_barang`.`kd_barang`)))  ;

-- --------------------------------------------------------

--
-- Structure for view `transaksi_terbaru`
--
DROP TABLE IF EXISTS `transaksi_terbaru`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `transaksi_terbaru`  AS SELECT `table_transaksi`.`kd_transaksi` AS `kd_transaksi`, `table_transaksi`.`kd_user` AS `kd_user`, `table_transaksi`.`jumlah_beli` AS `jumlah_beli`, `table_transaksi`.`total_harga` AS `total_harga`, `table_transaksi`.`tanggal_beli` AS `tanggal_beli`, `table_user`.`nama_user` AS `nama_user` FROM (`table_transaksi` join `table_user` on((`table_transaksi`.`kd_user` = `table_user`.`kd_user`)))  ;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `table_barang`
--
ALTER TABLE `table_barang`
  ADD PRIMARY KEY (`kd_barang`),
  ADD KEY `kd_distributor` (`kd_distributor`),
  ADD KEY `kd_merek` (`kd_merek`);

--
-- Indexes for table `table_distributor`
--
ALTER TABLE `table_distributor`
  ADD PRIMARY KEY (`kd_distributor`);

--
-- Indexes for table `table_merek`
--
ALTER TABLE `table_merek`
  ADD PRIMARY KEY (`kd_merek`);

--
-- Indexes for table `table_pretransaksi`
--
ALTER TABLE `table_pretransaksi`
  ADD PRIMARY KEY (`kd_pretransaksi`);

--
-- Indexes for table `table_transaksi`
--
ALTER TABLE `table_transaksi`
  ADD PRIMARY KEY (`kd_transaksi`),
  ADD KEY `kd_user` (`kd_user`);

--
-- Indexes for table `table_user`
--
ALTER TABLE `table_user`
  ADD PRIMARY KEY (`kd_user`);

--
-- Constraints for dumped tables
--

--
-- Constraints for table `table_transaksi`
--
ALTER TABLE `table_transaksi`
  ADD CONSTRAINT `table_transaksi_ibfk_1` FOREIGN KEY (`kd_user`) REFERENCES `table_user` (`kd_user`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
