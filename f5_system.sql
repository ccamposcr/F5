-- phpMyAdmin SQL Dump
-- version 4.1.12
-- http://www.phpmyadmin.net
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 05-10-2014 a las 22:18:04
-- Versión del servidor: 5.6.16
-- Versión de PHP: 5.5.11

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

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
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

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
  `type_reservation` tinyint(4) NOT NULL,
  `referee_required` tinyint(1) NOT NULL,
  `team_id` tinyint(4) NOT NULL,
  `reservation_time` varchar(100) NOT NULL,
  `reservation_year` smallint(6) NOT NULL,
  `reservation_month` tinyint(4) NOT NULL,
  `reservation_day` tinyint(4) NOT NULL,
  `reservation_made_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `reservation_price` float NOT NULL,
  `pitch_id` smallint(6) NOT NULL,
  `active` tinyint(1) NOT NULL,
  `complete` tinyint(1) NOT NULL,
  `in_use` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=4 ;

--
-- Volcado de datos para la tabla `t_reservations`
--

INSERT INTO `t_reservations` (`id`, `name`, `lastname`, `phone`, `email`, `type_reservation`, `referee_required`, `team_id`, `reservation_time`, `reservation_year`, `reservation_month`, `reservation_day`, `reservation_made_time`, `reservation_price`, `pitch_id`, `active`, `complete`, `in_use`) VALUES
(1, 'Christian', 'Campos', '22222222', 'test@test.com', 2, 0, 1, '08-09', 2014, 9, 29, '2014-09-30 04:12:38', 500, 1, 1, 1, 0),
(2, 'Carolina', 'Borge', '22222222', 'test1@test.com', 2, 0, 2, '08-09', 2014, 9, 29, '2014-09-30 04:15:00', 656, 1, 1, 1, 0),
(3, 'Laura', 'Campos', '2222222', 'test2@test.com', 1, 0, 1, '09-10', 2014, 9, 29, '2014-09-30 04:18:12', 400, 1, 1, 1, 0);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
