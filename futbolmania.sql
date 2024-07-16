-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 16-07-2024 a las 21:46:46
-- Versión del servidor: 10.4.32-MariaDB
-- Versión de PHP: 8.0.30

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `futbolmania`
--
CREATE DATABASE IF NOT EXISTS `futbolmania` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `futbolmania`;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `auth_group`
--

DROP TABLE IF EXISTS `auth_group`;
CREATE TABLE `auth_group` (
  `id` int(11) NOT NULL,
  `name` varchar(150) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `auth_group_permissions`
--

DROP TABLE IF EXISTS `auth_group_permissions`;
CREATE TABLE `auth_group_permissions` (
  `id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `auth_permission`
--

DROP TABLE IF EXISTS `auth_permission`;
CREATE TABLE `auth_permission` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `content_type_id` int(11) NOT NULL,
  `codename` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `auth_permission`
--

INSERT INTO `auth_permission` (`id`, `name`, `content_type_id`, `codename`) VALUES
(1, 'Can add log entry', 1, 'add_logentry'),
(2, 'Can change log entry', 1, 'change_logentry'),
(3, 'Can delete log entry', 1, 'delete_logentry'),
(4, 'Can view log entry', 1, 'view_logentry'),
(5, 'Can add permission', 2, 'add_permission'),
(6, 'Can change permission', 2, 'change_permission'),
(7, 'Can delete permission', 2, 'delete_permission'),
(8, 'Can view permission', 2, 'view_permission'),
(9, 'Can add group', 3, 'add_group'),
(10, 'Can change group', 3, 'change_group'),
(11, 'Can delete group', 3, 'delete_group'),
(12, 'Can view group', 3, 'view_group'),
(13, 'Can add user', 4, 'add_user'),
(14, 'Can change user', 4, 'change_user'),
(15, 'Can delete user', 4, 'delete_user'),
(16, 'Can view user', 4, 'view_user'),
(17, 'Can add content type', 5, 'add_contenttype'),
(18, 'Can change content type', 5, 'change_contenttype'),
(19, 'Can delete content type', 5, 'delete_contenttype'),
(20, 'Can view content type', 5, 'view_contenttype'),
(21, 'Can add session', 6, 'add_session'),
(22, 'Can change session', 6, 'change_session'),
(23, 'Can delete session', 6, 'delete_session'),
(24, 'Can view session', 6, 'view_session'),
(25, 'Can add cliente', 7, 'add_cliente'),
(26, 'Can change cliente', 7, 'change_cliente'),
(27, 'Can delete cliente', 7, 'delete_cliente'),
(28, 'Can view cliente', 7, 'view_cliente'),
(29, 'Can add empresa', 8, 'add_empresa'),
(30, 'Can change empresa', 8, 'change_empresa'),
(31, 'Can delete empresa', 8, 'delete_empresa'),
(32, 'Can view empresa', 8, 'view_empresa'),
(33, 'Can add envio', 9, 'add_envio'),
(34, 'Can change envio', 9, 'change_envio'),
(35, 'Can delete envio', 9, 'delete_envio'),
(36, 'Can view envio', 9, 'view_envio'),
(37, 'Can add factura', 10, 'add_factura'),
(38, 'Can change factura', 10, 'change_factura'),
(39, 'Can delete factura', 10, 'delete_factura'),
(40, 'Can view factura', 10, 'view_factura'),
(41, 'Can add producto', 11, 'add_producto'),
(42, 'Can change producto', 11, 'change_producto'),
(43, 'Can delete producto', 11, 'delete_producto'),
(44, 'Can view producto', 11, 'view_producto'),
(45, 'Can add vendedor', 12, 'add_vendedor'),
(46, 'Can change vendedor', 12, 'change_vendedor'),
(47, 'Can delete vendedor', 12, 'delete_vendedor'),
(48, 'Can view vendedor', 12, 'view_vendedor'),
(49, 'Can add estado envio', 13, 'add_estadoenvio'),
(50, 'Can change estado envio', 13, 'change_estadoenvio'),
(51, 'Can delete estado envio', 13, 'delete_estadoenvio'),
(52, 'Can view estado envio', 13, 'view_estadoenvio'),
(53, 'Can add estado modificacion', 14, 'add_estadomodificacion'),
(54, 'Can change estado modificacion', 14, 'change_estadomodificacion'),
(55, 'Can delete estado modificacion', 14, 'delete_estadomodificacion'),
(56, 'Can view estado modificacion', 14, 'view_estadomodificacion'),
(57, 'Can add estado orden', 15, 'add_estadoorden'),
(58, 'Can change estado orden', 15, 'change_estadoorden'),
(59, 'Can delete estado orden', 15, 'delete_estadoorden'),
(60, 'Can view estado orden', 15, 'view_estadoorden'),
(61, 'Can add entrega', 16, 'add_entrega'),
(62, 'Can change entrega', 16, 'change_entrega'),
(63, 'Can delete entrega', 16, 'delete_entrega'),
(64, 'Can view entrega', 16, 'view_entrega'),
(65, 'Can add rechazo', 17, 'add_rechazo'),
(66, 'Can change rechazo', 17, 'change_rechazo'),
(67, 'Can delete rechazo', 17, 'delete_rechazo'),
(68, 'Can view rechazo', 17, 'view_rechazo'),
(69, 'Can add historial estado', 18, 'add_historialestado'),
(70, 'Can change historial estado', 18, 'change_historialestado'),
(71, 'Can delete historial estado', 18, 'delete_historialestado'),
(72, 'Can view historial estado', 18, 'view_historialestado');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `auth_user`
--

DROP TABLE IF EXISTS `auth_user`;
CREATE TABLE `auth_user` (
  `id` int(11) NOT NULL,
  `password` varchar(128) NOT NULL,
  `last_login` datetime(6) DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(150) NOT NULL,
  `first_name` varchar(150) NOT NULL,
  `last_name` varchar(150) NOT NULL,
  `email` varchar(254) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `auth_user`
--

INSERT INTO `auth_user` (`id`, `password`, `last_login`, `is_superuser`, `username`, `first_name`, `last_name`, `email`, `is_staff`, `is_active`, `date_joined`) VALUES
(1, 'pbkdf2_sha256$216000$thboMtj2k4pg$BpeorO5TA4UmOUKnseZEJoS59ZEEI1HYZv8cowaTJ9o=', '2024-07-16 02:55:19.560851', 1, 'admin', '', '', 'ig.riffo@duocuc.cl', 1, 1, '2024-06-05 02:37:04.959240'),
(2, 'pbkdf2_sha256$216000$miLzeQaeDRC7$NoLyHFIkVCvCTbyfzZYzOEM5wZg/Lo+c3S3B72PjID4=', '2024-06-06 02:35:30.409482', 0, 'ignacio', '', '', 'ignacio@gmail.com', 0, 1, '2024-06-06 02:35:29.917781');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `auth_user_groups`
--

DROP TABLE IF EXISTS `auth_user_groups`;
CREATE TABLE `auth_user_groups` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `auth_user_user_permissions`
--

DROP TABLE IF EXISTS `auth_user_user_permissions`;
CREATE TABLE `auth_user_user_permissions` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `core_cliente`
--

DROP TABLE IF EXISTS `core_cliente`;
CREATE TABLE `core_cliente` (
  `id` int(11) NOT NULL,
  `nombrecliente` varchar(100) NOT NULL,
  `nombreEmpresa` varchar(100) NOT NULL,
  `direccion` varchar(200) NOT NULL,
  `telefono` varchar(15) NOT NULL,
  `correo` varchar(254) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `core_cliente`
--

INSERT INTO `core_cliente` (`id`, `nombrecliente`, `nombreEmpresa`, `direccion`, `telefono`, `correo`) VALUES
(13, 'Ignacio Riffo', 'Duoc FC', 'Av concha y toro 2142', '927492043', 'cliente@gmail.com'),
(14, 'Francisco Vera', 'Duoc FC', 'Av concha y toro 2142', '927492043', 'cliente@gmail.com'),
(15, 'Ignacio Riffo', 'LVFC', 'Av concha y toro 2142', '927492043', 'cliente@gmail.com'),
(16, 'Fabian Bravo', 'Roblox', 'Av concha y toro 2142', '927492043', 'cliente@gmail.com'),
(17, 'Francisco Vera', 'Duoc FC', 'Av concha y toro 2142', '927492043', 'cliente@gmail.com'),
(18, 'Francisco Vera', 'Duoc FC', 'Av concha y toro 2142', '927492043', 'cliente@gmail.com'),
(19, 'Francisco Vera', 'Colo Colo FC', 'Av concha y toro 2142', '927492043', 'cliente@gmail.com'),
(20, 'Fabian Bravo', '100% Futbol', 'Av concha y toro 2142', '927492043', 'cliente@gmail.com'),
(21, 'Francisco Vera', '100% Futbol', 'Av concha y toro 2142', '927492043', 'cliente@gmail.com'),
(22, 'Francisco Vera', '100% Futbol', 'Av concha y toro 2142', '927492043', 'cliente@gmail.com'),
(23, 'David Espinosa', 'DuocUC', 'Av concha y toro 2142', '927492043', 'duoc@gmail.com');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `core_empresa`
--

DROP TABLE IF EXISTS `core_empresa`;
CREATE TABLE `core_empresa` (
  `id` int(11) NOT NULL,
  `nombreEmpresa` varchar(100) NOT NULL,
  `direccion` varchar(200) NOT NULL,
  `telefono` varchar(15) NOT NULL,
  `correo` varchar(254) NOT NULL,
  `web` varchar(30) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `core_empresa`
--

INSERT INTO `core_empresa` (`id`, `nombreEmpresa`, `direccion`, `telefono`, `correo`, `web`) VALUES
(14, 'GithubUC', 'Av las nieves 02196', '928384921', 'empresa@gmail.com', 'www.empresa.cl'),
(15, 'Github Uc', 'Av las nieves 02196', '928384921', 'empresa@gmail.com', 'www.empresa.cl'),
(16, 'FutbolManía', 'Av las nieves 02196', '928384921', 'empresa@gmail.com', 'www.empresa.cl'),
(17, 'FutbolManía', 'Av las nieves 02196', '972834932', 'futbolmania@gmail.com', 'www.futbolmania.com'),
(18, 'FutbolManía', 'Av las nieves 02196', '972834932', 'futbolmania@gmail.com', 'www.futbolmania.com'),
(19, 'FutbolManía', 'Av las nieves 02196', '972834932', 'futbolmania@gmail.com', 'www.futbolmania.com'),
(20, 'FutbolManía', 'Av las nieves 02196', '972834932', 'futbolmania@gmail.com', 'www.futbolmania.com'),
(21, 'FutbolManía', 'Av las nieves 02196', '972834932', 'futbolmania@gmail.com', 'www.futbolmania.com'),
(22, 'FutbolManía', 'Av las nieves 02196', '972834932', 'futbolmania@gmail.com', 'www.futbolmania.com'),
(23, 'FutbolManía', 'Av las nieves 02196', '972834932', 'futbolmania@gmail.com', 'www.futbolmania.com'),
(24, 'FutbolManía', 'Av las nieves 02196', '972834932', 'futbolmania@gmail.com', 'www.futbolmania.com'),
(25, 'FutbolManía', 'Av las nieves 02196', '972834932', 'futbolmania@gmail.com', 'www.futbolmania.com'),
(26, 'FutbolManía', 'Av las nieves 02196', '972834932', 'futbolmania@gmail.com', 'www.futbolmania.com');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `core_entrega`
--

DROP TABLE IF EXISTS `core_entrega`;
CREATE TABLE `core_entrega` (
  `id` int(11) NOT NULL,
  `direccion` varchar(200) DEFAULT NULL,
  `rut` varchar(15) DEFAULT NULL,
  `imagen` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `core_entrega`
--

INSERT INTO `core_entrega` (`id`, `direccion`, `rut`, `imagen`) VALUES
(7, 'Av las nieves 02196', '20452245-9', 'bodega.jpg'),
(8, 'Av concha y toro 2142', '20435234-2', '955e7690f1ee02b264dd2bdf6faace06.jpeg'),
(9, 'jshaksa', 'klkwjkwqe|jlwdk', '');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `core_envio`
--

DROP TABLE IF EXISTS `core_envio`;
CREATE TABLE `core_envio` (
  `id` int(11) NOT NULL,
  `metodoenvio` varchar(100) DEFAULT NULL,
  `direccionenvio` varchar(200) NOT NULL,
  `condicionesenvio` varchar(500) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `core_envio`
--

INSERT INTO `core_envio` (`id`, `metodoenvio`, `direccionenvio`, `condicionesenvio`) VALUES
(13, 'Starken', 'Av concha y toro 2142', 'Entrega entre 8am y 10pm'),
(14, 'Starken', 'Av concha y toro 2142', 'No entregar antes de las 11am'),
(15, 'Starken', 'Av concha y toro 2142', 'No entregar antes de las 11am'),
(16, 'Chilexpress', 'Av concha y toro 2142', 'entrega entre 8am y 10pm'),
(17, NULL, 'Av concha y toro 2142', NULL),
(18, 'deliveyr', 'Av concha y toro 2142', NULL),
(19, 'Starken', 'Av mexico 2390', 'No entregar antes de las 11am'),
(20, 'Starken', 'Av concha y toro 2142', 'No entregar antes de las 11am'),
(21, 'Starken', 'Av concha y toro 2142', 'No entregar antes de las 11am'),
(22, 'Starken', 'Av concha y toro 2142', 'No entregar antes de las 11am'),
(23, NULL, 'Av concha y toro 2142', NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `core_estadoenvio`
--

DROP TABLE IF EXISTS `core_estadoenvio`;
CREATE TABLE `core_estadoenvio` (
  `id` int(11) NOT NULL,
  `nombre` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `core_estadoenvio`
--

INSERT INTO `core_estadoenvio` (`id`, `nombre`) VALUES
(1, 'Por entregar'),
(2, 'Entregada'),
(3, 'Rechazada');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `core_estadomodificacion`
--

DROP TABLE IF EXISTS `core_estadomodificacion`;
CREATE TABLE `core_estadomodificacion` (
  `id` int(11) NOT NULL,
  `nombre` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `core_estadomodificacion`
--

INSERT INTO `core_estadomodificacion` (`id`, `nombre`) VALUES
(1, 'Creada'),
(2, 'Rectificada'),
(3, 'Anulada');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `core_estadoorden`
--

DROP TABLE IF EXISTS `core_estadoorden`;
CREATE TABLE `core_estadoorden` (
  `id` int(11) NOT NULL,
  `nombre` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `core_estadoorden`
--

INSERT INTO `core_estadoorden` (`id`, `nombre`) VALUES
(1, 'Orden de compra'),
(2, 'Facturada');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `core_factura`
--

DROP TABLE IF EXISTS `core_factura`;
CREATE TABLE `core_factura` (
  `id` int(11) NOT NULL,
  `subtotal` int(11) DEFAULT NULL,
  `descuento` int(11) DEFAULT NULL,
  `descuentoMonto` int(11) DEFAULT NULL,
  `iva` int(11) DEFAULT NULL,
  `ivaMonto` int(11) DEFAULT NULL,
  `costoenvio` int(11) DEFAULT NULL,
  `total` int(11) DEFAULT NULL,
  `cliente_id` int(11) DEFAULT NULL,
  `empresa_id` int(11) DEFAULT NULL,
  `envio_id` int(11) DEFAULT NULL,
  `vendedor_id` int(11) DEFAULT NULL,
  `estadoEnvio_id` int(11) DEFAULT NULL,
  `estadoModificacion_id` int(11) DEFAULT NULL,
  `estadoOrden_id` int(11) DEFAULT NULL,
  `entrega_id` int(11) DEFAULT NULL,
  `anulada` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `core_factura`
--

INSERT INTO `core_factura` (`id`, `subtotal`, `descuento`, `descuentoMonto`, `iva`, `ivaMonto`, `costoenvio`, `total`, `cliente_id`, `empresa_id`, `envio_id`, `vendedor_id`, `estadoEnvio_id`, `estadoModificacion_id`, `estadoOrden_id`, `entrega_id`, `anulada`) VALUES
(14, 25800, 10, 2580, 19, 4411, 3000, 30631, 18, 21, 18, 17, 2, 2, 2, 9, 0),
(16, 199940, 5, 9997, 19, 36089, 6000, 232032, 20, 23, 20, 19, 3, 1, 2, NULL, 0),
(17, 384000, 12, 46080, 19, 64204, 20000, 422124, 22, 25, 22, 21, 2, 2, 1, 7, 1),
(18, 2033700, 12, 244044, 21, 375827, 34000, 2199483, 23, 26, 23, 22, 2, 2, 2, 8, 0);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `core_historialestado`
--

DROP TABLE IF EXISTS `core_historialestado`;
CREATE TABLE `core_historialestado` (
  `id` int(11) NOT NULL,
  `fecha` datetime(6) NOT NULL,
  `estado_id` int(11) DEFAULT NULL,
  `factura_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `core_producto`
--

DROP TABLE IF EXISTS `core_producto`;
CREATE TABLE `core_producto` (
  `id` int(11) NOT NULL,
  `codigo` varchar(100) NOT NULL,
  `descripcion` varchar(200) NOT NULL,
  `cantidad` int(11) NOT NULL,
  `precio` int(11) NOT NULL,
  `monto` int(11) NOT NULL,
  `factura_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `core_producto`
--

INSERT INTO `core_producto` (`id`, `codigo`, `descripcion`, `cantidad`, `precio`, `monto`, `factura_id`) VALUES
(21, 'kss32', 'Camiseta', 2, 12900, 25800, 14),
(23, '43adk', 'Camiseta', 2, 19990, 39980, 16),
(24, 'fsk9y', 'Zapatillas', 4, 39990, 159960, 16),
(25, 'lsls', 'Camiseta', 32, 12000, 384000, 17),
(26, '43adk', 'Conjunto Buzo', 12, 56990, 683880, 18),
(27, 'fksa', 'Zapatillas', 18, 74990, 1349820, 18);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `core_rechazo`
--

DROP TABLE IF EXISTS `core_rechazo`;
CREATE TABLE `core_rechazo` (
  `id` int(11) NOT NULL,
  `descripcion` longtext DEFAULT NULL,
  `factura_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `core_rechazo`
--

INSERT INTO `core_rechazo` (`id`, `descripcion`, `factura_id`) VALUES
(4, 'No hay nadie en el domicilio', 16),
(5, 'Direccion incorrecta', 16),
(6, 'No hay respuesta desde el domicilio indicado', 16),
(7, 'No se encuentra el domicilio', 18),
(8, 'Cliente no responde su telefono', 18),
(9, 'No hay personas en el domicilio', 18);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `core_vendedor`
--

DROP TABLE IF EXISTS `core_vendedor`;
CREATE TABLE `core_vendedor` (
  `id` int(11) NOT NULL,
  `nombreEmpresa` varchar(100) NOT NULL,
  `direccion` varchar(200) NOT NULL,
  `telefono` varchar(15) NOT NULL,
  `correo` varchar(254) NOT NULL,
  `web` varchar(30) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `core_vendedor`
--

INSERT INTO `core_vendedor` (`id`, `nombreEmpresa`, `direccion`, `telefono`, `correo`, `web`) VALUES
(12, '100 futbol', 'Av independencia 2132', '938293431', 'vendedor@gmail.com', 'www.vendedor.cl'),
(13, 'Falabella', 'Av independencia 2132', '938293431', 'vendedor@gmail.com', 'www.vendedor.cl'),
(14, 'Falabella', 'Av independencia 2132', '938293431', 'vendedor@gmail.com', 'www.vendedor.cl'),
(15, 'Vendedor', 'Av independencia 1923', '938293431', 'vendedor@gmail.com', 'www.vendedor.cl'),
(16, 'Falabella', 'Av independencia 2132', '938293431', 'vendedor@gmail.com', 'www.vendedor.cl'),
(17, 'Falabella', 'Av independencia 2132', '938293431', 'vendedor@gmail.com', 'www.vendedor.cl'),
(18, 'Falabella', 'Av independencia 2132', '938293431', 'vendedor@gmail.com', 'www.vendedor.cl'),
(19, 'Falabella', 'Av independencia 2132', '938293431', 'vendedor@gmail.com', 'www.vendedor.cl'),
(20, 'Falabella', 'Av independencia 2132', '938293431', 'vendedor@gmail.com', 'www.vendedor.cl'),
(21, 'Falabella', 'Av independencia 2132', '938293431', 'vendedor@gmail.com', 'www.vendedor.cl'),
(22, 'Paris', 'Av independencia 2132', '938293431', 'paris@gmail.com', 'www.paris.cl');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `django_admin_log`
--

DROP TABLE IF EXISTS `django_admin_log`;
CREATE TABLE `django_admin_log` (
  `id` int(11) NOT NULL,
  `action_time` datetime(6) NOT NULL,
  `object_id` longtext DEFAULT NULL,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` smallint(5) UNSIGNED NOT NULL CHECK (`action_flag` >= 0),
  `change_message` longtext NOT NULL,
  `content_type_id` int(11) DEFAULT NULL,
  `user_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `django_admin_log`
--

INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES
(1, '2024-06-05 03:11:44.228519', '1', 'ignacio riffo', 3, '', 7, 1),
(2, '2024-06-05 03:11:53.197025', '2', 'vendedor', 3, '', 8, 1),
(3, '2024-06-05 03:11:53.203328', '1', 'empresa', 3, '', 8, 1),
(4, '2024-06-05 03:11:58.755702', '1', 'av concha y toro 2142', 3, '', 9, 1),
(5, '2024-06-05 03:16:36.738981', '1', 'Factura object (1)', 3, '', 10, 1),
(6, '2024-06-05 03:22:33.650444', '2', 'Factura object (2)', 3, '', 10, 1),
(7, '2024-06-05 03:38:05.808080', '3', 'Factura object (3)', 3, '', 10, 1),
(8, '2024-06-05 03:38:12.539924', '5', 'ignacio riffo', 3, '', 7, 1),
(9, '2024-06-05 03:38:12.544359', '4', 'ignacio riffo', 3, '', 7, 1),
(10, '2024-06-05 03:38:18.906222', '6', 'empresa', 3, '', 8, 1),
(11, '2024-06-05 03:38:18.911221', '5', 'empresa', 3, '', 8, 1),
(12, '2024-06-05 03:38:27.475995', '5', 'av concha y toro 2142', 3, '', 9, 1),
(13, '2024-06-05 03:38:27.479010', '4', 'av concha y toro 2142', 3, '', 9, 1),
(14, '2024-06-05 03:38:41.167027', '4', 'vendedor', 3, '', 12, 1),
(15, '2024-06-05 03:38:41.171936', '3', 'vendedor', 3, '', 12, 1),
(16, '2024-06-05 03:51:52.039584', '4', 'Factura object (4)', 3, '', 10, 1),
(17, '2024-06-05 03:51:59.105505', '6', 'ignacio riffo', 3, '', 7, 1),
(18, '2024-06-05 03:52:06.176815', '7', 'empresa', 3, '', 8, 1),
(19, '2024-06-05 03:52:11.034099', '6', 'av concha y toro 2142', 3, '', 9, 1),
(20, '2024-06-05 03:52:18.688463', '5', 'vendedor', 3, '', 12, 1),
(21, '2024-06-05 03:57:30.559804', '8', 'ignacio riffo', 3, '', 7, 1),
(22, '2024-06-05 03:57:30.567186', '7', 'ignacio riffo', 3, '', 7, 1),
(23, '2024-06-05 03:57:38.742215', '9', 'empresa', 3, '', 8, 1),
(24, '2024-06-05 03:57:38.746764', '8', 'empresa', 3, '', 8, 1),
(25, '2024-06-05 03:57:44.152183', '8', 'av concha y toro 2142', 3, '', 9, 1),
(26, '2024-06-05 03:57:44.155632', '7', 'av concha y toro 2142', 3, '', 9, 1),
(27, '2024-06-05 03:57:52.782127', '7', 'vendedor', 3, '', 12, 1),
(28, '2024-06-05 03:57:52.786271', '6', 'vendedor', 3, '', 12, 1),
(29, '2024-06-05 04:40:46.060688', '5', '02amd', 3, '', 11, 1),
(30, '2024-06-05 04:40:46.064846', '4', '43adk', 3, '', 11, 1),
(31, '2024-06-05 04:40:46.067896', '3', 'lsls', 3, '', 11, 1),
(32, '2024-06-05 04:40:46.072085', '2', 'kss32', 3, '', 11, 1),
(33, '2024-06-05 04:40:46.076884', '1', 'kdksk', 3, '', 11, 1),
(34, '2024-06-05 04:40:51.955744', '8', 'Factura object (8)', 3, '', 10, 1),
(35, '2024-06-05 04:40:51.960208', '7', 'Factura object (7)', 3, '', 10, 1),
(36, '2024-06-05 04:40:51.966244', '6', 'Factura object (6)', 3, '', 10, 1),
(37, '2024-06-05 04:40:51.970283', '5', 'Factura object (5)', 3, '', 10, 1),
(38, '2024-06-05 04:40:58.834617', '12', 'ignacio riffo', 3, '', 7, 1),
(39, '2024-06-05 04:40:58.837655', '11', 'ignacio riffo', 3, '', 7, 1),
(40, '2024-06-05 04:40:58.842714', '10', 'ignacio riffo', 3, '', 7, 1),
(41, '2024-06-05 04:40:58.845692', '9', 'ignacio riffo', 3, '', 7, 1),
(42, '2024-06-05 04:41:04.458648', '13', 'empresa', 3, '', 8, 1),
(43, '2024-06-05 04:41:04.463633', '12', 'empresa', 3, '', 8, 1),
(44, '2024-06-05 04:41:04.467401', '11', 'empresa', 3, '', 8, 1),
(45, '2024-06-05 04:41:04.472177', '10', 'empresa', 3, '', 8, 1),
(46, '2024-06-05 04:41:10.450617', '12', 'av concha y toro 2142', 3, '', 9, 1),
(47, '2024-06-05 04:41:10.454035', '11', 'av concha y toro 2142', 3, '', 9, 1),
(48, '2024-06-05 04:41:10.459084', '10', 'av concha y toro 2142', 3, '', 9, 1),
(49, '2024-06-05 04:41:10.462059', '9', 'av concha y toro 2142', 3, '', 9, 1),
(50, '2024-06-05 04:41:17.944699', '11', 'vendedor', 3, '', 12, 1),
(51, '2024-06-05 04:41:17.949614', '10', 'vendedor', 3, '', 12, 1),
(52, '2024-06-05 04:41:17.954663', '9', 'vendedor', 3, '', 12, 1),
(53, '2024-06-05 04:41:17.957647', '8', 'vendedor', 3, '', 12, 1),
(54, '2024-06-05 05:40:08.995925', '12', '100% futbol', 2, '[{\"changed\": {\"fields\": [\"NombreEmpresa\"]}}]', 12, 1),
(55, '2024-06-05 05:40:16.891213', '12', '100 futbol', 2, '[{\"changed\": {\"fields\": [\"NombreEmpresa\"]}}]', 12, 1),
(56, '2024-06-05 05:40:34.633432', '14', 'EmpresaUC', 2, '[{\"changed\": {\"fields\": [\"NombreEmpresa\"]}}]', 8, 1),
(57, '2024-06-05 05:41:01.097954', '14', 'GithubUC', 2, '[{\"changed\": {\"fields\": [\"NombreEmpresa\"]}}]', 8, 1),
(58, '2024-06-05 05:41:40.466166', '13', 'Ignacio Riffo', 2, '[{\"changed\": {\"fields\": [\"Nombrecliente\", \"NombreEmpresa\"]}}]', 7, 1),
(59, '2024-06-05 05:41:49.989997', '13', 'Av concha y toro 2142', 2, '[{\"changed\": {\"fields\": [\"Direccionenvio\", \"Condicionesenvio\"]}}]', 9, 1),
(60, '2024-06-05 05:42:21.497086', '13', 'Ignacio Riffo', 2, '[{\"changed\": {\"fields\": [\"Direccion\"]}}]', 7, 1),
(61, '2024-06-05 05:42:28.423575', '14', 'GithubUC', 2, '[{\"changed\": {\"fields\": [\"Direccion\"]}}]', 8, 1),
(62, '2024-06-05 05:42:36.491748', '12', '100 futbol', 2, '[{\"changed\": {\"fields\": [\"Direccion\"]}}]', 12, 1),
(63, '2024-06-05 05:52:42.489517', '6', 'kss32', 2, '[{\"changed\": {\"fields\": [\"Descripcion\"]}}]', 11, 1),
(64, '2024-06-05 05:52:49.921837', '7', '02amd', 2, '[{\"changed\": {\"fields\": [\"Descripcion\"]}}]', 11, 1),
(65, '2024-06-05 05:52:55.794752', '8', 'fsl12', 2, '[{\"changed\": {\"fields\": [\"Descripcion\"]}}]', 11, 1),
(66, '2024-06-05 05:53:00.934262', '9', 'lal12', 2, '[{\"changed\": {\"fields\": [\"Descripcion\"]}}]', 11, 1),
(67, '2024-07-02 17:32:37.527309', '1', 'Por entregar', 1, '[{\"added\": {}}]', 13, 1),
(68, '2024-07-02 17:32:54.627280', '2', 'Entregada', 1, '[{\"added\": {}}]', 13, 1),
(69, '2024-07-02 17:33:02.729848', '3', 'Rechazada', 1, '[{\"added\": {}}]', 13, 1),
(70, '2024-07-02 17:33:27.232049', '1', 'Orden de compra', 1, '[{\"added\": {}}]', 15, 1),
(71, '2024-07-02 17:33:32.089851', '2', 'Facturada', 1, '[{\"added\": {}}]', 15, 1),
(72, '2024-07-02 17:33:47.667959', '1', 'Creada', 1, '[{\"added\": {}}]', 14, 1),
(73, '2024-07-02 17:33:53.421448', '2', 'Rectificada', 1, '[{\"added\": {}}]', 14, 1),
(74, '2024-07-03 05:42:43.335955', '1', 'No hay personas en el domicilio.', 3, '', 17, 1),
(75, '2024-07-03 05:43:50.636284', '2', 'No hay personas en el domicilio', 3, '', 17, 1),
(76, '2024-07-03 05:53:17.653526', '1', 'Av las nieves 02196', 2, '[{\"changed\": {\"fields\": [\"Imagen\"]}}]', 16, 1),
(77, '2024-07-03 06:00:32.999304', '3', 'Av las nieves 02196', 3, '', 16, 1),
(78, '2024-07-03 06:00:33.003984', '2', 'Av las nieves 02196', 3, '', 16, 1),
(79, '2024-07-03 06:00:33.007263', '1', 'Av las nieves 02196', 3, '', 16, 1),
(80, '2024-07-03 06:08:30.521960', '5', 'Av las nieves 02196', 3, '', 16, 1),
(81, '2024-07-03 06:08:30.521960', '4', 'Av las nieves 02196', 3, '', 16, 1),
(82, '2024-07-04 03:24:37.571855', '3', 'No hay personas en el domicilio', 3, '', 17, 1),
(83, '2024-07-04 03:25:03.688640', '9', 'Ignacio Riffo', 3, '', 10, 1),
(84, '2024-07-04 04:06:13.234986', '6', 'Av las nieves 02196', 3, '', 16, 1),
(85, '2024-07-04 04:29:33.842319', '7', 'Av las nieves 02196', 2, '[{\"changed\": {\"fields\": [\"Imagen\"]}}]', 16, 1),
(86, '2024-07-04 04:29:59.805310', '7', 'Av las nieves 02196', 2, '[{\"changed\": {\"fields\": [\"Rut\"]}}]', 16, 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `django_content_type`
--

DROP TABLE IF EXISTS `django_content_type`;
CREATE TABLE `django_content_type` (
  `id` int(11) NOT NULL,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `django_content_type`
--

INSERT INTO `django_content_type` (`id`, `app_label`, `model`) VALUES
(1, 'admin', 'logentry'),
(3, 'auth', 'group'),
(2, 'auth', 'permission'),
(4, 'auth', 'user'),
(5, 'contenttypes', 'contenttype'),
(7, 'core', 'cliente'),
(8, 'core', 'empresa'),
(16, 'core', 'entrega'),
(9, 'core', 'envio'),
(13, 'core', 'estadoenvio'),
(14, 'core', 'estadomodificacion'),
(15, 'core', 'estadoorden'),
(10, 'core', 'factura'),
(18, 'core', 'historialestado'),
(11, 'core', 'producto'),
(17, 'core', 'rechazo'),
(12, 'core', 'vendedor'),
(6, 'sessions', 'session');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `django_migrations`
--

DROP TABLE IF EXISTS `django_migrations`;
CREATE TABLE `django_migrations` (
  `id` int(11) NOT NULL,
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `django_migrations`
--

INSERT INTO `django_migrations` (`id`, `app`, `name`, `applied`) VALUES
(1, 'contenttypes', '0001_initial', '2024-06-05 02:19:13.251055'),
(2, 'auth', '0001_initial', '2024-06-05 02:19:13.564021'),
(3, 'admin', '0001_initial', '2024-06-05 02:19:14.312276'),
(4, 'admin', '0002_logentry_remove_auto_add', '2024-06-05 02:19:14.486319'),
(5, 'admin', '0003_logentry_add_action_flag_choices', '2024-06-05 02:19:14.499316'),
(6, 'contenttypes', '0002_remove_content_type_name', '2024-06-05 02:19:14.587341'),
(7, 'auth', '0002_alter_permission_name_max_length', '2024-06-05 02:19:14.685294'),
(8, 'auth', '0003_alter_user_email_max_length', '2024-06-05 02:19:14.707306'),
(9, 'auth', '0004_alter_user_username_opts', '2024-06-05 02:19:14.719293'),
(10, 'auth', '0005_alter_user_last_login_null', '2024-06-05 02:19:14.798299'),
(11, 'auth', '0006_require_contenttypes_0002', '2024-06-05 02:19:14.804296'),
(12, 'auth', '0007_alter_validators_add_error_messages', '2024-06-05 02:19:14.816293'),
(13, 'auth', '0008_alter_user_username_max_length', '2024-06-05 02:19:14.835297'),
(14, 'auth', '0009_alter_user_last_name_max_length', '2024-06-05 02:19:14.855297'),
(15, 'auth', '0010_alter_group_name_max_length', '2024-06-05 02:19:14.877295'),
(16, 'auth', '0011_update_proxy_permissions', '2024-06-05 02:19:14.889294'),
(17, 'auth', '0012_alter_user_first_name_max_length', '2024-06-05 02:19:14.908294'),
(18, 'core', '0001_initial', '2024-06-05 02:19:15.184142'),
(19, 'sessions', '0001_initial', '2024-06-05 02:19:15.236280'),
(20, 'core', '0002_auto_20240604_2233', '2024-06-05 02:33:12.997987'),
(21, 'core', '0003_auto_20240604_2304', '2024-06-05 03:04:26.920291'),
(22, 'core', '0004_auto_20240604_2335', '2024-06-05 03:35:51.971854'),
(23, 'core', '0005_auto_20240604_2341', '2024-06-05 03:41:25.194737'),
(24, 'core', '0006_auto_20240604_2345', '2024-06-05 03:45:51.508024'),
(25, 'core', '0007_auto_20240604_2353', '2024-06-05 03:54:03.721909'),
(26, 'core', '0008_estadoenvio_estadomodificacion_estadoorden', '2024-07-02 17:29:38.494933'),
(27, 'core', '0009_auto_20240702_1335', '2024-07-02 17:35:43.843548'),
(28, 'core', '0010_auto_20240703_0109', '2024-07-03 05:09:16.473477'),
(29, 'core', '0011_auto_20240703_0118', '2024-07-03 05:18:31.530341'),
(30, 'core', '0012_auto_20240704_0014', '2024-07-04 04:15:04.670104'),
(31, 'core', '0013_factura_anulada', '2024-07-16 03:10:51.955669'),
(32, 'core', '0014_historialestado', '2024-07-16 03:48:02.300264');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `django_session`
--

DROP TABLE IF EXISTS `django_session`;
CREATE TABLE `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `django_session`
--

INSERT INTO `django_session` (`session_key`, `session_data`, `expire_date`) VALUES
('4vvn7sk75btzarp0qvjprahuc6luwc3v', '.eJxVjDsOwjAQBe_iGlm7Xq8_lPScwfJPOIAcKU4qxN0hUgpo38y8lwhxW1vYRl3CVMRZKHH63VLMj9p3UO6x32aZ574uU5K7Ig865HUu9Xk53L-DFkf71jZ5JOcVEXtWTKwSFe01AzAzIJlkUGeEioDOoq1UrWGno9EIoMT7A3vHNPE:1sF2yQ:TZVA30xHQ-TI2MIXVrHtSPv2_AKKg0M8D_TrAr0myns', '2024-06-20 02:35:30.424952'),
('n9fg63yo7ejupu282z149of5rk28earr', '.eJxVjEEOwiAQRe_C2pAyg0Bduu8ZyAxMpWpoUtqV8e7apAvd_vfef6lI21ri1mSJU1YXZdTpd2NKD6k7yHeqt1mnua7LxHpX9EGbHuYsz-vh_h0UauVbMzAAYAIImEYXPHk26IDFBWvF9mjEnoWoG4MJ1HnnvDUZkZBTCr16fwDH1Tc4:1sTYLX:Y8jReZh4Qw8ezN3YTwyC63huOTHbXnPK-1os-Q8c0qs', '2024-07-30 02:55:19.564191'),
('pvhkwpubnqb7d9p6mrc7u5p0u2j0kvgo', '.eJxVjEEOwiAQRe_C2pAyg0Bduu8ZyAxMpWpoUtqV8e7apAvd_vfef6lI21ri1mSJU1YXZdTpd2NKD6k7yHeqt1mnua7LxHpX9EGbHuYsz-vh_h0UauVbMzAAYAIImEYXPHk26IDFBWvF9mjEnoWoG4MJ1HnnvDUZkZBTCr16fwDH1Tc4:1sPD1b:LxNjK6KCLTTOPG_jxs5xlxpm2v74vHAmJtCX5AO2EdM', '2024-07-18 03:20:47.588956');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `auth_group`
--
ALTER TABLE `auth_group`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `name` (`name`);

--
-- Indices de la tabla `auth_group_permissions`
--
ALTER TABLE `auth_group_permissions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_group_permissions_group_id_permission_id_0cd325b0_uniq` (`group_id`,`permission_id`),
  ADD KEY `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` (`permission_id`);

--
-- Indices de la tabla `auth_permission`
--
ALTER TABLE `auth_permission`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_permission_content_type_id_codename_01ab375a_uniq` (`content_type_id`,`codename`);

--
-- Indices de la tabla `auth_user`
--
ALTER TABLE `auth_user`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `username` (`username`);

--
-- Indices de la tabla `auth_user_groups`
--
ALTER TABLE `auth_user_groups`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_user_groups_user_id_group_id_94350c0c_uniq` (`user_id`,`group_id`),
  ADD KEY `auth_user_groups_group_id_97559544_fk_auth_group_id` (`group_id`);

--
-- Indices de la tabla `auth_user_user_permissions`
--
ALTER TABLE `auth_user_user_permissions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_user_user_permissions_user_id_permission_id_14a6b632_uniq` (`user_id`,`permission_id`),
  ADD KEY `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` (`permission_id`);

--
-- Indices de la tabla `core_cliente`
--
ALTER TABLE `core_cliente`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `core_empresa`
--
ALTER TABLE `core_empresa`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `core_entrega`
--
ALTER TABLE `core_entrega`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `core_envio`
--
ALTER TABLE `core_envio`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `core_estadoenvio`
--
ALTER TABLE `core_estadoenvio`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `core_estadomodificacion`
--
ALTER TABLE `core_estadomodificacion`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `core_estadoorden`
--
ALTER TABLE `core_estadoorden`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `core_factura`
--
ALTER TABLE `core_factura`
  ADD PRIMARY KEY (`id`),
  ADD KEY `core_factura_cliente_id_a3d41446_fk_core_cliente_id` (`cliente_id`),
  ADD KEY `core_factura_empresa_id_e5b3c0f5_fk_core_empresa_id` (`empresa_id`),
  ADD KEY `core_factura_envio_id_94054e6e_fk_core_envio_id` (`envio_id`),
  ADD KEY `core_factura_vendedor_id_d88fa5c3_fk_core_vendedor_id` (`vendedor_id`),
  ADD KEY `core_factura_entrega_id_705d03d4_fk_core_entrega_id` (`entrega_id`),
  ADD KEY `core_factura_estadoEnvio_id_d072fbcf_fk_core_estadoenvio_id` (`estadoEnvio_id`),
  ADD KEY `core_factura_estadoModificacion_i_7f3ff288_fk_core_esta` (`estadoModificacion_id`),
  ADD KEY `core_factura_estadoOrden_id_39bdcb88_fk_core_estadoorden_id` (`estadoOrden_id`);

--
-- Indices de la tabla `core_historialestado`
--
ALTER TABLE `core_historialestado`
  ADD PRIMARY KEY (`id`),
  ADD KEY `core_historialestado_estado_id_52ffb789_fk_core_estadoorden_id` (`estado_id`),
  ADD KEY `core_historialestado_factura_id_3220a976_fk_core_factura_id` (`factura_id`);

--
-- Indices de la tabla `core_producto`
--
ALTER TABLE `core_producto`
  ADD PRIMARY KEY (`id`),
  ADD KEY `core_producto_factura_id_316eaf83_fk_core_factura_id` (`factura_id`);

--
-- Indices de la tabla `core_rechazo`
--
ALTER TABLE `core_rechazo`
  ADD PRIMARY KEY (`id`),
  ADD KEY `core_rechazo_factura_id_3f53ae8f_fk_core_factura_id` (`factura_id`);

--
-- Indices de la tabla `core_vendedor`
--
ALTER TABLE `core_vendedor`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `django_admin_log`
--
ALTER TABLE `django_admin_log`
  ADD PRIMARY KEY (`id`),
  ADD KEY `django_admin_log_content_type_id_c4bce8eb_fk_django_co` (`content_type_id`),
  ADD KEY `django_admin_log_user_id_c564eba6_fk_auth_user_id` (`user_id`);

--
-- Indices de la tabla `django_content_type`
--
ALTER TABLE `django_content_type`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `django_content_type_app_label_model_76bd3d3b_uniq` (`app_label`,`model`);

--
-- Indices de la tabla `django_migrations`
--
ALTER TABLE `django_migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `django_session`
--
ALTER TABLE `django_session`
  ADD PRIMARY KEY (`session_key`),
  ADD KEY `django_session_expire_date_a5c62663` (`expire_date`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `auth_group`
--
ALTER TABLE `auth_group`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `auth_group_permissions`
--
ALTER TABLE `auth_group_permissions`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `auth_permission`
--
ALTER TABLE `auth_permission`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=73;

--
-- AUTO_INCREMENT de la tabla `auth_user`
--
ALTER TABLE `auth_user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `auth_user_groups`
--
ALTER TABLE `auth_user_groups`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `auth_user_user_permissions`
--
ALTER TABLE `auth_user_user_permissions`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `core_cliente`
--
ALTER TABLE `core_cliente`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=24;

--
-- AUTO_INCREMENT de la tabla `core_empresa`
--
ALTER TABLE `core_empresa`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=27;

--
-- AUTO_INCREMENT de la tabla `core_entrega`
--
ALTER TABLE `core_entrega`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT de la tabla `core_envio`
--
ALTER TABLE `core_envio`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=24;

--
-- AUTO_INCREMENT de la tabla `core_estadoenvio`
--
ALTER TABLE `core_estadoenvio`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `core_estadomodificacion`
--
ALTER TABLE `core_estadomodificacion`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `core_estadoorden`
--
ALTER TABLE `core_estadoorden`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `core_factura`
--
ALTER TABLE `core_factura`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT de la tabla `core_historialestado`
--
ALTER TABLE `core_historialestado`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `core_producto`
--
ALTER TABLE `core_producto`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=28;

--
-- AUTO_INCREMENT de la tabla `core_rechazo`
--
ALTER TABLE `core_rechazo`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT de la tabla `core_vendedor`
--
ALTER TABLE `core_vendedor`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;

--
-- AUTO_INCREMENT de la tabla `django_admin_log`
--
ALTER TABLE `django_admin_log`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=87;

--
-- AUTO_INCREMENT de la tabla `django_content_type`
--
ALTER TABLE `django_content_type`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT de la tabla `django_migrations`
--
ALTER TABLE `django_migrations`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=33;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `auth_group_permissions`
--
ALTER TABLE `auth_group_permissions`
  ADD CONSTRAINT `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  ADD CONSTRAINT `auth_group_permissions_group_id_b120cbf9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`);

--
-- Filtros para la tabla `auth_permission`
--
ALTER TABLE `auth_permission`
  ADD CONSTRAINT `auth_permission_content_type_id_2f476e4b_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`);

--
-- Filtros para la tabla `auth_user_groups`
--
ALTER TABLE `auth_user_groups`
  ADD CONSTRAINT `auth_user_groups_group_id_97559544_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  ADD CONSTRAINT `auth_user_groups_user_id_6a12ed8b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);

--
-- Filtros para la tabla `auth_user_user_permissions`
--
ALTER TABLE `auth_user_user_permissions`
  ADD CONSTRAINT `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  ADD CONSTRAINT `auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);

--
-- Filtros para la tabla `core_factura`
--
ALTER TABLE `core_factura`
  ADD CONSTRAINT `core_factura_cliente_id_a3d41446_fk_core_cliente_id` FOREIGN KEY (`cliente_id`) REFERENCES `core_cliente` (`id`),
  ADD CONSTRAINT `core_factura_empresa_id_e5b3c0f5_fk_core_empresa_id` FOREIGN KEY (`empresa_id`) REFERENCES `core_empresa` (`id`),
  ADD CONSTRAINT `core_factura_entrega_id_705d03d4_fk_core_entrega_id` FOREIGN KEY (`entrega_id`) REFERENCES `core_entrega` (`id`),
  ADD CONSTRAINT `core_factura_envio_id_94054e6e_fk_core_envio_id` FOREIGN KEY (`envio_id`) REFERENCES `core_envio` (`id`),
  ADD CONSTRAINT `core_factura_estadoEnvio_id_d072fbcf_fk_core_estadoenvio_id` FOREIGN KEY (`estadoEnvio_id`) REFERENCES `core_estadoenvio` (`id`),
  ADD CONSTRAINT `core_factura_estadoModificacion_i_7f3ff288_fk_core_esta` FOREIGN KEY (`estadoModificacion_id`) REFERENCES `core_estadomodificacion` (`id`),
  ADD CONSTRAINT `core_factura_estadoOrden_id_39bdcb88_fk_core_estadoorden_id` FOREIGN KEY (`estadoOrden_id`) REFERENCES `core_estadoorden` (`id`),
  ADD CONSTRAINT `core_factura_vendedor_id_d88fa5c3_fk_core_vendedor_id` FOREIGN KEY (`vendedor_id`) REFERENCES `core_vendedor` (`id`);

--
-- Filtros para la tabla `core_historialestado`
--
ALTER TABLE `core_historialestado`
  ADD CONSTRAINT `core_historialestado_estado_id_52ffb789_fk_core_estadoorden_id` FOREIGN KEY (`estado_id`) REFERENCES `core_estadoorden` (`id`),
  ADD CONSTRAINT `core_historialestado_factura_id_3220a976_fk_core_factura_id` FOREIGN KEY (`factura_id`) REFERENCES `core_factura` (`id`);

--
-- Filtros para la tabla `core_producto`
--
ALTER TABLE `core_producto`
  ADD CONSTRAINT `core_producto_factura_id_316eaf83_fk_core_factura_id` FOREIGN KEY (`factura_id`) REFERENCES `core_factura` (`id`);

--
-- Filtros para la tabla `core_rechazo`
--
ALTER TABLE `core_rechazo`
  ADD CONSTRAINT `core_rechazo_factura_id_3f53ae8f_fk_core_factura_id` FOREIGN KEY (`factura_id`) REFERENCES `core_factura` (`id`);

--
-- Filtros para la tabla `django_admin_log`
--
ALTER TABLE `django_admin_log`
  ADD CONSTRAINT `django_admin_log_content_type_id_c4bce8eb_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  ADD CONSTRAINT `django_admin_log_user_id_c564eba6_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
