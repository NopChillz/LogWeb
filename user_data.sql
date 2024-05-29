-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: May 29, 2024 at 02:03 PM
-- Server version: 10.5.20-MariaDB
-- PHP Version: 7.3.33

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `id21941414_bf_data`
--

-- --------------------------------------------------------

--
-- Table structure for table `user_data`
--

CREATE TABLE `user_data` (
  `id` int(11) NOT NULL,
  `username` varchar(255) NOT NULL,
  `level` varchar(255) DEFAULT '-',
  `money` varchar(255) DEFAULT '-',
  `world` varchar(255) DEFAULT '-',
  `mirror` varchar(255) DEFAULT '❌',
  `valk` varchar(255) DEFAULT '❌',
  `fruit_awaken` varchar(255) DEFAULT '-',
  `fruit_inventory` varchar(255) DEFAULT '-',
  `race` varchar(255) DEFAULT '-',
  `tier` varchar(255) DEFAULT '-',
  `melee` varchar(255) DEFAULT '-',
  `fragment` varchar(255) DEFAULT '0',
  `bounty` varchar(255) DEFAULT '-',
  `lever` varchar(255) DEFAULT '❌',
  `type` varchar(255) DEFAULT '-',
  `name` varchar(255) DEFAULT '-',
  `sword` varchar(255) DEFAULT '-',
  `gun` varchar(255) DEFAULT '-',
  `darkfragment` varchar(255) DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `user_data`
--

INSERT INTO `user_data` (`id`, `username`, `level`, `money`, `world`, `mirror`, `valk`, `fruit_awaken`, `fruit_inventory`, `race`, `tier`, `melee`, `fragment`, `bounty`, `lever`, `type`, `name`, `sword`, `gun`, `darkfragment`) VALUES
(1, 'LifeRBX_0059', '2550', '2.69M', '3', '✔️', '❌', '[Full Awaked] Dark [111]', 'Buddha, Sand, Smoke, Falcon, Diamond, Love, Quake, Magma, Rubber, Rocket, Spin, Light, Chop, Sound, Ice, Spring, Spike', 'Fishman [V3]', 'T0', '6', '110.01K', '2.42M', '❌', 'Lv.MAX | GOD+MIRROR+ADMIN+CDK+SA+SG', 'TESTER 01', '-', '-', '0'),
(2, 'LifeRBX_9945', '2550', '104027732', '3', '1', '0', '[Full Awaked] Buddha [201]', 'Rubber, Sand, Smoke, Falcon, Bomb, Diamond, Phoenix, Barrier, Ghost, Spring, Quake, Magma, Portal, Ice, Flame, Rocket, Rumble, Buddha, Dark, Chop, Sound, Spike, Spin', 'Mink [V3]', '✔️', '-', '0', '-', '❌', '-', '-', '-', '-', '0'),
(4, 'ud6atk', '2550', '45.95M', '3', '✔️', '❌', '[Full Awaked] Dark [111]', 'Rubber, Sand, Smoke, Falcon, Bomb, Mammoth, Barrier, Light, Ghost, Spin, Pain, Spike, Buddha, Flame, Rocket, Spring, Ice, Dark, Chop, Sound, Spider, Love, Quake', 'Cyborg [V4]', 'T0', '6', '54.17K', '2.50M', '✔️', 'Lv.MAX | GOD+MIRROR+ADMIN', 'FARM', '-', '-', '0'),
(5, 'vna8fb', '2550', '140.96M', '3', '✔️', '❌', '[Full Awaked] Dark [113]', 'Rubber, Sand, Smoke, Falcon, Ice, Bomb, Spin, Phoenix, Diamond, Ghost, Rumble, Shadow, Portal, Magma, Gravity, Quake, Flame, Rocket, Spring, Control, Dark, Chop, Spider, Spike, Love', 'Cyborg [V3]', 'T0', '7', '310.87K', '2.58M', '✔️', 'Lv.MAX | SanguineArt+MIRROR+ADMIN+CDK+SA+SG', 'TESTER 01', '-', '-', '0'),
(6, 'honey_8641', '2550', '33.52M', '3', '✔️', '❌', '[Full Awaked] Buddha [202]', 'Falcon, Magma, Ice, Rocket, Spring, Pain, Sound, Dough, Spider', 'Fishman [V3]', 'T0', '6', '85.81K', '2.51M', '❌', 'Lv.MAX | GOD+MIRROR+ADMIN+CDK+SA', 'TESTER 01', '-', '-', '0'),
(7, 'yuzi_9302', '1', '100', '1', '❌', '❌', 'None', '-', 'Human [V1]', '-', '0', '0', '0', '❌', '', 'TESTER 01', '-', '-', '0'),
(8, '066tkm', '2550', '40.75M', '3', '✔️', '❌', '[Full Awaked] Dark [111]', 'Buddha, Sand, Smoke, Falcon, Bomb, Venom, Diamond, Light, Spike, Magma, Spring, Portal, Flame, Rocket, Spin, Rubber, Chop, Blizzard, Barrier, Ice, Quake', 'Cyborg [V4]', 'T0', '6', '3.51K', '2.50M', '✔️', 'Lv.MAX | GOD+MIRROR+ADMIN', 'TESTER 01', '-', '-', '0'),
(9, 'honey_6023', '2550', '24.73M', '3', '❌', '❌', '[Full Awaked] Buddha [202]', 'Bomb, Quake, Magma, Spider', 'Mink [V3]', 'T0', '6', '54.35K', '2.50M', '❌', 'Lv.MAX | GOD+SA+SG', 'TESTER 01', 'Spikey Trident, Yama, Pole (1st Form), Rengoku, Buddy Sword, Shark Anchor, Saddi, Hallow Scythe, Saber', 'Serpent Bow, Kabucha, Soul Guitar, Acidum Rifle', '0'),
(10, 'honey_8168', '2550', '42.99M', '3', '✔️', '❌', '[Full Awaked] Buddha [201]', 'Rubber, Smoke, Ice, Diamond, Love, Quake, Spin, Rocket, Spring, Chop, Spider, Light, Spike', 'Fishman [V3]', 'T0', '6', '137.78K', '2.50M', '❌', 'Lv.MAX | GOD+MIRROR+SA+SG', 'TESTER 01', 'Spikey Trident, Yama, Midnight Blade, Shark Anchor, Tushita, Canvander, Hallow Scythe, Saddi, Rengoku, Shisui, Buddy Sword, Wando, True Triple Katana, Saber', 'Kabucha, Acidum Rifle, Serpent Bow, Soul Guitar', '1');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `user_data`
--
ALTER TABLE `user_data`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `user_data`
--
ALTER TABLE `user_data`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
