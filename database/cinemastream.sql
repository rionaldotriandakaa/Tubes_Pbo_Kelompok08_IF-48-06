-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";

CREATE TABLE users (
    id INT AUTO_INCREMENT PRIMARY KEY,
    username VARCHAR(100) NOT NULL,
    email VARCHAR(100),
    password VARCHAR(255)
);

CREATE TABLE series (
    id INT AUTO_INCREMENT PRIMARY KEY,
    judul VARCHAR(255) NOT NULL,
    genre VARCHAR(100),
    deskripsi TEXT,
    poster VARCHAR(255),
    tahun_rilis INT
);

CREATE TABLE film (
    id INT AUTO_INCREMENT PRIMARY KEY,
    judul VARCHAR(255) NOT NULL,
    genre VARCHAR(100),
    deskripsi TEXT,
    poster VARCHAR(255),
    tahun_rilis INT,
    durasi INT
);

CREATE TABLE episode (
    id INT AUTO_INCREMENT PRIMARY KEY,
    series_id INT,
    nomor_episode INT,
    judul VARCHAR(255),
    durasi INT,
    FOREIGN KEY (series_id) REFERENCES series(id)
);

CREATE TABLE rating (
    id INT AUTO_INCREMENT PRIMARY KEY,
    user_id INT,
    film_id INT,
    nilai INT,
    FOREIGN KEY (user_id) REFERENCES users(id),
    FOREIGN KEY (film_id) REFERENCES film(id)
);

CREATE TABLE favorite (
    id INT AUTO_INCREMENT PRIMARY KEY,
    user_id INT,
    film_id INT,
    FOREIGN KEY (user_id) REFERENCES users(id),
    FOREIGN KEY (film_id) REFERENCES film(id)
);

CREATE TABLE riwayat_tontonan (
    id INT AUTO_INCREMENT PRIMARY KEY,
    user_id INT,
    film_id INT,
    tanggal_tonton TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (user_id) REFERENCES users(id),
    FOREIGN KEY (film_id) REFERENCES film(id)
);

CREATE TABLE watchlist (
    id INT AUTO_INCREMENT PRIMARY KEY,
    user_id INT,
    film_id INT,
      FOREIGN KEY (user_id)
      REFERENCES users(id)
      ON DELETE CASCADE

      FOREIGN KEY (film_id)
      REFERENCES film(id)
      ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;


INSERT INTO users(username,email,password)
VALUES
('admin','admin@cinestream.com','123456'),
('star','star@gmail.com','123456');

INSERT INTO film
(judul,genre,deskripsi,poster,tahun_rilis,durasi)
VALUES
('Interstellar','Sci-Fi','Film luar angkasa','interstellar.jpg',2014,169),
('The Batman','Action','Film Batman','batman.jpg',2022,176);

INSERT INTO series
(judul,genre,deskripsi,poster,tahun_rilis)
VALUES
('Stranger Things','Sci-Fi','Series Netflix','strangerthings.jpg',2016);

INSERT INTO episode
(series_id,nomor_episode,judul,durasi)
VALUES
(1,1,'Chapter One',50),
(1,2,'Chapter Two',52);

INSERT INTO watchlist(user_id,film_id)
VALUES
(1,1),
(1,2);

COMMIT;