-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Gép: 127.0.0.1
-- Létrehozás ideje: 2025. Már 21. 12:28
-- Kiszolgáló verziója: 10.4.20-MariaDB
-- PHP verzió: 7.3.29

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Adatbázis: `computer`
--

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `comp`
--

CREATE TABLE `comp` (
  `id` bigint(20) NOT NULL,
  `brand` varchar(37) DEFAULT NULL,
  `type` varchar(30) DEFAULT NULL,
  `display` double DEFAULT NULL,
  `memory` int(11) DEFAULT NULL,
  `createdTime` datetime DEFAULT NULL,
  `osId` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- A tábla adatainak kiíratása `comp`
--

INSERT INTO `comp` (`id`, `brand`, `type`, `display`, `memory`, `createdTime`, `osId`) VALUES
(1, 'hp', 'PC', 40, 10, NULL, 1),
(5, 'Apple', 'Laptop', 13.3, 16, NULL, 5),
(6, 'Samsung', 'Tablet', 10.5, 4, NULL, 2),
(7, 'Lenovo', 'Desktop', 24, 32, NULL, 3),
(8, 'HP', 'Laptop', 15.6, 8, NULL, 4),
(9, 'Microsoft', 'Surface', 12.3, 8, NULL, 1),
(10, 'Asus', 'Laptop', 17.3, 16, NULL, 2),
(11, 'Acer', 'Laptop', 14, 8, NULL, 3),
(12, 'Dell', 'Desktop', 21.5, 16, NULL, 2),
(13, 'Razer', 'Laptop', 15.6, 32, NULL, 1),
(14, 'Sony', 'Laptop', 13, 16, NULL, 3);

--
-- Indexek a kiírt táblákhoz
--

--
-- A tábla indexei `comp`
--
ALTER TABLE `comp`
  ADD PRIMARY KEY (`id`),
  ADD KEY `osId` (`osId`);

--
-- A kiírt táblák AUTO_INCREMENT értéke
--

--
-- AUTO_INCREMENT a táblához `comp`
--
ALTER TABLE `comp`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- Megkötések a kiírt táblákhoz
--

--
-- Megkötések a táblához `comp`
--
ALTER TABLE `comp`
  ADD CONSTRAINT `comp_ibfk_1` FOREIGN KEY (`osId`) REFERENCES `osystem` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
