-- phpMyAdmin SQL Dump
-- version 4.1.12
-- http://www.phpmyadmin.net
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 17-12-2014 a las 12:04:02
-- Versión del servidor: 5.6.16
-- Versión de PHP: 5.5.11

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Base de datos: `cdcol`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cds`
--

CREATE TABLE IF NOT EXISTS `cds` (
  `titel` varchar(200) COLLATE latin1_general_ci DEFAULT NULL,
  `interpret` varchar(200) COLLATE latin1_general_ci DEFAULT NULL,
  `jahr` int(11) DEFAULT NULL,
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci AUTO_INCREMENT=7 ;

--
-- Volcado de datos para la tabla `cds`
--

INSERT INTO `cds` (`titel`, `interpret`, `jahr`, `id`) VALUES
('Beauty', 'Ryuichi Sakamoto', 1990, 1),
('Goodbye Country (Hello Nightclub)', 'Groove Armada', 2001, 4),
('Glee', 'Bran Van 3000', 1997, 5);
--
-- Base de datos: `f5_system`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `t_admin`
--

CREATE TABLE IF NOT EXISTS `t_admin` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user` varchar(100) NOT NULL,
  `password` varchar(100) NOT NULL,
  `name` varchar(50) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=2 ;

--
-- Volcado de datos para la tabla `t_admin`
--

INSERT INTO `t_admin` (`id`, `user`, `password`, `name`) VALUES
(1, 'test', '16d7a4fca7442dda3ad93c9a726597e4', '');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `t_groups`
--

CREATE TABLE IF NOT EXISTS `t_groups` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `group_name` varchar(100) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=3 ;

--
-- Volcado de datos para la tabla `t_groups`
--

INSERT INTO `t_groups` (`id`, `group_name`) VALUES
(1, 'Escazu'),
(2, 'Desamparados');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `t_pitchs`
--

CREATE TABLE IF NOT EXISTS `t_pitchs` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `detail` varchar(100) NOT NULL,
  `id_group` int(11) NOT NULL,
  `id_pitch` int(11) NOT NULL,
  `active` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=5 ;

--
-- Volcado de datos para la tabla `t_pitchs`
--

INSERT INTO `t_pitchs` (`id`, `detail`, `id_group`, `id_pitch`, `active`) VALUES
(1, 'Escazu 1', 1, 1, 1),
(2, 'Desamparados 1', 2, 1, 1),
(3, 'Desamparados 2', 2, 2, 1),
(4, 'Desamparados 3', 2, 3, 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `t_reservations`
--

CREATE TABLE IF NOT EXISTS `t_reservations` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `lastname` varchar(100) NOT NULL,
  `phone` varchar(100) NOT NULL,
  `email` varchar(100) NOT NULL,
  `team_id` tinyint(4) NOT NULL,
  `type_reservation` tinyint(4) NOT NULL,
  `referee_required` tinyint(1) NOT NULL,
  `reservation_time` varchar(100) NOT NULL,
  `reservation_year` smallint(6) NOT NULL,
  `reservation_month` tinyint(4) NOT NULL,
  `reservation_day` tinyint(4) NOT NULL,
  `reservation_made_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `reservation_price` float NOT NULL,
  `pitch_id` smallint(6) NOT NULL,
  `group_id` smallint(6) NOT NULL,
  `active` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=425 ;

--
-- Volcado de datos para la tabla `t_reservations`
--

INSERT INTO `t_reservations` (`id`, `name`, `lastname`, `phone`, `email`, `team_id`, `type_reservation`, `referee_required`, `reservation_time`, `reservation_year`, `reservation_month`, `reservation_day`, `reservation_made_time`, `reservation_price`, `pitch_id`, `group_id`, `active`) VALUES
(33, 'Cristian', '#CR129X6333N', '13055920', 'ccampos_cr@hotmail.com', 1, 2, 0, '08-09', 2014, 12, 10, '2014-12-11 04:14:22', 1, 1, 1, 1),
(34, 'IE', 'IE', '11111111', 'test@s', 2, 2, 0, '08-09', 2014, 12, 10, '2014-12-11 04:59:44', 1, 1, 1, 1),
(35, 'Cristian', '#CR129X6333N', '13055920', 'ccamposcr@gmail.com', 1, 1, 0, '09-10', 2014, 12, 10, '2014-12-11 05:00:17', 1, 1, 1, 1),
(36, 'Christian', 'Campos', '', 'ccamposcr@gmail.com', 1, 1, 0, '10-11', 2014, 12, 10, '2014-12-11 05:00:56', 1, 1, 1, 1),
(37, 'desampa', 'desampajohns', '13055920', 'ccamposcr@gmail.com', 1, 2, 0, '08-09', 2014, 12, 11, '2014-12-11 06:00:39', 1, 1, 2, 1),
(38, 'Cristian', '#CR129X6333N', '13055920', 'ccamposcr@gmail.com', 1, 2, 0, '08-09', 2014, 12, 12, '2014-12-12 06:18:37', 1, 1, 1, 1),
(39, 'Cristian', '#CR129X6333N', '13055920', 'ccamposcr@gmail.com', 1, 1, 0, '08-09', 2014, 12, 15, '2014-12-16 02:05:47', 1, 3, 2, 1),
(40, 'Cristian', '#CR129X6333N', '13055920', 'ccamposcr@gmail.com', 1, 2, 0, '09-10', 2014, 12, 15, '2014-12-16 02:06:44', 1, 3, 2, 1),
(41, 'Cristian', '#CR129X6333N', '13055920', 'ccamposcr@gmail.com', 2, 2, 0, '09-10', 2014, 12, 15, '2014-12-16 02:06:54', 1, 3, 2, 1),
(42, 'Cristian', '#CR129X6333N', '13055920', 'ccamposcr@gmail.com', 1, 2, 0, '10-11', 2014, 12, 15, '2014-12-16 02:07:45', 1, 3, 2, 1),
(43, 'Cristian', '#CR129X6333N', '13055920', 'ccamposcr@gmail.com', 1, 2, 0, '18-19', 2014, 12, 15, '2014-12-16 02:07:52', 1, 3, 2, 1),
(44, 'Cristian', '#CR129X6333N', '13055920', 'ccamposcr@gmail.com', 1, 2, 0, '08-09', 2015, 1, 1, '2014-12-16 05:54:01', 1, 1, 1, 1),
(45, 'Cristian', '#CR129X6333N', '13055920', 'ccampos_cr@hotmail.com', 1, 2, 0, '09-10', 2015, 1, 1, '2014-12-16 05:55:59', 1, 1, 1, 1),
(46, 'Cristian', '#CR129X6333N', '13055929', '', 1, 1, 0, '10-11', 2015, 1, 1, '2014-12-16 05:58:16', 1, 1, 1, 1),
(47, 'Cristian', '#CR129X6333N', '13055920', 'jrgherrera@gmail.com', 1, 2, 0, '13-14', 2015, 1, 1, '2014-12-16 06:17:44', 1, 1, 1, 1),
(48, 'Cristian', '#CR129X6333N', '13055920', 'ccamposcr@gmail.com', 1, 1, 0, '14-15', 2015, 1, 1, '2014-12-16 06:26:55', 1, 1, 1, 1),
(49, 'Cristian', '#CR129X6333N', '13055920', 'ccamposcr@gmail.com', 1, 1, 0, '15-16', 2015, 1, 1, '2014-12-16 06:28:09', 1, 1, 1, 1),
(50, 'Cristian', '#CR129X6333N', '13055920', '', 1, 1, 0, '16-17', 2015, 1, 1, '2014-12-16 06:29:23', 1, 1, 1, 1),
(51, 'Cristian', '#CR129X6333N', '13055920', 'ccampos_cr@hotmail.com', 1, 2, 0, '17-18', 2015, 1, 1, '2014-12-16 06:36:52', 1, 1, 1, 1),
(52, 'test', 'test', '83180160', 'ccamposcr@gmail.com', 1, 1, 0, '08-09', 2015, 1, 2, '2014-12-16 06:43:03', 1, 1, 1, 1),
(53, 'test', 'test', '83180160', 'ccamposcr@gmail.com', 1, 1, 0, '08-09', 2015, 1, 9, '2014-12-16 06:43:03', 1, 1, 1, 1),
(54, 'test', 'test', '83180160', 'ccamposcr@gmail.com', 1, 1, 0, '08-09', 2015, 1, 16, '2014-12-16 06:43:03', 1, 1, 1, 1),
(55, 'test', 'test', '83180160', 'ccamposcr@gmail.com', 1, 1, 0, '08-09', 2015, 1, 23, '2014-12-16 06:43:03', 1, 1, 1, 1),
(56, 'test', 'test', '83180160', 'ccamposcr@gmail.com', 1, 1, 0, '08-09', 2015, 1, 30, '2014-12-16 06:43:03', 1, 1, 1, 1),
(57, 'test', 'test', '83180160', 'ccamposcr@gmail.com', 1, 1, 0, '08-09', 2015, 2, 6, '2014-12-16 06:43:04', 1, 1, 1, 1),
(58, 'test', 'test', '83180160', 'ccamposcr@gmail.com', 1, 1, 0, '08-09', 2015, 2, 13, '2014-12-16 06:43:04', 1, 1, 1, 1),
(59, 'test', 'test', '83180160', 'ccamposcr@gmail.com', 1, 1, 0, '08-09', 2015, 2, 20, '2014-12-16 06:43:04', 1, 1, 1, 1),
(60, 'test', 'test', '83180160', 'ccamposcr@gmail.com', 1, 1, 0, '08-09', 2015, 2, 27, '2014-12-16 06:43:04', 1, 1, 1, 1),
(61, 'test', 'test', '83180160', 'ccamposcr@gmail.com', 1, 1, 0, '08-09', 2015, 3, 6, '2014-12-16 06:43:04', 1, 1, 1, 1),
(62, 'test', 'test', '83180160', 'ccamposcr@gmail.com', 1, 1, 0, '08-09', 2015, 3, 13, '2014-12-16 06:43:05', 1, 1, 1, 1),
(63, 'test', 'test', '83180160', 'ccamposcr@gmail.com', 1, 1, 0, '08-09', 2015, 3, 20, '2014-12-16 06:43:05', 1, 1, 1, 1),
(64, 'test', 'test', '83180160', 'ccamposcr@gmail.com', 1, 1, 0, '08-09', 2015, 3, 27, '2014-12-16 06:43:05', 1, 1, 1, 1),
(65, 'test', 'test', '83180160', 'ccamposcr@gmail.com', 1, 1, 0, '08-09', 2015, 4, 3, '2014-12-16 06:43:05', 1, 1, 1, 1),
(66, 'test', 'test', '83180160', 'ccamposcr@gmail.com', 1, 1, 0, '08-09', 2015, 4, 10, '2014-12-16 06:43:05', 1, 1, 1, 1),
(67, 'test', 'test', '83180160', 'ccamposcr@gmail.com', 1, 1, 0, '08-09', 2015, 4, 17, '2014-12-16 06:43:06', 1, 1, 1, 1),
(68, 'test', 'test', '83180160', 'ccamposcr@gmail.com', 1, 1, 0, '08-09', 2015, 4, 24, '2014-12-16 06:43:06', 1, 1, 1, 1),
(69, 'test', 'test', '83180160', 'ccamposcr@gmail.com', 1, 1, 0, '08-09', 2015, 5, 1, '2014-12-16 06:43:06', 1, 1, 1, 1),
(70, 'test', 'test', '83180160', 'ccamposcr@gmail.com', 1, 1, 0, '08-09', 2015, 5, 8, '2014-12-16 06:43:06', 1, 1, 1, 1),
(71, 'test', 'test', '83180160', 'ccamposcr@gmail.com', 1, 1, 0, '08-09', 2015, 5, 15, '2014-12-16 06:43:06', 1, 1, 1, 1),
(72, 'test', 'test', '83180160', 'ccamposcr@gmail.com', 1, 1, 0, '08-09', 2015, 5, 22, '2014-12-16 06:43:07', 1, 1, 1, 1),
(73, 'test', 'test', '83180160', 'ccamposcr@gmail.com', 1, 1, 0, '08-09', 2015, 5, 29, '2014-12-16 06:43:07', 1, 1, 1, 1),
(74, 'test', 'test', '83180160', 'ccamposcr@gmail.com', 1, 1, 0, '08-09', 2015, 6, 5, '2014-12-16 06:43:07', 1, 1, 1, 1),
(75, 'test', 'test', '83180160', 'ccamposcr@gmail.com', 1, 1, 0, '08-09', 2015, 6, 12, '2014-12-16 06:43:07', 1, 1, 1, 1),
(76, 'test', 'test', '83180160', 'ccamposcr@gmail.com', 1, 1, 0, '08-09', 2015, 6, 19, '2014-12-16 06:43:07', 1, 1, 1, 1),
(77, 'test', 'test', '83180160', 'ccamposcr@gmail.com', 1, 1, 0, '08-09', 2015, 6, 26, '2014-12-16 06:43:08', 1, 1, 1, 1),
(78, 'test', 'test', '83180160', 'ccamposcr@gmail.com', 1, 1, 0, '08-09', 2015, 7, 3, '2014-12-16 06:43:08', 1, 1, 1, 1),
(79, 'test', 'test', '83180160', 'ccamposcr@gmail.com', 1, 1, 0, '08-09', 2015, 7, 10, '2014-12-16 06:43:08', 1, 1, 1, 1),
(80, 'test', 'test', '83180160', 'ccamposcr@gmail.com', 1, 1, 0, '08-09', 2015, 7, 17, '2014-12-16 06:43:08', 1, 1, 1, 1),
(81, 'test', 'test', '83180160', 'ccamposcr@gmail.com', 1, 1, 0, '08-09', 2015, 7, 24, '2014-12-16 06:43:08', 1, 1, 1, 1),
(82, 'test', 'test', '83180160', 'ccamposcr@gmail.com', 1, 1, 0, '08-09', 2015, 7, 31, '2014-12-16 06:43:09', 1, 1, 1, 1),
(83, 'test', 'test', '83180160', 'ccamposcr@gmail.com', 1, 1, 0, '08-09', 2015, 8, 7, '2014-12-16 06:43:09', 1, 1, 1, 1),
(84, 'test', 'test', '83180160', 'ccamposcr@gmail.com', 1, 1, 0, '08-09', 2015, 8, 14, '2014-12-16 06:43:09', 1, 1, 1, 1),
(85, 'test', 'test', '83180160', 'ccamposcr@gmail.com', 1, 1, 0, '08-09', 2015, 8, 21, '2014-12-16 06:43:09', 1, 1, 1, 1),
(86, 'test', 'test', '83180160', 'ccamposcr@gmail.com', 1, 1, 0, '08-09', 2015, 8, 28, '2014-12-16 06:43:09', 1, 1, 1, 1),
(87, 'test', 'test', '83180160', 'ccamposcr@gmail.com', 1, 1, 0, '08-09', 2015, 9, 4, '2014-12-16 06:43:09', 1, 1, 1, 1),
(88, 'test', 'test', '83180160', 'ccamposcr@gmail.com', 1, 1, 0, '08-09', 2015, 9, 11, '2014-12-16 06:43:10', 1, 1, 1, 1),
(89, 'test', 'test', '83180160', 'ccamposcr@gmail.com', 1, 1, 0, '08-09', 2015, 9, 18, '2014-12-16 06:43:10', 1, 1, 1, 1),
(90, 'test', 'test', '83180160', 'ccamposcr@gmail.com', 1, 1, 0, '08-09', 2015, 9, 25, '2014-12-16 06:43:10', 1, 1, 1, 1),
(91, 'test', 'test', '83180160', 'ccamposcr@gmail.com', 1, 1, 0, '08-09', 2015, 10, 2, '2014-12-16 06:43:10', 1, 1, 1, 1),
(92, 'test', 'test', '83180160', 'ccamposcr@gmail.com', 1, 1, 0, '08-09', 2015, 10, 9, '2014-12-16 06:43:10', 1, 1, 1, 1),
(93, 'test', 'test', '83180160', 'ccamposcr@gmail.com', 1, 1, 0, '08-09', 2015, 10, 16, '2014-12-16 06:43:10', 1, 1, 1, 1),
(94, 'test', 'test', '83180160', 'ccamposcr@gmail.com', 1, 1, 0, '08-09', 2015, 10, 23, '2014-12-16 06:43:11', 1, 1, 1, 1),
(95, 'test', 'test', '83180160', 'ccamposcr@gmail.com', 1, 1, 0, '08-09', 2015, 10, 30, '2014-12-16 06:43:11', 1, 1, 1, 1),
(96, 'test', 'test', '83180160', 'ccamposcr@gmail.com', 1, 1, 0, '08-09', 2015, 11, 6, '2014-12-16 06:43:11', 1, 1, 1, 1),
(97, 'test', 'test', '83180160', 'ccamposcr@gmail.com', 1, 1, 0, '08-09', 2015, 11, 13, '2014-12-16 06:43:11', 1, 1, 1, 1),
(98, 'test', 'test', '83180160', 'ccamposcr@gmail.com', 1, 1, 0, '08-09', 2015, 11, 20, '2014-12-16 06:43:11', 1, 1, 1, 1),
(99, 'test', 'test', '83180160', 'ccamposcr@gmail.com', 1, 1, 0, '08-09', 2015, 11, 27, '2014-12-16 06:43:11', 1, 1, 1, 1),
(100, 'test', 'test', '83180160', 'ccamposcr@gmail.com', 1, 1, 0, '08-09', 2015, 12, 4, '2014-12-16 06:43:12', 1, 1, 1, 1),
(101, 'test', 'test', '83180160', 'ccamposcr@gmail.com', 1, 1, 0, '08-09', 2015, 12, 11, '2014-12-16 06:43:12', 1, 1, 1, 1),
(102, 'test', 'test', '83180160', 'ccamposcr@gmail.com', 1, 1, 0, '08-09', 2015, 12, 18, '2014-12-16 06:43:12', 1, 1, 1, 1),
(103, 'test', 'test', '83180160', 'ccamposcr@gmail.com', 1, 1, 0, '08-09', 2015, 12, 25, '2014-12-16 06:43:12', 1, 1, 1, 1),
(104, 'test', 'test', '83180160', 'ccamposcr@gmail.com', 1, 1, 0, '08-09', 2016, 1, 1, '2014-12-16 06:43:12', 1, 1, 1, 1),
(105, 'test', 'test', '83180160', 'ccamposcr@gmail.com', 1, 1, 0, '08-09', 2015, 1, 3, '2014-12-16 06:45:18', 1, 1, 1, 1),
(106, 'test', 'test', '83180160', 'ccamposcr@gmail.com', 1, 1, 0, '08-09', 2015, 1, 10, '2014-12-16 06:45:19', 1, 1, 1, 1),
(107, 'test', 'test', '83180160', 'ccamposcr@gmail.com', 1, 1, 0, '08-09', 2015, 1, 17, '2014-12-16 06:45:19', 1, 1, 1, 1),
(108, 'test', 'test', '83180160', 'ccamposcr@gmail.com', 1, 1, 0, '08-09', 2015, 1, 24, '2014-12-16 06:45:19', 1, 1, 1, 1),
(109, 'test', 'test', '83180160', 'ccamposcr@gmail.com', 1, 1, 0, '08-09', 2015, 1, 31, '2014-12-16 06:45:19', 1, 1, 1, 1),
(110, 'test', 'test', '83180160', 'ccamposcr@gmail.com', 1, 1, 0, '08-09', 2015, 2, 7, '2014-12-16 06:45:19', 1, 1, 1, 1),
(111, 'test', 'test', '83180160', 'ccamposcr@gmail.com', 1, 1, 0, '08-09', 2015, 2, 14, '2014-12-16 06:45:19', 1, 1, 1, 1),
(112, 'test', 'test', '83180160', 'ccamposcr@gmail.com', 1, 1, 0, '08-09', 2015, 2, 21, '2014-12-16 06:45:20', 1, 1, 1, 1),
(113, 'test', 'test', '83180160', 'ccamposcr@gmail.com', 1, 1, 0, '08-09', 2015, 2, 28, '2014-12-16 06:45:20', 1, 1, 1, 1),
(114, 'test', 'test', '83180160', 'ccamposcr@gmail.com', 1, 1, 0, '08-09', 2015, 3, 7, '2014-12-16 06:45:20', 1, 1, 1, 1),
(115, 'test', 'test', '83180160', 'ccamposcr@gmail.com', 1, 1, 0, '08-09', 2015, 3, 14, '2014-12-16 06:45:20', 1, 1, 1, 1),
(116, 'test', 'test', '83180160', 'ccamposcr@gmail.com', 1, 1, 0, '08-09', 2015, 3, 21, '2014-12-16 06:45:20', 1, 1, 1, 1),
(117, 'test', 'test', '83180160', 'ccamposcr@gmail.com', 1, 1, 0, '08-09', 2015, 3, 28, '2014-12-16 06:45:21', 1, 1, 1, 1),
(118, 'test', 'test', '83180160', 'ccamposcr@gmail.com', 1, 1, 0, '08-09', 2015, 4, 4, '2014-12-16 06:45:21', 1, 1, 1, 1),
(119, 'test', 'test', '83180160', 'ccamposcr@gmail.com', 1, 1, 0, '08-09', 2015, 4, 11, '2014-12-16 06:45:21', 1, 1, 1, 1),
(120, 'test', 'test', '83180160', 'ccamposcr@gmail.com', 1, 1, 0, '08-09', 2015, 4, 18, '2014-12-16 06:45:21', 1, 1, 1, 1),
(121, 'test', 'test', '83180160', 'ccamposcr@gmail.com', 1, 1, 0, '08-09', 2015, 4, 25, '2014-12-16 06:45:21', 1, 1, 1, 1),
(122, 'test', 'test', '83180160', 'ccamposcr@gmail.com', 1, 1, 0, '08-09', 2015, 5, 2, '2014-12-16 06:45:21', 1, 1, 1, 1),
(123, 'test', 'test', '83180160', 'ccamposcr@gmail.com', 1, 1, 0, '08-09', 2015, 5, 9, '2014-12-16 06:45:22', 1, 1, 1, 1),
(124, 'test', 'test', '83180160', 'ccamposcr@gmail.com', 1, 1, 0, '08-09', 2015, 5, 16, '2014-12-16 06:45:22', 1, 1, 1, 1),
(125, 'test', 'test', '83180160', 'ccamposcr@gmail.com', 1, 1, 0, '08-09', 2015, 5, 23, '2014-12-16 06:45:22', 1, 1, 1, 1),
(126, 'test', 'test', '83180160', 'ccamposcr@gmail.com', 1, 1, 0, '08-09', 2015, 5, 30, '2014-12-16 06:45:22', 1, 1, 1, 1),
(127, 'test', 'test', '83180160', 'ccamposcr@gmail.com', 1, 1, 0, '08-09', 2015, 6, 6, '2014-12-16 06:45:22', 1, 1, 1, 1),
(128, 'test', 'test', '83180160', 'ccamposcr@gmail.com', 1, 1, 0, '08-09', 2015, 6, 13, '2014-12-16 06:45:23', 1, 1, 1, 1),
(129, 'test', 'test', '83180160', 'ccamposcr@gmail.com', 1, 1, 0, '08-09', 2015, 6, 20, '2014-12-16 06:45:23', 1, 1, 1, 1),
(130, 'test', 'test', '83180160', 'ccamposcr@gmail.com', 1, 1, 0, '08-09', 2015, 6, 27, '2014-12-16 06:45:23', 1, 1, 1, 1),
(131, 'test', 'test', '83180160', 'ccamposcr@gmail.com', 1, 1, 0, '08-09', 2015, 7, 4, '2014-12-16 06:45:23', 1, 1, 1, 1),
(132, 'test', 'test', '83180160', 'ccamposcr@gmail.com', 1, 1, 0, '08-09', 2015, 7, 11, '2014-12-16 06:45:23', 1, 1, 1, 1),
(133, 'test', 'test', '83180160', 'ccamposcr@gmail.com', 1, 1, 0, '08-09', 2015, 7, 18, '2014-12-16 06:45:23', 1, 1, 1, 1),
(134, 'test', 'test', '83180160', 'ccamposcr@gmail.com', 1, 1, 0, '08-09', 2015, 7, 25, '2014-12-16 06:45:24', 1, 1, 1, 1),
(135, 'test', 'test', '83180160', 'ccamposcr@gmail.com', 1, 1, 0, '08-09', 2015, 8, 1, '2014-12-16 06:45:24', 1, 1, 1, 1),
(136, 'test', 'test', '83180160', 'ccamposcr@gmail.com', 1, 1, 0, '08-09', 2015, 8, 8, '2014-12-16 06:45:24', 1, 1, 1, 1),
(137, 'test', 'test', '83180160', 'ccamposcr@gmail.com', 1, 1, 0, '08-09', 2015, 8, 15, '2014-12-16 06:45:24', 1, 1, 1, 1),
(138, 'test', 'test', '83180160', 'ccamposcr@gmail.com', 1, 1, 0, '08-09', 2015, 8, 22, '2014-12-16 06:45:24', 1, 1, 1, 1),
(139, 'test', 'test', '83180160', 'ccamposcr@gmail.com', 1, 1, 0, '08-09', 2015, 8, 29, '2014-12-16 06:45:24', 1, 1, 1, 1),
(140, 'test', 'test', '83180160', 'ccamposcr@gmail.com', 1, 1, 0, '08-09', 2015, 9, 5, '2014-12-16 06:45:25', 1, 1, 1, 1),
(141, 'test', 'test', '83180160', 'ccamposcr@gmail.com', 1, 1, 0, '08-09', 2015, 9, 12, '2014-12-16 06:45:25', 1, 1, 1, 1),
(142, 'test', 'test', '83180160', 'ccamposcr@gmail.com', 1, 1, 0, '08-09', 2015, 9, 19, '2014-12-16 06:45:25', 1, 1, 1, 1),
(143, 'test', 'test', '83180160', 'ccamposcr@gmail.com', 1, 1, 0, '08-09', 2015, 9, 26, '2014-12-16 06:45:25', 1, 1, 1, 1),
(144, 'test', 'test', '83180160', 'ccamposcr@gmail.com', 1, 1, 0, '08-09', 2015, 10, 3, '2014-12-16 06:45:25', 1, 1, 1, 1),
(145, 'test', 'test', '83180160', 'ccamposcr@gmail.com', 1, 1, 0, '08-09', 2015, 10, 10, '2014-12-16 06:45:26', 1, 1, 1, 1),
(146, 'test', 'test', '83180160', 'ccamposcr@gmail.com', 1, 1, 0, '08-09', 2015, 10, 17, '2014-12-16 06:45:26', 1, 1, 1, 1),
(147, 'test', 'test', '83180160', 'ccamposcr@gmail.com', 1, 1, 0, '08-09', 2015, 10, 24, '2014-12-16 06:45:26', 1, 1, 1, 1),
(148, 'test', 'test', '83180160', 'ccamposcr@gmail.com', 1, 1, 0, '08-09', 2015, 10, 31, '2014-12-16 06:45:26', 1, 1, 1, 1),
(149, 'test', 'test', '83180160', 'ccamposcr@gmail.com', 1, 1, 0, '08-09', 2015, 11, 7, '2014-12-16 06:45:26', 1, 1, 1, 1),
(150, 'test', 'test', '83180160', 'ccamposcr@gmail.com', 1, 1, 0, '08-09', 2015, 11, 14, '2014-12-16 06:45:26', 1, 1, 1, 1),
(151, 'test', 'test', '83180160', 'ccamposcr@gmail.com', 1, 1, 0, '08-09', 2015, 11, 21, '2014-12-16 06:45:27', 1, 1, 1, 1),
(152, 'test', 'test', '83180160', 'ccamposcr@gmail.com', 1, 1, 0, '08-09', 2015, 11, 28, '2014-12-16 06:45:27', 1, 1, 1, 1),
(153, 'test', 'test', '83180160', 'ccamposcr@gmail.com', 1, 1, 0, '08-09', 2015, 12, 5, '2014-12-16 06:45:27', 1, 1, 1, 1),
(154, 'test', 'test', '83180160', 'ccamposcr@gmail.com', 1, 1, 0, '08-09', 2015, 12, 12, '2014-12-16 06:45:27', 1, 1, 1, 1),
(155, 'test', 'test', '83180160', 'ccamposcr@gmail.com', 1, 1, 0, '08-09', 2015, 12, 19, '2014-12-16 06:45:27', 1, 1, 1, 1),
(156, 'test', 'test', '83180160', 'ccamposcr@gmail.com', 1, 1, 0, '08-09', 2015, 12, 26, '2014-12-16 06:45:27', 1, 1, 1, 1),
(157, 'test', 'test', '83180160', 'ccamposcr@gmail.com', 1, 1, 0, '08-09', 2016, 1, 2, '2014-12-16 06:45:28', 1, 1, 1, 1),
(158, 'domingos', 'domingos', '83180160', 'ccampos_cr@hotmail.com', 1, 2, 0, '08-09', 2015, 1, 4, '2014-12-16 06:46:41', 1, 1, 1, 1),
(159, 'domingos', 'domingos', '83180160', 'ccampos_cr@hotmail.com', 1, 2, 0, '08-09', 2015, 1, 18, '2014-12-16 06:46:41', 1, 1, 1, 1),
(160, 'domingos', 'domingos', '83180160', 'ccampos_cr@hotmail.com', 1, 2, 0, '08-09', 2015, 1, 11, '2014-12-16 06:46:41', 1, 1, 1, 1),
(161, 'domingos', 'domingos', '83180160', 'ccampos_cr@hotmail.com', 1, 2, 0, '08-09', 2015, 1, 25, '2014-12-16 06:46:41', 1, 1, 1, 1),
(162, 'domingos', 'domingos', '83180160', 'ccampos_cr@hotmail.com', 1, 2, 0, '08-09', 2015, 2, 1, '2014-12-16 06:46:41', 1, 1, 1, 1),
(163, 'domingos', 'domingos', '83180160', 'ccampos_cr@hotmail.com', 1, 2, 0, '08-09', 2015, 2, 8, '2014-12-16 06:46:41', 1, 1, 1, 1),
(164, 'domingos', 'domingos', '83180160', 'ccampos_cr@hotmail.com', 1, 2, 0, '08-09', 2015, 2, 15, '2014-12-16 06:46:41', 1, 1, 1, 1),
(165, 'domingos', 'domingos', '83180160', 'ccampos_cr@hotmail.com', 1, 2, 0, '08-09', 2015, 2, 22, '2014-12-16 06:46:41', 1, 1, 1, 1),
(166, 'domingos', 'domingos', '83180160', 'ccampos_cr@hotmail.com', 1, 2, 0, '08-09', 2015, 3, 8, '2014-12-16 06:46:41', 1, 1, 1, 1),
(167, 'domingos', 'domingos', '83180160', 'ccampos_cr@hotmail.com', 1, 2, 0, '08-09', 2015, 3, 1, '2014-12-16 06:46:41', 1, 1, 1, 1),
(168, 'domingos', 'domingos', '83180160', 'ccampos_cr@hotmail.com', 1, 2, 0, '08-09', 2015, 3, 15, '2014-12-16 06:46:41', 1, 1, 1, 1),
(169, 'domingos', 'domingos', '83180160', 'ccampos_cr@hotmail.com', 1, 2, 0, '08-09', 2015, 3, 22, '2014-12-16 06:46:41', 1, 1, 1, 1),
(170, 'domingos', 'domingos', '83180160', 'ccampos_cr@hotmail.com', 1, 2, 0, '08-09', 2015, 3, 29, '2014-12-16 06:46:41', 1, 1, 1, 1),
(171, 'domingos', 'domingos', '83180160', 'ccampos_cr@hotmail.com', 1, 2, 0, '08-09', 2015, 4, 5, '2014-12-16 06:46:41', 1, 1, 1, 1),
(172, 'domingos', 'domingos', '83180160', 'ccampos_cr@hotmail.com', 1, 2, 0, '08-09', 2015, 4, 12, '2014-12-16 06:46:42', 1, 1, 1, 1),
(173, 'domingos', 'domingos', '83180160', 'ccampos_cr@hotmail.com', 1, 2, 0, '08-09', 2015, 4, 19, '2014-12-16 06:46:42', 1, 1, 1, 1),
(174, 'domingos', 'domingos', '83180160', 'ccampos_cr@hotmail.com', 1, 2, 0, '08-09', 2015, 4, 26, '2014-12-16 06:46:42', 1, 1, 1, 1),
(175, 'domingos', 'domingos', '83180160', 'ccampos_cr@hotmail.com', 1, 2, 0, '08-09', 2015, 5, 17, '2014-12-16 06:46:42', 1, 1, 1, 1),
(176, 'domingos', 'domingos', '83180160', 'ccampos_cr@hotmail.com', 1, 2, 0, '08-09', 2015, 5, 3, '2014-12-16 06:46:42', 1, 1, 1, 1),
(177, 'domingos', 'domingos', '83180160', 'ccampos_cr@hotmail.com', 1, 2, 0, '08-09', 2015, 5, 31, '2014-12-16 06:46:42', 1, 1, 1, 1),
(178, 'domingos', 'domingos', '83180160', 'ccampos_cr@hotmail.com', 1, 2, 0, '08-09', 2015, 5, 10, '2014-12-16 06:46:42', 1, 1, 1, 1),
(179, 'domingos', 'domingos', '83180160', 'ccampos_cr@hotmail.com', 1, 2, 0, '08-09', 2015, 5, 24, '2014-12-16 06:46:42', 1, 1, 1, 1),
(180, 'domingos', 'domingos', '83180160', 'ccampos_cr@hotmail.com', 1, 2, 0, '08-09', 2015, 6, 7, '2014-12-16 06:46:42', 1, 1, 1, 1),
(181, 'domingos', 'domingos', '83180160', 'ccampos_cr@hotmail.com', 1, 2, 0, '08-09', 2015, 6, 14, '2014-12-16 06:46:42', 1, 1, 1, 1),
(182, 'domingos', 'domingos', '83180160', 'ccampos_cr@hotmail.com', 1, 2, 0, '08-09', 2015, 6, 28, '2014-12-16 06:46:42', 1, 1, 1, 1),
(183, 'domingos', 'domingos', '83180160', 'ccampos_cr@hotmail.com', 1, 2, 0, '08-09', 2015, 8, 2, '2014-12-16 06:46:42', 1, 1, 1, 1),
(184, 'domingos', 'domingos', '83180160', 'ccampos_cr@hotmail.com', 1, 2, 0, '08-09', 2015, 7, 19, '2014-12-16 06:46:42', 1, 1, 1, 1),
(185, 'domingos', 'domingos', '83180160', 'ccampos_cr@hotmail.com', 1, 2, 0, '08-09', 2015, 8, 23, '2014-12-16 06:46:42', 1, 1, 1, 1),
(186, 'domingos', 'domingos', '83180160', 'ccampos_cr@hotmail.com', 1, 2, 0, '08-09', 2015, 7, 12, '2014-12-16 06:46:42', 1, 1, 1, 1),
(187, 'domingos', 'domingos', '83180160', 'ccampos_cr@hotmail.com', 1, 2, 0, '08-09', 2015, 8, 16, '2014-12-16 06:46:42', 1, 1, 1, 1),
(188, 'domingos', 'domingos', '83180160', 'ccampos_cr@hotmail.com', 1, 2, 0, '08-09', 2015, 8, 9, '2014-12-16 06:46:42', 1, 1, 1, 1),
(189, 'domingos', 'domingos', '83180160', 'ccampos_cr@hotmail.com', 1, 2, 0, '08-09', 2015, 7, 26, '2014-12-16 06:46:42', 1, 1, 1, 1),
(190, 'domingos', 'domingos', '83180160', 'ccampos_cr@hotmail.com', 1, 2, 0, '08-09', 2015, 8, 30, '2014-12-16 06:46:42', 1, 1, 1, 1),
(191, 'domingos', 'domingos', '83180160', 'ccampos_cr@hotmail.com', 1, 2, 0, '08-09', 2015, 9, 13, '2014-12-16 06:46:42', 1, 1, 1, 1),
(192, 'domingos', 'domingos', '83180160', 'ccampos_cr@hotmail.com', 1, 2, 0, '08-09', 2015, 9, 20, '2014-12-16 06:46:42', 1, 1, 1, 1),
(193, 'domingos', 'domingos', '83180160', 'ccampos_cr@hotmail.com', 1, 2, 0, '08-09', 2015, 10, 25, '2014-12-16 06:46:42', 1, 1, 1, 1),
(194, 'domingos', 'domingos', '83180160', 'ccampos_cr@hotmail.com', 1, 2, 0, '08-09', 2015, 11, 8, '2014-12-16 06:46:42', 1, 1, 1, 1),
(195, 'domingos', 'domingos', '83180160', 'ccampos_cr@hotmail.com', 1, 2, 0, '08-09', 2015, 10, 4, '2014-12-16 06:46:42', 1, 1, 1, 1),
(196, 'domingos', 'domingos', '83180160', 'ccampos_cr@hotmail.com', 1, 2, 0, '08-09', 2015, 10, 18, '2014-12-16 06:46:42', 1, 1, 1, 1),
(197, 'domingos', 'domingos', '83180160', 'ccampos_cr@hotmail.com', 1, 2, 0, '08-09', 2015, 11, 1, '2014-12-16 06:46:42', 1, 1, 1, 1),
(198, 'domingos', 'domingos', '83180160', 'ccampos_cr@hotmail.com', 1, 2, 0, '08-09', 2015, 10, 11, '2014-12-16 06:46:42', 1, 1, 1, 1),
(199, 'domingos', 'domingos', '83180160', 'ccampos_cr@hotmail.com', 1, 2, 0, '08-09', 2015, 9, 27, '2014-12-16 06:46:42', 1, 1, 1, 1),
(200, 'domingos', 'domingos', '83180160', 'ccampos_cr@hotmail.com', 1, 2, 0, '08-09', 2015, 11, 22, '2014-12-16 06:46:42', 1, 1, 1, 1),
(201, 'domingos', 'domingos', '83180160', 'ccampos_cr@hotmail.com', 1, 2, 0, '08-09', 2015, 7, 5, '2014-12-16 06:46:42', 1, 1, 1, 1),
(202, 'domingos', 'domingos', '83180160', 'ccampos_cr@hotmail.com', 1, 2, 0, '08-09', 2015, 11, 29, '2014-12-16 06:46:42', 1, 1, 1, 1),
(203, 'domingos', 'domingos', '83180160', 'ccampos_cr@hotmail.com', 1, 2, 0, '08-09', 2015, 11, 15, '2014-12-16 06:46:42', 1, 1, 1, 1),
(204, 'domingos', 'domingos', '83180160', 'ccampos_cr@hotmail.com', 1, 2, 0, '08-09', 2015, 6, 21, '2014-12-16 06:46:42', 1, 1, 1, 1),
(205, 'domingos', 'domingos', '83180160', 'ccampos_cr@hotmail.com', 1, 2, 0, '08-09', 2015, 9, 6, '2014-12-16 06:46:42', 1, 1, 1, 1),
(206, 'domingos', 'domingos', '83180160', 'ccampos_cr@hotmail.com', 1, 2, 0, '08-09', 2015, 12, 6, '2014-12-16 06:46:42', 1, 1, 1, 1),
(207, 'domingos', 'domingos', '83180160', 'ccampos_cr@hotmail.com', 1, 2, 0, '08-09', 2015, 12, 13, '2014-12-16 06:46:42', 1, 1, 1, 1),
(208, 'domingos', 'domingos', '83180160', 'ccampos_cr@hotmail.com', 1, 2, 0, '08-09', 2016, 1, 3, '2014-12-16 06:46:42', 1, 1, 1, 1),
(209, 'domingos', 'domingos', '83180160', 'ccampos_cr@hotmail.com', 1, 2, 0, '08-09', 2015, 12, 27, '2014-12-16 06:46:42', 1, 1, 1, 1),
(210, 'domingos', 'domingos', '83180160', 'ccampos_cr@hotmail.com', 1, 2, 0, '08-09', 2015, 12, 20, '2014-12-16 06:46:42', 1, 1, 1, 1),
(211, 'jueves', 'jueves', '83180160', 'jrgherrera@gmail.com', 1, 1, 0, '08-09', 2015, 3, 5, '2014-12-16 07:30:24', 1, 1, 1, 1),
(212, 'jueves', 'jueves', '83180160', 'jrgherrera@gmail.com', 1, 1, 0, '08-09', 2015, 3, 19, '2014-12-16 07:30:24', 1, 1, 1, 1),
(213, 'jueves', 'jueves', '83180160', 'jrgherrera@gmail.com', 1, 1, 0, '08-09', 2015, 3, 12, '2014-12-16 07:30:24', 1, 1, 1, 1),
(214, 'jueves', 'jueves', '83180160', 'jrgherrera@gmail.com', 1, 1, 0, '08-09', 2015, 4, 9, '2014-12-16 07:30:24', 1, 1, 1, 1),
(215, 'jueves', 'jueves', '83180160', 'jrgherrera@gmail.com', 1, 1, 0, '08-09', 2015, 3, 26, '2014-12-16 07:30:24', 1, 1, 1, 1),
(216, 'jueves', 'jueves', '83180160', 'jrgherrera@gmail.com', 1, 1, 0, '08-09', 2015, 4, 2, '2014-12-16 07:30:24', 1, 1, 1, 1),
(217, 'jueves', 'jueves', '83180160', 'jrgherrera@gmail.com', 1, 1, 0, '08-09', 2015, 4, 16, '2014-12-16 07:30:24', 1, 1, 1, 1),
(218, 'jueves', 'jueves', '83180160', 'jrgherrera@gmail.com', 1, 1, 0, '08-09', 2015, 4, 23, '2014-12-16 07:30:24', 1, 1, 1, 1),
(219, 'jueves', 'jueves', '83180160', 'jrgherrera@gmail.com', 1, 1, 0, '08-09', 2015, 4, 30, '2014-12-16 07:30:24', 1, 1, 1, 1),
(220, 'jueves', 'jueves', '83180160', 'jrgherrera@gmail.com', 1, 1, 0, '08-09', 2015, 5, 7, '2014-12-16 07:30:24', 1, 1, 1, 1),
(221, 'jueves', 'jueves', '83180160', 'jrgherrera@gmail.com', 1, 1, 0, '08-09', 2015, 6, 4, '2014-12-16 07:30:24', 1, 1, 1, 1),
(222, 'jueves', 'jueves', '83180160', 'jrgherrera@gmail.com', 1, 1, 0, '08-09', 2015, 5, 14, '2014-12-16 07:30:24', 1, 1, 1, 1),
(223, 'jueves', 'jueves', '83180160', 'jrgherrera@gmail.com', 1, 1, 0, '08-09', 2015, 5, 28, '2014-12-16 07:30:24', 1, 1, 1, 1),
(224, 'jueves', 'jueves', '83180160', 'jrgherrera@gmail.com', 1, 1, 0, '08-09', 2015, 5, 21, '2014-12-16 07:30:24', 1, 1, 1, 1),
(225, 'jueves', 'jueves', '83180160', 'jrgherrera@gmail.com', 1, 1, 0, '08-09', 2015, 6, 11, '2014-12-16 07:30:24', 1, 1, 1, 1),
(226, 'jueves', 'jueves', '83180160', 'jrgherrera@gmail.com', 1, 1, 0, '08-09', 2015, 6, 18, '2014-12-16 07:30:24', 1, 1, 1, 1),
(227, 'jueves', 'jueves', '83180160', 'jrgherrera@gmail.com', 1, 1, 0, '08-09', 2015, 6, 25, '2014-12-16 07:30:24', 1, 1, 1, 1),
(228, 'jueves', 'jueves', '83180160', 'jrgherrera@gmail.com', 1, 1, 0, '08-09', 2015, 7, 2, '2014-12-16 07:30:24', 1, 1, 1, 1),
(229, 'jueves', 'jueves', '83180160', 'jrgherrera@gmail.com', 1, 1, 0, '08-09', 2015, 7, 9, '2014-12-16 07:30:24', 1, 1, 1, 1),
(230, 'jueves', 'jueves', '83180160', 'jrgherrera@gmail.com', 1, 1, 0, '08-09', 2015, 7, 16, '2014-12-16 07:30:24', 1, 1, 1, 1),
(231, 'jueves', 'jueves', '83180160', 'jrgherrera@gmail.com', 1, 1, 0, '08-09', 2015, 7, 23, '2014-12-16 07:30:24', 1, 1, 1, 1),
(232, 'jueves', 'jueves', '83180160', 'jrgherrera@gmail.com', 1, 1, 0, '08-09', 2015, 7, 30, '2014-12-16 07:30:24', 1, 1, 1, 1),
(233, 'jueves', 'jueves', '83180160', 'jrgherrera@gmail.com', 1, 1, 0, '08-09', 2015, 8, 6, '2014-12-16 07:30:24', 1, 1, 1, 1),
(234, 'jueves', 'jueves', '83180160', 'jrgherrera@gmail.com', 1, 1, 0, '08-09', 2015, 8, 13, '2014-12-16 07:30:24', 1, 1, 1, 1),
(235, 'jueves', 'jueves', '83180160', 'jrgherrera@gmail.com', 1, 1, 0, '08-09', 2015, 8, 20, '2014-12-16 07:30:24', 1, 1, 1, 1),
(236, 'jueves', 'jueves', '83180160', 'jrgherrera@gmail.com', 1, 1, 0, '08-09', 2015, 8, 27, '2014-12-16 07:30:25', 1, 1, 1, 1),
(237, 'jueves', 'jueves', '83180160', 'jrgherrera@gmail.com', 1, 1, 0, '08-09', 2015, 9, 3, '2014-12-16 07:30:25', 1, 1, 1, 1),
(238, 'jueves', 'jueves', '83180160', 'jrgherrera@gmail.com', 1, 1, 0, '08-09', 2015, 9, 10, '2014-12-16 07:30:25', 1, 1, 1, 1),
(239, 'jueves', 'jueves', '83180160', 'jrgherrera@gmail.com', 1, 1, 0, '08-09', 2015, 9, 17, '2014-12-16 07:30:25', 1, 1, 1, 1),
(240, 'jueves', 'jueves', '83180160', 'jrgherrera@gmail.com', 1, 1, 0, '08-09', 2015, 9, 24, '2014-12-16 07:30:25', 1, 1, 1, 1),
(241, 'jueves', 'jueves', '83180160', 'jrgherrera@gmail.com', 1, 1, 0, '08-09', 2015, 10, 8, '2014-12-16 07:30:25', 1, 1, 1, 1),
(242, 'jueves', 'jueves', '83180160', 'jrgherrera@gmail.com', 1, 1, 0, '08-09', 2015, 10, 1, '2014-12-16 07:30:25', 1, 1, 1, 1),
(243, 'jueves', 'jueves', '83180160', 'jrgherrera@gmail.com', 1, 1, 0, '08-09', 2015, 10, 15, '2014-12-16 07:30:25', 1, 1, 1, 1),
(244, 'jueves', 'jueves', '83180160', 'jrgherrera@gmail.com', 1, 1, 0, '08-09', 2015, 10, 29, '2014-12-16 07:30:25', 1, 1, 1, 1),
(245, 'jueves', 'jueves', '83180160', 'jrgherrera@gmail.com', 1, 1, 0, '08-09', 2015, 10, 22, '2014-12-16 07:30:25', 1, 1, 1, 1),
(246, 'jueves', 'jueves', '83180160', 'jrgherrera@gmail.com', 1, 1, 0, '08-09', 2015, 11, 5, '2014-12-16 07:30:25', 1, 1, 1, 1),
(247, 'jueves', 'jueves', '83180160', 'jrgherrera@gmail.com', 1, 1, 0, '08-09', 2015, 11, 12, '2014-12-16 07:30:25', 1, 1, 1, 1),
(248, 'jueves', 'jueves', '83180160', 'jrgherrera@gmail.com', 1, 1, 0, '08-09', 2015, 11, 19, '2014-12-16 07:30:25', 1, 1, 1, 1),
(249, 'jueves', 'jueves', '83180160', 'jrgherrera@gmail.com', 1, 1, 0, '08-09', 2015, 11, 26, '2014-12-16 07:30:25', 1, 1, 1, 1),
(250, 'jueves', 'jueves', '83180160', 'jrgherrera@gmail.com', 1, 1, 0, '08-09', 2015, 12, 3, '2014-12-16 07:30:25', 1, 1, 1, 1),
(251, 'jueves', 'jueves', '83180160', 'jrgherrera@gmail.com', 1, 1, 0, '08-09', 2015, 12, 10, '2014-12-16 07:30:25', 1, 1, 1, 1),
(252, 'jueves', 'jueves', '83180160', 'jrgherrera@gmail.com', 1, 1, 0, '08-09', 2015, 12, 17, '2014-12-16 07:30:25', 1, 1, 1, 1),
(253, 'jueves', 'jueves', '83180160', 'jrgherrera@gmail.com', 1, 1, 0, '08-09', 2015, 12, 24, '2014-12-16 07:30:25', 1, 1, 1, 1),
(254, 'jueves', 'jueves', '83180160', 'jrgherrera@gmail.com', 1, 1, 0, '08-09', 2016, 1, 7, '2014-12-16 07:30:25', 1, 1, 1, 1),
(255, 'jueves', 'jueves', '83180160', 'jrgherrera@gmail.com', 1, 1, 0, '08-09', 2016, 1, 14, '2014-12-16 07:30:25', 1, 1, 1, 1),
(256, 'jueves', 'jueves', '83180160', 'jrgherrera@gmail.com', 1, 1, 0, '08-09', 2016, 1, 21, '2014-12-16 07:30:25', 1, 1, 1, 1),
(257, 'jueves', 'jueves', '83180160', 'jrgherrera@gmail.com', 1, 1, 0, '08-09', 2015, 12, 31, '2014-12-16 07:30:25', 1, 1, 1, 1),
(258, 'jueves', 'jueves', '83180160', 'jrgherrera@gmail.com', 1, 1, 0, '08-09', 2016, 2, 4, '2014-12-16 07:30:25', 1, 1, 1, 1),
(259, 'jueves', 'jueves', '83180160', 'jrgherrera@gmail.com', 1, 1, 0, '08-09', 2016, 1, 28, '2014-12-16 07:30:25', 1, 1, 1, 1),
(260, 'jueves', 'jueves', '83180160', 'jrgherrera@gmail.com', 1, 1, 0, '08-09', 2016, 2, 11, '2014-12-16 07:30:25', 1, 1, 1, 1),
(261, 'jueves', 'jueves', '83180160', 'jrgherrera@gmail.com', 1, 1, 0, '08-09', 2016, 2, 18, '2014-12-16 07:30:25', 1, 1, 1, 1),
(262, 'jueves', 'jueves', '83180160', 'jrgherrera@gmail.com', 1, 1, 0, '08-09', 2016, 3, 3, '2014-12-16 07:30:25', 1, 1, 1, 1),
(263, 'jueves', 'jueves', '83180160', 'jrgherrera@gmail.com', 1, 1, 0, '08-09', 2016, 2, 25, '2014-12-16 07:30:25', 1, 1, 1, 1),
(264, 'martes', 'martes', '83180160', 'ccamposcr@gmail.com', 1, 1, 0, '08-09', 2014, 12, 16, '2014-12-17 05:22:06', 1, 2, 2, 1),
(265, 'martes', 'martes', '83180160', 'ccamposcr@gmail.com', 1, 1, 0, '08-09', 2015, 1, 6, '2014-12-17 05:22:06', 1, 2, 2, 1),
(266, 'martes', 'martes', '83180160', 'ccamposcr@gmail.com', 1, 1, 0, '08-09', 2014, 12, 23, '2014-12-17 05:22:06', 1, 2, 2, 1),
(267, 'martes', 'martes', '83180160', 'ccamposcr@gmail.com', 1, 1, 0, '08-09', 2015, 1, 20, '2014-12-17 05:22:06', 1, 2, 2, 1),
(268, 'martes', 'martes', '83180160', 'ccamposcr@gmail.com', 1, 1, 0, '08-09', 2014, 12, 30, '2014-12-17 05:22:06', 1, 2, 2, 1),
(269, 'martes', 'martes', '83180160', 'ccamposcr@gmail.com', 1, 1, 0, '08-09', 2015, 1, 13, '2014-12-17 05:22:06', 1, 2, 2, 1),
(270, 'martes', 'martes', '83180160', 'ccamposcr@gmail.com', 1, 1, 0, '08-09', 2015, 1, 27, '2014-12-17 05:22:06', 1, 2, 2, 1),
(271, 'martes', 'martes', '83180160', 'ccamposcr@gmail.com', 1, 1, 0, '08-09', 2015, 2, 3, '2014-12-17 05:22:06', 1, 2, 2, 1),
(272, 'martes', 'martes', '83180160', 'ccamposcr@gmail.com', 1, 1, 0, '08-09', 2015, 2, 24, '2014-12-17 05:22:06', 1, 2, 2, 1),
(273, 'martes', 'martes', '83180160', 'ccamposcr@gmail.com', 1, 1, 0, '08-09', 2015, 2, 10, '2014-12-17 05:22:06', 1, 2, 2, 1),
(274, 'martes', 'martes', '83180160', 'ccamposcr@gmail.com', 1, 1, 0, '08-09', 2015, 2, 17, '2014-12-17 05:22:06', 1, 2, 2, 1),
(275, 'martes', 'martes', '83180160', 'ccamposcr@gmail.com', 1, 1, 0, '08-09', 2015, 3, 3, '2014-12-17 05:22:06', 1, 2, 2, 1),
(276, 'martes', 'martes', '83180160', 'ccamposcr@gmail.com', 1, 1, 0, '08-09', 2015, 3, 17, '2014-12-17 05:22:06', 1, 2, 2, 1),
(277, 'martes', 'martes', '83180160', 'ccamposcr@gmail.com', 1, 1, 0, '08-09', 2015, 3, 10, '2014-12-17 05:22:06', 1, 2, 2, 1),
(278, 'martes', 'martes', '83180160', 'ccamposcr@gmail.com', 1, 1, 0, '08-09', 2015, 3, 24, '2014-12-17 05:22:06', 1, 2, 2, 1),
(279, 'martes', 'martes', '83180160', 'ccamposcr@gmail.com', 1, 1, 0, '08-09', 2015, 3, 31, '2014-12-17 05:22:06', 1, 2, 2, 1),
(280, 'martes', 'martes', '83180160', 'ccamposcr@gmail.com', 1, 1, 0, '08-09', 2015, 4, 7, '2014-12-17 05:22:06', 1, 2, 2, 1),
(281, 'martes', 'martes', '83180160', 'ccamposcr@gmail.com', 1, 1, 0, '08-09', 2015, 4, 14, '2014-12-17 05:22:06', 1, 2, 2, 1),
(282, 'martes', 'martes', '83180160', 'ccamposcr@gmail.com', 1, 1, 0, '08-09', 2015, 4, 28, '2014-12-17 05:22:06', 1, 2, 2, 1),
(283, 'martes', 'martes', '83180160', 'ccamposcr@gmail.com', 1, 1, 0, '08-09', 2015, 4, 21, '2014-12-17 05:22:06', 1, 2, 2, 1),
(284, 'martes', 'martes', '83180160', 'ccamposcr@gmail.com', 1, 1, 0, '08-09', 2015, 5, 5, '2014-12-17 05:22:06', 1, 2, 2, 1),
(285, 'martes', 'martes', '83180160', 'ccamposcr@gmail.com', 1, 1, 0, '08-09', 2015, 5, 12, '2014-12-17 05:22:07', 1, 2, 2, 1),
(286, 'martes', 'martes', '83180160', 'ccamposcr@gmail.com', 1, 1, 0, '08-09', 2015, 5, 26, '2014-12-17 05:22:07', 1, 2, 2, 1),
(287, 'martes', 'martes', '83180160', 'ccamposcr@gmail.com', 1, 1, 0, '08-09', 2015, 5, 19, '2014-12-17 05:22:07', 1, 2, 2, 1),
(288, 'martes', 'martes', '83180160', 'ccamposcr@gmail.com', 1, 1, 0, '08-09', 2015, 6, 9, '2014-12-17 05:22:07', 1, 2, 2, 1),
(289, 'martes', 'martes', '83180160', 'ccamposcr@gmail.com', 1, 1, 0, '08-09', 2015, 6, 2, '2014-12-17 05:22:07', 1, 2, 2, 1),
(290, 'martes', 'martes', '83180160', 'ccamposcr@gmail.com', 1, 1, 0, '08-09', 2015, 6, 16, '2014-12-17 05:22:07', 1, 2, 2, 1),
(291, 'martes', 'martes', '83180160', 'ccamposcr@gmail.com', 1, 1, 0, '08-09', 2015, 6, 30, '2014-12-17 05:22:07', 1, 2, 2, 1),
(292, 'martes', 'martes', '83180160', 'ccamposcr@gmail.com', 1, 1, 0, '08-09', 2015, 6, 23, '2014-12-17 05:22:07', 1, 2, 2, 1),
(293, 'martes', 'martes', '83180160', 'ccamposcr@gmail.com', 1, 1, 0, '08-09', 2015, 7, 7, '2014-12-17 05:22:07', 1, 2, 2, 1),
(294, 'martes', 'martes', '83180160', 'ccamposcr@gmail.com', 1, 1, 0, '08-09', 2015, 7, 14, '2014-12-17 05:22:07', 1, 2, 2, 1),
(295, 'martes', 'martes', '83180160', 'ccamposcr@gmail.com', 1, 1, 0, '08-09', 2015, 7, 21, '2014-12-17 05:22:07', 1, 2, 2, 1),
(296, 'martes', 'martes', '83180160', 'ccamposcr@gmail.com', 1, 1, 0, '08-09', 2015, 8, 4, '2014-12-17 05:22:07', 1, 2, 2, 1),
(297, 'martes', 'martes', '83180160', 'ccamposcr@gmail.com', 1, 1, 0, '08-09', 2015, 7, 28, '2014-12-17 05:22:07', 1, 2, 2, 1),
(298, 'martes', 'martes', '83180160', 'ccamposcr@gmail.com', 1, 1, 0, '08-09', 2015, 8, 11, '2014-12-17 05:22:07', 1, 2, 2, 1),
(299, 'martes', 'martes', '83180160', 'ccamposcr@gmail.com', 1, 1, 0, '08-09', 2015, 8, 18, '2014-12-17 05:22:07', 1, 2, 2, 1),
(300, 'martes', 'martes', '83180160', 'ccamposcr@gmail.com', 1, 1, 0, '08-09', 2015, 8, 25, '2014-12-17 05:22:07', 1, 2, 2, 1),
(301, 'martes', 'martes', '83180160', 'ccamposcr@gmail.com', 1, 1, 0, '08-09', 2015, 9, 1, '2014-12-17 05:22:07', 1, 2, 2, 1),
(302, 'martes', 'martes', '83180160', 'ccamposcr@gmail.com', 1, 1, 0, '08-09', 2015, 9, 8, '2014-12-17 05:22:07', 1, 2, 2, 1),
(303, 'martes', 'martes', '83180160', 'ccamposcr@gmail.com', 1, 1, 0, '08-09', 2015, 9, 15, '2014-12-17 05:22:07', 1, 2, 2, 1),
(304, 'martes', 'martes', '83180160', 'ccamposcr@gmail.com', 1, 1, 0, '08-09', 2015, 9, 22, '2014-12-17 05:22:07', 1, 2, 2, 1),
(305, 'martes', 'martes', '83180160', 'ccamposcr@gmail.com', 1, 1, 0, '08-09', 2015, 9, 29, '2014-12-17 05:22:07', 1, 2, 2, 1),
(306, 'martes', 'martes', '83180160', 'ccamposcr@gmail.com', 1, 1, 0, '08-09', 2015, 10, 13, '2014-12-17 05:22:07', 1, 2, 2, 1),
(307, 'martes', 'martes', '83180160', 'ccamposcr@gmail.com', 1, 1, 0, '08-09', 2015, 10, 6, '2014-12-17 05:22:07', 1, 2, 2, 1),
(308, 'martes', 'martes', '83180160', 'ccamposcr@gmail.com', 1, 1, 0, '08-09', 2015, 10, 20, '2014-12-17 05:22:07', 1, 2, 2, 1),
(309, 'martes', 'martes', '83180160', 'ccamposcr@gmail.com', 1, 1, 0, '08-09', 2015, 10, 27, '2014-12-17 05:22:07', 1, 2, 2, 1),
(310, 'martes', 'martes', '83180160', 'ccamposcr@gmail.com', 1, 1, 0, '08-09', 2015, 11, 3, '2014-12-17 05:22:07', 1, 2, 2, 1),
(311, 'martes', 'martes', '83180160', 'ccamposcr@gmail.com', 1, 1, 0, '08-09', 2015, 11, 10, '2014-12-17 05:22:07', 1, 2, 2, 1),
(312, 'martes', 'martes', '83180160', 'ccamposcr@gmail.com', 1, 1, 0, '08-09', 2015, 11, 17, '2014-12-17 05:22:07', 1, 2, 2, 1),
(313, 'martes', 'martes', '83180160', 'ccamposcr@gmail.com', 1, 1, 0, '08-09', 2015, 11, 24, '2014-12-17 05:22:07', 1, 2, 2, 1),
(314, 'martes', 'martes', '83180160', 'ccamposcr@gmail.com', 1, 1, 0, '08-09', 2015, 12, 8, '2014-12-17 05:22:07', 1, 2, 2, 1),
(315, 'martes', 'martes', '83180160', 'ccamposcr@gmail.com', 1, 1, 0, '08-09', 2015, 12, 15, '2014-12-17 05:22:07', 1, 2, 2, 1),
(316, 'martes', 'martes', '83180160', 'ccamposcr@gmail.com', 1, 1, 0, '08-09', 2015, 12, 1, '2014-12-17 05:22:07', 1, 2, 2, 1),
(317, 'miercoles', 'miercoles', '83180160', 'ccampos_cr@hotmail.com', 1, 1, 0, '08-09', 2014, 12, 17, '2014-12-17 05:57:28', 1, 3, 2, 1),
(318, 'miercoles', 'miercoles', '83180160', 'ccampos_cr@hotmail.com', 1, 1, 0, '08-09', 2014, 12, 24, '2014-12-17 05:57:28', 1, 3, 2, 1),
(319, 'miercoles', 'miercoles', '83180160', 'ccampos_cr@hotmail.com', 1, 1, 0, '08-09', 2014, 12, 31, '2014-12-17 05:57:28', 1, 3, 2, 1),
(320, 'miercoles', 'miercoles', '83180160', 'ccampos_cr@hotmail.com', 1, 1, 0, '08-09', 2015, 1, 7, '2014-12-17 05:57:28', 1, 3, 2, 1),
(321, 'miercoles', 'miercoles', '83180160', 'ccampos_cr@hotmail.com', 1, 1, 0, '08-09', 2015, 1, 14, '2014-12-17 05:57:29', 1, 3, 2, 1),
(322, 'miercoles', 'miercoles', '83180160', 'ccampos_cr@hotmail.com', 1, 1, 0, '08-09', 2015, 1, 21, '2014-12-17 05:57:29', 1, 3, 2, 1),
(323, 'miercoles', 'miercoles', '83180160', 'ccampos_cr@hotmail.com', 1, 1, 0, '08-09', 2015, 1, 28, '2014-12-17 05:57:29', 1, 3, 2, 1),
(324, 'miercoles', 'miercoles', '83180160', 'ccampos_cr@hotmail.com', 1, 1, 0, '08-09', 2015, 2, 4, '2014-12-17 05:57:29', 1, 3, 2, 1),
(325, 'miercoles', 'miercoles', '83180160', 'ccampos_cr@hotmail.com', 1, 1, 0, '08-09', 2015, 2, 11, '2014-12-17 05:57:30', 1, 3, 2, 1),
(326, 'miercoles', 'miercoles', '83180160', 'ccampos_cr@hotmail.com', 1, 1, 0, '08-09', 2015, 2, 18, '2014-12-17 05:57:30', 1, 3, 2, 1),
(327, 'miercoles', 'miercoles', '83180160', 'ccampos_cr@hotmail.com', 1, 1, 0, '08-09', 2015, 2, 25, '2014-12-17 05:57:30', 1, 3, 2, 1),
(328, 'miercoles', 'miercoles', '83180160', 'ccampos_cr@hotmail.com', 1, 1, 0, '08-09', 2015, 3, 4, '2014-12-17 05:57:30', 1, 3, 2, 1),
(329, 'miercoles', 'miercoles', '83180160', 'ccampos_cr@hotmail.com', 1, 1, 0, '08-09', 2015, 3, 11, '2014-12-17 05:57:30', 1, 3, 2, 1),
(330, 'miercoles', 'miercoles', '83180160', 'ccampos_cr@hotmail.com', 1, 1, 0, '08-09', 2015, 3, 18, '2014-12-17 05:57:31', 1, 3, 2, 1),
(331, 'miercoles', 'miercoles', '83180160', 'ccampos_cr@hotmail.com', 1, 1, 0, '08-09', 2015, 3, 25, '2014-12-17 05:57:31', 1, 3, 2, 1),
(332, 'miercoles', 'miercoles', '83180160', 'ccampos_cr@hotmail.com', 1, 1, 0, '08-09', 2015, 4, 1, '2014-12-17 05:57:31', 1, 3, 2, 1),
(333, 'miercoles', 'miercoles', '83180160', 'ccampos_cr@hotmail.com', 1, 1, 0, '08-09', 2015, 4, 8, '2014-12-17 05:57:31', 1, 3, 2, 1),
(334, 'miercoles', 'miercoles', '83180160', 'ccampos_cr@hotmail.com', 1, 1, 0, '08-09', 2015, 4, 15, '2014-12-17 05:57:32', 1, 3, 2, 1),
(335, 'miercoles', 'miercoles', '83180160', 'ccampos_cr@hotmail.com', 1, 1, 0, '08-09', 2015, 4, 22, '2014-12-17 05:57:32', 1, 3, 2, 1),
(336, 'miercoles', 'miercoles', '83180160', 'ccampos_cr@hotmail.com', 1, 1, 0, '08-09', 2015, 4, 29, '2014-12-17 05:57:32', 1, 3, 2, 1),
(337, 'miercoles', 'miercoles', '83180160', 'ccampos_cr@hotmail.com', 1, 1, 0, '08-09', 2015, 5, 6, '2014-12-17 05:57:32', 1, 3, 2, 1),
(338, 'miercoles', 'miercoles', '83180160', 'ccampos_cr@hotmail.com', 1, 1, 0, '08-09', 2015, 5, 13, '2014-12-17 05:57:32', 1, 3, 2, 1),
(339, 'miercoles', 'miercoles', '83180160', 'ccampos_cr@hotmail.com', 1, 1, 0, '08-09', 2015, 5, 20, '2014-12-17 05:57:33', 1, 3, 2, 1),
(340, 'miercoles', 'miercoles', '83180160', 'ccampos_cr@hotmail.com', 1, 1, 0, '08-09', 2015, 5, 27, '2014-12-17 05:57:33', 1, 3, 2, 1),
(341, 'miercoles', 'miercoles', '83180160', 'ccampos_cr@hotmail.com', 1, 1, 0, '08-09', 2015, 6, 3, '2014-12-17 05:57:33', 1, 3, 2, 1),
(342, 'miercoles', 'miercoles', '83180160', 'ccampos_cr@hotmail.com', 1, 1, 0, '08-09', 2015, 6, 10, '2014-12-17 05:57:33', 1, 3, 2, 1),
(343, 'miercoles', 'miercoles', '83180160', 'ccampos_cr@hotmail.com', 1, 1, 0, '08-09', 2015, 6, 17, '2014-12-17 05:57:34', 1, 3, 2, 1),
(344, 'miercoles', 'miercoles', '83180160', 'ccampos_cr@hotmail.com', 1, 1, 0, '08-09', 2015, 6, 24, '2014-12-17 05:57:34', 1, 3, 2, 1),
(345, 'miercoles', 'miercoles', '83180160', 'ccampos_cr@hotmail.com', 1, 1, 0, '08-09', 2015, 7, 1, '2014-12-17 05:57:34', 1, 3, 2, 1),
(346, 'miercoles', 'miercoles', '83180160', 'ccampos_cr@hotmail.com', 1, 1, 0, '08-09', 2015, 7, 8, '2014-12-17 05:57:34', 1, 3, 2, 1),
(347, 'miercoles', 'miercoles', '83180160', 'ccampos_cr@hotmail.com', 1, 1, 0, '08-09', 2015, 7, 15, '2014-12-17 05:57:34', 1, 3, 2, 1),
(348, 'miercoles', 'miercoles', '83180160', 'ccampos_cr@hotmail.com', 1, 1, 0, '08-09', 2015, 7, 22, '2014-12-17 05:57:35', 1, 3, 2, 1),
(349, 'miercoles', 'miercoles', '83180160', 'ccampos_cr@hotmail.com', 1, 1, 0, '08-09', 2015, 7, 29, '2014-12-17 05:57:35', 1, 3, 2, 1),
(350, 'miercoles', 'miercoles', '83180160', 'ccampos_cr@hotmail.com', 1, 1, 0, '08-09', 2015, 8, 5, '2014-12-17 05:57:35', 1, 3, 2, 1),
(351, 'miercoles', 'miercoles', '83180160', 'ccampos_cr@hotmail.com', 1, 1, 0, '08-09', 2015, 8, 12, '2014-12-17 05:57:35', 1, 3, 2, 1),
(352, 'miercoles', 'miercoles', '83180160', 'ccampos_cr@hotmail.com', 1, 1, 0, '08-09', 2015, 8, 19, '2014-12-17 05:57:35', 1, 3, 2, 1),
(353, 'miercoles', 'miercoles', '83180160', 'ccampos_cr@hotmail.com', 1, 1, 0, '08-09', 2015, 8, 26, '2014-12-17 05:57:36', 1, 3, 2, 1),
(354, 'miercoles', 'miercoles', '83180160', 'ccampos_cr@hotmail.com', 1, 1, 0, '08-09', 2015, 9, 2, '2014-12-17 05:57:36', 1, 3, 2, 1),
(355, 'miercoles', 'miercoles', '83180160', 'ccampos_cr@hotmail.com', 1, 1, 0, '08-09', 2015, 9, 9, '2014-12-17 05:57:36', 1, 3, 2, 1),
(356, 'miercoles', 'miercoles', '83180160', 'ccampos_cr@hotmail.com', 1, 1, 0, '08-09', 2015, 9, 16, '2014-12-17 05:57:36', 1, 3, 2, 1),
(357, 'miercoles', 'miercoles', '83180160', 'ccampos_cr@hotmail.com', 1, 1, 0, '08-09', 2015, 9, 23, '2014-12-17 05:57:36', 1, 3, 2, 1),
(358, 'miercoles', 'miercoles', '83180160', 'ccampos_cr@hotmail.com', 1, 1, 0, '08-09', 2015, 9, 30, '2014-12-17 05:57:37', 1, 3, 2, 1),
(359, 'miercoles', 'miercoles', '83180160', 'ccampos_cr@hotmail.com', 1, 1, 0, '08-09', 2015, 10, 7, '2014-12-17 05:57:37', 1, 3, 2, 1),
(360, 'miercoles', 'miercoles', '83180160', 'ccampos_cr@hotmail.com', 1, 1, 0, '08-09', 2015, 10, 14, '2014-12-17 05:57:37', 1, 3, 2, 1),
(361, 'miercoles', 'miercoles', '83180160', 'ccampos_cr@hotmail.com', 1, 1, 0, '08-09', 2015, 10, 21, '2014-12-17 05:57:37', 1, 3, 2, 1),
(362, 'miercoles', 'miercoles', '83180160', 'ccampos_cr@hotmail.com', 1, 1, 0, '08-09', 2015, 10, 28, '2014-12-17 05:57:37', 1, 3, 2, 1),
(363, 'miercoles', 'miercoles', '83180160', 'ccampos_cr@hotmail.com', 1, 1, 0, '08-09', 2015, 11, 4, '2014-12-17 05:57:38', 1, 3, 2, 1),
(364, 'miercoles', 'miercoles', '83180160', 'ccampos_cr@hotmail.com', 1, 1, 0, '08-09', 2015, 11, 11, '2014-12-17 05:57:38', 1, 3, 2, 1),
(365, 'miercoles', 'miercoles', '83180160', 'ccampos_cr@hotmail.com', 1, 1, 0, '08-09', 2015, 11, 18, '2014-12-17 05:57:38', 1, 3, 2, 1),
(366, 'miercoles', 'miercoles', '83180160', 'ccampos_cr@hotmail.com', 1, 1, 0, '08-09', 2015, 11, 25, '2014-12-17 05:57:38', 1, 3, 2, 1),
(367, 'miercoles', 'miercoles', '83180160', 'ccampos_cr@hotmail.com', 1, 1, 0, '08-09', 2015, 12, 2, '2014-12-17 05:57:38', 1, 3, 2, 1),
(368, 'miercoles', 'miercoles', '83180160', 'ccampos_cr@hotmail.com', 1, 1, 0, '08-09', 2015, 12, 9, '2014-12-17 05:57:39', 1, 3, 2, 1),
(369, 'miercoles', 'miercoles', '83180160', 'ccampos_cr@hotmail.com', 1, 1, 0, '08-09', 2015, 12, 16, '2014-12-17 05:57:39', 1, 3, 2, 1),
(370, 'jueves', 'jueves', '83180160', 'ccampos_cr@hotmail.com', 1, 1, 0, '08-09', 2014, 12, 18, '2014-12-17 06:26:55', 1, 1, 2, 1),
(371, 'jueves', 'jueves', '83180160', 'ccampos_cr@hotmail.com', 1, 1, 0, '08-09', 2014, 12, 25, '2014-12-17 06:26:55', 1, 1, 2, 1),
(372, 'jueves', 'jueves', '83180160', 'ccampos_cr@hotmail.com', 1, 1, 0, '08-09', 2015, 1, 15, '2014-12-17 06:26:55', 1, 1, 2, 1),
(373, 'jueves', 'jueves', '83180160', 'ccampos_cr@hotmail.com', 1, 1, 0, '08-09', 2015, 1, 22, '2014-12-17 06:26:55', 1, 1, 2, 1),
(374, 'jueves', 'jueves', '83180160', 'ccampos_cr@hotmail.com', 1, 1, 0, '08-09', 2015, 1, 1, '2014-12-17 06:26:55', 1, 1, 2, 1),
(375, 'jueves', 'jueves', '83180160', 'ccampos_cr@hotmail.com', 1, 1, 0, '08-09', 2015, 1, 8, '2014-12-17 06:26:55', 1, 1, 2, 1),
(376, 'jueves', 'jueves', '83180160', 'ccampos_cr@hotmail.com', 1, 1, 0, '08-09', 2015, 1, 29, '2014-12-17 06:26:55', 1, 1, 2, 1),
(377, 'jueves', 'jueves', '83180160', 'ccampos_cr@hotmail.com', 1, 1, 0, '08-09', 2015, 2, 5, '2014-12-17 06:26:55', 1, 1, 2, 1),
(378, 'jueves', 'jueves', '83180160', 'ccampos_cr@hotmail.com', 1, 1, 0, '08-09', 2015, 2, 12, '2014-12-17 06:26:55', 1, 1, 2, 1),
(379, 'jueves', 'jueves', '83180160', 'ccampos_cr@hotmail.com', 1, 1, 0, '08-09', 2015, 2, 19, '2014-12-17 06:26:55', 1, 1, 2, 1),
(380, 'jueves', 'jueves', '83180160', 'ccampos_cr@hotmail.com', 1, 1, 0, '08-09', 2015, 2, 26, '2014-12-17 06:26:55', 1, 1, 2, 1),
(381, 'jueves', 'jueves', '83180160', 'ccampos_cr@hotmail.com', 1, 1, 0, '08-09', 2015, 3, 12, '2014-12-17 06:26:55', 1, 1, 2, 1),
(382, 'jueves', 'jueves', '83180160', 'ccampos_cr@hotmail.com', 1, 1, 0, '08-09', 2015, 3, 5, '2014-12-17 06:26:55', 1, 1, 2, 1),
(383, 'jueves', 'jueves', '83180160', 'ccampos_cr@hotmail.com', 1, 1, 0, '08-09', 2015, 3, 26, '2014-12-17 06:26:55', 1, 1, 2, 1),
(384, 'jueves', 'jueves', '83180160', 'ccampos_cr@hotmail.com', 1, 1, 0, '08-09', 2015, 3, 19, '2014-12-17 06:26:55', 1, 1, 2, 1),
(385, 'jueves', 'jueves', '83180160', 'ccampos_cr@hotmail.com', 1, 1, 0, '08-09', 2015, 4, 2, '2014-12-17 06:26:55', 1, 1, 2, 1),
(386, 'jueves', 'jueves', '83180160', 'ccampos_cr@hotmail.com', 1, 1, 0, '08-09', 2015, 4, 9, '2014-12-17 06:26:55', 1, 1, 2, 1),
(387, 'jueves', 'jueves', '83180160', 'ccampos_cr@hotmail.com', 1, 1, 0, '08-09', 2015, 4, 16, '2014-12-17 06:26:55', 1, 1, 2, 1),
(388, 'jueves', 'jueves', '83180160', 'ccampos_cr@hotmail.com', 1, 1, 0, '08-09', 2015, 4, 23, '2014-12-17 06:26:55', 1, 1, 2, 1),
(389, 'jueves', 'jueves', '83180160', 'ccampos_cr@hotmail.com', 1, 1, 0, '08-09', 2015, 4, 30, '2014-12-17 06:26:55', 1, 1, 2, 1),
(390, 'jueves', 'jueves', '83180160', 'ccampos_cr@hotmail.com', 1, 1, 0, '08-09', 2015, 5, 7, '2014-12-17 06:26:56', 1, 1, 2, 1),
(391, 'jueves', 'jueves', '83180160', 'ccampos_cr@hotmail.com', 1, 1, 0, '08-09', 2015, 5, 28, '2014-12-17 06:26:56', 1, 1, 2, 1),
(392, 'jueves', 'jueves', '83180160', 'ccampos_cr@hotmail.com', 1, 1, 0, '08-09', 2015, 5, 14, '2014-12-17 06:26:56', 1, 1, 2, 1),
(393, 'jueves', 'jueves', '83180160', 'ccampos_cr@hotmail.com', 1, 1, 0, '08-09', 2015, 6, 11, '2014-12-17 06:26:56', 1, 1, 2, 1),
(394, 'jueves', 'jueves', '83180160', 'ccampos_cr@hotmail.com', 1, 1, 0, '08-09', 2015, 6, 18, '2014-12-17 06:26:56', 1, 1, 2, 1),
(395, 'jueves', 'jueves', '83180160', 'ccampos_cr@hotmail.com', 1, 1, 0, '08-09', 2015, 6, 25, '2014-12-17 06:26:56', 1, 1, 2, 1),
(396, 'jueves', 'jueves', '83180160', 'ccampos_cr@hotmail.com', 1, 1, 0, '08-09', 2015, 7, 2, '2014-12-17 06:26:56', 1, 1, 2, 1),
(397, 'jueves', 'jueves', '83180160', 'ccampos_cr@hotmail.com', 1, 1, 0, '08-09', 2015, 5, 21, '2014-12-17 06:26:56', 1, 1, 2, 1),
(398, 'jueves', 'jueves', '83180160', 'ccampos_cr@hotmail.com', 1, 1, 0, '08-09', 2015, 7, 9, '2014-12-17 06:26:56', 1, 1, 2, 1),
(399, 'jueves', 'jueves', '83180160', 'ccampos_cr@hotmail.com', 1, 1, 0, '08-09', 2015, 6, 4, '2014-12-17 06:26:56', 1, 1, 2, 1),
(400, 'jueves', 'jueves', '83180160', 'ccampos_cr@hotmail.com', 1, 1, 0, '08-09', 2015, 7, 30, '2014-12-17 06:26:56', 1, 1, 2, 1),
(401, 'jueves', 'jueves', '83180160', 'ccampos_cr@hotmail.com', 1, 1, 0, '08-09', 2015, 7, 23, '2014-12-17 06:26:56', 1, 1, 2, 1),
(402, 'jueves', 'jueves', '83180160', 'ccampos_cr@hotmail.com', 1, 1, 0, '08-09', 2015, 7, 16, '2014-12-17 06:26:56', 1, 1, 2, 1),
(403, 'jueves', 'jueves', '83180160', 'ccampos_cr@hotmail.com', 1, 1, 0, '08-09', 2015, 8, 6, '2014-12-17 06:26:56', 1, 1, 2, 1),
(404, 'jueves', 'jueves', '83180160', 'ccampos_cr@hotmail.com', 1, 1, 0, '08-09', 2015, 8, 27, '2014-12-17 06:26:56', 1, 1, 2, 1),
(405, 'jueves', 'jueves', '83180160', 'ccampos_cr@hotmail.com', 1, 1, 0, '08-09', 2015, 9, 3, '2014-12-17 06:26:56', 1, 1, 2, 1),
(406, 'jueves', 'jueves', '83180160', 'ccampos_cr@hotmail.com', 1, 1, 0, '08-09', 2015, 10, 8, '2014-12-17 06:26:56', 1, 1, 2, 1),
(407, 'jueves', 'jueves', '83180160', 'ccampos_cr@hotmail.com', 1, 1, 0, '08-09', 2015, 9, 10, '2014-12-17 06:26:56', 1, 1, 2, 1),
(408, 'jueves', 'jueves', '83180160', 'ccampos_cr@hotmail.com', 1, 1, 0, '08-09', 2015, 8, 20, '2014-12-17 06:26:56', 1, 1, 2, 1),
(409, 'jueves', 'jueves', '83180160', 'ccampos_cr@hotmail.com', 1, 1, 0, '08-09', 2015, 10, 1, '2014-12-17 06:26:56', 1, 1, 2, 1),
(410, 'jueves', 'jueves', '83180160', 'ccampos_cr@hotmail.com', 1, 1, 0, '08-09', 2015, 8, 13, '2014-12-17 06:26:56', 1, 1, 2, 1),
(411, 'jueves', 'jueves', '83180160', 'ccampos_cr@hotmail.com', 1, 1, 0, '08-09', 2015, 9, 24, '2014-12-17 06:26:56', 1, 1, 2, 1),
(412, 'jueves', 'jueves', '83180160', 'ccampos_cr@hotmail.com', 1, 1, 0, '08-09', 2015, 9, 17, '2014-12-17 06:26:56', 1, 1, 2, 1),
(413, 'jueves', 'jueves', '83180160', 'ccampos_cr@hotmail.com', 1, 1, 0, '08-09', 2015, 10, 15, '2014-12-17 06:26:56', 1, 1, 2, 1),
(414, 'jueves', 'jueves', '83180160', 'ccampos_cr@hotmail.com', 1, 1, 0, '08-09', 2015, 11, 5, '2014-12-17 06:26:56', 1, 1, 2, 1),
(415, 'jueves', 'jueves', '83180160', 'ccampos_cr@hotmail.com', 1, 1, 0, '08-09', 2015, 10, 29, '2014-12-17 06:26:56', 1, 1, 2, 1),
(416, 'jueves', 'jueves', '83180160', 'ccampos_cr@hotmail.com', 1, 1, 0, '08-09', 2015, 11, 19, '2014-12-17 06:26:56', 1, 1, 2, 1),
(417, 'jueves', 'jueves', '83180160', 'ccampos_cr@hotmail.com', 1, 1, 0, '08-09', 2015, 11, 12, '2014-12-17 06:26:56', 1, 1, 2, 1),
(418, 'jueves', 'jueves', '83180160', 'ccampos_cr@hotmail.com', 1, 1, 0, '08-09', 2015, 10, 22, '2014-12-17 06:26:56', 1, 1, 2, 1),
(419, 'jueves', 'jueves', '83180160', 'ccampos_cr@hotmail.com', 1, 1, 0, '08-09', 2015, 11, 26, '2014-12-17 06:26:56', 1, 1, 2, 1),
(420, 'jueves', 'jueves', '83180160', 'ccampos_cr@hotmail.com', 1, 1, 0, '08-09', 2015, 12, 3, '2014-12-17 06:26:56', 1, 1, 2, 1),
(421, 'jueves', 'jueves', '83180160', 'ccampos_cr@hotmail.com', 1, 1, 0, '08-09', 2015, 12, 10, '2014-12-17 06:26:56', 1, 1, 2, 1);
INSERT INTO `t_reservations` (`id`, `name`, `lastname`, `phone`, `email`, `team_id`, `type_reservation`, `referee_required`, `reservation_time`, `reservation_year`, `reservation_month`, `reservation_day`, `reservation_made_time`, `reservation_price`, `pitch_id`, `group_id`, `active`) VALUES
(422, 'jueves', 'jueves', '83180160', 'ccampos_cr@hotmail.com', 1, 1, 0, '08-09', 2015, 12, 17, '2014-12-17 06:26:56', 1, 1, 2, 1),
(423, 'hackeado', 'test', '83180160', 'ccamposcr@gmail.com', 1, 1, 0, '08-09', 2014, 12, 17, '2014-12-17 18:01:26', 1, 1, 1, 1),
(424, 'SELECT * FROM t_reservations', 's', '83180160', 'ccampos_cr@hotmail.com', 1, 1, 0, '09-10', 2014, 12, 17, '2014-12-17 18:03:10', 1, 1, 1, 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `t_temporary_schedule`
--

CREATE TABLE IF NOT EXISTS `t_temporary_schedule` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `team_id` tinyint(4) NOT NULL,
  `reservation_time` varchar(100) NOT NULL,
  `reservation_year` smallint(6) NOT NULL,
  `reservation_month` tinyint(4) NOT NULL,
  `reservation_day` tinyint(4) NOT NULL,
  `pitch_id` smallint(6) NOT NULL,
  `group_id` smallint(6) NOT NULL,
  `state` tinyint(4) NOT NULL,
  `temporary_date_made` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=761 ;

--
-- Volcado de datos para la tabla `t_temporary_schedule`
--

INSERT INTO `t_temporary_schedule` (`id`, `team_id`, `reservation_time`, `reservation_year`, `reservation_month`, `reservation_day`, `pitch_id`, `group_id`, `state`, `temporary_date_made`) VALUES
(474, 1, '08-09', 2014, 12, 10, 1, 1, 5, '2014-12-11 04:14:23'),
(475, 1, '09-10', 2014, 12, 10, 1, 1, 5, '2014-12-11 05:00:17'),
(476, 2, '08-09', 2014, 12, 10, 1, 1, 5, '2014-12-11 04:59:44'),
(477, 1, '12-13', 2014, 12, 10, 1, 1, 3, '2014-12-11 04:31:59'),
(478, 1, '10-11', 2014, 12, 10, 1, 1, 5, '2014-12-11 05:00:56'),
(479, 1, '11-12', 2014, 12, 10, 1, 1, 3, '2014-12-11 21:41:20'),
(480, 1, '14-15', 2014, 12, 10, 1, 1, 3, '2014-12-11 05:41:35'),
(481, 1, '15-16', 2014, 12, 10, 1, 1, 3, '2014-12-11 05:42:43'),
(482, 1, '08-09', 2014, 12, 11, 2, 1, 3, '2014-12-11 06:00:18'),
(483, 1, '08-09', 2014, 12, 11, 2, 1, 3, '2014-12-11 06:00:20'),
(484, 1, '08-09', 2014, 12, 11, 2, 1, 5, '2014-12-11 06:00:39'),
(485, 1, '08-09', 2014, 12, 11, 1, 1, 3, '2014-12-12 05:50:41'),
(486, 1, '08-09', 2014, 12, 12, 1, 1, 5, '2014-12-12 06:18:37'),
(487, 1, '09-10', 2014, 12, 12, 1, 1, 3, '2014-12-12 06:19:33'),
(488, 1, '08-09', 2014, 12, 15, 1, 1, 3, '2014-12-16 05:43:29'),
(489, 1, '08-09', 2014, 12, 20, 2, 3, 3, '2014-12-16 01:57:04'),
(490, 1, '08-09', 2014, 12, 20, 2, 3, 3, '2014-12-16 01:57:05'),
(491, 1, '08-09', 2014, 12, 15, 2, 3, 3, '2014-12-16 02:02:30'),
(492, 1, '08-09', 2014, 12, 15, 2, 3, 3, '2014-12-16 02:02:31'),
(493, 1, '08-09', 2014, 12, 15, 2, 3, 5, '2014-12-16 02:05:47'),
(494, 1, '09-10', 2014, 12, 15, 2, 3, 3, '2014-12-16 02:06:39'),
(495, 1, '09-10', 2014, 12, 15, 2, 3, 3, '2014-12-16 02:06:40'),
(496, 1, '09-10', 2014, 12, 15, 2, 3, 5, '2014-12-16 02:06:44'),
(497, 2, '09-10', 2014, 12, 15, 2, 3, 3, '2014-12-16 02:06:51'),
(498, 2, '09-10', 2014, 12, 15, 2, 3, 3, '2014-12-16 02:06:53'),
(499, 2, '09-10', 2014, 12, 15, 2, 3, 5, '2014-12-16 02:06:55'),
(500, 1, '10-11', 2014, 12, 15, 2, 3, 3, '2014-12-16 02:07:42'),
(501, 1, '10-11', 2014, 12, 15, 2, 3, 3, '2014-12-16 02:07:43'),
(502, 1, '10-11', 2014, 12, 15, 2, 3, 5, '2014-12-16 02:07:45'),
(503, 1, '18-19', 2014, 12, 15, 2, 3, 3, '2014-12-16 02:07:49'),
(504, 1, '18-19', 2014, 12, 15, 2, 3, 3, '2014-12-16 02:07:50'),
(505, 1, '18-19', 2014, 12, 15, 2, 3, 5, '2014-12-16 02:07:52'),
(506, 1, '08-09', 2015, 1, 1, 1, 1, 5, '2014-12-16 05:54:02'),
(507, 1, '09-10', 2015, 1, 1, 1, 1, 5, '2014-12-16 05:55:59'),
(508, 1, '10-11', 2015, 1, 1, 1, 1, 5, '2014-12-16 05:58:16'),
(509, 1, '11-12', 2015, 1, 1, 1, 1, 3, '2014-12-16 06:02:41'),
(510, 1, '12-13', 2015, 1, 1, 1, 1, 3, '2014-12-16 06:03:54'),
(511, 1, '15-16', 2015, 1, 1, 1, 1, 5, '2014-12-16 06:28:10'),
(512, 1, '13-14', 2015, 1, 1, 1, 1, 5, '2014-12-16 06:17:45'),
(513, 1, '14-15', 2015, 1, 1, 1, 1, 5, '2014-12-16 06:26:55'),
(514, 1, '16-17', 2015, 1, 1, 1, 1, 5, '2014-12-16 06:29:23'),
(515, 1, '17-18', 2015, 1, 1, 1, 1, 5, '2014-12-16 06:40:32'),
(516, 1, '08-09', 2015, 1, 2, 1, 1, 5, '2014-12-16 06:43:03'),
(517, 1, '08-09', 2015, 1, 9, 1, 1, 5, '2014-12-16 06:43:03'),
(518, 1, '08-09', 2015, 1, 16, 1, 1, 5, '2014-12-16 06:43:03'),
(519, 1, '08-09', 2015, 1, 23, 1, 1, 5, '2014-12-16 06:43:03'),
(520, 1, '08-09', 2015, 1, 30, 1, 1, 5, '2014-12-16 06:43:04'),
(521, 1, '08-09', 2015, 2, 6, 1, 1, 5, '2014-12-16 06:43:04'),
(522, 1, '08-09', 2015, 2, 13, 1, 1, 5, '2014-12-16 06:43:04'),
(523, 1, '08-09', 2015, 2, 20, 1, 1, 5, '2014-12-16 06:43:04'),
(524, 1, '08-09', 2015, 2, 27, 1, 1, 5, '2014-12-16 06:43:04'),
(525, 1, '08-09', 2015, 3, 6, 1, 1, 5, '2014-12-16 06:43:05'),
(526, 1, '08-09', 2015, 3, 13, 1, 1, 5, '2014-12-16 06:43:05'),
(527, 1, '08-09', 2015, 3, 20, 1, 1, 5, '2014-12-16 06:43:05'),
(528, 1, '08-09', 2015, 3, 27, 1, 1, 5, '2014-12-16 06:43:05'),
(529, 1, '08-09', 2015, 4, 3, 1, 1, 5, '2014-12-16 06:43:05'),
(530, 1, '08-09', 2015, 4, 10, 1, 1, 5, '2014-12-16 06:43:06'),
(531, 1, '08-09', 2015, 4, 17, 1, 1, 5, '2014-12-16 06:43:06'),
(532, 1, '08-09', 2015, 4, 24, 1, 1, 5, '2014-12-16 06:43:06'),
(533, 1, '08-09', 2015, 5, 1, 1, 1, 5, '2014-12-16 06:43:06'),
(534, 1, '08-09', 2015, 5, 8, 1, 1, 5, '2014-12-16 06:43:06'),
(535, 1, '08-09', 2015, 5, 15, 1, 1, 5, '2014-12-16 06:43:07'),
(536, 1, '08-09', 2015, 5, 22, 1, 1, 5, '2014-12-16 06:43:07'),
(537, 1, '08-09', 2015, 5, 29, 1, 1, 5, '2014-12-16 06:43:07'),
(538, 1, '08-09', 2015, 6, 5, 1, 1, 5, '2014-12-16 06:43:07'),
(539, 1, '08-09', 2015, 6, 12, 1, 1, 5, '2014-12-16 06:43:07'),
(540, 1, '08-09', 2015, 6, 19, 1, 1, 5, '2014-12-16 06:43:08'),
(541, 1, '08-09', 2015, 6, 26, 1, 1, 5, '2014-12-16 06:43:08'),
(542, 1, '08-09', 2015, 7, 3, 1, 1, 5, '2014-12-16 06:43:08'),
(543, 1, '08-09', 2015, 7, 10, 1, 1, 5, '2014-12-16 06:43:08'),
(544, 1, '08-09', 2015, 7, 17, 1, 1, 5, '2014-12-16 06:43:08'),
(545, 1, '08-09', 2015, 7, 24, 1, 1, 5, '2014-12-16 06:43:09'),
(546, 1, '08-09', 2015, 7, 31, 1, 1, 5, '2014-12-16 06:43:09'),
(547, 1, '08-09', 2015, 8, 7, 1, 1, 5, '2014-12-16 06:43:09'),
(548, 1, '08-09', 2015, 8, 14, 1, 1, 5, '2014-12-16 06:43:09'),
(549, 1, '08-09', 2015, 8, 21, 1, 1, 5, '2014-12-16 06:43:09'),
(550, 1, '08-09', 2015, 8, 28, 1, 1, 5, '2014-12-16 06:43:09'),
(551, 1, '08-09', 2015, 9, 4, 1, 1, 5, '2014-12-16 06:43:10'),
(552, 1, '08-09', 2015, 9, 11, 1, 1, 5, '2014-12-16 06:43:10'),
(553, 1, '08-09', 2015, 9, 18, 1, 1, 5, '2014-12-16 06:43:10'),
(554, 1, '08-09', 2015, 9, 25, 1, 1, 5, '2014-12-16 06:43:10'),
(555, 1, '08-09', 2015, 10, 2, 1, 1, 5, '2014-12-16 06:43:10'),
(556, 1, '08-09', 2015, 10, 9, 1, 1, 5, '2014-12-16 06:43:10'),
(557, 1, '08-09', 2015, 10, 16, 1, 1, 5, '2014-12-16 06:43:11'),
(558, 1, '08-09', 2015, 10, 23, 1, 1, 5, '2014-12-16 06:43:11'),
(559, 1, '08-09', 2015, 10, 30, 1, 1, 5, '2014-12-16 06:43:11'),
(560, 1, '08-09', 2015, 11, 6, 1, 1, 5, '2014-12-16 06:43:11'),
(561, 1, '08-09', 2015, 11, 13, 1, 1, 5, '2014-12-16 06:43:11'),
(562, 1, '08-09', 2015, 11, 20, 1, 1, 5, '2014-12-16 06:43:11'),
(563, 1, '08-09', 2015, 11, 27, 1, 1, 5, '2014-12-16 06:43:12'),
(564, 1, '08-09', 2015, 12, 4, 1, 1, 5, '2014-12-16 06:43:12'),
(565, 1, '08-09', 2015, 12, 11, 1, 1, 5, '2014-12-16 06:43:12'),
(566, 1, '08-09', 2015, 12, 18, 1, 1, 5, '2014-12-16 06:43:12'),
(567, 1, '08-09', 2015, 12, 25, 1, 1, 5, '2014-12-16 06:43:12'),
(568, 1, '08-09', 2016, 1, 1, 1, 1, 5, '2014-12-16 06:43:12'),
(569, 1, '08-09', 2015, 1, 3, 1, 1, 5, '2014-12-16 06:45:19'),
(570, 1, '08-09', 2015, 1, 10, 1, 1, 5, '2014-12-16 06:45:19'),
(571, 1, '08-09', 2015, 1, 17, 1, 1, 5, '2014-12-16 06:45:19'),
(572, 1, '08-09', 2015, 1, 24, 1, 1, 5, '2014-12-16 06:45:19'),
(573, 1, '08-09', 2015, 1, 31, 1, 1, 5, '2014-12-16 06:45:19'),
(574, 1, '08-09', 2015, 2, 7, 1, 1, 5, '2014-12-16 06:45:19'),
(575, 1, '08-09', 2015, 2, 14, 1, 1, 5, '2014-12-16 06:45:20'),
(576, 1, '08-09', 2015, 2, 21, 1, 1, 5, '2014-12-16 06:45:20'),
(577, 1, '08-09', 2015, 2, 28, 1, 1, 5, '2014-12-16 06:45:20'),
(578, 1, '08-09', 2015, 3, 7, 1, 1, 5, '2014-12-16 06:45:20'),
(579, 1, '08-09', 2015, 3, 14, 1, 1, 5, '2014-12-16 06:45:20'),
(580, 1, '08-09', 2015, 3, 21, 1, 1, 5, '2014-12-16 06:45:21'),
(581, 1, '08-09', 2015, 3, 28, 1, 1, 5, '2014-12-16 06:45:21'),
(582, 1, '08-09', 2015, 4, 4, 1, 1, 5, '2014-12-16 06:45:21'),
(583, 1, '08-09', 2015, 4, 11, 1, 1, 5, '2014-12-16 06:45:21'),
(584, 1, '08-09', 2015, 4, 18, 1, 1, 5, '2014-12-16 06:45:21'),
(585, 1, '08-09', 2015, 4, 25, 1, 1, 5, '2014-12-16 06:45:21'),
(586, 1, '08-09', 2015, 5, 2, 1, 1, 5, '2014-12-16 06:45:22'),
(587, 1, '08-09', 2015, 5, 9, 1, 1, 5, '2014-12-16 06:45:22'),
(588, 1, '08-09', 2015, 5, 16, 1, 1, 5, '2014-12-16 06:45:22'),
(589, 1, '08-09', 2015, 5, 23, 1, 1, 5, '2014-12-16 06:45:22'),
(590, 1, '08-09', 2015, 5, 30, 1, 1, 5, '2014-12-16 06:45:22'),
(591, 1, '08-09', 2015, 6, 6, 1, 1, 5, '2014-12-16 06:45:23'),
(592, 1, '08-09', 2015, 6, 13, 1, 1, 5, '2014-12-16 06:45:23'),
(593, 1, '08-09', 2015, 6, 20, 1, 1, 5, '2014-12-16 06:45:23'),
(594, 1, '08-09', 2015, 6, 27, 1, 1, 5, '2014-12-16 06:45:23'),
(595, 1, '08-09', 2015, 7, 4, 1, 1, 5, '2014-12-16 06:45:23'),
(596, 1, '08-09', 2015, 7, 11, 1, 1, 5, '2014-12-16 06:45:23'),
(597, 1, '08-09', 2015, 7, 18, 1, 1, 5, '2014-12-16 06:45:24'),
(598, 1, '08-09', 2015, 7, 25, 1, 1, 5, '2014-12-16 06:45:24'),
(599, 1, '08-09', 2015, 8, 1, 1, 1, 5, '2014-12-16 06:45:24'),
(600, 1, '08-09', 2015, 8, 8, 1, 1, 5, '2014-12-16 06:45:24'),
(601, 1, '08-09', 2015, 8, 15, 1, 1, 5, '2014-12-16 06:45:24'),
(602, 1, '08-09', 2015, 8, 22, 1, 1, 5, '2014-12-16 06:45:24'),
(603, 1, '08-09', 2015, 8, 29, 1, 1, 5, '2014-12-16 06:45:25'),
(604, 1, '08-09', 2015, 9, 5, 1, 1, 5, '2014-12-16 06:45:25'),
(605, 1, '08-09', 2015, 9, 12, 1, 1, 5, '2014-12-16 06:45:25'),
(606, 1, '08-09', 2015, 9, 19, 1, 1, 5, '2014-12-16 06:45:25'),
(607, 1, '08-09', 2015, 9, 26, 1, 1, 5, '2014-12-16 06:45:25'),
(608, 1, '08-09', 2015, 10, 3, 1, 1, 5, '2014-12-16 06:45:26'),
(609, 1, '08-09', 2015, 10, 10, 1, 1, 5, '2014-12-16 06:45:26'),
(610, 1, '08-09', 2015, 10, 17, 1, 1, 5, '2014-12-16 06:45:26'),
(611, 1, '08-09', 2015, 10, 24, 1, 1, 5, '2014-12-16 06:45:26'),
(612, 1, '08-09', 2015, 10, 31, 1, 1, 5, '2014-12-16 06:45:26'),
(613, 1, '08-09', 2015, 11, 7, 1, 1, 5, '2014-12-16 06:45:26'),
(614, 1, '08-09', 2015, 11, 14, 1, 1, 5, '2014-12-16 06:45:27'),
(615, 1, '08-09', 2015, 11, 21, 1, 1, 5, '2014-12-16 06:45:27'),
(616, 1, '08-09', 2015, 11, 28, 1, 1, 5, '2014-12-16 06:45:27'),
(617, 1, '08-09', 2015, 12, 5, 1, 1, 5, '2014-12-16 06:45:27'),
(618, 1, '08-09', 2015, 12, 12, 1, 1, 5, '2014-12-16 06:45:27'),
(619, 1, '08-09', 2015, 12, 19, 1, 1, 5, '2014-12-16 06:45:27'),
(620, 1, '08-09', 2015, 12, 26, 1, 1, 5, '2014-12-16 06:45:28'),
(621, 1, '08-09', 2016, 1, 2, 1, 1, 5, '2014-12-16 06:45:28'),
(622, 1, '08-09', 2015, 1, 4, 1, 1, 5, '2014-12-16 06:46:41'),
(623, 1, '08-09', 2016, 1, 4, 1, 1, 5, '2014-12-16 06:46:44'),
(624, 2, '08-09', 2015, 3, 29, 1, 1, 3, '2014-12-16 06:47:30'),
(625, 1, '09-10', 2015, 3, 1, 1, 1, 3, '2014-12-16 07:24:32'),
(626, 1, '08-09', 2015, 3, 5, 1, 1, 5, '2014-12-16 07:30:24'),
(627, 1, '08-09', 2016, 3, 4, 1, 1, 5, '2014-12-16 07:30:27'),
(628, 1, '08-09', 2014, 12, 16, 1, 1, 3, '2014-12-17 05:19:48'),
(629, 1, '11-12', 2014, 12, 16, 1, 1, 3, '2014-12-17 05:19:51'),
(630, 1, '08-09', 2014, 12, 16, 2, 2, 5, '2014-12-17 05:22:06'),
(631, 1, '08-09', 2015, 12, 16, 2, 2, 5, '2014-12-17 05:22:09'),
(632, 1, '08-09', 2014, 12, 16, 2, 3, 3, '2014-12-17 05:57:00'),
(633, 1, '08-09', 2014, 12, 16, 2, 3, 3, '2014-12-17 05:57:02'),
(634, 1, '08-09', 2014, 12, 17, 2, 3, 3, '2014-12-17 05:57:15'),
(635, 1, '08-09', 2014, 12, 17, 2, 3, 3, '2014-12-17 05:57:17'),
(636, 1, '08-09', 2014, 12, 17, 2, 3, 5, '2014-12-17 05:57:28'),
(637, 1, '08-09', 2014, 12, 24, 2, 3, 5, '2014-12-17 05:57:28'),
(638, 1, '08-09', 2014, 12, 31, 2, 3, 5, '2014-12-17 05:57:28'),
(639, 1, '08-09', 2015, 1, 7, 2, 3, 5, '2014-12-17 05:57:29'),
(640, 1, '08-09', 2015, 1, 14, 2, 3, 5, '2014-12-17 05:57:29'),
(641, 1, '08-09', 2015, 1, 21, 2, 3, 5, '2014-12-17 05:57:29'),
(642, 1, '08-09', 2015, 1, 28, 2, 3, 5, '2014-12-17 05:57:29'),
(643, 1, '08-09', 2015, 2, 4, 2, 3, 5, '2014-12-17 05:57:30'),
(644, 1, '08-09', 2015, 2, 11, 2, 3, 5, '2014-12-17 05:57:30'),
(645, 1, '08-09', 2015, 2, 18, 2, 3, 5, '2014-12-17 05:57:30'),
(646, 1, '08-09', 2015, 2, 25, 2, 3, 5, '2014-12-17 05:57:30'),
(647, 1, '08-09', 2015, 3, 4, 2, 3, 5, '2014-12-17 05:57:30'),
(648, 1, '08-09', 2015, 3, 11, 2, 3, 5, '2014-12-17 05:57:31'),
(649, 1, '08-09', 2015, 3, 18, 2, 3, 5, '2014-12-17 05:57:31'),
(650, 1, '08-09', 2015, 3, 25, 2, 3, 5, '2014-12-17 05:57:31'),
(651, 1, '08-09', 2015, 4, 1, 2, 3, 5, '2014-12-17 05:57:31'),
(652, 1, '08-09', 2015, 4, 8, 2, 3, 5, '2014-12-17 05:57:32'),
(653, 1, '08-09', 2015, 4, 15, 2, 3, 5, '2014-12-17 05:57:32'),
(654, 1, '08-09', 2015, 4, 22, 2, 3, 5, '2014-12-17 05:57:32'),
(655, 1, '08-09', 2015, 4, 29, 2, 3, 5, '2014-12-17 05:57:32'),
(656, 1, '08-09', 2015, 5, 6, 2, 3, 5, '2014-12-17 05:57:32'),
(657, 1, '08-09', 2015, 5, 13, 2, 3, 5, '2014-12-17 05:57:33'),
(658, 1, '08-09', 2015, 5, 20, 2, 3, 5, '2014-12-17 05:57:33'),
(659, 1, '08-09', 2015, 5, 27, 2, 3, 5, '2014-12-17 05:57:33'),
(660, 1, '08-09', 2015, 6, 3, 2, 3, 5, '2014-12-17 05:57:33'),
(661, 1, '08-09', 2015, 6, 10, 2, 3, 5, '2014-12-17 05:57:34'),
(662, 1, '08-09', 2015, 6, 17, 2, 3, 5, '2014-12-17 05:57:34'),
(663, 1, '08-09', 2015, 6, 24, 2, 3, 5, '2014-12-17 05:57:34'),
(664, 1, '08-09', 2015, 7, 1, 2, 3, 5, '2014-12-17 05:57:34'),
(665, 1, '08-09', 2015, 7, 8, 2, 3, 5, '2014-12-17 05:57:34'),
(666, 1, '08-09', 2015, 7, 15, 2, 3, 5, '2014-12-17 05:57:35'),
(667, 1, '08-09', 2015, 7, 22, 2, 3, 5, '2014-12-17 05:57:35'),
(668, 1, '08-09', 2015, 7, 29, 2, 3, 5, '2014-12-17 05:57:35'),
(669, 1, '08-09', 2015, 8, 5, 2, 3, 5, '2014-12-17 05:57:35'),
(670, 1, '08-09', 2015, 8, 12, 2, 3, 5, '2014-12-17 05:57:35'),
(671, 1, '08-09', 2015, 8, 19, 2, 3, 5, '2014-12-17 05:57:36'),
(672, 1, '08-09', 2015, 8, 26, 2, 3, 5, '2014-12-17 05:57:36'),
(673, 1, '08-09', 2015, 9, 2, 2, 3, 5, '2014-12-17 05:57:36'),
(674, 1, '08-09', 2015, 9, 9, 2, 3, 5, '2014-12-17 05:57:36'),
(675, 1, '08-09', 2015, 9, 16, 2, 3, 5, '2014-12-17 05:57:36'),
(676, 1, '08-09', 2015, 9, 23, 2, 3, 5, '2014-12-17 05:57:37'),
(677, 1, '08-09', 2015, 9, 30, 2, 3, 5, '2014-12-17 05:57:37'),
(678, 1, '08-09', 2015, 10, 7, 2, 3, 5, '2014-12-17 05:57:37'),
(679, 1, '08-09', 2015, 10, 14, 2, 3, 5, '2014-12-17 05:57:37'),
(680, 1, '08-09', 2015, 10, 21, 2, 3, 5, '2014-12-17 05:57:37'),
(681, 1, '08-09', 2015, 10, 28, 2, 3, 5, '2014-12-17 05:57:38'),
(682, 1, '08-09', 2015, 11, 4, 2, 3, 5, '2014-12-17 05:57:38'),
(683, 1, '08-09', 2015, 11, 11, 2, 3, 5, '2014-12-17 05:57:38'),
(684, 1, '08-09', 2015, 11, 18, 2, 3, 5, '2014-12-17 05:57:38'),
(685, 1, '08-09', 2015, 11, 25, 2, 3, 5, '2014-12-17 05:57:38'),
(686, 1, '08-09', 2015, 12, 2, 2, 3, 5, '2014-12-17 05:57:39'),
(687, 1, '08-09', 2015, 12, 9, 2, 3, 5, '2014-12-17 05:57:39'),
(688, 1, '08-09', 2015, 12, 16, 2, 3, 5, '2014-12-17 05:57:39'),
(689, 1, '08-09', 2016, 1, 1, 2, 3, 3, '2014-12-17 06:10:57'),
(690, 1, '08-09', 2016, 1, 1, 2, 3, 3, '2014-12-17 06:10:59'),
(691, 1, '08-09', 2016, 1, 1, 2, 3, 3, '2014-12-17 06:14:28'),
(692, 1, '08-09', 2016, 1, 1, 2, 3, 3, '2014-12-17 06:14:37'),
(693, 1, '08-09', 2016, 1, 1, 2, 3, 3, '2014-12-17 06:14:38'),
(694, 1, '08-09', 2016, 1, 1, 2, 3, 3, '2014-12-17 06:14:40'),
(695, 1, '08-09', 2016, 1, 1, 2, 3, 3, '2014-12-17 06:14:41'),
(696, 1, '08-09', 2016, 1, 1, 2, 3, 3, '2014-12-17 06:25:58'),
(697, 1, '08-09', 2016, 1, 1, 2, 3, 3, '2014-12-17 06:25:59'),
(698, 1, '08-09', 2016, 1, 1, 2, 3, 3, '2014-12-17 06:26:02'),
(699, 1, '08-09', 2016, 1, 1, 2, 3, 3, '2014-12-17 06:26:04'),
(700, 1, '08-09', 2016, 1, 1, 2, 3, 3, '2014-12-17 06:26:09'),
(701, 1, '08-09', 2016, 1, 1, 2, 3, 3, '2014-12-17 06:26:10'),
(702, 1, '08-09', 2016, 1, 1, 2, 3, 3, '2014-12-17 06:26:12'),
(703, 1, '08-09', 2014, 12, 18, 2, 1, 3, '2014-12-17 06:26:42'),
(704, 1, '08-09', 2014, 12, 18, 2, 1, 3, '2014-12-17 06:26:44'),
(705, 1, '08-09', 2014, 12, 18, 2, 1, 5, '2014-12-17 06:26:55'),
(706, 1, '08-09', 2015, 12, 18, 2, 1, 5, '2014-12-17 06:26:56'),
(707, 1, '08-09', 2015, 12, 18, 2, 1, 5, '2014-12-17 06:26:56'),
(708, 1, '08-09', 2015, 12, 18, 2, 1, 5, '2014-12-17 06:26:56'),
(709, 1, '08-09', 2015, 12, 18, 2, 1, 5, '2014-12-17 06:26:56'),
(710, 1, '08-09', 2015, 12, 18, 2, 1, 5, '2014-12-17 06:26:56'),
(711, 1, '08-09', 2015, 12, 18, 2, 1, 5, '2014-12-17 06:26:56'),
(712, 1, '08-09', 2015, 12, 18, 2, 1, 5, '2014-12-17 06:26:56'),
(713, 1, '08-09', 2015, 12, 18, 2, 1, 5, '2014-12-17 06:26:56'),
(714, 1, '08-09', 2015, 12, 18, 2, 1, 5, '2014-12-17 06:26:56'),
(715, 1, '08-09', 2015, 12, 18, 2, 1, 5, '2014-12-17 06:26:56'),
(716, 1, '08-09', 2015, 12, 18, 2, 1, 5, '2014-12-17 06:26:56'),
(717, 1, '08-09', 2015, 12, 18, 2, 1, 5, '2014-12-17 06:26:56'),
(718, 1, '08-09', 2015, 12, 18, 2, 1, 5, '2014-12-17 06:26:56'),
(719, 1, '08-09', 2015, 12, 18, 2, 1, 5, '2014-12-17 06:26:56'),
(720, 1, '08-09', 2015, 12, 18, 2, 1, 5, '2014-12-17 06:26:56'),
(721, 1, '08-09', 2015, 12, 18, 2, 1, 5, '2014-12-17 06:26:56'),
(722, 1, '08-09', 2015, 12, 18, 2, 1, 5, '2014-12-17 06:26:56'),
(723, 1, '08-09', 2015, 12, 18, 2, 1, 5, '2014-12-17 06:26:56'),
(724, 1, '08-09', 2015, 12, 18, 2, 1, 5, '2014-12-17 06:26:56'),
(725, 1, '08-09', 2015, 12, 18, 2, 1, 5, '2014-12-17 06:26:56'),
(726, 1, '08-09', 2015, 12, 18, 2, 1, 5, '2014-12-17 06:26:56'),
(727, 1, '08-09', 2015, 12, 18, 2, 1, 5, '2014-12-17 06:26:56'),
(728, 1, '08-09', 2015, 12, 18, 2, 1, 5, '2014-12-17 06:26:57'),
(729, 1, '08-09', 2015, 12, 18, 2, 1, 5, '2014-12-17 06:26:57'),
(730, 1, '08-09', 2015, 12, 18, 2, 1, 5, '2014-12-17 06:26:57'),
(731, 1, '08-09', 2015, 12, 18, 2, 1, 5, '2014-12-17 06:26:57'),
(732, 1, '08-09', 2015, 12, 18, 2, 1, 5, '2014-12-17 06:26:57'),
(733, 1, '08-09', 2015, 12, 18, 2, 1, 5, '2014-12-17 06:26:57'),
(734, 1, '08-09', 2015, 12, 18, 2, 1, 5, '2014-12-17 06:26:57'),
(735, 1, '08-09', 2015, 12, 18, 2, 1, 5, '2014-12-17 06:26:57'),
(736, 1, '08-09', 2015, 12, 18, 2, 1, 5, '2014-12-17 06:26:57'),
(737, 1, '08-09', 2015, 12, 18, 2, 1, 5, '2014-12-17 06:26:57'),
(738, 1, '08-09', 2015, 12, 18, 2, 1, 5, '2014-12-17 06:26:57'),
(739, 1, '08-09', 2015, 12, 18, 2, 1, 5, '2014-12-17 06:26:57'),
(740, 1, '08-09', 2015, 12, 18, 2, 1, 5, '2014-12-17 06:26:57'),
(741, 1, '08-09', 2015, 12, 18, 2, 1, 5, '2014-12-17 06:26:57'),
(742, 1, '08-09', 2015, 12, 18, 2, 1, 5, '2014-12-17 06:26:57'),
(743, 1, '08-09', 2015, 12, 18, 2, 1, 5, '2014-12-17 06:26:57'),
(744, 1, '08-09', 2015, 12, 18, 2, 1, 5, '2014-12-17 06:26:57'),
(745, 1, '08-09', 2015, 12, 18, 2, 1, 5, '2014-12-17 06:26:57'),
(746, 1, '08-09', 2015, 12, 18, 2, 1, 5, '2014-12-17 06:26:57'),
(747, 1, '08-09', 2015, 12, 18, 2, 1, 5, '2014-12-17 06:26:57'),
(748, 1, '08-09', 2015, 12, 18, 2, 1, 5, '2014-12-17 06:26:57'),
(749, 1, '08-09', 2015, 12, 18, 2, 1, 5, '2014-12-17 06:26:57'),
(750, 1, '08-09', 2015, 12, 18, 2, 1, 5, '2014-12-17 06:26:57'),
(751, 1, '08-09', 2015, 12, 18, 2, 1, 5, '2014-12-17 06:26:57'),
(752, 1, '08-09', 2015, 12, 18, 2, 1, 5, '2014-12-17 06:26:57'),
(753, 1, '08-09', 2015, 12, 18, 2, 1, 5, '2014-12-17 06:26:58'),
(754, 1, '08-09', 2015, 12, 18, 2, 1, 5, '2014-12-17 06:26:58'),
(755, 1, '08-09', 2015, 12, 18, 2, 1, 5, '2014-12-17 06:26:58'),
(756, 1, '08-09', 2015, 12, 18, 2, 1, 5, '2014-12-17 06:26:58'),
(757, 1, '08-09', 2015, 12, 18, 2, 1, 5, '2014-12-17 06:26:58'),
(758, 1, '08-09', 2014, 12, 17, 2, 2, 3, '2014-12-17 06:28:41'),
(759, 1, '08-09', 2014, 12, 17, 1, 1, 5, '2014-12-17 18:01:26'),
(760, 1, '09-10', 2014, 12, 17, 1, 1, 5, '2014-12-17 18:03:10');

DELIMITER $$
--
-- Eventos
--
CREATE DEFINER=`root`@`localhost` EVENT `generateFalseReservations` ON SCHEDULE EVERY 10 SECOND STARTS '2014-11-22 00:43:04' ON COMPLETION NOT PRESERVE DISABLE DO BEGIN
	
		INSERT INTO `t_temporary_schedule`(`team_id`, `reservation_time`, `reservation_year`, `reservation_month`, `reservation_day`, `pitch_id`, `group_id`, `state`) VALUES ('1','09-10','2014','04','01','1','2','1');
	    
	END$$

CREATE DEFINER=`root`@`localhost` EVENT `checkExpiredReservations` ON SCHEDULE EVERY 10 SECOND STARTS '2014-11-22 23:39:39' ON COMPLETION NOT PRESERVE ENABLE DO BEGIN

		UPDATE `t_temporary_schedule` SET `state`='3' WHERE temporary_date_made < DATE_SUB(NOW(),INTERVAL 10 MINUTE) AND `state`!='3' AND `state`!='4' AND `state`!='5';

	END$$

DELIMITER ;
--
-- Base de datos: `phpmyadmin`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pma_bookmark`
--

CREATE TABLE IF NOT EXISTS `pma_bookmark` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `dbase` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '',
  `user` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '',
  `label` varchar(255) CHARACTER SET utf8 NOT NULL DEFAULT '',
  `query` text COLLATE utf8_bin NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Bookmarks' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pma_column_info`
--

CREATE TABLE IF NOT EXISTS `pma_column_info` (
  `id` int(5) unsigned NOT NULL AUTO_INCREMENT,
  `db_name` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `table_name` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `column_name` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `comment` varchar(255) CHARACTER SET utf8 NOT NULL DEFAULT '',
  `mimetype` varchar(255) CHARACTER SET utf8 NOT NULL DEFAULT '',
  `transformation` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '',
  `transformation_options` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  UNIQUE KEY `db_name` (`db_name`,`table_name`,`column_name`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Column information for phpMyAdmin' AUTO_INCREMENT=47 ;

--
-- Volcado de datos para la tabla `pma_column_info`
--

INSERT INTO `pma_column_info` (`id`, `db_name`, `table_name`, `column_name`, `comment`, `mimetype`, `transformation`, `transformation_options`) VALUES
(1, 'proyectos', 'tprojecttrabajo', 'id', '', '', '_', ''),
(2, 'f5_system', 't_reservations', 'id', '', '', '_', ''),
(3, 'f5_system', 't_reservations', 'name', '', '', '_', ''),
(4, 'f5_system', 't_reservations', 'lastname', '', '', '_', ''),
(5, 'f5_system', 't_reservations', 'phone', '', '', '_', ''),
(6, 'f5_system', 't_reservations', 'email', '', '', '_', ''),
(7, 'f5_system', 't_reservations', 'type_reservation', '', '', '_', ''),
(8, 'f5_system', 't_reservations', 'referee_required', '', '', '_', ''),
(9, 'f5_system', 't_reservations', 'team_id', '', '', '_', ''),
(10, 'f5_system', 't_reservations', 'reservation_time', '', '', '_', ''),
(11, 'f5_system', 't_reservations', 'reservation_year', '', '', '_', ''),
(12, 'f5_system', 't_reservations', 'reservation_month', '', '', '_', ''),
(13, 'f5_system', 't_reservations', 'reservation_day', '', '', '_', ''),
(14, 'f5_system', 't_reservations', 'reservation_made_time', '', '', '_', ''),
(15, 'f5_system', 't_reservations', 'reservation_price', '', '', '_', ''),
(16, 'f5_system', 't_reservations', 'id_pitch', '', '', '_', ''),
(17, 'f5_system', 't_reservations', 'active', '', '', '_', ''),
(37, 'f5_system', 't_temporary_schedule', 'id', '', '', '_', ''),
(30, 'f5_system', 't_reservations', 'group_id', '', '', '_', ''),
(20, 'f5_system', 't_reservations', 'pitch_id', '', '', '_', ''),
(21, 'f5_system', 't_admin', 'id', '', '', '_', ''),
(22, 'f5_system', 't_admin', 'user', '', '', '_', ''),
(23, 'f5_system', 't_admin', 'password', '', '', '_', ''),
(24, 'f5_system', 't_admin', 'name', '', '', '_', ''),
(25, 'f5_system', 't_pitchs', 'id', '', '', '_', ''),
(26, 'f5_system', 't_pitchs', 'pitch', '', '', '_', ''),
(27, 'f5_system', 't_pitchs', 'active', '', '', '_', ''),
(35, 'f5_system', 't_pitchs', 'id_group', '', '', '_', ''),
(29, 'f5_system', 't_pitchs', 'id_pitch', '', '', '_', ''),
(31, 'f5_system', 't_pitchs', 'detail', '', '', '_', ''),
(32, 'f5_system', 't_groups', 'id', '', '', '_', ''),
(33, 'f5_system', 't_groups', 'group', '', '', '_', ''),
(36, 'f5_system', 't_groups', 'group_name', '', '', '_', ''),
(38, 'f5_system', 't_temporary_schedule', 'reservation_time', '', '', '_', ''),
(39, 'f5_system', 't_temporary_schedule', 'reservation_year', '', '', '_', ''),
(40, 'f5_system', 't_temporary_schedule', 'reservation_month', '', '', '_', ''),
(41, 'f5_system', 't_temporary_schedule', 'reservation_day', '', '', '_', ''),
(42, 'f5_system', 't_temporary_schedule', 'pitch_id', '', '', '_', ''),
(43, 'f5_system', 't_temporary_schedule', 'group_id', '', '', '_', ''),
(44, 'f5_system', 't_temporary_schedule', 'state', '', '', '_', ''),
(45, 'f5_system', 't_temporary_schedule', 'temporary_date_made', '', '', '_', ''),
(46, 'f5_system', 't_temporary_schedule', 'team_id', '', '', '_', '');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pma_designer_coords`
--

CREATE TABLE IF NOT EXISTS `pma_designer_coords` (
  `db_name` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `table_name` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `x` int(11) DEFAULT NULL,
  `y` int(11) DEFAULT NULL,
  `v` tinyint(4) DEFAULT NULL,
  `h` tinyint(4) DEFAULT NULL,
  PRIMARY KEY (`db_name`,`table_name`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Table coordinates for Designer';

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pma_history`
--

CREATE TABLE IF NOT EXISTS `pma_history` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `username` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `db` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `table` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `timevalue` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `sqlquery` text COLLATE utf8_bin NOT NULL,
  PRIMARY KEY (`id`),
  KEY `username` (`username`,`db`,`table`,`timevalue`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='SQL history for phpMyAdmin' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pma_pdf_pages`
--

CREATE TABLE IF NOT EXISTS `pma_pdf_pages` (
  `db_name` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `page_nr` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `page_descr` varchar(50) CHARACTER SET utf8 NOT NULL DEFAULT '',
  PRIMARY KEY (`page_nr`),
  KEY `db_name` (`db_name`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='PDF relation pages for phpMyAdmin' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pma_recent`
--

CREATE TABLE IF NOT EXISTS `pma_recent` (
  `username` varchar(64) COLLATE utf8_bin NOT NULL,
  `tables` text COLLATE utf8_bin NOT NULL,
  PRIMARY KEY (`username`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Recently accessed tables';

--
-- Volcado de datos para la tabla `pma_recent`
--

INSERT INTO `pma_recent` (`username`, `tables`) VALUES
('root', '[{"db":"f5_system","table":"t_temporary_schedule"},{"db":"f5_system","table":"t_reservations"},{"db":"f5_booking_system","table":"phpmyreservation_reservations"},{"db":"f5_system","table":"t_groups"},{"db":"f5_system","table":"t_pitchs"},{"db":"f5_system","table":"t_admin"},{"db":"phpmyreservation","table":"phpmyreservation_reservations"},{"db":"f5_booking_system","table":"reservations"},{"db":"phpmyreservation","table":"phpmyreservation_users"},{"db":"phpmyreservation","table":"phpmyreservation_configuration"}]');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pma_relation`
--

CREATE TABLE IF NOT EXISTS `pma_relation` (
  `master_db` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `master_table` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `master_field` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `foreign_db` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `foreign_table` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `foreign_field` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  PRIMARY KEY (`master_db`,`master_table`,`master_field`),
  KEY `foreign_field` (`foreign_db`,`foreign_table`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Relation table';

--
-- Volcado de datos para la tabla `pma_relation`
--

INSERT INTO `pma_relation` (`master_db`, `master_table`, `master_field`, `foreign_db`, `foreign_table`, `foreign_field`) VALUES
('f5_system', 't_pitchs', 'id_group', 'f5_system', 't_groups', 'id');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pma_table_coords`
--

CREATE TABLE IF NOT EXISTS `pma_table_coords` (
  `db_name` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `table_name` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `pdf_page_number` int(11) NOT NULL DEFAULT '0',
  `x` float unsigned NOT NULL DEFAULT '0',
  `y` float unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`db_name`,`table_name`,`pdf_page_number`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Table coordinates for phpMyAdmin PDF output';

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pma_table_info`
--

CREATE TABLE IF NOT EXISTS `pma_table_info` (
  `db_name` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `table_name` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `display_field` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  PRIMARY KEY (`db_name`,`table_name`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Table information for phpMyAdmin';

--
-- Volcado de datos para la tabla `pma_table_info`
--

INSERT INTO `pma_table_info` (`db_name`, `table_name`, `display_field`) VALUES
('f5_system', 't_pitchs', 'id_group');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pma_table_uiprefs`
--

CREATE TABLE IF NOT EXISTS `pma_table_uiprefs` (
  `username` varchar(64) COLLATE utf8_bin NOT NULL,
  `db_name` varchar(64) COLLATE utf8_bin NOT NULL,
  `table_name` varchar(64) COLLATE utf8_bin NOT NULL,
  `prefs` text COLLATE utf8_bin NOT NULL,
  `last_update` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`username`,`db_name`,`table_name`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Tables'' UI preferences';

--
-- Volcado de datos para la tabla `pma_table_uiprefs`
--

INSERT INTO `pma_table_uiprefs` (`username`, `db_name`, `table_name`, `prefs`, `last_update`) VALUES
('root', 'f5_system', 't_reservations', '{"sorted_col":"`pitch_id` ASC"}', '2014-12-11 04:13:14'),
('root', 'f5_system', 't_pitchs', '{"sorted_col":"`t_pitchs`.`id` ASC"}', '2014-11-02 05:53:13'),
('root', 'f5_system', 't_temporary_schedule', '{"sorted_col":"`state` ASC"}', '2014-12-11 04:13:05');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pma_tracking`
--

CREATE TABLE IF NOT EXISTS `pma_tracking` (
  `db_name` varchar(64) COLLATE utf8_bin NOT NULL,
  `table_name` varchar(64) COLLATE utf8_bin NOT NULL,
  `version` int(10) unsigned NOT NULL,
  `date_created` datetime NOT NULL,
  `date_updated` datetime NOT NULL,
  `schema_snapshot` text COLLATE utf8_bin NOT NULL,
  `schema_sql` text COLLATE utf8_bin,
  `data_sql` longtext COLLATE utf8_bin,
  `tracking` set('UPDATE','REPLACE','INSERT','DELETE','TRUNCATE','CREATE DATABASE','ALTER DATABASE','DROP DATABASE','CREATE TABLE','ALTER TABLE','RENAME TABLE','DROP TABLE','CREATE INDEX','DROP INDEX','CREATE VIEW','ALTER VIEW','DROP VIEW') COLLATE utf8_bin DEFAULT NULL,
  `tracking_active` int(1) unsigned NOT NULL DEFAULT '1',
  PRIMARY KEY (`db_name`,`table_name`,`version`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_bin ROW_FORMAT=COMPACT COMMENT='Database changes tracking for phpMyAdmin';

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pma_userconfig`
--

CREATE TABLE IF NOT EXISTS `pma_userconfig` (
  `username` varchar(64) COLLATE utf8_bin NOT NULL,
  `timevalue` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `config_data` text COLLATE utf8_bin NOT NULL,
  PRIMARY KEY (`username`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='User preferences storage for phpMyAdmin';

--
-- Volcado de datos para la tabla `pma_userconfig`
--

INSERT INTO `pma_userconfig` (`username`, `timevalue`, `config_data`) VALUES
('root', '2014-07-03 02:57:19', '{"lang":"es","collation_connection":"utf8mb4_general_ci"}');
--
-- Base de datos: `phpmyreservation`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `phpmyreservation_configuration`
--

CREATE TABLE IF NOT EXISTS `phpmyreservation_configuration` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `price` float NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=2 ;

--
-- Volcado de datos para la tabla `phpmyreservation_configuration`
--

INSERT INTO `phpmyreservation_configuration` (`id`, `price`) VALUES
(1, 2);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `phpmyreservation_reservations`
--

CREATE TABLE IF NOT EXISTS `phpmyreservation_reservations` (
  `reservation_id` int(10) NOT NULL AUTO_INCREMENT,
  `reservation_made_time` datetime NOT NULL,
  `reservation_year` smallint(4) NOT NULL,
  `reservation_week` tinyint(2) NOT NULL,
  `reservation_day` tinyint(1) NOT NULL,
  `reservation_time` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `reservation_price` float NOT NULL,
  `reservation_user_id` int(10) NOT NULL,
  `reservation_user_email` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `reservation_user_name` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`reservation_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=4 ;

--
-- Volcado de datos para la tabla `phpmyreservation_reservations`
--

INSERT INTO `phpmyreservation_reservations` (`reservation_id`, `reservation_made_time`, `reservation_year`, `reservation_week`, `reservation_day`, `reservation_time`, `reservation_price`, `reservation_user_id`, `reservation_user_email`, `reservation_user_name`) VALUES
(1, '2014-08-27 22:35:15', 2014, 35, 4, '09-10', 2, 1, 'test@test.com', 'testeo'),
(2, '2014-08-27 22:36:25', 2014, 35, 4, '15-16', 2, 1, 'test@test.com', 'testeo'),
(3, '2014-08-27 22:36:25', 2014, 35, 3, '14-15', 2, 1, 'test@test.com', 'testeo');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `phpmyreservation_users`
--

CREATE TABLE IF NOT EXISTS `phpmyreservation_users` (
  `user_id` int(10) NOT NULL AUTO_INCREMENT,
  `user_is_admin` tinyint(1) NOT NULL,
  `user_email` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `user_password` varchar(1000) COLLATE utf8_unicode_ci NOT NULL,
  `user_name` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `user_reservation_reminder` tinyint(1) NOT NULL,
  PRIMARY KEY (`user_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=2 ;

--
-- Volcado de datos para la tabla `phpmyreservation_users`
--

INSERT INTO `phpmyreservation_users` (`user_id`, `user_is_admin`, `user_email`, `user_password`, `user_name`, `user_reservation_reminder`) VALUES
(1, 1, 'test@test.com', '$1$k4i8pa2m$0/ic6R/tvvy8NO9Zj93iD.', 'testeo', 0);
--
-- Base de datos: `proyectos`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tprojecttrabajo`
--

CREATE TABLE IF NOT EXISTS `tprojecttrabajo` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` text NOT NULL,
  `detail` text NOT NULL,
  `status` tinyint(1) NOT NULL,
  `date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=13 ;

--
-- Volcado de datos para la tabla `tprojecttrabajo`
--

INSERT INTO `tprojecttrabajo` (`id`, `title`, `detail`, `status`, `date`) VALUES
(7, 'test', 'test', 0, '2014-07-04 06:59:09'),
(8, 'test', 'test', 0, '2014-07-04 06:59:13'),
(12, 'Proyecto T', 'proyecto 1', 0, '2014-08-12 01:29:27');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tprojectuniversidad`
--

CREATE TABLE IF NOT EXISTS `tprojectuniversidad` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` text NOT NULL,
  `detail` text NOT NULL,
  `status` tinyint(1) NOT NULL,
  `date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=19 ;

--
-- Volcado de datos para la tabla `tprojectuniversidad`
--

INSERT INTO `tprojectuniversidad` (`id`, `title`, `detail`, `status`, `date`) VALUES
(15, 'test', 'test', 0, '2014-07-04 06:58:56'),
(16, 'test', 'test', 0, '2014-07-04 06:59:06'),
(18, 'das', 'dasdasd', 0, '2014-07-06 03:23:39');
--
-- Base de datos: `test`
--
--
-- Base de datos: `webauth`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `user_pwd`
--

CREATE TABLE IF NOT EXISTS `user_pwd` (
  `name` char(30) COLLATE latin1_general_ci NOT NULL DEFAULT '',
  `pass` char(32) COLLATE latin1_general_ci NOT NULL DEFAULT '',
  PRIMARY KEY (`name`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;

--
-- Volcado de datos para la tabla `user_pwd`
--

INSERT INTO `user_pwd` (`name`, `pass`) VALUES
('xampp', 'wampp');

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
