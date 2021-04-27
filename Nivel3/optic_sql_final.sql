-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 27-04-2021 a las 19:05:18
-- Versión del servidor: 10.4.11-MariaDB
-- Versión de PHP: 7.4.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `optic`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `brand`
--

CREATE TABLE `brand` (
  `id_brand` int(11) NOT NULL,
  `name` varchar(45) NOT NULL,
  `supplier_brand_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `brand`
--

INSERT INTO `brand` (`id_brand`, `name`, `supplier_brand_id`) VALUES
(1, 'Ray Ban', 1),
(3, 'Carolina Herrera', 3);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `client`
--

CREATE TABLE `client` (
  `id_client` int(11) NOT NULL,
  `name` varchar(45) NOT NULL,
  `surname` varchar(45) NOT NULL,
  `address` varchar(100) NOT NULL,
  `telephone` varchar(11) NOT NULL,
  `email` varchar(255) NOT NULL,
  `registration_date` date NOT NULL,
  `recommended_client_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `client`
--

INSERT INTO `client` (`id_client`, `name`, `surname`, `address`, `telephone`, `email`, `registration_date`, `recommended_client_id`) VALUES
(1, 'Juan', 'Rodriguez', 'Avenida 20. 56324 Madrid', '666253214', 'juanRodriguez@gmail.com', '2021-04-13', NULL),
(5, 'Marta', 'Lopez', 'Poligono 234. 78965 Zaragoza', '666253214', 'martaLopez@gmail.com', '2021-04-15', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `color`
--

CREATE TABLE `color` (
  `id_glasses_color` int(11) NOT NULL,
  `glass_color_right` varchar(10) NOT NULL,
  `glass_color_left` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `color`
--

INSERT INTO `color` (`id_glasses_color`, `glass_color_right`, `glass_color_left`) VALUES
(1, 'Azul', 'Azul'),
(3, 'Verde', 'Verde'),
(5, 'Ahumado', 'Ahumado'),
(6, 'Gris', 'Gris');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `employee`
--

CREATE TABLE `employee` (
  `id_employee` int(11) NOT NULL,
  `name` varchar(45) NOT NULL,
  `surname` varchar(45) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `employee`
--

INSERT INTO `employee` (`id_employee`, `name`, `surname`) VALUES
(1, 'Jordi', 'Caballe'),
(5, 'Aitor', 'Zubizarreta'),
(7, 'Leire', 'Zurutuza');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `frame`
--

CREATE TABLE `frame` (
  `id_glasses_frame` int(11) NOT NULL,
  `type` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `frame`
--

INSERT INTO `frame` (`id_glasses_frame`, `type`) VALUES
(1, 'Flotante'),
(3, 'Pasta'),
(5, 'Metálica');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `glass`
--

CREATE TABLE `glass` (
  `id_glass` int(11) NOT NULL,
  `price` decimal(19,4) NOT NULL,
  `brand_glass_id` int(11) NOT NULL,
  `graduation_glass_id` int(11) NOT NULL,
  `color_glass_id` int(11) NOT NULL,
  `frame_glass_id` int(11) NOT NULL,
  `employee_glass_id` int(11) NOT NULL,
  `client_glass_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `glass`
--

INSERT INTO `glass` (`id_glass`, `price`, `brand_glass_id`, `graduation_glass_id`, `color_glass_id`, `frame_glass_id`, `employee_glass_id`, `client_glass_id`) VALUES
(1, '125.0000', 1, 1, 3, 5, 5, 1),
(2, '300.0000', 1, 5, 5, 1, 7, 1),
(3, '400.0000', 3, 5, 6, 5, 7, 5);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `graduation`
--

CREATE TABLE `graduation` (
  `id_glasses_graduation` int(11) NOT NULL,
  `glass_graduation_right` decimal(3,2) NOT NULL,
  `glass_graduation_left` decimal(3,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `graduation`
--

INSERT INTO `graduation` (`id_glasses_graduation`, `glass_graduation_right`, `glass_graduation_left`) VALUES
(1, '1.00', '1.00'),
(3, '1.10', '1.10'),
(5, '2.00', '2.00');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `supplier`
--

CREATE TABLE `supplier` (
  `id_supplier` int(11) NOT NULL,
  `name` varchar(45) NOT NULL,
  `address_street` varchar(45) NOT NULL,
  `address_number` int(11) NOT NULL,
  `address_floor` int(11) DEFAULT NULL,
  `address_letter` varchar(2) DEFAULT NULL,
  `address_city` varchar(30) NOT NULL,
  `address_post_code` int(11) NOT NULL,
  `address_country` varchar(20) NOT NULL,
  `telephone` varchar(11) NOT NULL,
  `fax` varchar(11) NOT NULL,
  `nie` varchar(16) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `supplier`
--

INSERT INTO `supplier` (`id_supplier`, `name`, `address_street`, `address_number`, `address_floor`, `address_letter`, `address_city`, `address_post_code`, `address_country`, `telephone`, `fax`, `nie`) VALUES
(1, 'Michael Night', 'Corso Sen', 9, 1, 'A', 'Castellabate', 84048, 'Italia', '666253214', '912356897', '58964578S'),
(3, 'Carol Villanueva', 'Gran Vía', 1, NULL, NULL, 'Madrid', 84048, 'España', '666253214', '912356897', '58964578S');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `brand`
--
ALTER TABLE `brand`
  ADD PRIMARY KEY (`id_brand`),
  ADD UNIQUE KEY `id_brand_UNIQUE` (`id_brand`),
  ADD KEY `supplier_brand_fk_idx` (`supplier_brand_id`);

--
-- Indices de la tabla `client`
--
ALTER TABLE `client`
  ADD PRIMARY KEY (`id_client`),
  ADD UNIQUE KEY `id_client_UNIQUE` (`id_client`),
  ADD KEY `recommended_client_fk_idx` (`recommended_client_id`);

--
-- Indices de la tabla `color`
--
ALTER TABLE `color`
  ADD PRIMARY KEY (`id_glasses_color`);

--
-- Indices de la tabla `employee`
--
ALTER TABLE `employee`
  ADD PRIMARY KEY (`id_employee`),
  ADD UNIQUE KEY `id_employee_UNIQUE` (`id_employee`);

--
-- Indices de la tabla `frame`
--
ALTER TABLE `frame`
  ADD PRIMARY KEY (`id_glasses_frame`),
  ADD UNIQUE KEY `id_glasses_frame_UNIQUE` (`id_glasses_frame`);

--
-- Indices de la tabla `glass`
--
ALTER TABLE `glass`
  ADD PRIMARY KEY (`id_glass`),
  ADD UNIQUE KEY `id_glass_UNIQUE` (`id_glass`),
  ADD KEY `brand_glass_fk_idx` (`brand_glass_id`),
  ADD KEY `graduation_glass_fk_idx` (`graduation_glass_id`),
  ADD KEY `color_glass_fk_idx` (`color_glass_id`),
  ADD KEY `frame_glass_fk_idx` (`frame_glass_id`),
  ADD KEY `employee_glass_fk_idx` (`employee_glass_id`),
  ADD KEY `client_glass_fk_idx` (`client_glass_id`);

--
-- Indices de la tabla `graduation`
--
ALTER TABLE `graduation`
  ADD PRIMARY KEY (`id_glasses_graduation`);

--
-- Indices de la tabla `supplier`
--
ALTER TABLE `supplier`
  ADD PRIMARY KEY (`id_supplier`),
  ADD UNIQUE KEY `id_supplier_UNIQUE` (`id_supplier`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `brand`
--
ALTER TABLE `brand`
  MODIFY `id_brand` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `client`
--
ALTER TABLE `client`
  MODIFY `id_client` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de la tabla `color`
--
ALTER TABLE `color`
  MODIFY `id_glasses_color` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT de la tabla `employee`
--
ALTER TABLE `employee`
  MODIFY `id_employee` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT de la tabla `frame`
--
ALTER TABLE `frame`
  MODIFY `id_glasses_frame` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de la tabla `glass`
--
ALTER TABLE `glass`
  MODIFY `id_glass` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `graduation`
--
ALTER TABLE `graduation`
  MODIFY `id_glasses_graduation` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT de la tabla `supplier`
--
ALTER TABLE `supplier`
  MODIFY `id_supplier` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `brand`
--
ALTER TABLE `brand`
  ADD CONSTRAINT `supplier_brand_fk` FOREIGN KEY (`supplier_brand_id`) REFERENCES `supplier` (`id_supplier`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `client`
--
ALTER TABLE `client`
  ADD CONSTRAINT `recommended_client_fk` FOREIGN KEY (`recommended_client_id`) REFERENCES `client` (`id_client`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `glass`
--
ALTER TABLE `glass`
  ADD CONSTRAINT `brand_glass_fk` FOREIGN KEY (`brand_glass_id`) REFERENCES `brand` (`id_brand`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `client_glass_fk` FOREIGN KEY (`client_glass_id`) REFERENCES `client` (`id_client`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `color_glass_fk` FOREIGN KEY (`color_glass_id`) REFERENCES `color` (`id_glasses_color`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `employee_glass_fk` FOREIGN KEY (`employee_glass_id`) REFERENCES `employee` (`id_employee`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `frame_glass_fk` FOREIGN KEY (`frame_glass_id`) REFERENCES `frame` (`id_glasses_frame`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `graduation_glass_fk` FOREIGN KEY (`graduation_glass_id`) REFERENCES `graduation` (`id_glasses_graduation`) ON DELETE NO ACTION ON UPDATE NO ACTION;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
