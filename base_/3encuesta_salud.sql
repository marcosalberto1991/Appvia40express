-- phpMyAdmin SQL Dump
-- version 5.0.3
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 11-02-2021 a las 21:05:35
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
-- Estructura de tabla para la tabla `encuesta_salud`
--

CREATE TABLE `encuesta_salud` (
  `id` int(11) NOT NULL,
  `nombre` varchar(500) DEFAULT NULL,
  `is_titulo` varchar(5) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `encuesta_salud`
--

INSERT INTO `encuesta_salud` (`id`, `nombre`, `is_titulo`) VALUES
(1, 'Patologías de Salud\r\n', '1'),
(2, '¿Presión arterial alta?\r\n', '0'),
(3, '¿Enfermedades Cardiovasculares?', '0'),
(4, '¿Diabetes?\r\n', '0'),
(5, '¿Enfermedades Pulmonares?\r\n', '0'),
(6, '¿Mal nutrición (Obesidad o desnutrición)?\r\n', '0'),
(7, '¿Accidente Cerebrovascular (ACV)?\r\n', '0'),
(8, '¿VIH o cáncer?\r\n', '0'),
(9, '¿Uso de corticoides o inmunosupresores?', '0'),
(10, '¿Enfermedad Pulmonar Obstructiva -EPOC?', '0'),
(11, '¿Covid 19 diagnosticado?', '0'),
(12, 'Tamizaje de Riesgo\r\n', '1'),
(13, '¿ Ha viajado los últimos 14 días al exterior ?', '0'),
(14, '¿ Ha tenido contacto con una persona que haya tenido síntomas gripales y que haya venido del extranjero?', '0'),
(15, '¿Ha tenido contacto directo con una persona diagnosticada con COVID-19?', '0'),
(16, '¿Tiene algún familiar con las condiciones anteriores A y B? O con las patologías mencionadas?', '0'),
(17, '¿Es acompañante de algún familiar hospitalizado?', '0'),
(18, 'Estado de Salud (Autoevaluación)', '1'),
(19, '¿Presenta dificultad para respirar? *\r\n', '0'),
(20, '¿Dolor o presión constante en el pecho? *\r\n', '0'),
(21, '¿Dolor de garganta?', '0'),
(22, '¿Tos?', '0'),
(23, '¿Fiebre de difícil control 37,5° o mas por más de 3 días?', '0'),
(24, '¿Estas acalorado o, por el contrario, con frío o escalofríos?', '0'),
(25, '¿Congestión nasal, secreciones nasales?', ''),
(26, '¿Fatiga?', '0'),
(27, '¿Esta en autoaislamiento?', '0'),
(28, '¿Dolor de cabeza?', '0'),
(29, '¿Diarrea?', '0'),
(30, '¿Perdida de olfato o gusto?', '0'),
(31, '¿Dolor muscular?', '0'),
(32, '¿Erupción cutánea?', '0');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `encuesta_salud`
--
ALTER TABLE `encuesta_salud`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `encuesta_salud`
--
ALTER TABLE `encuesta_salud`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=33;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
