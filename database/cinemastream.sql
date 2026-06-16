-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jun 16, 2026 at 03:14 PM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `database`
--

-- --------------------------------------------------------

--
-- Table structure for table `episode`
--

CREATE TABLE `episode` (
  `id` int(11) NOT NULL,
  `series_id` int(11) DEFAULT NULL,
  `nomor_episode` int(11) DEFAULT NULL,
  `judul` varchar(255) DEFAULT NULL,
  `durasi` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `episode`
--

INSERT INTO `episode` (`id`, `series_id`, `nomor_episode`, `judul`, `durasi`) VALUES
(1, 1, 1, 'Chapter One', 50),
(2, 1, 2, 'Chapter Two', 52),
(3, 2, 1, 'Pilot', 58),
(4, 2, 2, 'Cat\'s in the Bag', 48);

-- --------------------------------------------------------

--
-- Table structure for table `favorite`
--

CREATE TABLE `favorite` (
  `id` int(11) NOT NULL,
  `profile_id` int(11) NOT NULL,
  `film_id` int(11) DEFAULT NULL,
  `series_id` int(11) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `favorite`
--

INSERT INTO `favorite` (`id`, `profile_id`, `film_id`, `series_id`, `created_at`) VALUES
(1, 3, NULL, 4, '2026-06-15 16:45:59'),
(2, 3, 4, NULL, '2026-06-15 17:02:50');

-- --------------------------------------------------------

--
-- Table structure for table `film`
--

CREATE TABLE `film` (
  `id` int(11) NOT NULL,
  `judul` varchar(255) NOT NULL,
  `genre` varchar(100) DEFAULT NULL,
  `deskripsi` text DEFAULT NULL,
  `poster` varchar(255) DEFAULT NULL,
  `tahun_rilis` int(11) DEFAULT NULL,
  `durasi` int(11) DEFAULT NULL,
  `video_url` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `film`
--

INSERT INTO `film` (`id`, `judul`, `genre`, `deskripsi`, `poster`, `tahun_rilis`, `durasi`, `video_url`) VALUES
(1, 'Interstellar', 'Sci-Fi', 'Film luar angkasa', 'https://image.tmdb.org/t/p/w500/rAiYTfKGqDCRIIqo664sY9XZIvQ.jpg', 2014, 169, 'https://www.youtube.com/embed/zSWdZVtXT7E'),
(2, 'The Batman', 'Action', 'Film Batman', 'https://image.tmdb.org/t/p/w500/74xTEgt7R36Fpooo50r9T25onhq.jpg', 2022, 176, 'https://www.youtube.com/embed/mqqft2x_Aa4'),
(3, 'Coco', 'Animation', 'Miguel memasuki Land of the Dead untuk mengejar impiannya menjadi musisi.', 'https://image.tmdb.org/t/p/w500/8QVDXDiOGHRcAD4oM6MXjE0osSj.jpg', 2017, 105, NULL),
(4, 'Frozen', 'Animation', 'Elsa berusaha mengendalikan kekuatan esnya demi menyelamatkan kerajaannya.', 'https://image.tmdb.org/t/p/w500/kgwjIb2JDHRhNk13lmSxiClFjVk.jpg', 2013, 102, NULL),
(5, 'Frozen II', 'Animation', 'Elsa dan Anna mencari asal usul kekuatan sihir yang mengubah hidup mereka.', 'https://image.tmdb.org/t/p/w500/mINJaa34MtknCYl5AjtNJzWj8cD.jpg', 2019, 103, NULL),
(6, 'Moana', 'Animation', 'Seorang gadis pemberani berlayar melintasi samudra untuk menyelamatkan rakyatnya.', 'https://image.tmdb.org/t/p/w500/4JeeleZlP9d3GgWmO0xJj6r4s6R.jpg', 2016, 107, NULL),
(7, 'Encanto', 'Animation', 'Keluarga Madrigal memiliki kekuatan ajaib kecuali Mirabel yang berusaha menyelamatkan keluarganya.', 'https://image.tmdb.org/t/p/w500/4j0PNHkMr5ax3IA8tjtxcmPU3QT.jpg', 2021, 102, NULL),
(8, 'Zootopia', 'Animation', 'Seekor kelinci polisi dan rubah penipu bekerja sama mengungkap konspirasi besar.', 'https://image.tmdb.org/t/p/w500/d5NXSklXo0qyIYkgV94XAgMIckC.jpg', 2016, 108, NULL),
(9, 'Ratatouille', 'Animation', 'Seekor tikus berbakat bermimpi menjadi koki terkenal di Paris.', 'https://image.tmdb.org/t/p/w500/t3vaWRPSf6WjDSamIkKDs1iQWna.jpg', 2007, 111, NULL),
(10, 'Toy Story 4', 'Animation', 'Woody memulai petualangan baru untuk menemukan arti persahabatan.', 'https://image.tmdb.org/t/p/w500/w9kR8qbmQ01HwnvK4alvnQ2ca0L.jpg', 2019, 100, NULL),
(11, 'Finding Nemo', 'Animation', 'Seekor ikan badut melakukan perjalanan jauh mencari anaknya yang hilang.', 'https://image.tmdb.org/t/p/w500/eHuGQ10FUzK1mdOY69wF5pGgEf5.jpg', 2003, 100, NULL),
(12, 'The Lion King', 'Adventure', 'Simba harus menerima takdirnya sebagai raja Pride Lands.', 'https://image.tmdb.org/t/p/w500/2bXbqYdUdNVa8VIWXVfclP2ICtT.jpg', 2019, 118, NULL),
(13, 'Avengers Endgame', 'Action', 'Para Avengers berusaha membalikkan kehancuran yang disebabkan Thanos.', 'https://image.tmdb.org/t/p/w500/or06FN3Dka5tukK1e9sl16pB3iy.jpg', 2019, 181, NULL),
(14, 'Spider-Man No Way Home', 'Action', 'Peter Parker menghadapi ancaman dari berbagai multiverse.', 'https://image.tmdb.org/t/p/w500/1g0dhYtq4irTY1GPXvft6k4YLjm.jpg', 2021, 148, NULL),
(15, 'Doctor Strange in the Multiverse of Madness', 'Action', 'Doctor Strange menjelajahi multiverse yang penuh bahaya.', 'https://image.tmdb.org/t/p/w500/9Gtg2DzBhmYamXBS1hKAhiwbBKS.jpg', 2022, 126, NULL),
(16, 'Black Panther', 'Action', 'TChalla kembali ke Wakanda untuk memimpin dan melindungi kerajaannya.', 'https://image.tmdb.org/t/p/w500/uxzzxijgPIY7slzFvMotPv8wjKA.jpg', 2018, 134, NULL),
(17, 'Guardians of the Galaxy', 'Sci-Fi', 'Sekelompok penjahat luar angkasa menjadi pahlawan galaksi.', 'https://image.tmdb.org/t/p/w500/r7vmZjiyZw9rpJMQJdXpjgiCOk9.jpg', 2014, 121, NULL),
(18, 'Iron Man', 'Action', 'Tony Stark menciptakan baju zirah canggih dan menjadi Iron Man.', 'https://image.tmdb.org/t/p/w500/78lPtwv72eTNqFW9COBYI0dWDJa.jpg', 2008, 126, NULL),
(19, 'Captain America Civil War', 'Action', 'Konflik besar memecah belah para Avengers.', 'https://image.tmdb.org/t/p/w500/rAGiXaUfPzY7CDEyNKUofk3Kw2e.jpg', 2016, 147, NULL),
(20, 'Joker', 'Drama', 'Arthur Fleck berubah menjadi penjahat ikonik Gotham City.', 'https://image.tmdb.org/t/p/w500/udDclJoHjfjb8Ekgsd4FDteOkCU.jpg', 2019, 122, NULL),
(21, 'Inception', 'Sci-Fi', 'Seorang pencuri memasuki mimpi orang lain untuk mencuri rahasia.', 'https://image.tmdb.org/t/p/w500/edv5CZvWj09upOsy2Y6IwDhK8bt.jpg', 2010, 148, NULL),
(22, 'Avatar The Way of Water', 'Sci-Fi', 'Jake Sully dan keluarganya menghadapi ancaman baru di Pandora.', 'https://image.tmdb.org/t/p/w500/t6HIqrRAclMCA60NsSmeqe9RmNV.jpg', 2022, 192, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `profiles`
--

CREATE TABLE `profiles` (
  `profile_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `profile_name` varchar(100) NOT NULL,
  `profile_avatar` varchar(255) NOT NULL,
  `is_kids` tinyint(1) DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `profiles`
--

INSERT INTO `profiles` (`profile_id`, `user_id`, `profile_name`, `profile_avatar`, `is_kids`) VALUES
(2, 1, 'dino', 'avatar1.png', 0),
(3, 3, 'vioz', 'avatar1.png', 0),
(4, 4, 'ilhamIPK4', 'avatar1.png', 0);

-- --------------------------------------------------------

--
-- Table structure for table `rating`
--

CREATE TABLE `rating` (
  `id` int(11) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `profile_id` int(11) DEFAULT NULL,
  `film_id` int(11) DEFAULT NULL,
  `series_id` int(11) DEFAULT NULL,
  `nilai` int(11) DEFAULT NULL,
  `komentar` text DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `rating`
--

INSERT INTO `rating` (`id`, `user_id`, `profile_id`, `film_id`, `series_id`, `nilai`, `komentar`, `created_at`) VALUES
(6, 3, 3, NULL, 4, 5, 'bagus banget', '2026-06-14 09:04:17'),
(7, 3, 3, NULL, 4, 4, 'bagus', '2026-06-14 09:08:20'),
(8, 4, 4, NULL, 4, 5, 'yenefer keren banget', '2026-06-14 09:29:07'),
(9, NULL, 3, 4, NULL, 5, 'bagus', '2026-06-15 17:02:35'),
(10, NULL, 3, 4, NULL, 3, 'karakter nyeselin', '2026-06-15 17:02:46');

-- --------------------------------------------------------

--
-- Table structure for table `riwayat_tontonan`
--

CREATE TABLE `riwayat_tontonan` (
  `id` int(11) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `film_id` int(11) DEFAULT NULL,
  `tanggal_tonton` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `series`
--

CREATE TABLE `series` (
  `id` int(11) NOT NULL,
  `judul` varchar(255) NOT NULL,
  `genre` varchar(100) DEFAULT NULL,
  `deskripsi` text DEFAULT NULL,
  `poster` varchar(255) DEFAULT NULL,
  `tahun_rilis` int(11) DEFAULT NULL,
  `total_episode` int(11) DEFAULT 0,
  `video_url` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `series`
--

INSERT INTO `series` (`id`, `judul`, `genre`, `deskripsi`, `poster`, `tahun_rilis`, `total_episode`, `video_url`) VALUES
(1, 'Stranger Things', 'Sci-Fi', 'Series Netflix', 'strangerthings.jpg', 2016, 10, 'https://www.youtube.com/embed/b9EkMc79ZSU'),
(2, 'Breaking Bad', 'Crime', 'Seorang guru kimia menjadi produsen narkoba', 'https://image.tmdb.org/t/p/w500/ztkUQFLlC19CCMYHW9o1zWhJRNq.jpg', 2008, 62, 'https://www.youtube.com/embed/HhesaQXLuRY'),
(4, 'The Witcher', 'Fantasy', 'Geralt of Rivia adalah pemburu monster yang berusaha menemukan tempatnya di dunia yang penuh sihir, peperangan, dan makhluk berbahaya.', 'https://image.tmdb.org/t/p/w500/7vjaCdMw15FEbXyLQTVa04URsPm.jpg', 2019, 40, NULL),
(5, 'Loki', 'Fantasy', 'Loki terlibat dalam konflik multiverse bersama TVA.', 'https://image.tmdb.org/t/p/w500/voHUmluYmKyleFkTu3lOXQG702u.jpg', 2021, 12, NULL),
(6, 'WandaVision', 'Fantasy', 'Wanda menciptakan realitas misterius setelah kehilangan Vision.', 'https://image.tmdb.org/t/p/w500/glKDfE6btIRcVB5zrjspRIs4r52.jpg', 2021, 9, NULL),
(7, 'Agatha All Along', 'Fantasy', 'Agatha Harkness kembali menjelajahi dunia sihir.', 'https://image.tmdb.org/t/p/w500/9bykQFHfWAe0jQ8H4Z2xQw4Uk4X.jpg', 2024, 9, NULL),
(8, 'Moon Knight', 'Action', 'Avatar dewa Mesir dengan kepribadian ganda.', 'https://image.tmdb.org/t/p/w500/6OLTLlYnAhR8Uo0t4G4dJ5B8Wq9.jpg', 2022, 6, NULL),
(9, 'Hawkeye', 'Action', 'Clint Barton dan Kate Bishop menghadapi musuh lama.', 'https://image.tmdb.org/t/p/w500/pqzjCxPVc9TkVgGRWeAoMmyqkZV.jpg', 2021, 6, NULL),
(10, 'The Falcon and the Winter Soldier', 'Action', 'Sam Wilson menerima warisan Captain America.', 'https://image.tmdb.org/t/p/w500/6kbAMLteGO8yyewYau6bJ683sw7.jpg', 2021, 6, NULL),
(11, 'Secret Invasion', 'Action', 'Nick Fury menghadapi invasi Skrull di Bumi.', 'https://image.tmdb.org/t/p/w500/8WUVHemHFH2ZIP6NWkwlHWsyrEL.jpg', 2023, 6, NULL),
(12, 'Ms. Marvel', 'Action', 'Remaja dengan kekuatan kosmik menjadi superhero baru.', 'https://image.tmdb.org/t/p/w500/9f4iT6uLXfQ4Lw7J4lP4d5f0v4N.jpg', 2022, 6, NULL),
(13, 'Wednesday', 'Mystery', 'Wednesday Addams menyelidiki pembunuhan misterius.', 'https://image.tmdb.org/t/p/w500/9PFonBhy4cQy7Jz20NpMygczOkv.jpg', 2022, 8, NULL),
(14, 'Squid Game', 'Thriller', 'Permainan mematikan dengan hadiah miliaran won.', 'https://image.tmdb.org/t/p/w500/dDlEmu3EZ0Pgg93K2SVNLCjCSvE.jpg', 2021, 22, NULL),
(15, 'Money Heist', 'Crime', 'Kelompok perampok menjalankan pencurian terbesar.', 'https://image.tmdb.org/t/p/w500/reEMJA1uzscCbkpeRJeTT2bjqUp.jpg', 2017, 41, NULL),
(16, 'Dark', 'Sci-Fi', 'Misteri perjalanan waktu di kota kecil Jerman.', 'https://image.tmdb.org/t/p/w500/5LoHuHWA4H8jElFlZDvsmU2n63b.jpg', 2017, 26, NULL),
(17, 'Alice in Borderland', 'Thriller', 'Permainan hidup mati di Tokyo alternatif.', 'https://image.tmdb.org/t/p/w500/20mOwAAPwZ1vLQkw0fvuQHiG7bO.jpg', 2020, 17, NULL),
(18, 'All of Us Are Dead', 'Horror', 'Sekolah terjebak wabah zombie.', 'https://image.tmdb.org/t/p/w500/pTEFqAjLd5YTsMD6NSUxV6Dq7A6.jpg', 2022, 12, NULL),
(19, 'One Piece Live Action', 'Adventure', 'Petualangan Monkey D. Luffy mencari One Piece.', 'https://image.tmdb.org/t/p/w500/rGX4hZP7f8m2A4y6D3b9Q0L5N1k.jpg', 2023, 8, NULL),
(20, 'The Sandman', 'Fantasy', 'Penguasa mimpi berusaha memulihkan kerajaannya.', 'https://image.tmdb.org/t/p/w500/q54qEgagGOYCq5D1903eBVMNkbo.jpg', 2022, 21, NULL),
(21, 'Arcane', 'Animation', 'Konflik antara Piltover dan Zaun.', 'https://image.tmdb.org/t/p/w500/fqldf2t8ztc9aiwn3k6mlX3tvRT.jpg', 2021, 18, NULL),
(22, 'The Umbrella Academy', 'Sci-Fi', 'Keluarga superhero menghadapi kiamat.', 'https://image.tmdb.org/t/p/w500/scZlQQYnDVlnpxFTxaIv2g0BWnL.jpg', 2019, 36, NULL),
(23, 'Lucifer', 'Fantasy', 'Iblis membuka klub malam di Los Angeles.', 'https://image.tmdb.org/t/p/w500/ekZobS8isE6mA53RAiGDG93hBxL.jpg', 2016, 93, NULL),
(24, 'Peaky Blinders', 'Crime', 'Keluarga Shelby membangun kerajaan kriminal.', 'https://image.tmdb.org/t/p/w500/vUUqzWa2LnHIVqkaKVlVGkVcZIW.jpg', 2013, 36, NULL),
(25, 'Narcos', 'Crime', 'Kisah kartel narkoba Pablo Escobar.', 'https://image.tmdb.org/t/p/w500/rTmal9fDbwh5F0waol2hq35U4ah.jpg', 2015, 30, NULL),
(26, 'Ozark', 'Crime', 'Keluarga biasa terseret pencucian uang kartel.', 'https://image.tmdb.org/t/p/w500/m73l9VGmNizY5nk4GaitskfNnUS.jpg', 2017, 44, NULL),
(27, 'The Mandalorian', 'Sci-Fi', 'Pemburu hadiah melindungi Grogu.', 'https://image.tmdb.org/t/p/w500/sWgBv7LV2PRoQgkxwlibdGXKz1S.jpg', 2019, 24, NULL),
(28, 'Ahsoka', 'Sci-Fi', 'Ahsoka Tano menghadapi ancaman baru galaksi.', 'https://image.tmdb.org/t/p/w500/laCJxobHoPVa0LQhTM8xVZqsU1.jpg', 2023, 8, NULL),
(29, 'Obi-Wan Kenobi', 'Sci-Fi', 'Obi-Wan mengawasi Luke Skywalker muda.', 'https://image.tmdb.org/t/p/w500/qJRB789ceLryrLvOKrZqLKr2CGf.jpg', 2022, 6, NULL),
(30, 'Andor', 'Sci-Fi', 'Awal perjuangan Cassian Andor melawan Empire.', 'https://image.tmdb.org/t/p/w500/59SVNwLfoMnZPPB6ukW6dlPxAdI.jpg', 2022, 24, NULL),
(31, 'House of the Dragon', 'Fantasy', 'Perang saudara keluarga Targaryen.', 'https://image.tmdb.org/t/p/w500/z2yahl2uefxDCl0nogcRBstwruJ.jpg', 2022, 18, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `username` varchar(100) NOT NULL,
  `email` varchar(100) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `genre` varchar(255) DEFAULT 'Action • Horror • Sci-Fi',
  `avatar` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `username`, `email`, `password`, `genre`, `avatar`) VALUES
(1, 'admin', 'admin@cinestream.com', '12345678', 'Action', 'uploads/admin_profile.JPG'),
(2, 'star', 'star@gmail.com', '123456', 'Action • Horror • Sci-Fi', NULL),
(3, 'viozkyyy', 'viozkyyy@cinestream', 'coba1234', 'Action • Horror • Sci-Fi', NULL),
(4, 'menda', 'menda@cinestream', 'ilhambuyan', 'Action • Horror • Sci-Fi', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `watchlist`
--

CREATE TABLE `watchlist` (
  `id` int(11) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `film_id` int(11) DEFAULT NULL,
  `series_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `watchlist`
--

INSERT INTO `watchlist` (`id`, `user_id`, `film_id`, `series_id`) VALUES
(1, 1, 1, NULL),
(2, 1, 2, NULL);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `episode`
--
ALTER TABLE `episode`
  ADD PRIMARY KEY (`id`),
  ADD KEY `series_id` (`series_id`);

--
-- Indexes for table `favorite`
--
ALTER TABLE `favorite`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `film`
--
ALTER TABLE `film`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `profiles`
--
ALTER TABLE `profiles`
  ADD PRIMARY KEY (`profile_id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `rating`
--
ALTER TABLE `rating`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`),
  ADD KEY `film_id` (`film_id`),
  ADD KEY `fk_rating_series` (`series_id`);

--
-- Indexes for table `riwayat_tontonan`
--
ALTER TABLE `riwayat_tontonan`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`),
  ADD KEY `film_id` (`film_id`);

--
-- Indexes for table `series`
--
ALTER TABLE `series`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `watchlist`
--
ALTER TABLE `watchlist`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`),
  ADD KEY `film_id` (`film_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `episode`
--
ALTER TABLE `episode`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `favorite`
--
ALTER TABLE `favorite`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `film`
--
ALTER TABLE `film`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;

--
-- AUTO_INCREMENT for table `profiles`
--
ALTER TABLE `profiles`
  MODIFY `profile_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `rating`
--
ALTER TABLE `rating`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `riwayat_tontonan`
--
ALTER TABLE `riwayat_tontonan`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `series`
--
ALTER TABLE `series`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=32;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `watchlist`
--
ALTER TABLE `watchlist`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `episode`
--
ALTER TABLE `episode`
  ADD CONSTRAINT `episode_ibfk_1` FOREIGN KEY (`series_id`) REFERENCES `series` (`id`);

--
-- Constraints for table `profiles`
--
ALTER TABLE `profiles`
  ADD CONSTRAINT `profiles_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `rating`
--
ALTER TABLE `rating`
  ADD CONSTRAINT `fk_rating_film` FOREIGN KEY (`film_id`) REFERENCES `film` (`id`),
  ADD CONSTRAINT `fk_rating_series` FOREIGN KEY (`series_id`) REFERENCES `series` (`id`),
  ADD CONSTRAINT `fk_rating_user` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`),
  ADD CONSTRAINT `rating_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`),
  ADD CONSTRAINT `rating_ibfk_2` FOREIGN KEY (`film_id`) REFERENCES `film` (`id`);

--
-- Constraints for table `riwayat_tontonan`
--
ALTER TABLE `riwayat_tontonan`
  ADD CONSTRAINT `riwayat_tontonan_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`),
  ADD CONSTRAINT `riwayat_tontonan_ibfk_2` FOREIGN KEY (`film_id`) REFERENCES `film` (`id`);

--
-- Constraints for table `watchlist`
--
ALTER TABLE `watchlist`
  ADD CONSTRAINT `watchlist_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`),
  ADD CONSTRAINT `watchlist_ibfk_2` FOREIGN KEY (`film_id`) REFERENCES `film` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
