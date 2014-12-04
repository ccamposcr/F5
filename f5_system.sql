-- phpMyAdmin SQL Dump
-- version 4.1.12
-- http://www.phpmyadmin.net
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 04-12-2014 a las 15:04:40
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
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=9 ;

--
-- Volcado de datos para la tabla `t_reservations`
--

INSERT INTO `t_reservations` (`id`, `name`, `lastname`, `phone`, `email`, `team_id`, `type_reservation`, `referee_required`, `reservation_time`, `reservation_year`, `reservation_month`, `reservation_day`, `reservation_made_time`, `reservation_price`, `pitch_id`, `group_id`, `active`) VALUES
(1, 'Christian', 'Campos', '22222222', 'test@test.com', 1, 2, 0, '08-09', 2014, 9, 29, '2014-09-30 04:12:38', 500, 1, 1, 1),
(2, 'Carolina', 'Borge', '22222222', 'test1@test.com', 2, 2, 0, '08-09', 2014, 9, 29, '2014-09-30 04:15:00', 656, 1, 2, 1),
(3, 'Laura', 'Campos', '2222222', 'test2@test.com', 1, 1, 0, '09-10', 2014, 9, 29, '2014-09-30 04:18:12', 400, 1, 1, 1),
(4, 'Christian', 'Campos', '83180160', 'ccamposcr@gmail.com', 1, 1, 0, '08-09', 2014, 12, 4, '2014-12-04 07:19:44', 1, 1, 1, 1),
(5, 'laura', 'campos', '23123123', 'ass@as.com', 1, 2, 0, '09-10', 2014, 12, 4, '2014-12-04 07:23:07', 1, 1, 1, 1),
(6, 'caro', 'borge', '23232323', 'test@teet.com', 2, 2, 0, '10-11', 2014, 12, 4, '2014-12-04 07:24:12', 1, 1, 1, 1),
(7, 'test', 'test', '12122222', 'test@s', 1, 2, 0, '11-12', 2014, 12, 4, '2014-12-04 20:35:58', 1, 1, 1, 1),
(8, 'test', 'test', '11111111', 'asdasd@s.com', 1, 2, 0, '12-13', 2014, 12, 4, '2014-12-04 21:01:12', 1, 1, 1, 1);

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
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=441 ;

--
-- Volcado de datos para la tabla `t_temporary_schedule`
--

INSERT INTO `t_temporary_schedule` (`id`, `team_id`, `reservation_time`, `reservation_year`, `reservation_month`, `reservation_day`, `pitch_id`, `group_id`, `state`, `temporary_date_made`) VALUES
(413, 2, '08-09', 2014, 12, 3, 1, 1, 3, '2014-12-04 05:45:23'),
(414, 1, '08-09', 2014, 12, 3, 1, 1, 3, '2014-12-04 05:45:23'),
(415, 2, '09-10', 2014, 12, 3, 1, 1, 3, '2014-12-04 04:51:42'),
(416, 1, '09-10', 2014, 12, 3, 1, 1, 3, '2014-12-04 04:51:42'),
(417, 2, '08-09', 2015, 1, 1, 1, 1, 3, '2014-12-04 05:27:15'),
(418, 1, '08-09', 2015, 1, 1, 1, 1, 3, '2014-12-04 05:27:15'),
(419, 2, '08-09', 2014, 12, 4, 1, 1, 3, '2014-12-04 07:20:01'),
(420, 1, '08-09', 2014, 12, 4, 1, 1, 3, '2014-12-04 07:20:01'),
(421, 2, '09-10', 2014, 12, 4, 1, 1, 3, '2014-12-04 21:01:34'),
(422, 1, '09-10', 2014, 12, 4, 1, 1, 3, '2014-12-04 21:01:34'),
(423, 1, '11-12', 2014, 12, 4, 1, 1, 3, '2014-12-04 20:35:58'),
(424, 2, '11-12', 2014, 12, 4, 1, 1, 3, '2014-12-04 20:35:58'),
(425, 1, '12-13', 2014, 12, 4, 1, 1, 3, '2014-12-04 21:01:12'),
(426, 2, '12-13', 2014, 12, 4, 1, 1, 3, '2014-12-04 21:01:12'),
(427, 2, '10-11', 2014, 12, 4, 1, 1, 3, '2014-12-04 21:01:36'),
(428, 1, '10-11', 2014, 12, 4, 1, 1, 3, '2014-12-04 21:01:36'),
(429, 2, '13-14', 2014, 12, 4, 1, 1, 3, '2014-12-04 06:30:26'),
(430, 1, '13-14', 2014, 12, 4, 1, 1, 3, '2014-12-04 06:30:26'),
(431, 2, '16-17', 2014, 12, 4, 1, 1, 3, '2014-12-04 06:35:28'),
(432, 1, '16-17', 2014, 12, 4, 1, 1, 3, '2014-12-04 06:35:28'),
(433, 1, '21-22', 2014, 12, 4, 1, 1, 3, '2014-12-04 06:37:16'),
(434, 2, '21-22', 2014, 12, 4, 1, 1, 3, '2014-12-04 06:37:16'),
(435, 1, '20-21', 2014, 12, 4, 1, 1, 3, '2014-12-04 06:41:28'),
(436, 2, '20-21', 2014, 12, 4, 1, 1, 3, '2014-12-04 06:41:28'),
(437, 2, '18-19', 2014, 12, 4, 1, 1, 3, '2014-12-04 06:42:40'),
(438, 1, '18-19', 2014, 12, 4, 1, 1, 3, '2014-12-04 06:42:40'),
(439, 1, '08-09', 2014, 9, 29, 1, 1, 3, '2014-12-04 20:44:34'),
(440, 2, '08-09', 2014, 9, 29, 1, 1, 3, '2014-12-04 20:44:34');

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

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
