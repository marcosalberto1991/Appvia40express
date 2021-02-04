-- phpMyAdmin SQL Dump
-- version 5.0.3
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 04-02-2021 a las 17:51:13
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
(1, 1, 'qqqq', 'qqqq', 'qqqq', 'qqq', 'qqq', 1, 2);

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
  `observaciones` varchar(500) NOT NULL,
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
(1, '<b>Acero de refuerzo</b> con las formas indicadas en los planos, cumpliendo con despieces y diagramas de diseño', '1', '0', '2020-01-08', 'no tiene nada', 'ing-industrial1-blog.jpgstr_random(5).jpg', 1, 3, '2021-02-03 20:32:52.650247', '2021-02-04 01:32:52'),
(2, '<b>Estado del refuerzo</b> Las varillas y alambres de amarres no presentan alto grado de corrosión', '3', '3', '2020-01-05', ' ', 'sinfoto', 1, 3, '2021-02-04 01:09:01.000000', '2021-02-04 01:09:01'),
(3, ' <b>Recubrimiento y amarre</b>  Ubicación,  alineacion y espaciamiento  de acuerdo a los planos y normas.', '3', '3', '2020-01-05', ' ', 'sinfoto', 1, 3, '2021-02-04 01:09:01.000000', '2021-02-04 01:09:01');

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
(45, 'App\\User', 1, 'updated', 1, 'App\\FresadoDetalleModel', '{\"registro_fotografico\":\"sinfoto\"}', '{\"registro_fotografico\":\"0e471f56-a86b-499b-9ed9-318fd001dcd1.jpgstr_random(5).jpg\"}', 'http://127.0.0.1:8000/Api/FresadoDetalles_update/1', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/88.0.4324.104 Safari/537.36', NULL, '2021-02-04 04:11:03', '2021-02-04 04:11:03');

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
  `estado_tramite_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `concreto`
--

INSERT INTO `concreto` (`id`, `users_id`, `unidad_funcional_id`, `calzada`, `estrutura`, `elemento`, `plano_codigo`, `version`, `resistencia_concreto`, `estado_tramite_id`) VALUES
(1, 1, 2, 'tramitess', 'eeee', 'eee', 'eee', 'eee', '45', 1),
(2, 1, 2, 'dddd', 'dddd', 'dddd', 'dddd', 'dddd', '45', 1),
(4, 1, 1, 'girardot-bogota', 'plana', 'concreto', '11', '22', '45', 1);

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
(4, 1, '<b>Localización y replanteo</b>  Ubicación de elemento cumple con planos de diseño', '1', '1', '2020-12-16', 'no tiene st st', '0e471f56-a86b-499b-9ed9-318fd001dcd1.jpgstr_random(5).jpg', 1),
(5, 1, '<b>Verticalidad</b>  Elemento cumple con planos y diseños', '0', '1', '2020-01-05', 'no tiene', '0e471f56-a86b-499b-9ed9-318fd001dcd1.jpgstr_random(5).jpg', 1),
(6, 1, ' <b>Solado</b> Concreto de limpieza y nivelación', '0', '1', '2020-01-05', ' ', 'null.png', 1),
(7, 1, '<b>Desmoldante</b> Paredes de Formaleta cuentan con desmoldante que permitira en desencofre de la estructura', '1', '1', '2021-02-02', 'todo', 'null.png', 1),
(8, 1, ' <b>Muestras de concreto</b> - Toma de cilindros de concreto', '3', '3', '2020-01-05', ' ', 'null.png', 1),
(9, 1, '<b>Temperatura</b> - Temperatura máxima del concreto no mayor a 32 C.', '3', '3', '2020-01-05', ' ', 'null.png', 1),
(10, 1, '<b>Asentamiento</b> - Asentamiento dentro del rango de diseño.', '1', '1', '2020-01-05', 'nada de', 'null.png', 1),
(11, 1, '<b>Seguridad</b> Ubicación de formaleta segura que permita el trabajo de descarga del concreto sin inconvenientes.', '1', '1', '2020-01-05', 'no deje solo', 'dwnld-broucher-3.pngstr_random(5).png', 1),
(12, 2, '<b>Curado</b>  aplicación de productos para el curado del concreto (indicar en observaciones el método utilizado)', '3', '3', '2020-01-05', ' ', 'null.png', 1),
(13, 2, '<b>Acabados</b>  Elemento cumple con buenos acabados', '3', '3', '2020-01-05', ' ', 'null.png', 1),
(14, 2, '<b>Juntas</b> Elemento con juntas de dilatación o construcción', '3', '3', '2020-01-05', ' ', 'sinfoto', 1),
(15, 2, '<b>Fisuras</b> Presencia de fisuras después de la fundida', '3', '3', '2020-01-05', ' ', 'sinfoto', 1),
(16, 1, '<b>Localización y replanteo</b>  Ubicación de elemento cumple con planos de diseño', '3', '3', '2020-01-05', ' ', 'sinfoto', 4),
(17, 1, '<b>Verticalidad</b>  Elemento cumple con planos y diseños', '3', '3', '2020-01-05', ' ', 'sinfoto', 4),
(18, 1, ' <b>Solado</b> Concreto de limpieza y nivelación', '3', '3', '2020-01-05', ' ', 'sinfoto', 4),
(19, 1, '<b>Desmoldante</b> Paredes de Formaleta cuentan con desmoldante que permitira en desencofre de la estructura', '3', '3', '2020-01-05', ' ', 'sinfoto', 4),
(20, 1, ' <b>Muestras de concreto</b> - Toma de cilindros de concreto', '3', '3', '2020-01-05', ' ', 'sinfoto', 4),
(21, 1, '<b>Temperatura</b> - Temperatura máxima del concreto no mayor a 32 C.', '3', '3', '2020-01-05', ' ', 'sinfoto', 4),
(22, 1, '<b>Asentamiento</b> - Asentamiento dentro del rango de diseño.', '3', '3', '2020-01-05', ' ', 'sinfoto', 4),
(23, 1, '<b>Seguridad</b> Ubicación de formaleta segura que permita el trabajo de descarga del concreto sin inconvenientes.', '3', '3', '2020-01-05', ' ', 'sinfoto', 4),
(24, 2, '<b>Curado</b>  aplicación de productos para el curado del concreto (indicar en observaciones el método utilizado)', '3', '3', '2020-01-05', ' ', 'sinfoto', 4),
(25, 2, '<b>Acabados</b>  Elemento cumple con buenos acabados', '3', '3', '2020-01-05', ' ', 'sinfoto', 4),
(26, 2, '<b>Juntas</b> Elemento con juntas de dilatación o construcción', '3', '3', '2020-01-05', ' ', 'sinfoto', 4),
(27, 2, '<b>Fisuras</b> Presencia de fisuras después de la fundida', '3', '3', '2020-01-05', ' ', 'sinfoto', 4);

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
(2, 'Proceso', NULL);

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

INSERT INTO `fresado` (`id`, `unidad_funcional_id`, `calzada`, `longitud`, `plano_codigo`, `version`, `ancho_uno`, `ancho_dos`, `espesor_uno`, `espesor_dos`, `estado_tramite_id`, `created_at`, `updated_at`) VALUES
(1, 1, 'sss', 'sss', 'sss', 'ss', 'sss', 'ss', 'ss', 'sss', 1, '2021-02-04 03:32:03.0', '2021-02-03 22:32:03');

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
(3, ' <b>Seguridad  Las volquetas cuentan con sistema de autocarpado', '3', '3', '2020-01-01', ' ', 'sinfoto', '2021-02-04 04:04:53.0', '2021-02-04 04:04:53.0', 1, 4);

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
(7, '2021_02_02_134456_auditoria', 1);

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
-- Indices de la tabla `fresado_detalle`
--
ALTER TABLE `fresado_detalle`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_FresadoDetalle_fresado1_idx` (`fresado_id`);

--
-- Indices de la tabla `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `password_resets`
--
ALTER TABLE `password_resets`
  ADD KEY `password_resets_email_index` (`email`);

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
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `acero_detalle`
--
ALTER TABLE `acero_detalle`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `audits`
--
ALTER TABLE `audits`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=46;

--
-- AUTO_INCREMENT de la tabla `concreto`
--
ALTER TABLE `concreto`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de la tabla `concreto_detalles`
--
ALTER TABLE `concreto_detalles`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=28;

--
-- AUTO_INCREMENT de la tabla `estado_tramite`
--
ALTER TABLE `estado_tramite`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `fresado`
--
ALTER TABLE `fresado`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `fresado_detalle`
--
ALTER TABLE `fresado_detalle`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

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
-- Filtros para la tabla `fresado_detalle`
--
ALTER TABLE `fresado_detalle`
  ADD CONSTRAINT `fk_FresadoDetalle_fresado1` FOREIGN KEY (`fresado_id`) REFERENCES `fresado` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
