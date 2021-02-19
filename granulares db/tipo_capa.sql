-- phpMyAdmin SQL Dump
-- version 5.0.3
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 19-02-2021 a las 16:14:42
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
-- Estructura de tabla para la tabla `tipo_capa`
--

CREATE TABLE `tipo_capa` (
  `id` int(11) NOT NULL,
  `nombre` varchar(45) NOT NULL,
  `material` varchar(45) NOT NULL,
  `capa_n` varchar(45) NOT NULL,
  `granulares_id` int(11) NOT NULL,
  `si_subrasante` varchar(2) NOT NULL,
  `created_at` varchar(20) NOT NULL,
  `updated_at` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `tipo_capa`
--

INSERT INTO `tipo_capa` (`id`, `nombre`, `material`, `capa_n`, `granulares_id`, `si_subrasante`, `created_at`, `updated_at`) VALUES
(8, 'rrrr', 'rrrr', 'rrrr', 1, '1', '2021-02-18 20:45:03', '2021-02-18 20:45:03'),
(17, 'Capa N°', ' ', ' ', 1, '0', '2021-02-18 21:36:38', '2021-02-18 21:36:38'),
(18, ' ', ' ', ' ', 2, '1', '2021-02-19 14:54:47', '2021-02-19 14:54:47'),
(19, 'Capa N°', ' ', ' ', 2, '0', '2021-02-19 14:54:52', '2021-02-19 14:54:52');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `tipo_capa`
--
ALTER TABLE `tipo_capa`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `tipo_capa`
--
ALTER TABLE `tipo_capa`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
