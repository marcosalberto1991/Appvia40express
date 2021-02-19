-- phpMyAdmin SQL Dump
-- version 5.0.3
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 19-02-2021 a las 16:13:56
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
-- Estructura de tabla para la tabla `granularesdetalle`
--

CREATE TABLE `granularesdetalle` (
  `id` int(11) NOT NULL,
  `item` varchar(200) NOT NULL,
  `tipo_capa_id` int(11) NOT NULL,
  `si_aplica` varchar(2) DEFAULT NULL,
  `abcisado_inicial` varchar(45) DEFAULT NULL,
  `abcisado_final` varchar(45) DEFAULT NULL,
  `si_supervisado` varchar(2) DEFAULT NULL,
  `fecha` date DEFAULT NULL,
  `observaciones` varchar(500) DEFAULT NULL,
  `granulares_id` int(11) NOT NULL,
  `updated_at` varchar(20) NOT NULL,
  `created_at` varchar(20) NOT NULL,
  `foto` varchar(5) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `granularesdetalle`
--

INSERT INTO `granularesdetalle` (`id`, `item`, `tipo_capa_id`, `si_aplica`, `abcisado_inicial`, `abcisado_final`, `si_supervisado`, `fecha`, `observaciones`, `granulares_id`, `updated_at`, `created_at`, `foto`) VALUES
(6, '', 8, '0', 'PR30+15053', 'PR30+1503', '1', '2021-02-17', 'No se evidencia ensayo de cono dinámico de', 1, '2021-02-19 13:14:08', '2021-02-18 20:45:03', ''),
(7, '', 8, '1', 'PR30+150', 'PR30+150', '1', '2021-02-18', 'Se desconoce si se requiere mejoramiento de la subrasante.', 1, '2021-02-19 13:13:47', '2021-02-18 20:45:03', ''),
(9, ' <b>Material</b>', 17, '3', NULL, NULL, NULL, '2021-02-18', NULL, 1, '2021-02-18 21:36:38', '2021-02-18 21:36:38', ''),
(10, '<b>Topografía</b>   Control topográfico por parte del contratista', 17, '3', NULL, NULL, NULL, '2021-02-18', NULL, 1, '2021-02-18 21:36:38', '2021-02-18 21:36:38', ''),
(11, ' <b>Ensayos</b>  (Densidades) Porcentaje de compactación', 17, '3', NULL, NULL, NULL, '2021-02-18', NULL, 1, '2021-02-18 21:36:38', '2021-02-18 21:36:38', ''),
(12, '<b>Prueba de carga</b>  Volqueta cargada', 17, '3', NULL, NULL, NULL, '2021-02-18', NULL, 1, '2021-02-18 21:36:38', '2021-02-18 21:36:38', ''),
(13, '<b>Imprimación</b>', 17, '3', NULL, NULL, NULL, '2021-02-18', NULL, 1, '2021-02-18 21:36:38', '2021-02-18 21:36:38', ''),
(14, '<b>Riego de liga</b>', 17, '3', NULL, NULL, NULL, '2021-02-18', NULL, 1, '2021-02-18 21:36:38', '2021-02-18 21:36:38', ''),
(15, 'Ensayo del cono dinámico (PDC)				', 18, '0', 'PR30+150', 'PR30+150', '0', '2021-02-01', 'No se evidencia ensayo de cono dinámico', 2, '2021-02-19 15:12:01', '2021-02-19 14:54:47', ''),
(16, 'Mejoramiento de subrasante', 18, '0', 'PR30+150', 'PR30+150', '0', '2021-02-17', 'Se desconoce si se requiere mejoramiento de la subrasante.', 2, '2021-02-19 15:12:04', '2021-02-19 14:54:47', ''),
(17, ' <b>Material</b>', 19, '1', 'PR30+150', 'PR30+150', 'nu', '2021-02-19', 'null', 2, '2021-02-19 15:05:50', '2021-02-19 14:54:52', ''),
(18, '<b>Topografía</b>   Control topográfico por parte del contratista', 19, '1', 'PR30+150', 'null', 'nu', '2021-02-19', 'null', 2, '2021-02-19 15:05:18', '2021-02-19 14:54:52', ''),
(19, ' <b>Ensayos</b>  (Densidades) Porcentaje de compactación', 19, '1', 'null', 'null', 'nu', '2021-02-19', 'null', 2, '2021-02-19 15:05:14', '2021-02-19 14:54:53', ''),
(20, '<b>Prueba de carga</b>  Volqueta cargada', 19, '3', NULL, NULL, NULL, '2021-02-19', NULL, 2, '2021-02-19 14:54:53', '2021-02-19 14:54:53', ''),
(21, '<b>Imprimación</b>', 19, '3', NULL, NULL, NULL, '2021-02-19', NULL, 2, '2021-02-19 14:54:53', '2021-02-19 14:54:53', ''),
(22, '<b>Riego de liga</b>', 19, '3', NULL, NULL, NULL, '2021-02-19', NULL, 2, '2021-02-19 14:54:53', '2021-02-19 14:54:53', '');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `granularesdetalle`
--
ALTER TABLE `granularesdetalle`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_granularesdetalle_granulares1_idx` (`granulares_id`),
  ADD KEY `fk_granularesdetalle_tipo_capa1_idx` (`tipo_capa_id`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `granularesdetalle`
--
ALTER TABLE `granularesdetalle`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `granularesdetalle`
--
ALTER TABLE `granularesdetalle`
  ADD CONSTRAINT `fk_granularesdetalle_granulares1` FOREIGN KEY (`granulares_id`) REFERENCES `granulares` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_granularesdetalle_tipo_capa1` FOREIGN KEY (`tipo_capa_id`) REFERENCES `tipo_capa` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
