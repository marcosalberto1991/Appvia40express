-- phpMyAdmin SQL Dump
-- version 5.0.3
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 10-02-2021 a las 18:05:19
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
-- Estructura de tabla para la tabla `coodenadas`
--

CREATE TABLE `coodenadas` (
  `id` int(11) NOT NULL,
  `eje` varchar(45) DEFAULT NULL,
  `pk` varchar(45) DEFAULT NULL,
  `latitud` double DEFAULT NULL,
  `longitud` double DEFAULT NULL,
  `columna` double NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `coodenadas`
--

INSERT INTO `coodenadas` (`id`, `eje`, `pk`, `latitud`, `longitud`, `columna`) VALUES
(1, ' VAR. MELGAR - GIRARDOT BOGOTA  ', '  0 ', 4.20565381207623, -74.6496465690104, -74.6496465690104),
(2, ' VAR. MELGAR - GIRARDOT BOGOTA  ', '  1 ', 4.21189009126445, -74.6434071533925, 0),
(3, ' VAR. MELGAR - GIRARDOT BOGOTA  ', '  2 ', 4.21869569894191, -74.6376550121065, 0),
(4, ' VAR. MELGAR - GIRARDOT BOGOTA  ', '  3 ', 4.22525815563476, -74.6316369314083, 0),
(5, ' VIA GIRARDOT - BOGOTA  ', '  0 ', 4.28802211267816, -74.809827850875, 0),
(6, ' VIA GIRARDOT - BOGOTA  ', '  1 ', 4.29438403261628, -74.8040973021977, 0),
(7, ' VIA GIRARDOT - BOGOTA  ', '  2 ', 4.30016202259264, -74.7979793352648, 0),
(8, ' VIA GIRARDOT - BOGOTA  ', '  3 ', 4.29784977261769, -74.7907325939637, 0),
(9, ' VIA GIRARDOT - BOGOTA  ', '  4 ', 4.29313698463636, -74.7821204720154, 0),
(10, ' VIA GIRARDOT - BOGOTA  ', '  5 ', 4.28684046030181, -74.7753359891335, 0),
(11, ' VIA GIRARDOT - BOGOTA  ', '  6 ', 4.28170733438842, -74.7673405423663, 0),
(12, ' VIA GIRARDOT - BOGOTA  ', '  7 ', 4.27694727611808, -74.7607083255105, 0),
(13, ' VIA GIRARDOT - BOGOTA  ', '  8 ', 4.27061885318233, -74.7542175032916, 0),
(14, ' VIA GIRARDOT - BOGOTA  ', '  9 ', 4.26329039765178, -74.7494901397595, 0),
(15, ' VIA GIRARDOT - BOGOTA  ', '  10 ', 4.2550938945643, -74.7456875469239, 0),
(16, ' VIA GIRARDOT - BOGOTA  ', '  11 ', 4.24643722356031, -74.7441086299505, 0),
(17, ' VIA GIRARDOT - BOGOTA  ', '  12 ', 4.2470188968297, -74.7371978245613, 0),
(18, ' VIA GIRARDOT - BOGOTA  ', '  13 ', 4.2496105820317, -74.7282751326619, 0),
(19, ' VIA GIRARDOT - BOGOTA  ', '  14 ', 4.24436330044955, -74.7226039794292, 0),
(20, ' VIA GIRARDOT - BOGOTA  ', '  15 ', 4.23566951035841, -74.7195454738446, 0),
(21, ' VIA GIRARDOT - BOGOTA  ', '  16 ', 4.23545102613079, -74.7114936917503, 0),
(22, ' VIA GIRARDOT - BOGOTA  ', '  17 ', 4.23029858136408, -74.7043599354128, 0),
(23, ' VIA GIRARDOT - BOGOTA  ', '  18 ', 4.22471181218025, -74.6974460153857, 0),
(24, ' VIA GIRARDOT - BOGOTA  ', '  19 ', 4.2186389682679, -74.6908789682546, 0),
(25, ' VIA GIRARDOT - BOGOTA  ', '  20 ', 4.21377642317918, -74.6838664177731, 0),
(26, ' VIA GIRARDOT - BOGOTA  ', '  21 ', 4.21239429971855, -74.6761029576328, 0),
(27, ' VIA GIRARDOT - BOGOTA  ', '  22 ', 4.21593159463041, -74.6677374459837, 0),
(28, ' VIA GIRARDOT - BOGOTA  ', '  23 ', 4.21620385121388, -74.6576083568367, 0),
(29, ' VIA GIRARDOT - BOGOTA  ', '  24 ', 4.208931, -74.65323, 0),
(30, ' VIA GIRARDOT - BOGOTA  ', '  25 ', 4.20565386087572, -74.6496530600701, 0),
(31, ' VIA GIRARDOT - BOGOTA  ', '  26 ', 4.20602304024181, -74.6427448331472, 0),
(32, ' VIA GIRARDOT - BOGOTA  ', '  27 ', 4.20988702309392, -74.6353557744371, 0),
(33, ' VIA GIRARDOT - BOGOTA  ', '  28 ', 4.21498556423432, -74.6292211409194, 0),
(34, ' VIA GIRARDOT - BOGOTA  ', '  29 ', 4.22301633695011, -74.625535133906, 0),
(35, ' VIA GIRARDOT - BOGOTA  ', '  30 ', 4.23255429734955, -74.6202817257293, 0),
(36, ' VIA GIRARDOT - BOGOTA  ', '  31 ', 4.2410247365043, -74.6186611852507, 0),
(37, ' VIA GIRARDOT - BOGOTA  ', '  32 ', 4.24747425125113, -74.6186332608729, 0),
(38, ' VIA GIRARDOT - BOGOTA  ', '  33 ', 4.25115083318709, -74.6131359446889, 0),
(39, ' VIA GIRARDOT - BOGOTA  ', '  34 ', 4.25597916354093, -74.6042300136117, 0),
(40, ' VIA GIRARDOT - BOGOTA  ', '  35 ', 4.25694393564667, -74.5977723013721, 0),
(41, ' VIA GIRARDOT - BOGOTA  ', '  36 ', 4.25955974626792, -74.593048013486, 0),
(42, ' VIA GIRARDOT - BOGOTA  ', '  37 ', 4.26650758382491, -74.5884079280895, 0),
(43, ' VIA GIRARDOT - BOGOTA  ', '  38 ', 4.26434784731084, -74.5794547724324, 0),
(44, ' VIA GIRARDOT - BOGOTA  ', '  39 ', 4.26487296858815, -74.5715846304838, 0),
(45, ' VIA GIRARDOT - BOGOTA  ', '  40 ', 4.26401375672013, -74.5638131006666, 0),
(46, ' VIA GIRARDOT - BOGOTA  ', '  41 ', 4.2631509435012, -74.5551853569384, 0),
(47, ' VIA GIRARDOT - BOGOTA  ', '  42 ', 4.2590064495898, -74.5493061895575, 0),
(48, ' VIA GIRARDOT - BOGOTA  ', '  43 ', 4.25995208341435, -74.544307333645, 0),
(49, ' VIA GIRARDOT - BOGOTA  ', '  44 ', 4.25514840124831, -74.5377112717627, 0),
(50, ' VIA GIRARDOT - BOGOTA  ', '  45 ', 4.25493996157989, -74.5308676039735, 0),
(51, ' VIA GIRARDOT - BOGOTA  ', '  46 ', 4.25538486271648, -74.5257894356817, 0),
(52, ' VIA GIRARDOT - BOGOTA  ', '  47 ', 4.25910886091843, -74.5331451558166, 0),
(53, ' VIA GIRARDOT - BOGOTA  ', '  48 ', 4.26087774502789, -74.5337071944441, 0),
(54, ' VIA GIRARDOT - BOGOTA  ', '  49 ', 4.26187604533795, -74.5265692971879, 0),
(55, ' VIA GIRARDOT - BOGOTA  ', '  50 ', 4.26370616091654, -74.5171745009799, 0),
(56, ' VIA GIRARDOT - BOGOTA  ', '  51 ', 4.26598443631658, -74.5084645026481, 0),
(57, ' VIA GIRARDOT - BOGOTA  ', '  52 ', 4.26960534178845, -74.4994078588166, 0),
(58, ' VIA GIRARDOT - BOGOTA  ', '  53 ', 4.27222920614518, -74.4914597508047, 0),
(59, ' VIA GIRARDOT - BOGOTA  ', '  54 ', 4.27668077137581, -74.4843756028742, 0),
(60, ' VIA GIRARDOT - BOGOTA  ', '  55 ', 4.28160324598126, -74.4769389478971, 0),
(61, ' VIA GIRARDOT - BOGOTA  ', '  56 ', 4.28706254972847, -74.4693682633256, 0),
(62, ' VIA GIRARDOT - BOGOTA  ', '  57 ', 4.29216355109001, -74.4619649123456, 0),
(63, ' VIA GIRARDOT - BOGOTA  ', '  58 ', 4.29776423349715, -74.4546514359102, 0),
(64, ' VIA GIRARDOT - BOGOTA  ', '  59 ', 4.30392480542238, -74.4475500677094, 0),
(65, ' VIA GIRARDOT - BOGOTA  ', '  60 ', 4.30973346935685, -74.4405939641717, 0),
(66, ' VIA GIRARDOT - BOGOTA  ', '  61 ', 4.31558962675235, -74.4335281452494, 0),
(67, ' VIA GIRARDOT - BOGOTA  ', '  62 ', 4.32014380757893, -74.4260959862481, 0),
(68, ' VIA GIRARDOT - BOGOTA  ', '  63 ', 4.32382759858386, -74.4190298530095, 0),
(69, ' VIA GIRARDOT - BOGOTA  ', '  64 ', 4.32425641370971, -74.4096550379319, 0),
(70, ' VIA GIRARDOT - BOGOTA  ', '  65 ', 4.32668074527269, -74.4046117116485, 0),
(71, ' VIA GIRARDOT - BOGOTA  ', '  66 ', 4.32669582790423, -74.3955947282569, 0),
(72, ' VIA GIRARDOT - BOGOTA  ', '  67 ', 4.32881035790993, -74.3864026407256, 0),
(73, ' VIA GIRARDOT - BOGOTA  ', '  68 ', 4.33101653161408, -74.378239692139, 0),
(74, ' VIA GIRARDOT - BOGOTA  ', '  69 ', 4.3402469062669, -74.3760624162482, 0),
(75, ' VIA GIRARDOT - BOGOTA  ', '  70 ', 4.34857328796236, -74.3788513415404, 0),
(76, ' VIA GIRARDOT - BOGOTA  ', '  71 ', 4.35458688809662, -74.3759112857445, 0),
(77, ' VIA GIRARDOT - BOGOTA  ', '  72 ', 4.36156350394277, -74.3800699300753, 0),
(78, ' VIA GIRARDOT - BOGOTA  ', '  73 ', 4.36874008212026, -74.3838811563297, 0),
(79, ' VIA GIRARDOT - BOGOTA  ', '  74 ', 4.37577620080569, -74.3886410088391, 0),
(80, ' VIA GIRARDOT - BOGOTA  ', '  75 ', 4.38248675150653, -74.3850655465517, 0),
(81, ' VIA GIRARDOT - BOGOTA  ', '  76 ', 4.38540479084515, -74.3909880622627, 0),
(82, ' VIA GIRARDOT - BOGOTA  ', '  77 ', 4.39463471042614, -74.3906317610072, 0),
(83, ' VIA GIRARDOT - BOGOTA  ', '  78 ', 4.40124960332693, -74.3854488468739, 0),
(84, ' VIA GIRARDOT - BOGOTA  ', '  79 ', 4.40666917193584, -74.3843199485316, 0),
(85, ' VIA GIRARDOT - BOGOTA  ', '  80 ', 4.40697654012097, -74.3918182483046, 0),
(86, ' VIA GIRARDOT - BOGOTA  ', '  81 ', 4.4133614969264, -74.3945731646527, 0),
(87, ' VIA GIRARDOT - BOGOTA  ', '  82 ', 4.41943206824842, -74.388754229313, 0),
(88, ' VIA GIRARDOT - BOGOTA  ', '  83 ', 4.42670959297561, -74.3915708024255, 0),
(89, ' VIA GIRARDOT - BOGOTA  ', '  84 ', 4.43161233159865, -74.386374686882, 0),
(90, ' VIA GIRARDOT - BOGOTA  ', '  85 ', 4.43938294023276, -74.3825874197919, 0),
(91, ' VIA GIRARDOT - BOGOTA  ', '  86 ', 4.44669864111445, -74.3792462289667, 0),
(92, ' VIA GIRARDOT - BOGOTA  ', '  87 ', 4.45532617129184, -74.3801439949805, 0),
(93, ' VIA GIRARDOT - BOGOTA  ', '  88 ', 4.46251549479809, -74.3857461626743, 0),
(94, ' VIA GIRARDOT - BOGOTA  ', '  89 ', 4.46853137692891, -74.3837955855958, 0),
(95, ' VIA GIRARDOT - BOGOTA  ', '  90 ', 4.47557944356165, -74.3787991177449, 0),
(96, ' VIA GIRARDOT - BOGOTA  ', '  91 ', 4.48284077695168, -74.3738915661164, 0),
(97, ' VIA GIRARDOT - BOGOTA  ', '  92 ', 4.49169343339485, -74.3728008798855, 0),
(98, ' VIA GIRARDOT - BOGOTA  ', '  93 ', 4.49771368150462, -74.36758020813, 0),
(99, ' VIA GIRARDOT - BOGOTA  ', '  94 ', 4.50611213806085, -74.3659123917744, 0),
(100, ' VIA GIRARDOT - BOGOTA  ', '  95 ', 4.51293820147218, -74.360205097516, 0),
(101, ' VIA GIRARDOT - BOGOTA  ', '  96 ', 4.52113803867752, -74.3577301811163, 0),
(102, ' VIA GIRARDOT - BOGOTA  ', '  97 ', 4.52454232557418, -74.3521241737143, 0),
(103, ' VIA GIRARDOT - BOGOTA  ', '  98 ', 4.52834856701908, -74.3444389022733, 0),
(104, ' VIA GIRARDOT - BOGOTA  ', '  99 ', 4.53002900354081, -74.3349985567833, 0),
(105, ' VIA GIRARDOT - BOGOTA  ', '  100 ', 4.53051745719387, -74.3262815615982, 0),
(106, ' VIA GIRARDOT - BOGOTA  ', '  101 ', 4.52901709699465, -74.3178853274199, 0),
(107, ' VIA GIRARDOT - BOGOTA  ', '  102 ', 4.53291041938158, -74.3108339094695, 0),
(108, ' VIA GIRARDOT - BOGOTA  ', '  103 ', 4.54031166204551, -74.3071996960758, 0),
(109, ' VIA GIRARDOT - BOGOTA  ', '  104 ', 4.54661769248698, -74.3010284988184, 0),
(110, ' VIA GIRARDOT - BOGOTA  ', '  105 ', 4.54784008046507, -74.2931893781346, 0),
(111, ' VIA GIRARDOT - BOGOTA  ', '  106 ', 4.54489188820025, -74.2884460885834, 0),
(112, ' VIA GIRARDOT - BOGOTA  ', '  107 ', 4.53894030508708, -74.2818178434674, 0),
(113, ' VIA GIRARDOT - BOGOTA  ', '  108 ', 4.53086392592752, -74.2793866106816, 0),
(114, ' VIA GIRARDOT - BOGOTA  ', '  109 ', 4.53577727269344, -74.2727520834121, 0),
(115, ' VIA GIRARDOT - BOGOTA  ', '  110 ', 4.54261985996147, -74.2683540962118, 0),
(116, ' VIA GIRARDOT - BOGOTA  ', '  111 ', 4.5404355780161, -74.2613753655051, 0),
(117, ' VIA GIRARDOT - BOGOTA  ', '  112 ', 4.54122807523141, -74.2559542176689, 0),
(118, ' VIA GIRARDOT - BOGOTA  ', '  113 ', 4.5420163703587, -74.2467154893783, 0),
(119, ' VIA GIRARDOT - BOGOTA  ', '  114 ', 4.54900268228382, -74.2409280775907, 0),
(120, ' VIA GIRARDOT - BOGOTA  ', '  115 ', 4.55564666354482, -74.2353900854744, 0),
(121, ' VIA GIRARDOT - BOGOTA  ', '  116 ', 4.56302542533795, -74.2291844280352, 0),
(122, ' VIA GIRARDOT - BOGOTA  ', '  117 ', 4.57146394424695, -74.2260754131133, 0),
(123, ' VIA GIRARDOT - BOGOTA  ', '  118 ', 4.57761333788707, -74.2207873848877, 0),
(124, ' VIA GIRARDOT - BOGOTA  ', '  119 ', 4.58199223424116, -74.2128766719349, 0),
(125, ' VIA GIRARDOT - BOGOTA  ', '  120 ', 4.58609036598748, -74.2048071736164, 0),
(126, ' VIA GIRARDOT - BOGOTA  ', '  121 ', 4.59016238114155, -74.1967759078275, 0),
(127, ' VAR. FUSA - GIRARDOT BGTA  ', '  0 ', 4.32122915272585, -74.422485992309, 0),
(128, ' VAR. FUSA - GIRARDOT BGTA  ', '  1 ', 4.32751097346852, -74.4186161331127, 0),
(129, ' VAR. FUSA - GIRARDOT BGTA  ', '  2 ', 4.33533462157907, -74.4177344335504, 0),
(130, ' VAR. FUSA - GIRARDOT BGTA  ', '  3 ', 4.34015467299563, -74.4106802651845, 0),
(131, ' VAR. FUSA - GIRARDOT BGTA  ', '  4 ', 4.34400668525699, -74.4025311292041, 0),
(132, ' VAR. FUSA - GIRARDOT BGTA  ', '  5 ', 4.34753420086577, -74.3942489319196, 0),
(133, ' VAR. FUSA - GIRARDOT BGTA  ', '  6 ', 4.34894471680308, -74.3858714204717, 0),
(134, ' VAR. GIRARDOT - GIRARDOT BGTA  ', '  0 ', 4.25513579700277, -74.8243399585176, 0),
(135, ' VAR. GIRARDOT - GIRARDOT BGTA  ', '  1 ', 4.25574463116912, -74.8151219210838, 0),
(136, ' VAR. GIRARDOT - GIRARDOT BGTA  ', '  2 ', 4.25636793919611, -74.805918755885, 0),
(137, ' VAR. GIRARDOT - GIRARDOT BGTA  ', '  3 ', 4.25695860320613, -74.7967628875451, 0),
(138, ' VAR. GIRARDOT - GIRARDOT BGTA  ', '  4 ', 4.25725843443532, -74.7876176994331, 0),
(139, ' VAR. GIRARDOT - GIRARDOT BGTA  ', '  5 ', 4.25426219034477, -74.7789519964065, 0),
(140, ' VAR. GIRARDOT - GIRARDOT BGTA  ', '  6 ', 4.25021694827806, -74.7706730115135, 0),
(141, ' VAR. GIRARDOT - GIRARDOT BGTA  ', '  7 ', 4.24868610280284, -74.7620046022455, 0),
(142, ' VAR. GIRARDOT - GIRARDOT BGTA  ', '  8 ', 4.25074965930102, -74.7531375136153, 0),
(143, ' VAR. GIRARDOT - GIRARDOT BGTA  ', '  9 ', 4.24705467619544, -74.7455596092636, 0),
(144, ' VIA GIRARDOT - BOGOTA  ', '  122 ', 4.5981395980135, -74.1087206178833, 0);

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `coodenadas`
--
ALTER TABLE `coodenadas`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `coodenadas`
--
ALTER TABLE `coodenadas`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=145;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
