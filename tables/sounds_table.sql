-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Czas generowania: 04 Paź 2021, 15:09
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
-- Struktura tabeli dla tabeli `sounds_table`
--

CREATE TABLE `sounds_table` (
  `id` int(11) NOT NULL,
  `sound_src` varchar(50) COLLATE utf8mb4_bin NOT NULL,
  `category` enum('general','combat','event','misc.') COLLATE utf8mb4_bin NOT NULL,
  `dialoge_name_EN` varchar(50) COLLATE utf8mb4_bin NOT NULL,
  `dialoge_name_PL` varchar(50) COLLATE utf8mb4_bin NOT NULL,
  `text_JP` text COLLATE utf8mb4_bin NOT NULL,
  `translation_EN` text COLLATE utf8mb4_bin NOT NULL,
  `translation_PL` text COLLATE utf8mb4_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

--
-- Zrzut danych tabeli `sounds_table`
--

INSERT INTO `sounds_table` (`id`, `sound_src`, `category`, `dialoge_name_EN`, `dialoge_name_PL`, `text_JP`, `translation_EN`, `translation_PL`) VALUES
(1, '/Nagant_Revolver_Acqusition.mp3', 'general', 'Acqusition', 'Nabycie', 'こんな年寄りを好みとは、お主は相当な変わり者じゃな。', 'You\'re quite the odd one for having tastes in someone as old as I, aren\'t you?', 'WIP \'Bydzie jak bydzie\''),
(2, '/Nagant_Revolver_Secretary1.mp3', 'general', 'Secretary 1', 'Adjutant 1', 'わしの身長がそんなに気になるか、デリケートなことは聞かないでほしいの!', 'Are you curious about my height that much? Don\'t ask delicate stuff like that.', 'WIP');

--
-- Indeksy dla zrzutów tabel
--

--
-- Indeksy dla tabeli `sounds_table`
--
ALTER TABLE `sounds_table`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT dla zrzuconych tabel
--

--
-- AUTO_INCREMENT dla tabeli `sounds_table`
--
ALTER TABLE `sounds_table`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
