-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 02-11-2023 a las 05:30:08
-- Versión del servidor: 10.4.28-MariaDB
-- Versión de PHP: 8.1.20

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `toursexplorer`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `calificaciones`
--

CREATE TABLE `calificaciones` (
  `id_calificaciones` int(11) NOT NULL,
  `comentario` varchar(100) NOT NULL,
  `calificacion` varchar(100) NOT NULL,
  `id_usuario` int(11) NOT NULL,
  `id_tour` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `imagenes`
--

CREATE TABLE `imagenes` (
  `id_imagen` int(11) NOT NULL,
  `nombre_imagen` varchar(100) NOT NULL,
  `url_imagen` varchar(100) NOT NULL,
  `texto_alternativo_imagen` varchar(100) NOT NULL,
  `id_lugar` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Volcado de datos para la tabla `imagenes`
--

INSERT INTO `imagenes` (`id_imagen`, `nombre_imagen`, `url_imagen`, `texto_alternativo_imagen`, `id_lugar`) VALUES
(6, '654209963afdd.jpeg', 'C:\\Users\\eh180\\OneDrive\\Escritorio\\SIC115\\andrea\\helpers/../uploads/imagenes/654209963afdd.jpeg', '654209963afdd.jpeg', 16),
(8, '654209a930ee8.png', 'C:\\Users\\eh180\\OneDrive\\Escritorio\\SIC115\\andrea\\helpers/../uploads/imagenes/654209a930ee8.png', '654209a930ee8.png', 9),
(9, '6542d5f148f50.png', 'C:\\Users\\eh180\\OneDrive\\Escritorio\\SIC115\\alonso\\helpers/../uploads/imagenes/6542d5f148f50.png', '6542d5f148f50.png', 15),
(10, '6542d5f79552b.png', 'C:\\Users\\eh180\\OneDrive\\Escritorio\\SIC115\\alonso\\helpers/../uploads/imagenes/6542d5f79552b.png', '6542d5f79552b.png', 15),
(11, '65432618c0349.png', 'C:\\Users\\eh180\\OneDrive\\Escritorio\\SIC115\\tour\\helpers/../uploads/imagenes/65432618c0349.png', '65432618c0349.png', 23);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `lugares`
--

CREATE TABLE `lugares` (
  `id_lugar` int(11) NOT NULL,
  `nombre_lugar` varchar(100) NOT NULL,
  `descripcion_lugar` varchar(100) NOT NULL,
  `direccion_lugar` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Volcado de datos para la tabla `lugares`
--

INSERT INTO `lugares` (`id_lugar`, `nombre_lugar`, `descripcion_lugar`, `direccion_lugar`) VALUES
(9, 'Sed harum minus ut c', 'Omnis sed qui et et ', 'Sed sed duis consequ'),
(15, 'Excepteur dolore eiu', 'Doloribus autem beat', 'Commodo sunt eiusmo'),
(16, 'Excepteur dolore eiuaa', 'Doloribus autem beataa', 'Commodo sunt eiusmoaa'),
(17, 'Excepteur dolore eiu', 'Doloribus autem beat', 'Commodo sunt eiusmo'),
(21, 'Quia asperiores aliq', 'Harum suscipit illo ', 'Omnis consequatur I'),
(22, 'Quidem blanditiis vo', 'Facilis vel tempore', 'Voluptatem velit ut'),
(23, 'Illo consectetur el editado', 'Necessitatibus venia editado', 'Omnis ipsum anim do editado');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pagos`
--

CREATE TABLE `pagos` (
  `id_pago` int(11) NOT NULL,
  `metodo_de_pago` varchar(100) NOT NULL,
  `monto_pagado` varchar(100) NOT NULL,
  `fecha_de_pago` datetime NOT NULL,
  `id_reserva` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Volcado de datos para la tabla `pagos`
--

INSERT INTO `pagos` (`id_pago`, `metodo_de_pago`, `monto_pagado`, `fecha_de_pago`, `id_reserva`) VALUES
(2, 'efectivo', '10', '2023-11-02 05:17:41', 12),
(3, 'efectivo', '10', '2023-11-02 05:18:31', 14);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `reservas`
--

CREATE TABLE `reservas` (
  `id_reserva` int(11) NOT NULL,
  `fecha_reserva` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `estado` varchar(100) NOT NULL,
  `id_usuario` int(11) NOT NULL,
  `id_tour` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Volcado de datos para la tabla `reservas`
--

INSERT INTO `reservas` (`id_reserva`, `fecha_reserva`, `estado`, `id_usuario`, `id_tour`) VALUES
(12, '2023-11-02 05:17:41', 'aceptada', 15, 5),
(14, '2023-11-02 05:18:31', 'aceptada', 15, 3),
(15, '2023-11-02 11:18:12', 'pendiente', 15, 4),
(16, '2023-11-02 11:18:23', 'pendiente', 15, 6);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `roles`
--

CREATE TABLE `roles` (
  `id_rol` int(11) NOT NULL,
  `nombre_rol` varchar(50) NOT NULL,
  `llave` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `roles`
--

INSERT INTO `roles` (`id_rol`, `nombre_rol`, `llave`) VALUES
(1, 'Cliente', 'turista'),
(2, 'Administrador', 'admin'),
(3, 'Operador', 'operador');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `todos`
--

CREATE TABLE `todos` (
  `id` int(11) NOT NULL,
  `nombre` varchar(255) NOT NULL,
  `descripcion` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `todos`
--

INSERT INTO `todos` (`id`, `nombre`, `descripcion`) VALUES
(1, 'Pariatur Deserunt i', 'Unde porro laborum '),
(2, 'Quam reiciendis quae', 'Consequatur aut des'),
(3, 'Quam reiciendis quae', 'Consequatur aut des'),
(4, 'Quam reiciendis quae', 'Consequatur aut des'),
(5, 'Quam reiciendis quae', 'Consequatur aut des'),
(6, 'Nombre', 'Descripción'),
(7, 'Nombre', 'Descripción'),
(8, 'Omnis cupiditate lib', 'Lorem et cupiditate '),
(9, 'Sed qui tempor et qu', 'Quod ad autem sed do'),
(10, 'Sed qui tempor et qu', 'Quod ad autem sed do'),
(11, 'Sed qui tempor et qu', 'Quod ad autem sed do'),
(12, 'Ea consequatur nemo', 'Lorem amet deserunt'),
(13, 'Ea consequatur nemo', 'Lorem amet deserunt'),
(14, 'Ea consequatur nemo', 'Lorem amet deserunt'),
(15, 'Ea consequatur nemo', 'Lorem amet deserunt'),
(16, 'Ea consequatur nemo', 'Lorem amet deserunt'),
(17, 'Ea consequatur nemo', 'Lorem amet deserunt'),
(18, 'Ea consequatur nemo', 'Lorem amet deserunt'),
(19, 'Ea consequatur nemo', 'Lorem amet deserunt'),
(20, 'Dolore veniam alias', 'Neque corrupti est '),
(21, 'Sunt consequuntur ex', 'Sint deserunt corru'),
(22, 'Sunt consequuntur ex', 'Sint deserunt corru'),
(23, 'Sunt consequuntur ex', 'Sint deserunt corru'),
(24, 'Consequatur Odio do', 'Reiciendis sint volu'),
(25, 'Consequatur Odio do', 'Reiciendis sint volu'),
(26, 'Vel omnis officiis s', 'Saepe magni consecte'),
(27, 'Vel omnis officiis s', 'Saepe magni consecte'),
(28, 'Vel omnis officiis s', 'Saepe magni consecte'),
(29, 'Vel omnis officiis s', 'Saepe magni consecte'),
(30, 'Vel omnis officiis s', 'Saepe magni consecte'),
(31, 'Vel omnis officiis s', 'Saepe magni consecte'),
(32, 'Vel omnis officiis s', 'Saepe magni consecte'),
(33, 'Et laborum nulla eli', 'Sint est beatae exc');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tours`
--

CREATE TABLE `tours` (
  `id_tour` int(11) NOT NULL,
  `nombre_tour` varchar(100) NOT NULL,
  `imagen_tour` varchar(255) DEFAULT NULL,
  `url_imagen_tour` varchar(255) DEFAULT NULL,
  `descripcion_tour` varchar(100) NOT NULL,
  `precio_tour` varchar(100) NOT NULL,
  `disponibilidad_tour` varchar(100) NOT NULL,
  `fecha_salida_tour` datetime NOT NULL,
  `fecha_regreso_tour` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Volcado de datos para la tabla `tours`
--

INSERT INTO `tours` (`id_tour`, `nombre_tour`, `imagen_tour`, `url_imagen_tour`, `descripcion_tour`, `precio_tour`, `disponibilidad_tour`, `fecha_salida_tour`, `fecha_regreso_tour`) VALUES
(3, 'Hic commodo minima d', '6542ba0485f9d.jpeg', 'C:\\Users\\eh180\\OneDrive\\Escritorio\\SIC115\\alonso\\uploads\\tours/6542ba0485f9d.jpeg', 'Suscipit voluptatem ', '10', '20', '2023-11-30 06:07:00', '1998-03-08 02:48:00'),
(4, 'Hic commodo minima d', '6542c14a9c08a.jpeg', 'C:\\Users\\eh180\\OneDrive\\Escritorio\\SIC115\\alonso\\uploads\\tours/6542c14a9c08a.jpeg', 'Suscipit voluptatem ', '10', '20', '2023-11-24 06:07:00', '1998-03-08 02:48:00'),
(5, 'Hic commodo minima d', '6542c18f3c64d.png', 'C:\\Users\\eh180\\OneDrive\\Escritorio\\SIC115\\alonso\\uploads\\tours/6542c18f3c64d.png', 'Suscipit voluptatem ', '10', '20', '2023-11-24 06:07:00', '1998-03-08 02:48:00'),
(6, 'Hic commodo minima d', '6542c1a6e9158.png', 'C:\\Users\\eh180\\OneDrive\\Escritorio\\SIC115\\alonso\\uploads\\tours/6542c1a6e9158.png', 'Suscipit voluptatem ', '10', '20', '2023-12-01 06:07:00', '1998-03-08 02:48:00'),
(7, 'Qui reiciendis conse', '654290fbc99e0.jpeg', 'C:\\Users\\eh180\\OneDrive\\Escritorio\\SIC115\\alonso\\uploads\\tours654290fbc99e0.jpeg', 'Exercitation nihil s', 'Dicta in cupidatat d', 'Cumque autem non duc', '1993-06-10 09:58:00', '2007-05-12 15:43:00'),
(8, 'Qui reiciendis conse', '654291cb76299.jpeg', 'C:\\Users\\eh180\\OneDrive\\Escritorio\\SIC115\\alonso\\uploads\\tours654291cb76299.jpeg', 'Exercitation nihil s', 'Dicta in cupidatat d', 'Cumque autem non duc', '1993-06-10 09:58:00', '2007-05-12 15:43:00'),
(10, 'Qui reiciendis conse', '654291f35eb94.jpeg', 'C:\\Users\\eh180\\OneDrive\\Escritorio\\SIC115\\alonso\\uploads\\tours654291f35eb94.jpeg', 'Exercitation nihil s', 'Dicta in cupidatat d', 'Cumque autem non duc', '1993-06-10 09:58:00', '2007-05-12 15:43:00');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tours_lugares`
--

CREATE TABLE `tours_lugares` (
  `id_tour` int(11) NOT NULL,
  `id_lugar` int(11) NOT NULL,
  `hora_inicio` timestamp NULL DEFAULT NULL,
  `hora_fin` timestamp NULL DEFAULT NULL,
  `id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Volcado de datos para la tabla `tours_lugares`
--

INSERT INTO `tours_lugares` (`id_tour`, `id_lugar`, `hora_inicio`, `hora_fin`, `id`) VALUES
(10, 9, '2021-08-01 16:32:00', '1973-11-24 16:19:00', 1),
(3, 15, '2023-11-01 20:33:00', '2023-11-08 20:33:00', 28),
(3, 17, '2023-11-02 20:36:00', '2023-11-10 20:36:00', 29);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuarios`
--

CREATE TABLE `usuarios` (
  `id_usuario` int(11) NOT NULL,
  `id_rol` int(11) NOT NULL DEFAULT 1,
  `nombre` varchar(125) NOT NULL,
  `correo` varchar(255) NOT NULL,
  `contrasena` varchar(100) NOT NULL,
  `genero` varchar(25) DEFAULT NULL,
  `direccion` varchar(255) DEFAULT NULL,
  `telefono` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Volcado de datos para la tabla `usuarios`
--

INSERT INTO `usuarios` (`id_usuario`, `id_rol`, `nombre`, `correo`, `contrasena`, `genero`, `direccion`, `telefono`) VALUES
(2, 2, 'Culpa duis dolorum ', 'admin@admin.com', '$2y$10$Hqcl9eUmjgg95QyVDLnCfeLA74YgTZWXyY8ykMvPwBCn/yNAKQO36', 'male', 'Rerum ad ipsum ut ex', 'Laboris eos quia rep'),
(3, 1, 'Obcaecati est dolore', 'lubyrax@mailinator.com', '$2y$10$Hqcl9eUmjgg95QyVDLnCfeLA74YgTZWXyY8ykMvPwBCn/yNAKQO36', 'female', 'Corrupti officia ve', 'Itaque ea totam est'),
(4, 1, 'Vel dolore aperiam a', 'kymyf@mailinator.com', '$2y$10$Hqcl9eUmjgg95QyVDLnCfeLA74YgTZWXyY8ykMvPwBCn/yNAKQO36', 'male', 'Architecto natus aut', 'Tenetur minus mollit'),
(5, 1, 'Necessitatibus dolor', 'gagyc@mailinator.com', '$2y$10$Hqcl9eUmjgg95QyVDLnCfeLA74YgTZWXyY8ykMvPwBCn/yNAKQO36', 'male', 'Ut exercitationem in', 'Voluptatem Vitae la'),
(6, 3, 'Molestiae sint provi', 'qapivuzu@mailinator.com', '$2y$10$Hqcl9eUmjgg95QyVDLnCfeLA74YgTZWXyY8ykMvPwBCn/yNAKQO36', 'male', 'Esse fuga Fugiat c', 'Sint praesentium as'),
(7, 1, 'Qui odio qui digniss', 'nunezabal@mailinator.com', '$2y$10$k.bEwRb6wc9PolQLJilheetqldFNLxmpgYthCMxJFP0iCrOi4y/3e', 'female', 'Est veniam ab dele', 'Expedita magnam odit'),
(8, 1, 'Eius id enim quia il', 'turista@turista.com', '$2y$10$Hqcl9eUmjgg95QyVDLnCfeLA74YgTZWXyY8ykMvPwBCn/yNAKQO36', 'male', 'Eum dicta aliquam la', 'Aut nesciunt culpa'),
(9, 2, 'Tempora dolores aper', 'muzuzudax@mailinator.com', '$2y$10$Hqcl9eUmjgg95QyVDLnCfeLA74YgTZWXyY8ykMvPwBCn/yNAKQO36', 'male', 'Nostrud velit quae l', 'Irure tenetur ex asp'),
(10, 1, 'Iste cum amet quisq', 'wuxyzedali@mailinator.com', '$2y$10$Hqcl9eUmjgg95QyVDLnCfeLA74YgTZWXyY8ykMvPwBCn/yNAKQO36', 'male', 'Quis ipsum consequat', 'Exercitation officii'),
(11, 1, 'Quia ea culpa volup', 'nelofu@mailinator.com', '$2y$10$Hqcl9eUmjgg95QyVDLnCfeLA74YgTZWXyY8ykMvPwBCn/yNAKQO36', 'female', 'Consequatur illo om', 'Exercitationem excep'),
(12, 2, 'Ipsa natus fuga Qu', 'donapysuj@mailinator.com', '$2y$10$Hqcl9eUmjgg95QyVDLnCfeLA74YgTZWXyY8ykMvPwBCn/yNAKQO36', 'male', 'Sint quasi aliquip ', 'Veniam totam ex fug'),
(13, 3, 'Voluptas qui enim eo', 'operador@operador.com', '$2y$10$Hqcl9eUmjgg95QyVDLnCfeLA74YgTZWXyY8ykMvPwBCn/yNAKQO36', 'male', 'Quo est autem invent', 'Ut earum ipsum expl'),
(15, 1, 'Hic quas voluptate p', 'cris@cris.com', '$2y$10$Hqcl9eUmjgg95QyVDLnCfeLA74YgTZWXyY8ykMvPwBCn/yNAKQO36', 'female', 'Dolores dolore rerum', 'Excepteur sit quis n'),
(16, 1, 'Labore quam deserunt', 'test@test1.com', '$2y$10$MgiDvmniVNk769TFzGOqB.ckyc7s0PDy9QiH0tj4FSK5vcN16TOs2', 'male', 'Exercitationem exerc', 'Vitae debitis qui qu');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `calificaciones`
--
ALTER TABLE `calificaciones`
  ADD PRIMARY KEY (`id_calificaciones`),
  ADD KEY `calificaciones_FK` (`id_usuario`),
  ADD KEY `calificaciones_FK_1` (`id_tour`);

--
-- Indices de la tabla `imagenes`
--
ALTER TABLE `imagenes`
  ADD PRIMARY KEY (`id_imagen`),
  ADD KEY `imagenes_FK` (`id_lugar`);

--
-- Indices de la tabla `lugares`
--
ALTER TABLE `lugares`
  ADD PRIMARY KEY (`id_lugar`);

--
-- Indices de la tabla `pagos`
--
ALTER TABLE `pagos`
  ADD PRIMARY KEY (`id_pago`),
  ADD KEY `pagos_FK` (`id_reserva`);

--
-- Indices de la tabla `reservas`
--
ALTER TABLE `reservas`
  ADD PRIMARY KEY (`id_reserva`),
  ADD KEY `reservas_FK` (`id_usuario`),
  ADD KEY `reservas_FK_1` (`id_tour`);

--
-- Indices de la tabla `roles`
--
ALTER TABLE `roles`
  ADD PRIMARY KEY (`id_rol`),
  ADD UNIQUE KEY `llave_rol` (`llave`);

--
-- Indices de la tabla `todos`
--
ALTER TABLE `todos`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `tours`
--
ALTER TABLE `tours`
  ADD PRIMARY KEY (`id_tour`);

--
-- Indices de la tabla `tours_lugares`
--
ALTER TABLE `tours_lugares`
  ADD PRIMARY KEY (`id`),
  ADD KEY `tours_lugares_FK` (`id_tour`),
  ADD KEY `tours_lugares_FK_1` (`id_lugar`);

--
-- Indices de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  ADD PRIMARY KEY (`id_usuario`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `calificaciones`
--
ALTER TABLE `calificaciones`
  MODIFY `id_calificaciones` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `imagenes`
--
ALTER TABLE `imagenes`
  MODIFY `id_imagen` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT de la tabla `lugares`
--
ALTER TABLE `lugares`
  MODIFY `id_lugar` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=26;

--
-- AUTO_INCREMENT de la tabla `pagos`
--
ALTER TABLE `pagos`
  MODIFY `id_pago` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `reservas`
--
ALTER TABLE `reservas`
  MODIFY `id_reserva` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT de la tabla `roles`
--
ALTER TABLE `roles`
  MODIFY `id_rol` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `todos`
--
ALTER TABLE `todos`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=34;

--
-- AUTO_INCREMENT de la tabla `tours`
--
ALTER TABLE `tours`
  MODIFY `id_tour` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT de la tabla `tours_lugares`
--
ALTER TABLE `tours_lugares`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=32;

--
-- AUTO_INCREMENT de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  MODIFY `id_usuario` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `calificaciones`
--
ALTER TABLE `calificaciones`
  ADD CONSTRAINT `calificaciones_FK` FOREIGN KEY (`id_usuario`) REFERENCES `usuarios` (`id_usuario`),
  ADD CONSTRAINT `calificaciones_FK_1` FOREIGN KEY (`id_tour`) REFERENCES `tours` (`id_tour`);

--
-- Filtros para la tabla `imagenes`
--
ALTER TABLE `imagenes`
  ADD CONSTRAINT `imagenes_FK` FOREIGN KEY (`id_lugar`) REFERENCES `lugares` (`id_lugar`);

--
-- Filtros para la tabla `pagos`
--
ALTER TABLE `pagos`
  ADD CONSTRAINT `pagos_FK` FOREIGN KEY (`id_reserva`) REFERENCES `reservas` (`id_reserva`);

--
-- Filtros para la tabla `reservas`
--
ALTER TABLE `reservas`
  ADD CONSTRAINT `reservas_FK` FOREIGN KEY (`id_usuario`) REFERENCES `usuarios` (`id_usuario`),
  ADD CONSTRAINT `reservas_FK_1` FOREIGN KEY (`id_tour`) REFERENCES `tours` (`id_tour`);

--
-- Filtros para la tabla `tours_lugares`
--
ALTER TABLE `tours_lugares`
  ADD CONSTRAINT `tours_lugares_FK` FOREIGN KEY (`id_tour`) REFERENCES `tours` (`id_tour`),
  ADD CONSTRAINT `tours_lugares_FK_1` FOREIGN KEY (`id_lugar`) REFERENCES `lugares` (`id_lugar`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
