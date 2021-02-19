-- phpMyAdmin SQL Dump
-- version 5.0.3
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 19-02-2021 a las 16:13:27
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
-- Estructura de tabla para la tabla `granulares`
--

CREATE TABLE `granulares` (
  `id` int(11) NOT NULL,
  `proyecto` varchar(300) NOT NULL,
  `plano_informe` varchar(45) NOT NULL,
  `version` varchar(45) NOT NULL,
  `calzada` varchar(45) NOT NULL,
  `actividad_pavimento` varchar(45) NOT NULL,
  `actividad_terraplen` varchar(45) NOT NULL,
  `actividad_relleno` varchar(45) NOT NULL,
  `especifique_estrutura` varchar(45) NOT NULL,
  `users_id` bigint(20) NOT NULL,
  `unidad_funcional_id` int(11) NOT NULL,
  `abcisado_de` varchar(45) DEFAULT NULL,
  `abcisado_a` varchar(45) DEFAULT NULL,
  `latitud` varchar(45) DEFAULT NULL,
  `longitud` varchar(45) DEFAULT NULL,
  `estado_tramite_id` int(11) NOT NULL DEFAULT 1,
  `updated_at` varchar(45) NOT NULL,
  `created_at` varchar(45) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `granulares`
--

INSERT INTO `granulares` (`id`, `proyecto`, `plano_informe`, `version`, `calzada`, `actividad_pavimento`, `actividad_terraplen`, `actividad_relleno`, `especifique_estrutura`, `users_id`, `unidad_funcional_id`, `abcisado_de`, `abcisado_a`, `latitud`, `longitud`, `estado_tramite_id`, `updated_at`, `created_at`) VALUES
(1, 'eeee', 'eee', 'eee', 'eee', 'ee', 'eee', 'eee', 'eee', 1, 4, 'ee', 'eee', '55', '55', 1, '2021-02-18 16:43:20', '2021-02-18 16:43:20'),
(2, 'rrrr', 'ttt', 'ttt', 'tt', 'tt', 'tt', 'tt', 'tt', 1, 4, 'eee', 'rrr', '54', '54', 1, '2021-02-19 14:54:41', '2021-02-19 14:54:41');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `granulares`
--
ALTER TABLE `granulares`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `granulares`
--
ALTER TABLE `granulares`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
