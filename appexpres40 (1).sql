-- phpMyAdmin SQL Dump
-- version 5.0.3
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 09-02-2021 a las 21:08:33
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
-- Estructura de tabla para la tabla `acero`
--

CREATE TABLE `acero` (
  `id` bigint(20) NOT NULL,
  `users_id` bigint(20) NOT NULL,
  `estrutura` varchar(45) DEFAULT NULL,
  `plano` varchar(45) DEFAULT NULL,
  `calzada` varchar(45) DEFAULT NULL,
  `elemento` varchar(45) DEFAULT NULL,
  `version` varchar(45) DEFAULT NULL,
  `estado_tramite_id` int(11) NOT NULL,
  `unidad_funcional_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `acero`
--

INSERT INTO `acero` (`id`, `users_id`, `estrutura`, `plano`, `calzada`, `elemento`, `version`, `estado_tramite_id`, `unidad_funcional_id`) VALUES
(1, 1, 'qqqq', 'qqqq', 'qqqq', 'qqq', 'qqq', 2, 2),
(2, 1, 'trtr', 'trtr', 'trt', 'trt', 'trt', 1, 2),
(3, 1, 'rer', 'rer', 'er', 'ere', 'ere', 1, 2),
(4, 1, 'eee', 'eee', 'ee', 'ee', 'eee', 1, 3),
(5, 1, 'ewew', 'ewe', 'ewe', 'ewe', 'ewe', 1, 2);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `aceroregistrofotografico`
--

CREATE TABLE `aceroregistrofotografico` (
  `id` int(11) NOT NULL,
  `nombre` varchar(45) NOT NULL,
  `acero_detalle_id` bigint(20) NOT NULL,
  `created_at` varchar(45) DEFAULT NULL,
  `updated_at` varchar(45) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `aceroregistrofotografico`
--

INSERT INTO `aceroregistrofotografico` (`id`, `nombre`, `acero_detalle_id`, `created_at`, `updated_at`) VALUES
(1, '-20210123_142409.jpgser.jpg', 3, '2021-02-09 18:13:37', '2021-02-09 18:13:37'),
(2, '1-20210123_142321.jpgser.jpg', 1, '2021-02-09 18:15:22', '2021-02-09 18:15:22'),
(3, '5-20210123_142314.jpgser.jpg', 5, '2021-02-09 18:46:54', '2021-02-09 18:46:54');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `acero_detalle`
--

CREATE TABLE `acero_detalle` (
  `id` bigint(20) NOT NULL,
  `actividad` varchar(200) NOT NULL,
  `si_aplica` varchar(1) NOT NULL,
  `si_cumple` varchar(1) NOT NULL,
  `fecha` varchar(45) NOT NULL,
  `observaciones` varchar(500) DEFAULT NULL,
  `registro_fotografico` varchar(45) NOT NULL,
  `acero_id` bigint(20) NOT NULL,
  `columna` int(1) NOT NULL,
  `created_at` timestamp(6) NOT NULL DEFAULT current_timestamp(6) ON UPDATE current_timestamp(6),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `acero_detalle`
--

INSERT INTO `acero_detalle` (`id`, `actividad`, `si_aplica`, `si_cumple`, `fecha`, `observaciones`, `registro_fotografico`, `acero_id`, `columna`, `created_at`, `updated_at`) VALUES
(1, '<b>Acero de refuerzo</b> con las formas indicadas en los planos, cumpliendo con despieces y diagramas de diseño', '1', '0', '2020-01-15', 'no tiene nada q', 'ing-industrial1-blog.jpgstr_random(5).jpg', 1, 3, '2021-02-09 17:55:45.171422', '2021-02-09 22:55:45'),
(2, '<b>Estado del refuerzo</b> Las varillas y alambres de amarres no presentan alto grado de corrosión', '1', '3', '2020-01-05', 'rrre', 'sinfoto', 1, 3, '2021-02-09 18:08:30.799218', '2021-02-09 23:08:30'),
(3, ' <b>Recubrimiento y amarre</b>  Ubicación,  alineacion y espaciamiento  de acuerdo a los planos y normas.', '0', '3', '2020-01-05', NULL, 'sinfoto', 1, 3, '2021-02-09 18:10:47.456192', '2021-02-09 23:10:47'),
(4, '<b>Acero de refuerzo</b> con las formas indicadas en los planos, cumpliendo con despieces y diagramas de diseño', '1', '3', '2021-02-09', NULL, 'sinfoto', 3, 3, '2021-02-09 18:46:20.664955', '2021-02-09 23:46:20'),
(5, '<b>Estado del refuerzo</b> Las varillas y alambres de amarres no presentan alto grado de corrosión', '1', '0', '2021-02-09', 'como esta', 'sinfoto', 3, 3, '2021-02-09 18:46:51.212610', '2021-02-09 23:46:51'),
(6, ' <b>Recubrimiento y amarre</b>  Ubicación,  alineacion y espaciamiento  de acuerdo a los planos y normas.', '1', '0', '2020-01-08', 'null e', 'sinfoto', 3, 3, '2021-02-09 18:47:08.477042', '2021-02-09 23:47:08'),
(7, '<b>Acero de refuerzo</b> con las formas indicadas en los planos, cumpliendo con despieces y diagramas de diseño', '3', '3', '18:49:50', ' ', 'sinfoto', 4, 3, '2021-02-09 23:49:50.000000', '2021-02-09 23:49:50'),
(8, '<b>Estado del refuerzo</b> Las varillas y alambres de amarres no presentan alto grado de corrosión', '3', '3', '18:49:50', ' ', 'sinfoto', 4, 3, '2021-02-09 23:49:50.000000', '2021-02-09 23:49:50'),
(9, ' <b>Recubrimiento y amarre</b>  Ubicación,  alineacion y espaciamiento  de acuerdo a los planos y normas.', '3', '3', '18:49:50', ' ', 'sinfoto', 4, 3, '2021-02-09 23:49:50.000000', '2021-02-09 23:49:50'),
(10, '<b>Acero de refuerzo</b> con las formas indicadas en los planos, cumpliendo con despieces y diagramas de diseño', '3', '3', '2021-02-09 18:53:19', ' ', 'sinfoto', 5, 3, '2021-02-09 23:53:19.000000', '2021-02-09 23:53:19'),
(11, '<b>Estado del refuerzo</b> Las varillas y alambres de amarres no presentan alto grado de corrosión', '1', '0', '2021-02-09 18:53:19', 'null', 'sinfoto', 5, 3, '2021-02-09 18:55:33.280953', '2021-02-09 23:55:33'),
(12, ' <b>Recubrimiento y amarre</b>  Ubicación,  alineacion y espaciamiento  de acuerdo a los planos y normas.', '1', '1', '2021-02-09', 'null', 'sinfoto', 5, 3, '2021-02-09 18:55:45.581883', '2021-02-09 23:55:45');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `audits`
--

CREATE TABLE `audits` (
  `id` int(10) UNSIGNED NOT NULL,
  `user_type` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `event` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `auditable_id` int(10) UNSIGNED NOT NULL,
  `auditable_type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `old_values` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `new_values` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `url` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `ip_address` varchar(45) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `user_agent` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `tags` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `audits`
--

INSERT INTO `audits` (`id`, `user_type`, `user_id`, `event`, `auditable_id`, `auditable_type`, `old_values`, `new_values`, `url`, `ip_address`, `user_agent`, `tags`, `created_at`, `updated_at`) VALUES
(1, 'App\\User', 1, 'created', 4, 'App\\ConcretoDetallesModel', '[]', '{\"columna\":\"1\",\"titulo\":\"<b>Localizaci\\u00f3n y replanteo<\\/b>  Ubicaci\\u00f3n de elemento cumple con planos de dise\\u00f1o\",\"si_aplica\":\"3\",\"si_cumple\":\"3\",\"fecha\":\"2020-01-05\",\"observaciones\":\" \",\"registro_fotografico\":\"sinfoto\",\"concreto_id\":\"1\",\"id\":4}', 'http://127.0.0.1:8000/Api/ConcretoDetalles/1/consulta_data', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/88.0.4324.104 Safari/537.36', NULL, '2021-02-02 23:13:51', '2021-02-02 23:13:51'),
(2, 'App\\User', 1, 'created', 5, 'App\\ConcretoDetallesModel', '[]', '{\"columna\":\"1\",\"titulo\":\"<b>Verticalidad<\\/b>  Elemento cumple con planos y dise\\u00f1os\",\"si_aplica\":\"3\",\"si_cumple\":\"3\",\"fecha\":\"2020-01-05\",\"observaciones\":\" \",\"registro_fotografico\":\"sinfoto\",\"concreto_id\":\"1\",\"id\":5}', 'http://127.0.0.1:8000/Api/ConcretoDetalles/1/consulta_data', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/88.0.4324.104 Safari/537.36', NULL, '2021-02-02 23:13:51', '2021-02-02 23:13:51'),
(3, 'App\\User', 1, 'created', 6, 'App\\ConcretoDetallesModel', '[]', '{\"columna\":\"1\",\"titulo\":\" <b>Solado<\\/b> Concreto de limpieza y nivelaci\\u00f3n\",\"si_aplica\":\"3\",\"si_cumple\":\"3\",\"fecha\":\"2020-01-05\",\"observaciones\":\" \",\"registro_fotografico\":\"sinfoto\",\"concreto_id\":\"1\",\"id\":6}', 'http://127.0.0.1:8000/Api/ConcretoDetalles/1/consulta_data', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/88.0.4324.104 Safari/537.36', NULL, '2021-02-02 23:13:51', '2021-02-02 23:13:51'),
(4, 'App\\User', 1, 'created', 7, 'App\\ConcretoDetallesModel', '[]', '{\"columna\":\"1\",\"titulo\":\"<b>Desmoldante<\\/b> Paredes de Formaleta cuentan con desmoldante que permitira en desencofre de la estructura\",\"si_aplica\":\"3\",\"si_cumple\":\"3\",\"fecha\":\"2020-01-05\",\"observaciones\":\" \",\"registro_fotografico\":\"sinfoto\",\"concreto_id\":\"1\",\"id\":7}', 'http://127.0.0.1:8000/Api/ConcretoDetalles/1/consulta_data', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/88.0.4324.104 Safari/537.36', NULL, '2021-02-02 23:13:51', '2021-02-02 23:13:51'),
(5, 'App\\User', 1, 'created', 8, 'App\\ConcretoDetallesModel', '[]', '{\"columna\":\"1\",\"titulo\":\" <b>Muestras de concreto<\\/b> - Toma de cilindros de concreto\",\"si_aplica\":\"3\",\"si_cumple\":\"3\",\"fecha\":\"2020-01-05\",\"observaciones\":\" \",\"registro_fotografico\":\"sinfoto\",\"concreto_id\":\"1\",\"id\":8}', 'http://127.0.0.1:8000/Api/ConcretoDetalles/1/consulta_data', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/88.0.4324.104 Safari/537.36', NULL, '2021-02-02 23:13:51', '2021-02-02 23:13:51'),
(6, 'App\\User', 1, 'created', 9, 'App\\ConcretoDetallesModel', '[]', '{\"columna\":\"1\",\"titulo\":\"<b>Temperatura<\\/b> - Temperatura m\\u00e1xima del concreto no mayor a 32 C.\",\"si_aplica\":\"3\",\"si_cumple\":\"3\",\"fecha\":\"2020-01-05\",\"observaciones\":\" \",\"registro_fotografico\":\"sinfoto\",\"concreto_id\":\"1\",\"id\":9}', 'http://127.0.0.1:8000/Api/ConcretoDetalles/1/consulta_data', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/88.0.4324.104 Safari/537.36', NULL, '2021-02-02 23:13:51', '2021-02-02 23:13:51'),
(7, 'App\\User', 1, 'created', 10, 'App\\ConcretoDetallesModel', '[]', '{\"columna\":\"1\",\"titulo\":\"<b>Asentamiento<\\/b> - Asentamiento dentro del rango de dise\\u00f1o.\",\"si_aplica\":\"3\",\"si_cumple\":\"3\",\"fecha\":\"2020-01-05\",\"observaciones\":\" \",\"registro_fotografico\":\"sinfoto\",\"concreto_id\":\"1\",\"id\":10}', 'http://127.0.0.1:8000/Api/ConcretoDetalles/1/consulta_data', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/88.0.4324.104 Safari/537.36', NULL, '2021-02-02 23:13:51', '2021-02-02 23:13:51'),
(8, 'App\\User', 1, 'created', 11, 'App\\ConcretoDetallesModel', '[]', '{\"columna\":\"1\",\"titulo\":\"<b>Seguridad<\\/b> Ubicaci\\u00f3n de formaleta segura que permita el trabajo de descarga del concreto sin inconvenientes.\",\"si_aplica\":\"3\",\"si_cumple\":\"3\",\"fecha\":\"2020-01-05\",\"observaciones\":\" \",\"registro_fotografico\":\"sinfoto\",\"concreto_id\":\"1\",\"id\":11}', 'http://127.0.0.1:8000/Api/ConcretoDetalles/1/consulta_data', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/88.0.4324.104 Safari/537.36', NULL, '2021-02-02 23:13:51', '2021-02-02 23:13:51'),
(9, 'App\\User', 1, 'created', 12, 'App\\ConcretoDetallesModel', '[]', '{\"columna\":\"2\",\"titulo\":\"<b>Curado<\\/b>  aplicaci\\u00f3n de productos para el curado del concreto (indicar en observaciones el m\\u00e9todo utilizado)\",\"si_aplica\":\"3\",\"si_cumple\":\"3\",\"fecha\":\"2020-01-05\",\"observaciones\":\" \",\"registro_fotografico\":\"sinfoto\",\"concreto_id\":\"1\",\"id\":12}', 'http://127.0.0.1:8000/Api/ConcretoDetalles/1/consulta_data', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/88.0.4324.104 Safari/537.36', NULL, '2021-02-02 23:13:51', '2021-02-02 23:13:51'),
(10, 'App\\User', 1, 'created', 13, 'App\\ConcretoDetallesModel', '[]', '{\"columna\":\"2\",\"titulo\":\"<b>Acabados<\\/b>  Elemento cumple con buenos acabados\",\"si_aplica\":\"3\",\"si_cumple\":\"3\",\"fecha\":\"2020-01-05\",\"observaciones\":\" \",\"registro_fotografico\":\"sinfoto\",\"concreto_id\":\"1\",\"id\":13}', 'http://127.0.0.1:8000/Api/ConcretoDetalles/1/consulta_data', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/88.0.4324.104 Safari/537.36', NULL, '2021-02-02 23:13:51', '2021-02-02 23:13:51'),
(11, 'App\\User', 1, 'created', 14, 'App\\ConcretoDetallesModel', '[]', '{\"columna\":\"2\",\"titulo\":\"<b>Juntas<\\/b> Elemento con juntas de dilataci\\u00f3n o construcci\\u00f3n\",\"si_aplica\":\"3\",\"si_cumple\":\"3\",\"fecha\":\"2020-01-05\",\"observaciones\":\" \",\"registro_fotografico\":\"sinfoto\",\"concreto_id\":\"1\",\"id\":14}', 'http://127.0.0.1:8000/Api/ConcretoDetalles/1/consulta_data', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/88.0.4324.104 Safari/537.36', NULL, '2021-02-02 23:13:51', '2021-02-02 23:13:51'),
(12, 'App\\User', 1, 'created', 15, 'App\\ConcretoDetallesModel', '[]', '{\"columna\":\"2\",\"titulo\":\"<b>Fisuras<\\/b> Presencia de fisuras despu\\u00e9s de la fundida\",\"si_aplica\":\"3\",\"si_cumple\":\"3\",\"fecha\":\"2020-01-05\",\"observaciones\":\" \",\"registro_fotografico\":\"sinfoto\",\"concreto_id\":\"1\",\"id\":15}', 'http://127.0.0.1:8000/Api/ConcretoDetalles/1/consulta_data', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/88.0.4324.104 Safari/537.36', NULL, '2021-02-02 23:13:51', '2021-02-02 23:13:51'),
(13, 'App\\User', 1, 'created', 16, 'App\\ConcretoDetallesModel', '[]', '{\"columna\":\"1\",\"titulo\":\"<b>Localizaci\\u00f3n y replanteo<\\/b>  Ubicaci\\u00f3n de elemento cumple con planos de dise\\u00f1o\",\"si_aplica\":\"3\",\"si_cumple\":\"3\",\"fecha\":\"2020-01-05\",\"observaciones\":\" \",\"registro_fotografico\":\"sinfoto\",\"concreto_id\":\"4\",\"id\":16}', 'http://127.0.0.1:8000/Api/ConcretoDetalles/4/consulta_data', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/88.0.4324.104 Safari/537.36', NULL, '2021-02-03 02:30:39', '2021-02-03 02:30:39'),
(14, 'App\\User', 1, 'created', 17, 'App\\ConcretoDetallesModel', '[]', '{\"columna\":\"1\",\"titulo\":\"<b>Verticalidad<\\/b>  Elemento cumple con planos y dise\\u00f1os\",\"si_aplica\":\"3\",\"si_cumple\":\"3\",\"fecha\":\"2020-01-05\",\"observaciones\":\" \",\"registro_fotografico\":\"sinfoto\",\"concreto_id\":\"4\",\"id\":17}', 'http://127.0.0.1:8000/Api/ConcretoDetalles/4/consulta_data', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/88.0.4324.104 Safari/537.36', NULL, '2021-02-03 02:30:39', '2021-02-03 02:30:39'),
(15, 'App\\User', 1, 'created', 18, 'App\\ConcretoDetallesModel', '[]', '{\"columna\":\"1\",\"titulo\":\" <b>Solado<\\/b> Concreto de limpieza y nivelaci\\u00f3n\",\"si_aplica\":\"3\",\"si_cumple\":\"3\",\"fecha\":\"2020-01-05\",\"observaciones\":\" \",\"registro_fotografico\":\"sinfoto\",\"concreto_id\":\"4\",\"id\":18}', 'http://127.0.0.1:8000/Api/ConcretoDetalles/4/consulta_data', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/88.0.4324.104 Safari/537.36', NULL, '2021-02-03 02:30:39', '2021-02-03 02:30:39'),
(16, 'App\\User', 1, 'created', 19, 'App\\ConcretoDetallesModel', '[]', '{\"columna\":\"1\",\"titulo\":\"<b>Desmoldante<\\/b> Paredes de Formaleta cuentan con desmoldante que permitira en desencofre de la estructura\",\"si_aplica\":\"3\",\"si_cumple\":\"3\",\"fecha\":\"2020-01-05\",\"observaciones\":\" \",\"registro_fotografico\":\"sinfoto\",\"concreto_id\":\"4\",\"id\":19}', 'http://127.0.0.1:8000/Api/ConcretoDetalles/4/consulta_data', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/88.0.4324.104 Safari/537.36', NULL, '2021-02-03 02:30:39', '2021-02-03 02:30:39'),
(17, 'App\\User', 1, 'created', 20, 'App\\ConcretoDetallesModel', '[]', '{\"columna\":\"1\",\"titulo\":\" <b>Muestras de concreto<\\/b> - Toma de cilindros de concreto\",\"si_aplica\":\"3\",\"si_cumple\":\"3\",\"fecha\":\"2020-01-05\",\"observaciones\":\" \",\"registro_fotografico\":\"sinfoto\",\"concreto_id\":\"4\",\"id\":20}', 'http://127.0.0.1:8000/Api/ConcretoDetalles/4/consulta_data', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/88.0.4324.104 Safari/537.36', NULL, '2021-02-03 02:30:39', '2021-02-03 02:30:39'),
(18, 'App\\User', 1, 'created', 21, 'App\\ConcretoDetallesModel', '[]', '{\"columna\":\"1\",\"titulo\":\"<b>Temperatura<\\/b> - Temperatura m\\u00e1xima del concreto no mayor a 32 C.\",\"si_aplica\":\"3\",\"si_cumple\":\"3\",\"fecha\":\"2020-01-05\",\"observaciones\":\" \",\"registro_fotografico\":\"sinfoto\",\"concreto_id\":\"4\",\"id\":21}', 'http://127.0.0.1:8000/Api/ConcretoDetalles/4/consulta_data', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/88.0.4324.104 Safari/537.36', NULL, '2021-02-03 02:30:39', '2021-02-03 02:30:39'),
(19, 'App\\User', 1, 'created', 22, 'App\\ConcretoDetallesModel', '[]', '{\"columna\":\"1\",\"titulo\":\"<b>Asentamiento<\\/b> - Asentamiento dentro del rango de dise\\u00f1o.\",\"si_aplica\":\"3\",\"si_cumple\":\"3\",\"fecha\":\"2020-01-05\",\"observaciones\":\" \",\"registro_fotografico\":\"sinfoto\",\"concreto_id\":\"4\",\"id\":22}', 'http://127.0.0.1:8000/Api/ConcretoDetalles/4/consulta_data', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/88.0.4324.104 Safari/537.36', NULL, '2021-02-03 02:30:39', '2021-02-03 02:30:39'),
(20, 'App\\User', 1, 'created', 23, 'App\\ConcretoDetallesModel', '[]', '{\"columna\":\"1\",\"titulo\":\"<b>Seguridad<\\/b> Ubicaci\\u00f3n de formaleta segura que permita el trabajo de descarga del concreto sin inconvenientes.\",\"si_aplica\":\"3\",\"si_cumple\":\"3\",\"fecha\":\"2020-01-05\",\"observaciones\":\" \",\"registro_fotografico\":\"sinfoto\",\"concreto_id\":\"4\",\"id\":23}', 'http://127.0.0.1:8000/Api/ConcretoDetalles/4/consulta_data', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/88.0.4324.104 Safari/537.36', NULL, '2021-02-03 02:30:39', '2021-02-03 02:30:39'),
(21, 'App\\User', 1, 'created', 24, 'App\\ConcretoDetallesModel', '[]', '{\"columna\":\"2\",\"titulo\":\"<b>Curado<\\/b>  aplicaci\\u00f3n de productos para el curado del concreto (indicar en observaciones el m\\u00e9todo utilizado)\",\"si_aplica\":\"3\",\"si_cumple\":\"3\",\"fecha\":\"2020-01-05\",\"observaciones\":\" \",\"registro_fotografico\":\"sinfoto\",\"concreto_id\":\"4\",\"id\":24}', 'http://127.0.0.1:8000/Api/ConcretoDetalles/4/consulta_data', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/88.0.4324.104 Safari/537.36', NULL, '2021-02-03 02:30:39', '2021-02-03 02:30:39'),
(22, 'App\\User', 1, 'created', 25, 'App\\ConcretoDetallesModel', '[]', '{\"columna\":\"2\",\"titulo\":\"<b>Acabados<\\/b>  Elemento cumple con buenos acabados\",\"si_aplica\":\"3\",\"si_cumple\":\"3\",\"fecha\":\"2020-01-05\",\"observaciones\":\" \",\"registro_fotografico\":\"sinfoto\",\"concreto_id\":\"4\",\"id\":25}', 'http://127.0.0.1:8000/Api/ConcretoDetalles/4/consulta_data', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/88.0.4324.104 Safari/537.36', NULL, '2021-02-03 02:30:39', '2021-02-03 02:30:39'),
(23, 'App\\User', 1, 'created', 26, 'App\\ConcretoDetallesModel', '[]', '{\"columna\":\"2\",\"titulo\":\"<b>Juntas<\\/b> Elemento con juntas de dilataci\\u00f3n o construcci\\u00f3n\",\"si_aplica\":\"3\",\"si_cumple\":\"3\",\"fecha\":\"2020-01-05\",\"observaciones\":\" \",\"registro_fotografico\":\"sinfoto\",\"concreto_id\":\"4\",\"id\":26}', 'http://127.0.0.1:8000/Api/ConcretoDetalles/4/consulta_data', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/88.0.4324.104 Safari/537.36', NULL, '2021-02-03 02:30:39', '2021-02-03 02:30:39'),
(24, 'App\\User', 1, 'created', 27, 'App\\ConcretoDetallesModel', '[]', '{\"columna\":\"2\",\"titulo\":\"<b>Fisuras<\\/b> Presencia de fisuras despu\\u00e9s de la fundida\",\"si_aplica\":\"3\",\"si_cumple\":\"3\",\"fecha\":\"2020-01-05\",\"observaciones\":\" \",\"registro_fotografico\":\"sinfoto\",\"concreto_id\":\"4\",\"id\":27}', 'http://127.0.0.1:8000/Api/ConcretoDetalles/4/consulta_data', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/88.0.4324.104 Safari/537.36', NULL, '2021-02-03 02:30:39', '2021-02-03 02:30:39'),
(25, 'App\\User', 1, 'updated', 5, 'App\\ConcretoDetallesModel', '{\"observaciones\":\" \",\"registro_fotografico\":\"sinfoto\"}', '{\"observaciones\":\"no tiene\",\"registro_fotografico\":\"0e471f56-a86b-499b-9ed9-318fd001dcd1.jpgstr_random(5).jpg\"}', 'http://127.0.0.1:8000/Api/ConcretoDetalles_update/5', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/88.0.4324.104 Safari/537.36', NULL, '2021-02-03 03:29:13', '2021-02-03 03:29:13'),
(26, 'App\\User', 1, 'updated', 11, 'App\\ConcretoDetallesModel', '{\"si_aplica\":\"3\",\"si_cumple\":\"3\",\"observaciones\":\" \",\"registro_fotografico\":\"sinfoto\"}', '{\"si_aplica\":\"1\",\"si_cumple\":\"1\",\"observaciones\":\"no deje solo\",\"registro_fotografico\":\"dwnld-broucher-3.pngstr_random(5).png\"}', 'http://127.0.0.1:8000/Api/ConcretoDetalles_update/11', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/88.0.4324.104 Safari/537.36', NULL, '2021-02-03 03:30:52', '2021-02-03 03:30:52'),
(27, 'App\\User', 1, 'updated', 4, 'App\\ConcretoDetallesModel', '{\"observaciones\":\"no tiene\",\"registro_fotografico\":\"sinfoto\"}', '{\"observaciones\":\"no tiene st\",\"registro_fotografico\":\"0e471f56-a86b-499b-9ed9-318fd001dcd1.jpgstr_random(5).jpg\"}', 'http://127.0.0.1:8000/Api/ConcretoDetalles_update/4', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/88.0.4324.104 Safari/537.36', NULL, '2021-02-03 03:42:29', '2021-02-03 03:42:29'),
(28, 'App\\User', 1, 'updated', 10, 'App\\ConcretoDetallesModel', '{\"si_aplica\":\"3\",\"si_cumple\":\"3\",\"observaciones\":\" \"}', '{\"si_aplica\":\"1\",\"si_cumple\":\"1\",\"observaciones\":\"nada de\"}', 'http://127.0.0.1:8000/Api/ConcretoDetalles_update/10', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/88.0.4324.104 Safari/537.36', NULL, '2021-02-03 03:51:21', '2021-02-03 03:51:21'),
(29, 'App\\User', 1, 'updated', 7, 'App\\ConcretoDetallesModel', '{\"si_aplica\":\"3\",\"si_cumple\":\"3\",\"fecha\":\"2020-01-05\",\"observaciones\":\" \"}', '{\"si_aplica\":\"1\",\"si_cumple\":\"1\",\"fecha\":\"2021-02-02\",\"observaciones\":\"todo\"}', 'http://127.0.0.1:8000/Api/ConcretoDetalles_update/7', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/88.0.4324.104 Safari/537.36', NULL, '2021-02-03 04:04:40', '2021-02-03 04:04:40'),
(30, 'App\\User', 1, 'created', 1, 'App\\AceroModel', '[]', '{\"users_id\":1,\"estrutura\":\"qqqq\",\"plano\":\"qqqq\",\"calzada\":\"qqqq\",\"elemento\":\"qqq\",\"version\":\"qqq\",\"estado_tramite_id\":\"1\",\"unidad_funcional_id\":\"2\",\"id\":1}', 'http://127.0.0.1:8000/Api/Acero', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/88.0.4324.104 Safari/537.36', NULL, '2021-02-04 00:12:09', '2021-02-04 00:12:09'),
(31, 'App\\User', 1, 'created', 1, 'App\\AceroDetalleModel', '[]', '{\"columna\":\"3\",\"actividad\":\"<b>Acero de refuerzo<\\/b> con las formas indicadas en los planos, cumpliendo con despieces y diagramas de dise\\u00f1o\",\"si_aplica\":\"3\",\"si_cumple\":\"3\",\"fecha\":\"2020-01-05\",\"observaciones\":\" \",\"registro_fotografico\":\"sinfoto\",\"acero_id\":\"1\",\"id\":1}', 'http://127.0.0.1:8000/Api/AceroDetalle/1/consulta_data', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/88.0.4324.104 Safari/537.36', NULL, '2021-02-04 01:09:01', '2021-02-04 01:09:01'),
(32, 'App\\User', 1, 'created', 2, 'App\\AceroDetalleModel', '[]', '{\"columna\":\"3\",\"actividad\":\"<b>Estado del refuerzo<\\/b> Las varillas y alambres de amarres no presentan alto grado de corrosi\\u00f3n\",\"si_aplica\":\"3\",\"si_cumple\":\"3\",\"fecha\":\"2020-01-05\",\"observaciones\":\" \",\"registro_fotografico\":\"sinfoto\",\"acero_id\":\"1\",\"id\":2}', 'http://127.0.0.1:8000/Api/AceroDetalle/1/consulta_data', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/88.0.4324.104 Safari/537.36', NULL, '2021-02-04 01:09:01', '2021-02-04 01:09:01'),
(33, 'App\\User', 1, 'created', 3, 'App\\AceroDetalleModel', '[]', '{\"columna\":\"3\",\"actividad\":\" <b>Recubrimiento y amarre<\\/b>  Ubicaci\\u00f3n,  alineacion y espaciamiento  de acuerdo a los planos y normas.\",\"si_aplica\":\"3\",\"si_cumple\":\"3\",\"fecha\":\"2020-01-05\",\"observaciones\":\" \",\"registro_fotografico\":\"sinfoto\",\"acero_id\":\"1\",\"id\":3}', 'http://127.0.0.1:8000/Api/AceroDetalle/1/consulta_data', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/88.0.4324.104 Safari/537.36', NULL, '2021-02-04 01:09:01', '2021-02-04 01:09:01'),
(34, 'App\\User', 1, 'updated', 1, 'App\\AceroDetalleModel', '{\"si_aplica\":\"3\",\"si_cumple\":\"3\",\"fecha\":\"2020-01-05\",\"observaciones\":\" \",\"registro_fotografico\":\"sinfoto\"}', '{\"si_aplica\":\"1\",\"si_cumple\":\"0\",\"fecha\":\"2020-01-08\",\"observaciones\":\"no tiene nada\",\"registro_fotografico\":{}}', 'http://127.0.0.1:8000/Api/AceroDetalles_update/1', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/88.0.4324.104 Safari/537.36', NULL, '2021-02-04 01:31:22', '2021-02-04 01:31:22'),
(35, 'App\\User', 1, 'updated', 1, 'App\\AceroDetalleModel', '{\"registro_fotografico\":\"C:\\\\xampp\\\\tmp\\\\phpF293.tmp\"}', '{\"registro_fotografico\":\"ing-industrial1-blog.jpgstr_random(5).jpg\"}', 'http://127.0.0.1:8000/Api/AceroDetalles_update/1', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/88.0.4324.104 Safari/537.36', NULL, '2021-02-04 01:32:52', '2021-02-04 01:32:52'),
(36, 'App\\User', 1, 'updated', 4, 'App\\ConcretoDetallesModel', '{\"fecha\":\"2020-12-13\"}', '{\"fecha\":\"2020-12-16\"}', 'http://127.0.0.1:8000/Api/ConcretoDetalles_update/4', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/88.0.4324.104 Safari/537.36', NULL, '2021-02-04 02:16:29', '2021-02-04 02:16:29'),
(37, 'App\\User', 1, 'updated', 4, 'App\\ConcretoDetallesModel', '{\"observaciones\":\"no tiene st\"}', '{\"observaciones\":\"no tiene st st\"}', 'http://127.0.0.1:8000/Api/ConcretoDetalles_update/4', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/88.0.4324.104 Safari/537.36', NULL, '2021-02-04 02:16:37', '2021-02-04 02:16:37'),
(38, 'App\\User', 1, 'created', 1, 'App\\FresadoModel', '[]', '{\"unidad_funcional_id\":\"1\",\"calzada\":\"sss\",\"longitud\":\"sss\",\"plano_codigo\":\"sss\",\"version\":\"ss\",\"ancho_uno\":\"sss\",\"ancho_dos\":\"ss\",\"espesor_uno\":\"ss\",\"espesor_dos\":\"sss\",\"estado_tramite_id\":\"1\",\"id\":1}', 'http://127.0.0.1:8000/Api/Fresado', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/88.0.4324.104 Safari/537.36', NULL, '2021-02-04 03:32:03', '2021-02-04 03:32:03'),
(39, 'App\\User', 1, 'created', 1, 'App\\FresadoDetalleModel', '[]', '{\"columna\":\"4\",\"actividad\":\"<b>Seguridad  El frente de trabajo se encuentra se\\u00f1alizado de manera adecuada y aislado correctamente\",\"si_aplica\":\"3\",\"si_cumple\":\"3\",\"fecha\":\"2020-01-01\",\"observaciones\":\" \",\"registro_fotografico\":\"sinfoto\",\"fresado_id\":\"1\",\"id\":1}', 'http://127.0.0.1:8000/Api/FresadoDetalle/1/consulta_data', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/88.0.4324.104 Safari/537.36', NULL, '2021-02-04 04:04:53', '2021-02-04 04:04:53'),
(40, 'App\\User', 1, 'created', 2, 'App\\FresadoDetalleModel', '[]', '{\"columna\":\"4\",\"actividad\":\"<b>Localizaci\\u00f3n y replanteo  Se cuenta con control topogr\\u00e1fico de las actividades\",\"si_aplica\":\"3\",\"si_cumple\":\"3\",\"fecha\":\"2020-01-01\",\"observaciones\":\" \",\"registro_fotografico\":\"sinfoto\",\"fresado_id\":\"1\",\"id\":2}', 'http://127.0.0.1:8000/Api/FresadoDetalle/1/consulta_data', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/88.0.4324.104 Safari/537.36', NULL, '2021-02-04 04:04:53', '2021-02-04 04:04:53'),
(41, 'App\\User', 1, 'created', 3, 'App\\FresadoDetalleModel', '[]', '{\"columna\":\"4\",\"actividad\":\" <b>Seguridad  Las volquetas cuentan con sistema de autocarpado\",\"si_aplica\":\"3\",\"si_cumple\":\"3\",\"fecha\":\"2020-01-01\",\"observaciones\":\" \",\"registro_fotografico\":\"sinfoto\",\"fresado_id\":\"1\",\"id\":3}', 'http://127.0.0.1:8000/Api/FresadoDetalle/1/consulta_data', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/88.0.4324.104 Safari/537.36', NULL, '2021-02-04 04:04:53', '2021-02-04 04:04:53'),
(42, 'App\\User', 1, 'updated', 1, 'App\\FresadoDetalleModel', '{\"si_aplica\":\"3\",\"si_cumple\":\"3\",\"fecha\":\"2020-01-01\",\"observaciones\":\" \"}', '{\"si_aplica\":\"1\",\"si_cumple\":\"1\",\"fecha\":\"2020-01-15\",\"observaciones\":\"null dee\"}', 'http://127.0.0.1:8000/Api/FresadoDetalles_update/1', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/88.0.4324.104 Safari/537.36', NULL, '2021-02-04 04:08:32', '2021-02-04 04:08:32'),
(43, 'App\\User', 1, 'updated', 2, 'App\\FresadoDetalleModel', '{\"observaciones\":\" \"}', '{\"observaciones\":\"deeee\"}', 'http://127.0.0.1:8000/Api/FresadoDetalles_update/2', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/88.0.4324.104 Safari/537.36', NULL, '2021-02-04 04:09:24', '2021-02-04 04:09:24'),
(44, 'App\\User', 1, 'updated', 2, 'App\\FresadoDetalleModel', '{\"registro_fotografico\":\"sinfoto\"}', '{\"registro_fotografico\":\"ing-industrial1-blog.jpgstr_random(5).jpg\"}', 'http://127.0.0.1:8000/Api/FresadoDetalles_update/2', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/88.0.4324.104 Safari/537.36', NULL, '2021-02-04 04:10:31', '2021-02-04 04:10:31'),
(45, 'App\\User', 1, 'updated', 1, 'App\\FresadoDetalleModel', '{\"registro_fotografico\":\"sinfoto\"}', '{\"registro_fotografico\":\"0e471f56-a86b-499b-9ed9-318fd001dcd1.jpgstr_random(5).jpg\"}', 'http://127.0.0.1:8000/Api/FresadoDetalles_update/1', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/88.0.4324.104 Safari/537.36', NULL, '2021-02-04 04:11:03', '2021-02-04 04:11:03'),
(46, 'App\\User', 1, 'created', 28, 'App\\ConcretoDetallesModel', '[]', '{\"columna\":\"1\",\"titulo\":\"<b>Localizaci\\u00f3n y replanteo<\\/b>  Ubicaci\\u00f3n de elemento cumple con planos de dise\\u00f1o\",\"si_aplica\":\"3\",\"si_cumple\":\"3\",\"fecha\":\"2020-01-05\",\"observaciones\":\" \",\"registro_fotografico\":\"sinfoto\",\"concreto_id\":\"2\",\"id\":28}', 'http://127.0.0.1:8000/Api/ConcretoDetalles/2/consulta_data', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/88.0.4324.150 Safari/537.36', NULL, '2021-02-05 07:10:33', '2021-02-05 07:10:33'),
(47, 'App\\User', 1, 'created', 29, 'App\\ConcretoDetallesModel', '[]', '{\"columna\":\"1\",\"titulo\":\"<b>Verticalidad<\\/b>  Elemento cumple con planos y dise\\u00f1os\",\"si_aplica\":\"3\",\"si_cumple\":\"3\",\"fecha\":\"2020-01-05\",\"observaciones\":\" \",\"registro_fotografico\":\"sinfoto\",\"concreto_id\":\"2\",\"id\":29}', 'http://127.0.0.1:8000/Api/ConcretoDetalles/2/consulta_data', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/88.0.4324.150 Safari/537.36', NULL, '2021-02-05 07:10:34', '2021-02-05 07:10:34'),
(48, 'App\\User', 1, 'created', 30, 'App\\ConcretoDetallesModel', '[]', '{\"columna\":\"1\",\"titulo\":\" <b>Solado<\\/b> Concreto de limpieza y nivelaci\\u00f3n\",\"si_aplica\":\"3\",\"si_cumple\":\"3\",\"fecha\":\"2020-01-05\",\"observaciones\":\" \",\"registro_fotografico\":\"sinfoto\",\"concreto_id\":\"2\",\"id\":30}', 'http://127.0.0.1:8000/Api/ConcretoDetalles/2/consulta_data', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/88.0.4324.150 Safari/537.36', NULL, '2021-02-05 07:10:34', '2021-02-05 07:10:34'),
(49, 'App\\User', 1, 'created', 31, 'App\\ConcretoDetallesModel', '[]', '{\"columna\":\"1\",\"titulo\":\"<b>Desmoldante<\\/b> Paredes de Formaleta cuentan con desmoldante que permitira en desencofre de la estructura\",\"si_aplica\":\"3\",\"si_cumple\":\"3\",\"fecha\":\"2020-01-05\",\"observaciones\":\" \",\"registro_fotografico\":\"sinfoto\",\"concreto_id\":\"2\",\"id\":31}', 'http://127.0.0.1:8000/Api/ConcretoDetalles/2/consulta_data', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/88.0.4324.150 Safari/537.36', NULL, '2021-02-05 07:10:34', '2021-02-05 07:10:34'),
(50, 'App\\User', 1, 'created', 32, 'App\\ConcretoDetallesModel', '[]', '{\"columna\":\"1\",\"titulo\":\" <b>Muestras de concreto<\\/b> - Toma de cilindros de concreto\",\"si_aplica\":\"3\",\"si_cumple\":\"3\",\"fecha\":\"2020-01-05\",\"observaciones\":\" \",\"registro_fotografico\":\"sinfoto\",\"concreto_id\":\"2\",\"id\":32}', 'http://127.0.0.1:8000/Api/ConcretoDetalles/2/consulta_data', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/88.0.4324.150 Safari/537.36', NULL, '2021-02-05 07:10:34', '2021-02-05 07:10:34'),
(51, 'App\\User', 1, 'created', 33, 'App\\ConcretoDetallesModel', '[]', '{\"columna\":\"1\",\"titulo\":\"<b>Temperatura<\\/b> - Temperatura m\\u00e1xima del concreto no mayor a 32 C.\",\"si_aplica\":\"3\",\"si_cumple\":\"3\",\"fecha\":\"2020-01-05\",\"observaciones\":\" \",\"registro_fotografico\":\"sinfoto\",\"concreto_id\":\"2\",\"id\":33}', 'http://127.0.0.1:8000/Api/ConcretoDetalles/2/consulta_data', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/88.0.4324.150 Safari/537.36', NULL, '2021-02-05 07:10:34', '2021-02-05 07:10:34'),
(52, 'App\\User', 1, 'created', 34, 'App\\ConcretoDetallesModel', '[]', '{\"columna\":\"1\",\"titulo\":\"<b>Asentamiento<\\/b> - Asentamiento dentro del rango de dise\\u00f1o.\",\"si_aplica\":\"3\",\"si_cumple\":\"3\",\"fecha\":\"2020-01-05\",\"observaciones\":\" \",\"registro_fotografico\":\"sinfoto\",\"concreto_id\":\"2\",\"id\":34}', 'http://127.0.0.1:8000/Api/ConcretoDetalles/2/consulta_data', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/88.0.4324.150 Safari/537.36', NULL, '2021-02-05 07:10:34', '2021-02-05 07:10:34'),
(53, 'App\\User', 1, 'created', 35, 'App\\ConcretoDetallesModel', '[]', '{\"columna\":\"1\",\"titulo\":\"<b>Seguridad<\\/b> Ubicaci\\u00f3n de formaleta segura que permita el trabajo de descarga del concreto sin inconvenientes.\",\"si_aplica\":\"3\",\"si_cumple\":\"3\",\"fecha\":\"2020-01-05\",\"observaciones\":\" \",\"registro_fotografico\":\"sinfoto\",\"concreto_id\":\"2\",\"id\":35}', 'http://127.0.0.1:8000/Api/ConcretoDetalles/2/consulta_data', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/88.0.4324.150 Safari/537.36', NULL, '2021-02-05 07:10:34', '2021-02-05 07:10:34'),
(54, 'App\\User', 1, 'created', 36, 'App\\ConcretoDetallesModel', '[]', '{\"columna\":\"2\",\"titulo\":\"<b>Curado<\\/b>  aplicaci\\u00f3n de productos para el curado del concreto (indicar en observaciones el m\\u00e9todo utilizado)\",\"si_aplica\":\"3\",\"si_cumple\":\"3\",\"fecha\":\"2020-01-05\",\"observaciones\":\" \",\"registro_fotografico\":\"sinfoto\",\"concreto_id\":\"2\",\"id\":36}', 'http://127.0.0.1:8000/Api/ConcretoDetalles/2/consulta_data', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/88.0.4324.150 Safari/537.36', NULL, '2021-02-05 07:10:34', '2021-02-05 07:10:34'),
(55, 'App\\User', 1, 'created', 37, 'App\\ConcretoDetallesModel', '[]', '{\"columna\":\"2\",\"titulo\":\"<b>Acabados<\\/b>  Elemento cumple con buenos acabados\",\"si_aplica\":\"3\",\"si_cumple\":\"3\",\"fecha\":\"2020-01-05\",\"observaciones\":\" \",\"registro_fotografico\":\"sinfoto\",\"concreto_id\":\"2\",\"id\":37}', 'http://127.0.0.1:8000/Api/ConcretoDetalles/2/consulta_data', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/88.0.4324.150 Safari/537.36', NULL, '2021-02-05 07:10:34', '2021-02-05 07:10:34'),
(56, 'App\\User', 1, 'created', 38, 'App\\ConcretoDetallesModel', '[]', '{\"columna\":\"2\",\"titulo\":\"<b>Juntas<\\/b> Elemento con juntas de dilataci\\u00f3n o construcci\\u00f3n\",\"si_aplica\":\"3\",\"si_cumple\":\"3\",\"fecha\":\"2020-01-05\",\"observaciones\":\" \",\"registro_fotografico\":\"sinfoto\",\"concreto_id\":\"2\",\"id\":38}', 'http://127.0.0.1:8000/Api/ConcretoDetalles/2/consulta_data', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/88.0.4324.150 Safari/537.36', NULL, '2021-02-05 07:10:34', '2021-02-05 07:10:34'),
(57, 'App\\User', 1, 'created', 39, 'App\\ConcretoDetallesModel', '[]', '{\"columna\":\"2\",\"titulo\":\"<b>Fisuras<\\/b> Presencia de fisuras despu\\u00e9s de la fundida\",\"si_aplica\":\"3\",\"si_cumple\":\"3\",\"fecha\":\"2020-01-05\",\"observaciones\":\" \",\"registro_fotografico\":\"sinfoto\",\"concreto_id\":\"2\",\"id\":39}', 'http://127.0.0.1:8000/Api/ConcretoDetalles/2/consulta_data', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/88.0.4324.150 Safari/537.36', NULL, '2021-02-05 07:10:34', '2021-02-05 07:10:34'),
(58, 'App\\User', 1, 'created', 2, 'App\\FresadoModel', '[]', '{\"unidad_funcional_id\":\"1\",\"calzada\":\"GIRARDOT\",\"longitud\":\"45\",\"plano_codigo\":\"45\",\"version\":\"33\",\"ancho_uno\":\"45\",\"ancho_dos\":\"45\",\"espesor_uno\":\"45\",\"espesor_dos\":\"45\",\"estado_tramite_id\":\"1\",\"id\":2}', 'http://127.0.0.1:8000/Api/Fresado', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/88.0.4324.150 Safari/537.36', NULL, '2021-02-05 20:54:38', '2021-02-05 20:54:38'),
(59, 'App\\User', 1, 'created', 1, 'App\\MezclasModel', '[]', '{\"sentido_via\":\"1\",\"unidad_funcional_id\":\"3\",\"fecha\":\"2021-02-08\",\"tipo_mezcla\":\"A2\",\"ensayos_de_laboratorio\":\"lab-34\",\"is_horas_riego_imrpimacion\":\"1\",\"is_horas_liga\":\"1\",\"estado_riego\":\"1\",\"users_id\":1,\"id\":1}', 'http://127.0.0.1:8000/Api/Mezclas', '127.0.0.1', 'Mozilla/5.0 (Linux; Android 6.0; Nexus 5 Build/MRA58N) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/88.0.4324.150 Mobile Safari/537.36', NULL, '2021-02-08 17:36:14', '2021-02-08 17:36:14'),
(60, 'App\\User', 1, 'created', 2, 'App\\MezclasDetalleModel', '[]', '{\"recino_no\":null,\"hora_llegada\":\"455\",\"tem_llegada\":\"666\",\"cantidad_ton\":\"6.5\",\"hora_extendida\":\"67\",\"temp_extendida\":\"66\",\"abcisas_inicio\":\"66\",\"abcisas_fin\":\"66\",\"abcisas_espersor\":\"66\",\"abscisas_carril\":\"66\",\"temp_compactacion\":\"66\",\"temp_apertu_trafico\":\"66\",\"observaciones\":\"66\",\"registro_fotografico\":\"66\",\"users_id1\":1,\"mezclas_id\":1,\"id\":2}', 'http://127.0.0.1:8000/Api/MezclasDetalle', '127.0.0.1', 'Mozilla/5.0 (Linux; Android 6.0; Nexus 5 Build/MRA58N) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/88.0.4324.150 Mobile Safari/537.36', NULL, '2021-02-08 21:08:10', '2021-02-08 21:08:10'),
(61, 'App\\User', 1, 'created', 3, 'App\\MezclasDetalleModel', '[]', '{\"recino_no\":null,\"hora_llegada\":\"11\",\"tem_llegada\":\"22\",\"cantidad_ton\":\"22\",\"hora_extendida\":\"22\",\"temp_extendida\":\"22\",\"abcisas_inicio\":\"22\",\"abcisas_fin\":\"2\",\"abcisas_espersor\":\"22\",\"abscisas_carril\":\"22\",\"temp_compactacion\":\"22\",\"temp_apertu_trafico\":\"22\",\"observaciones\":\"22\",\"registro_fotografico\":\"22\",\"users_id1\":1,\"mezclas_id\":1,\"id\":3}', 'http://127.0.0.1:8000/Api/MezclasDetalle', '127.0.0.1', 'Mozilla/5.0 (Linux; Android 6.0; Nexus 5 Build/MRA58N) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/88.0.4324.150 Mobile Safari/537.36', NULL, '2021-02-08 21:30:56', '2021-02-08 21:30:56'),
(62, 'App\\User', 1, 'created', 40, 'App\\ConcretoDetallesModel', '[]', '{\"columna\":\"1\",\"titulo\":\"<b>Localizaci\\u00f3n y replanteo<\\/b>  Ubicaci\\u00f3n de elemento cumple con planos de dise\\u00f1o\",\"si_aplica\":\"3\",\"si_cumple\":\"3\",\"fecha\":\"2020-01-05\",\"observaciones\":\" \",\"registro_fotografico\":\"sinfoto\",\"concreto_id\":\"5\",\"id\":40}', 'http://127.0.0.1:8000/Api/ConcretoDetalles/5/consulta_data', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/88.0.4324.150 Safari/537.36', NULL, '2021-02-09 01:18:40', '2021-02-09 01:18:40'),
(63, 'App\\User', 1, 'created', 41, 'App\\ConcretoDetallesModel', '[]', '{\"columna\":\"1\",\"titulo\":\"<b>Verticalidad<\\/b>  Elemento cumple con planos y dise\\u00f1os\",\"si_aplica\":\"3\",\"si_cumple\":\"3\",\"fecha\":\"2020-01-05\",\"observaciones\":\" \",\"registro_fotografico\":\"sinfoto\",\"concreto_id\":\"5\",\"id\":41}', 'http://127.0.0.1:8000/Api/ConcretoDetalles/5/consulta_data', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/88.0.4324.150 Safari/537.36', NULL, '2021-02-09 01:18:40', '2021-02-09 01:18:40'),
(64, 'App\\User', 1, 'created', 42, 'App\\ConcretoDetallesModel', '[]', '{\"columna\":\"1\",\"titulo\":\" <b>Solado<\\/b> Concreto de limpieza y nivelaci\\u00f3n\",\"si_aplica\":\"3\",\"si_cumple\":\"3\",\"fecha\":\"2020-01-05\",\"observaciones\":\" \",\"registro_fotografico\":\"sinfoto\",\"concreto_id\":\"5\",\"id\":42}', 'http://127.0.0.1:8000/Api/ConcretoDetalles/5/consulta_data', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/88.0.4324.150 Safari/537.36', NULL, '2021-02-09 01:18:40', '2021-02-09 01:18:40'),
(65, 'App\\User', 1, 'created', 43, 'App\\ConcretoDetallesModel', '[]', '{\"columna\":\"1\",\"titulo\":\"<b>Desmoldante<\\/b> Paredes de Formaleta cuentan con desmoldante que permitira en desencofre de la estructura\",\"si_aplica\":\"3\",\"si_cumple\":\"3\",\"fecha\":\"2020-01-05\",\"observaciones\":\" \",\"registro_fotografico\":\"sinfoto\",\"concreto_id\":\"5\",\"id\":43}', 'http://127.0.0.1:8000/Api/ConcretoDetalles/5/consulta_data', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/88.0.4324.150 Safari/537.36', NULL, '2021-02-09 01:18:41', '2021-02-09 01:18:41'),
(66, 'App\\User', 1, 'created', 44, 'App\\ConcretoDetallesModel', '[]', '{\"columna\":\"1\",\"titulo\":\" <b>Muestras de concreto<\\/b> - Toma de cilindros de concreto\",\"si_aplica\":\"3\",\"si_cumple\":\"3\",\"fecha\":\"2020-01-05\",\"observaciones\":\" \",\"registro_fotografico\":\"sinfoto\",\"concreto_id\":\"5\",\"id\":44}', 'http://127.0.0.1:8000/Api/ConcretoDetalles/5/consulta_data', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/88.0.4324.150 Safari/537.36', NULL, '2021-02-09 01:18:41', '2021-02-09 01:18:41'),
(67, 'App\\User', 1, 'created', 45, 'App\\ConcretoDetallesModel', '[]', '{\"columna\":\"1\",\"titulo\":\"<b>Temperatura<\\/b> - Temperatura m\\u00e1xima del concreto no mayor a 32 C.\",\"si_aplica\":\"3\",\"si_cumple\":\"3\",\"fecha\":\"2020-01-05\",\"observaciones\":\" \",\"registro_fotografico\":\"sinfoto\",\"concreto_id\":\"5\",\"id\":45}', 'http://127.0.0.1:8000/Api/ConcretoDetalles/5/consulta_data', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/88.0.4324.150 Safari/537.36', NULL, '2021-02-09 01:18:41', '2021-02-09 01:18:41'),
(68, 'App\\User', 1, 'created', 46, 'App\\ConcretoDetallesModel', '[]', '{\"columna\":\"1\",\"titulo\":\"<b>Asentamiento<\\/b> - Asentamiento dentro del rango de dise\\u00f1o.\",\"si_aplica\":\"3\",\"si_cumple\":\"3\",\"fecha\":\"2020-01-05\",\"observaciones\":\" \",\"registro_fotografico\":\"sinfoto\",\"concreto_id\":\"5\",\"id\":46}', 'http://127.0.0.1:8000/Api/ConcretoDetalles/5/consulta_data', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/88.0.4324.150 Safari/537.36', NULL, '2021-02-09 01:18:41', '2021-02-09 01:18:41'),
(69, 'App\\User', 1, 'created', 47, 'App\\ConcretoDetallesModel', '[]', '{\"columna\":\"1\",\"titulo\":\"<b>Seguridad<\\/b> Ubicaci\\u00f3n de formaleta segura que permita el trabajo de descarga del concreto sin inconvenientes.\",\"si_aplica\":\"3\",\"si_cumple\":\"3\",\"fecha\":\"2020-01-05\",\"observaciones\":\" \",\"registro_fotografico\":\"sinfoto\",\"concreto_id\":\"5\",\"id\":47}', 'http://127.0.0.1:8000/Api/ConcretoDetalles/5/consulta_data', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/88.0.4324.150 Safari/537.36', NULL, '2021-02-09 01:18:41', '2021-02-09 01:18:41'),
(70, 'App\\User', 1, 'created', 48, 'App\\ConcretoDetallesModel', '[]', '{\"columna\":\"2\",\"titulo\":\"<b>Curado<\\/b>  aplicaci\\u00f3n de productos para el curado del concreto (indicar en observaciones el m\\u00e9todo utilizado)\",\"si_aplica\":\"3\",\"si_cumple\":\"3\",\"fecha\":\"2020-01-05\",\"observaciones\":\" \",\"registro_fotografico\":\"sinfoto\",\"concreto_id\":\"5\",\"id\":48}', 'http://127.0.0.1:8000/Api/ConcretoDetalles/5/consulta_data', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/88.0.4324.150 Safari/537.36', NULL, '2021-02-09 01:18:41', '2021-02-09 01:18:41'),
(71, 'App\\User', 1, 'created', 49, 'App\\ConcretoDetallesModel', '[]', '{\"columna\":\"2\",\"titulo\":\"<b>Acabados<\\/b>  Elemento cumple con buenos acabados\",\"si_aplica\":\"3\",\"si_cumple\":\"3\",\"fecha\":\"2020-01-05\",\"observaciones\":\" \",\"registro_fotografico\":\"sinfoto\",\"concreto_id\":\"5\",\"id\":49}', 'http://127.0.0.1:8000/Api/ConcretoDetalles/5/consulta_data', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/88.0.4324.150 Safari/537.36', NULL, '2021-02-09 01:18:41', '2021-02-09 01:18:41'),
(72, 'App\\User', 1, 'created', 50, 'App\\ConcretoDetallesModel', '[]', '{\"columna\":\"2\",\"titulo\":\"<b>Juntas<\\/b> Elemento con juntas de dilataci\\u00f3n o construcci\\u00f3n\",\"si_aplica\":\"3\",\"si_cumple\":\"3\",\"fecha\":\"2020-01-05\",\"observaciones\":\" \",\"registro_fotografico\":\"sinfoto\",\"concreto_id\":\"5\",\"id\":50}', 'http://127.0.0.1:8000/Api/ConcretoDetalles/5/consulta_data', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/88.0.4324.150 Safari/537.36', NULL, '2021-02-09 01:18:41', '2021-02-09 01:18:41'),
(73, 'App\\User', 1, 'created', 51, 'App\\ConcretoDetallesModel', '[]', '{\"columna\":\"2\",\"titulo\":\"<b>Fisuras<\\/b> Presencia de fisuras despu\\u00e9s de la fundida\",\"si_aplica\":\"3\",\"si_cumple\":\"3\",\"fecha\":\"2020-01-05\",\"observaciones\":\" \",\"registro_fotografico\":\"sinfoto\",\"concreto_id\":\"5\",\"id\":51}', 'http://127.0.0.1:8000/Api/ConcretoDetalles/5/consulta_data', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/88.0.4324.150 Safari/537.36', NULL, '2021-02-09 01:18:41', '2021-02-09 01:18:41'),
(74, 'App\\User', 1, 'updated', 40, 'App\\ConcretoDetallesModel', '{\"si_aplica\":\"3\",\"si_cumple\":\"3\",\"fecha\":\"2020-01-05\",\"observaciones\":\" \",\"registro_fotografico\":\"sinfoto\"}', '{\"si_aplica\":\"1\",\"si_cumple\":\"0\",\"fecha\":\"2021-02-08\",\"observaciones\":\"yyyyy\",\"registro_fotografico\":\"ddddddddddddddddddddddddddddddddd.jpgstr_random(5).jpg\"}', 'http://127.0.0.1:8000/Api/ConcretoDetalles_update/40', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/88.0.4324.150 Safari/537.36', NULL, '2021-02-09 02:36:29', '2021-02-09 02:36:29'),
(75, 'App\\User', 1, 'created', 52, 'App\\ConcretoDetallesModel', '[]', '{\"columna\":\"1\",\"titulo\":\"<b>Localizaci\\u00f3n y replanteo<\\/b>  Ubicaci\\u00f3n de elemento cumple con planos de dise\\u00f1o\",\"si_aplica\":\"3\",\"si_cumple\":\"3\",\"fecha\":\"2020-01-05\",\"observaciones\":\" \",\"registro_fotografico\":\"sinfoto\",\"concreto_id\":\"6\",\"id\":52}', 'http://127.0.0.1:8000/Api/ConcretoDetalles/6/consulta_data', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/88.0.4324.150 Safari/537.36', NULL, '2021-02-09 02:48:45', '2021-02-09 02:48:45'),
(76, 'App\\User', 1, 'created', 53, 'App\\ConcretoDetallesModel', '[]', '{\"columna\":\"1\",\"titulo\":\"<b>Verticalidad<\\/b>  Elemento cumple con planos y dise\\u00f1os\",\"si_aplica\":\"3\",\"si_cumple\":\"3\",\"fecha\":\"2020-01-05\",\"observaciones\":\" \",\"registro_fotografico\":\"sinfoto\",\"concreto_id\":\"6\",\"id\":53}', 'http://127.0.0.1:8000/Api/ConcretoDetalles/6/consulta_data', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/88.0.4324.150 Safari/537.36', NULL, '2021-02-09 02:48:45', '2021-02-09 02:48:45'),
(77, 'App\\User', 1, 'created', 54, 'App\\ConcretoDetallesModel', '[]', '{\"columna\":\"1\",\"titulo\":\" <b>Solado<\\/b> Concreto de limpieza y nivelaci\\u00f3n\",\"si_aplica\":\"3\",\"si_cumple\":\"3\",\"fecha\":\"2020-01-05\",\"observaciones\":\" \",\"registro_fotografico\":\"sinfoto\",\"concreto_id\":\"6\",\"id\":54}', 'http://127.0.0.1:8000/Api/ConcretoDetalles/6/consulta_data', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/88.0.4324.150 Safari/537.36', NULL, '2021-02-09 02:48:45', '2021-02-09 02:48:45'),
(78, 'App\\User', 1, 'created', 55, 'App\\ConcretoDetallesModel', '[]', '{\"columna\":\"1\",\"titulo\":\"<b>Desmoldante<\\/b> Paredes de Formaleta cuentan con desmoldante que permitira en desencofre de la estructura\",\"si_aplica\":\"3\",\"si_cumple\":\"3\",\"fecha\":\"2020-01-05\",\"observaciones\":\" \",\"registro_fotografico\":\"sinfoto\",\"concreto_id\":\"6\",\"id\":55}', 'http://127.0.0.1:8000/Api/ConcretoDetalles/6/consulta_data', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/88.0.4324.150 Safari/537.36', NULL, '2021-02-09 02:48:45', '2021-02-09 02:48:45'),
(79, 'App\\User', 1, 'created', 56, 'App\\ConcretoDetallesModel', '[]', '{\"columna\":\"1\",\"titulo\":\" <b>Muestras de concreto<\\/b> - Toma de cilindros de concreto\",\"si_aplica\":\"3\",\"si_cumple\":\"3\",\"fecha\":\"2020-01-05\",\"observaciones\":\" \",\"registro_fotografico\":\"sinfoto\",\"concreto_id\":\"6\",\"id\":56}', 'http://127.0.0.1:8000/Api/ConcretoDetalles/6/consulta_data', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/88.0.4324.150 Safari/537.36', NULL, '2021-02-09 02:48:45', '2021-02-09 02:48:45'),
(80, 'App\\User', 1, 'created', 57, 'App\\ConcretoDetallesModel', '[]', '{\"columna\":\"1\",\"titulo\":\"<b>Temperatura<\\/b> - Temperatura m\\u00e1xima del concreto no mayor a 32 C.\",\"si_aplica\":\"3\",\"si_cumple\":\"3\",\"fecha\":\"2020-01-05\",\"observaciones\":\" \",\"registro_fotografico\":\"sinfoto\",\"concreto_id\":\"6\",\"id\":57}', 'http://127.0.0.1:8000/Api/ConcretoDetalles/6/consulta_data', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/88.0.4324.150 Safari/537.36', NULL, '2021-02-09 02:48:45', '2021-02-09 02:48:45'),
(81, 'App\\User', 1, 'created', 58, 'App\\ConcretoDetallesModel', '[]', '{\"columna\":\"1\",\"titulo\":\"<b>Asentamiento<\\/b> - Asentamiento dentro del rango de dise\\u00f1o.\",\"si_aplica\":\"3\",\"si_cumple\":\"3\",\"fecha\":\"2020-01-05\",\"observaciones\":\" \",\"registro_fotografico\":\"sinfoto\",\"concreto_id\":\"6\",\"id\":58}', 'http://127.0.0.1:8000/Api/ConcretoDetalles/6/consulta_data', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/88.0.4324.150 Safari/537.36', NULL, '2021-02-09 02:48:45', '2021-02-09 02:48:45'),
(82, 'App\\User', 1, 'created', 59, 'App\\ConcretoDetallesModel', '[]', '{\"columna\":\"1\",\"titulo\":\"<b>Seguridad<\\/b> Ubicaci\\u00f3n de formaleta segura que permita el trabajo de descarga del concreto sin inconvenientes.\",\"si_aplica\":\"3\",\"si_cumple\":\"3\",\"fecha\":\"2020-01-05\",\"observaciones\":\" \",\"registro_fotografico\":\"sinfoto\",\"concreto_id\":\"6\",\"id\":59}', 'http://127.0.0.1:8000/Api/ConcretoDetalles/6/consulta_data', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/88.0.4324.150 Safari/537.36', NULL, '2021-02-09 02:48:45', '2021-02-09 02:48:45'),
(83, 'App\\User', 1, 'created', 60, 'App\\ConcretoDetallesModel', '[]', '{\"columna\":\"2\",\"titulo\":\"<b>Curado<\\/b>  aplicaci\\u00f3n de productos para el curado del concreto (indicar en observaciones el m\\u00e9todo utilizado)\",\"si_aplica\":\"3\",\"si_cumple\":\"3\",\"fecha\":\"2020-01-05\",\"observaciones\":\" \",\"registro_fotografico\":\"sinfoto\",\"concreto_id\":\"6\",\"id\":60}', 'http://127.0.0.1:8000/Api/ConcretoDetalles/6/consulta_data', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/88.0.4324.150 Safari/537.36', NULL, '2021-02-09 02:48:45', '2021-02-09 02:48:45'),
(84, 'App\\User', 1, 'created', 61, 'App\\ConcretoDetallesModel', '[]', '{\"columna\":\"2\",\"titulo\":\"<b>Acabados<\\/b>  Elemento cumple con buenos acabados\",\"si_aplica\":\"3\",\"si_cumple\":\"3\",\"fecha\":\"2020-01-05\",\"observaciones\":\" \",\"registro_fotografico\":\"sinfoto\",\"concreto_id\":\"6\",\"id\":61}', 'http://127.0.0.1:8000/Api/ConcretoDetalles/6/consulta_data', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/88.0.4324.150 Safari/537.36', NULL, '2021-02-09 02:48:45', '2021-02-09 02:48:45'),
(85, 'App\\User', 1, 'created', 62, 'App\\ConcretoDetallesModel', '[]', '{\"columna\":\"2\",\"titulo\":\"<b>Juntas<\\/b> Elemento con juntas de dilataci\\u00f3n o construcci\\u00f3n\",\"si_aplica\":\"3\",\"si_cumple\":\"3\",\"fecha\":\"2020-01-05\",\"observaciones\":\" \",\"registro_fotografico\":\"sinfoto\",\"concreto_id\":\"6\",\"id\":62}', 'http://127.0.0.1:8000/Api/ConcretoDetalles/6/consulta_data', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/88.0.4324.150 Safari/537.36', NULL, '2021-02-09 02:48:45', '2021-02-09 02:48:45'),
(86, 'App\\User', 1, 'created', 63, 'App\\ConcretoDetallesModel', '[]', '{\"columna\":\"2\",\"titulo\":\"<b>Fisuras<\\/b> Presencia de fisuras despu\\u00e9s de la fundida\",\"si_aplica\":\"3\",\"si_cumple\":\"3\",\"fecha\":\"2020-01-05\",\"observaciones\":\" \",\"registro_fotografico\":\"sinfoto\",\"concreto_id\":\"6\",\"id\":63}', 'http://127.0.0.1:8000/Api/ConcretoDetalles/6/consulta_data', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/88.0.4324.150 Safari/537.36', NULL, '2021-02-09 02:48:45', '2021-02-09 02:48:45');
INSERT INTO `audits` (`id`, `user_type`, `user_id`, `event`, `auditable_id`, `auditable_type`, `old_values`, `new_values`, `url`, `ip_address`, `user_agent`, `tags`, `created_at`, `updated_at`) VALUES
(87, 'App\\User', 1, 'updated', 12, 'App\\ConcretoDetallesModel', '{\"si_aplica\":\"3\",\"si_cumple\":\"3\",\"fecha\":\"2020-01-05\",\"observaciones\":\" \",\"registro_fotografico\":\"null.png\"}', '{\"si_aplica\":\"1\",\"si_cumple\":\"0\",\"fecha\":\"2021-02-08\",\"observaciones\":\"no tiene\",\"registro_fotografico\":\"tecrahul.pngstr_random(5).png\"}', 'http://127.0.0.1:8000/Api/ConcretoDetalles_update/12', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/88.0.4324.150 Safari/537.36', NULL, '2021-02-09 03:14:34', '2021-02-09 03:14:34'),
(88, 'App\\User', 1, 'updated', 28, 'App\\ConcretoDetallesModel', '{\"si_aplica\":\"3\",\"si_cumple\":\"3\",\"fecha\":\"2020-01-05\",\"observaciones\":\" \",\"registro_fotografico\":\"sinfoto\"}', '{\"si_aplica\":\"1\",\"si_cumple\":\"0\",\"fecha\":\"2021-02-08\",\"observaciones\":null,\"registro_fotografico\":\"ing-industrial1-blog.jpgstr_random(5).jpg\"}', 'http://127.0.0.1:8000/Api/ConcretoDetalles_update/28', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/88.0.4324.150 Safari/537.36', NULL, '2021-02-09 03:23:41', '2021-02-09 03:23:41'),
(89, 'App\\User', 1, 'created', 64, 'App\\ConcretoDetallesModel', '[]', '{\"columna\":\"1\",\"titulo\":\"<b>Localizaci\\u00f3n y replanteo<\\/b>  Ubicaci\\u00f3n de elemento cumple con planos de dise\\u00f1o\",\"si_aplica\":\"3\",\"si_cumple\":\"3\",\"fecha\":\"2020-01-05\",\"observaciones\":\" \",\"registro_fotografico\":\"sinfoto\",\"concreto_id\":\"7\",\"id\":64}', 'http://127.0.0.1:8000/Api/ConcretoDetalles/7/consulta_data', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/88.0.4324.150 Safari/537.36', NULL, '2021-02-09 04:08:49', '2021-02-09 04:08:49'),
(90, 'App\\User', 1, 'created', 65, 'App\\ConcretoDetallesModel', '[]', '{\"columna\":\"1\",\"titulo\":\"<b>Verticalidad<\\/b>  Elemento cumple con planos y dise\\u00f1os\",\"si_aplica\":\"3\",\"si_cumple\":\"3\",\"fecha\":\"2020-01-05\",\"observaciones\":\" \",\"registro_fotografico\":\"sinfoto\",\"concreto_id\":\"7\",\"id\":65}', 'http://127.0.0.1:8000/Api/ConcretoDetalles/7/consulta_data', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/88.0.4324.150 Safari/537.36', NULL, '2021-02-09 04:08:49', '2021-02-09 04:08:49'),
(91, 'App\\User', 1, 'created', 66, 'App\\ConcretoDetallesModel', '[]', '{\"columna\":\"1\",\"titulo\":\" <b>Solado<\\/b> Concreto de limpieza y nivelaci\\u00f3n\",\"si_aplica\":\"3\",\"si_cumple\":\"3\",\"fecha\":\"2020-01-05\",\"observaciones\":\" \",\"registro_fotografico\":\"sinfoto\",\"concreto_id\":\"7\",\"id\":66}', 'http://127.0.0.1:8000/Api/ConcretoDetalles/7/consulta_data', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/88.0.4324.150 Safari/537.36', NULL, '2021-02-09 04:08:49', '2021-02-09 04:08:49'),
(92, 'App\\User', 1, 'created', 67, 'App\\ConcretoDetallesModel', '[]', '{\"columna\":\"1\",\"titulo\":\"<b>Desmoldante<\\/b> Paredes de Formaleta cuentan con desmoldante que permitira en desencofre de la estructura\",\"si_aplica\":\"3\",\"si_cumple\":\"3\",\"fecha\":\"2020-01-05\",\"observaciones\":\" \",\"registro_fotografico\":\"sinfoto\",\"concreto_id\":\"7\",\"id\":67}', 'http://127.0.0.1:8000/Api/ConcretoDetalles/7/consulta_data', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/88.0.4324.150 Safari/537.36', NULL, '2021-02-09 04:08:49', '2021-02-09 04:08:49'),
(93, 'App\\User', 1, 'created', 68, 'App\\ConcretoDetallesModel', '[]', '{\"columna\":\"1\",\"titulo\":\" <b>Muestras de concreto<\\/b> - Toma de cilindros de concreto\",\"si_aplica\":\"3\",\"si_cumple\":\"3\",\"fecha\":\"2020-01-05\",\"observaciones\":\" \",\"registro_fotografico\":\"sinfoto\",\"concreto_id\":\"7\",\"id\":68}', 'http://127.0.0.1:8000/Api/ConcretoDetalles/7/consulta_data', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/88.0.4324.150 Safari/537.36', NULL, '2021-02-09 04:08:49', '2021-02-09 04:08:49'),
(94, 'App\\User', 1, 'created', 69, 'App\\ConcretoDetallesModel', '[]', '{\"columna\":\"1\",\"titulo\":\"<b>Temperatura<\\/b> - Temperatura m\\u00e1xima del concreto no mayor a 32 C.\",\"si_aplica\":\"3\",\"si_cumple\":\"3\",\"fecha\":\"2020-01-05\",\"observaciones\":\" \",\"registro_fotografico\":\"sinfoto\",\"concreto_id\":\"7\",\"id\":69}', 'http://127.0.0.1:8000/Api/ConcretoDetalles/7/consulta_data', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/88.0.4324.150 Safari/537.36', NULL, '2021-02-09 04:08:49', '2021-02-09 04:08:49'),
(95, 'App\\User', 1, 'created', 70, 'App\\ConcretoDetallesModel', '[]', '{\"columna\":\"1\",\"titulo\":\"<b>Asentamiento<\\/b> - Asentamiento dentro del rango de dise\\u00f1o.\",\"si_aplica\":\"3\",\"si_cumple\":\"3\",\"fecha\":\"2020-01-05\",\"observaciones\":\" \",\"registro_fotografico\":\"sinfoto\",\"concreto_id\":\"7\",\"id\":70}', 'http://127.0.0.1:8000/Api/ConcretoDetalles/7/consulta_data', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/88.0.4324.150 Safari/537.36', NULL, '2021-02-09 04:08:49', '2021-02-09 04:08:49'),
(96, 'App\\User', 1, 'created', 71, 'App\\ConcretoDetallesModel', '[]', '{\"columna\":\"1\",\"titulo\":\"<b>Seguridad<\\/b> Ubicaci\\u00f3n de formaleta segura que permita el trabajo de descarga del concreto sin inconvenientes.\",\"si_aplica\":\"3\",\"si_cumple\":\"3\",\"fecha\":\"2020-01-05\",\"observaciones\":\" \",\"registro_fotografico\":\"sinfoto\",\"concreto_id\":\"7\",\"id\":71}', 'http://127.0.0.1:8000/Api/ConcretoDetalles/7/consulta_data', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/88.0.4324.150 Safari/537.36', NULL, '2021-02-09 04:08:49', '2021-02-09 04:08:49'),
(97, 'App\\User', 1, 'created', 72, 'App\\ConcretoDetallesModel', '[]', '{\"columna\":\"2\",\"titulo\":\"<b>Curado<\\/b>  aplicaci\\u00f3n de productos para el curado del concreto (indicar en observaciones el m\\u00e9todo utilizado)\",\"si_aplica\":\"3\",\"si_cumple\":\"3\",\"fecha\":\"2020-01-05\",\"observaciones\":\" \",\"registro_fotografico\":\"sinfoto\",\"concreto_id\":\"7\",\"id\":72}', 'http://127.0.0.1:8000/Api/ConcretoDetalles/7/consulta_data', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/88.0.4324.150 Safari/537.36', NULL, '2021-02-09 04:08:49', '2021-02-09 04:08:49'),
(98, 'App\\User', 1, 'created', 73, 'App\\ConcretoDetallesModel', '[]', '{\"columna\":\"2\",\"titulo\":\"<b>Acabados<\\/b>  Elemento cumple con buenos acabados\",\"si_aplica\":\"3\",\"si_cumple\":\"3\",\"fecha\":\"2020-01-05\",\"observaciones\":\" \",\"registro_fotografico\":\"sinfoto\",\"concreto_id\":\"7\",\"id\":73}', 'http://127.0.0.1:8000/Api/ConcretoDetalles/7/consulta_data', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/88.0.4324.150 Safari/537.36', NULL, '2021-02-09 04:08:49', '2021-02-09 04:08:49'),
(99, 'App\\User', 1, 'created', 74, 'App\\ConcretoDetallesModel', '[]', '{\"columna\":\"2\",\"titulo\":\"<b>Juntas<\\/b> Elemento con juntas de dilataci\\u00f3n o construcci\\u00f3n\",\"si_aplica\":\"3\",\"si_cumple\":\"3\",\"fecha\":\"2020-01-05\",\"observaciones\":\" \",\"registro_fotografico\":\"sinfoto\",\"concreto_id\":\"7\",\"id\":74}', 'http://127.0.0.1:8000/Api/ConcretoDetalles/7/consulta_data', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/88.0.4324.150 Safari/537.36', NULL, '2021-02-09 04:08:49', '2021-02-09 04:08:49'),
(100, 'App\\User', 1, 'created', 75, 'App\\ConcretoDetallesModel', '[]', '{\"columna\":\"2\",\"titulo\":\"<b>Fisuras<\\/b> Presencia de fisuras despu\\u00e9s de la fundida\",\"si_aplica\":\"3\",\"si_cumple\":\"3\",\"fecha\":\"2020-01-05\",\"observaciones\":\" \",\"registro_fotografico\":\"sinfoto\",\"concreto_id\":\"7\",\"id\":75}', 'http://127.0.0.1:8000/Api/ConcretoDetalles/7/consulta_data', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/88.0.4324.150 Safari/537.36', NULL, '2021-02-09 04:08:49', '2021-02-09 04:08:49'),
(101, 'App\\User', 1, 'updated', 64, 'App\\ConcretoDetallesModel', '{\"si_aplica\":\"3\",\"si_cumple\":\"3\",\"fecha\":\"2020-01-05\",\"observaciones\":\" \",\"registro_fotografico\":\"sinfoto\"}', '{\"si_aplica\":\"1\",\"si_cumple\":\"0\",\"fecha\":\"2021-02-08\",\"observaciones\":null,\"registro_fotografico\":\"ddddddddddddddddddddddddddddddddd.jpgstr_random(5).jpg\"}', 'http://127.0.0.1:8000/Api/ConcretoDetalles_update/64', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/88.0.4324.150 Safari/537.36', NULL, '2021-02-09 04:09:17', '2021-02-09 04:09:17'),
(102, 'App\\User', 1, 'created', 76, 'App\\ConcretoDetallesModel', '[]', '{\"columna\":\"1\",\"titulo\":\"<b>Localizaci\\u00f3n y replanteo<\\/b>  Ubicaci\\u00f3n de elemento cumple con planos de dise\\u00f1o\",\"si_aplica\":\"3\",\"si_cumple\":\"3\",\"fecha\":\"2020-01-05\",\"observaciones\":\" \",\"registro_fotografico\":\"sinfoto\",\"concreto_id\":\"8\",\"id\":76}', 'http://127.0.0.1:8000/Api/ConcretoDetalles/8/consulta_data', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/88.0.4324.150 Safari/537.36', NULL, '2021-02-09 04:09:18', '2021-02-09 04:09:18'),
(103, 'App\\User', 1, 'created', 77, 'App\\ConcretoDetallesModel', '[]', '{\"columna\":\"1\",\"titulo\":\"<b>Verticalidad<\\/b>  Elemento cumple con planos y dise\\u00f1os\",\"si_aplica\":\"3\",\"si_cumple\":\"3\",\"fecha\":\"2020-01-05\",\"observaciones\":\" \",\"registro_fotografico\":\"sinfoto\",\"concreto_id\":\"8\",\"id\":77}', 'http://127.0.0.1:8000/Api/ConcretoDetalles/8/consulta_data', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/88.0.4324.150 Safari/537.36', NULL, '2021-02-09 04:09:18', '2021-02-09 04:09:18'),
(104, 'App\\User', 1, 'created', 78, 'App\\ConcretoDetallesModel', '[]', '{\"columna\":\"1\",\"titulo\":\" <b>Solado<\\/b> Concreto de limpieza y nivelaci\\u00f3n\",\"si_aplica\":\"3\",\"si_cumple\":\"3\",\"fecha\":\"2020-01-05\",\"observaciones\":\" \",\"registro_fotografico\":\"sinfoto\",\"concreto_id\":\"8\",\"id\":78}', 'http://127.0.0.1:8000/Api/ConcretoDetalles/8/consulta_data', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/88.0.4324.150 Safari/537.36', NULL, '2021-02-09 04:09:18', '2021-02-09 04:09:18'),
(105, 'App\\User', 1, 'created', 79, 'App\\ConcretoDetallesModel', '[]', '{\"columna\":\"1\",\"titulo\":\"<b>Desmoldante<\\/b> Paredes de Formaleta cuentan con desmoldante que permitira en desencofre de la estructura\",\"si_aplica\":\"3\",\"si_cumple\":\"3\",\"fecha\":\"2020-01-05\",\"observaciones\":\" \",\"registro_fotografico\":\"sinfoto\",\"concreto_id\":\"8\",\"id\":79}', 'http://127.0.0.1:8000/Api/ConcretoDetalles/8/consulta_data', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/88.0.4324.150 Safari/537.36', NULL, '2021-02-09 04:09:18', '2021-02-09 04:09:18'),
(106, 'App\\User', 1, 'created', 80, 'App\\ConcretoDetallesModel', '[]', '{\"columna\":\"1\",\"titulo\":\" <b>Muestras de concreto<\\/b> - Toma de cilindros de concreto\",\"si_aplica\":\"3\",\"si_cumple\":\"3\",\"fecha\":\"2020-01-05\",\"observaciones\":\" \",\"registro_fotografico\":\"sinfoto\",\"concreto_id\":\"8\",\"id\":80}', 'http://127.0.0.1:8000/Api/ConcretoDetalles/8/consulta_data', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/88.0.4324.150 Safari/537.36', NULL, '2021-02-09 04:09:18', '2021-02-09 04:09:18'),
(107, 'App\\User', 1, 'created', 81, 'App\\ConcretoDetallesModel', '[]', '{\"columna\":\"1\",\"titulo\":\"<b>Temperatura<\\/b> - Temperatura m\\u00e1xima del concreto no mayor a 32 C.\",\"si_aplica\":\"3\",\"si_cumple\":\"3\",\"fecha\":\"2020-01-05\",\"observaciones\":\" \",\"registro_fotografico\":\"sinfoto\",\"concreto_id\":\"8\",\"id\":81}', 'http://127.0.0.1:8000/Api/ConcretoDetalles/8/consulta_data', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/88.0.4324.150 Safari/537.36', NULL, '2021-02-09 04:09:18', '2021-02-09 04:09:18'),
(108, 'App\\User', 1, 'created', 82, 'App\\ConcretoDetallesModel', '[]', '{\"columna\":\"1\",\"titulo\":\"<b>Asentamiento<\\/b> - Asentamiento dentro del rango de dise\\u00f1o.\",\"si_aplica\":\"3\",\"si_cumple\":\"3\",\"fecha\":\"2020-01-05\",\"observaciones\":\" \",\"registro_fotografico\":\"sinfoto\",\"concreto_id\":\"8\",\"id\":82}', 'http://127.0.0.1:8000/Api/ConcretoDetalles/8/consulta_data', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/88.0.4324.150 Safari/537.36', NULL, '2021-02-09 04:09:18', '2021-02-09 04:09:18'),
(109, 'App\\User', 1, 'created', 83, 'App\\ConcretoDetallesModel', '[]', '{\"columna\":\"1\",\"titulo\":\"<b>Seguridad<\\/b> Ubicaci\\u00f3n de formaleta segura que permita el trabajo de descarga del concreto sin inconvenientes.\",\"si_aplica\":\"3\",\"si_cumple\":\"3\",\"fecha\":\"2020-01-05\",\"observaciones\":\" \",\"registro_fotografico\":\"sinfoto\",\"concreto_id\":\"8\",\"id\":83}', 'http://127.0.0.1:8000/Api/ConcretoDetalles/8/consulta_data', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/88.0.4324.150 Safari/537.36', NULL, '2021-02-09 04:09:18', '2021-02-09 04:09:18'),
(110, 'App\\User', 1, 'created', 84, 'App\\ConcretoDetallesModel', '[]', '{\"columna\":\"2\",\"titulo\":\"<b>Curado<\\/b>  aplicaci\\u00f3n de productos para el curado del concreto (indicar en observaciones el m\\u00e9todo utilizado)\",\"si_aplica\":\"3\",\"si_cumple\":\"3\",\"fecha\":\"2020-01-05\",\"observaciones\":\" \",\"registro_fotografico\":\"sinfoto\",\"concreto_id\":\"8\",\"id\":84}', 'http://127.0.0.1:8000/Api/ConcretoDetalles/8/consulta_data', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/88.0.4324.150 Safari/537.36', NULL, '2021-02-09 04:09:18', '2021-02-09 04:09:18'),
(111, 'App\\User', 1, 'created', 85, 'App\\ConcretoDetallesModel', '[]', '{\"columna\":\"2\",\"titulo\":\"<b>Acabados<\\/b>  Elemento cumple con buenos acabados\",\"si_aplica\":\"3\",\"si_cumple\":\"3\",\"fecha\":\"2020-01-05\",\"observaciones\":\" \",\"registro_fotografico\":\"sinfoto\",\"concreto_id\":\"8\",\"id\":85}', 'http://127.0.0.1:8000/Api/ConcretoDetalles/8/consulta_data', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/88.0.4324.150 Safari/537.36', NULL, '2021-02-09 04:09:18', '2021-02-09 04:09:18'),
(112, 'App\\User', 1, 'created', 86, 'App\\ConcretoDetallesModel', '[]', '{\"columna\":\"2\",\"titulo\":\"<b>Juntas<\\/b> Elemento con juntas de dilataci\\u00f3n o construcci\\u00f3n\",\"si_aplica\":\"3\",\"si_cumple\":\"3\",\"fecha\":\"2020-01-05\",\"observaciones\":\" \",\"registro_fotografico\":\"sinfoto\",\"concreto_id\":\"8\",\"id\":86}', 'http://127.0.0.1:8000/Api/ConcretoDetalles/8/consulta_data', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/88.0.4324.150 Safari/537.36', NULL, '2021-02-09 04:09:18', '2021-02-09 04:09:18'),
(113, 'App\\User', 1, 'created', 87, 'App\\ConcretoDetallesModel', '[]', '{\"columna\":\"2\",\"titulo\":\"<b>Fisuras<\\/b> Presencia de fisuras despu\\u00e9s de la fundida\",\"si_aplica\":\"3\",\"si_cumple\":\"3\",\"fecha\":\"2020-01-05\",\"observaciones\":\" \",\"registro_fotografico\":\"sinfoto\",\"concreto_id\":\"8\",\"id\":87}', 'http://127.0.0.1:8000/Api/ConcretoDetalles/8/consulta_data', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/88.0.4324.150 Safari/537.36', NULL, '2021-02-09 04:09:18', '2021-02-09 04:09:18'),
(114, 'App\\User', 1, 'updated', 19, 'App\\ConcretoDetallesModel', '{\"si_aplica\":\"3\",\"observaciones\":\" \"}', '{\"si_aplica\":\"1\",\"observaciones\":null}', 'http://127.0.0.1:8000/Api/ConcretoDetalles_update/19', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/88.0.4324.150 Safari/537.36', NULL, '2021-02-09 17:14:55', '2021-02-09 17:14:55'),
(115, 'App\\User', 1, 'updated', 19, 'App\\ConcretoDetallesModel', '{\"si_aplica\":\"1\",\"si_cumple\":\"3\",\"observaciones\":null}', '{\"si_aplica\":\"0\",\"si_cumple\":\"0\",\"observaciones\":\"null\"}', 'http://127.0.0.1:8000/Api/ConcretoDetalles_update/19', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/88.0.4324.150 Safari/537.36', NULL, '2021-02-09 17:15:07', '2021-02-09 17:15:07'),
(116, 'App\\User', 1, 'updated', 16, 'App\\ConcretoDetallesModel', '{\"si_aplica\":\"3\",\"observaciones\":\" \"}', '{\"si_aplica\":\"1\",\"observaciones\":null}', 'http://127.0.0.1:8000/Api/ConcretoDetalles_update/16', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/88.0.4324.150 Safari/537.36', NULL, '2021-02-09 17:16:30', '2021-02-09 17:16:30'),
(117, 'App\\User', 1, 'updated', 16, 'App\\ConcretoDetallesModel', '{\"observaciones\":null}', '{\"observaciones\":\"null\"}', 'http://127.0.0.1:8000/Api/ConcretoDetalles_update/16', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/88.0.4324.150 Safari/537.36', NULL, '2021-02-09 17:20:25', '2021-02-09 17:20:25'),
(118, 'App\\User', 1, 'updated', 16, 'App\\ConcretoDetallesModel', '{\"si_cumple\":\"3\",\"fecha\":\"2020-01-05\",\"observaciones\":\"null\"}', '{\"si_cumple\":\"0\",\"fecha\":\"2020-01-15\",\"observaciones\":\"null dee jugaras\"}', 'http://127.0.0.1:8000/Api/ConcretoDetalles_update/16', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/88.0.4324.150 Safari/537.36', NULL, '2021-02-09 17:20:44', '2021-02-09 17:20:44'),
(119, 'App\\User', 1, 'updated', 17, 'App\\ConcretoDetallesModel', '{\"si_aplica\":\"3\",\"si_cumple\":\"3\",\"observaciones\":\" \"}', '{\"si_aplica\":\"1\",\"si_cumple\":\"0\",\"observaciones\":null}', 'http://127.0.0.1:8000/Api/ConcretoDetalles_update/17', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/88.0.4324.150 Safari/537.36', NULL, '2021-02-09 17:20:55', '2021-02-09 17:20:55'),
(120, 'App\\User', 1, 'updated', 16, 'App\\ConcretoDetallesModel', '{\"si_aplica\":\"1\"}', '{\"si_aplica\":\"0\"}', 'http://127.0.0.1:8000/Api/ConcretoDetalles_update/16', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/88.0.4324.150 Safari/537.36', NULL, '2021-02-09 17:22:21', '2021-02-09 17:22:21'),
(121, 'App\\User', 1, 'updated', 16, 'App\\ConcretoDetallesModel', '{\"si_aplica\":\"0\"}', '{\"si_aplica\":\"1\"}', 'http://127.0.0.1:8000/Api/ConcretoDetalles_update/16', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/88.0.4324.150 Safari/537.36', NULL, '2021-02-09 17:22:27', '2021-02-09 17:22:27'),
(122, 'App\\User', 1, 'updated', 16, 'App\\ConcretoDetallesModel', '{\"si_cumple\":\"0\"}', '{\"si_cumple\":\"1\"}', 'http://127.0.0.1:8000/Api/ConcretoDetalles_update/16', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/88.0.4324.150 Safari/537.36', NULL, '2021-02-09 17:22:29', '2021-02-09 17:22:29'),
(123, 'App\\User', 1, 'updated', 16, 'App\\ConcretoDetallesModel', '{\"fecha\":\"2020-01-15\",\"observaciones\":\"null dee jugaras\"}', '{\"fecha\":\"2020-01-23\",\"observaciones\":\"null dee jugaras de control\"}', 'http://127.0.0.1:8000/Api/ConcretoDetalles_update/16', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/88.0.4324.150 Safari/537.36', NULL, '2021-02-09 17:22:47', '2021-02-09 17:22:47'),
(124, 'App\\User', 1, 'updated', 16, 'App\\ConcretoDetallesModel', '{\"fecha\":\"2020-01-23\",\"observaciones\":\"null dee jugaras de control\"}', '{\"fecha\":\"2020-01-22\",\"observaciones\":\"null dee jugaras de control de todos\"}', 'http://127.0.0.1:8000/Api/ConcretoDetalles_update/16', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/88.0.4324.150 Safari/537.36', NULL, '2021-02-09 17:23:04', '2021-02-09 17:23:04'),
(125, 'App\\User', 1, 'updated', 18, 'App\\ConcretoDetallesModel', '{\"si_aplica\":\"3\",\"observaciones\":\" \"}', '{\"si_aplica\":\"1\",\"observaciones\":null}', 'http://127.0.0.1:8000/Api/ConcretoDetalles_update/18', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/88.0.4324.150 Safari/537.36', NULL, '2021-02-09 17:23:31', '2021-02-09 17:23:31'),
(126, 'App\\User', 1, 'updated', 18, 'App\\ConcretoDetallesModel', '{\"si_cumple\":\"3\",\"observaciones\":null}', '{\"si_cumple\":\"1\",\"observaciones\":\"null\"}', 'http://127.0.0.1:8000/Api/ConcretoDetalles_update/18', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/88.0.4324.150 Safari/537.36', NULL, '2021-02-09 17:23:32', '2021-02-09 17:23:32'),
(127, 'App\\User', 1, 'updated', 20, 'App\\ConcretoDetallesModel', '{\"si_aplica\":\"3\",\"observaciones\":\" \"}', '{\"si_aplica\":\"1\",\"observaciones\":null}', 'http://127.0.0.1:8000/Api/ConcretoDetalles_update/20', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/88.0.4324.150 Safari/537.36', NULL, '2021-02-09 17:23:33', '2021-02-09 17:23:33'),
(128, 'App\\User', 1, 'updated', 20, 'App\\ConcretoDetallesModel', '{\"si_cumple\":\"3\",\"observaciones\":null}', '{\"si_cumple\":\"1\",\"observaciones\":\"null\"}', 'http://127.0.0.1:8000/Api/ConcretoDetalles_update/20', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/88.0.4324.150 Safari/537.36', NULL, '2021-02-09 17:23:34', '2021-02-09 17:23:34'),
(129, 'App\\User', 1, 'updated', 21, 'App\\ConcretoDetallesModel', '{\"si_aplica\":\"3\",\"observaciones\":\" \"}', '{\"si_aplica\":\"1\",\"observaciones\":null}', 'http://127.0.0.1:8000/Api/ConcretoDetalles_update/21', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/88.0.4324.150 Safari/537.36', NULL, '2021-02-09 17:23:36', '2021-02-09 17:23:36'),
(130, 'App\\User', 1, 'updated', 21, 'App\\ConcretoDetallesModel', '{\"si_cumple\":\"3\",\"observaciones\":null}', '{\"si_cumple\":\"0\",\"observaciones\":\"null\"}', 'http://127.0.0.1:8000/Api/ConcretoDetalles_update/21', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/88.0.4324.150 Safari/537.36', NULL, '2021-02-09 17:23:38', '2021-02-09 17:23:38'),
(131, 'App\\User', 1, 'updated', 22, 'App\\ConcretoDetallesModel', '{\"si_aplica\":\"3\",\"observaciones\":\" \"}', '{\"si_aplica\":\"1\",\"observaciones\":null}', 'http://127.0.0.1:8000/Api/ConcretoDetalles_update/22', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/88.0.4324.150 Safari/537.36', NULL, '2021-02-09 17:23:39', '2021-02-09 17:23:39'),
(132, 'App\\User', 1, 'updated', 22, 'App\\ConcretoDetallesModel', '{\"si_cumple\":\"3\",\"observaciones\":null}', '{\"si_cumple\":\"0\",\"observaciones\":\"null\"}', 'http://127.0.0.1:8000/Api/ConcretoDetalles_update/22', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/88.0.4324.150 Safari/537.36', NULL, '2021-02-09 17:23:40', '2021-02-09 17:23:40'),
(133, 'App\\User', 1, 'updated', 23, 'App\\ConcretoDetallesModel', '{\"si_aplica\":\"3\",\"observaciones\":\" \"}', '{\"si_aplica\":\"0\",\"observaciones\":null}', 'http://127.0.0.1:8000/Api/ConcretoDetalles_update/23', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/88.0.4324.150 Safari/537.36', NULL, '2021-02-09 17:23:44', '2021-02-09 17:23:44'),
(134, 'App\\User', 1, 'updated', 23, 'App\\ConcretoDetallesModel', '{\"si_cumple\":\"3\",\"observaciones\":null}', '{\"si_cumple\":\"0\",\"observaciones\":\"null\"}', 'http://127.0.0.1:8000/Api/ConcretoDetalles_update/23', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/88.0.4324.150 Safari/537.36', NULL, '2021-02-09 17:23:45', '2021-02-09 17:23:45'),
(135, 'App\\User', 1, 'updated', 26, 'App\\ConcretoDetallesModel', '{\"observaciones\":\" \"}', '{\"observaciones\":\"como est\"}', 'http://127.0.0.1:8000/Api/ConcretoDetalles_update/26', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/88.0.4324.150 Safari/537.36', NULL, '2021-02-09 17:41:18', '2021-02-09 17:41:18'),
(136, 'App\\User', 1, 'created', 1, 'App\\ConcretoRegistroFotograficoModel', '[]', '{\"nombre\":\"4-20210122_142838.jpgstr_random(5).jpg\",\"concreto_id\":\"4\",\"id\":1}', 'http://127.0.0.1:8000/Api/ConcretoRegistroFotografico', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/88.0.4324.150 Safari/537.36', NULL, '2021-02-09 19:57:26', '2021-02-09 19:57:26'),
(137, 'App\\User', 1, 'created', 2, 'App\\ConcretoRegistroFotograficoModel', '[]', '{\"nombre\":\"4-20210123_142321.jpgser.jpg\",\"concreto_id\":\"4\",\"id\":2}', 'http://127.0.0.1:8000/Api/ConcretoRegistroFotografico', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/88.0.4324.150 Safari/537.36', NULL, '2021-02-09 20:01:28', '2021-02-09 20:01:28'),
(138, 'App\\User', 1, 'created', 1, 'App\\ConcretoRegistroFotograficoModel', '[]', '{\"nombre\":\"16-20210122_142838.jpgser.jpg\",\"concreto_detalles_id\":\"16\",\"id\":1}', 'http://127.0.0.1:8000/Api/ConcretoRegistroFotografico', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/88.0.4324.150 Safari/537.36', NULL, '2021-02-09 20:14:54', '2021-02-09 20:14:54'),
(139, 'App\\User', 1, 'created', 2, 'App\\ConcretoRegistroFotograficoModel', '[]', '{\"nombre\":\"16-20210123_142314.jpgser.jpg\",\"concreto_detalles_id\":\"16\",\"id\":2}', 'http://127.0.0.1:8000/Api/ConcretoRegistroFotografico', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/88.0.4324.150 Safari/537.36', NULL, '2021-02-09 20:15:10', '2021-02-09 20:15:10'),
(140, 'App\\User', 1, 'created', 3, 'App\\ConcretoRegistroFotograficoModel', '[]', '{\"nombre\":\"16-20210123_142409.jpgser.jpg\",\"concreto_detalles_id\":\"16\",\"id\":3}', 'http://127.0.0.1:8000/Api/ConcretoRegistroFotografico', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/88.0.4324.150 Safari/537.36', NULL, '2021-02-09 20:17:21', '2021-02-09 20:17:21'),
(141, 'App\\User', 1, 'created', 4, 'App\\ConcretoRegistroFotograficoModel', '[]', '{\"nombre\":\"16-20210123_142413.jpgser.jpg\",\"concreto_detalles_id\":\"16\",\"id\":4}', 'http://127.0.0.1:8000/Api/ConcretoRegistroFotografico', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/88.0.4324.150 Safari/537.36', NULL, '2021-02-09 20:17:27', '2021-02-09 20:17:27'),
(142, 'App\\User', 1, 'created', 5, 'App\\ConcretoRegistroFotograficoModel', '[]', '{\"nombre\":\"20-20210123_142343.jpgser.jpg\",\"concreto_detalles_id\":\"20\",\"id\":5}', 'http://127.0.0.1:8000/Api/ConcretoRegistroFotografico', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/88.0.4324.150 Safari/537.36', NULL, '2021-02-09 20:22:02', '2021-02-09 20:22:02'),
(143, 'App\\User', 1, 'created', 6, 'App\\ConcretoRegistroFotograficoModel', '[]', '{\"nombre\":\"19-20210123_142354.jpgser.jpg\",\"concreto_detalles_id\":\"19\",\"id\":6}', 'http://127.0.0.1:8000/Api/ConcretoRegistroFotografico', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/88.0.4324.150 Safari/537.36', NULL, '2021-02-09 20:22:18', '2021-02-09 20:22:18'),
(144, 'App\\User', 1, 'updated', 24, 'App\\ConcretoDetallesModel', '{\"si_cumple\":\"3\",\"observaciones\":\" \"}', '{\"si_cumple\":\"1\",\"observaciones\":null}', 'http://127.0.0.1:8000/Api/ConcretoDetalles_update/24', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/88.0.4324.150 Safari/537.36', NULL, '2021-02-09 20:34:34', '2021-02-09 20:34:34'),
(145, 'App\\User', 1, 'updated', 24, 'App\\ConcretoDetallesModel', '{\"si_cumple\":\"1\",\"fecha\":\"2020-01-05\",\"observaciones\":null}', '{\"si_cumple\":\"0\",\"fecha\":\"2020-01-02\",\"observaciones\":\"null\"}', 'http://127.0.0.1:8000/Api/ConcretoDetalles_update/24', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/88.0.4324.150 Safari/537.36', NULL, '2021-02-09 20:34:42', '2021-02-09 20:34:42'),
(146, 'App\\User', 1, 'created', 7, 'App\\ConcretoRegistroFotograficoModel', '[]', '{\"nombre\":\"21-20210122_142838.jpgser.jpg\",\"concreto_detalles_id\":\"21\",\"id\":7}', 'http://127.0.0.1:8000/Api/ConcretoRegistroFotografico', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/88.0.4324.150 Safari/537.36', NULL, '2021-02-09 20:41:42', '2021-02-09 20:41:42'),
(147, 'App\\User', 1, 'updated', 21, 'App\\ConcretoDetallesModel', '{\"si_aplica\":\"1\",\"observaciones\":\"null\"}', '{\"si_aplica\":\"0\",\"observaciones\":\"null de contro l\"}', 'http://127.0.0.1:8000/Api/ConcretoDetalles_update/21', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/88.0.4324.150 Safari/537.36', NULL, '2021-02-09 20:41:55', '2021-02-09 20:41:55'),
(148, 'App\\User', 1, 'updated', 21, 'App\\ConcretoDetallesModel', '{\"si_cumple\":\"0\",\"observaciones\":\"null de contro l\"}', '{\"si_cumple\":\"1\",\"observaciones\":\"null de contro l rerr\"}', 'http://127.0.0.1:8000/Api/ConcretoDetalles_update/21', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/88.0.4324.150 Safari/537.36', NULL, '2021-02-09 20:42:47', '2021-02-09 20:42:47'),
(149, 'App\\User', 1, 'updated', 19, 'App\\ConcretoDetallesModel', '{\"observaciones\":\"null\"}', '{\"observaciones\":\"null control\"}', 'http://127.0.0.1:8000/Api/ConcretoDetalles_update/19', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/88.0.4324.150 Safari/537.36', NULL, '2021-02-09 20:43:25', '2021-02-09 20:43:25'),
(150, 'App\\User', 1, 'updated', 21, 'App\\ConcretoDetallesModel', '{\"observaciones\":\"null de contro l rerr\"}', '{\"observaciones\":\"null de contro l r eeeeerr\"}', 'http://127.0.0.1:8000/Api/ConcretoDetalles_update/21', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/88.0.4324.150 Safari/537.36', NULL, '2021-02-09 20:44:56', '2021-02-09 20:44:56'),
(151, 'App\\User', 1, 'updated', 16, 'App\\ConcretoDetallesModel', '{\"si_aplica\":\"1\"}', '{\"si_aplica\":\"0\"}', 'http://127.0.0.1:8000/Api/ConcretoDetalles_update/16', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/88.0.4324.150 Safari/537.36', NULL, '2021-02-09 20:46:21', '2021-02-09 20:46:21'),
(152, 'App\\User', 1, 'updated', 16, 'App\\ConcretoDetallesModel', '{\"si_cumple\":\"1\"}', '{\"si_cumple\":\"0\"}', 'http://127.0.0.1:8000/Api/ConcretoDetalles_update/16', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/88.0.4324.150 Safari/537.36', NULL, '2021-02-09 20:46:24', '2021-02-09 20:46:24'),
(153, 'App\\User', 1, 'updated', 16, 'App\\ConcretoDetallesModel', '{\"fecha\":\"2020-01-22\"}', '{\"fecha\":\"2020-01-08\"}', 'http://127.0.0.1:8000/Api/ConcretoDetalles_update/16', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/88.0.4324.150 Safari/537.36', NULL, '2021-02-09 20:46:34', '2021-02-09 20:46:34'),
(154, 'App\\User', 1, 'updated', 16, 'App\\ConcretoDetallesModel', '{\"si_aplica\":\"0\"}', '{\"si_aplica\":\"1\"}', 'http://127.0.0.1:8000/Api/ConcretoDetalles_update/16', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/88.0.4324.150 Safari/537.36', NULL, '2021-02-09 20:46:39', '2021-02-09 20:46:39'),
(155, 'App\\User', 1, 'updated', 16, 'App\\ConcretoDetallesModel', '{\"si_aplica\":\"1\"}', '{\"si_aplica\":\"0\"}', 'http://127.0.0.1:8000/Api/ConcretoDetalles_update/16', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/88.0.4324.150 Safari/537.36', NULL, '2021-02-09 20:46:40', '2021-02-09 20:46:40'),
(156, 'App\\User', 1, 'updated', 23, 'App\\ConcretoDetallesModel', '{\"fecha\":\"2020-01-05\"}', '{\"fecha\":\"2020-01-15\"}', 'http://127.0.0.1:8000/Api/ConcretoDetalles_update/23', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/88.0.4324.150 Safari/537.36', NULL, '2021-02-09 20:47:43', '2021-02-09 20:47:43'),
(157, 'App\\User', 1, 'updated', 23, 'App\\ConcretoDetallesModel', '{\"si_cumple\":\"0\"}', '{\"si_cumple\":\"1\"}', 'http://127.0.0.1:8000/Api/ConcretoDetalles_update/23', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/88.0.4324.150 Safari/537.36', NULL, '2021-02-09 20:47:45', '2021-02-09 20:47:45'),
(158, 'App\\User', 1, 'updated', 23, 'App\\ConcretoDetallesModel', '{\"si_cumple\":\"1\"}', '{\"si_cumple\":\"0\"}', 'http://127.0.0.1:8000/Api/ConcretoDetalles_update/23', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/88.0.4324.150 Safari/537.36', NULL, '2021-02-09 20:47:47', '2021-02-09 20:47:47'),
(159, 'App\\User', 1, 'created', 8, 'App\\ConcretoRegistroFotograficoModel', '[]', '{\"nombre\":\"23-20210123_142314.jpgser.jpg\",\"concreto_detalles_id\":\"23\",\"id\":8}', 'http://127.0.0.1:8000/Api/ConcretoRegistroFotografico', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/88.0.4324.150 Safari/537.36', NULL, '2021-02-09 20:48:06', '2021-02-09 20:48:06'),
(160, 'App\\User', 1, 'updated', 25, 'App\\ConcretoDetallesModel', '{\"si_aplica\":\"3\",\"fecha\":\"2020-01-05\",\"observaciones\":\" \"}', '{\"si_aplica\":\"1\",\"fecha\":\"2020-01-08\",\"observaciones\":null}', 'http://127.0.0.1:8000/Api/ConcretoDetalles_update/25', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/88.0.4324.150 Safari/537.36', NULL, '2021-02-09 20:59:30', '2021-02-09 20:59:30'),
(161, 'App\\User', 1, 'updated', 25, 'App\\ConcretoDetallesModel', '{\"si_cumple\":\"3\",\"observaciones\":null}', '{\"si_cumple\":\"1\",\"observaciones\":\"null\"}', 'http://127.0.0.1:8000/Api/ConcretoDetalles_update/25', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/88.0.4324.150 Safari/537.36', NULL, '2021-02-09 20:59:31', '2021-02-09 20:59:31'),
(162, 'App\\User', 1, 'deleted', 1, 'App\\ConcretoRegistroFotograficoModel', '{\"id\":1,\"nombre\":\"16-20210122_142838.jpgser.jpg\",\"concreto_detalles_id\":16}', '[]', 'http://127.0.0.1:8000/Api/ConcretoRegistroFotografico/1', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/88.0.4324.150 Safari/537.36', NULL, '2021-02-09 21:50:46', '2021-02-09 21:50:46'),
(163, 'App\\User', 1, 'updated', 1, 'App\\AceroDetalleModel', '{\"si_aplica\":\"1\"}', '{\"si_aplica\":\"0\"}', 'http://127.0.0.1:8000/Api/AceroDetalles_update/1', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/88.0.4324.150 Safari/537.36', NULL, '2021-02-09 22:14:46', '2021-02-09 22:14:46'),
(164, 'App\\User', 1, 'updated', 1, 'App\\AceroDetalleModel', '{\"si_cumple\":\"0\"}', '{\"si_cumple\":\"1\"}', 'http://127.0.0.1:8000/Api/AceroDetalles_update/1', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/88.0.4324.150 Safari/537.36', NULL, '2021-02-09 22:15:02', '2021-02-09 22:15:02'),
(165, 'App\\User', 1, 'updated', 1, 'App\\AceroDetalleModel', '{\"si_aplica\":\"0\"}', '{\"si_aplica\":\"1\"}', 'http://127.0.0.1:8000/Api/AceroDetalles_update/1', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/88.0.4324.150 Safari/537.36', NULL, '2021-02-09 22:55:34', '2021-02-09 22:55:34'),
(166, 'App\\User', 1, 'updated', 1, 'App\\AceroDetalleModel', '{\"si_cumple\":\"1\"}', '{\"si_cumple\":\"0\"}', 'http://127.0.0.1:8000/Api/AceroDetalles_update/1', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/88.0.4324.150 Safari/537.36', NULL, '2021-02-09 22:55:36', '2021-02-09 22:55:36'),
(167, 'App\\User', 1, 'updated', 1, 'App\\AceroDetalleModel', '{\"fecha\":\"2020-01-08\",\"observaciones\":\"no tiene nada\"}', '{\"fecha\":\"2020-01-15\",\"observaciones\":\"no tiene nada q\"}', 'http://127.0.0.1:8000/Api/AceroDetalles_update/1', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/88.0.4324.150 Safari/537.36', NULL, '2021-02-09 22:55:45', '2021-02-09 22:55:45'),
(168, 'App\\User', 1, 'updated', 2, 'App\\AceroDetalleModel', '{\"observaciones\":\" \"}', '{\"observaciones\":\"rrre\"}', 'http://127.0.0.1:8000/Api/AceroDetalles_update/2', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/88.0.4324.150 Safari/537.36', NULL, '2021-02-09 23:08:30', '2021-02-09 23:08:30'),
(169, 'App\\User', 1, 'updated', 2, 'App\\AceroDetalleModel', '{\"si_aplica\":\"3\"}', '{\"si_aplica\":\"1\"}', 'http://127.0.0.1:8000/Api/AceroDetalles_update/2', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/88.0.4324.150 Safari/537.36', NULL, '2021-02-09 23:08:30', '2021-02-09 23:08:30'),
(170, 'App\\User', 1, 'updated', 3, 'App\\AceroDetalleModel', '{\"si_aplica\":\"3\",\"observaciones\":\" \"}', '{\"si_aplica\":\"0\",\"observaciones\":null}', 'http://127.0.0.1:8000/Api/AceroDetalles_update/3', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/88.0.4324.150 Safari/537.36', NULL, '2021-02-09 23:10:47', '2021-02-09 23:10:47'),
(171, 'App\\User', 1, 'created', 1, 'App\\AceroRegistroFotograficoModel', '[]', '{\"nombre\":\"-20210123_142409.jpgser.jpg\",\"acero_detalle_id\":\"3\",\"id\":1}', 'http://127.0.0.1:8000/Api/AceroRegistroFotografico', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/88.0.4324.150 Safari/537.36', NULL, '2021-02-09 23:13:37', '2021-02-09 23:13:37'),
(172, 'App\\User', 1, 'created', 2, 'App\\AceroRegistroFotograficoModel', '[]', '{\"nombre\":\"1-20210123_142321.jpgser.jpg\",\"acero_detalle_id\":\"1\",\"id\":2}', 'http://127.0.0.1:8000/Api/AceroRegistroFotografico', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/88.0.4324.150 Safari/537.36', NULL, '2021-02-09 23:15:22', '2021-02-09 23:15:22'),
(173, 'App\\User', 1, 'updated', 1, 'App\\AceroModel', '{\"estado_tramite_id\":1}', '{\"estado_tramite_id\":2}', 'http://127.0.0.1:8000/Api/Acero/reporte_final', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/88.0.4324.150 Safari/537.36', NULL, '2021-02-09 23:27:10', '2021-02-09 23:27:10'),
(174, 'App\\User', 1, 'created', 2, 'App\\AceroModel', '[]', '{\"users_id\":1,\"estrutura\":\"trtr\",\"plano\":\"trtr\",\"calzada\":\"trt\",\"elemento\":\"trt\",\"version\":\"trt\",\"estado_tramite_id\":1,\"unidad_funcional_id\":\"2\",\"id\":2}', 'http://127.0.0.1:8000/Api/Acero', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/88.0.4324.150 Safari/537.36', NULL, '2021-02-09 23:43:55', '2021-02-09 23:43:55'),
(175, 'App\\User', 1, 'created', 3, 'App\\AceroModel', '[]', '{\"users_id\":1,\"estrutura\":\"rer\",\"plano\":\"rer\",\"calzada\":\"er\",\"elemento\":\"ere\",\"version\":\"ere\",\"estado_tramite_id\":1,\"unidad_funcional_id\":\"2\",\"id\":3}', 'http://127.0.0.1:8000/Api/Acero', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/88.0.4324.150 Safari/537.36', NULL, '2021-02-09 23:46:08', '2021-02-09 23:46:08'),
(176, 'App\\User', 1, 'created', 4, 'App\\AceroDetalleModel', '[]', '{\"columna\":\"3\",\"actividad\":\"<b>Acero de refuerzo<\\/b> con las formas indicadas en los planos, cumpliendo con despieces y diagramas de dise\\u00f1o\",\"si_aplica\":\"3\",\"si_cumple\":\"3\",\"fecha\":\"2020-01-05\",\"observaciones\":\" \",\"registro_fotografico\":\"sinfoto\",\"acero_id\":\"3\",\"id\":4}', 'http://127.0.0.1:8000/Api/AceroDetalle/3/consulta_data', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/88.0.4324.150 Safari/537.36', NULL, '2021-02-09 23:46:08', '2021-02-09 23:46:08'),
(177, 'App\\User', 1, 'created', 5, 'App\\AceroDetalleModel', '[]', '{\"columna\":\"3\",\"actividad\":\"<b>Estado del refuerzo<\\/b> Las varillas y alambres de amarres no presentan alto grado de corrosi\\u00f3n\",\"si_aplica\":\"3\",\"si_cumple\":\"3\",\"fecha\":\"2020-01-05\",\"observaciones\":\" \",\"registro_fotografico\":\"sinfoto\",\"acero_id\":\"3\",\"id\":5}', 'http://127.0.0.1:8000/Api/AceroDetalle/3/consulta_data', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/88.0.4324.150 Safari/537.36', NULL, '2021-02-09 23:46:08', '2021-02-09 23:46:08'),
(178, 'App\\User', 1, 'created', 6, 'App\\AceroDetalleModel', '[]', '{\"columna\":\"3\",\"actividad\":\" <b>Recubrimiento y amarre<\\/b>  Ubicaci\\u00f3n,  alineacion y espaciamiento  de acuerdo a los planos y normas.\",\"si_aplica\":\"3\",\"si_cumple\":\"3\",\"fecha\":\"2020-01-05\",\"observaciones\":\" \",\"registro_fotografico\":\"sinfoto\",\"acero_id\":\"3\",\"id\":6}', 'http://127.0.0.1:8000/Api/AceroDetalle/3/consulta_data', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/88.0.4324.150 Safari/537.36', NULL, '2021-02-09 23:46:08', '2021-02-09 23:46:08'),
(179, 'App\\User', 1, 'updated', 4, 'App\\AceroDetalleModel', '{\"si_aplica\":\"3\",\"fecha\":\"2020-01-05\",\"observaciones\":\" \"}', '{\"si_aplica\":\"1\",\"fecha\":\"2021-02-09\",\"observaciones\":null}', 'http://127.0.0.1:8000/Api/AceroDetalles_update/4', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/88.0.4324.150 Safari/537.36', NULL, '2021-02-09 23:46:20', '2021-02-09 23:46:20'),
(180, 'App\\User', 1, 'updated', 5, 'App\\AceroDetalleModel', '{\"si_cumple\":\"3\",\"fecha\":\"2020-01-05\",\"observaciones\":\" \"}', '{\"si_cumple\":\"0\",\"fecha\":\"2020-01-08\",\"observaciones\":null}', 'http://127.0.0.1:8000/Api/AceroDetalles_update/5', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/88.0.4324.150 Safari/537.36', NULL, '2021-02-09 23:46:26', '2021-02-09 23:46:26'),
(181, 'App\\User', 1, 'updated', 5, 'App\\AceroDetalleModel', '{\"si_aplica\":\"3\",\"fecha\":\"2020-01-08\",\"observaciones\":null}', '{\"si_aplica\":\"1\",\"fecha\":\"2021-02-09\",\"observaciones\":\"null\"}', 'http://127.0.0.1:8000/Api/AceroDetalles_update/5', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/88.0.4324.150 Safari/537.36', NULL, '2021-02-09 23:46:41', '2021-02-09 23:46:41'),
(182, 'App\\User', 1, 'updated', 5, 'App\\AceroDetalleModel', '{\"observaciones\":\"null\"}', '{\"observaciones\":\"como esta\"}', 'http://127.0.0.1:8000/Api/AceroDetalles_update/5', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/88.0.4324.150 Safari/537.36', NULL, '2021-02-09 23:46:51', '2021-02-09 23:46:51'),
(183, 'App\\User', 1, 'created', 3, 'App\\AceroRegistroFotograficoModel', '[]', '{\"nombre\":\"5-20210123_142314.jpgser.jpg\",\"acero_detalle_id\":\"5\",\"id\":3}', 'http://127.0.0.1:8000/Api/AceroRegistroFotografico', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/88.0.4324.150 Safari/537.36', NULL, '2021-02-09 23:46:54', '2021-02-09 23:46:54'),
(184, 'App\\User', 1, 'updated', 6, 'App\\AceroDetalleModel', '{\"si_aplica\":\"3\",\"observaciones\":\" \"}', '{\"si_aplica\":\"1\",\"observaciones\":null}', 'http://127.0.0.1:8000/Api/AceroDetalles_update/6', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/88.0.4324.150 Safari/537.36', NULL, '2021-02-09 23:46:59', '2021-02-09 23:46:59'),
(185, 'App\\User', 1, 'updated', 6, 'App\\AceroDetalleModel', '{\"si_cumple\":\"3\",\"observaciones\":null}', '{\"si_cumple\":\"0\",\"observaciones\":\"null\"}', 'http://127.0.0.1:8000/Api/AceroDetalles_update/6', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/88.0.4324.150 Safari/537.36', NULL, '2021-02-09 23:47:01', '2021-02-09 23:47:01'),
(186, 'App\\User', 1, 'updated', 6, 'App\\AceroDetalleModel', '{\"fecha\":\"2020-01-05\",\"observaciones\":\"null\"}', '{\"fecha\":\"2020-01-08\",\"observaciones\":\"null e\"}', 'http://127.0.0.1:8000/Api/AceroDetalles_update/6', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/88.0.4324.150 Safari/537.36', NULL, '2021-02-09 23:47:08', '2021-02-09 23:47:08'),
(187, 'App\\User', 1, 'created', 4, 'App\\AceroModel', '[]', '{\"users_id\":1,\"estrutura\":\"eee\",\"plano\":\"eee\",\"calzada\":\"ee\",\"elemento\":\"ee\",\"version\":\"eee\",\"estado_tramite_id\":1,\"unidad_funcional_id\":\"3\",\"id\":4}', 'http://127.0.0.1:8000/Api/Acero', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/88.0.4324.150 Safari/537.36', NULL, '2021-02-09 23:49:50', '2021-02-09 23:49:50'),
(188, 'App\\User', 1, 'created', 7, 'App\\AceroDetalleModel', '[]', '{\"columna\":\"3\",\"actividad\":\"<b>Acero de refuerzo<\\/b> con las formas indicadas en los planos, cumpliendo con despieces y diagramas de dise\\u00f1o\",\"si_aplica\":\"3\",\"si_cumple\":\"3\",\"fecha\":\"18:49:50\",\"observaciones\":\" \",\"registro_fotografico\":\"sinfoto\",\"acero_id\":\"4\",\"id\":7}', 'http://127.0.0.1:8000/Api/AceroDetalle/4/consulta_data', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/88.0.4324.150 Safari/537.36', NULL, '2021-02-09 23:49:50', '2021-02-09 23:49:50'),
(189, 'App\\User', 1, 'created', 8, 'App\\AceroDetalleModel', '[]', '{\"columna\":\"3\",\"actividad\":\"<b>Estado del refuerzo<\\/b> Las varillas y alambres de amarres no presentan alto grado de corrosi\\u00f3n\",\"si_aplica\":\"3\",\"si_cumple\":\"3\",\"fecha\":\"18:49:50\",\"observaciones\":\" \",\"registro_fotografico\":\"sinfoto\",\"acero_id\":\"4\",\"id\":8}', 'http://127.0.0.1:8000/Api/AceroDetalle/4/consulta_data', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/88.0.4324.150 Safari/537.36', NULL, '2021-02-09 23:49:50', '2021-02-09 23:49:50'),
(190, 'App\\User', 1, 'created', 9, 'App\\AceroDetalleModel', '[]', '{\"columna\":\"3\",\"actividad\":\" <b>Recubrimiento y amarre<\\/b>  Ubicaci\\u00f3n,  alineacion y espaciamiento  de acuerdo a los planos y normas.\",\"si_aplica\":\"3\",\"si_cumple\":\"3\",\"fecha\":\"18:49:50\",\"observaciones\":\" \",\"registro_fotografico\":\"sinfoto\",\"acero_id\":\"4\",\"id\":9}', 'http://127.0.0.1:8000/Api/AceroDetalle/4/consulta_data', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/88.0.4324.150 Safari/537.36', NULL, '2021-02-09 23:49:50', '2021-02-09 23:49:50'),
(191, 'App\\User', 1, 'created', 5, 'App\\AceroModel', '[]', '{\"users_id\":1,\"estrutura\":\"ewew\",\"plano\":\"ewe\",\"calzada\":\"ewe\",\"elemento\":\"ewe\",\"version\":\"ewe\",\"estado_tramite_id\":1,\"unidad_funcional_id\":\"2\",\"id\":5}', 'http://127.0.0.1:8000/Api/Acero', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/88.0.4324.150 Safari/537.36', NULL, '2021-02-09 23:53:18', '2021-02-09 23:53:18'),
(192, 'App\\User', 1, 'created', 10, 'App\\AceroDetalleModel', '[]', '{\"columna\":\"3\",\"actividad\":\"<b>Acero de refuerzo<\\/b> con las formas indicadas en los planos, cumpliendo con despieces y diagramas de dise\\u00f1o\",\"si_aplica\":\"3\",\"si_cumple\":\"3\",\"fecha\":\"2021-02-09 18:53:19\",\"observaciones\":\" \",\"registro_fotografico\":\"sinfoto\",\"acero_id\":\"5\",\"id\":10}', 'http://127.0.0.1:8000/Api/AceroDetalle/5/consulta_data', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/88.0.4324.150 Safari/537.36', NULL, '2021-02-09 23:53:19', '2021-02-09 23:53:19');
INSERT INTO `audits` (`id`, `user_type`, `user_id`, `event`, `auditable_id`, `auditable_type`, `old_values`, `new_values`, `url`, `ip_address`, `user_agent`, `tags`, `created_at`, `updated_at`) VALUES
(193, 'App\\User', 1, 'created', 11, 'App\\AceroDetalleModel', '[]', '{\"columna\":\"3\",\"actividad\":\"<b>Estado del refuerzo<\\/b> Las varillas y alambres de amarres no presentan alto grado de corrosi\\u00f3n\",\"si_aplica\":\"3\",\"si_cumple\":\"3\",\"fecha\":\"2021-02-09 18:53:19\",\"observaciones\":\" \",\"registro_fotografico\":\"sinfoto\",\"acero_id\":\"5\",\"id\":11}', 'http://127.0.0.1:8000/Api/AceroDetalle/5/consulta_data', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/88.0.4324.150 Safari/537.36', NULL, '2021-02-09 23:53:19', '2021-02-09 23:53:19'),
(194, 'App\\User', 1, 'created', 12, 'App\\AceroDetalleModel', '[]', '{\"columna\":\"3\",\"actividad\":\" <b>Recubrimiento y amarre<\\/b>  Ubicaci\\u00f3n,  alineacion y espaciamiento  de acuerdo a los planos y normas.\",\"si_aplica\":\"3\",\"si_cumple\":\"3\",\"fecha\":\"2021-02-09 18:53:19\",\"observaciones\":\" \",\"registro_fotografico\":\"sinfoto\",\"acero_id\":\"5\",\"id\":12}', 'http://127.0.0.1:8000/Api/AceroDetalle/5/consulta_data', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/88.0.4324.150 Safari/537.36', NULL, '2021-02-09 23:53:19', '2021-02-09 23:53:19'),
(195, 'App\\User', 1, 'updated', 11, 'App\\AceroDetalleModel', '{\"si_aplica\":\"3\",\"observaciones\":\" \"}', '{\"si_aplica\":\"1\",\"observaciones\":null}', 'http://127.0.0.1:8000/Api/AceroDetalles_update/11', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/88.0.4324.150 Safari/537.36', NULL, '2021-02-09 23:55:31', '2021-02-09 23:55:31'),
(196, 'App\\User', 1, 'updated', 11, 'App\\AceroDetalleModel', '{\"si_cumple\":\"3\",\"observaciones\":null}', '{\"si_cumple\":\"0\",\"observaciones\":\"null\"}', 'http://127.0.0.1:8000/Api/AceroDetalles_update/11', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/88.0.4324.150 Safari/537.36', NULL, '2021-02-09 23:55:33', '2021-02-09 23:55:33'),
(197, 'App\\User', 1, 'updated', 12, 'App\\AceroDetalleModel', '{\"si_aplica\":\"3\",\"fecha\":\"2021-02-09 18:53:19\",\"observaciones\":\" \"}', '{\"si_aplica\":\"1\",\"fecha\":\"2021-02-08\",\"observaciones\":null}', 'http://127.0.0.1:8000/Api/AceroDetalles_update/12', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/88.0.4324.150 Safari/537.36', NULL, '2021-02-09 23:55:42', '2021-02-09 23:55:42'),
(198, 'App\\User', 1, 'updated', 12, 'App\\AceroDetalleModel', '{\"si_cumple\":\"3\",\"fecha\":\"2021-02-08\",\"observaciones\":null}', '{\"si_cumple\":\"1\",\"fecha\":\"2021-02-09\",\"observaciones\":\"null\"}', 'http://127.0.0.1:8000/Api/AceroDetalles_update/12', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/88.0.4324.150 Safari/537.36', NULL, '2021-02-09 23:55:45', '2021-02-09 23:55:45'),
(199, 'App\\User', 1, 'updated', 1, 'App\\FresadoModel', '{\"unidad_funcional_id\":1}', '{\"unidad_funcional_id\":\"2\"}', 'http://127.0.0.1:8000/Api/Fresado/1', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/88.0.4324.150 Safari/537.36', NULL, '2021-02-10 00:16:53', '2021-02-10 00:16:53'),
(200, 'App\\User', 1, 'created', 3, 'App\\FresadoModel', '[]', '{\"unidad_funcional_id\":\"3\",\"calzada\":\"eee\",\"users_id\":1,\"longitud\":\"eee\",\"plano_codigo\":\"ew\",\"version\":\"ew\",\"ancho_uno\":\"ewe\",\"ancho_dos\":\"ewe\",\"espesor_uno\":\"ewe\",\"espesor_dos\":\"ewe\",\"estado_tramite_id\":\"1\",\"id\":3}', 'http://127.0.0.1:8000/Api/Fresado', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/88.0.4324.150 Safari/537.36', NULL, '2021-02-10 00:18:56', '2021-02-10 00:18:56'),
(201, 'App\\User', 1, 'created', 4, 'App\\FresadoModel', '[]', '{\"unidad_funcional_id\":\"2\",\"calzada\":\"eeee\",\"users_id\":1,\"longitud\":\"eeee\",\"plano_codigo\":\"eeee\",\"version\":\"eee\",\"ancho_uno\":\"eee\",\"ancho_dos\":\"eee\",\"espesor_uno\":\"eee\",\"espesor_dos\":\"eee\",\"estado_tramite_id\":1,\"id\":4}', 'http://127.0.0.1:8000/Api/Fresado', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/88.0.4324.150 Safari/537.36', NULL, '2021-02-10 00:20:31', '2021-02-10 00:20:31'),
(202, 'App\\User', 1, 'created', 4, 'App\\FresadoDetalleModel', '[]', '{\"columna\":\"4\",\"actividad\":\"<b>Seguridad  El frente de trabajo se encuentra se\\u00f1alizado de manera adecuada y aislado correctamente\",\"si_aplica\":\"3\",\"si_cumple\":\"3\",\"fecha\":\"2020-01-01\",\"observaciones\":\" \",\"registro_fotografico\":\"sinfoto\",\"fresado_id\":\"3\",\"id\":4}', 'http://127.0.0.1:8000/Api/FresadoDetalle/3/consulta_data', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/88.0.4324.150 Safari/537.36', NULL, '2021-02-10 00:24:32', '2021-02-10 00:24:32'),
(203, 'App\\User', 1, 'created', 5, 'App\\FresadoDetalleModel', '[]', '{\"columna\":\"4\",\"actividad\":\"<b>Localizaci\\u00f3n y replanteo  Se cuenta con control topogr\\u00e1fico de las actividades\",\"si_aplica\":\"3\",\"si_cumple\":\"3\",\"fecha\":\"2020-01-01\",\"observaciones\":\" \",\"registro_fotografico\":\"sinfoto\",\"fresado_id\":\"3\",\"id\":5}', 'http://127.0.0.1:8000/Api/FresadoDetalle/3/consulta_data', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/88.0.4324.150 Safari/537.36', NULL, '2021-02-10 00:24:32', '2021-02-10 00:24:32'),
(204, 'App\\User', 1, 'created', 6, 'App\\FresadoDetalleModel', '[]', '{\"columna\":\"4\",\"actividad\":\" <b>Seguridad  Las volquetas cuentan con sistema de autocarpado\",\"si_aplica\":\"3\",\"si_cumple\":\"3\",\"fecha\":\"2020-01-01\",\"observaciones\":\" \",\"registro_fotografico\":\"sinfoto\",\"fresado_id\":\"3\",\"id\":6}', 'http://127.0.0.1:8000/Api/FresadoDetalle/3/consulta_data', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/88.0.4324.150 Safari/537.36', NULL, '2021-02-10 00:24:32', '2021-02-10 00:24:32'),
(205, 'App\\User', 1, 'updated', 4, 'App\\ConcretoDetallesModel', '{\"si_cumple\":\"1\",\"fecha\":\"2020-12-16\",\"observaciones\":\"no tiene st st\"}', '{\"si_cumple\":\"3\",\"fecha\":\"2020-01-01\",\"observaciones\":null}', 'http://127.0.0.1:8000/Api/ConcretoDetalles_update/4', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/88.0.4324.150 Safari/537.36', NULL, '2021-02-10 00:27:12', '2021-02-10 00:27:12'),
(206, 'App\\User', 1, 'updated', 4, 'App\\FresadoDetalleModel', '{\"si_aplica\":\"3\",\"observaciones\":\" \"}', '{\"si_aplica\":\"1\",\"observaciones\":null}', 'http://127.0.0.1:8000/Api/FresadoDetalles_update/4', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/88.0.4324.150 Safari/537.36', NULL, '2021-02-10 00:28:25', '2021-02-10 00:28:25'),
(207, 'App\\User', 1, 'updated', 4, 'App\\FresadoDetalleModel', '{\"si_cumple\":\"3\",\"observaciones\":null}', '{\"si_cumple\":\"1\",\"observaciones\":\"null\"}', 'http://127.0.0.1:8000/Api/FresadoDetalles_update/4', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/88.0.4324.150 Safari/537.36', NULL, '2021-02-10 00:28:28', '2021-02-10 00:28:28'),
(208, 'App\\User', 1, 'created', 9, 'App\\ConcretoRegistroFotograficoModel', '[]', '{\"nombre\":\"4-20210123_142349.jpgser.jpg\",\"concreto_detalles_id\":\"4\",\"id\":9}', 'http://127.0.0.1:8000/Api/ConcretoRegistroFotografico', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/88.0.4324.150 Safari/537.36', NULL, '2021-02-10 00:28:52', '2021-02-10 00:28:52'),
(209, 'App\\User', 1, 'updated', 5, 'App\\FresadoDetalleModel', '{\"si_aplica\":\"3\",\"observaciones\":\" \"}', '{\"si_aplica\":\"1\",\"observaciones\":null}', 'http://127.0.0.1:8000/Api/FresadoDetalles_update/5', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/88.0.4324.150 Safari/537.36', NULL, '2021-02-10 00:29:51', '2021-02-10 00:29:51'),
(210, 'App\\User', 1, 'created', 1, 'App\\FresadoRegistroFotograficoModel', '[]', '{\"nombre\":\"-20210124_134046.jpgser.jpg\",\"fresado_detalle_id\":\"4\",\"id\":1}', 'http://127.0.0.1:8000/Api/FresadoRegistroFotografico', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/88.0.4324.150 Safari/537.36', NULL, '2021-02-10 00:40:42', '2021-02-10 00:40:42'),
(211, 'App\\User', 1, 'updated', 3, 'App\\FresadoModel', '{\"estado_tramite_id\":1}', '{\"estado_tramite_id\":2}', 'http://127.0.0.1:8000/Api/Fresado/reporte_final', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/88.0.4324.150 Safari/537.36', NULL, '2021-02-10 00:50:25', '2021-02-10 00:50:25');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `concreto`
--

CREATE TABLE `concreto` (
  `id` bigint(20) NOT NULL,
  `users_id` bigint(20) NOT NULL,
  `unidad_funcional_id` int(11) NOT NULL,
  `calzada` varchar(45) NOT NULL,
  `estrutura` varchar(45) NOT NULL,
  `elemento` varchar(45) NOT NULL,
  `plano_codigo` varchar(45) NOT NULL,
  `version` varchar(45) NOT NULL,
  `resistencia_concreto` varchar(45) NOT NULL,
  `estado_tramite_id` int(11) NOT NULL DEFAULT 1,
  `latitud` varchar(25) NOT NULL,
  `longitud` varchar(25) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `concreto`
--

INSERT INTO `concreto` (`id`, `users_id`, `unidad_funcional_id`, `calzada`, `estrutura`, `elemento`, `plano_codigo`, `version`, `resistencia_concreto`, `estado_tramite_id`, `latitud`, `longitud`) VALUES
(1, 1, 2, 'tramitess', 'eeee', 'eee', 'eee', 'eee', '45', 2, '4.7109886', '-74.072092'),
(2, 1, 2, 'dddd', 'dddd', 'dddd', 'dddd', 'dddd', '45', 2, '4.7109886', '-74.072092'),
(4, 1, 1, 'girardot-bogota', 'plana', 'concreto', '11', '22', '45', 1, '', ''),
(5, 1, 1, 'qqq', 'www', 'ee', 'rr', 'rr', 'rr', 1, '', ''),
(6, 1, 3, 'ewew', 'eew', 'weewe', 'wewew', 'weewe', 'rrer', 1, '4.7109886', '-74.072092'),
(7, 1, 1, 'hh', 'hhh', 'hhh', 'hhh', 'hhh', 'hhh', 1, '4.7109886', '-74.072092'),
(8, 1, 1, 'hh', 'hhh', 'hhh', 'hhh', 'hhh', 'hhh', 2, '4.7109886', '-74.072092');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `concreto_detalles`
--

CREATE TABLE `concreto_detalles` (
  `id` bigint(20) NOT NULL,
  `columna` int(11) NOT NULL,
  `titulo` varchar(500) DEFAULT NULL,
  `si_aplica` varchar(1) NOT NULL,
  `si_cumple` varchar(1) NOT NULL,
  `fecha` varchar(10) NOT NULL DEFAULT '',
  `observaciones` varchar(500) DEFAULT NULL,
  `registro_fotografico` varchar(500) NOT NULL DEFAULT 'null.png',
  `concreto_id` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `concreto_detalles`
--

INSERT INTO `concreto_detalles` (`id`, `columna`, `titulo`, `si_aplica`, `si_cumple`, `fecha`, `observaciones`, `registro_fotografico`, `concreto_id`) VALUES
(4, 1, '<b>Localización y replanteo</b>  Ubicación de elemento cumple con planos de diseño', '1', '3', '2020-01-01', NULL, '0e471f56-a86b-499b-9ed9-318fd001dcd1.jpgstr_random(5).jpg', 1),
(5, 1, '<b>Verticalidad</b>  Elemento cumple con planos y diseños', '0', '1', '2020-01-05', 'no tiene', '0e471f56-a86b-499b-9ed9-318fd001dcd1.jpgstr_random(5).jpg', 1),
(6, 1, ' <b>Solado</b> Concreto de limpieza y nivelación', '0', '1', '2020-01-05', ' ', 'null.png', 1),
(7, 1, '<b>Desmoldante</b> Paredes de Formaleta cuentan con desmoldante que permitira en desencofre de la estructura', '1', '1', '2021-02-02', 'todo', 'null.png', 1),
(8, 1, ' <b>Muestras de concreto</b> - Toma de cilindros de concreto', '3', '3', '2020-01-05', ' ', 'null.png', 1),
(9, 1, '<b>Temperatura</b> - Temperatura máxima del concreto no mayor a 32 C.', '3', '3', '2020-01-05', ' ', 'null.png', 1),
(10, 1, '<b>Asentamiento</b> - Asentamiento dentro del rango de diseño.', '1', '1', '2020-01-05', 'nada de', 'null.png', 1),
(11, 1, '<b>Seguridad</b> Ubicación de formaleta segura que permita el trabajo de descarga del concreto sin inconvenientes.', '1', '1', '2020-01-05', 'no deje solo', 'dwnld-broucher-3.pngstr_random(5).png', 1),
(12, 2, '<b>Curado</b>  aplicación de productos para el curado del concreto (indicar en observaciones el método utilizado)', '1', '0', '2021-02-08', 'no tiene', 'tecrahul.pngstr_random(5).png', 1),
(13, 2, '<b>Acabados</b>  Elemento cumple con buenos acabados', '3', '3', '2020-01-05', ' ', 'null.png', 1),
(14, 2, '<b>Juntas</b> Elemento con juntas de dilatación o construcción', '3', '3', '2020-01-05', ' ', 'sinfoto', 1),
(15, 2, '<b>Fisuras</b> Presencia de fisuras después de la fundida', '3', '3', '2020-01-05', ' ', 'sinfoto', 1),
(16, 1, '<b>Localización y replanteo</b>  Ubicación de elemento cumple con planos de diseño', '0', '0', '2020-01-08', 'null dee jugaras de control de todos', 'sinfoto', 4),
(17, 1, '<b>Verticalidad</b>  Elemento cumple con planos y diseños', '1', '0', '2020-01-05', NULL, 'sinfoto', 4),
(18, 1, ' <b>Solado</b> Concreto de limpieza y nivelación', '1', '1', '2020-01-05', 'null', 'sinfoto', 4),
(19, 1, '<b>Desmoldante</b> Paredes de Formaleta cuentan con desmoldante que permitira en desencofre de la estructura', '0', '0', '2020-01-05', 'null control', 'sinfoto', 4),
(20, 1, ' <b>Muestras de concreto</b> - Toma de cilindros de concreto', '1', '1', '2020-01-05', 'null', 'sinfoto', 4),
(21, 1, '<b>Temperatura</b> - Temperatura máxima del concreto no mayor a 32 C.', '0', '1', '2020-01-05', 'null de contro l r eeeeerr', 'sinfoto', 4),
(22, 1, '<b>Asentamiento</b> - Asentamiento dentro del rango de diseño.', '1', '0', '2020-01-05', 'null', 'sinfoto', 4),
(23, 1, '<b>Seguridad</b> Ubicación de formaleta segura que permita el trabajo de descarga del concreto sin inconvenientes.', '0', '0', '2020-01-15', 'null', 'sinfoto', 4),
(24, 2, '<b>Curado</b>  aplicación de productos para el curado del concreto (indicar en observaciones el método utilizado)', '3', '0', '2020-01-02', 'null', 'sinfoto', 4),
(25, 2, '<b>Acabados</b>  Elemento cumple con buenos acabados', '1', '1', '2020-01-08', 'null', 'sinfoto', 4),
(26, 2, '<b>Juntas</b> Elemento con juntas de dilatación o construcción', '3', '3', '2020-01-05', 'como est', 'sinfoto', 4),
(27, 2, '<b>Fisuras</b> Presencia de fisuras después de la fundida', '3', '3', '2020-01-05', ' ', 'sinfoto', 4),
(28, 1, '<b>Localización y replanteo</b>  Ubicación de elemento cumple con planos de diseño', '1', '0', '2021-02-08', NULL, 'ing-industrial1-blog.jpgstr_random(5).jpg', 2),
(29, 1, '<b>Verticalidad</b>  Elemento cumple con planos y diseños', '3', '3', '2020-01-05', ' ', 'sinfoto', 2),
(30, 1, ' <b>Solado</b> Concreto de limpieza y nivelación', '3', '3', '2020-01-05', ' ', 'sinfoto', 2),
(31, 1, '<b>Desmoldante</b> Paredes de Formaleta cuentan con desmoldante que permitira en desencofre de la estructura', '3', '3', '2020-01-05', ' ', 'sinfoto', 2),
(32, 1, ' <b>Muestras de concreto</b> - Toma de cilindros de concreto', '3', '3', '2020-01-05', ' ', 'sinfoto', 2),
(33, 1, '<b>Temperatura</b> - Temperatura máxima del concreto no mayor a 32 C.', '3', '3', '2020-01-05', ' ', 'sinfoto', 2),
(34, 1, '<b>Asentamiento</b> - Asentamiento dentro del rango de diseño.', '3', '3', '2020-01-05', ' ', 'sinfoto', 2),
(35, 1, '<b>Seguridad</b> Ubicación de formaleta segura que permita el trabajo de descarga del concreto sin inconvenientes.', '3', '3', '2020-01-05', ' ', 'sinfoto', 2),
(36, 2, '<b>Curado</b>  aplicación de productos para el curado del concreto (indicar en observaciones el método utilizado)', '3', '3', '2020-01-05', ' ', 'sinfoto', 2),
(37, 2, '<b>Acabados</b>  Elemento cumple con buenos acabados', '3', '3', '2020-01-05', ' ', 'sinfoto', 2),
(38, 2, '<b>Juntas</b> Elemento con juntas de dilatación o construcción', '3', '3', '2020-01-05', ' ', 'sinfoto', 2),
(39, 2, '<b>Fisuras</b> Presencia de fisuras después de la fundida', '3', '3', '2020-01-05', ' ', 'sinfoto', 2),
(40, 1, '<b>Localización y replanteo</b>  Ubicación de elemento cumple con planos de diseño', '1', '0', '2021-02-08', 'yyyyy', 'ddddddddddddddddddddddddddddddddd.jpgstr_random(5).jpg', 5),
(41, 1, '<b>Verticalidad</b>  Elemento cumple con planos y diseños', '3', '3', '2020-01-05', ' ', 'sinfoto', 5),
(42, 1, ' <b>Solado</b> Concreto de limpieza y nivelación', '3', '3', '2020-01-05', ' ', 'sinfoto', 5),
(43, 1, '<b>Desmoldante</b> Paredes de Formaleta cuentan con desmoldante que permitira en desencofre de la estructura', '3', '3', '2020-01-05', ' ', 'sinfoto', 5),
(44, 1, ' <b>Muestras de concreto</b> - Toma de cilindros de concreto', '3', '3', '2020-01-05', ' ', 'sinfoto', 5),
(45, 1, '<b>Temperatura</b> - Temperatura máxima del concreto no mayor a 32 C.', '3', '3', '2020-01-05', ' ', 'sinfoto', 5),
(46, 1, '<b>Asentamiento</b> - Asentamiento dentro del rango de diseño.', '3', '3', '2020-01-05', ' ', 'sinfoto', 5),
(47, 1, '<b>Seguridad</b> Ubicación de formaleta segura que permita el trabajo de descarga del concreto sin inconvenientes.', '3', '3', '2020-01-05', ' ', 'sinfoto', 5),
(48, 2, '<b>Curado</b>  aplicación de productos para el curado del concreto (indicar en observaciones el método utilizado)', '3', '3', '2020-01-05', ' ', 'sinfoto', 5),
(49, 2, '<b>Acabados</b>  Elemento cumple con buenos acabados', '3', '3', '2020-01-05', ' ', 'sinfoto', 5),
(50, 2, '<b>Juntas</b> Elemento con juntas de dilatación o construcción', '3', '3', '2020-01-05', ' ', 'sinfoto', 5),
(51, 2, '<b>Fisuras</b> Presencia de fisuras después de la fundida', '3', '3', '2020-01-05', ' ', 'sinfoto', 5),
(52, 1, '<b>Localización y replanteo</b>  Ubicación de elemento cumple con planos de diseño', '3', '3', '2020-01-05', ' ', 'sinfoto', 6),
(53, 1, '<b>Verticalidad</b>  Elemento cumple con planos y diseños', '3', '3', '2020-01-05', ' ', 'sinfoto', 6),
(54, 1, ' <b>Solado</b> Concreto de limpieza y nivelación', '3', '3', '2020-01-05', ' ', 'sinfoto', 6),
(55, 1, '<b>Desmoldante</b> Paredes de Formaleta cuentan con desmoldante que permitira en desencofre de la estructura', '3', '3', '2020-01-05', ' ', 'sinfoto', 6),
(56, 1, ' <b>Muestras de concreto</b> - Toma de cilindros de concreto', '3', '3', '2020-01-05', ' ', 'sinfoto', 6),
(57, 1, '<b>Temperatura</b> - Temperatura máxima del concreto no mayor a 32 C.', '3', '3', '2020-01-05', ' ', 'sinfoto', 6),
(58, 1, '<b>Asentamiento</b> - Asentamiento dentro del rango de diseño.', '3', '3', '2020-01-05', ' ', 'sinfoto', 6),
(59, 1, '<b>Seguridad</b> Ubicación de formaleta segura que permita el trabajo de descarga del concreto sin inconvenientes.', '3', '3', '2020-01-05', ' ', 'sinfoto', 6),
(60, 2, '<b>Curado</b>  aplicación de productos para el curado del concreto (indicar en observaciones el método utilizado)', '3', '3', '2020-01-05', ' ', 'sinfoto', 6),
(61, 2, '<b>Acabados</b>  Elemento cumple con buenos acabados', '3', '3', '2020-01-05', ' ', 'sinfoto', 6),
(62, 2, '<b>Juntas</b> Elemento con juntas de dilatación o construcción', '3', '3', '2020-01-05', ' ', 'sinfoto', 6),
(63, 2, '<b>Fisuras</b> Presencia de fisuras después de la fundida', '3', '3', '2020-01-05', ' ', 'sinfoto', 6),
(64, 1, '<b>Localización y replanteo</b>  Ubicación de elemento cumple con planos de diseño', '1', '0', '2021-02-08', NULL, 'ddddddddddddddddddddddddddddddddd.jpgstr_random(5).jpg', 7),
(65, 1, '<b>Verticalidad</b>  Elemento cumple con planos y diseños', '3', '3', '2020-01-05', ' ', 'sinfoto', 7),
(66, 1, ' <b>Solado</b> Concreto de limpieza y nivelación', '3', '3', '2020-01-05', ' ', 'sinfoto', 7),
(67, 1, '<b>Desmoldante</b> Paredes de Formaleta cuentan con desmoldante que permitira en desencofre de la estructura', '3', '3', '2020-01-05', ' ', 'sinfoto', 7),
(68, 1, ' <b>Muestras de concreto</b> - Toma de cilindros de concreto', '3', '3', '2020-01-05', ' ', 'sinfoto', 7),
(69, 1, '<b>Temperatura</b> - Temperatura máxima del concreto no mayor a 32 C.', '3', '3', '2020-01-05', ' ', 'sinfoto', 7),
(70, 1, '<b>Asentamiento</b> - Asentamiento dentro del rango de diseño.', '3', '3', '2020-01-05', ' ', 'sinfoto', 7),
(71, 1, '<b>Seguridad</b> Ubicación de formaleta segura que permita el trabajo de descarga del concreto sin inconvenientes.', '3', '3', '2020-01-05', ' ', 'sinfoto', 7),
(72, 2, '<b>Curado</b>  aplicación de productos para el curado del concreto (indicar en observaciones el método utilizado)', '3', '3', '2020-01-05', ' ', 'sinfoto', 7),
(73, 2, '<b>Acabados</b>  Elemento cumple con buenos acabados', '3', '3', '2020-01-05', ' ', 'sinfoto', 7),
(74, 2, '<b>Juntas</b> Elemento con juntas de dilatación o construcción', '3', '3', '2020-01-05', ' ', 'sinfoto', 7),
(75, 2, '<b>Fisuras</b> Presencia de fisuras después de la fundida', '3', '3', '2020-01-05', ' ', 'sinfoto', 7),
(76, 1, '<b>Localización y replanteo</b>  Ubicación de elemento cumple con planos de diseño', '3', '3', '2020-01-05', ' ', 'sinfoto', 8),
(77, 1, '<b>Verticalidad</b>  Elemento cumple con planos y diseños', '3', '3', '2020-01-05', ' ', 'sinfoto', 8),
(78, 1, ' <b>Solado</b> Concreto de limpieza y nivelación', '3', '3', '2020-01-05', ' ', 'sinfoto', 8),
(79, 1, '<b>Desmoldante</b> Paredes de Formaleta cuentan con desmoldante que permitira en desencofre de la estructura', '3', '3', '2020-01-05', ' ', 'sinfoto', 8),
(80, 1, ' <b>Muestras de concreto</b> - Toma de cilindros de concreto', '3', '3', '2020-01-05', ' ', 'sinfoto', 8),
(81, 1, '<b>Temperatura</b> - Temperatura máxima del concreto no mayor a 32 C.', '3', '3', '2020-01-05', ' ', 'sinfoto', 8),
(82, 1, '<b>Asentamiento</b> - Asentamiento dentro del rango de diseño.', '3', '3', '2020-01-05', ' ', 'sinfoto', 8),
(83, 1, '<b>Seguridad</b> Ubicación de formaleta segura que permita el trabajo de descarga del concreto sin inconvenientes.', '3', '3', '2020-01-05', ' ', 'sinfoto', 8),
(84, 2, '<b>Curado</b>  aplicación de productos para el curado del concreto (indicar en observaciones el método utilizado)', '3', '3', '2020-01-05', ' ', 'sinfoto', 8),
(85, 2, '<b>Acabados</b>  Elemento cumple con buenos acabados', '3', '3', '2020-01-05', ' ', 'sinfoto', 8),
(86, 2, '<b>Juntas</b> Elemento con juntas de dilatación o construcción', '3', '3', '2020-01-05', ' ', 'sinfoto', 8),
(87, 2, '<b>Fisuras</b> Presencia de fisuras después de la fundida', '3', '3', '2020-01-05', ' ', 'sinfoto', 8);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `concreto_registro_fotografico`
--

CREATE TABLE `concreto_registro_fotografico` (
  `id` int(11) NOT NULL,
  `nombre` varchar(45) DEFAULT NULL,
  `created_at` varchar(45) DEFAULT NULL,
  `updated_at` varchar(45) DEFAULT NULL,
  `concreto_detalles_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `concreto_registro_fotografico`
--

INSERT INTO `concreto_registro_fotografico` (`id`, `nombre`, `created_at`, `updated_at`, `concreto_detalles_id`) VALUES
(2, '16-20210123_142314.jpgser.jpg', '2021-02-09 15:15:10', '2021-02-09 15:15:10', 16),
(3, '16-20210123_142409.jpgser.jpg', '2021-02-09 15:17:21', '2021-02-09 15:17:21', 16),
(4, '16-20210123_142413.jpgser.jpg', '2021-02-09 15:17:27', '2021-02-09 15:17:27', 16),
(5, '20-20210123_142343.jpgser.jpg', '2021-02-09 15:22:02', '2021-02-09 15:22:02', 20),
(6, '19-20210123_142354.jpgser.jpg', '2021-02-09 15:22:17', '2021-02-09 15:22:17', 19),
(7, '21-20210122_142838.jpgser.jpg', '2021-02-09 15:41:42', '2021-02-09 15:41:42', 21),
(8, '23-20210123_142314.jpgser.jpg', '2021-02-09 15:48:06', '2021-02-09 15:48:06', 23),
(9, '4-20210123_142349.jpgser.jpg', '2021-02-09 19:28:52', '2021-02-09 19:28:52', 4);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `estado_tramite`
--

CREATE TABLE `estado_tramite` (
  `id` int(11) NOT NULL,
  `nombre` varchar(45) NOT NULL,
  `class` varchar(45) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `estado_tramite`
--

INSERT INTO `estado_tramite` (`id`, `nombre`, `class`) VALUES
(1, 'Proceso', NULL),
(2, 'En espera', NULL),
(3, 'En revision', NULL),
(4, 'Finalizado', NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `connection` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `fresado`
--

CREATE TABLE `fresado` (
  `id` bigint(20) NOT NULL,
  `users_id` int(11) NOT NULL,
  `unidad_funcional_id` int(11) NOT NULL,
  `calzada` varchar(45) DEFAULT NULL,
  `longitud` varchar(45) DEFAULT NULL,
  `plano_codigo` varchar(45) DEFAULT NULL,
  `version` varchar(45) DEFAULT NULL,
  `ancho_uno` varchar(45) DEFAULT NULL,
  `ancho_dos` varchar(45) DEFAULT NULL,
  `espesor_uno` varchar(45) DEFAULT NULL,
  `espesor_dos` varchar(45) DEFAULT NULL,
  `estado_tramite_id` int(11) NOT NULL,
  `created_at` timestamp(1) NOT NULL DEFAULT current_timestamp(1) ON UPDATE current_timestamp(1),
  `updated_at` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `fresado`
--

INSERT INTO `fresado` (`id`, `users_id`, `unidad_funcional_id`, `calzada`, `longitud`, `plano_codigo`, `version`, `ancho_uno`, `ancho_dos`, `espesor_uno`, `espesor_dos`, `estado_tramite_id`, `created_at`, `updated_at`) VALUES
(1, 0, 2, 'sss', 'sss', 'sss', 'ss', 'sss', 'ss', 'ss', 'sss', 1, '2021-02-09 19:16:53.4', '2021-02-09 19:16:53'),
(2, 0, 1, 'GIRARDOT', '45', '45', '33', '45', '45', '45', '45', 1, '2021-02-05 20:54:38.0', '2021-02-05 15:54:38'),
(3, 1, 3, 'eee', 'eee', 'ew', 'ew', 'ewe', 'ewe', 'ewe', 'ewe', 2, '2021-02-09 19:50:25.1', '2021-02-09 19:50:25'),
(4, 1, 2, 'eeee', 'eeee', 'eeee', 'eee', 'eee', 'eee', 'eee', 'eee', 1, '2021-02-10 00:20:31.0', '2021-02-09 19:20:31');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `fresadoregistrofotografico`
--

CREATE TABLE `fresadoregistrofotografico` (
  `id` int(11) NOT NULL,
  `nombre` varchar(45) NOT NULL,
  `created_at` varchar(45) DEFAULT NULL,
  `updated_at` varchar(45) DEFAULT NULL,
  `fresado_detalle_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `fresadoregistrofotografico`
--

INSERT INTO `fresadoregistrofotografico` (`id`, `nombre`, `created_at`, `updated_at`, `fresado_detalle_id`) VALUES
(1, '-20210124_134046.jpgser.jpg', '2021-02-09 19:40:42', '2021-02-09 19:40:42', 4);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `fresado_detalle`
--

CREATE TABLE `fresado_detalle` (
  `id` int(11) NOT NULL,
  `actividad` varchar(500) DEFAULT NULL,
  `si_aplica` varchar(45) DEFAULT NULL,
  `si_cumple` varchar(45) DEFAULT NULL,
  `fecha` varchar(45) DEFAULT NULL,
  `observaciones` varchar(500) DEFAULT NULL,
  `registro_fotografico` varchar(255) DEFAULT NULL,
  `created_at` timestamp(1) NULL DEFAULT NULL,
  `updated_at` timestamp(1) NULL DEFAULT NULL,
  `fresado_id` bigint(20) NOT NULL,
  `columna` int(2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `fresado_detalle`
--

INSERT INTO `fresado_detalle` (`id`, `actividad`, `si_aplica`, `si_cumple`, `fecha`, `observaciones`, `registro_fotografico`, `created_at`, `updated_at`, `fresado_id`, `columna`) VALUES
(1, '<b>Seguridad  El frente de trabajo se encuentra señalizado de manera adecuada y aislado correctamente', '1', '1', '2020-01-15', 'null dee', '0e471f56-a86b-499b-9ed9-318fd001dcd1.jpgstr_random(5).jpg', '2021-02-04 04:04:53.0', '2021-02-04 04:11:03.0', 1, 4),
(2, '<b>Localización y replanteo  Se cuenta con control topográfico de las actividades', '3', '3', '2020-01-01', 'deeee', 'ing-industrial1-blog.jpgstr_random(5).jpg', '2021-02-04 04:04:53.0', '2021-02-04 04:10:31.0', 1, 4),
(3, ' <b>Seguridad  Las volquetas cuentan con sistema de autocarpado', '3', '3', '2020-01-01', ' ', 'sinfoto', '2021-02-04 04:04:53.0', '2021-02-04 04:04:53.0', 1, 4),
(4, '<b>Seguridad  El frente de trabajo se encuentra señalizado de manera adecuada y aislado correctamente', '1', '1', '2020-01-01', 'null', 'sinfoto', '2021-02-10 00:24:32.0', '2021-02-10 00:28:28.0', 3, 4),
(5, '<b>Localización y replanteo  Se cuenta con control topográfico de las actividades', '1', '3', '2020-01-01', NULL, 'sinfoto', '2021-02-10 00:24:32.0', '2021-02-10 00:29:51.0', 3, 4),
(6, ' <b>Seguridad  Las volquetas cuentan con sistema de autocarpado', '3', '3', '2020-01-01', ' ', 'sinfoto', '2021-02-10 00:24:32.0', '2021-02-10 00:24:32.0', 3, 4);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `mezclas`
--

CREATE TABLE `mezclas` (
  `id` bigint(20) NOT NULL,
  `sentido_via` varchar(30) NOT NULL,
  `unidad_funcional_id` int(11) NOT NULL,
  `fecha` varchar(45) NOT NULL,
  `tipo_mezcla` varchar(45) NOT NULL,
  `ensayos_de_laboratorio` varchar(45) NOT NULL,
  `is_horas_riego_imrpimacion` varchar(45) NOT NULL,
  `is_horas_liga` varchar(45) NOT NULL,
  `estado_riego` varchar(45) NOT NULL,
  `users_id` bigint(20) NOT NULL,
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `created_at` varchar(26) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `mezclas`
--

INSERT INTO `mezclas` (`id`, `sentido_via`, `unidad_funcional_id`, `fecha`, `tipo_mezcla`, `ensayos_de_laboratorio`, `is_horas_riego_imrpimacion`, `is_horas_liga`, `estado_riego`, `users_id`, `updated_at`, `created_at`) VALUES
(1, '1', 3, '2021-02-08', 'A2', 'lab-34', '1', '1', '1', 1, '2021-02-08 17:36:13', '2021-02-08 12:36:13');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `mezclas_detalle`
--

CREATE TABLE `mezclas_detalle` (
  `id` bigint(20) NOT NULL,
  `recino_no` int(11) DEFAULT NULL,
  `hora_llegada` varchar(45) DEFAULT NULL,
  `tem_llegada` varchar(45) DEFAULT NULL,
  `cantidad_ton` float(100,10) DEFAULT NULL,
  `hora_extendida` varchar(45) DEFAULT NULL,
  `temp_extendida` varchar(45) DEFAULT NULL,
  `abcisas_inicio` varchar(45) DEFAULT NULL,
  `abcisas_fin` varchar(45) DEFAULT NULL,
  `abcisas_espersor` varchar(45) DEFAULT NULL,
  `abscisas_carril` varchar(45) DEFAULT NULL,
  `temp_compactacion` varchar(6) DEFAULT NULL,
  `temp_apertu_trafico` varchar(6) DEFAULT NULL,
  `observaciones` varchar(500) DEFAULT NULL,
  `registro_fotografico` varchar(45) DEFAULT NULL,
  `users_id1` bigint(20) NOT NULL,
  `mezclas_id` bigint(20) NOT NULL,
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `created_at` varchar(25) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `mezclas_detalle`
--

INSERT INTO `mezclas_detalle` (`id`, `recino_no`, `hora_llegada`, `tem_llegada`, `cantidad_ton`, `hora_extendida`, `temp_extendida`, `abcisas_inicio`, `abcisas_fin`, `abcisas_espersor`, `abscisas_carril`, `temp_compactacion`, `temp_apertu_trafico`, `observaciones`, `registro_fotografico`, `users_id1`, `mezclas_id`, `updated_at`, `created_at`) VALUES
(1, NULL, NULL, NULL, 0.9990000129, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, '2021-02-08 16:05:22', ''),
(2, NULL, '455', '666', 6.5000000000, '67', '66', '66', '66', '66', '66', '66', '66', '66', '66', 1, 1, '2021-02-08 21:08:10', '2021-02-08 16:08:10'),
(3, NULL, '11', '22', 22.0000000000, '22', '22', '22', '2', '22', '22', '22', '22', '22', '22', 1, 1, '2021-02-08 21:30:56', '2021-02-08 16:30:56');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(4, '2014_10_12_000000_create_users_table', 1),
(5, '2014_10_12_100000_create_password_resets_table', 1),
(6, '2019_08_19_000000_create_failed_jobs_table', 1),
(7, '2021_02_02_134456_auditoria', 1),
(8, '2021_02_05_135732_create_permission_tables', 2);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `model_has_permissions`
--

CREATE TABLE `model_has_permissions` (
  `permission_id` bigint(20) UNSIGNED NOT NULL,
  `model_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `model_id` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `model_has_roles`
--

CREATE TABLE `model_has_roles` (
  `role_id` bigint(20) UNSIGNED NOT NULL,
  `model_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `model_id` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `model_has_roles`
--

INSERT INTO `model_has_roles` (`role_id`, `model_type`, `model_id`) VALUES
(1, 'App\\User', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `password_resets`
--

CREATE TABLE `password_resets` (
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `permissions`
--

CREATE TABLE `permissions` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `guard_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `permissions`
--

INSERT INTO `permissions` (`id`, `name`, `guard_name`, `created_at`, `updated_at`) VALUES
(1, 'Concreto editar', 'web', '2021-02-05 20:18:30', '2021-02-09 03:31:37'),
(2, 'Concreto Anadir', 'web', '2021-02-05 20:19:17', '2021-02-09 03:29:25'),
(3, 'Concreto show', 'web', '2021-02-05 20:21:17', '2021-02-09 03:29:40'),
(4, 'concreto eliminar', 'web', '2021-02-05 20:21:36', '2021-02-05 20:21:36'),
(5, 'Concreto PDF', 'web', '2021-02-09 03:49:32', '2021-02-09 03:49:32'),
(6, 'Fresado Anadir', 'web', '2021-02-10 00:52:01', '2021-02-10 00:52:01'),
(7, 'Fresado Eliminar', 'web', '2021-02-10 00:53:13', '2021-02-10 00:53:13'),
(8, 'Acero Eliminar', 'web', '2021-02-10 00:54:06', '2021-02-10 00:54:06'),
(9, 'Acero Anadir', 'web', '2021-02-10 00:55:23', '2021-02-10 00:55:23');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `roles`
--

CREATE TABLE `roles` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `guard_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `roles`
--

INSERT INTO `roles` (`id`, `name`, `guard_name`, `created_at`, `updated_at`) VALUES
(1, 'Operado', 'web', '2021-02-05 20:22:23', '2021-02-05 20:22:23'),
(2, 'Tecnico', 'web', '2021-02-05 20:22:23', '2021-02-05 20:22:23'),
(3, 'Gerente', 'web', '2021-02-05 20:22:23', '2021-02-05 20:22:23'),
(4, 'Administrado', 'web', '2021-02-05 20:22:23', '2021-02-05 20:22:23');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `role_has_permissions`
--

CREATE TABLE `role_has_permissions` (
  `permission_id` bigint(20) UNSIGNED NOT NULL,
  `role_id` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `role_has_permissions`
--

INSERT INTO `role_has_permissions` (`permission_id`, `role_id`) VALUES
(2, 1),
(5, 3),
(5, 4),
(6, 1),
(7, 4),
(8, 4),
(9, 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `unidad_funcional`
--

CREATE TABLE `unidad_funcional` (
  `id` int(11) NOT NULL,
  `nombre` varchar(45) NOT NULL,
  `class` varchar(45) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `unidad_funcional`
--

INSERT INTO `unidad_funcional` (`id`, `nombre`, `class`) VALUES
(1, '0', 'white'),
(2, '1', 'red'),
(3, '2', NULL),
(4, '3', NULL),
(5, '4', NULL),
(6, '5', NULL),
(7, '6', NULL),
(8, '7', NULL),
(9, '8', NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `email_verified_at`, `password`, `remember_token`, `created_at`, `updated_at`) VALUES
(1, 'Marcos Alberto Saavedra', 'once.marcos.alberto@gmail.com', NULL, '$2y$10$3HtHH6sNKir9ZSpzB5JGVeBertLqtz5eHjVFP/2xp3OLWoHrUsieu', NULL, '2021-02-02 18:51:41', '2021-02-02 18:51:41');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `acero`
--
ALTER TABLE `acero`
  ADD PRIMARY KEY (`id`),
  ADD KEY `estado_tramite_id` (`estado_tramite_id`),
  ADD KEY `unidad_funcional_id` (`unidad_funcional_id`);

--
-- Indices de la tabla `aceroregistrofotografico`
--
ALTER TABLE `aceroregistrofotografico`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_aceroregistrofotografico_acero_detalle1_idx` (`acero_detalle_id`);

--
-- Indices de la tabla `acero_detalle`
--
ALTER TABLE `acero_detalle`
  ADD PRIMARY KEY (`id`),
  ADD KEY `acero_id` (`acero_id`);

--
-- Indices de la tabla `audits`
--
ALTER TABLE `audits`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `concreto`
--
ALTER TABLE `concreto`
  ADD PRIMARY KEY (`id`),
  ADD KEY `ftestado_tramites` (`estado_tramite_id`),
  ADD KEY `unida_funcional` (`unidad_funcional_id`);

--
-- Indices de la tabla `concreto_detalles`
--
ALTER TABLE `concreto_detalles`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_concreto_detalles_concreto1_idx` (`concreto_id`);

--
-- Indices de la tabla `concreto_registro_fotografico`
--
ALTER TABLE `concreto_registro_fotografico`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `estado_tramite`
--
ALTER TABLE `estado_tramite`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `fresado`
--
ALTER TABLE `fresado`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_fresado_unidad_funcional1_idx` (`unidad_funcional_id`),
  ADD KEY `fk_fresado_estado_tramite1_idx` (`estado_tramite_id`);

--
-- Indices de la tabla `fresadoregistrofotografico`
--
ALTER TABLE `fresadoregistrofotografico`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_resadoregistrofotografico_fresado_detalle1_idx` (`fresado_detalle_id`);

--
-- Indices de la tabla `fresado_detalle`
--
ALTER TABLE `fresado_detalle`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_FresadoDetalle_fresado1_idx` (`fresado_id`);

--
-- Indices de la tabla `mezclas`
--
ALTER TABLE `mezclas`
  ADD PRIMARY KEY (`id`),
  ADD KEY `unidad_funcional_id` (`unidad_funcional_id`);

--
-- Indices de la tabla `mezclas_detalle`
--
ALTER TABLE `mezclas_detalle`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `model_has_permissions`
--
ALTER TABLE `model_has_permissions`
  ADD PRIMARY KEY (`permission_id`,`model_id`,`model_type`),
  ADD KEY `model_has_permissions_model_id_model_type_index` (`model_id`,`model_type`);

--
-- Indices de la tabla `model_has_roles`
--
ALTER TABLE `model_has_roles`
  ADD PRIMARY KEY (`role_id`,`model_id`,`model_type`),
  ADD KEY `model_has_roles_model_id_model_type_index` (`model_id`,`model_type`);

--
-- Indices de la tabla `password_resets`
--
ALTER TABLE `password_resets`
  ADD KEY `password_resets_email_index` (`email`);

--
-- Indices de la tabla `permissions`
--
ALTER TABLE `permissions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `permissions_name_guard_name_unique` (`name`,`guard_name`);

--
-- Indices de la tabla `roles`
--
ALTER TABLE `roles`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `roles_name_guard_name_unique` (`name`,`guard_name`);

--
-- Indices de la tabla `role_has_permissions`
--
ALTER TABLE `role_has_permissions`
  ADD PRIMARY KEY (`permission_id`,`role_id`),
  ADD KEY `role_has_permissions_role_id_foreign` (`role_id`);

--
-- Indices de la tabla `unidad_funcional`
--
ALTER TABLE `unidad_funcional`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `acero`
--
ALTER TABLE `acero`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de la tabla `aceroregistrofotografico`
--
ALTER TABLE `aceroregistrofotografico`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `acero_detalle`
--
ALTER TABLE `acero_detalle`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT de la tabla `audits`
--
ALTER TABLE `audits`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=212;

--
-- AUTO_INCREMENT de la tabla `concreto`
--
ALTER TABLE `concreto`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT de la tabla `concreto_detalles`
--
ALTER TABLE `concreto_detalles`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=88;

--
-- AUTO_INCREMENT de la tabla `concreto_registro_fotografico`
--
ALTER TABLE `concreto_registro_fotografico`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT de la tabla `estado_tramite`
--
ALTER TABLE `estado_tramite`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de la tabla `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `fresado`
--
ALTER TABLE `fresado`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de la tabla `fresadoregistrofotografico`
--
ALTER TABLE `fresadoregistrofotografico`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `fresado_detalle`
--
ALTER TABLE `fresado_detalle`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT de la tabla `mezclas`
--
ALTER TABLE `mezclas`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `mezclas_detalle`
--
ALTER TABLE `mezclas_detalle`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT de la tabla `permissions`
--
ALTER TABLE `permissions`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT de la tabla `roles`
--
ALTER TABLE `roles`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de la tabla `unidad_funcional`
--
ALTER TABLE `unidad_funcional`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT de la tabla `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `acero`
--
ALTER TABLE `acero`
  ADD CONSTRAINT `acero_ibfk_1` FOREIGN KEY (`estado_tramite_id`) REFERENCES `estado_tramite` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `acero_ibfk_2` FOREIGN KEY (`unidad_funcional_id`) REFERENCES `unidad_funcional` (`id`);

--
-- Filtros para la tabla `aceroregistrofotografico`
--
ALTER TABLE `aceroregistrofotografico`
  ADD CONSTRAINT `fk_aceroregistrofotografico_acero_detalle1` FOREIGN KEY (`acero_detalle_id`) REFERENCES `acero_detalle` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `acero_detalle`
--
ALTER TABLE `acero_detalle`
  ADD CONSTRAINT `acero_detalle_ibfk_1` FOREIGN KEY (`acero_id`) REFERENCES `acero` (`id`);

--
-- Filtros para la tabla `concreto`
--
ALTER TABLE `concreto`
  ADD CONSTRAINT `ftestado_tramites` FOREIGN KEY (`estado_tramite_id`) REFERENCES `estado_tramite` (`id`),
  ADD CONSTRAINT `unida_funcional` FOREIGN KEY (`unidad_funcional_id`) REFERENCES `unidad_funcional` (`id`);

--
-- Filtros para la tabla `concreto_detalles`
--
ALTER TABLE `concreto_detalles`
  ADD CONSTRAINT `fk_concreto_detalles_concreto1` FOREIGN KEY (`concreto_id`) REFERENCES `concreto` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `fresado`
--
ALTER TABLE `fresado`
  ADD CONSTRAINT `fk_fresado_estado_tramite1` FOREIGN KEY (`estado_tramite_id`) REFERENCES `estado_tramite` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_fresado_unidad_funcional1` FOREIGN KEY (`unidad_funcional_id`) REFERENCES `unidad_funcional` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `fresadoregistrofotografico`
--
ALTER TABLE `fresadoregistrofotografico`
  ADD CONSTRAINT `fk_resadoregistrofotografico_fresado_detalle1` FOREIGN KEY (`fresado_detalle_id`) REFERENCES `fresado_detalle` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `fresado_detalle`
--
ALTER TABLE `fresado_detalle`
  ADD CONSTRAINT `fk_FresadoDetalle_fresado1` FOREIGN KEY (`fresado_id`) REFERENCES `fresado` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `mezclas`
--
ALTER TABLE `mezclas`
  ADD CONSTRAINT `mezclas_ibfk_1` FOREIGN KEY (`unidad_funcional_id`) REFERENCES `unidad_funcional` (`id`);

--
-- Filtros para la tabla `model_has_permissions`
--
ALTER TABLE `model_has_permissions`
  ADD CONSTRAINT `model_has_permissions_permission_id_foreign` FOREIGN KEY (`permission_id`) REFERENCES `permissions` (`id`) ON DELETE CASCADE;

--
-- Filtros para la tabla `model_has_roles`
--
ALTER TABLE `model_has_roles`
  ADD CONSTRAINT `model_has_roles_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE;

--
-- Filtros para la tabla `role_has_permissions`
--
ALTER TABLE `role_has_permissions`
  ADD CONSTRAINT `role_has_permissions_permission_id_foreign` FOREIGN KEY (`permission_id`) REFERENCES `permissions` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `role_has_permissions_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
