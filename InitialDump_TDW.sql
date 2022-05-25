-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 26-05-2022 a las 00:44:48
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
-- Base de datos: `basededatos`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `entity`
--

CREATE TABLE `entity` (
  `id` int(11) NOT NULL,
  `name` varchar(80) COLLATE utf8_unicode_ci NOT NULL,
  `birthdate` datetime DEFAULT NULL,
  `deathdate` datetime DEFAULT NULL,
  `image_url` varchar(2047) COLLATE utf8_unicode_ci DEFAULT NULL,
  `wiki_url` varchar(2047) COLLATE utf8_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Volcado de datos para la tabla `entity`
--

INSERT INTO `entity` (`id`, `name`, `birthdate`, `deathdate`, `image_url`, `wiki_url`) VALUES
(1, 'IBM', '1924-01-01 00:00:00', NULL, 'https://upload.wikimedia.org/wikipedia/commons/f/fc/IBM_logo_in.jpg', 'https://es.wikipedia.org/wiki/IBM'),
(2, 'CERN', '1952-01-01 00:00:00', NULL, 'https://upload.wikimedia.org/wikipedia/en/a/ae/CERN_logo.svg', 'https://es.wikipedia.org/wiki/Organizaci%C3%B3n_Europea_para_la_Investigaci%C3%B3n_Nuclear'),
(3, 'W3C', '1994-01-01 00:00:00', NULL, 'https://www.paymentscardsandmobile.com/wp-content/uploads/2015/01/W3C.jpg', 'https://es.wikipedia.org/wiki/World_Wide_Web_Consortium');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `entity_contributes_product`
--

CREATE TABLE `entity_contributes_product` (
  `product_id` int(11) NOT NULL,
  `entity_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Volcado de datos para la tabla `entity_contributes_product`
--

INSERT INTO `entity_contributes_product` (`product_id`, `entity_id`) VALUES
(3, 2),
(3, 3),
(4, 1),
(4, 3),
(5, 1),
(5, 3),
(6, 2),
(7, 2),
(7, 3);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `person`
--

CREATE TABLE `person` (
  `id` int(11) NOT NULL,
  `name` varchar(80) COLLATE utf8_unicode_ci NOT NULL,
  `birthdate` datetime DEFAULT NULL,
  `deathdate` datetime DEFAULT NULL,
  `image_url` varchar(2047) COLLATE utf8_unicode_ci DEFAULT NULL,
  `wiki_url` varchar(2047) COLLATE utf8_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Volcado de datos para la tabla `person`
--

INSERT INTO `person` (`id`, `name`, `birthdate`, `deathdate`, `image_url`, `wiki_url`) VALUES
(3, 'Tim Berners Lee', '1955-06-08 00:00:00', NULL, 'https://upload.wikimedia.org/wikipedia/commons/thumb/4/4e/Sir_Tim_Berners-Lee_%28cropped%29.jpg/220px-Sir_Tim_Berners-Lee_%28cropped%29.jpg', 'https://es.wikipedia.org/wiki/Tim_Berners-Lee');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `person_contributes_product`
--

CREATE TABLE `person_contributes_product` (
  `product_id` int(11) NOT NULL,
  `person_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Volcado de datos para la tabla `person_contributes_product`
--

INSERT INTO `person_contributes_product` (`product_id`, `person_id`) VALUES
(3, 3),
(4, 3),
(5, 3),
(6, 3),
(7, 3);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `person_participates_entity`
--

CREATE TABLE `person_participates_entity` (
  `entity_id` int(11) NOT NULL,
  `person_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Volcado de datos para la tabla `person_participates_entity`
--

INSERT INTO `person_participates_entity` (`entity_id`, `person_id`) VALUES
(1, 3),
(2, 3),
(3, 3);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `product`
--

CREATE TABLE `product` (
  `id` int(11) NOT NULL,
  `name` varchar(80) COLLATE utf8_unicode_ci NOT NULL,
  `birthdate` datetime DEFAULT NULL,
  `deathdate` datetime DEFAULT NULL,
  `image_url` varchar(2047) COLLATE utf8_unicode_ci DEFAULT NULL,
  `wiki_url` varchar(2047) COLLATE utf8_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Volcado de datos para la tabla `product`
--

INSERT INTO `product` (`id`, `name`, `birthdate`, `deathdate`, `image_url`, `wiki_url`) VALUES
(3, 'XML', '1999-01-01 00:00:00', NULL, 'https://images-ext-2.discordapp.net/external/XR_oa0hoHQRsBq1W45TzGGjCqGEXPcKbZ2RSN-INge4/https/png.pngtree.com/png-vector/20190330/ourlarge/pngtree-xml-file-document-icon-png-image_893042.jpg', 'https://es.wikipedia.org/wiki/Extensible_Markup_Language'),
(4, 'HTML', '1980-01-01 00:00:00', NULL, 'https://images-ext-1.discordapp.net/external/Ccv48vdujMB92PC8N3DmYDViWIAvV0pdiM08ZINxHaQ/https/fernandosarachaga.com/wp-content/uploads/programming-language-html.jpeg', 'https://es.wikipedia.org/wiki/HTML'),
(5, 'HTTP', '1989-01-01 00:00:00', NULL, 'https://upload.wikimedia.org/wikipedia/commons/thumb/1/10/HTTP_logo_-_2014.svg/290px-HTTP_logo_-_2014.svg.png', 'https://es.wikipedia.org/wiki/Protocolo_de_transferencia_de_hipertexto'),
(6, 'CSS', '1996-01-01 00:00:00', NULL, 'https://picodotdev.github.io/blog-bitix/assets/images/structured-data/css-750.png', 'https://es.wikipedia.org/wiki/CSS'),
(7, 'JavaScript', '1995-01-01 00:00:00', NULL, 'https://pngset.com/images/logo-javascript-pattern-copyright-framework-free-javascript-logo-label-text-symbol-trademark-transparent-png-1498648.png', 'https://es.wikipedia.org/wiki/JavaScript');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `user`
--

CREATE TABLE `user` (
  `id` int(11) NOT NULL,
  `username` varchar(32) COLLATE utf8_unicode_ci NOT NULL,
  `email` varchar(60) COLLATE utf8_unicode_ci NOT NULL,
  `password` varchar(60) COLLATE utf8_unicode_ci NOT NULL,
  `realname` varchar(60) COLLATE utf8_unicode_ci DEFAULT NULL,
  `birthDate` varchar(60) COLLATE utf8_unicode_ci DEFAULT NULL,
  `role_value` smallint(6) NOT NULL,
  `isActive_value` smallint(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Volcado de datos para la tabla `user`
--

INSERT INTO `user` (`id`, `username`, `email`, `password`, `realname`, `birthDate`, `role_value`, `isActive_value`) VALUES
(1, 'adminUser', 'adminUser@example.com', '$2y$10$ZYoP739zQkYDURYlnRcIXe0Ykd/zc1P1v54BRhf2/HvoVRPoq8AO2', 'Pedro', '1990-08-09', 0, 1),
(5, 'fernando', 'Userrr_email@example.com', '$2y$10$V5hY37OP7FBryrtYC0U7XevP9od25VK0RPzAPpPYFU6UxgxhwG.MC', 'alvaro', '1999-06-18', 0, 1),
(7, 'fernando234', 'User444_email@example.com', '$2y$10$H8v9ts.z/73UuQ7ZQVoIauQdADL5SuNchsN01uTpcay8MbX5w529m', 'alvaro4444444', '1999-06-184444', 0, 0),
(8, 'username7878', 'User5787_email@example.com', '$2y$10$Hsu3.lEzwvT.nP1.0u2mUev/rSTtjK9wVxOLEe0RNWOqnxZrWBnue', 'alvaro756767657887', '1999-06-18787', 0, 0),
(9, 'username6578567567adsasdasd', 'User567567adsadasd_email@example.com', '$2y$10$Zbe0rNKG2JP8xsJX1x/pj.LBX96C6uZXd8ah9tu7cF9HXRiCB3DjK', 'alvaro756767asdasd65', '1999-06-18', 0, 0),
(10, '1', 'User567567adsaasdasddasd_email@example.com', '$2y$10$kd06MdgEPAX4AIzDno6EFuIMRhB5isBOWPOxbDJUhmByd5IIStV.S', 'alvaro756767asdasd65', '1999-06-18', 0, 1);

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `entity`
--
ALTER TABLE `entity`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `Entity_name_uindex` (`name`);

--
-- Indices de la tabla `entity_contributes_product`
--
ALTER TABLE `entity_contributes_product`
  ADD PRIMARY KEY (`product_id`,`entity_id`),
  ADD KEY `IDX_772C40B24584665A` (`product_id`),
  ADD KEY `IDX_772C40B281257D5D` (`entity_id`);

--
-- Indices de la tabla `person`
--
ALTER TABLE `person`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `Person_name_uindex` (`name`);

--
-- Indices de la tabla `person_contributes_product`
--
ALTER TABLE `person_contributes_product`
  ADD PRIMARY KEY (`product_id`,`person_id`),
  ADD KEY `IDX_5EBE1F014584665A` (`product_id`),
  ADD KEY `IDX_5EBE1F01217BBB47` (`person_id`);

--
-- Indices de la tabla `person_participates_entity`
--
ALTER TABLE `person_participates_entity`
  ADD PRIMARY KEY (`entity_id`,`person_id`),
  ADD KEY `IDX_9A036581257D5D` (`entity_id`),
  ADD KEY `IDX_9A0365217BBB47` (`person_id`);

--
-- Indices de la tabla `product`
--
ALTER TABLE `product`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `Product_name_uindex` (`name`);

--
-- Indices de la tabla `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `IDX_UNIQ_USERNAME` (`username`),
  ADD UNIQUE KEY `IDX_UNIQ_EMAIL` (`email`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `entity`
--
ALTER TABLE `entity`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `person`
--
ALTER TABLE `person`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `product`
--
ALTER TABLE `product`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT de la tabla `user`
--
ALTER TABLE `user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `entity_contributes_product`
--
ALTER TABLE `entity_contributes_product`
  ADD CONSTRAINT `FK_772C40B24584665A` FOREIGN KEY (`product_id`) REFERENCES `product` (`id`),
  ADD CONSTRAINT `FK_772C40B281257D5D` FOREIGN KEY (`entity_id`) REFERENCES `entity` (`id`);

--
-- Filtros para la tabla `person_contributes_product`
--
ALTER TABLE `person_contributes_product`
  ADD CONSTRAINT `FK_5EBE1F01217BBB47` FOREIGN KEY (`person_id`) REFERENCES `person` (`id`),
  ADD CONSTRAINT `FK_5EBE1F014584665A` FOREIGN KEY (`product_id`) REFERENCES `product` (`id`);

--
-- Filtros para la tabla `person_participates_entity`
--
ALTER TABLE `person_participates_entity`
  ADD CONSTRAINT `FK_9A0365217BBB47` FOREIGN KEY (`person_id`) REFERENCES `person` (`id`),
  ADD CONSTRAINT `FK_9A036581257D5D` FOREIGN KEY (`entity_id`) REFERENCES `entity` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
