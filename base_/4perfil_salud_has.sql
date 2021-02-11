-- phpMyAdmin SQL Dump
-- version 5.0.3
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 11-02-2021 a las 21:06:01
-- Versión del servidor: 10.4.14-MariaDB
-- Versión de PHP: 7.2.34

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `appexpres40`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `perfil_salud_has_encuesta_salud`
--

CREATE TABLE `perfil_salud_has_encuesta_salud` (
  `id` int(11) NOT NULL,
  `perfil_salud_id` int(11) NOT NULL,
  `fecha` date NOT NULL,
  `respuesta` varchar(45) NOT NULL,
  `encuesta_salud_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `perfil_salud_has_encuesta_salud`
--

INSERT INTO `perfil_salud_has_encuesta_salud` (`id`, `perfil_salud_id`, `fecha`, `respuesta`, `encuesta_salud_id`) VALUES
(1, 1, '2021-02-11', 'NO', 1),
(2, 1, '2021-02-11', 'NO', 2),
(3, 1, '2021-02-11', 'NO', 3),
(4, 1, '2021-02-11', 'NO', 4),
(5, 1, '2021-02-11', 'NO', 5),
(6, 1, '2021-02-11', 'NO', 6),
(7, 1, '2021-02-11', 'NO', 7),
(8, 1, '2021-02-11', 'NO', 8),
(9, 1, '2021-02-11', 'NO', 9),
(10, 1, '2021-02-11', 'NO', 10),
(11, 1, '2021-02-11', 'NO', 11),
(12, 1, '2021-02-11', 'NO', 12),
(13, 1, '2021-02-11', 'NO', 13),
(14, 1, '2021-02-11', 'NO', 14),
(15, 1, '2021-02-11', 'NO', 15),
(16, 1, '2021-02-11', 'NO', 16),
(17, 1, '2021-02-11', 'NO', 17),
(18, 1, '2021-02-11', 'NO', 18),
(19, 1, '2021-02-11', 'NO', 19),
(20, 1, '2021-02-11', 'NO', 20),
(21, 1, '2021-02-11', 'NO', 21),
(22, 1, '2021-02-11', 'NO', 22),
(23, 1, '2021-02-11', 'NO', 23),
(24, 1, '2021-02-11', 'NO', 24),
(25, 1, '2021-02-11', 'NO', 25),
(26, 1, '2021-02-11', 'NO', 26),
(27, 1, '2021-02-11', 'NO', 27),
(28, 1, '2021-02-11', 'NO', 28),
(29, 1, '2021-02-11', 'NO', 29),
(30, 1, '2021-02-11', 'NO', 30),
(31, 1, '2021-02-11', 'NO', 31),
(32, 1, '2021-02-11', 'NO', 32),
(33, 1, '2021-02-11', 'NO', 1),
(34, 1, '2021-02-11', 'NO', 2),
(35, 1, '2021-02-11', 'NO', 3),
(36, 1, '2021-02-11', 'NO', 4),
(37, 1, '2021-02-11', 'NO', 5),
(38, 1, '2021-02-11', 'NO', 6),
(39, 1, '2021-02-11', 'NO', 7),
(40, 1, '2021-02-11', 'NO', 8),
(41, 1, '2021-02-11', 'NO', 9),
(42, 1, '2021-02-11', 'NO', 10),
(43, 1, '2021-02-11', 'NO', 11),
(44, 1, '2021-02-11', 'NO', 12),
(45, 1, '2021-02-11', 'NO', 13),
(46, 1, '2021-02-11', 'NO', 14),
(47, 1, '2021-02-11', 'NO', 15),
(48, 1, '2021-02-11', 'NO', 16),
(49, 1, '2021-02-11', 'NO', 17),
(50, 1, '2021-02-11', 'NO', 18),
(51, 1, '2021-02-11', 'NO', 19),
(52, 1, '2021-02-11', 'NO', 20),
(53, 1, '2021-02-11', 'NO', 21),
(54, 1, '2021-02-11', 'NO', 22),
(55, 1, '2021-02-11', 'NO', 23),
(56, 1, '2021-02-11', 'NO', 24),
(57, 1, '2021-02-11', 'NO', 25),
(58, 1, '2021-02-11', 'NO', 26),
(59, 1, '2021-02-11', 'NO', 27),
(60, 1, '2021-02-11', 'NO', 28),
(61, 1, '2021-02-11', 'SI', 29),
(62, 1, '2021-02-11', 'NO', 30),
(63, 1, '2021-02-11', 'SI', 31),
(64, 1, '2021-02-11', 'SI', 32),
(65, 1, '2021-02-11', 'SI', 1),
(66, 1, '2021-02-11', 'NO', 2),
(67, 1, '2021-02-11', 'NO', 3),
(68, 1, '2021-02-11', 'NO', 4),
(69, 1, '2021-02-11', 'NO', 5),
(70, 1, '2021-02-11', 'NO', 6),
(71, 1, '2021-02-11', 'NO', 7),
(72, 1, '2021-02-11', 'NO', 8),
(73, 1, '2021-02-11', 'NO', 9),
(74, 1, '2021-02-11', 'NO', 10),
(75, 1, '2021-02-11', 'NO', 11),
(76, 1, '2021-02-11', 'NO', 12),
(77, 1, '2021-02-11', 'NO', 13),
(78, 1, '2021-02-11', 'NO', 14),
(79, 1, '2021-02-11', 'NO', 15),
(80, 1, '2021-02-11', 'NO', 16),
(81, 1, '2021-02-11', 'NO', 17),
(82, 1, '2021-02-11', 'NO', 18),
(83, 1, '2021-02-11', 'NO', 19),
(84, 1, '2021-02-11', 'NO', 20),
(85, 1, '2021-02-11', 'NO', 21),
(86, 1, '2021-02-11', 'NO', 22),
(87, 1, '2021-02-11', 'NO', 23),
(88, 1, '2021-02-11', 'NO', 24),
(89, 1, '2021-02-11', 'NO', 25),
(90, 1, '2021-02-11', 'NO', 26),
(91, 1, '2021-02-11', 'NO', 27),
(92, 1, '2021-02-11', 'NO', 28),
(93, 1, '2021-02-11', 'NO', 29),
(94, 1, '2021-02-11', 'NO', 30),
(95, 1, '2021-02-11', 'NO', 31),
(96, 1, '2021-02-11', 'NO', 32);

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `perfil_salud_has_encuesta_salud`
--
ALTER TABLE `perfil_salud_has_encuesta_salud`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_perfil_salud_has_encuestra_salud_perfil_salud1_idx` (`perfil_salud_id`),
  ADD KEY `fk_perfil_salud_has_encuesta_salud_encuesta_salud1_idx` (`encuesta_salud_id`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `perfil_salud_has_encuesta_salud`
--
ALTER TABLE `perfil_salud_has_encuesta_salud`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=97;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `perfil_salud_has_encuesta_salud`
--
ALTER TABLE `perfil_salud_has_encuesta_salud`
  ADD CONSTRAINT `fk_perfil_salud_has_encuesta_salud_encuesta_salud1` FOREIGN KEY (`encuesta_salud_id`) REFERENCES `encuesta_salud` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_perfil_salud_has_encuestra_salud_perfil_salud1` FOREIGN KEY (`perfil_salud_id`) REFERENCES `perfil_salud` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
