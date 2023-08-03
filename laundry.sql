-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Waktu pembuatan: 03 Agu 2023 pada 00.50
-- Versi server: 5.7.34
-- Versi PHP: 8.0.6

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `laundry`
--

-- --------------------------------------------------------

--
-- Struktur dari tabel `detail`
--

CREATE TABLE `detail` (
  `iddetail` int(11) NOT NULL,
  `idjenispakaian` int(11) NOT NULL,
  `kd_transaksi` int(11) NOT NULL,
  `berat` double DEFAULT NULL,
  `jumlah` double DEFAULT NULL,
  `bayar` double DEFAULT NULL,
  `biayaambil` double DEFAULT NULL,
  `biayaantar` double DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data untuk tabel `detail`
--

INSERT INTO `detail` (`iddetail`, `idjenispakaian`, `kd_transaksi`, `berat`, `jumlah`, `bayar`, `biayaambil`, `biayaantar`) VALUES
(27, 1, 31, 6, 4, 100000, 5000, 5000),
(28, 2, 31, 5, 5, 135000, 5000, 5000),
(29, 3, 32, 5, 5, 260000, 5000, 5000),
(30, 2, 32, 5, 6, 160000, 5000, 5000),
(31, 2, 33, 0, 10, 250000, 0, 0),
(32, 2, 34, 10, 2, 70000, 20000, 0);

-- --------------------------------------------------------

--
-- Struktur dari tabel `detailpemesanan`
--

CREATE TABLE `detailpemesanan` (
  `iddetailpemesanan` int(11) NOT NULL,
  `pemesanan_id` int(11) NOT NULL,
  `idjenispakaian` int(11) NOT NULL,
  `jumlah` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data untuk tabel `detailpemesanan`
--

INSERT INTO `detailpemesanan` (`iddetailpemesanan`, `pemesanan_id`, `idjenispakaian`, `jumlah`) VALUES
(5, 25, 1, 4),
(6, 25, 2, 5),
(7, 26, 3, 5),
(8, 26, 2, 6),
(9, 27, 2, 10),
(10, 28, 2, 10);

-- --------------------------------------------------------

--
-- Struktur dari tabel `jenispakaian`
--

CREATE TABLE `jenispakaian` (
  `idjenispakaian` int(11) NOT NULL,
  `jenis` varchar(45) DEFAULT NULL,
  `harga` double DEFAULT NULL,
  `statusbiaya` enum('perkilo','perpotong') DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data untuk tabel `jenispakaian`
--

INSERT INTO `jenispakaian` (`idjenispakaian`, `jenis`, `harga`, `statusbiaya`) VALUES
(1, 'Pakaian Biasa', 15000, 'perkilo'),
(2, 'Selimut', 25000, 'perpotong'),
(3, 'Bad Cover', 50000, 'perpotong');

-- --------------------------------------------------------

--
-- Struktur dari tabel `pegawai`
--

CREATE TABLE `pegawai` (
  `kd_pegawai` int(11) NOT NULL,
  `nama_pegawai` varchar(45) DEFAULT NULL,
  `bagian` varchar(45) DEFAULT NULL,
  `iduser` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data untuk tabel `pegawai`
--

INSERT INTO `pegawai` (`kd_pegawai`, `nama_pegawai`, `bagian`, `iduser`) VALUES
(5, 'admin', 'administrasi', 2),
(17, 'karyawan', 'Karyawan ', 10),
(21, 'Rasya', 'Karyawan', 16);

-- --------------------------------------------------------

--
-- Struktur dari tabel `pelanggan`
--

CREATE TABLE `pelanggan` (
  `kd_pelanggan` int(11) NOT NULL,
  `nama` varchar(45) DEFAULT NULL,
  `alamat` text,
  `no_hp` varchar(45) DEFAULT NULL,
  `jk` varchar(45) DEFAULT NULL,
  `iduser` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data untuk tabel `pelanggan`
--

INSERT INTO `pelanggan` (`kd_pelanggan`, `nama`, `alamat`, `no_hp`, `jk`, `iduser`) VALUES
(8, 'Deni Malik', 'Entrop', '08112121', 'Pria', 1),
(9, 'Bagus', 'Entrop', '08111111', 'Pria', 6),
(10, 'Davis Wtimena', 'Hamadi', '0813116546', 'Pria', 7),
(11, 'Bagas', 'Ciputan', '08821463241', 'Pria', 8),
(12, 'Cia', 'Semarang ', '0874567381868', 'Wanita', 9),
(13, 'Satria', '-', '55688858654', 'Pria', 11),
(14, 'B', 'Vgg', '655', 'Pria', 12),
(15, '2', 'S', '4', 'Pria', 13),
(16, '2', 'S', '4', 'Pria', 14),
(17, 'Rasya', '.', '08882646781679', 'Pria', 16);

-- --------------------------------------------------------

--
-- Struktur dari tabel `pemesanan`
--

CREATE TABLE `pemesanan` (
  `id` int(11) NOT NULL,
  `kd_pemesanan` varchar(20) NOT NULL,
  `tgl_pemesanan` date DEFAULT NULL,
  `kd_pelanggan` int(11) NOT NULL,
  `status` enum('Boking','Proses','Selesai','Batal') DEFAULT 'Boking'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data untuk tabel `pemesanan`
--

INSERT INTO `pemesanan` (`id`, `kd_pemesanan`, `tgl_pemesanan`, `kd_pelanggan`, `status`) VALUES
(25, 'LNY-00001', '2020-07-31', 10, 'Selesai'),
(26, 'LNY-00002', '2020-07-31', 10, 'Selesai'),
(27, 'LNY-00003', '2023-07-30', 12, 'Selesai'),
(28, 'LNY-00004', '2023-07-31', 11, 'Selesai'),
(29, 'LNY-00005', '2023-08-02', 12, 'Boking');

-- --------------------------------------------------------

--
-- Struktur dari tabel `profile`
--

CREATE TABLE `profile` (
  `kd_profile` int(11) NOT NULL,
  `nama_laundry` varchar(45) DEFAULT NULL,
  `alamat_laundry` varchar(45) DEFAULT NULL,
  `no_tlp` varchar(45) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data untuk tabel `profile`
--

INSERT INTO `profile` (`kd_profile`, `nama_laundry`, `alamat_laundry`, `no_tlp`) VALUES
(1, 'Testing Laundryy', 'Jl. Ardipura II No. 24 Polimak, Jayapura, Pap', '082238281801');

-- --------------------------------------------------------

--
-- Struktur dari tabel `transaksi`
--

CREATE TABLE `transaksi` (
  `id_pemesanan` int(11) NOT NULL,
  `kd_transaksi` int(11) NOT NULL,
  `kd_pegawai` int(11) NOT NULL,
  `tgl_ambil` date DEFAULT NULL,
  `total` double DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data untuk tabel `transaksi`
--

INSERT INTO `transaksi` (`id_pemesanan`, `kd_transaksi`, `kd_pegawai`, `tgl_ambil`, `total`) VALUES
(25, 31, 5, '2020-07-30', 235000),
(26, 32, 5, '2020-07-30', 420000),
(27, 33, 5, '2023-08-01', 250000),
(28, 34, 5, '2023-07-31', 70000);

-- --------------------------------------------------------

--
-- Struktur dari tabel `user`
--

CREATE TABLE `user` (
  `iduser` int(11) NOT NULL,
  `username` varchar(45) DEFAULT NULL,
  `password` varchar(100) DEFAULT NULL,
  `jenis` enum('Admin','Karyawan','Member') NOT NULL DEFAULT 'Member'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data untuk tabel `user`
--

INSERT INTO `user` (`iduser`, `username`, `password`, `jenis`) VALUES
(1, 'deni', '21232f297a57a5a743894a0e4a801fc3', 'Member'),
(2, 'admin', '21232f297a57a5a743894a0e4a801fc3', 'Admin'),
(6, 'bagus', '17b38fc02fd7e92f3edeb6318e3066d8', 'Member'),
(7, 'david', '172522ec1028ab781d9dfd17eaca4427', 'Member'),
(8, 'Bagas', 'ee776a18253721efe8a62e4abd29dc47', 'Member'),
(9, 'Cia', 'e10adc3949ba59abbe56e057f20f883e', 'Member'),
(10, 'karyawan', '9e014682c94e0f2cc834bf7348bda428', 'Karyawan'),
(11, 'Sat', 'e10adc3949ba59abbe56e057f20f883e', 'Member'),
(12, 'Bos', 'cfa39b9960ba46d16d5f11a2f7919cda', 'Member'),
(13, 'E', 'f1290186a5d0b1ceab27f4e77c0c5d68', 'Member'),
(14, 'E', 'd41d8cd98f00b204e9800998ecf8427e', 'Member'),
(15, 'Bagus2', 'ff0eb2864feb22354747f8c85d42ccb5', 'Karyawan'),
(16, 'Rasya', '202cb962ac59075b964b07152d234b70', 'Karyawan');

--
-- Indexes for dumped tables
--

--
-- Indeks untuk tabel `detail`
--
ALTER TABLE `detail`
  ADD PRIMARY KEY (`iddetail`),
  ADD KEY `fk_detail_jenispakaian1_idx` (`idjenispakaian`),
  ADD KEY `fk_detail_transaksi1_idx` (`kd_transaksi`);

--
-- Indeks untuk tabel `detailpemesanan`
--
ALTER TABLE `detailpemesanan`
  ADD PRIMARY KEY (`iddetailpemesanan`),
  ADD KEY `fk_detailpemesanan_pemesanan1_idx` (`pemesanan_id`),
  ADD KEY `fk_detailpemesanan_jenispakaian1_idx` (`idjenispakaian`);

--
-- Indeks untuk tabel `jenispakaian`
--
ALTER TABLE `jenispakaian`
  ADD PRIMARY KEY (`idjenispakaian`);

--
-- Indeks untuk tabel `pegawai`
--
ALTER TABLE `pegawai`
  ADD PRIMARY KEY (`kd_pegawai`),
  ADD KEY `fk_pegawai_user1_idx` (`iduser`);

--
-- Indeks untuk tabel `pelanggan`
--
ALTER TABLE `pelanggan`
  ADD PRIMARY KEY (`kd_pelanggan`),
  ADD KEY `fk_pelanggan_user1_idx` (`iduser`);

--
-- Indeks untuk tabel `pemesanan`
--
ALTER TABLE `pemesanan`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_pemesanan_pelanggan_idx` (`kd_pelanggan`);

--
-- Indeks untuk tabel `profile`
--
ALTER TABLE `profile`
  ADD PRIMARY KEY (`kd_profile`);

--
-- Indeks untuk tabel `transaksi`
--
ALTER TABLE `transaksi`
  ADD PRIMARY KEY (`kd_transaksi`),
  ADD KEY `fk_transaksi_pegawai1_idx` (`kd_pegawai`),
  ADD KEY `fk_transaksi_pemesanan1_idx` (`id_pemesanan`);

--
-- Indeks untuk tabel `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`iduser`);

--
-- AUTO_INCREMENT untuk tabel yang dibuang
--

--
-- AUTO_INCREMENT untuk tabel `detail`
--
ALTER TABLE `detail`
  MODIFY `iddetail` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=33;

--
-- AUTO_INCREMENT untuk tabel `detailpemesanan`
--
ALTER TABLE `detailpemesanan`
  MODIFY `iddetailpemesanan` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT untuk tabel `jenispakaian`
--
ALTER TABLE `jenispakaian`
  MODIFY `idjenispakaian` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT untuk tabel `pegawai`
--
ALTER TABLE `pegawai`
  MODIFY `kd_pegawai` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;

--
-- AUTO_INCREMENT untuk tabel `pelanggan`
--
ALTER TABLE `pelanggan`
  MODIFY `kd_pelanggan` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT untuk tabel `pemesanan`
--
ALTER TABLE `pemesanan`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=30;

--
-- AUTO_INCREMENT untuk tabel `profile`
--
ALTER TABLE `profile`
  MODIFY `kd_profile` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT untuk tabel `transaksi`
--
ALTER TABLE `transaksi`
  MODIFY `kd_transaksi` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=35;

--
-- AUTO_INCREMENT untuk tabel `user`
--
ALTER TABLE `user`
  MODIFY `iduser` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- Ketidakleluasaan untuk tabel pelimpahan (Dumped Tables)
--

--
-- Ketidakleluasaan untuk tabel `detail`
--
ALTER TABLE `detail`
  ADD CONSTRAINT `fk_detail_jenispakaian1` FOREIGN KEY (`idjenispakaian`) REFERENCES `jenispakaian` (`idjenispakaian`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_detail_transaksi1` FOREIGN KEY (`kd_transaksi`) REFERENCES `transaksi` (`kd_transaksi`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Ketidakleluasaan untuk tabel `detailpemesanan`
--
ALTER TABLE `detailpemesanan`
  ADD CONSTRAINT `fk_detailpemesanan_jenispakaian1` FOREIGN KEY (`idjenispakaian`) REFERENCES `jenispakaian` (`idjenispakaian`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_detailpemesanan_pemesanan1` FOREIGN KEY (`pemesanan_id`) REFERENCES `pemesanan` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Ketidakleluasaan untuk tabel `pegawai`
--
ALTER TABLE `pegawai`
  ADD CONSTRAINT `fk_pegawai_user1` FOREIGN KEY (`iduser`) REFERENCES `user` (`iduser`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Ketidakleluasaan untuk tabel `pelanggan`
--
ALTER TABLE `pelanggan`
  ADD CONSTRAINT `fk_pelanggan_user1` FOREIGN KEY (`iduser`) REFERENCES `user` (`iduser`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Ketidakleluasaan untuk tabel `pemesanan`
--
ALTER TABLE `pemesanan`
  ADD CONSTRAINT `fk_pemesanan_pelanggan` FOREIGN KEY (`kd_pelanggan`) REFERENCES `pelanggan` (`kd_pelanggan`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Ketidakleluasaan untuk tabel `transaksi`
--
ALTER TABLE `transaksi`
  ADD CONSTRAINT `fk_transaksi_pegawai1` FOREIGN KEY (`kd_pegawai`) REFERENCES `pegawai` (`kd_pegawai`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_transaksi_pemesanan1` FOREIGN KEY (`id_pemesanan`) REFERENCES `pemesanan` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
