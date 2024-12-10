-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Czas generowania: 05 Paź 2021, 14:54
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
-- Struktura tabeli dla tabeli `artists`
--

CREATE TABLE `artists` (
  `id` int(11) NOT NULL,
  `name` varchar(25) COLLATE utf8mb4_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

--
-- Zrzut danych tabeli `artists`
--

INSERT INTO `artists` (`id`, `name`) VALUES
(0, 'Unkown'),
(1, 'X布'),
(2, '細重ソウジ'),
(3, 'SA'),
(4, '薯子Imoko'),
(5, 'ASK'),
(6, '十月十日奏'),
(7, 'Rain Lan'),
(8, '幻象黑兔'),
(9, 'Ki桑'),
(10, '防弹乳牛'),
(11, '河马/HIPPOs'),
(12, '和茶'),
(13, '多元菌'),
(14, '真名'),
(15, '洲川Terras'),
(16, '音符/ZAGALA'),
(17, 'Anmi'),
(18, '青空kamiya'),
(19, 'NOCO'),
(20, '藤ちょこ'),
(21, '时辰'),
(22, '林檎爱す'),
(23, 'Spirtie'),
(24, '小迪'),
(25, 'かれい'),
(26, '卑しい人间');

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `fairies`
--

CREATE TABLE `fairies` (
  `id` int(11) NOT NULL,
  `game_id` int(11) NOT NULL,
  `name` varchar(50) COLLATE utf8_bin NOT NULL,
  `full_name` varchar(80) COLLATE utf8_bin NOT NULL,
  `short_description` text COLLATE utf8_bin NOT NULL,
  `description` mediumtext COLLATE utf8_bin NOT NULL,
  `skills_description` text COLLATE utf8_bin NOT NULL,
  `trivia` text COLLATE utf8_bin NOT NULL,
  `origin_country` varchar(50) COLLATE utf8_bin NOT NULL,
  `voice_actor_id` int(11) NOT NULL,
  `artist_id` int(11) NOT NULL,
  `star_rating` tinyint(1) NOT NULL,
  `type` enum('HG','AR','SMG','RF','MG','SG') COLLATE utf8_bin NOT NULL,
  `folder_name` varchar(16) COLLATE utf8_bin NOT NULL,
  `modded` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Zrzut danych tabeli `fairies`
--

INSERT INTO `fairies` (`id`, `game_id`, `name`, `full_name`, `short_description`, `description`, `skills_description`, `trivia`, `origin_country`, `voice_actor_id`, `artist_id`, `star_rating`, `type`, `folder_name`, `modded`) VALUES
(1, 1, 'Warrior Fairy', 'Warrior Fairy', 'Technikal fairy...', 'to do..', 'yup, WIP', '* Her appearance is a nod to the \"Rambo\" movies.', '', 0, 0, 8, '', 'warFairy', 1),
(2, 2, 'Fury Fairy', 'Fury Fairy', 'Red-head fairy', 'WORK IN PROGRESS!', 'to do...', '* nothing so far', '', 0, 0, 8, '', 'furyFairy', 1),
(3, 3, 'Armor Fairy', 'Armor Fairy', 'Another fairy', 'There will be description someday', 'WIP', '* Her introduction line is a reference to Call of Duty Modern Warfare 2\'s character, Vladimir Makarov on the level \'No Russian\'. The level itself is known as one of the most controversial levels in any video game.', '', 0, 0, 8, '', 'armFairy', 1),
(4, 11, 'Parachute Fairy', 'Parachute Fairy', '....', '.......', '......', '......', '', 0, 0, 8, '', 'paraFairy', 1);

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `hocs`
--

CREATE TABLE `hocs` (
  `id` int(11) NOT NULL,
  `game_id` int(11) NOT NULL,
  `name` varchar(50) COLLATE utf8_bin NOT NULL,
  `full_name` varchar(80) COLLATE utf8_bin NOT NULL,
  `short_description` text COLLATE utf8_bin NOT NULL,
  `description` mediumtext COLLATE utf8_bin NOT NULL,
  `skills_description` text COLLATE utf8_bin NOT NULL,
  `trivia` text COLLATE utf8_bin NOT NULL,
  `origin_country` varchar(50) COLLATE utf8_bin NOT NULL,
  `voice_actor_id` int(11) NOT NULL,
  `artist_id` int(11) NOT NULL,
  `star_rating` tinyint(1) DEFAULT 9,
  `type` enum('BLUE','ORANGE') COLLATE utf8_bin NOT NULL,
  `folder_name` varchar(16) COLLATE utf8_bin NOT NULL,
  `modded` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Zrzut danych tabeli `hocs`
--

INSERT INTO `hocs` (`id`, `game_id`, `name`, `full_name`, `short_description`, `description`, `skills_description`, `trivia`, `origin_country`, `voice_actor_id`, `artist_id`, `star_rating`, `type`, `folder_name`, `modded`) VALUES
(1, 1, 'BGM-71', 'BGM-71 \"Tube-launched, Optically tracked, Wire-guided\"', 'First HOC on the list!', 'Work to do...', 'Same here...', '* One of the first HOC units the commander will get. Once a commander has unlocked access to the Research Facilities and doing Analysis (Using RAW Samples) for the first time, you will get an achievement which will give 5 BGM-71 Centrum Data which you\'ll be able to use to receive your first HOC unit.<br>* The BGM-71 crew members appear to have designs based on the suits of traditional playing cards (Diamonds, Clubs, Hearts and Spades)<br>* Diamond is the gunner (diamond as her hairpin and as a patch on her uniform)<br>* Club is the one with the M4 (Club hairpin and as a patch on her uniform)<br>* Heart is the loader (Heart patch on her uniform)<br>* Spade is the spotter (Spade tie-bar)<br>* The card suits are printed on the BGM-71, too. This is also visible in the chibi animation.<br>* There is no dormitory version/animation of the blonde doll (the Loader).', 'United States', 0, 15, 9, 'BLUE', 'bgm', 1);

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `illustrations_fairies`
--

CREATE TABLE `illustrations_fairies` (
  `id` int(11) NOT NULL,
  `owner_id` int(11) NOT NULL,
  `image` varchar(100) COLLATE utf8mb4_bin NOT NULL,
  `category` enum('Sprite','OfficialArt','UnofficialArt') COLLATE utf8mb4_bin NOT NULL,
  `sprite_set` varchar(20) COLLATE utf8mb4_bin NOT NULL,
  `sprite_type` enum('-','Regular','Damaged') COLLATE utf8mb4_bin NOT NULL,
  `image_name` varchar(100) COLLATE utf8mb4_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

--
-- Zrzut danych tabeli `illustrations_fairies`
--

INSERT INTO `illustrations_fairies` (`id`, `owner_id`, `image`, `category`, `sprite_set`, `sprite_type`, `image_name`) VALUES
(1, 1, '/sprite.png', 'Sprite', 'Main', 'Regular', 'Base 1★ sprite');

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `illustrations_hocs`
--

CREATE TABLE `illustrations_hocs` (
  `id` int(11) NOT NULL,
  `owner_id` int(11) NOT NULL,
  `image` varchar(100) COLLATE utf8mb4_bin NOT NULL,
  `category` enum('Sprite','OfficialArt','UnofficialArt') COLLATE utf8mb4_bin NOT NULL,
  `sprite_set` varchar(20) COLLATE utf8mb4_bin NOT NULL,
  `sprite_type` enum('-','Regular','Damaged') COLLATE utf8mb4_bin NOT NULL,
  `image_name` varchar(100) COLLATE utf8mb4_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

--
-- Zrzut danych tabeli `illustrations_hocs`
--

INSERT INTO `illustrations_hocs` (`id`, `owner_id`, `image`, `category`, `sprite_set`, `sprite_type`, `image_name`) VALUES
(1, 1, '/sprite.png', 'Sprite', 'Main', 'Regular', 'Official BGM-71 main artwork.');

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `illustrations_tdolls`
--

CREATE TABLE `illustrations_tdolls` (
  `id` int(11) NOT NULL,
  `owner_id` int(11) NOT NULL,
  `image` varchar(100) COLLATE utf8mb4_bin NOT NULL,
  `category` enum('Sprite','OfficialArt','UnofficialArt') COLLATE utf8mb4_bin NOT NULL,
  `sprite_set` varchar(20) COLLATE utf8mb4_bin NOT NULL,
  `sprite_type` enum('-','Regular','Damaged') COLLATE utf8mb4_bin NOT NULL,
  `image_name` varchar(100) COLLATE utf8mb4_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

--
-- Zrzut danych tabeli `illustrations_tdolls`
--

INSERT INTO `illustrations_tdolls` (`id`, `owner_id`, `image`, `category`, `sprite_set`, `sprite_type`, `image_name`) VALUES
(1, 1, '/__nagant_revolver_girls_frontline_drawn_by_matsuo_matuonoie__cf4c63a4460d4cdd9c33cf57d0f9e2fc.jpg', 'UnofficialArt', '', '-', 'illustration1'),
(2, 1, '/sprite.png', 'Sprite', 'Main', 'Regular', 'Base sprite'),
(3, 1, '/Nagant_Revolver_D.png', 'Sprite', 'Main', 'Damaged', 'Base sprite damaged'),
(4, 1, '/thumb.png', 'UnofficialArt', '', '-', 'illustration2'),
(5, 1, '/Nagant_Revolver_costume1.png', 'Sprite', 'MainMod', 'Regular', 'Base sprite after Mod3'),
(6, 1, '/Nagant_Revolver_costume2.png', 'Sprite', 'Costume1', 'Regular', '\"Starry Reins\" costume sprite'),
(7, 1, '/0b55e2249d3f81f42ec306a4c7f1b2f9.jpg', 'UnofficialArt', '', '-', 'illustration3'),
(8, 1, '/image.png', 'UnofficialArt', '', '-', 'illustration 5'),
(9, 1, '/Nagant_Revolver_costume1_D.png', 'Sprite', 'MainMod', 'Damaged', 'Mod3 damaged sprite'),
(10, 1, '/Nagant_Revolver_costume2_D.png', 'Sprite', 'Costume1', 'Damaged', '\"Starry Rein\" costume damaged sprite'),
(11, 1, '/Nagant_Revolver_costume3.png', 'Sprite', 'Costume2', 'Regular', '\"Blushing Snow Princess\" costume sprite'),
(12, 1, '/Nagant_Revolver_costume3_D.png', 'Sprite', 'Costume2', 'Damaged', '\"Blushing Snow Princess\" costume damaged sprite'),
(13, 2, '/Carcano_M91∕38_costume1.png', 'Sprite', 'Costume1', 'Regular', '\"Miss Pinocchio\" costume sprite'),
(14, 2, '/Carcano_M91∕38_costume1_D.png', 'Sprite', 'Costume1', 'Damaged', '\"Miss Pinocchio\" costume damaged sprite'),
(15, 2, '/Carcano_M91∕38_costume2.png', 'Sprite', 'Costume2', 'Regular', '\"Chase the Kite\" costume sprite'),
(16, 2, '/Carcano_M91∕38_costume2_D.png', 'Sprite', 'Costume2', 'Damaged', '\"Chase the Kite\" costume damaged sprite'),
(17, 2, '/Carcano_M91∕38_D.png', 'Sprite', 'Main', 'Damaged', 'Base damaged sprite'),
(18, 2, '/CHARACTER_SETTINGS_CARCANO_M91∕38.jpg', 'OfficialArt', '', '-', 'Official character sheet'),
(19, 2, '/Chime_of_the_New_Year_Login_Wallpaper.png', 'OfficialArt', '', '-', '\"Chime of the New Year\" Login Wallpaper illustrated by 細重ソウジ'),
(20, 2, '/image.png', 'UnofficialArt', '', '-', 'Meme description image'),
(21, 2, '/Springtime_Celebration_Login_Wallpaper.png', 'OfficialArt', '', '-', 'Springtime Celebration login wallpaper'),
(22, 2, '/sprite.png', 'Sprite', 'Main', 'Regular', 'Base sprite'),
(23, 2, '/thumb.png', 'UnofficialArt', '', '-', 'illustration'),
(24, 16, '/image.png', 'UnofficialArt', '', '-', 'illustration'),
(25, 16, '/sprite.png', 'Sprite', 'Main', 'Regular', 'Base sprite'),
(26, 16, '/thumb.png', 'UnofficialArt', '', '-', 'illustration 2'),
(27, 16, '/Vector_costume1.png', 'Sprite', 'Costume1', 'Regular', '\"Kitty Paws\" costume sprite'),
(28, 16, '/Vector_costume1_D.png', 'Sprite', 'Costume1', 'Damaged', '\"Kitty Paws\" costume damaged sprite'),
(29, 16, '/Vector_costume2.png', 'Sprite', 'Costume2', 'Regular', '\"Love is Blind\" costume sprite'),
(30, 16, '/Vector_costume2_D.png', 'Sprite', 'Costume2', 'Damaged', '\"Love is Blind\" costume damaged sprite'),
(31, 16, '/Vector_costume3.png', 'Sprite', 'Costume3', 'Regular', '\"Hellfire\" costume sprite'),
(32, 16, '/Vector_costume3_D.png', 'Sprite', 'Costume3', 'Damaged', '\"Hellfire\" costume damaged sprite'),
(33, 16, '/Vector_D.png', 'Sprite', 'Main', 'Damaged', 'Base damaged sprite'),
(34, 16, '/Vector_D_(Censored).png', 'OfficialArt', '', 'Damaged', 'Censored version of base damaged sprite'),
(35, 14, '/image.png', 'UnofficialArt', '', '-', 'illustration'),
(36, 14, '/In_the_Midst_of_Romance_Login_Wallpaper.png', 'OfficialArt', '', '-', '\"In The Midst of Romance\" login wallpaper Illustrated by 废人'),
(37, 14, '/sprite.png', 'Sprite', 'Main', 'Regular', 'Base sprite'),
(38, 14, '/Suomi_costume1.png', 'Sprite', 'Costume1', 'Regular', '\"Korvantunturi Pixie\" costume sprite'),
(39, 14, '/Suomi_costume1_D.png', 'Sprite', 'Costume1', 'Damaged', '\"Korvantunturi Pixie\" costume dameged sprite'),
(40, 14, '/Suomi_costume1_D_(Censored).png', 'OfficialArt', '', '-', '\"Korvantunturi Pixie\" costume censored damaged sprite'),
(41, 14, '/Suomi_costume2.png', 'Sprite', 'Costume2', 'Regular', '\"Midsummer Pixie\" costume sprite'),
(42, 14, '/Suomi_costume2_D.png', 'Sprite', 'Costume2', 'Damaged', '\"Midsummer Pixie\" costume dameged sprite'),
(43, 14, '/Suomi_costume2_D_(Censored).png', 'OfficialArt', '', '-', '\"Midsummer Pixie\" costume censored damaged sprite'),
(44, 14, '/Suomi_costume3.png', 'Sprite', 'Costume3', 'Regular', '\"Mission for Happines\" costume sprite'),
(45, 14, '/Suomi_costume3_D.png', 'Sprite', 'Costume3', 'Damaged', '\"Mission fo Happiness\" costume damaged sprite'),
(46, 14, '/Suomi_D.png', 'Sprite', 'Main', 'Damaged', 'Base damaged sprite'),
(47, 14, '/Suomi_D_(Censored).png', 'OfficialArt', '', '-', 'Base censored damaged sprite'),
(48, 14, '/Suomi_microphone.png', 'OfficialArt', '', '-', 'Suomi artwork by Anmi'),
(49, 14, '/thumb.png', 'UnofficialArt', '', '-', 'illustration 2'),
(50, 11, '/image.png', 'UnofficialArt', '', '-', 'illustration'),
(51, 11, '/Skorpion_costume1.png', 'Sprite', 'Costume1', 'Regular', '\"Crimson Starlet\" costume sprite'),
(52, 11, '/Skorpion_costume1_D.png', 'Sprite', 'Costume1', 'Damaged', '\"Crimson Starlet\" costume damaged sprite'),
(53, 11, '/Skorpion_D.png', 'Sprite', 'Main', 'Damaged', 'Base damaged sprite'),
(54, 11, '/sprite.png', 'Sprite', 'Main', 'Regular', 'Base sprite'),
(55, 11, '/thumb.png', 'UnofficialArt', '', '-', 'illustration 2'),
(56, 6, '/image.png', 'UnofficialArt', '', '-', 'illustration'),
(57, 6, '/thumb.png', 'UnofficialArt', '', '-', 'illustration 2'),
(58, 6, '/sprite.png', 'Sprite', 'Main', 'Regular', 'Base sprite'),
(59, 6, '/M14_D.png', 'Sprite', 'Main', 'Damaged', 'Base damaged sprite'),
(60, 6, '/M14_costume1.png', 'Sprite', 'Costume1', 'Regular', '\"Xmas Parade\" costume sprite'),
(61, 6, '/M14_costume1_D.png', 'Sprite', 'Costume1', 'Damaged', '\"Xmas Parade\" costume damaged sprite'),
(62, 6, '/M14_costume2.png', 'Sprite', 'MainMod', 'Regular', 'Digimind Upgrade sprite'),
(63, 6, '/M14_costume2_D.png', 'Sprite', 'MainMod', 'Damaged', 'Digimind Upgrade damged sprite'),
(64, 10, '/image.png', 'UnofficialArt', '', '-', 'illustration'),
(65, 10, '/thumb.png', 'UnofficialArt', '', '-', 'illustration 2'),
(66, 10, '/To_Our_5th_Year_Login_Wallpaper.png', 'OfficialArt', '', '-', '\"To Our 5th Year\" Login wallpaper'),
(67, 10, '/sprite.png', 'Sprite', 'Main', 'Regular', 'Base sprite'),
(68, 10, '/PPSh-41_D.png', 'Sprite', 'Main', 'Damaged', 'Base damaged sprite'),
(69, 10, '/PPSh-41_costume1.png', 'Sprite', 'Costume1', 'Regular', '\"Moment of Vows\" costume sprite'),
(70, 10, '/PPSh-41_costume1_D.png', 'Sprite', 'Costume1', 'Damaged', '\"Moment of Vows\" costume damaged sprite'),
(71, 10, '/PPSh-41_costume2.png', 'Sprite', 'Costume2', 'Regular', '\"Far Side of a Balloon\" costume sprite'),
(72, 10, '/PPSh-41_costume2_D.png', 'Sprite', 'Costume2', 'Damaged', '\"Far Side of a Balloon\" costume damaged sprite'),
(73, 8, '/image.png', 'UnofficialArt', '', '-', 'illustration'),
(74, 8, '/thumb.png', 'UnofficialArt', '', '-', 'illustration 2'),
(75, 8, '/Mysterious_Language_of_Flowers_Login_Wallpaper.png', 'OfficialArt', '', '-', '\"Mysterious Language of Flowers\" login wallpaper'),
(76, 8, '/sprite.png', 'Sprite', 'Main', 'Regular', 'Base sprite'),
(77, 8, '/Makarov_D.png', 'Sprite', 'Main', 'Damaged', 'Base damaged sprite'),
(78, 8, '/Makarov_costume3.png', 'Sprite', 'MainMod', 'Regular', 'Digimind Upgrade sprite'),
(79, 8, '/Makarov_costume3_D.png', 'Sprite', 'MainMod', 'Damaged', 'Digimind Upgrade damaged sprite'),
(80, 8, '/Makarov_costume1.png', 'Sprite', 'Costume1', 'Regular', '\"Pumpkin Mishka\" costume sprite'),
(81, 8, '/Makarov_costume1_D.png', 'Sprite', 'Costume1', 'Damaged', '\"Pumpkin Mishka\" costume damaged sprite'),
(82, 8, '/Makarov_costume2.png', 'Sprite', 'Costume2', 'Regular', '\"A Certain Unscientific Sunflower\" costume sprite'),
(83, 8, '/Makarov_costume2_D.png', 'Sprite', 'Costume2', 'Damaged', '\"A Certain Unscientific Sunflower\" costume damaged sprite'),
(84, 13, '/image.png', 'UnofficialArt', '', '-', 'illustration'),
(85, 13, '/Sten_MkII_D_(Censored).png', 'OfficialArt', '', '-', 'Base censored damaged sprite'),
(86, 13, '/Sten_MkII_costume1_D_(Censored_1).png', 'OfficialArt', '', '-', '\"Reciprocated Love\" costume censored damaged sprite'),
(87, 13, '/sprite.png', 'Sprite', 'Main', 'Regular', 'Base sprite'),
(88, 13, '/Sten_MkII_D.png', 'Sprite', 'Main', 'Damaged', 'Base damaged sprite'),
(89, 13, '/Sten_MkII_costume2.png', 'Sprite', 'MainMod', 'Regular', 'Digimind Upgrade sprite'),
(90, 13, '/Sten_MkII_costume2_D.png', 'Sprite', 'MainMod', 'Damaged', 'Digimind Upgrade damaged sprite'),
(91, 13, '/Sten_MkII_costume1.png', 'Sprite', 'Costume1', 'Regular', '\"Reciprocated Love\" costume sprite'),
(92, 13, '/Sten_MkII_costume1_D.png', 'Sprite', 'Costume1', 'Damaged', '\"Reciprocated Love\" costume damaged sprite'),
(93, 12, '/image.png', 'UnofficialArt', '', '-', 'illustration'),
(94, 12, '/thumb.png', 'UnofficialArt', '', '-', 'illustration 2'),
(95, 12, '/CHARACTER_SETTINGS_SPRINGFIELD_(EN).jpg', 'OfficialArt', '', '-', 'Official EN character sheet for Springfield'),
(96, 12, '/Springfield_costume3_(Old).png', 'OfficialArt', '', '-', '\"Queen in Radiance\" old sprite'),
(97, 12, '/Springfield_Cafe_CG.png', 'OfficialArt', '', '-', 'Springfield CG used in cafeteria'),
(98, 12, '/Springfield_Cafe_(Cutscene).png', 'OfficialArt', '', '-', 'Springfield\'s Cafe CG used in costume story cutscenes'),
(99, 12, '/Springfield_(Bartender).png', 'OfficialArt', '', '-', 'Springfield\'s Bartender CG used when she was tending the bar during Valhalla'),
(100, 12, '/Springfield_Alt_1.png', 'OfficialArt', '', '-', 'Alternative sprite nr1'),
(101, 12, '/Springfield_Alt_2.png', 'OfficialArt', '', '-', 'Alternative sprite nr2'),
(102, 12, '/Springfield_Alt_3.png', 'OfficialArt', '', '-', 'Alternative sprite nr3'),
(103, 12, '/Springfield_Alt_4.png', 'OfficialArt', '', '-', 'Alternative sprite nr4'),
(104, 12, '/Japanese_Server_Pre-launch_Springfield_Promotion_Artwork_Illustrated_by_Duoyuanjun.jpeg', 'OfficialArt', '', '-', 'JP Server pre-launch promotional artwork illustrated by Duoyuanjun'),
(105, 12, '/Springfield_Login_Wallpaper_2016_Halloween_Illustrated_by_Suisai.jpeg', 'OfficialArt', '', '-', '2016 Halloween login wallpaper illustrated by Suisai'),
(106, 12, '/Springfield_Login_Wallpaper_2017_Summe_Illustrated_by_Suisair.jpeg', 'OfficialArt', '', '-', '2017 Summer login wallpaper illustrated by Suisai'),
(107, 12, '/Login_Wallpaper_Maid_Internship.png', 'OfficialArt', '', '-', '\"Maid Internship\" Login wallpaper illustrated by 水乌龟 (Suisai)'),
(108, 12, '/sprite.png', 'Sprite', 'Main', 'Regular', 'Base sprite'),
(109, 12, '/Springfield_D.png', 'Sprite', 'Main', 'Damaged', 'Base damaged sprite'),
(110, 12, '/Springfield_costume1.png', 'Sprite', 'Costume1', 'Regular', '\"Classic Witch\" costume sprite'),
(111, 12, '/Springfield_costume1_D.png', 'Sprite', 'Costume1', 'Damaged', '\"Classic Witch\" costume damaged sprite'),
(112, 12, '/Springfield_costume2.png', 'Sprite', 'Costume2', 'Regular', '\"O Holy Night\" costume sprite'),
(113, 12, '/Springfield_costume2_D.png', 'Sprite', 'Costume2', 'Damaged', '\"O Holy Night\" costume damaged sprite'),
(114, 12, '/Springfield_costume3.png', 'Sprite', 'Costume3', 'Regular', '\"Queen in Radiance\" costume sprite'),
(115, 12, '/Springfield_costume3_D.png', 'Sprite', 'Costume3', 'Damaged', '\"Queen in Radiance\" costume damaged sprite'),
(116, 12, '/Springfield_costume4.png', 'Sprite', 'Costume4', 'Regular', '\"Stirring Mermaid\" costume sprite'),
(117, 12, '/Springfield_costume4_D.png', 'Sprite', 'Costume4', 'Damaged', '\"Stirring Mermaid\" costume damaged sprite'),
(118, 9, '/image.png', 'UnofficialArt', '', '-', 'illustration'),
(119, 9, '/thumb.png', 'UnofficialArt', '', '-', 'illustration 2'),
(120, 9, '/Mosin-Nagant_D_(Censored).png', 'OfficialArt', '', '-', 'Base damaged censored image'),
(121, 9, '/Mosin-Nagant_costume2_(Censored).png', 'OfficialArt', '', '-', 'Digimind Upgrade censored sprite'),
(122, 9, '/Flaming_Song_of_War_Login_Wallpaper.png', 'OfficialArt', '', '-', '\"Flaming Song of War\" login wallpaper'),
(123, 9, '/sprite.png', 'Sprite', 'Main', 'Regular', 'Base sprite'),
(124, 9, '/Mosin-Nagant_D.png', 'Sprite', 'Main', 'Damaged', 'Base damaged sprite'),
(125, 9, '/Mosin-Nagant_costume2.png', 'Sprite', 'MainMod', 'Regular', 'Digimind Upgrade sprite'),
(126, 9, '/Mosin-Nagant_costume2_D.png', 'Sprite', 'MainMod', 'Damaged', 'Digimind Upgrade damaged sprite'),
(127, 9, '/Mosin-Nagant_costume1.png', 'Sprite', 'Costume1', 'Regular', '\"Moonlit Ocean\" costume sprite'),
(128, 9, '/Mosin-Nagant_costume1_D.png', 'Sprite', 'Costume1', 'Damaged', '\"Moonlit Ocean\" costume damaged sprite'),
(129, 9, '/Mosin-Nagant_costume3.png', 'Sprite', 'Costume2', 'Regular', '\"White Steel Edge\" costume sprite'),
(130, 9, '/Mosin-Nagant_costume3_D.png', 'Sprite', 'Costume2', 'Damaged', '\"White Steel Edge\" costume damaged sprite'),
(131, 1, '/mosin_and_nagant1.png', 'UnofficialArt', '', '-', 'illustration 3'),
(132, 9, '/mosin_and_nagant2.png', 'UnofficialArt', '', '-', 'illustration 3'),
(133, 3, '/G36_character_sheet.jpeg', 'OfficialArt', '', '-', 'G36 character sheet by Imoko'),
(134, 3, '/G36_MOD3_character_sheet.jpg', 'OfficialArt', '', '-', 'G36 Digiming Upgrade character sheet by Imoko'),
(135, 3, '/G36_body_height.jpeg', 'OfficialArt', '', '-', 'Character sheet of regular G36 and \"Petit Waitress\" costume by Imoko'),
(136, 3, '/G36_costume_2_draft.jpeg', 'OfficialArt', '', '-', 'Draft sheet of \"Sommelier\" costume by Imoko'),
(137, 3, '/G36_costume_3_draft.jpeg', 'OfficialArt', '', '-', 'Draft sheet of \"Pure White Cornflower\" costume by Imoko'),
(138, 3, '/G36_costume_6_sheet.jpeg', 'OfficialArt', '', '-', 'Character sheet of \"Every Child\'s Christmas Dream\" costume by Imoko'),
(139, 3, '/G36_D_(Censored).png', 'OfficialArt', '', '-', 'Base cesored damaged sprite'),
(140, 3, '/G36_Cafe_(Cutscene).png', 'OfficialArt', '', '-', 'Cafe cutsene sprite'),
(141, 3, '/G36_reunion.jpeg', 'OfficialArt', '', '-', 'official illustration'),
(142, 3, '/Japanese_Server_Pre-launch_G36_Promotion_Artwork_Illustrated_by_Shuzi.jpeg', 'OfficialArt', '', '-', 'JP Server pre-launch promotional artwork produced by Imoko'),
(143, 3, '/G36_wanted_poster.jpeg', 'OfficialArt', '', '-', 'Wanted poster by Imoko \"Have you seen a child looking this?\"'),
(144, 3, '/Login_Wallpaper_2017_November_Illustrated_by_Infukun.jpeg', 'OfficialArt', '', '-', 'Princes\' Frontline 2017 login wallpaper illustrated by Infukun'),
(145, 3, '/2018_White_Day_Background.png', 'OfficialArt', '', '-', 'White Day 2018 login wallpaper illustrated by Suisai'),
(146, 3, '/Login_Wallpaper_2018_Summe_Illustrated_by_Shuzi.png', 'OfficialArt', '', '-', 'Summer 2018 login wallpaper illustrated by Imoko'),
(147, 3, '/thumb.png', 'UnofficialArt', '', '-', 'illustration with G36C'),
(148, 3, '/sprite.png', 'Sprite', 'Main', 'Regular', 'Base sprite'),
(149, 3, '/G36_D.png', 'Sprite', 'Main', 'Damaged', 'Base damaged sprite'),
(150, 3, '/G36_costume5.png', 'Sprite', 'MainMod', 'Regular', 'Digimind Upgrade sprite'),
(151, 3, '/G36_costume5_D.png', 'Sprite', 'MainMod', 'Damaged', 'Digimind Upgrage damaged sprite'),
(152, 3, '/G36_costume1.png', 'Sprite', 'Castume1', 'Regular', '\"Petit Waitress\" costume sprite'),
(153, 3, '/G36_costume1_D.png', 'Sprite', 'Castume1', 'Damaged', '\"Petit Waitress\" costume damaged sprite'),
(154, 3, '/G36_costume2.png', 'Sprite', 'Castume2', 'Regular', '\"Sommelier\" costume sprite'),
(155, 3, '/G36_costume2_D.png', 'Sprite', 'Castume2', 'Damaged', '\"Sommelier\" costume damaged sprite'),
(156, 3, '/G36_costume3.png', 'Sprite', 'Castume3', 'Regular', '\"Pure White Cornflower\" costume sprite'),
(157, 3, '/G36_costume3_D.png', 'Sprite', 'Castume3', 'Damaged', '\"Pure White Cornflower\" costume damaged sprite'),
(158, 3, '/G36_costume4.png', 'Sprite', 'Castume4', 'Regular', '\"Fifty Days with G36\" costume sprite'),
(159, 3, '/G36_costume4_D.png', 'Sprite', 'Castume4', 'Damaged', '\"Fifty Days with G36\" costume damaged sprite'),
(160, 3, '/G36_costume6.png', 'Sprite', 'Castume5', 'Regular', '\"Every Child\'s Christmas Dream\" costume sprite'),
(161, 3, '/G36_costume6_D.png', 'Sprite', 'Castume5', 'Damaged', '\"Every Child\'s Christmas Dream\" costume damaged sprite'),
(162, 3, '/G36_costume7.png', 'Sprite', 'Castume6', 'Regular', '\"Moonlit Wishes\" costume sprite'),
(163, 3, '/G36_costume7_D.png', 'Sprite', 'Castume6', 'Damaged', '\"Moonlit Wishes\" costume damaged sprite'),
(164, 3, '/G36_costume8.png', 'Sprite', 'Castume7', 'Regular', '\"Watcher of the Light\" costume sprite'),
(165, 3, '/G36_costume8_D.png', 'Sprite', 'Castume7', 'Damaged', '\"Watcher of the Light\" costume damaged sprite'),
(166, 31, '/M1911_D_(Censored).png', 'OfficialArt', '', '-', 'Base censored damaged sprite'),
(167, 31, '/sprite.png', 'Sprite', 'Main', 'Regular', 'Base sprite'),
(168, 31, '/M1911_D.png', 'Sprite', 'Main', 'Damaged', 'Base damaged sprite'),
(169, 31, '/M1911_costume1.png', 'Sprite', 'MainMod', 'Regular', 'Digimind Upgrade sprite'),
(170, 31, '/M1911_costume1_D.png', 'Sprite', 'MainMod', 'Damaged', 'Digimind Upgrade damaged sprite'),
(171, 31, '/M1911_costume2.png', 'Sprite', 'Costume1', 'Regular', '\"Night Dancer\" costume sprite'),
(172, 31, '/M1911_costume2_D.png', 'Sprite', 'Costume1', 'Damaged', '\"Night Dancer\" costume damaged sprite'),
(173, 28, '/sprite.png', 'Sprite', 'Main', 'Regular', 'Base sprite'),
(174, 28, '/SCW_D.png', 'Sprite', 'Main', 'Damaged', 'Base damaged sprite'),
(175, 8, '/Makarov_D_(Censored).png', 'OfficialArt', '', '-', 'Base censored damaged sprite'),
(176, 15, '/sprite.png', 'Sprite', 'Main', 'Regular', 'Base sprite'),
(177, 15, '/UMP45_D.png', 'Sprite', 'Main', 'Damaged', 'Base damaged sprite'),
(178, 15, '/UMP45_costume3.png', 'Sprite', 'MainMod', 'Regular', 'Digimind Upgrade sprite'),
(179, 15, '/UMP45_costume3_D.png', 'Sprite', 'MainMod', 'Damaged', 'Digiming Upgrade damaged sprite'),
(180, 15, '/UMP45_costume1.png', 'Sprite', 'Costume1', 'Regular', '\"Just This Time.\" costume sprite'),
(181, 15, '/UMP45_costume1_D.png', 'Sprite', 'Costume1', 'Damaged', '\"Just This Time.\" costume damaged sprite'),
(182, 15, '/UMP45_costume2.png', 'Sprite', 'Costume2', 'Regular', '\"Diamond Flower\" costume sprite'),
(183, 15, '/UMP45_costume2_D.png', 'Sprite', 'Costume2', 'Damaged', '\"Diamond Flower\" costume damaged sprite'),
(184, 15, '/UMP45_costume4.png', 'Sprite', 'Costume3', 'Regular', '\"Winter Journey\" costume sprite'),
(185, 15, '/UMP45_costume4_D.png', 'Sprite', 'Costume3', 'Damaged', '\"Winter Journey\" costume damaged sprite'),
(186, 15, '/UMP45_costume5.png', 'Sprite', 'Costume4', 'Regular', '\"Lop-Eared Rabbit Agent\" costume sprite'),
(187, 15, '/UMP45_costume5_D.png', 'Sprite', 'Costume4', 'Damaged', '\"Lop-Eared Rabbit Agent\" costume damaged sprite'),
(188, 15, '/UMP45_costume6.png', 'Sprite', 'Costume5', 'Regular', '\"Hopeful Fireworks Magician\" costume sprite'),
(189, 15, '/UMP45_costume6_D.png', 'Sprite', 'Costume5', 'Damaged', '\"Hopeful Fireworks Magician\" costume damaged sprite'),
(190, 15, '/UMP45_costume7.png', 'Sprite', 'Costume6', 'Regular', '\"Lonely Traveller of Eternity\" costume sprite'),
(191, 15, '/UMP45_costume7_D.png', 'Sprite', 'Costume6', 'Damaged', '\"Lonely Traveller of Eternity\" costume damaged sprite'),
(192, 15, '/UMP45_costume8.png', 'Sprite', 'Costume7', 'Regular', '\"Whirling Penrose\" costume sprite'),
(193, 15, '/UMP45_costume8_D.png', 'Sprite', 'Costume7', 'Damaged', '\"Whirling Penrose\" costume damaged sprite'),
(194, 15, '/UMP45_Damaged.png', 'OfficialArt', '', '-', 'Alternative CG of UMP45 used during Continuum Turbulence and doll modification story'),
(195, 15, '/Girls_Frontline_Orchestra_2018_promotion_poster.jpg', 'OfficialArt', '', '-', 'Girls Frontline Orchestra 2018 promotion poster, character art illustrated by Duoyuanjun'),
(196, 15, '/Login_Wallpaper_2019_April_Fools.jpeg', 'OfficialArt', '', '-', '2019 CN Servers April 1st login wallpaper'),
(197, 15, '/Login_Wallpaper_Shattered_Connexion.png', 'OfficialArt', '', '-', 'Shattered Connexion login wallpaper Illustrated by 藤原海藻'),
(198, 15, '/Shattered_Connexion_Login_Wallpaper2.png', 'OfficialArt', '', '-', 'Shattered Connexion login wallpaper Illustrated by Paindude'),
(199, 15, '/Shattered_Connexion_Login_Wallpaper3.png', 'OfficialArt', '', '-', 'Shattered Connexion login wallpaper Illustrated by SWAV'),
(200, 15, '/Children\'s_Garden_Login_Wallpaper.png', 'OfficialArt', '', '-', '\"Children\'s Garden\" Login wallpaper illustrated by 薯子Imoko'),
(201, 15, '/Task_Force_404_Halloween_Login_Wallpaper.png', 'OfficialArt', '', '-', 'Task Force 404 Halloween Login wallpaper (JP)'),
(202, 15, '/Sleepwalking_in_Rabbit_Wonderland_Login_Wallpaper.png', 'OfficialArt', '', '-', '\"Sleepwalking in Rabbit Wonderland\" Login wallpaper illustrated by STAR影法师'),
(203, 15, '/First_Prayer_of_Spring_Login_Wallpaper.png', 'OfficialArt', '', '-', '\"First Prayer of Spring\" login wallpaper'),
(204, 15, '/image.png', 'UnofficialArt', '', '-', 'illustration'),
(205, 15, '/thumb.png', 'UnofficialArt', '', '-', 'illustration2'),
(206, 7, '/image.png', 'UnofficialArt', '', '-', 'illustration'),
(207, 7, '/thumb.png', 'UnofficialArt', '', '-', 'illustration 2'),
(208, 7, '/sprite.png', 'Sprite', 'Main', 'Regular', 'Base sprite'),
(209, 7, '/M500_D.png', 'Sprite', 'Main', 'Damaged', 'Base damaged sprite'),
(210, 7, '/M500_costume2.png', 'Sprite', 'MainMod', 'Regular', 'Digimind Upgrade sprite'),
(211, 7, '/M500_costume2_D.png', 'Sprite', 'MainMod', 'Damaged', 'Digimind Upgrade damaged sprite'),
(212, 7, '/M500_costume1.png', 'Sprite', 'Costume1', 'Regular', '\"Classroom Daydream\" costume sprite'),
(213, 7, '/M500_costume1_D.png', 'Sprite', 'Costume1', 'Regular', '\"Classroom Daydream\" costume damaged sprite'),
(214, 7, '/M500_MOD3_alt.png', 'OfficialArt', '', '-', 'Digimind Upgrade alternative sprite'),
(215, 7, '/Stick.png', 'OfficialArt', '', '-', 'M500s Pet Dog \"Stick\" in her Digimind Upgrade CG and Story'),
(216, 7, '/Advanced_Furball_Academy_Login_Wallpaper.png', 'OfficialArt', '', '-', '\"Advanced furball Academy\" Login wallpaper illustrated by 薯子Imoko'),
(217, 20, '/sprite.png', 'Sprite', 'Main', 'Regular', 'Base sprite'),
(218, 20, '/Model_L_D.png', 'Sprite', 'Main', 'Damaged', 'Base damaged sprite'),
(219, 20, '/Model_L_costume1.png', 'Sprite', 'Costume1', 'Regular', '\"Instant Midnight Execution\" costume sprite'),
(220, 20, '/Model_L_costume1_D.png', 'Sprite', 'Costume1', 'Damaged', '\"Instant Midnight Execution\" costume damaged sprite'),
(221, 20, '/Model_L_costume2.png', 'Sprite', 'Costume2', 'Regular', '\"Floating Into The Blue Sky\" costume sprite'),
(222, 20, '/Model_L_costume2_D.png', 'Sprite', 'Costume2', 'Damaged', '\"Floating Into The Blue Sky\" costume damaged sprite'),
(223, 20, '/CHARACTER_SETTINGS_MODEL_L.jpg', 'OfficialArt', '', '-', 'Official character sheet of Model L'),
(224, 20, '/Hidden_Treasures_of_the_Mystic_Realm_Login_Wallpaper.png', 'OfficialArt', '', '-', '\"Hidden Treasures of the Mystic Realm\" Login wallpaper illustrated by 水熊'),
(225, 20, '/Wonderful_Dating_Guide_Login_Wallpaper.png', 'OfficialArt', '', '-', '\"Wonderful Dating Guide\" Login wallpaper'),
(226, 26, '/sprite.png', 'Sprite', 'Main', 'Regular', 'Base sprite'),
(227, 26, '/BM59_D.png', 'Sprite', 'Main', 'Damaged', 'Base damaged sprite'),
(228, 26, '/BM59_D_(Censored).png', 'OfficialArt', '', '-', 'Base censored damaged sprite'),
(229, 34, '/sprite.png', 'Sprite', 'Main', 'Regular', 'Base sprite'),
(230, 34, '/XM8_D.png', 'Sprite', 'Main', 'Damaged', 'Base damaged sprite'),
(231, 34, '/XM8_costume1.png', 'Sprite', 'Costume1', 'Regular', '\"The Rose Chess Player\'s Confession\" costume sprite'),
(232, 34, '/XM8_costume1_D.png', 'Sprite', 'Costume1', 'Damaged', '\"The Rose Chess Player\'s Confession\" costume damaged sprite'),
(233, 34, '/CHARACTER_SETTINGS_XM8.jpg', 'OfficialArt', '', '-', 'Official character sheet of XM8'),
(234, 34, '/A_Letter_From_Her_Login_Wallpaper.png', 'OfficialArt', '', '-', '\"A Letter From Her\" login wallpaper'),
(235, 19, '/sprite.png', 'Sprite', 'Main', 'Regular', 'Base sprite'),
(236, 19, '/Type_4_D.png', 'Sprite', 'Main', 'Damaged', 'Base damaged sprite'),
(237, 19, '/Type_4_costume1.png', 'Sprite', 'Costume1', 'Regular', '\"Cape No. 4\" costume sprite'),
(238, 19, '/Type_4_costume1_D.png', 'Sprite', 'Costume1', 'Damaged', '\"Cape No. 4\" costume damaged sprite'),
(239, 19, '/Type_4_costume2.png', 'Sprite', 'Costume2', 'Regular', '\"Paddle of Flower Petals\" costume sprite'),
(240, 19, '/Type_4_costume2_D.png', 'Sprite', 'Costume2', 'Damaged', '\"Paddle of Flower Petals\" costume damaged sprite'),
(241, 19, '/Type_4_costume3.png', 'Sprite', 'Costume3', 'Regular', '\"Daily Fairy\" costume sprite'),
(242, 19, '/Type_4_costume3_D.png', 'Sprite', 'Costume3', 'Damaged', '\"Daily Fairy\" costume damaged sprite'),
(243, 19, '/CHARACTER_SETTINGS_TYPE_4.jpg', 'OfficialArt', '', '-', 'Official character sheet of Type 4'),
(244, 19, '/Type_4_D_(Censored).png', 'OfficialArt', '', '-', 'Base censored damaged sprite'),
(245, 19, '/Type_4_JP_Release_Commemoration.jpg', 'OfficialArt', '', '-', 'Type 4 artwork produced by 藤ちょこ, in celebration of her release on JP server'),
(246, 19, '/Summer_Waves_Login_Wallpaper.png', 'OfficialArt', '', '-', '\"Summer Waves\" login wallpaper Illustrated by 废人'),
(247, 19, '/Year_God\'s_Blessing_Login_Wallpaper.png', 'OfficialArt', '', '-', '\"Year God\'s Blessing\" Login Wallpaper illustrated by 藤原海藻'),
(248, 19, '/2020_New_Years_Login_Wallpaper_(JP).png', 'OfficialArt', '', '-', '2020 New years Login wallpaper'),
(249, 36, '/sprite.png', 'Sprite', 'Main', 'Regular', 'Base sprite'),
(250, 36, '/M21_D.png', 'Sprite', 'Main', 'Damaged', 'Base damaged sprite'),
(251, 36, '/M21_costume1.png', 'Sprite', 'Costume1', 'Regular', '\"Xmas At Home\" costume sprite'),
(252, 36, '/M21_costume1_D.png', 'Sprite', 'Costume1', 'Damaged', '\"Xmas At Home\" costume damaged sprite'),
(253, 36, '/M21_costume2.png', 'Sprite', 'Costume2', 'Regular', '\"Gatekeeper of the Mystic Domain\" costume sprite'),
(254, 36, '/M21_costume2_D.png', 'Sprite', 'Costume2', 'Damaged', '\"Gatekeeper of the Mystic Domain\" costume damaged sprite'),
(255, 36, '/M21_costume1_D_(Censored).png', 'OfficialArt', '', '-', '\"Xmas At Home\" costume censored damaged sprite'),
(256, 36, '/Eclipse_Diary_Login_Wallpaper.png', 'OfficialArt', '', '-', '\"Eclipse Diary\" Login wallpaper illustrated by Nagu'),
(257, 30, '/sprite.png', 'Sprite', 'Main', 'Regular', 'Base sprite'),
(258, 30, '/OTs-12_D.png', 'Sprite', 'Main', 'Damaged', 'Base damaged sprite'),
(259, 30, '/OTs-12_costume1.png', 'Sprite', 'Costume1', 'Regular', '\"Blossoming Flowers\" costume sprite'),
(260, 30, '/OTs-12_costume1_D.png', 'Sprite', 'Costume1', 'Damaged', '\"Blossoming Flowers\" costume damaged sprite'),
(261, 30, '/OTs-12_D_(Censored).png', 'OfficialArt', '', '-', 'Base censored damaged sprite'),
(262, 39, '/sprite.png', 'Sprite', 'Main', 'Regular', 'Base sprite'),
(263, 39, '/M1897_D.png', 'Sprite', 'Main', 'Damaged', 'Base damaged sprite'),
(264, 39, '/M1897_costume3.png', 'Sprite', 'MainMod', 'Regular', 'Digimind Upgrade sprite'),
(265, 39, '/M1897_costume3_D.png', 'Sprite', 'MainMod', 'Damaged', 'Digimind Upgrade damaged sprite'),
(266, 39, '/M1897_costume1.png', 'Sprite', 'Costume1', 'Regular', '\"Electronic Witch\" costume sprite'),
(267, 39, '/M1897_costume1_D.png', 'Sprite', 'Costume1', 'Damaged', '\"Electronic Witch\" costume damaged sprite'),
(268, 39, '/M1897_costume2.png', 'Sprite', 'Costume2', 'Regular', '\"Blue Sky Patroller\" costume sprite'),
(269, 39, '/M1897_costume2_D.png', 'Sprite', 'Costume2', 'Damaged', '\"Blue Sky Patroller\" costume damaged sprite'),
(270, 39, '/Sulfur_in_the_Air_Login_Wallpaper.png', 'OfficialArt', '', '-', '\"Sulfur in the Air\" Login wallpaper illustrated by 音符.'),
(271, 39, '/Flaming_Song_of_War_Login_Wallpaper.png', 'OfficialArt', '', '-', '\"Flaming Song of War\" login wallpaper'),
(272, 35, '/sprite.png', 'Sprite', 'Main', 'Regular', 'Base sprite'),
(273, 35, '/Type_100_D.png', 'Sprite', 'Main', 'Damaged', 'Base damaged sprite'),
(274, 35, '/Type_100_costume1.png', 'Sprite', 'Costume1', 'Regular', '\"Armed Shrine Maiden\" costume sprite'),
(275, 35, '/Type_100_costume1_D.png', 'Sprite', 'Costume1', 'Damaged', '\"Armed Shrine Maiden\" costume damaged sprite'),
(276, 35, '/Type_100_costume2.png', 'Sprite', 'Costume2', 'Regular', '\"Treasure Buried Deep Within\" costume sprite'),
(277, 35, '/Type_100_costume2_D.png', 'Sprite', 'Costume2', 'Damaged', '\"Treasure Buried Deep Within\" costume damaged sprite'),
(278, 35, '/Type_100_costume3.png', 'Sprite', 'Costume3', 'Regular', '\"Kagura Vestments\" costume sprite'),
(279, 35, '/Type_100_costume3_D.png', 'Sprite', 'Costume3', 'Damaged', '\"Kagura Vestments\" costume damaged sprite'),
(280, 35, '/CHARACTER_SETTINGS_TYPE_100.jpg', 'OfficialArt', '', '-', 'Official Character sheet for Type 100 (CN)'),
(281, 35, '/CHARACTER_SETTINGS_TYPE_100_(JP).jpg', 'OfficialArt', '', '-', 'Character preview of Type 100 (JP)'),
(282, 35, '/Chime_of_the_New_Year_Login_Wallpaper.png', 'OfficialArt', '', '-', '\"Chime of the New Year\" Login Wallpaper illustrated by 細重ソウジ'),
(283, 35, '/Frozen_Nights_Symphony_Login_Wallpaper.png', 'OfficialArt', '', '-', '\"Frozen Nights Symphony\" Login wallpaper illustrated by 薯子Imoko'),
(284, 35, '/2020_New_Years_Login_Wallpaper_(JP).png', 'OfficialArt', '', '-', '2020 New years Login wallpaper'),
(285, 35, '/Strange_Tales_Beneath_The_Rafters_Login_Wallpaper.png', 'OfficialArt', '', '-', '\"Strange Tales Beneath The Rafters\" Login wallpaper'),
(286, 29, '/sprite.png', 'Sprite', 'Main', 'Regular', 'Base sprite'),
(287, 29, '/SV-98_D.png', 'Sprite', 'Main', 'Damaged', 'Base damaged sprite'),
(288, 29, '/SV-98_costume3.png', 'Sprite', 'MainMod', 'Regular', 'Digimind Upgrade sprite'),
(289, 29, '/SV-98_costume3_D.png', 'Sprite', 'MainMod', 'Damaged', 'Digimind Upgrade damaged art'),
(290, 29, '/SV-98_costume1.png', 'Sprite', 'Costume1', 'Regular', '\"\" costume sprite'),
(291, 29, '/SV-98_costume1_D.png', 'Sprite', 'Costume1', 'Damaged', '\"\" costume damaged sprite'),
(292, 29, '/SV-98_costume2.png', 'Sprite', 'Costume2', 'Regular', '\"\" costume sprite'),
(293, 29, '/SV-98_costume2_D.png', 'Sprite', 'Costume2', 'Damaged', '\"\" costume damaged sprite'),
(294, 29, '/SV-98_(Censored).png', 'OfficialArt', '', '-', 'Base censored sprite'),
(295, 29, '/SV-98_D_(Censored).png', 'OfficialArt', '', '-', 'Base censored damaged sprite'),
(296, 29, '/SV-98_costume3_(Censored).png', 'OfficialArt', '', '-', 'Digimind Upgrade censored sprite'),
(297, 29, '/SV-98_costume3_D_(Censored).png', 'OfficialArt', '', '-', 'Digimind Upgrade censored damaged sprite'),
(298, 21, '/sprite.png', 'Sprite', 'Main', 'Regular', 'Base sprite'),
(299, 21, '/JS_9_D.png', 'Sprite', 'Main', 'Damaged', 'Base damaged sprite'),
(300, 21, '/JS_9_costume1.png', 'Sprite', 'Costume1', 'Regular', '\"Kerria\'s Intimacy\" costume sprite'),
(301, 21, '/JS_9_costume1_D.png', 'Sprite', 'Costume1', 'Damaged', '\"Kerria\'s Intimacy\" costume damaged sprite'),
(302, 21, '/JS_9_costume2.png', 'Sprite', 'Costume2', 'Regular', '\"Orca\'s Journey\" costume sprite'),
(303, 21, '/JS_9_costume2_D.png', 'Sprite', 'Costume2', 'Damaged', '\"Orca\'s Journey\" costume damaged sprite'),
(304, 21, '/CHARACTER_SETTINGS_JS_9.jpg', 'OfficialArt', '', '-', 'Official character card for JS 9'),
(305, 21, '/JS_9_D_(Censored).png', 'OfficialArt', '', '-', 'Base censored damaged sprite'),
(306, 21, '/Summer_With_Me_Login_Wallpaper.png', 'OfficialArt', '', '-', '\"Summer With Me\" login wallpaper'),
(307, 23, '/sprite.png', 'Sprite', 'Main', 'Regular', 'Base sprite'),
(308, 23, '/Saiga-12_D.png', 'Sprite', 'Main', 'Damaged', 'Base damaged sprite'),
(309, 23, '/Saiga-12_costume1.png', 'Sprite', 'Costume1', 'Regular', '\"Crimson Cruise\" costume sprite'),
(310, 23, '/Saiga-12_costume1_D.png', 'Sprite', 'Costume1', 'Damaged', '\"Crimson Cruise\" costume damaged sprite'),
(311, 23, '/Saiga-12_costume2.png', 'Sprite', 'Costume2', 'Regular', '\"Daylight Judge\" costume sprite'),
(312, 23, '/Saiga-12_costume2_D.png', 'Sprite', 'Costume2', 'Damaged', '\"Daylight Judge\" costume damaged sprite'),
(313, 23, '/Saiga-12_costume3.png', 'Sprite', 'Costume3', 'Regular', '\"Hundred Flowers Visitor\" costume sprite'),
(314, 23, '/Saiga-12_costume3_D.png', 'Sprite', 'Costume3', 'Damaged', '\"Hundred Flowers Visitor\" costume damaged sprite'),
(315, 23, '/CHARACTER_SETTINGS_SAIGA-12.jpg', 'OfficialArt', '', '-', 'Official character sheet of Saiga-12'),
(316, 23, '/Phantom_Racer_Login_Wallpaper.png', 'OfficialArt', '', '-', '\"Phantom Racer\" Login wallpaper illustrated by 水熊'),
(317, 23, '/First_Prayer_of_Spring_Login_Wallpaper.png', 'OfficialArt', '', '-', '\"First Prayer of Spring\" login wallpaper');

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `illustration_connections_tdolls`
--

CREATE TABLE `illustration_connections_tdolls` (
  `id` int(11) NOT NULL,
  `image_id` int(11) NOT NULL,
  `tdoll_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

--
-- Zrzut danych tabeli `illustration_connections_tdolls`
--

INSERT INTO `illustration_connections_tdolls` (`id`, `image_id`, `tdoll_id`) VALUES
(1, 4, 1),
(2, 5, 1),
(3, 6, 1),
(4, 7, 1),
(5, 8, 1),
(6, 9, 1),
(7, 10, 1),
(8, 11, 1),
(9, 12, 1),
(10, 13, 1),
(11, 14, 1),
(12, 15, 1),
(13, 16, 1);

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `illustration_table`
--

CREATE TABLE `illustration_table` (
  `id` int(11) NOT NULL,
  `image_src` varchar(120) COLLATE utf8mb4_bin NOT NULL,
  `description` text COLLATE utf8mb4_bin NOT NULL,
  `alt` text COLLATE utf8mb4_bin NOT NULL,
  `category` enum('Sprite','OfficialArt','UnofficialArt','Icon') COLLATE utf8mb4_bin NOT NULL,
  `sprite_type` enum('-','Regular','Damaged') COLLATE utf8mb4_bin NOT NULL,
  `sprite_set` varchar(20) COLLATE utf8mb4_bin NOT NULL,
  `sort_order` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

--
-- Zrzut danych tabeli `illustration_table`
--

INSERT INTO `illustration_table` (`id`, `image_src`, `description`, `alt`, `category`, `sprite_type`, `sprite_set`, `sort_order`) VALUES
(1, 'Icon_Skill_nightpowDebuff.png', 'Night Debuff Icon', 'icon repressenting night debuff skill.', 'Icon', '-', '', 0),
(2, 'Icon_Skill_Carcano1938.png', 'Carcano M91/38 Skill Icon', 'icon representing \'Mask of Hermes\' Carcano m91/38 skill', 'Icon', '-', '', 0),
(3, 'Icon_Skill_powBuffSelf.png', 'Selfbuff Icon', 'icon representing selfbuff skill', 'Icon', '-', '', 0),
(4, '__nagant_revolver_girls_frontline_drawn_by_matsuo_matuonoie__cf4c63a4460d4cdd9c33cf57d0f9e2fc.jpg', 'Illusration drawn by Matsuo Matuonoie', 'cute illustration nagant revolver with cat ears (make sure whot it is)', 'UnofficialArt', '-', '', 0),
(5, 'Nagant_Revolver.png', 'Basic sprite', 'basic nagant revolver sprite image', 'Sprite', 'Regular', 'Main', 0),
(6, 'Nagant_Revolver_D.png', 'Basic damaged sprite', 'basic nagant revolver damaged sprite image', 'Sprite', 'Damaged', 'Main', 1),
(7, 'Nagant_Revolver_costume1.png', 'Digimind Upgrade sprite', 'digimind upgrade nagant revolver damaged sprite', 'Sprite', 'Regular', 'MainMod', 2),
(8, 'Nagant_Revolver_costume1_D.png', 'Digimind Upgrade damaged sprite', 'digimind upgrade nagant revolver damaged sprite', 'Sprite', 'Damaged', 'MainMod', 3),
(9, 'Nagant_Revolver_costume2.png', '\"Starry Reins\" costume sprite', '\'Starry Reins\' nagant revolver costume sprite', 'OfficialArt', 'Regular', 'Costume1', 0),
(10, 'Nagant_Revolver_costume2_D.png', '\"Starry Reins\" costume damaged sprite', '\'Starry Reins\' nagant revolver costume damaged sprite', 'OfficialArt', 'Damaged', 'Costume1', 1),
(11, 'Nagant_Revolver_costume3.png', '\"Blushing Snow Princess\" costume sprite', '\'Blushing Snow Princess\' nagant revolver costume sprite', 'OfficialArt', 'Regular', 'Costume2', 2),
(12, 'Nagant_Revolver_costume3_D.png', '\"Blushing Snow Princess\" costume damaged sprite', '\'Blushing Snow Princess\' nagant revolver costume damaged sprite', 'OfficialArt', 'Regular', 'Costume2', 3),
(13, 'mosin_and_nagant1.png', 'Illustration of Mosin and Nagant', 'illustration of mosin and nagant revolver sitting together', 'UnofficialArt', '-', '', 2),
(14, 'mosin_and_nagant2.png', 'Illustration of Mosin and Nagant', 'illustration of mosin and nagant revolver', 'UnofficialArt', '-', '', 3),
(15, 'nagant_hat.png', 'Illustration of Nagant', 'illustration of nagant revolver with stuff in her hat', 'UnofficialArt', '-', '', 1),
(16, '0b55e2249d3f81f42ec306a4c7f1b2f9.jpg', 'Illustration of \"NKVD\" Nagant', 'illustration of nagant revolver in nkvd clothes', 'UnofficialArt', '-', '', 4);

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
(2, 2, 1),
(3, 3, 1);

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `sounds_table`
--

CREATE TABLE `sounds_table` (
  `id` int(11) NOT NULL,
  `sound_src` varchar(50) COLLATE utf8mb4_bin NOT NULL,
  `category` enum('general','combat','event','misc.') COLLATE utf8mb4_bin NOT NULL,
  `dialoge_name` varchar(50) COLLATE utf8mb4_bin NOT NULL,
  `text_JP` text COLLATE utf8mb4_bin NOT NULL,
  `translation` text COLLATE utf8mb4_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

--
-- Zrzut danych tabeli `sounds_table`
--

INSERT INTO `sounds_table` (`id`, `sound_src`, `category`, `dialoge_name`, `text_JP`, `translation`) VALUES
(1, '/Nagant_Revolver_Acqusition.mp3', 'general', 'Acqusition', 'こんな年寄りを好みとは、お主は相当な変わり者じゃな。', 'You\'re quite the odd one for having tastes in someone as old as I, aren\'t you?'),
(2, '/Nagant_Revolver_Secretary1.mp3', 'general', 'Secretary 1', 'わしの身長がそんなに気になるか、デリケートなことは聞かないでほしいの!', 'Are you curious about my height that much? Don\'t ask delicate stuff like that.'),
(3, '/Nagant_Revolver_Secretary2.mp3', 'general', 'Secretary 2', 'わしの頭を撫でるんじゃない!子供扱いされるのは…心外じゃ!', 'Don\'t pat my head so casually, how dare you to treat me like a child!');

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `tdolls`
--

CREATE TABLE `tdolls` (
  `id` int(11) NOT NULL,
  `game_id` int(11) NOT NULL,
  `name` varchar(50) COLLATE utf8_bin NOT NULL,
  `full_name` varchar(80) COLLATE utf8_bin NOT NULL,
  `short_description` text COLLATE utf8_bin NOT NULL,
  `description` mediumtext COLLATE utf8_bin NOT NULL,
  `skill_icon_id` int(11) NOT NULL,
  `skills_description` text COLLATE utf8_bin NOT NULL,
  `trivia` text COLLATE utf8_bin NOT NULL,
  `origin_country` varchar(50) COLLATE utf8_bin NOT NULL,
  `voice_actor_id` int(11) NOT NULL,
  `artist_id` int(11) NOT NULL,
  `star_rating` tinyint(1) NOT NULL,
  `type` enum('HG','AR','SMG','RF','MG','SG') COLLATE utf8_bin NOT NULL,
  `folder_name` varchar(16) COLLATE utf8_bin NOT NULL,
  `modded` tinyint(1) NOT NULL,
  `new_img_system` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Zrzut danych tabeli `tdolls`
--

INSERT INTO `tdolls` (`id`, `game_id`, `name`, `full_name`, `short_description`, `description`, `skill_icon_id`, `skills_description`, `trivia`, `origin_country`, `voice_actor_id`, `artist_id`, `star_rating`, `type`, `folder_name`, `modded`, `new_img_system`) VALUES
(1, 5, 'Nagant M1895', 'Nagant M1895 Revolver', 'Adorable, so-called \"Babushka gun\". Fhe very first tdoll every commander gets in game.', 'M1895, Nagant Revolver (Nagant), or “Babushka” is the first T-doll Commanders acquire and was frequently overlooked until the eventual shift to an MGSG meta.\r\n<br><br>\r\nNagant is known for her extremely powerful Damage tiles, rivaling dolls of much higher rarity, and her rare Crit Rate tiles. These buffs act in tandem with her tile layout to place Nagant as a buffer in Position 4. Ideally, this is between the MGs in 2MG echelons, but Nagant is not a poor choice for ARs and RFs in other compositions. The reason for the lack of her wide-spread usage is the fact that Nagant is not an offensive buffer, possessing instead a debuff that reduces enemy damage. This debuff gives Nagant some synergy and application when stacking Armor, though it’s Night Battle condition makes it less than viable during the day.\r\n<br>\r\nHowever, due to her powerful tiles and non-reliance on her Skill to contribute to an echelon\'s damage, Nagant is a good budget pick when short on Damage-buffing handguns. While Nagant will need to be raised from scratch, unlike SAA, she won\'t cost Commanders a single Core until the arrival of her Neural Upgrade.', 1, '<h4>Firepower Supression N</h4>\r\n<span class=\"cooldown\">12s cooldown, 6s initial cooldown</span>\r\n<br>\r\nDuring nighttime, decreases all enemies damage by 35% (20% during daytime) for 8 seconds (5 seconds during daytime).\r\n<br><br>\r\nTiles buffing Damage(32%) and Critical Rate(16%)', '• Speaks in an old, Russian accent.\r\n<br>\r\n• On the EN server version of Girls\' Frontline, this gun\'s name was changed to M1895, to avoid copyright issues.\r\n<br>\r\n• Nagant Revolver wanting to drink milk to grow taller is a stereotype popularized in anime, where female characters believe drinking milk will help their breasts grow larger.', 'Russian Empire', 1, 1, 2, 'HG', 'nagant', 1, 1),
(2, 198, 'Carcano M19/38', 'Fucile Corto Modello 1891/38 Carcano Infantry rifle', 'Purple Carcano sister. She will take care of Hydras and Gundams with ease.', 'The almighty Grape, Carcano M91/38. If you’re fortunate enough to have this 5★ RF in your arsenal, then you have yourself one of the most unrivalled and incredibly useful dolls in the entire game.\r\n<br><br>\r\nCarcano M91/38’s claim to fame is her skill, <b>Mask of Hermes</b>. This makes her perform a powerful attack when she reaches enough stacks, with every regular attack having a chance to gain two stacks and the active side of the skill instantly giving her the stacks she needs. This shot has a relatively low multiplier for elite enemies, but a massive multiplier for non-elites.\r\n<br>\r\nWhere Carcano M91/38 comes into her element is against dangerous high HP foes that become more and more frequent as time goes on. For fighting the likes of Doppelsöldners or Hydras for example, her ability to dispatch these foes almost as if they’re nothing is incredibly valuable. As long as you ensure it stops moving once, Carcano M91/38 can likely one shot it.\r\n<br>\r\nWhile Carcano M91/38’s niche is incredibly valuable, she’s not a great choice when it’s not as needed. She does have high Damage, but her low Rate of Fire and lack of self buffs makes her a poor choice as a generalist. You also need to watch out for some enemies which don’t lose elite status when they stop moving such as bosses, Uhlans, and Patrollers.\r\n<br><br>\r\nOverall, Carcano M91/38 is a doll everyone should aim to acquire and raise. She is niche, but that niche is required very frequently. Just make sure to stick this Grape to what she does best and you’ll soon wonder how you ever lived without her.', 2, '<h4>Mask of Hermes</h4>\r\n<span class=\"cooldown\">8s cooldown, 6s initial cooldown</span>\r\n<br>\r\n[Passive]: Attacks have a 70% chance to gain 2 stacks. When stacks reach 18, the next attack against an elite enemy will deal 300% damage (4500% damage against normal enemy) and will clear current stacks to 0. [Active]: Instantly gains 18 stacks.\r\n<br><br>\r\nTiles reducing RF skill cooldown by 10%', '• Lee Harvey Oswald would use an M91/38 fitted with a side mounted scope to assassinate U.S President John Kennedy in November, 1963.\r\n<br>\r\n• Not to be confused with RF Mosin-Nagant M91/30 because of same designation.\r\n<br>\r\n• The rifle\'s in-game designation should be M38 instead of M91/38, as the M91/38 was the revision that would change the M38\'s caliber from 7.35x51 back to the earlier 6.5x52 cartridge. A possible explanation for this choice of designation is that the SMG Beretta Model 38 already goes by M38 in-game.\r\n<br>\r\n• In the United States, Carcanos have a poor reputation for inaccuracy. This is however neither rooted within inherent deficiencies with the design of the projectile itself, nor with the rifle. Rather, it pertains with improper reloads. The diameter of the projectile itself is .300, while the most commonly utilized projectile for reloads is sized .308. Overpressure is generated as a result of a .308 bullet being sent down a .300 bore, which negatively affects the accuracy of the rifle. The M1891 suffers the opposite issue, namely that the projectiles used on reloading are too small for the bore of the rifle, which in turn leads to inconsistent rifling engagement and therefore affects accuracy negatively.\r\n<br>\r\n• The inaccuracy of hitting targets mostly came from the soft-round tip, as the prime itself is not couldn\'t resist air drag which greatly affect of the accuracy. Also, the prime would punch through bones upon contact instead tumbling like spitzer does, leaving grievous wound to the target.<br>* Carcano M91/38\'s front sight post was drawn upside down.', 'Kingdom of Italy', 2, 2, 5, 'RF', 'carcano', 0, 0),
(3, 64, 'G36', 'Heckler & Koch Gewehr 36 (HK50)', 'Very good general usage T-Doll. May be quite hard to obtain.', 'G36 is considered one of the premium 4 star ARs and the “budget” G41 due to her strong base stats, formation buff, and self Damage buff skill. The difficulty many players have obtaining her is befitting of her power level, as she can fit into just about any AR-based Echelon and put on an above-average performance. G36 does not fill any specific niche role, however, and therefore is sometimes outclassed by other T-Dolls in specific situations. Regardless, players should always consider G36 for leveling if they need a strong all-around damage dealer.', 3, '<h4>Damage Focus T</h4>\r\n<span class=\"cooldown\">16s cooldown, 4s initial cooldown</span>\r\n<br>\r\nIncreases damage by 70% for 10 seconds.\r\n<br><br>\r\nTiles buffing SMG Damage(30%) and Rate of Rire(10%)', '• G36 was (for some players, she still is) in fact the rarest craftable 4* AR doll in the game. Many players had almost full sets of 5* T-Dolls collected but had yet to unlock G36.\r\n<br>\r\n• Her artist Imoko also struggled to craft for her for a very long period of time. She even put out a wanted poster.\r\n<br>\r\n• G36 has unique idle animations in the dorm where she will stand and sit with both hands placed on her lap, imitating the archetypal maid posture.\r\n<br>\r\n• G36 currently holds the record for the highest amount of alternative arts (costumes and modified) amongst T-Dolls with 8 costumes total. This may be due to Imoko working directly with MICA\'s art department, her undying love for her daughter, or both.\r\n<br>\r\n• G36 is portrayed as having poor eyesight, often requiring glasses or squinting in order to see clearly. Imoko commented that she came up with this idea while researching the weapon\'s unique sighting system. The G36\'s hybrid optic provides different magnification levels, and rapidly switching between the two in actual combat may produce stress on operator\'s eye sights.\r\n<br>\r\n• At various points throughout the story, G36 has commented on her model being old and unable to dissipate body heat as effectively as the newer models, even breaking down during the summer heatwave on the beach. This is likely a reference to the controversy over the weapon\'s performance.\r\n<br>\r\n• The bayonet issued with the G36 is the AKM Type II bayonet, which were in service in the National People\'s Army of East Germany for their Kalash style service rifles. With the reunification of the nation, that stock of bladed weaponry found it\'s way into the newly merged Bundeswehr of the unified Germany.\r\n<br>\r\n• There are several different variant models of the G36, each designed to fill a unique combat role: the G36K (a carbine variant with a shorter barrel); the G36C ; and the MG36 (a light squad automatic weapon).', 'Germany', 4, 4, 4, 'AR', 'g36', 1, 0),
(4, 119, 'OTs-14 Groza', 'OTs-14 Groza (ОЦ-14 \"Гроза\")', '5 star AR...', 'OTs-14 “Groza” (Lightning) is a limited five-star Russian AR obtained by completing Operation Cube’s 4th map 15 times. Her unparalleled Damage self-buff in night battles that is further complemented by her strong stats is what earned her the “Night Queen” nickname in the community. Thanks to these factors, Groza is able to melt armored and unarmored enemies alike with graceful, speedy ease. Although her performance in Day battles pales in comparison to her performance in Night battles, don’t take that to mean Groza is anywhere near bad during daytime. She still carries a strong 70% Damage self-buff that allows her to deal respectable damage even then.', 0, 'Praca, praca...<br><br><br>Przykładowa kwestia:<br>さあ、そんなに緊張しないで。先ずはお茶でも一杯どう？', '* Groza appears as the poster girl for Girls\' Frontline 2: Exilium, and appears on the app icon for all versions of the game as well on official social media accounts. While she continues to use the same firearm, she no longer is addressed as \"OTs-14\" and now uses her actual name \"Groza\".<br>* Groza has unused animations for a grenade skill, similar to SMG IDW. Groza likely wielded a grenadier skill that was changed some time along her development.<br>  * Interestingly, Groza regains grenade skills in Girls\' Frontline 2: Exilium, as is showcased in the Gameplay Demo.', 'Russian Federation', 5, 5, 5, 'AR', 'groza', 0, 0),
(5, 148, 'IWS-2000', 'Steyr IWS 2000', 'To do, go somewhere else.', 'The Austrian five-star prototype RF IWS-2000 relies on slow but incredibly potent shots to take down enemies. Her Damage stat of 162 helps IWS take full advantage of the 180% Damage self-buff her Skill brings — and while the combination of these two qualities is enough to one-shot anything but bosses, it comes at a hefty price. IWS’ Skill also inflicts a 35% RoF debuff on her, which is the primary reason she underperforms as a general purpose RF when compared to M14 and Lee Enfield. Since IWS cannot reach the RoF cap, she is usually reserved for certain situations where the advantages of her unmatched firepower will outweigh the disadvantages of slow rate of fire. At the moment IWS-2000’s utility is limited as she will see no particular use until chapter 10 gives her a very special role as an Hydra hunter. Despite being usable as a conventional RF, she is outdone by her counterparts and there is no statistical reason as of now to recommend IWS-2000 over them.', 0, 'WIP<br><br><br>Przykładowa kwestia:<br>指揮官、何かお手伝えしましょうか？どんな仕事でもお任せてください。', '* Possesses an individual obtain rate lower than most T-dolls making her one the rarest T-Dolls currently craftable within her class.<br>* HG Contender, SMG P90 and MG Negev also share this trait of being the rarest craftable T-doll\'s within their respective classes.<br>* Upon skill activation and throughout her skill duration, all of IWS\'s shots will give off the same sound effects as Charged shots RF\'s when they fire off their skills. Additionally, she will actively retarget to the furthest enemy within range while her skill is active.', 'Austria', 6, 6, 5, 'RF', 'iws2000', 0, 0),
(6, 37, 'M14', 'United States Rifle, 7.62 mm, M14', 'Very good RF T-doll.', 'M14 is a strong all-purpose RF who should not be overlooked due to her 3 star rarity.  Despite her low base damage, M14’s DPS potential is greater than that of most other low-rarity RFs due to her high ROF cap and Damage Focus skill. Players who need a low budget and flexible RF should look to M14 first to fill an RF spot in their Echelons.<br><br>---<br><br>M14 lives up to her affectionate moniker of War Goddess after her Mod, adding to her excellent base RoF, gaining base Damage, and a pure DPS boost in her secondary Skill. Given her already fantastic combat ability, M14’s neural upgrade could only improve it further, and she does not disappoint.<br>After the neural upgrade, M14 approaches Lee-Enfield in raw DPS, leaving G28 in the dust. M14 Mod’s weak point remains her base Damage, even after the increase from MOD III. While M14 may occasionally take one extra shot to kill enemies compared to Lee-Enfield due to her lower Damage, M14 Mod’s excellent Rate of Fire keeps her DPS fantastic and she will definitely perform well for Commanders who can afford her neural upgrade.', 0, 'Under construction<br><br><br>Przykładowa kwestia:<br>只今戻りました，指揮官。', '* With decent stats and a high rate of fire, M14 is regarded as one of the best rifles in the game. Players can obtain her when reaching level 40, which also makes her very new-player-friendly.\r\nShe is also a reward for the \'7 Days Frontline\' log-in event for new players, making her easily accessible even before level 40.<br>* Due to her performance in game, M14 has affectionately been nicknamed the \"War Goddess\" by the GFL community, especially after her Digimind upgrade.<br>* The M14 has become a popular and familiar sight in American media. The rifle received a lot of screentime and attention in the Vietnam War movie Full Metal Jacket. During the film, Pvt. Leonard \'Pyle\' Lawrence (played by Vincent D\'Onofrio) has a mental breakdown and shoots his drill instructor Sergeant Hartman (played by Lee Ermey) with an M14, afterwards proceeding to shoot himself in the head.\r\nThis action is typically called \'Fragging\', and was often executed with a frag grenade instead of a rifle.', 'United States', 7, 7, 3, 'RF', 'm14', 1, 0),
(7, 154, 'M500', 'Mossberg 500', 'Doggo, description to do!', 'Often seen as essentially being IDW 2.0, M500 is a Shotgun who seems to be designed around being used in a 2SG Echelon.<br>M500’s tanking capabilities are mediocre at best. Although she has an above average HP stat, her Armor -- the most important stat to an SG -- is below average, clocking in at 21. So while she can be used on her own as a tank, she’s outperformed by other SGs who excel at solo tanking. Another problem with using M500 by herself is her buff tile orientation. Although her 18% Damage tile buff is potent, her tiles are placed in a way that she buffs from the corner, not the center. Therefore, if she is used by herself as the centermost tank, one of her tiles go to waste. For these reason, she’s best used in a 2SG Echelon, which unto itself has a few inefficiencies when compared to its 1SG counterpart. That isn’t to say that M500 is unusable, though -- she’s good, not great, which is similar to many other T-Dolls in her class.', 0, 'To do, to do<br><br><br>Przykładowa kwestia:<br>度したの、指揮官？私を見たらもっと喜びだよ！', '* Mossberg 500 family also includes SG M590. The weapon designs are extremely similar to each other.<br>* She is sometimes called \"American IDW\" due to being a common SG drop from LSC/HP as well as possessing the same artist as IDW.<br>* M500 found Stick as a puppy in a forest, which later she adopt.', 'United States', 9, 9, 3, 'SG', 'm500', 1, 0),
(8, 8, 'Makarov', 'Pistolet Makarova', 'To do, to do...', 'Makarov is a flexible HG that sees use because of her Skill and tile buff. Makarov’s RoF and Damage buff tiles means that she’s an excellent fit in both HGRF and ARSMG Echelons -- she is able to provide a compromise between the ARSMG Echelon’s need for Damage buffs and HGRF Echelon’s need for RoF buffs. In addition, Makarov has a utility Skill which decreases enemy Accuracy. The lack of specialization in one particular kind of buff allows her to be used in ARSMG and HGRF Echelons instead of just one, and the general utility this Skill offers is hard to be matched by most HGs. It is the combination of these qualities that makes Makarov so versatile, and further adds to her usefulness through a sum of her parts.', 0, '...<br><br><br>Przykładowa kwestia:<br>指揮官様が命令するより、合わせてくれた方がいいわ、私にね。', '* The Pistolet Beshumnyy (PB) was based on the Makarov pistol, and featured an integral suppressor. It was only used by the KGB and other Soviet clandestine organisations.<br>* The name of Makarov\'s wedding dress skin is a to reference the anime \'A Certain Scientific Railgun\'.', 'Soviet Union', 10, 11, 3, 'HG', 'makarow', 1, 0),
(9, 39, 'Mosin-Nagant', 'Mosin–Nagant M1891/30', 'Still to do. Pretty.', 'Mosin-Nagant is a craftable four-star Russian RF who, like all charged shot RF, abides by the ‘one shot, one kill’ motto. What sets Mosin-Nagant apart from the rest of the charged shot RFs is her relatively low initial Skill cooldown of 10 seconds — one of the lowest available cooldowns for a charged shot Skill. Although the price to pay for a shorter cooldown is a lower Damage modifier, this does not hinder Mosin’s ability to perform her role at all. Beware though, that just because Mosin-Nagant is more effective than her counterparts at the boss-killing niche it does not mean that she is any less situational. Therefore, prioritizing Mosin over all-rounder RFs such as M14, SVD, and WA2000 is not recommended.', 0, 'TODO<br><br><br>Przykładowa kwestia:<br>хорошо！私に任せて！', '* Mosin\'s default skin has her wielding an \"ex-sniper\" M91/30, whereas the \'Luna Sea\' skin features a scoped PU M91/30 sniper model. These rifles were handpicked for use by snipers, and had an angled bolt handle to accommodate for the added optic.<br>* Simo Häyhä, a Finnish sniper who came to be known as the \'White Death\', scored the highest confirmed sniper kill count in history with 505 kills to his name using a Finnish manufactured Mosin variant, the M/28-30. Unlike other snipers, Häyhä preferred iron sights over using an optic, as sunlight would reflect off the glass of the scope and give away his position.<br>* During World War I and the Russian Civil War, there was a demand for smaller, easily-concealed firearms. To meet this demand, Russian troops and partisans would shorten Mosin rifles, cutting down the stock and barrel. This configuration would be dubbed the \"Obrez\".<br>* In order to prevent the parts from freezing, sometimes Soviet Infantry mixed gun oil and gasoline to lubricate the various components of the gun.<br>* The Dyakonov grenade launcher was an interesting attachment for the Mosin Rifle produced in 1942. Rather using a blank round to ignite a primer, it can be launched by a live round as the primer itself has a hollow for the live rounds to exit from. The Dyakonov attachment for the Mosin was still used after WWII.<br>* During the April Fool\'s update, MICA Team gave Mosin-Nagant an update where she rides a horse in her in-game sprite. This is NOT A PERMANENT CHANGE and will usually revert back to normal in a later update.<br>* This is reference to the rifle\'s use during the Russian Civil War, where riflemen mounted on horses (also known as \'dragoons\') were fielded extensively in cavalry divisions on both sides. Even after mechanized corps entered widespread service in World War II, traditional cavalry units were still used in limited cases to flank, harass, and break through enemy lines.\r\nEthnic Cossack traditions are steeped in extensive use of and familiarity with horses. With the outbreak of war, this proficiency with equestrian skills lent itself to easy adaptation into a competent cavalry force.<br>* During World War II, many Soviet sharpshooters utilized explosive-filled 7.62x54 PZ bullets which were designed for use with aircraft armaments. The usage of these rounds against infantry units is prohibited by Geneva Convention rules.\r\nPZ bullets were responsible for destroying half of Simo Häyhä\'s left cheek.<br>* The Mosin-Nagant has very mixed reviews among the gun community (especially the models from WW2), mostly due to its \"random quality\". One Mosin rifle couldn\'t hit a target at around 200 meters, while the other Mosin rifle can hit the target that\'s 800 meters away with ease.<br>* This is mostly due to an individual rifle\'s manufacturer and the time it was produced. For example, let\'s say you have a Mosin-Nagant that was produced by Izhevsk during World War 2. That rifle would have a 50/50 chance of being good or being bad, due to Izhevsk having to produce a massive amount of rifles in very short order, as well as move production to a new factory to avoid the oncoming German army. Meanwhile, Mosin-Nagants that were produced by Remingtion or Izhevsk during the pre-war years are usually better in terms of quality than the ones produced in war time. This also extends to the Finnish manufacturers like SAKO, who made excellent Mosin rifles during World War 2.<br>* Another reason for the Mosin\'s reputation of inconsistent accuracy is that Mosin-Nagants had their sights zeroed with the bayonet affixed, as Russian combat doctrine at the time mandated that the bayonet remain attached to the rifle at all times. As a result, the sights on a Mosin rifle may be off to one side.', 'Russian Empire', 10, 10, 4, 'RF', 'mosin', 1, 0),
(10, 21, 'PPSh-41', 'Pistolet-pulemyot Shpagina 41', 'To do, to do!', 'Wikipedia entry about real PPSh-41 submachine gun:<br><br>The PPSh-41 (Russian: Пистолет-пулемёт Шпагина, or Pistolet-Pulemyot Shpagina; translating to \'Shpagin\'s Machine Pistol\') is a magazine-fed selective fire submachine gun designed in the Soviet Union by Georgi Shpagin. It was designed in 1941, and was designed as a cheap, reliable, and simplified alternative to the PPD-40 submachine gun. A common Russian nickname for the weapon is \'Papasha\' (папа́ша), meaning \'daddy\', and it was sometimes called the \'burp gun\' because of its high fire rate. It was one of the major infantry weapons of the Soviet Armed Forces during World War II, with about six million PPSh-41s manufactured over the course of the conflict.', 0, 'URA!<br><br><br>Przykładowa kwestia:<br>ウ、ウラー！', '* During WWII, the Soviet Union designed a night vision device that could be mounted on the PPSh-41. In order for the device to work, the target needed to be exposed by a separate IR Illuminator. It should be noted that this was the first Soviet night vision device ever made for an infantry weapon, and was preceded by a prototype for tank driver use.<br>* The walls of early version 71-round drum magazines for the PPSh-41 were only 0.5mm thick, thus making them very vulnerable to damage and subsequent malfunction. Because of this issue, many soldiers during the war preferred the 35-round stick magazines because of their reliability.<br>* Soviet engineers experimented with using the PPSh-41 as an aircraft weapon, fitting 88 PPSh-41s loaded with incendiary P-41 rounds in the bomb bay of a Tu-2 bomber. This experimental bomber was designated the \'Tu-2Sh\'. The PPSh-41 battery itself was intended for anti-infantry use. Though fascinating on paper, the Tu-2Sh failed to gain traction, as the plane would have had to be flown abnormally low in order for the PPSh battery to be effective, making it an easy target for enemy AA. Furthermore, reloading 88 submachine guns was wildly impractical and malfunctions were likely to occur.<br>* During WWII, German forces looted PPSh-41s from Soviets and re-chambered the weapons for 9mm Luger. To convert the weapon, the barrel had to be replaced and a magazine well adapter added to allow the use of MP 40 magazines. The official German designation for this weapon is MP 41(r).\r\nAlso, some captured PPSh-41s were not converted for 9mm, but were still used by German Forces under the designation MP 717(r). The non-converted weapons were useable because the PPSh, chambered for 7.62x25 Tokarev, can be loaded with 7.63x25mm Mauser and still perform well.\r\nJokingly blamed by the community for server problems due to a fan comic featuring her destroying the server rooms in an accident.<br>* Seems to be bothered by her weight (the PPSh-41 weighs around 5.45kg/12lbs fully loaded, heavier than many full-powered rifles).<br>* PPSh-41 controls the construction robot when upgrading the dormitory.<br>* Is the older sister of SMG PPS-43.', 'Soviet Union', 10, 12, 2, 'SMG', 'ppsh41', 0, 0),
(11, 27, 'Skorpion vz61', 'Škorpion vz. 61', 'Cool SMG T-doll. Better description still in progress.', 'Skorpion is a high Evasion offtank SMG who relies on her Incendiary Grenade to deal a high amount of AOE damage. Her high Evasion does allow her to tank to a mediocre degree, but her very low HP and offensive skill prevents her from being as effective of a Main Tank as she could be.<br>Skorpion’s poor Tile buff coverage also makes her less appealing as a Main Tank, as its distribution means she is unable to buff multiple ARs at once. That isn’t to say, however, that she is unable to compensate for her weaknesses. Although Skorpion’s base Damage stat is low, the high Damage multiplier on her Skill, Incendiary Grenade, improves her total DPS significantly. This skill is perfect for her recommended Offtank role, as the skill allows her to deal significant AOE damage in a battle.<br>In conclusion, Skorpion is often an excellent Offtank choice for new players building AR/SMG Echelons due to the ease of obtaining her and her high AOE damage. Despite her merits, though, her ability to output damage falls off significantly late game due to her low max Damage stat. Nevertheless, Skorpion still remains one of the best choices for a budget SMG offtank.', 0, 'There will be something here<br><br><br>Przykładowa kwestia:<br>スコーピオンって、かっこいい響きだよね。', '* Miroslav Rybář actually wrote his doctoral thesis on the Skorpion, and successfully defended it at the Military Technical Academy in Brno.<br>* One of the other engineers on the project, Otakar Galaš, wore a Skorpion hidden out of sight in a shoulder rig beneath his suit jacket during meetings. Then, he would suddenly open his jacket and draw the pistol, thus demonstrating just how concealable it was.<br>* The Skorpion was used by members of the Italian Red Brigade to murder Italian Prime Minister and Statesman Aldo Moro.<br>* Skorpion\'s hair accessory resembles her weapon\'s metal butt stock.<br>* Despite being a side character, Skorpion has been featured prominently in promotional materials. She stars as a co-host in the tutorial series released for the JP region of the game, and has additional scenes in the manhua adaptation.<br>* In the manhua adaptation, it is revealed that Skorpion\'s eyepatch is actually a data scanner that is capable of storing a T-Doll\'s memories for backup in the event that they are destroyed.<br>* Given the caliber of her unique equipment, it appears that Skorpion is using the vz. 64 variant chambered in .380 ACP.', 'Czechoslovakia', 11, 3, 3, 'SMG', 'skorpion', 0, 0),
(12, 36, 'Springfield m1903', 'United States Rifle, Caliber .30-06, Model of 1903', 'Cafeteria T-doll.', 'At first glance, Springfield is just another RF with average stats and a charged shot skill. After taking another look, however, Springfield has a distinct advantage over the other charged shot RFs: her unique Equipment. Although it may require a hard grind to obtain, Springfield’s unique AP Ammo puts her a step ahead of similar RFs, making her a somewhat compelling choice for night battle Echelons.<br><br>Autor oficjalnych ilustracji 河马/HIPPOs', 0, 'Are you tea or coffe person?<br><br><br>Przykładowa kwestia:<br>指揮官様が命令するより、合わせてくれた方がいいわ、私にね。', '* With her housewife demeanor and kind personality, community nicknames for Springfield include \"Raifu\" (a combination of the words \'rifle\' and \'waifu\'), and \"Mom-field\".<br>* During World War 1, Springfield Armory would release the M1903 Springfield Mk. 1. This version of the rifle featured some modifications to the sear and other internals, as well as a slot cut into the left-hand side of the receiver. This slot was meant to act as an ejection port for the Pedersen Device, a specialized insert that replaced the bolt and allowed the user to fire .30 caliber pistol cartridges semi-automatically from a 40-round detachable magazine. The magazine itself is placed diagonally to the right of the receiver. The war ended before the Pedersen Device could be delivered to American armies in Europe, and the devices were mothballed until the order was given for their destruction. As a result, very few survive today.<br>* The M1903 Springfield \'Air Service\' model was introduced in response to the US Army Air Service\'s request for a backup weapon that could be used in case of machine gun failure in the midst of an aerial engagement. Being a cut-down M1903 equipped with a 25-round magazine and modified sights, historians have often erroneously referred to the rifle as a \"survival\" rifle. Recent archival digging has revealed its true purpose as a backup weapon in aerial combat, though the pilots and/or their rear-gunners would have preferred to see something along the lines of a semi-auto sporting rifle from the time such as a Remington Model 8.<br>* Originally, Springfield was the first payment award on CN/TW/KR server. With the First Payment award change on July 2018, Springfield is no longer the reward T-doll and cannot be obtained this way.', 'United States', 12, 13, 4, 'RF', 'springfield', 0, 0),
(13, 29, 'Sten MkII', 'STEN', 'T-doll in red :)', 'STEN is an SMG with a high amount of Evasion and a fair amount of HP. Although her tanking stats are comparable to some of the best tanks in the game, her lackluster skill and tile buffs often weigh her down in the late game. STEN’s purely offensive skill, Hand Grenade, is what makes her sub-optimal as a tank in the mid-to-late game. The skill may deal a good amount of AOE damage in the early game, but its value drops off significantly as the game progresses due to negative synergy with her stats and role as a tank. While STEN may not be the optimal choice for an late-game tank, she is often utilized by newer players due to her well distributed stats and easiness to obtain. Because of her flexibility and availability, STEN can act as the budget tank to any early-game AR/SMG Echelon.', 0, 'Waiting for description<br><br><br>Przykładowa kwestia:<br>Mark II、行ってきま～す。', '* The Sten gun first saw action in the Dieppe raid with Canadian Forces. Weeks prior to the raid, the first issuing of the Sten gun to the Dieppe Raiders occurred, and during the weeks leading up to the raid the Canadians spent the time fixing, filing, and adjusting their weapons\' to fix faults, making them somewhat decent and fully battle-worthy guns. However, when the raid was first cancelled in July, the Canadians\' modified STENs were withdrawn. When the raid was later remounted, the Canadian forces received new Sten guns, crated and packed in grease, which were very much useless as they had their very common manufacturing defects which the Canadians had corrected weeks prior to their previously issued guns. This obviously disgusted many of the troops. The Dieppe raid in the end was a catastrophic failure, seeing 3.6 thousand of the 6000 predominantly Canadian soldiers being killed, wounded, or captured due to extremely poor British leadership.<br>* As a reference to a joke told by Allied troops regarding the Sten\'s tendency to accidentally discharge when dropped, one of the official 4Coma comics of Girls\' Frontline drawn by AC-130 depicts RF Lee-Enfield throwing Sten\'s weapon like a grenade at a group of enemy patrols to drive them away.<br>* The Sten Mk. II was one of the weapons used by Jozef Gabčík, the leader of the Czechoslovakian SOE team tasked with assassinating SS-Obergruppenführer Reinhard Heydrich. Unfortunately, in line with the STEN\'s famous unreliability issues, the firearm jammed. Seeing this, anoher member of the group, Jan Kubiš, proceeded to toss a modified Anti-Tank grenade into Heydrich\'s car after Heydrich ordered the driver to stop so he could shoot Gabčík. The resulting explosion severely injured Heydrich, and several months later caused him to enter a coma he never awoke from. Both Gabčík and Kubiš later died after a 6 hour long gunfight against the SS at a cathedral in Prague along with the rest of the paratrooper team that was inserted by the SOE.<br>* Sten\'s in-game skill, a hand grenade, is a tribute to Jozef Gabčík and Jan Kubiš\' actions during the war.<br>* Captured Sten Mk. II submachine guns were redesigned by the Germans, and designated the MP 3008(or Gerät Neumünster). The MP 3008 shared the same receiver design as the Sten, but changed the location of the magazine. The MP 3008 was used by the Fallschirmjägers(German paratroopers) and the Volksturm because of its reliability and cheaper maintenance cost than its counterparts, the MP 40.<br>* Following her neural upgrade, Sten switches to using a Mk.IIS, an integrally suppressed version of the Sten produced at the request of the Special Operations Executive (SOE) for use in clandestine operations in occupied Europe.', 'United Kingdom', 13, 14, 3, 'SMG', 'sten', 1, 0),
(14, 115, 'Suomi', 'Suomi-KonePistooli 1931', 'T-Folls from finland.', 'Suomi is subpar in almost every possible way, making for a very disappointing unit. She does have some use as a tank against bosses, however, meaning she isn’t completely irredeemable.<br>Suomi’s kit is all around mediocre for several reasons. While her high HP is a good quality for a tank to have, her low Evasion means she won’t be dodging many attacks. This further affects her Skill, which buffs her low Evasion after a whopping 6 second initial cooldown, all but guaranteeing she’ll be hit hard before her Skill even activates. When combined with subpar buff tiles, the result is an all-around lackluster kit that doesn’t excel in most situations particularly well. The sole exception to this is boss tanking, as Suomi’s high HP and Skill allow her to absorb a lot of damage while dodging most attacks – assuming she survives 6 seconds into the battle.', 0, 'To do, to do...<br><br><br>Przykładowa kwestia:<br>ルールは破るものです！', '* During Continuation War, Finnish soldier once modified the Kp/-31 by attaching the underbarrel flamethrower which known as flamethrower m/44, designed by Sgt. M. Kuusinen on spring 1944. However, the effective range of the M/44 flamethrower is only 12-15 meters, making it less effective than regular flamethrower. Instead of the positive review regarding underslung flamethrower, the device has suffered major problems: The igniting system was ineffective and couldn\'t work properly in windy condition, as they used feather-like rope for igniter and manually igniting it. The Device itself was used during attack of Kagrakangas at August 16th, 1944 by the Engineer Battalion 35. While the device itself was scrapped or destroyed post-WWII, some of them was still used by Finnish Border Guards until 1970.<br>* Some of improvement of Device M/44 was include a switch that automatically extinguish flame if the operator was badly injured or killed, thus minimising the risk of exploding fuel tank.<br>* To celebrate Suomi receiving a voice actress, Anmi drew a special image of Suomi holding a microphone. This is likely to represent Suomi\'s personal interest in music and/or the CV\'s fame in her music making career (see \"Gallery\" above). Suomi\'s voice actress, Toyosaki Aki, is well known for her performance as the CV of Hirasawa Yui of K-On!. In addition to her work on music anime, Toyosaki has also had several original songs released as singles and albums.\r\nA Suomi KP/-31 was used as a backup weapon by famous Finnish sniper Simo Häyhä during the Winter War.<br>* When firing, Suomi\'s chibi sprite is shown gripping the magazine like a foregrip. This isn\'t realistically possible, since Suomi uses 71-round drums in her weapon (as shown in her default art).', 'Finland', 14, 17, 5, 'SMG', 'suomi', 0, 0),
(15, 103, 'UMP 45', 'Universale Maschinenpistole .45 ACP', 'error 404', 'UMP45 is, if not the best, one of the best SMG tanks ingame. This is attributed to two unique qualities -- first, her skill, and second, her buff tiles. UMP45’s skill, Smoke Grenade, is a smokescreen which debuffs enemy RoF and movement speed after an initial cooldown of only 1 second. This not only helps her tank, but also prevents UMP45 from being rushed and overwhelmed by making enemies approach in a slower manner. Her buff tiles provide boosts to an AR’s Damage and Crit Rate, both of which any AR will appreciate. If there was one thing to nitpick about UMP45, though, it would have to be her health, which is only average at 185 per Dummy. It is important to note, however, that average by no means is subpar. Overall, UMP45 is an extremely strong tank that would be a good fit for almost any Echelon.', 0, 'To do ^^<br><br><br>Przykładowa kwestia:<br>もう少し長生きしてよね。', '* The \"Winter Journey\" Costume for UMP45 is an exclusive costume to those who purchased the same jacket from the official shop and redeemed the special code that came with it.<br>* This makes UMP45 the third T-Doll to receive a merchandise-exclusive costume, the other three being RF SV-98, SG SPAS-12 and AR AK-12.', 'Germany', 15, 16, 4, 'SMG', 'ump45', 1, 0),
(16, 20, 'Vector', 'KRISS Vector', 'Very serious T-doll....', 'Vector is a well-rounded unit who can fit into just about any Echelon formation looking for an offensive SMG. She boasts some of the best overall parameters among SMGs, providing durability while also outputting a good amount of damage with her Incendiary Grenade skill.<br>Vector’s main shortcoming is her lack of any significant teamwide defensive utility, due to the single-space ROF formation buff she offers and her offensive active skill. However, the damage output from her skill more than makes up the difference by creating shorter battles in which Vector and her allies suffer less damage.', 0, 'To do...<br><br><br>Przykładowa kwestia:<br>ただの命令なだけだよ。', '* The Vector model used in-game is the Gen I prototype Vector SMG.<br>* The Division collab exclusive costumes for AR HK416, SMG Vector, AR Agent 416, SMG Agent Vector can only be obtained via in-game purchases using real money. Each costume can be found in Kalina\'s shop for 158 yuan.', 'United States', 3, 3, 5, 'SMG', 'vector', 0, 0),
(17, 284, 'Zas M76', 'Zastava M76', 'Just another t-doll', 'Here we are, talking about 3★ rifles, the saddest part of the game. Unfortunately, Zas M76 isn’t an exception in this cursed land, but does she have some things that could make her interesting at one point ? Let’s find out together, shall we?<br>Her Skill, <b>Assault Focus</b>, is pretty common in the game, in fact, she shares that skill with no less than 8 other dolls. Even when we give an interest to her skill multiplier, unfortunately, she’s getting outclassed or is equal to most of her competitors. Even stat-wise, Zas M76 fails to prove that she’s worth the investment.<br>However, as a login reward, Zas M76 can be a <b>good choice for beginners</b> that want to clear night maps. But once you’ll get some 4★ or 5★, she’ll be heavily outclassed, and will just end up rotting in your armory.', 0, 'Temporary<br><br><br>Przykładowa kwestia:<br>始めまして、Zastava M76です。Dragunovより私の方がずっと優秀　言うこと証明して見せます。期待しててください。', '* no triva... ;(', 'Yogoslavia', 16, 18, 3, 'RF', 'zas76', 0, 0),
(18, 285, 'C-93', 'Borchardt C-93', 'Veeeeery long skill description', 'With the introduction of C-93, Girls\' Frontline skill descriptions have reached lengths never before thought possible and are now giving even the most verbose MTG cards a run for their money. Fortunately, it\'s not nearly as complicated as it may appear at first glance.<br>• In practice, you can treat C-93 as a hybrid Damage/RoF buffer HG who\'s a little worse than Grizzly normally but around or above the level of SAA Mod if properly supported. (We don\'t talk about her stealth bomber-shaped tile buff.)<br><br>So what does \"properly supported\" mean? C-93\'s passive will proc whenever your units are debuffed. There are some fairly reliable ways to debuff yourself (excluding debuffs that are very debilitating or those that on dolls who don\'t benefit from C-93\'s RoF buffs like AUG):<br>• Anna Graem\'s Active Skill<br>• Px4 Storm\'s Active Skill<br>• Preiya and Camilla\'s Active Skill<br>• Dorothy\'s same-column skill effects<br>• M4A1Mod, K31, and IWS 2000\'s Active Skills<br><br>C-93\'s full potential is easy to bring out with either Anna Graem or Px4 Storm - both affect the entire team and the debuffs largely don\'t matter or are easy to counteract. While you can theoretically use her with M4A1Mod or IWS2000, this isn\'t necessarily the best idea since there are other dolls that provide better support than C-93 in that type of \"double jupiter\" team.', 0, 'WIP!<br><br><br>Przykładowa kwestia:<br>じゃんじゃん！Borchardtピストル、入隊します！うわあ、あたし知ってる！あんたは有名人だよね？ここ「」チャンスが沢山ありそう！', '• Longest skill description.', 'German Empire', 17, 19, 5, 'HG', 'c93', 0, 0),
(19, 270, '4 Shiki', 'Type 4 Rifle', 'Cute drawing t-doll', '4 Shiki (also known as Type 4) is a fairly standard self-buff RF who also procs a sure-hit piercing shot every three attacks.<br>This special piercing bullet cannot crit and deals 1x damage.<br>Against a single target, 4 Shiki\'s damage output will typically not be as high as other self-buffing RFs like SVD or WA2000. Nevertheless, 4 Shiki\'s passive is incredibly powerful against dense enemy packs, especially those with non-zero Evasion. What\'s not to love about AoE damage that can\'t miss?<br>Due to the upcoming introduction of SWAP Sangvis Ferri units in Isomer and the addition of Evasion stat to Paradeus Doppelsoldners and Uhlans, Type 4 becomes one of the few reliable RF options for dealing with them at night alongside QBU-88 and Carcano M91/38.<br><br>Twórca oficjalnych ilustracji: 藤ちょこ', 0, 'To draw. I mean to write.<br><br><br>Przykładowa kwestia:<br>四式自動小銃、ただいま入隊したのであります！御用の「」何なりと思いつけください！', '* During Type 4\'s initial release, She had an incorrect construction timer which was 4:15:00. This was fixed in a later update.<br>* Secretly admiring the Commander, and even made the Commander the main character of her serialized shoujo manga.<br>* Has an anxiety of being retired and sent to coal mines every time she made a mistake.', 'Japan', 18, 20, 4, 'RF', '4shiki', 0, 0),
(20, 223, 'Model L', 'CETME Model L', 'One more t-doll.', 'The Model L is a 3★ AR login reward given to GFL players during the April 2020 special login event.<br>Model L has a decent offensive tile buff for offtank SMGs, giving 15% Damage and 25% Accuracy. Her skill, Lock-on Focus, buffs both Rate of Fire and Accuracy at the cost of reduced multipliers.<br>While this type of skill works fine for RFs like T-5000 who need the accuracy if fighting evasive enemies at night, this niche sadly doesn\'t work as well for ARs.<br>Model L\'s overall DPS falls flat compared to higher-rarity selfbuffers, but her decent base stats compensate somewhat and puts her overall DPS at a level comparable to that of FNC, at least when fighting against unarmored enemies.', 0, 'Work, work, work...', '* No trivia yet.', 'Spain', 19, 1, 3, 'AR', 'modell', 0, 0),
(21, 234, 'JS 9', 'JianShe 9mm SMG', '5 star t-doll', 'JS 9 is an evasion tank first acquired in the Springtime Operation Point Event that has buff tiles perfect for an offtank position but serving as a good main evasion tank in role. She is suitable for a main tank position as well, although her tile buff will not cover the AR in position 7 when used as a main tank.\r\n<br>JS 9 has slightly below average base HP, but makes up for it with one of the highest base evasion stats for an SMG. With a +30% crit rate and +18% rate of fire tile buff that can buff all 3 ARs from an offtank position, she has one of the best off tank tile buffs in the game.\r\n<br>JS 9\'s skill is rather unique, buffing her damage and/or evasion based on the number of enemy groups at the time of skill activation. <br>The way it works is, with 1 group of enemies left, she will have 3 stacks of damage buff, which are multiplicative. With 3 stacks, her skill gives a 337.5% multiplier to her damage for 5 seconds. (150% * 150% * 150% = 337.5%).<br>Her damage buff with 3 stacks is pretty high, almost matching that of SR-3MP. Nevertheless, with a skill ICD of 6 seconds, we would advise against thinking of JS 9 as a DPS SMG.<br>For every additional group of enemies left on skill activation, she instead gets 1 fewer stack of damage and 1 additional stack of evasion, up to 6 stacks of evasion for 7 groups of enemies. With 3 groups of enemies, she will have 1 stack of damage and 2 stacks of evasion.<br>At 4 groups of enemies, she has 3 stacks of evasion buff = 246% multiplier. With 86 base evasion and 35 more from a maxed T-Exo, this puts her at over 300 Evasion. (86 + 35 = 121, 121 * 2.46 = 298, plus 5%+ affection bonus). This puts her EVA above MP7\'s, who has one of the strongest EVA skills in the game.<br>Overall, JS9 is well suited for tanking in fights where her ICD isn\'t a problem, as she can achieve the highest Evasion in the game with enough stacks on her skill.', 0, '.....................<br><br><br><br><br>..', '* Despite the cutout for the weapon\'s charging handle being drawn in the correct place in JS 9\'s default art, the charging handle itself appears to be missing. This is likely a simple mistake on the part of the artist, who did a fantastic job of ensuring that all the proper details of the weapon were present in her CG art.<br>* The T-Doll in game should actually be named CS/LS2, as the weapon seen in the Doll\'s default art is based on the final production model rather than any of the prototypes.<br>* On CN servers, JS 9 was originally supposed to be granted to players after matching 8 lines during the \"Mid Autumn Guardian\" event on the 22nd of September 2018 through 12th October 2018. However, due to server instability, the event itself was cancelled on the 23rd of September 2018. JS 9 and all event related rewards were given out to players via a daily login reward type system between October 3rd and October 23rd 2018 instead.', 'People\'s Republic of China', 20, 10, 5, 'SMG', 'js9', 0, 0),
(22, 276, 'Kord', 'Kord-12.7mm Heavy MG', 'Mob cleaner.', 'Description to do!\r\nKord as a T-Doll is having a difficult time turning down requests, even the most outrageous ones, she can be easily irritated by the smallest mistakes in daily life and continues to talk about it. Facing the daily stress, she prefers to hold it in and keep on smiling, however she will take her anger out on her enemies.', 0, 'TO DO', '* Nothing here....', 'Russian Federation', 21, 21, 5, 'MG', 'kord', 0, 0),
(23, 160, 'Saiga-12', 'Saiga-12', 'Russian shotgun', 'Saiga-12 is another offensively oriented SG. While her defensive stats include an above average 23 Armor and 1320 HP, her 29 Damage sits at the lower end of SGs, an unfortunate but minor drawback considering her damage-oriented Skill.<br>Backing up those numbers are Saiga’s Buff Tiles, covering the entire back row for 15% Damage. While not the highest possible Damage buff from an SG, Saiga’s Tiles are far more flexible than other offensive SGs like AA-12 or USAS-12, working well in both 2MG and 3MG formations.<br>Saiga’s Skill, Big Antelopes Horn, puts her in contention for the highest DPS amongst SGs, thanks to the increasing Damage Multiplier across the three hits: 1.5x/2.5x/3.5x.<br>These shots have a fixed, rapid Rate of Fire.<br>They also do not consume Ammo, meaning that Saiga’s Skill can activate while she is reloading if Commanders shuffle her back and forth quickly to force Skill activation, but they also lack the innate knockback potential of SG attacks and are unaffected by Slugs in any way.<br>Overall, Saiga-12 is a potent addition to the armory of any Commander. Able to hold her own defensively, dish out above average DPS, and buff the MG backline to a sizable degree, Saiga will make an immediate impact for those who choose to use her.', 0, 'To do.', '* :(', 'Russian Federation', 29, 10, 5, 'SG', 'saiga', 0, 0),
(24, 118, '9A-91', '', '', '9A-91 is a fairly decent Night unit who, like most Night units, has a mediocre, if not outright terrible, daytime performance. She has below average Damage, about average Accuracy, and somewhat above average Rate of Fire. It is her Skill which allows her to outperform most other standard ARs during a Night mission, as it offers a 180% increase to her Damage. Her tile buff, which gives a 15% Evasion buff and 10% RoF buff to SMGs, are useful but not exceptionally helpful for two reasons: Night Echelons typically don’t contain a main SMG tank (forgoing them for a HG like Mk23 or Welrod instead), and even if an SMG is included, the tile position means 9A-91 will likely only be buffing one SMG at a time. While 9A-91 isn’t the best Night AR, she is definitely a good one, and is one of the more affordable ones too, considering that unlike OTs-14, she can be produced.<br><br>Autor oficjalnych ilustracji: 防弹乳牛', 0, '', '', '', 1, 1, 4, 'AR', '9a91', 0, 0);
INSERT INTO `tdolls` (`id`, `game_id`, `name`, `full_name`, `short_description`, `description`, `skill_icon_id`, `skills_description`, `trivia`, `origin_country`, `voice_actor_id`, `artist_id`, `star_rating`, `type`, `folder_name`, `modded`, `new_img_system`) VALUES
(25, 222, 'TAC-50', '', '', 'TAC-50 is the lover of maple syrup and queen of the mostly dead niche that is bamboo RFs. Due to her long cooldown and inability to match self buffers when dealing with multiple enemies, TAC-50 is niche in most cases. While she can claim the title of highest possible damage to bosses in a single shot, TAC-50 will generally not see much chance to get used.<br><br>Autor oficjalnych ilustracji: 洲川Terras', 0, '', '', '', 1, 1, 5, 'RF', 'tac50', 0, 0),
(26, 52, 'VM59', '', '', 'An Italian variant of the M1 Garand, VM59 suffers from the same issues as M1 Garand, which is being overshadowed by M14, low Accuracy and low Damage. With the advent of career rewards, giving to new commanders a pre-levelled Springfield and SV-98, on top of M14 being readily available for new commanders, and still being useful for veterans due to her incredible mod, there’s absolutely no reason for any commander to use VM59. Despite having a SPEQ on the Black Market that brings her stats to match M14’s pre-mod, it still is not enough to make her relevant.<br><br>Autor oficjalnych ilustracji: 原子Dan', 0, '', '', '', 1, 1, 2, 'RF', 'bm59', 0, 0),
(27, 101, 'UMP 9', 'Universale Maschinenpistole 9mm Parabellum', 'error 404', 'UMP9 is a craftable four-star German SMG and the sister of UMP45. She is a part of ‘Squad 404’ along UMP45, HK416, and G11.<br>Her skill, the Stun Grenade, will completely stop certain enemies in a large radius, making her fairly good at crowd control and tanking. Although there are many potentially stronger and more generally usable main tanks, her strong crowd control combined with her solid stats make her a decent and easy-to-use option for any ARSMG teams in need of a tank.<br><br>UMP9’s Mod brings her stun length up to her 5 star counterpart’s and adds a skill 2 that adds some extra survivability/support potential to her kit. Her Mod III special equipment is a fancy EOT and not really needed for a maintank, so stopping at Mod II will be fine. Her skill 2 is a passive whose effect is determined by the state of the target. If the target dies before the stun grenade lands or is cannot be stunned, so that would be bosses and certain units, she provides a 25 HP shield and a 25% evasion buff to her column including herself. If the stun grenade is successful, she instead provides a 50% damage buff to everyone in her column including herself. This flexible support buff can have interesting applications, as well as attempts to fix the flaw of stun naders being useless against unstunnable enemies. There are a lot of great contenders for the maintank slot, but if one knows how to use her then UMP9 Mod is an additional option to invest in.', 0, 'missing', '* The scar over the right eye was intentionally left not repaired by 9, likely in order to match more closely with her sister. A similar scar over the opposite eye can be found on UMP45.<br>* The origin of her scar is explained in UMP9\'s MOD3 story. Prior to meeting UMP45 and Task Force 404, UMP9 went under the name \"Reina\". After UMP45 saves her from her former employer, Reina slashes her own eye to get a scar that matches UMP45\'s. She had intended to slash her left eye to have a scar identical to UMP45\'s, but slashed her right eye instead, resulting in the scar being over the opposite eye.<br>* Her sister UMP45 has a fore-grip attachment on her weapon while 9 does not. It has been suggested that 9\'s weapon lacking a fore-grip attachment reflects her personality and her position within a squad, perhaps showing that she is unable to (or less able to) \'handle\' situations compared to her sister (没有把握).<br>* Such a claim is further supported by 9\'s interactions with other characters throughout the story. At various points in the story, she shows a lack of confidence in her abilities, to the point of panicking when she had to take command and be in charge after her sister was forced out of action temporarily.<br>* The song UMP9 sings with the Bunny Microphone furniture is \"500 Miles\" composed by Hedy West and sung by the group \'Peter, Paul, and Mary\' in 1962. Although, it seems that 9 forgets the lyrics halfway through the verse.', 'Germany', 22, 16, 4, 'SMG', 'ump9', 1, 0),
(28, 169, 'SCW', 'Colt Sub Compact Weapons', 'T-doll with bird.', 'Description to do!', 0, 'WIP...', '# Colt SCW is classified IRL as an Assault Rifle, not an SMG. This discrepancy has also happened with SMG G36C and SMG SR-3MP.<br>* SCW shares the same headset that SMG PP-19 and AR M16A1 wear, which is the MSA Sordin Supreme.', 'United States', 8, 8, 3, 'SMG', 'scw', 0, 0),
(29, 44, 'SV-98', 'Snaiperskaya Vintovka Model 1998', 'Sniper T-Doll', 'SV-98, while retaining decent stats, suffer overall due to her Skill. Her statbase is quite good when compared to other units of her rarity due to her high RoF and a comparatively higher Damage stat. Like most RFs of her rarity, however, she suffers from not having a self-buff Skill, and instead an Aimed Shot. This limits her DPS immensely, and as the Skill only has a 3 star damage multiplier, it doesn’t perform very well. Considering SV-98 is a 3 star, however, her stats and ease of Dummy Linking are enough to warrant her use in the early game. In any later content, though, SV-98 shows extremely mediocre performance.<br><br>SV-98 before being upgraded, suffered the fate of many rifles - Interdiction Shots. These single target, low multiplier nuke shots are seldom sufficient in late game progression. When given her skill 2 after MOD II, her already unfortunate fate is double down on. Her passive gives her a reasonable boost to accuracy and rate of fire when she is still for three or more seconds, but it also gives a boost to the Interdiction Shot, which resets the \"still\" timer on the skill. This boost means her skill 1 Interdiction Shot effectively does 6.6x damage to a single enemy. While it seems useful, she is outclassed by the likes of a plethora of other rifles.', 0, 'WIP', '* The Waitress costume for SV-98 is a merchandise-exclusive item, obtained from pre-ordering the The Art of Girls\' Frontline Vol.1 art book.<br>* This was the first merchandise-exclusive costume released, and is by far the rarest costume in the game. At the time of writing, 3 more T-dolls have received merchandise exclusive costumes other than SV-98. Those dolls are: SMG UMP45, SG SPAS-12, and AR AK-12.<br>* SV-98 is known to collect badges and put them on her uniform.', 'Russian Federation', 26, 8, 3, 'RF', 'sv98', 1, 0),
(30, 105, 'OTs-12', 'OTs-12 Tiss', '.secret. t-doll', 'OTs-12’s Skill and buff tiles make her one of the better three star ARs in the game. Although she does not scale exceptionally well into the late game due to her low base Damage, she is a reasonably effective low cost unit for players who are trying to budget cores through the early and mid game.', 0, 'Still to do....', '* nothing so far', 'Russian Federation', 23, 22, 3, 'AR', 'ots12', 0, 0),
(31, 2, 'M1911', 'Automatic Pistol, Caliber .45, M1911', 'common t-doll', 'M1911 is an extremely common HG that everyone gets when they first begin the game. With a smoke grenade skill that is the exception rather than the rule, M1911 is remarkable, iconic, and shows none of that power for most of her life until her Neural Upgrade arrived. She is also cheap to raise: being only a 2★ unit that drops from all maps, M1911 can be dummy linked with only dupes of her, which come by the truckload. However, with her below-average stat spread, lack of utility, and a skill that requires follow-up from another SMG to capitalise on, M1911 is lackluster.<br>With her below-average Evasion, HP, and no shortage of substitutes for a position 4 buffer (such as 5-7, Stechkin, among others), M1911 is not far off the bottom of the list. She does not deal damage. She does not tank well (if at all!). She does not provide stat buffs. Her tiles do not make enough difference to buff ARs and RFs to a noticeable degree. There are only two reasons left to justify raising M1911: either you love Devil May Cry, or you think her Neural Upgrade is worth it.<br><br>M1911 Mod is an unusual unit. Continuing the trend of being a utility HG, she now packs an ear-splitting, surprisingly strong damage skill, becoming a strong independent HG that needs no Shikikan. Bearing her prior weaknesses in mind, M1911 still has her niche as a One-Doll-Army. This army, however, will only see the light of day against weak enemies. Low-level stages. The type of compositions that even new players can shrug off like water off a duck’s back. In light of other HGs that are straightforward to obtain, like Python or Desert Eagle, M1911 Mod will find herself sharing the centre of attention with increasingly more competitors.', 0, 'To do.', '* M1911 dual wields two Springfield Armory 1911s, rather than military issue Colt M1911s. One pistol has a parkerized (\"black\") finish while the other has a stainless (\"silver\") finish.<br>* The two pistols are most likely a reference to the twin pistols Ebony & Ivory used by the character Dante from the popular Devil May Cry series.<br>* After the Digi-Mind update, she was the first HG to get a MOD III upgrade.<br>* When upgraded M1911 obtains her exclusive ammunition, known as the XM261 cartridge. The XM261 was an experimental .45 ACP rat shot cartridge that contained 16 tungsten sub-projectiles sabot pellets. It was effective for close combat inside tunnels and in trenches during the Vietnam War. XM261 rounds can be fired through from both smoothbore and rifled barrels.\r\nThe seven attacks of M1911\'s MOD skill is likely a reference to the 7-round magazine capacity of the real life 1911 standard-issue magazines.<br>* The M1911 is allegedly the only pistol that was able to shoot down an aircraft. US Airman Lt. Owen J. Baggett was in a parachute when Japanese pilots took aim at them mid descent. As Baggett feigned death by limping, a Japanese pilot opened his canopy to take a closer look to confirm that he was dead. Baggett took the opportunity and fired four rounds into the cockpit killing the pilot. It caused the plane to bank and subsequently crash to the ground. Baggett was taken as a POW afterwards.', 'United States', 11, 23, 2, 'HG', 'm1911', 1, 0),
(32, 100, 'P7', '', '', 'Although toting a Skill and tiles that initially seem excellent, while P7 is solid at buffing the defensive capabilities of an Echelon, it is actually her defensive buffs that make her mediocre.<br>P7 not only provides Evasion buffs for the tanks in an Echelon, but also offers a rare RoF buff for damage dealers. Her Skill buffs Evasion even more, providing up to a 60% addition boost in EVA. Despite these qualities, one downside to P7’s solid buffs is her tile arrangement. As she does not buff units in front or behind her, she cannot buff the Main tank while buffing both damage dealers, and she cannot buff the Offtank and a damage dealer while buffing the Main tank. In addition, her mediocre stats make it hard for her to be used as a Main tank, limiting her utility compared to some of her contemporaries.<br>The most important thing to note about P7, however, is that while she’s not bad performance-wise, compared to other HGs she falls behind. She’s not the worst choice for a buffer, but she’s also far from being the best choice in her class.<br><br>Autor oficjalnych ilustracji: Saru/サル', 0, '', '', '', 1, 1, 4, 'HG', 'p7', 0, 0),
(33, 205, 'AN-94', '', '', 'The shining star on DEFY in physical combat lore wise, AN-94 proves to be an excellent unit gameplay wise as well. While she possesses decent stats for an AR, it’s her Skill that makes her shine both her passive which provides an extra shot per dummy link every time she changes targets, and especially because of her active Skill, which essentially doubles her DPS. As later content for non Grenadier ARs is more centered around ARs with RoF or Multi-hit oriented skills, AN-94 is among the best ARs in the game, and only lags behind top ARs like G11. Even then, she still is one of the best ARs in the game, and still remains relevant.<br><b>AR chip</b><br>AN-94 biggest needs are FP and RoF buffs, both which are supplied by AR chips. Because her Skill is a double shot rather than a RoF buff, AN-94 ends up being one of the ARs benefited the most from it, to the point that she becomes a better option than her comrade in arms, AK-12.<br><br>Autor oficjalnych ilustracji: 多元菌', 0, '', '', '', 1, 1, 5, 'AR', 'an94', 0, 0),
(34, 216, 'XM8', 'XM8', 'Be carefull', 'Description to do! (´・ω・`)', 0, 'yet to do', '* XM8 was the one who made SMG G36C\'s halloween costume.<br>* AR G36 crashed after seeing her little sister\'s costume.<br>* After learning who was behind this, G36 was so angered and hanged XM8 on the cafe entrance for all day long. She was only freed by the Commander\'s plea.', 'Germany/United States', 27, 25, 4, 'AR', 'xm8', 0, 0),
(35, 228, '100 Shiki', 'Type 100 submachine gun', 'Sakura', '100 Shiki, also known as Type 100, is the Japanese GFL server’s favorite T-Doll by far. When the JP server released their first anniversary statistics, 100 Shiki was revealed to be the most used adjutant, echelon leader, support, and team member. It was so much of a landslide that the entire infographic opted to show chibi versions for the 2nd place T-Dolls for variety.<br>100 Shiki’s statistical accomplishments do not, however, imply similarly superlative gameplay value. With an unusual hybrid shield/buff skill that activates very late, compounded with her low base Evasion, Type 100 is more fragile in practice than many of her 5* contemporaries. Players planning their echelons strictly around in-game performance would most likely find more value from other SMG main tank T-Dolls.', 0, 'To do... bla bla bla....', '* During World War II, Japanese paratroopers were given a disassembled Type 100 packed in a canvas bag. This was similar to American paratroopers being given a disassembled M1 Garand packed in a Griswold bag.<br>* Originally a JP server exclusive T-Doll, Type 100 would later be added to the CN, TW, KR, and EN server construction pools.<br>* AR K2, AR T91, and RF M200 also share this trait of being initially released as server exclusive T-dolls (K2 for the Korean servers, T91 for the Taiwanese servers, and M200 for the English servers).<br>* Type 100 was released on the CN (DSky/BiliBili) servers under the alias \"樱花\", which translates to \"Cherry Blossoms\", or \"Sakura\".<br>* Her character bio is quite a bit longer and more detailed on her character sheet for JP than her sheets for the other servers (see the \"Gallery\" section above for her CN and JP character sheets).', 'Imperial Japan', 25, 1, 5, 'SMG', '100shiki', 0, 0),
(36, 38, 'M21', 'M21 Sniper Weapon System', 'M14\'s sister', 'M21 is about as average as three star RFs get, featuring largely average stats across the board and a charged shot Skill with a high Initial Cooldown. Although M21 is only obtainable as a drop from maps Normal 4-6 and Emergency 4-4, she is not particularly outstanding as a unit and should generally be benched in favor of better RF options.', 0, 'Bamboo shooter.', '* nothing', 'United States', 28, 26, 3, 'RF', 'm21', 0, 0),
(37, 75, 'M1918 BAR', '', '', 'Whether it be through career quests or her login event, M1918 (otherwise simply called BAR) will likely be one of the first MGs any commander receives. She is a 4★ MG whose base form isn’t anything special but nothing terrible either.<br>Statistically, her FP and Accuracy are high. She’ll hit hard and fairly reliably without the need for too much external accuracy support. The main downside is her poor clip size, which is helped somewhat by her Special Equipment but she still remains below other popular MGs.<br>Her skill, Damage Focus MG, is a powerful FP boost, giving her a large DPS increase in the second volley. With the long initial cooldown and no passive though, her damage output in the first volley is lackluster compared to the likes of the “Big 4”. Her tiles are passable, giving a good armor boost but poor coverage.<br>As one can see, the base version of BAR possesses several upsides and several downsides. She’s a good pick for when you need MGs and have nothing else available, but will typically fade from use once a commander acquires stronger MGs<br><br>M1918’s Digimind Upgrade sets out to improve the primary issue that her original form had: her lackluster first volley damage. She still has her faults, but M1918 Mod is nevertheless a solid MG.<br>Her base form already possessed great offensive stats, but now they’re even better than before thanks to a considerable FP and Accuracy boost. Her clip size still sadly remains the same, but her new Skill 2, Battlefield Magic, helps to make this much less of an issue. With her initial shots in each volley having a substantial damage boost, her damage per volley is much more comparable to the likes of other top MGs such as MG5. Her second volley in particular will be immensely strong since both Damage Focus MG and Battlefield Magic will be active.<br>M1918 Mod’s biggest downside is simply the investment needed for her to reach her peak. She will ideally want to be Mod3 for the extra stats from being oathed, on top of needing her Skill 2 maxed and wanting the Titan Fire-Control Clip (Her Mod Special Equipment can be ignored). Especially given that M1918 is a 4★ at base, the cost of doing all of this will be very substantial. Her other remaining issue is her tile layout is unchanged from her base form.<br>All in all, M1918 Mod is a strong MG that can now properly compete with the likes of other top MGs. Despite this, commanders will need to consider if the DPS she offers is worth the investment, especially when other MGs can be comparatively strong with much less investment<br><br>Autor oficjalnych ilustracji: 水乌龟', 0, '', '', '', 1, 1, 4, 'MG', 'bar', 1, 0),
(38, 254, 'UKM-2000', '', '', 'UKM-2000 is simply awful. Her base stats are decidedly average except for her Ammo Capacity, her tile buffs are mediocre at best, and she is cursed with one of the worst skills ever seen on an MG, that comes with everything you don’t want out of an MG’s skill. In Girls’ Frontline, a T-Doll’s skill is usually the deciding factor for if a doll is worth your time for raising, and UKM-2000 isn’t even worth a minute of it.<br>UKM-2000’s Base Stats are… okay. Her Damage is decent (which nowadays is the only important stat on an MG), and her base Ammo Capacity is tied with PK and MG5 for the highest at 11.<br>UKM-2000’s skill is completely garbage, and fills in every box on the “bad MG skill” checklist. Night Focused MG skill? Check. Buffing a useless stat for MGs in this day and age? Check. 8 second ICD variant? Check. Lack of focus on increasing Damage? Check. There is nothing good about her skill, and leveling it is a colossal waste of your training data.<br>Her Tile Buff isn’t worth talking about either. SGs don’t get much benefits from tile buffs outside of Armor, and UKM-2000 can’t provide any, not like it would’ve saved her in the first place.<br>Overall, UKM-2000 is not worth the effort in raising, let alone farming. Even writing this Analysis was hardly worth it.<br><br>Autor oficjalnych ilustracji: DSマイル', 0, '', '', '', 1, 1, 4, 'MG', 'ukm2000', 0, 0),
(39, 152, 'M1897', 'Winchester Model 1897', 'cleaning t-doll', 'M1897 is a Shotgun that has the issue of tanking properly, her low Armor stat of 21 is marginally higher than the lowest of 20, and her max HP of 1265 is similarly just barely above the lowest of 1210. With no defensive Skill, this means that she is one of the fastest SGs to fall in an extended fight. M1897’s 50% Accuracy Tile Buff almost makes up for this by having a tile pattern that does not force 2SG to get the most out of it, unlike most 3 Stars, but it is not much better due to forcing 3MG(or non-conventional 2MG layouts that leaves an entire row open such as this) to make the most of the buff due to its strange layout.<br>M1897’s only real benefit is her Skill, Burst Impact, which deals double her Damage and knocks the enemies that it hits three units backwards. This Skill both alleviates pressure for a moment and can eliminate enemies that MGs struggle to hit, namely Scouts. The small problem with this Skill is that it has a relatively long Initial Cooldown of eight seconds, which means that in a lot of battles it would not activate.<br>Overall, M1897’s poor durability and hindering tile pattern stops her short of being a decent SG, making her neither worth the time nor resources to invest in.', 0, 'WIP.', '* During WWI, slamfire technique were used by US Armies and proven to be effective in trench raid. By doing these technique, operator could unleash rapid fire with devastating effect in less than 2 seconds. While slamfire itself considered extremely dangerous as it would increase a chance of out-of-battery detonation that led into breech explosion, The M1897 could be a first shotgun in the world that able --if not, intended-- to do slamfire due the lack of trigger disconnector where it can be fired without releasing the trigger.<br>* The German Empire forces in WWI protested the usage of M1897 Shotgun, as the weapon itself violate 1903 Hague Convention of Land Warfare where using weapon that caused unnecessary suffering to the victim is strictly forbidden. Shortly after German protest was rejected by the US in 1918, German forces issued order to threat US by executing the captured opponent armed with a trench gun or even only with trench gun shells. Until World War II, shotgun still unacceptable for Wehrmacht or any Special Forces of 3rd Reich.<br>* Ironically; flamethrower(2-man Grossflammenwerfer and man-portable Kleinflammenwerfer M.16) and mustard gas that proved inhumane against war convention were originated from German are still used in the war. Even so, there\'s no record and report of trench-gun armed soldier execution.<br>* General Pershing also counter-threat German forces to execute captured soldier with flamethrower and saw-back bayonet(Kurzes Seitengewehr) due the exceptional wound that led to painful death to the victims after hit.<br>* The M1897 T-Doll seems to carry the Trench Grade Model 1897.', 'United States', 24, 24, 3, 'MG', 'm1897', 1, 0),
(40, 155, 'M590', 'Mossberg 590', 'Brief description to do.', 'M590, while possessing a solid kit, ends up being less than ideal for one reason.<br>M590’s kit itself isn’t bad at all, and is actually almost great. With a HP stat of 264 per Dummy Link, M590 already has more HP than many SGs. M590 also has a high base Armor at 22, complimenting her high HP even further. On top of her stats, M590 has a great buff as well -- she provides a 55% Accuracy buff to two MGs, which is greatly appreciated thanks to the inherently low Accuracy stat of MGs.<br>The reason M590 isn’t an ideal SG, though, is because of her buff tile formation. M590 buffs the top left and bottom left MG from the bottom right, which means she must be used in that position in order to make the most of her powerful buff. To use her in that position, however, another SG needs to be used with her, making a 2SG echelon necessary. 2SG echelons are objectively worse when compared to 1SG Echelons, which is enough to make M590 not among the best SGs available..', 0, 'Waiting...', '* M590 actually belongs to SG M500 (Mossberg 500) family. The weapon designs are extremely similar to each other.', 'United States', 9, 10, 4, 'SG', 'm590', 0, 0);

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `username` varchar(10) COLLATE utf8mb4_bin NOT NULL,
  `password` varchar(10) COLLATE utf8mb4_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

--
-- Zrzut danych tabeli `users`
--

INSERT INTO `users` (`id`, `username`, `password`) VALUES
(1, 'test', 'test');

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `voice_actors`
--

CREATE TABLE `voice_actors` (
  `id` int(11) NOT NULL,
  `name` varchar(50) COLLATE utf8mb4_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

--
-- Zrzut danych tabeli `voice_actors`
--

INSERT INTO `voice_actors` (`id`, `name`) VALUES
(0, '-TBA-'),
(1, 'Shinohara Narumi'),
(2, 'Ueda Reina'),
(3, 'Hayami Saori'),
(4, 'Koshimizu Ami'),
(5, 'Inoue Marina'),
(6, 'Seto Asami'),
(7, 'Oonishi Saori'),
(8, 'Ida Arisa'),
(9, 'Aoki Ruriko'),
(10, 'Uesaka Sumire'),
(11, 'Matsui Eriko'),
(12, 'Horie Yui'),
(13, 'Daimon Kami'),
(14, 'Toyosaki Aki'),
(15, 'Mineuchi Tomomi'),
(16, 'Fuuka Izumi'),
(17, 'Omigawa Chiaki'),
(18, 'Itou Miku'),
(19, 'Motoyoshi Yukiko'),
(20, 'Oozeki Eri'),
(21, 'Yuuki Kana'),
(22, 'Noto Mamiko'),
(23, 'Uchiyama Yumi'),
(24, 'Koichi Makoto'),
(25, 'Kakuma Ai'),
(26, 'Hanada Mamiko'),
(27, 'Kubota Risa'),
(28, 'Kitamura Eri'),
(29, 'Kanemoto Hisako');

--
-- Indeksy dla zrzutów tabel
--

--
-- Indeksy dla tabeli `artists`
--
ALTER TABLE `artists`
  ADD PRIMARY KEY (`id`);

--
-- Indeksy dla tabeli `fairies`
--
ALTER TABLE `fairies`
  ADD PRIMARY KEY (`id`),
  ADD KEY `voice_actor_id` (`voice_actor_id`),
  ADD KEY `artist_id` (`artist_id`);

--
-- Indeksy dla tabeli `hocs`
--
ALTER TABLE `hocs`
  ADD PRIMARY KEY (`id`),
  ADD KEY `voice_actor_id` (`voice_actor_id`),
  ADD KEY `artist_id` (`artist_id`);

--
-- Indeksy dla tabeli `illustrations_fairies`
--
ALTER TABLE `illustrations_fairies`
  ADD PRIMARY KEY (`id`),
  ADD KEY `owner_id` (`owner_id`);

--
-- Indeksy dla tabeli `illustrations_hocs`
--
ALTER TABLE `illustrations_hocs`
  ADD PRIMARY KEY (`id`),
  ADD KEY `owner_id` (`owner_id`);

--
-- Indeksy dla tabeli `illustrations_tdolls`
--
ALTER TABLE `illustrations_tdolls`
  ADD PRIMARY KEY (`id`),
  ADD KEY `owner_id` (`owner_id`);

--
-- Indeksy dla tabeli `illustration_connections_tdolls`
--
ALTER TABLE `illustration_connections_tdolls`
  ADD PRIMARY KEY (`id`),
  ADD KEY `image_id` (`image_id`),
  ADD KEY `tdoll_id` (`tdoll_id`);

--
-- Indeksy dla tabeli `illustration_table`
--
ALTER TABLE `illustration_table`
  ADD PRIMARY KEY (`id`);

--
-- Indeksy dla tabeli `sounds_connections`
--
ALTER TABLE `sounds_connections`
  ADD PRIMARY KEY (`id`),
  ADD KEY `sound_id` (`sound_id`),
  ADD KEY `tdoll_id` (`tdoll_id`);

--
-- Indeksy dla tabeli `sounds_table`
--
ALTER TABLE `sounds_table`
  ADD PRIMARY KEY (`id`);

--
-- Indeksy dla tabeli `tdolls`
--
ALTER TABLE `tdolls`
  ADD PRIMARY KEY (`id`),
  ADD KEY `voice_actor_id` (`voice_actor_id`),
  ADD KEY `artist_id` (`artist_id`),
  ADD KEY `skill_icon_id` (`skill_icon_id`);

--
-- Indeksy dla tabeli `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- Indeksy dla tabeli `voice_actors`
--
ALTER TABLE `voice_actors`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT dla zrzuconych tabel
--

--
-- AUTO_INCREMENT dla tabeli `artists`
--
ALTER TABLE `artists`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=27;

--
-- AUTO_INCREMENT dla tabeli `fairies`
--
ALTER TABLE `fairies`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT dla tabeli `hocs`
--
ALTER TABLE `hocs`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT dla tabeli `illustrations_fairies`
--
ALTER TABLE `illustrations_fairies`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT dla tabeli `illustrations_hocs`
--
ALTER TABLE `illustrations_hocs`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT dla tabeli `illustrations_tdolls`
--
ALTER TABLE `illustrations_tdolls`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=318;

--
-- AUTO_INCREMENT dla tabeli `illustration_connections_tdolls`
--
ALTER TABLE `illustration_connections_tdolls`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT dla tabeli `illustration_table`
--
ALTER TABLE `illustration_table`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT dla tabeli `sounds_connections`
--
ALTER TABLE `sounds_connections`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT dla tabeli `sounds_table`
--
ALTER TABLE `sounds_table`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT dla tabeli `tdolls`
--
ALTER TABLE `tdolls`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=41;

--
-- AUTO_INCREMENT dla tabeli `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT dla tabeli `voice_actors`
--
ALTER TABLE `voice_actors`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=30;

--
-- Ograniczenia dla zrzutów tabel
--

--
-- Ograniczenia dla tabeli `fairies`
--
ALTER TABLE `fairies`
  ADD CONSTRAINT `fairies_ibfk_1` FOREIGN KEY (`voice_actor_id`) REFERENCES `voice_actors` (`id`),
  ADD CONSTRAINT `fairies_ibfk_2` FOREIGN KEY (`artist_id`) REFERENCES `artists` (`id`);

--
-- Ograniczenia dla tabeli `hocs`
--
ALTER TABLE `hocs`
  ADD CONSTRAINT `hocs_ibfk_1` FOREIGN KEY (`voice_actor_id`) REFERENCES `voice_actors` (`id`),
  ADD CONSTRAINT `hocs_ibfk_2` FOREIGN KEY (`artist_id`) REFERENCES `artists` (`id`);

--
-- Ograniczenia dla tabeli `illustrations_fairies`
--
ALTER TABLE `illustrations_fairies`
  ADD CONSTRAINT `illustrations_fairies_ibfk_1` FOREIGN KEY (`owner_id`) REFERENCES `fairies` (`id`);

--
-- Ograniczenia dla tabeli `illustrations_hocs`
--
ALTER TABLE `illustrations_hocs`
  ADD CONSTRAINT `illustrations_hocs_ibfk_1` FOREIGN KEY (`owner_id`) REFERENCES `hocs` (`id`);

--
-- Ograniczenia dla tabeli `illustrations_tdolls`
--
ALTER TABLE `illustrations_tdolls`
  ADD CONSTRAINT `illustrations_tdolls_ibfk_1` FOREIGN KEY (`owner_id`) REFERENCES `tdolls` (`id`);

--
-- Ograniczenia dla tabeli `sounds_connections`
--
ALTER TABLE `sounds_connections`
  ADD CONSTRAINT `sounds_connections_ibfk_1` FOREIGN KEY (`sound_id`) REFERENCES `sounds_table` (`id`),
  ADD CONSTRAINT `sounds_connections_ibfk_2` FOREIGN KEY (`tdoll_id`) REFERENCES `tdolls` (`id`);

--
-- Ograniczenia dla tabeli `tdolls`
--
ALTER TABLE `tdolls`
  ADD CONSTRAINT `tdolls_ibfk_1` FOREIGN KEY (`voice_actor_id`) REFERENCES `voice_actors` (`id`),
  ADD CONSTRAINT `tdolls_ibfk_2` FOREIGN KEY (`artist_id`) REFERENCES `artists` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
