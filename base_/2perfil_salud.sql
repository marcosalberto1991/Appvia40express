-- phpMyAdmin SQL Dump
-- version 5.0.3
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 11-02-2021 a las 21:03:00
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
-- Estructura de tabla para la tabla `perfil_salud`
--

CREATE TABLE `perfil_salud` (
  `id` int(11) NOT NULL,
  `tipo_documento_id` int(11) NOT NULL,
  `cedula` varchar(45) NOT NULL,
  `nombre` varchar(45) NOT NULL,
  `apellido` varchar(45) NOT NULL,
  `sexo` varchar(45) NOT NULL,
  `area` varchar(45) NOT NULL,
  `cargo` varchar(45) NOT NULL,
  `fecha_nacimiento` varchar(45) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `perfil_salud`
--

INSERT INTO `perfil_salud` (`id`, `tipo_documento_id`, `cedula`, `nombre`, `apellido`, `sexo`, `area`, `cargo`, `fecha_nacimiento`) VALUES
(1, 1, '1069176309', 'Marcos Alberto', 'Saavedra Sanadria', 'Mas', 'Ing Sistemas', 'Programador', '1991-10-04'),
(4, 1, '52516795', 'SANDRA MILENA', 'NEGRETTE PERDOMO', 'M', 'CM', 'Gerente Contractual', '1900-1-13'),
(5, 1, '80871602', 'DIEGO', 'ARROYO BAPTISTE', 'H', 'CFO', 'Gerente Financiero       ', '1984-12-6'),
(6, 1, '53108397', 'LINA MARIA', 'HURTADO GONZALEZ', 'M', 'PR', 'Director Comunicaciones  ', '1985-12-17'),
(7, 1, '79779681', 'RENE HABIB', 'MAYANS CORTES', 'H', 'COO', 'Gerente Operacion y Mantenimiento          ', '1974-11-13'),
(8, 1, '1032456738', 'NIKOLAS MATEO', 'PARRA NEME', 'H', 'CFO', 'Analista Financiero', '1993-5-16'),
(9, 1, '52385940', 'EDNA CAROLINA', 'BARBOSA BECERRA', 'M', 'COO', 'Coordinador Tecnico', '1976-7-18'),
(10, 1, '1098695438', 'CINDY', 'MARTINEZ GUERRA', 'M', 'CTO', 'Ingeniera de proyecto ', '1990-10-19'),
(11, 1, '84082540', 'HERNAN ADOLFO', 'ALARCON ARBELAEZ', 'H', 'COO', 'Director de Operaciones', '1976-12-28'),
(12, 1, '52931840', 'SANDRA CAROLINA', 'RAMIREZ FORERO', 'M', 'CTO', 'Coordinador Ambiental', '1982-9-9'),
(13, 1, '52507808', 'ALEXANDRA', 'ALVAREZ SIERRA', 'M', 'CTO', 'Coordinador Social', '1979-3-25'),
(14, 1, '1026253010', 'ERIKA VIVIANA', 'DUARTE HERRERA', 'M', 'CFO', 'Tesorera', '1986-10-6'),
(15, 1, '80092779', 'FABIAN LEONARDO', 'LACOUTURE CARVAJAL', 'H', 'CTO', 'Director Tecnico', '1981-5-18'),
(16, 1, '1077967529', 'DANIEL ANDRES', 'CASTELLANOS RICO', 'H', 'COO', 'Inspector Mantenimiento', '1987-9-2'),
(17, 1, '1098661309', 'EDINSON FABIAN', 'QUESADA URIBE', 'H', 'CTO', 'Ingeniero de proyecto ', '1988-11-1'),
(18, 1, '9693115', 'JAIRO', 'REYES OBREGON', 'H', 'CFO', 'Analista Servicios', '1982-12-8'),
(19, 1, '1016032709', 'KATHERIN LIZETH', 'ROJAS ESPEJO', 'M', 'CFO', 'Coordinador Calidad', '1991-2-10'),
(20, 1, '1032435059', 'DAVID ENRIQUE', 'MONTENEGRO REYES', 'H', 'CM', 'Abogado', '1990-1-10'),
(21, 1, '25283757', 'LUCY TATIANA', 'CUENCA BONILLA', 'M', 'COO', 'Ingeniero Residente', '1979-4-4'),
(22, 1, '52702625', 'DIANA ALEXANDRA', 'OVIEDO ZULETA', 'M', 'CFO', 'Director Compras', '1979-3-1'),
(23, 1, '17659149', 'JAVIER', 'ESPINOSA AGUDELO', 'H', 'CFO', 'Contador', '1979-4-28'),
(24, 1, '52051724', 'RUBY', 'ROMERO PULIDO', 'M', 'CFO', 'Asistente Administrativo', '1972-3-2'),
(25, 1, '28949479', 'ANGELA CRISTINA', 'VARON VANEGAS', 'M', 'COO', 'Director de Peajes ', '1977-5-25'),
(26, 1, '52465733', 'MABEL YESENIA', 'RINCON BUITRAGO', 'M', 'CFO', 'Coordinadora Gestion Hum', '1979-8-15'),
(27, 1, '311398', 'FRANCOIS REGIS PIERRE MARIE', 'LE MIERE', 'H', 'CEO', 'Gerente General          ', '1973-10-31'),
(28, 1, '98342750', 'MANUEL GEOVANI', 'PASTAS PASTAS', 'H', 'CFO', 'Almacenista', '1973-8-4'),
(29, 1, '1098659032', 'DIANA MARCELA', 'DIAZ RUEDA', 'M', 'CM', 'Abogado', '1988-9-7'),
(30, 1, '1018426702', 'NIDYA PATRICIA', 'PEDRAZA SILVA', 'M', 'CTO', 'Inspector Ambiental      ', '1989-7-16'),
(31, 1, '1073689569', 'MARTHA LILIANA', 'VARGAS VASQUEZ', 'M', 'COO', 'Inspector HSE            ', '1991-4-20'),
(32, 1, '1073130334', 'MARIA JAZMIN', 'BELLO SOSA', 'M', 'COO', 'Jefe Peaje               ', '1987-11-11'),
(33, 1, '1024481819', 'MARYEN VIVIANA', 'MATEUS GASPAR', 'M', 'COO', 'Supervisora             ', '1988-2-22'),
(34, 1, '1106890215', 'JESUS DREDY', 'RAMIREZ ALVAREZ', 'H', 'COO', 'Operador Consola       ', '1988-2-17'),
(35, 1, '1110508813', 'YINETH ESMERALDA', 'GARZON PATIÐO', 'M', 'COO', 'Operadora Consola       ', '1991-3-22'),
(36, 1, '1073675513', 'VIVIANA PAOLA', 'PEDRAZA RODRIGUEZ', 'M', 'COO', 'Recaudadora Peaje', '1988-2-4'),
(37, 1, '39585072', 'ANGELA MARCELA', 'ORTIZ MORENO', 'M', 'COO', 'Residente Operaci¾n', '1985-10-21'),
(38, 1, '79952003', 'ERNESTO CARLOS', 'MURILLO DORIA', 'H', 'CM', 'Directora Juridico Predial', '1979-6-25'),
(39, 1, '35250563', 'RUTH MARY', 'UMBARILA MORALES', 'M', 'COO', 'Recaudadora Peaje', '1980-5-22'),
(40, 1, '39629871', 'DIANA PAOLA', 'VILLAMIL SIERRA', 'M', 'COO', 'Jefe Peaje               ', '1978-8-24'),
(41, 1, '35254040', 'ERICA YOHANA', 'CAMACHO', 'M', 'COO', 'Recaudadora Peaje', '1983-1-28'),
(42, 1, '39625696', 'YENNY LILIANA', 'SAAVEDRA ANGULO', 'M', 'COO', 'Recaudadora Peaje', '1974-11-2'),
(43, 1, '20484762', 'ANA SUSANA', 'SALCEDO CLAVIJO', 'M', 'COO', 'Servicios Generales', '1971-7-1'),
(44, 1, '1069747920', 'JESSICA LORENA', 'PEDRAZA GUTIERREZ', 'M', 'COO', 'Recaudadora Peaje', '1994-7-11'),
(45, 1, '2965929', 'ANCIZAR ', 'ROZO ORTIZ', 'H', 'COO', 'Operadora Bascula       ', '1980-1-25'),
(46, 1, '39621673', 'OLGA LUCIA', 'VILLARRAGA SUAREZ', 'M', 'COO', 'Servicios Generales', '1971-7-13'),
(47, 1, '1069728578', 'MARISOL ', 'GUTIERREZ MORA', 'M', 'COO', 'Operadora Bascula       ', '1989-7-17'),
(48, 1, '52353212', 'DEISY ASTRID', 'PARDO ACUÐA', 'M', 'COO', 'Operadora Bascula       ', '1979-5-7'),
(49, 1, '1014180099', 'DIANA CAROLINA', 'URICOECHEA CRUZ', 'M', 'COO', 'Jefe Peaje               ', '1986-9-24'),
(50, 1, '51879327', 'MARLENY ', 'CANIZALES GONZALEZ', 'M', 'COO', 'Jefe Peaje               ', '1965-4-15'),
(51, 1, '20942215', 'LAURA MARIA', 'RINCON VERGARA', 'M', 'COO', 'Supervisora             ', '1981-5-9'),
(52, 1, '20638390', 'MARIA YENNIFER', 'ROJAS CACERES', 'M', 'COO', 'Recaudadora Peaje', '1984-12-7'),
(53, 1, '1030565637', 'JOHANNA ANDREA', 'SANCHEZ SILVA', 'M', 'COO', 'Supervisora             ', '1989-9-10'),
(54, 1, '55181153', 'WILMA YANET', 'PAZ NARVAEZ', 'M', 'COO', 'Jefe Peaje               ', '1975-2-5'),
(55, 1, '1069714553', 'CRISTIAN CAMILO', 'VARGAS GORDILLO', 'H', 'COO', 'Operadora Consola       ', '1986-5-4'),
(56, 1, '94288391', 'MANUEL DE JESUS', 'JARAMILLO SANCHEZ', 'H', 'COO', 'TÚcnico ITS Tunel', '1983-6-19'),
(57, 1, '14137982', 'DIEGO FERNANDO', 'SUAREZ HUELGOS', 'H', 'COO', 'Jefe TÚcnico ITS T·nel', '1984-4-8'),
(58, 1, '1053822539', 'JAZMIN ALEJANDRA', 'CASTAÐEDA JARAMILLO', 'M', 'COO', 'Coordinador Peajes', '1992-11-10'),
(59, 1, '79241555', 'MANUEL ', 'ALDANA GOMEZ ', 'H', 'COO', 'Operadora Galibo', '1964-12-4'),
(60, 1, '23351934', 'YOLANDA ', 'HERNANDEZ BURGOS ', 'M', 'COO', 'Recaudadora Peaje', '1984-7-1'),
(61, 1, '1012362511', 'LEIDY JOHANA', 'FIRIGUA SERRATO', 'M', 'COO', 'Recaudadora Peaje', '1989-1-26'),
(62, 1, '80392870', 'HECTOR IVAN', 'MORA CRUZ', 'H', 'COO', 'Operadora Galibo', '1984-8-15'),
(63, 1, '52854217', 'ADRIANA LUCERO ', 'PARRA ALVARADO', 'M', 'COO', 'Recaudadora Peaje', '1981-1-7'),
(64, 1, '65719540', 'SANDRA PATRICIA', 'ROMERO COLORADO', 'M', 'COO', 'Supervisora             ', '1979-11-22'),
(65, 1, '1032378393', 'LEIDY CATHERY', 'VELEZ BENAVIDEZ', 'M', 'COO', 'Supervisora             ', '1986-9-27'),
(66, 1, '1069731833', 'DIANA YULIETH', 'GARCIA ROBAYO', 'M', 'COO', 'Recaudadora Peaje', '1990-3-26'),
(67, 1, '28968254', 'LUZ TERESA', 'GUAYARA MARTINEZ', 'M', 'COO', 'Supervisora             ', '1977-8-28'),
(68, 1, '1069752198', 'LEIDY LORENA', 'LIEVANO QUITIAN', 'M', 'COO', 'Supervisora             ', '1995-7-10'),
(69, 1, '79739345', 'CARLOS JAIR', 'CAÐON CARDONA', 'H', 'COO', 'Sencillero', '1976-1-5'),
(70, 1, '79239925', 'CARLOS ALBERTO', 'GUAMAN ROJAS', 'H', 'COO', 'Auxiliar Mantenimiento VÝa   ', '1965-1-10'),
(71, 1, '1002495178', 'JOHANA PAOLA', 'MENCO ROJAS', 'M', 'COO', 'Supervisora             ', '1990-12-24'),
(72, 1, '20942232', 'GINA MARIA', 'MORALES RAMIREZ', 'M', 'COO', 'Supervisora             ', '1981-12-5'),
(73, 1, '20886833', 'EYDE YADIRA ', 'CARDENAS OCAMPO', 'M', 'COO', 'Recaudadora Peaje', '1969-8-25'),
(74, 1, '79833480', 'NELSON ANDRES ', 'BASTO SERNA', 'H', 'CFO', 'Mensajero', '1977-11-22'),
(75, 1, '1022365215', 'VICTOR HUGO ', 'ROJAS BONILLA', 'H', 'CTO', 'Ingeniero de Dise±os', '1990-10-30'),
(76, 1, '39629329', 'YOHANA ALEJANDRA ', 'CAICEDO DIAZ', 'M', 'COO', 'TÚcnico Consola', '1978-10-3'),
(77, 1, '39577663', 'NORIAN MILENA ', 'PASTRANA TAVERA', 'M', 'COO', 'Supervisora             ', '1980-5-7'),
(78, 1, '91493521', 'JULIO CESAR ', 'TORRES VALLE', 'H', 'COO', 'Director Mantenimiento', '1976-12-23'),
(79, 1, '1068975328', 'NUBIA PAOLA', 'HERRERA DAZA', 'M', 'CFO', 'Analista Impuestos', '1993-7-29'),
(80, 1, '43757233', 'LESLIE ESPERANZA', 'BARRAGAN ARISMENDY', 'M', 'COO', 'Coordinador HSQE', '1978-3-26'),
(81, 1, '1030592329', 'LIZETH MIREYA', 'GOMEZ BERMUDEZ', 'M', 'COO', 'Recaudadora Peaje', '1991-3-17'),
(82, 1, '818197', 'FABIEN PIERRE- OLIVIER', 'POULIOT', 'H', 'CTO', 'Gerente TÚcnico', '1980-4-23'),
(83, 1, '1116787698', 'JUAN DIEGO', 'JIMENEZ RAMIREZ', 'H', 'COO', 'Coordinador Seguridad Vial', '1990-7-4'),
(84, 1, '53907550', 'DEISSY JOHANNA', 'DIAZ RICAUTE', 'M', 'CTO', 'Residente Social', '1985-11-22'),
(85, 1, '80213698', 'DAVID GIOVANY', 'AGUDELO ALVAREZ', 'H', 'COO', 'Director Sistemas Inteligentes', '1984-6-23'),
(86, 1, '1018465338', 'LINDA CATERIN', 'PEDRAO FRESNEDA', 'M', 'COO', 'Recaudadora Peaje', '1994-3-9'),
(87, 1, '52904632', 'DIANA MARCELA', 'CASTRO GONZALEZ', 'M', 'COO', 'Recaudadora Peaje', '1982-5-27'),
(88, 1, '1070619205', 'ESTEPHANI ', 'CHARRY NUÐEZ', 'M', 'COO', 'Auxiliar Ingenieria', '1996-6-28'),
(89, 1, '52454943', 'GEMA ESPERANZA ', 'RODRIGUEZ CORTES', 'M', 'COO', 'Supervisora             ', '1975-8-20'),
(90, 1, '79499804', 'JORGE HERNAN ', 'RAMIREZ MARTINEZ', 'H', 'COO', 'Conductor Vehiculo Liviano', '1969-8-11'),
(91, 1, '52874505', 'NURY YIYOLA ', 'MATEUS QUITIAN', 'M', 'CFO', 'Analista Compras', '1982-6-11'),
(92, 1, '1070943337', 'FREDY ALONSO ', 'PIRA VARON', 'H', 'COO', 'TÚcnico ITS Tunel', '1986-6-14'),
(93, 1, '2996745', 'YOVANI ANDRES ', 'ROMERO BAQUERO', 'H', 'COO', 'Coordinador Peajes', '1973-5-24'),
(94, 1, '20928234', 'ANGELA BERNARDA ', 'RAMIREZ TORRES', 'M', 'COO', 'Recaudadora Peaje', '1982-8-2'),
(95, 1, '1072963114', 'LUIS EDUARDO ', 'RODRIGUEZ PATIÐO', 'H', 'CFO', 'Auxiliar Compras y Servicios', '1997-3-11'),
(96, 1, '39629117', 'YOLANDA ', 'GARCIA CASTELLANOS', 'M', 'COO', 'Recaudadora Peaje', '1978-3-14'),
(97, 1, '14138981', 'WILLIAM FABIAN ', 'NARVAEZ TRUJILLO', 'H', 'COO', 'Coordinador ITS ', '1984-6-2'),
(98, 1, '1069750825', 'XIOMARA ESTEFANIA ', 'CRUZ CARDENAS', 'M', 'COO', 'Recaudadora Peaje', '1995-3-1'),
(99, 1, '1106891765', 'LUIS ALEJANDRO ', 'PAEZ', 'H', 'COO', 'Inspector Mantenimiento', '1989-12-11'),
(100, 1, '1234639465', 'HEIDY ANDREA ', 'OLIVEROS VALBUENA', 'M', 'COO', 'TÚcnico Consola', '1997-8-26'),
(101, 1, '1022387370', 'JULIAN LEONARDO ', 'PRODERO MILLAN', 'H', 'COO', 'Aux. Administrativo Operaci¾n y Mantenimiento', '1993-10-15'),
(102, 1, '1095911316', 'MANUEL ALFREDO ', 'RINCON CALDERON', 'H', 'COO', 'Ingeniero Residente', '1987-5-27'),
(103, 1, '80272943', 'DAVID', 'CARO MONTOYA', 'H', 'COO', 'Inspector Mantenimiento', '1967-8-10'),
(104, 1, '1031137341', 'HASBLEIDY YURIDIA', 'TORRES VARGAS', 'M', 'COO', 'Recaudadora Peaje', '1992-2-27'),
(105, 1, '1069720051', 'VICTOR HUGO  ', 'LATORRE GOMEZ', 'H', 'COO', 'Operador Equipo Mediano', '1987-8-5'),
(106, 1, '80251686', 'JOSE ARMANDO ', 'RODRIGUEZ BARRAGAN', 'H', 'COO', 'Sencillero', '1984-10-11'),
(107, 1, '1073131471', 'MARY AZUCENA ', 'PALACIOS PALACIOS', 'M', 'COO', 'Recaudadora Peaje', '1995-6-14'),
(108, 1, '1000939283', 'OSCAR ANDRES ', 'HERNANDEZ PRADA', 'H', 'CFO', 'Auxiliar TecnologÝas de La Informaci¾n', '1993-10-10'),
(109, 1, '1012398309', 'JENNY LORENA ', 'CHUQUEN DAZA', 'M', 'CFO', 'Auxiliar Gesti¾n Humana', '1993-4-5'),
(110, 1, '6465158', 'JOSE AZAEL ', 'NOREÐA SANTAMARIA', 'H', 'COO', 'Operadora Galibo', '1966-4-27'),
(111, 1, '52515066', 'LILIANA CECILIA', 'CORTES CASAS', 'M', 'CFO', 'Auxiliar Gesti¾n Humana', '1979-10-25'),
(112, 1, '52854617', 'BIBIAN ZAMIRA', 'CAMPOS LARA', 'M', 'COO', 'Recaudadora Peaje', '1981-1-25'),
(113, 1, '1018441950', 'LEYDYS STEFANY', 'PACHON HEREDIA', 'M', 'COO', 'Recaudadora Peaje', '1991-2-16'),
(114, 1, '22801864', 'RUDY MILENA', 'RIOS TORRADO', 'M', 'COO', 'Recaudadora Peaje', '1980-1-22'),
(115, 1, '52852977', 'SANDRA REGINA', 'MORENO BUITRAGO', 'M', 'COO', 'Recaudadora Peaje', '1980-7-28'),
(116, 1, '39056441', 'SENEIDA CECILIA', 'BERDUGO CARRILLO', 'M', 'COO', 'Recaudadora Peaje', '1978-6-21'),
(117, 1, '52797201', 'CAMILA ANDREA', 'GOMEZ CORTES', 'M', 'COO', 'Recaudadora Peaje', '1979-2-17'),
(118, 1, '1030666053', 'EDWIN SEGUNDO', 'DUEÐAS BENAVIDES', 'H', 'COO', 'Auxiliar Mantenimiento VÝa   ', '1996-5-10'),
(119, 1, '1069750350', 'KAREN XIMENA', 'BAQUERO BAQUERO', 'M', 'COO', 'Recaudadora Peaje', '1995-2-3'),
(120, 1, '1069715102', 'KRASSY ESTHER', 'RODRIGUEZ CASTELLANOS', 'M', 'COO', 'Auxiliar SST', '1986-6-22'),
(121, 1, '38288876', 'SANDRA PATRICIA', 'SOTO OLAYA', 'M', 'COO', 'Recaudadora Peaje', '1976-12-10'),
(122, 1, '1069746202', 'JUAN CAMILO', 'ALDANA QUIQUE', 'H', 'COO', 'Jefe TÚcnico Peaje', '1994-2-5'),
(123, 1, '3080197', 'RAUL ', 'LOPEZ ROJAS ', 'H', 'COO', 'Auxiliar Mantenimiento VÝa   ', '1969-9-8'),
(124, 1, '1069738027', 'DIANA PAOLA', 'RODRIGUEZ MOMPOTES', 'M', 'COO', 'Jefe Peaje               ', '1991-12-21'),
(125, 1, '3066814', 'EDGAR ALONSO', 'RODRIGUEZ AGUDELO', 'H', 'COO', 'Orientador   Bascula             ', '1983-11-8'),
(126, 1, '1022337482', 'JIMMY ALEJANDRO', 'MONCADA RUBIO', 'H', 'COO', 'TÚcnico ITS Tunel', '1987-9-19'),
(127, 1, '1071549457', 'JEISON ARIEL', 'PEÐUELA CASALLAS', 'H', 'COO', 'Auxiliar Mantenimiento VÝa   ', '1991-3-22'),
(128, 1, '80404024', 'SAIR ALBERTO', 'MONTOYA LLANOS', 'H', 'COO', 'TÚcnico Consola', '1983-3-6'),
(129, 1, '1192746302', 'JULIETH PAOLA', 'GUTIERREZ PARRA', 'M', 'COO', 'Jefe Peaje               ', '1989-8-10'),
(130, 1, '1069743784', 'YULIETH KATERINE', 'MOYA GARAY', 'M', 'COO', 'Supervisora             ', '1993-5-16'),
(131, 1, '1069716008', 'SIRLEY ', 'TAPIERO CORTES ', 'M', 'COO', 'Recaudadora Peaje', '1986-6-29'),
(132, 1, '1110517754', 'UVER ANDREY', 'MARINEZ GONZALEZ', 'H', 'COO', 'Residente de Emergencias', '1991-12-3'),
(133, 1, '1069716008', 'ERLIS DORIS', 'LAMBRAÐO MATEUS', 'M', 'COO', 'Recaudadora Peaje', '1976-5-7'),
(134, 1, '1069738452', 'HEIVER STIC', 'BELTRAN PINEDA', 'H', 'COO', 'TÚcnico Almacenista ITS', '1992-2-1'),
(135, 1, '52150979', 'ELENA SOFIA', 'CEDIEL QUITIAN', 'M', 'COO', 'Recaudadora Peaje FDS     ', '1974-10-25'),
(136, 1, '52877738', 'LIGIA ESPERANZA', 'APONTE MERCHAN', 'M', 'COO', 'Recaudadora Peaje', '1983-2-4'),
(137, 1, '1069757915', 'NATALIA YINET', 'GUTIERREZ VELA', 'M', 'COO', 'Recaudadora Peaje FDS     ', '1997-1-23'),
(138, 1, '52009971', 'NOHORA DEYSA', 'BUITRAGO VIVAS', 'M', 'COO', 'Recaudadora Peaje FDS     ', '1971-12-8'),
(139, 1, '1015423296', 'DIANA MARCELA', 'GALINDO SOLANO', 'M', 'COO', 'TÚcnico Consola', '1991-5-23'),
(140, 1, '1069750361', 'JEIMY KATERINE', 'BECERRA TRIANA', 'M', 'COO', 'Recaudadora Peaje FDS     ', '1995-2-1'),
(141, 1, '35252546', 'MIYEREDT ', 'BARRIOS', 'M', 'COO', 'Recaudadora Peaje', '1981-11-17'),
(142, 1, '1069728898', 'YURI TATIANA', 'PARRA SANABRIA', 'M', 'COO', 'Recaudadora Peaje', '1989-8-8'),
(143, 1, '1071986315', 'LEYDY VIVIANA', 'MARTINEZ MORALES', 'M', 'PR', 'Coordinador de Comunicaciones', '1987-12-29'),
(144, 1, '1069729522', 'BODIS ', 'VILLARREAL ONATRA ', 'H', 'COO', 'Inspector Vial', '1989-8-24'),
(145, 1, '1069736452', 'FREDDY ANTONIO', 'CRUZ GRACIA', 'H', 'COO', 'TÚcnico Mecanico Automotriz', '1991-8-1'),
(146, 1, '1030574097', 'JEAN KEVIN', 'RAMIREZ SEPULVEDA', 'H', 'COO', 'Inspector Vial', '1990-5-1'),
(147, 1, '11257754', 'JOHANY GERMAN', 'ACUÐA RIVERA', 'H', 'COO', 'Inspector Vial', '1982-11-14'),
(148, 1, '1070607629', 'JUAN CAMILO', 'CARVAJAL SOSA', 'H', 'COO', 'Inspector Vial', '1992-9-8'),
(149, 1, '82394476', 'LUIS ALEXANDER', 'SANCHEZ ROMERO', 'H', 'COO', 'Inspector Vial', '1979-9-22'),
(150, 1, '1069741990', 'CARLOS HERNEY ', 'NOVOA MUÐOZ', 'H', 'COO', 'Soldador', '1992-12-27'),
(151, 1, '1024463789', 'CLAUDIA MILENA ', 'VARON BARRIOS', 'M', 'COO', 'Recaudadora Peaje', '1992-12-27'),
(152, 1, '53892540', 'DIANA MARIA ', 'HERNANDEZ CASTAÐEDA', 'M', 'COO', 'Recaudadora Peaje', '1986-5-18'),
(153, 1, '39624060', 'MARY LUCY ', 'CONTRERAS RAMIREZ', 'M', 'COO', 'Recaudadora Peaje', '2000-5-24'),
(154, 1, '40306056', 'MARIA ELISA ', 'CONTRERAS VARGAS', 'M', 'COO', 'Recaudadora Peaje', '1997-3-29'),
(155, 1, '39628618', 'CARMEN ROSA ', 'CASTILLO CARO', 'M', 'COO', 'Recaudadora Peaje FDS     ', '1995-9-6'),
(156, 1, '1069752768', 'DIANA CATALINA ', 'SIMBAQUEVA MUÐOZ', 'M', 'COO', 'Recaudadora Peaje FDS     ', '1978-5-17'),
(157, 1, '52933308', 'ISABEL ANDREA ', 'MUTIZ VARGAS', 'M', 'COO', 'Recaudadora Peaje', '1995-9-28'),
(158, 1, '1069751213', 'JULIANA LUCERO ', 'GARCIA CALDERON', 'M', 'COO', 'Recaudadora Peaje FDS     ', '1983-4-28'),
(159, 1, '28628033', 'LUZ CELIDA ', 'SERENA GARZON', 'M', 'COO', 'Recaudadora Peaje FDS     ', '1978-7-30'),
(160, 1, '1110594209', 'MAIRA ALEJANDRA ', 'JIMENEZ CELI', 'M', 'COO', 'Recaudadora Peaje', '1980-7-29'),
(161, 1, '1069747909', 'YENNY ALEJANDRA ', 'QUEVEDO MICAN', 'M', 'COO', 'Recaudadora Peaje FDS     ', '1998-11-1'),
(162, 1, '65696816', 'YOLANDA ', 'ANDRADE BRIÐEZ', 'M', 'COO', 'Recaudadora Peaje FDS     ', '1994-7-2'),
(163, 1, '1126241639', 'LOLY ESTEFANI', 'PATIÐO ESPINEL', 'M', 'COO', 'Recaudadora Peaje', '1999-9-17'),
(164, 1, '1126429437', 'VANESSA DEL CARMEN ', 'ZAMBRANO ROJAS', 'M', 'COO', 'Recaudadora Peaje', '1973-11-28'),
(165, 1, '1069746423', 'DIANA PAOLA ', 'CORTES HERRERA', 'M', 'COO', 'TÚcnico Consola', '1970-2-19'),
(166, 1, '1040752935', 'ALEX GONZAGA ', 'PULGARIN CAICEDO', 'H', 'COO', 'Inspector Vial', '1996-5-17'),
(167, 1, '1070332010', 'SANDRA ', 'TINJACA ALARCON', 'M', 'COO', 'Recaudadora Peaje', '1997-9-26'),
(168, 1, '1069747665', 'SARA STHEFANNY ', 'HERNANDEZ ORTIZ', 'M', 'COO', 'Recaudadora Peaje', '1994-6-15'),
(169, 1, '1022330942', 'JENNY KATHERINE ', 'RUIZ CABRERA', 'M', 'COO', 'Recaudadora Peaje FDS     ', '1987-4-25'),
(170, 1, '1026590885', 'VALENTINA ', 'GONZALEZ RAMIREZ', 'M', 'CTO', 'Auxiliar Social', '1997-6-1'),
(171, 1, '35252118', 'SANDRA DEL PILAR ', 'MELO  HERRERA', 'M', 'COO', 'Recaudadora Peaje FDS     ', '1981-4-18'),
(172, 1, '81740483', 'RODOLFO DARIO ', 'GARCIA OBANDO', 'H', 'COO', 'Orientador   Bascula             ', '1984-9-19'),
(173, 1, '1069727936', 'JHON HAIVER ', 'MARTINEZ GODIÐO', 'H', 'COO', 'Auxiliar Mantenimiento VÝa   ', '1989-4-24'),
(174, 1, '39619590', 'LUZ STELLA ', 'COBOS INFANTE', 'M', 'COO', 'Servicios Generales', '1969-6-26'),
(175, 1, '14249053', 'GERMAN ', 'PEREZ LLANOS', 'H', 'COO', 'Operadora Galibo', '1963-11-22'),
(176, 1, '1069738696', 'LORENA ', 'RODRIGUEZ PARADA', 'M', 'COO', 'Auxiliar Administrativo', '1992-2-26'),
(177, 1, '3172099', 'DIEGO ALEJANDRO ', 'MOYA MENDIETA', 'H', 'COO', 'Servicios Generales', '1985-4-27'),
(178, 1, '79053439', 'JAVIER EDUARDO ', 'VARGAS VASQUEZ', 'H', 'CFO', 'Administrador de Proyecto', '1969-2-8'),
(179, 1, '1069714452', 'DEYSSI LILIANA ', 'TAUTIVA', 'M', 'COO', 'Recaudadora Peaje FDS     ', '1986-4-23'),
(180, 1, '1069722050', 'ERIKA YINETH ', 'PIRAFAN MACIAS', 'M', 'COO', 'Recaudadora Peaje', '1988-2-10'),
(181, 1, '1069738001', 'OSCAR IVAN ', 'GALEANO GUZMAN', 'H', 'COO', 'Operadora Bascula       ', '1991-12-18'),
(182, 1, '1069718367', 'YEISON ENRIQUE ', 'RODRIGUEZ RODRIGUEZ', 'H', 'COO', 'Jefe TÚcnico Peaje', '1987-3-26'),
(183, 1, '30946696', 'DIVI CONSTANZA ', 'LOPEZ PERALTA', 'M', 'COO', 'Recaudadora Peaje FDS     ', '1985-7-16'),
(184, 1, '2234936', 'ALEXANDER ', 'AYALA ROMERO', 'H', 'COO', 'Jefe TÚcnico Peaje', '1981-5-11'),
(185, 1, '79671898', 'JOHN ', 'ROJAS SILVA', 'H', 'COO', 'Inspector Mantenimiento', '1974-7-15'),
(186, 1, '35254824', 'CATALINA ', 'ORJUELA GARZON', 'M', 'CFO', 'Analista Contable', '1983-9-4'),
(187, 1, '1013619163', 'DEISY ', 'ROMERO SUNS', 'M', 'COO', 'Recaudadora Peaje', '1991-1-27'),
(188, 1, '1016085577', 'YOBANNA ISABEL ', 'GONZALEZ OVIEDO', 'M', 'COO', 'Recaudadora Peaje', '1996-3-17'),
(189, 1, '1030609998', 'CINDY MICHELLE ', 'ANGEL SANCHEZ', 'M', 'COO', 'Recaudadora Peaje', '1992-4-11'),
(190, 1, '6766315', 'JOSE ALONSO ', 'PINILLA BERMUDEZ', 'H', 'COO', 'Auxiliar Mantenimiento VÝa   ', '1961-1-19'),
(191, 1, '1069717462', 'YINA PAOLA ', 'DIAZ PAEZ', 'M', 'COO', 'Recaudadora Peaje FDS     ', '1986-11-21'),
(192, 1, '1073130847', 'YURI LORENA ', 'DELGADO NIAMPIRA', 'M', 'COO', 'Recaudadora Peaje', '1990-8-26'),
(193, 1, '21016173', 'LUZ DARY ', 'LOZANO VALENZUELA', 'M', 'COO', 'Servicios Generales', '1969-2-3'),
(194, 1, '1069769387', 'ANGIE CAROLINA ', 'IBAÐEZ OLAVE', 'M', 'COO', 'Recaudadora Peaje', '1999-12-26'),
(195, 1, '52973745', 'YENY FERNANDA ', 'MENESES PEDRAZA', 'M', 'CFO', 'Secretaria de Gerencia', '1983-4-22'),
(196, 1, '20928300', 'JAIDY VIVIANA ', 'PACHON QUEVEDO', 'M', 'COO', 'Recaudadora Peaje FDS     ', '1982-7-27'),
(197, 1, '1069761674', 'MARIA DEL MAR ', 'RIVERA ARENAS', 'M', 'COO', 'Recaudadora Peaje', '1997-12-31'),
(198, 1, '1022336584', 'DIANA MARCELA ', 'ORTIZ SICHACA', 'M', 'COO', 'Recaudadora Peaje', '1987-7-2'),
(199, 1, '1105784184', 'EFRATA BATHESDA DE SHARON ', 'CEDANO DUQUE', 'M', 'COO', 'Recaudadora Peaje', '1988-9-16'),
(200, 1, '39679016', 'GLORIA JIMENA ', 'GALEANO BORDA', 'M', 'COO', 'Recaudadora Peaje FDS     ', '1981-9-4'),
(201, 1, '1094269940', 'INDRYD DAYANNA ', 'FONTECHA PARRA', 'M', 'COO', 'Operador Call Center', '1992-7-2'),
(202, 1, '1069741186', 'JAVIER ALBEIRO ', 'ARIAS VILLA', 'H', 'COO', 'Auxiliar Mantenimiento VÝa   ', '1992-10-16'),
(203, 1, '1012441194', 'KAREN JULIETH ', 'GIRALDO USUGA', 'M', 'COO', 'Recaudadora Peaje', '1997-2-27'),
(204, 1, '1069726711', 'LIZZET JOHANA ', 'RAMIREZ CRISTANCHO', 'M', 'COO', 'Operador Call Center', '1989-2-12'),
(205, 1, '1032496521', 'ANGIE VANESSA ', 'VILLAMIL RATIVA', 'M', 'COO', 'Recaudadora Peaje', '1998-2-25'),
(206, 1, '1063948331', 'YARLES VANESSA ', 'DE AVILA NAVARRO', 'M', 'COO', 'Recaudadora Peaje', '1986-2-1'),
(207, 1, '1007933556', 'ABHAY FARID ', 'ALFONSO GUTIERREZ', 'H', 'COO', 'Orientador   Bascula             ', '2000-12-7'),
(208, 1, '1069729425', 'YOHANA PATRICIA ', 'AREVALO CARRILLO', 'M', 'COO', 'Recaudadora Peaje', '1989-9-16'),
(209, 1, '1069757755', 'LAURA DANIELA ', 'GOMEZ BELTRAN', 'M', 'COO', 'Recaudadora Peaje FDS     ', '1996-12-22'),
(210, 1, '1110459276', 'JUAN DAVID ', 'LOZANO RODRIGUEZ', 'M', 'COO', 'Supervisor TÚcnico de Peaje ', '1987-3-18'),
(211, 1, '1084868032', 'CRISTIAN CAMILO ', 'MEDINA LLANOS', 'M', 'COO', 'Jefe TÚcnico Peaje', '1992-7-8'),
(212, 1, '80180591', 'YIMI RONA ', 'LESMES LEMUS', 'H', 'COO', 'TÚcnico ITS Tunel', '1981-4-3'),
(213, 1, '1053773844', 'JAIRO ANDRES ', 'INFANTE SANTA', 'H', 'COO', 'Inspector Vial', '1987-2-5'),
(214, 1, '1069721922', 'WILLIAM CAMILO ', 'PARRA BELTRAN', 'H', 'COO', 'TÚcnico ITS Tunel', '1988-1-22'),
(215, 1, '1069743577', 'JUAN GUILLERMO ', 'SALGUERO CORTES', 'H', 'COO', 'Auxiliar Mantenimiento VÝa   ', '1993-6-7'),
(216, 1, '52108375', 'MONICA ', 'MILLAN ROMERO', 'M', 'CM', 'Auxiliar Administrativa Gesti¾n Documental', '1974-4-30'),
(217, 1, '1069761265', 'MINELLY ', 'GUTIERREZ CHAVES', 'M', 'COO', 'Operador Call Center', '1997-11-5'),
(218, 1, '1072493826', 'CARLOS EMIRO ', 'FARIAS BERNAL', 'M', 'COO', 'Auxiliar Mantenimiento VÝa   ', '1989-4-24');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `perfil_salud`
--
ALTER TABLE `perfil_salud`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_perfil_salud_tipo_documento1_idx` (`tipo_documento_id`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `perfil_salud`
--
ALTER TABLE `perfil_salud`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=219;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `perfil_salud`
--
ALTER TABLE `perfil_salud`
  ADD CONSTRAINT `fk_perfil_salud_tipo_documento1` FOREIGN KEY (`tipo_documento_id`) REFERENCES `tipo_documento` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
