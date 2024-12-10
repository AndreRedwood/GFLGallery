-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Czas generowania: 04 Paź 2021, 15:10
-- Wersja serwera: 10.4.21-MariaDB
-- Wersja PHP: 8.0.10

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Baza danych: `testgallerydb`
--

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `sounds_connections`
--

CREATE TABLE `sounds_connections` (
  `id` int(11) NOT NULL,
  `sound_id` int(11) NOT NULL,
  `tdoll_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

--
-- Zrzut danych tabeli `sounds_connections`
--

INSERT INTO `sounds_connections` (`id`, `sound_id`, `tdoll_id`) VALUES
(1, 1, 1),
(2, 2, 1);

--
-- Indeksy dla zrzutów tabel
--

--
-- Indeksy dla tabeli `sounds_connections`
--
ALTER TABLE `sounds_connections`
  ADD PRIMARY KEY (`id`),
  ADD KEY `sound_id` (`sound_id`),
  ADD KEY `tdoll_id` (`tdoll_id`);

--
-- AUTO_INCREMENT dla zrzuconych tabel
--

--
-- AUTO_INCREMENT dla tabeli `sounds_connections`
--
ALTER TABLE `sounds_connections`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- Ograniczenia dla zrzutów tabel
--

--
-- Ograniczenia dla tabeli `sounds_connections`
--
ALTER TABLE `sounds_connections`
  ADD CONSTRAINT `sounds_connections_ibfk_1` FOREIGN KEY (`sound_id`) REFERENCES `sounds_table` (`id`),
  ADD CONSTRAINT `sounds_connections_ibfk_2` FOREIGN KEY (`tdoll_id`) REFERENCES `tdolls` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
