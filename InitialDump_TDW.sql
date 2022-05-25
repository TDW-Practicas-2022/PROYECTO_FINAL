-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 24-05-2022 a las 18:05:01
-- Versión del servidor: 10.4.24-MariaDB
-- Versión de PHP: 8.1.6

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Volcado de datos para la tabla `entity`
--

INSERT INTO `entity` (`id`, `name`, `birthdate`, `deathdate`, `image_url`, `wiki_url`) VALUES
(1, 'IBM', '1924-01-01 00:00:00', NULL, 'https://upload.wikimedia.org/wikipedia/commons/f/fc/IBM_logo_in.jpg', 'https://es.wikipedia.org/wiki/IBM'),
(2, 'CERN', '1952-01-01 00:00:00', NULL, 'https://upload.wikimedia.org/wikipedia/en/a/ae/CERN_logo.svg', 'https://es.wikipedia.org/wiki/Organizaci%C3%B3n_Europea_para_la_Investigaci%C3%B3n_Nuclear'),
(3, 'W3C', '1994-01-01 00:00:00', NULL, 'https://www.paymentscardsandmobile.com/wp-content/uploads/2015/01/W3C.jpg', 'https://es.wikipedia.org/wiki/World_Wide_Web_Consortium');

--
-- Volcado de datos para la tabla `person`
--

INSERT INTO `person` (`id`, `name`, `birthdate`, `deathdate`, `image_url`, `wiki_url`) VALUES
(2, 'Vannervar Bush', '1890-03-11 00:00:00', '1974-06-30 00:00:00', 'http://4.bp.blogspot.com/-LnlyNlOhEz4/U4W70olA60I/AAAAAAAAANA/pSCczDRS4-c/s1600/vannevarbush.jpg', 'https://es.wikipedia.org/wiki/Vannevar_Bush'),
(3, 'Tim Berners Lee', '1955-06-08 00:00:00', NULL, 'https://upload.wikimedia.org/wikipedia/commons/thumb/4/4e/Sir_Tim_Berners-Lee_%28cropped%29.jpg/220px-Sir_Tim_Berners-Lee_%28cropped%29.jpg', 'https://es.wikipedia.org/wiki/Tim_Berners-Lee');

--
-- Volcado de datos para la tabla `product`
--

INSERT INTO `product` (`id`, `name`, `birthdate`, `deathdate`, `image_url`, `wiki_url`) VALUES
(2, 'SGML', '1986-01-01 00:00:00', NULL, 'https://s3.amazonaws.com/s3.timetoast.com/public/uploads/photo/7122993/image/b6c98ea121bc14d8d0518eac7a5201e4', 'https://es.wikipedia.org/wiki/SGML'),
(3, 'XML', '1999-01-01 00:00:00', NULL, 'https://images-ext-2.discordapp.net/external/XR_oa0hoHQRsBq1W45TzGGjCqGEXPcKbZ2RSN-INge4/https/png.pngtree.com/png-vector/20190330/ourlarge/pngtree-xml-file-document-icon-png-image_893042.jpg', 'https://es.wikipedia.org/wiki/Extensible_Markup_Language'),
(4, 'HTML', '1980-01-01 00:00:00', NULL, 'https://images-ext-1.discordapp.net/external/Ccv48vdujMB92PC8N3DmYDViWIAvV0pdiM08ZINxHaQ/https/fernandosarachaga.com/wp-content/uploads/programming-language-html.jpeg', 'https://es.wikipedia.org/wiki/HTML'),
(5, 'HTTP', '1989-01-01 00:00:00', NULL, 'https://upload.wikimedia.org/wikipedia/commons/thumb/1/10/HTTP_logo_-_2014.svg/290px-HTTP_logo_-_2014.svg.png', 'https://es.wikipedia.org/wiki/Protocolo_de_transferencia_de_hipertexto'),
(6, 'CSS', '1996-01-01 00:00:00', NULL, 'https://picodotdev.github.io/blog-bitix/assets/images/structured-data/css-750.png', 'https://es.wikipedia.org/wiki/CSS'),
(7, 'JavaScript', '1995-01-01 00:00:00', NULL, 'https://pngset.com/images/logo-javascript-pattern-copyright-framework-free-javascript-logo-label-text-symbol-trademark-transparent-png-1498648.png', 'https://es.wikipedia.org/wiki/JavaScript');

--
-- Volcado de datos para la tabla `user`
--

INSERT INTO `user` (`id`, `username`, `email`, `password`, `role_value`, `realname`, `birthDate`, `isActive`) VALUES
(1, 'adminUser', 'adminUser@example.com', '$2y$10$jBHold8vfKr2h6QHA9Brsu6s1M/3C8tj5Eqs8cfvSICbTuUMfokCS', 1, 'Pedro Nuñez', '1980-06-24', 'true');
