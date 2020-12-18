-- phpMyAdmin SQL Dump
-- version 5.0.3
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 18-12-2020 a las 21:38:49
-- Versión del servidor: 10.4.14-MariaDB
-- Versión de PHP: 7.4.11

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `database_kuepa`
--
CREATE DATABASE IF NOT EXISTS `database_kuepa` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `database_kuepa`;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `messages`
--

DROP TABLE IF EXISTS `messages`;
CREATE TABLE `messages` (
  `id` bigint(20) NOT NULL,
  `message` varchar(200) NOT NULL,
  `idUser` int(11) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `messages`
--

INSERT INTO `messages` (`id`, `message`, `idUser`, `created_at`) VALUES
(1, 'Hola', 8, '2020-12-18 16:19:00'),
(2, 'Llegué', 7, '2020-12-18 16:21:25'),
(3, 'Va', 8, '2020-12-18 16:25:24'),
(4, 'Ese es', 7, '2020-12-18 16:25:33'),
(5, 'Hola', 8, '2020-12-18 16:27:13'),
(6, 'Que tal', 7, '2020-12-18 16:27:20'),
(7, 'Hola', 8, '2020-12-18 16:31:50'),
(8, 'Hola', 8, '2020-12-18 16:31:57'),
(9, 'sdfgsdfg', 8, '2020-12-18 16:56:19'),
(10, 'FGJNFGH', 8, '2020-12-18 17:00:02'),
(11, 'FGHFG', 8, '2020-12-18 17:00:31'),
(12, 'FGHFGH', 8, '2020-12-18 17:01:20'),
(13, 'dfgbfg', 8, '2020-12-18 17:03:56'),
(14, 'fgdfghrfh', 8, '2020-12-18 17:04:00'),
(15, 'fdgdfg', 8, '2020-12-18 17:04:19'),
(16, 'fghfgh', 8, '2020-12-18 17:09:40'),
(17, 'sdfsdf', 8, '2020-12-18 17:11:16'),
(18, 'xfgxfgh', 8, '2020-12-18 17:11:48'),
(19, 'fghfgh', 8, '2020-12-18 17:17:11'),
(20, 'fghfgh', 8, '2020-12-18 17:19:06'),
(21, 'fghfgh', 8, '2020-12-18 17:21:33'),
(22, 'fgdgdf', 8, '2020-12-18 17:21:39'),
(23, 'fgdgdf', 8, '2020-12-18 17:21:42'),
(24, 'fgdgdf', 8, '2020-12-18 17:22:01'),
(25, 'fgdgdf', 8, '2020-12-18 17:22:01'),
(26, 'uguihi', 8, '2020-12-18 17:22:09'),
(27, 'uytguy', 8, '2020-12-18 17:22:51'),
(28, 'dfbdfbdf', 8, '2020-12-18 17:57:46'),
(29, 'fghdgjhdg', 8, '2020-12-18 17:58:35'),
(30, 'ftyjtyj', 8, '2020-12-18 17:59:48'),
(31, 'dgfsdfghdfg', 8, '2020-12-18 18:00:12'),
(32, 'fggfh', 8, '2020-12-18 18:00:22'),
(33, 'fggh', 8, '2020-12-18 18:00:24'),
(34, 'ftghfdtgh', 8, '2020-12-18 18:02:31'),
(35, 'bvbncvbn', 8, '2020-12-18 18:02:36'),
(36, 'fgfgfgh', 8, '2020-12-18 18:04:06'),
(37, 'cvbxcv', 8, '2020-12-18 18:04:30'),
(38, 'xcvbxcvx', 8, '2020-12-18 18:09:22'),
(39, 'xcvbxcvx', 8, '2020-12-18 18:11:13'),
(40, 'fghjghjg', 8, '2020-12-18 18:12:52'),
(41, 'hgjfgj', 8, '2020-12-18 18:14:05'),
(42, 'si', 9, '2020-12-18 18:15:17'),
(43, 'hola', 9, '2020-12-18 18:16:19'),
(44, 'que más', 8, '2020-12-18 18:16:26'),
(45, 'si', 10, '2020-12-18 18:17:23'),
(46, 'ok', 10, '2020-12-18 18:19:05'),
(47, 'aja', 10, '2020-12-18 18:19:24'),
(48, 'Hola', 9, '2020-12-18 18:48:46');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `roles`
--

DROP TABLE IF EXISTS `roles`;
CREATE TABLE `roles` (
  `id` int(11) NOT NULL,
  `nameRole` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `roles`
--

INSERT INTO `roles` (`id`, `nameRole`) VALUES
(1, 'Estudiante'),
(2, 'Moderador');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `sessions`
--

DROP TABLE IF EXISTS `sessions`;
CREATE TABLE `sessions` (
  `session_id` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `expires` int(11) UNSIGNED NOT NULL,
  `data` mediumtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `sessions`
--

INSERT INTO `sessions` (`session_id`, `expires`, `data`) VALUES
('1NjRmKNFvPdlQuOJAEGo0dWsLO1IFExC', 1608407174, '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"},\"flash\":{},\"passport\":{\"user\":9}}'),
('TpQi3bLwRx35rVsDSzjHhXY8z9yFXYcR', 1608401959, '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"},\"passport\":{\"user\":8},\"flash\":{}}'),
('eDguogjHO_f8uzgeZ-6T1tzDKCaUzLUZ', 1608403465, '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"},\"flash\":{},\"passport\":{\"user\":12}}');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `users`
--

DROP TABLE IF EXISTS `users`;
CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `username` varchar(20) NOT NULL,
  `password` varchar(200) NOT NULL,
  `name` varchar(20) NOT NULL,
  `lastname` varchar(20) NOT NULL,
  `idRole` int(11) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `users`
--

INSERT INTO `users` (`id`, `username`, `password`, `name`, `lastname`, `idRole`, `created_at`) VALUES
(1, 'napandalesr@gmail.co', 'kkkkkkk', 'Neider Andres ', 'Pandales', 1, '2020-12-18 11:09:01'),
(3, 'amanecer_96@yahoo.es', '123456', 'Neider Andres ', 'Pandales', 2, '2020-12-18 11:09:01'),
(4, 'Admin', '$2a$10$VRpQAhweKZQ4DQHfEA6b7eWnGZTNBdvMocx7dBIKATaUR8S5iloSK', 'Andres', 'tghd', 1, '2020-12-18 12:32:34'),
(5, 'npandales', '$2a$10$aDE4iytoP5xdZCgyjbhZAO4jTx1RBCXzNQRlhVLguAbsOU0qF8wSG', 'Andres', 'tghd', 1, '2020-12-18 12:32:43'),
(6, 'npandales', '$2a$10$f/YaxtehYyq48M6SlrGX6u45uWqCuqqzhQ5/FJZPJMwJy1.hQFN5G', 'Andres', 'tghd', 1, '2020-12-18 12:38:46'),
(7, 'npandalesr', '$2a$10$vsyUVSnI.ffJwdkeMhh3c.rsc5v/oIzxoRITcpVfP8SPcyZjlFf9G', 'Neider Andres ', 'Pandales Renteria', 1, '2020-12-18 12:49:36'),
(8, 'pandales', '$2a$10$m8NeJhtHy7Y.8nqsmixvh.ECxegGjoyk5.GfJa535CUaHCsvTtIn.', 'Andres', 'tghd', 2, '2020-12-18 13:26:33'),
(9, '123', '$2a$10$.q7Ub15TAsuZfdq0qhhfh.GWBuZX3kfOsaWn8LnVo5oWMXiPPJeTi', 'Andres', 'Pandales Renteria', 2, '2020-12-18 18:14:53'),
(10, '456', '$2a$10$Llj81ldoSQt1eHSzOoTh1eW2NoLV3WXuoE5JhDUVblWrN.aYLH0SS', 'oso', 'osa ', 1, '2020-12-18 18:17:04'),
(11, 'napandalesr@gmail.co', '$2a$10$nmca6juvbNbRUsUS8FlqvOeWK8sMCxWdL294UZuooOIsLV003jj6W', 'Neider Andres ', 'Pandales', 1, '2020-12-18 18:37:20'),
(13, 'napandalesr@gmail.co', '$2a$10$wzpsiU4.8kJT9A4PN2ScX.HWK6mlmcDJpOtNNw4ejKQRlOLd5dJ16', 'Andres', 'tghd', 1, '2020-12-18 18:40:41'),
(14, 'napandalesr@gmail.co', '$2a$10$fyMRUaODvy/yAxP3JYAzv./gNym5VkzCMb1z.pwSBW8UIokt1qD9e', 'Andres', 'tghd', 1, '2020-12-18 18:42:31');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `messages`
--
ALTER TABLE `messages`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idUser` (`idUser`);

--
-- Indices de la tabla `roles`
--
ALTER TABLE `roles`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `sessions`
--
ALTER TABLE `sessions`
  ADD PRIMARY KEY (`session_id`);

--
-- Indices de la tabla `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idRole` (`idRole`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `messages`
--
ALTER TABLE `messages`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=49;

--
-- AUTO_INCREMENT de la tabla `roles`
--
ALTER TABLE `roles`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `messages`
--
ALTER TABLE `messages`
  ADD CONSTRAINT `messages_ibfk_1` FOREIGN KEY (`idUser`) REFERENCES `users` (`id`);

--
-- Filtros para la tabla `users`
--
ALTER TABLE `users`
  ADD CONSTRAINT `users_ibfk_1` FOREIGN KEY (`idRole`) REFERENCES `roles` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
