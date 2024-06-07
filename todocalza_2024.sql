-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 06-06-2024 a las 21:35:13
-- Versión del servidor: 10.4.32-MariaDB
-- Versión de PHP: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `todocalza_2024`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `administradores`
--

CREATE TABLE `administradores` (
  `id_admin` int(11) NOT NULL,
  `contrasena` varchar(50) DEFAULT NULL,
  `correo_electronico` varchar(255) NOT NULL,
  `nombre_completo` varchar(255) NOT NULL,
  `numero_documento` varchar(255) NOT NULL,
  `telefono` varchar(255) NOT NULL,
  `tipo_documento` varchar(255) NOT NULL,
  `role` varchar(255) NOT NULL DEFAULT 'admin',
  `productos_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `administradores`
--

INSERT INTO `administradores` (`id_admin`, `contrasena`, `correo_electronico`, `nombre_completo`, `numero_documento`, `telefono`, `tipo_documento`, `role`, `productos_id`) VALUES
(3, 'Todo.123', 'jvargas764024@cue.edu.co', 'jorge vargas', '3102826932', '3122547798', 'cc', 'admin', NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `compra_usuario`
--

CREATE TABLE `compra_usuario` (
  `id_compra` int(11) NOT NULL,
  `nombre` varchar(50) NOT NULL,
  `email` varchar(50) NOT NULL,
  `telefono` varchar(10) NOT NULL,
  `medio_pago` varchar(50) NOT NULL,
  `tipo_banco` varchar(50) NOT NULL,
  `num_tarjeta` varchar(20) DEFAULT NULL,
  `cvv` varchar(4) DEFAULT NULL,
  `fecha` timestamp NOT NULL DEFAULT current_timestamp(),
  `id_usuario` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `compra_usuario`
--

INSERT INTO `compra_usuario` (`id_compra`, `nombre`, `email`, `telefono`, `medio_pago`, `tipo_banco`, `num_tarjeta`, `cvv`, `fecha`, `id_usuario`) VALUES
(2, 'jorge lopez', 'lopezjjorgej@outlook.com', '3122547798', 'paypal', 'davivienda', '', '', '2024-05-28 02:42:59', 15),
(3, 'jorge lopez', 'lopezjjorgej@outlook.com', '3122547798', 'psp', 'bbva', '', '', '2024-05-28 18:26:56', 15),
(7, 'jorge lopez', 'lopezjjorgej@outlook.com', '3102826932', 'paypal', 'davivienda', '', '', '2024-06-04 02:57:29', 15),
(8, 'jorge lopez', 'lopezjjorgej@outlook.com', '3102826932', 'paypal', 'davivienda', '', '', '2024-06-05 17:22:33', 15);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `mensajes`
--

CREATE TABLE `mensajes` (
  `id_mensajes` int(11) NOT NULL,
  `nombre` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `mensaje` text NOT NULL,
  `fecha` timestamp NOT NULL DEFAULT current_timestamp(),
  `usuario_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `mensajes`
--

INSERT INTO `mensajes` (`id_mensajes`, `nombre`, `email`, `mensaje`, `fecha`, `usuario_id`) VALUES
(1, 'jorge vargas', 'jorgervargaslopezs366@gmail.com', 'mensaje de prueba', '2024-05-18 19:30:07', NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `password_resets`
--

CREATE TABLE `password_resets` (
  `email` varchar(255) NOT NULL,
  `token` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `usuario_id` int(11) DEFAULT NULL,
  `admin_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `password_resets`
--

INSERT INTO `password_resets` (`email`, `token`, `created_at`, `usuario_id`, `admin_id`) VALUES
('JORGEVARGASLOPEZS366@GMAIL.COM', '086abd7344fbd1e85b73f4d0f4adfbb7', '2024-05-29 18:26:24', NULL, NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `productos`
--

CREATE TABLE `productos` (
  `id_productos` int(11) NOT NULL,
  `nombre` varchar(70) NOT NULL,
  `descripcion` text NOT NULL,
  `precio` decimal(10,2) NOT NULL,
  `imagenUrl` varchar(255) NOT NULL,
  `admin_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `productos`
--

INSERT INTO `productos` (`id_productos`, `nombre`, `descripcion`, `precio`, `imagenUrl`, `admin_id`) VALUES
(2, 'pradera', 'tacon sandalia marca pradera', 136000.00, 'uploads/6657764c90a8b0.65588044.png', NULL),
(3, 'picaso', 'zapato casual marca picaso', 133000.00, 'uploads/6657765a5f6c68.33021130.png', NULL),
(4, 'Roldon', 'tenis botines marca roldon, para adulto y niños.', 165000.00, 'uploads/66577664038730.23428391.png', NULL),
(5, 'calzado par dama, estilos variados.', 'zapatos para toda ocasión, que esperas!!!', 235000.00, 'uploads/665752f5602ac4.13460322.jpg', NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuario`
--

CREATE TABLE `usuario` (
  `id_usuario` int(11) NOT NULL,
  `nombre_completo` varchar(50) DEFAULT NULL,
  `tipo_documento` varchar(22) DEFAULT NULL,
  `numero_documento` varchar(13) DEFAULT NULL,
  `correo_electronico` varchar(50) DEFAULT NULL,
  `telefono` varchar(10) DEFAULT NULL,
  `contrasena` varchar(50) DEFAULT NULL,
  `role` varchar(13) DEFAULT NULL,
  `mensajes_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `usuario`
--

INSERT INTO `usuario` (`id_usuario`, `nombre_completo`, `tipo_documento`, `numero_documento`, `correo_electronico`, `telefono`, `contrasena`, `role`, `mensajes_id`) VALUES
(15, 'jorge lopez', 'cc', '3122547798', 'Lopezjjorgej@outlook.com', '3102826932', 'Todo123', 'usuario', NULL),
(16, 'maria diaz', 'cc', '1072098475', 'jorgevargaslopezs366@gmail.com', '3122547798', 'Todo123', 'usuario', NULL);

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `administradores`
--
ALTER TABLE `administradores`
  ADD PRIMARY KEY (`id_admin`),
  ADD KEY `fk_productos` (`productos_id`);

--
-- Indices de la tabla `compra_usuario`
--
ALTER TABLE `compra_usuario`
  ADD PRIMARY KEY (`id_compra`),
  ADD KEY `id_usuario` (`id_usuario`);

--
-- Indices de la tabla `mensajes`
--
ALTER TABLE `mensajes`
  ADD PRIMARY KEY (`id_mensajes`),
  ADD KEY `fk_usuario` (`usuario_id`);

--
-- Indices de la tabla `password_resets`
--
ALTER TABLE `password_resets`
  ADD PRIMARY KEY (`email`,`token`),
  ADD KEY `fk_usuario3` (`usuario_id`),
  ADD KEY `fk_admin2` (`admin_id`);

--
-- Indices de la tabla `productos`
--
ALTER TABLE `productos`
  ADD PRIMARY KEY (`id_productos`),
  ADD KEY `fk_admin` (`admin_id`);

--
-- Indices de la tabla `usuario`
--
ALTER TABLE `usuario`
  ADD PRIMARY KEY (`id_usuario`),
  ADD KEY `fk_mensaje` (`mensajes_id`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `administradores`
--
ALTER TABLE `administradores`
  MODIFY `id_admin` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `compra_usuario`
--
ALTER TABLE `compra_usuario`
  MODIFY `id_compra` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT de la tabla `mensajes`
--
ALTER TABLE `mensajes`
  MODIFY `id_mensajes` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `productos`
--
ALTER TABLE `productos`
  MODIFY `id_productos` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de la tabla `usuario`
--
ALTER TABLE `usuario`
  MODIFY `id_usuario` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `administradores`
--
ALTER TABLE `administradores`
  ADD CONSTRAINT `fk_productos` FOREIGN KEY (`productos_id`) REFERENCES `productos` (`id_productos`);

--
-- Filtros para la tabla `compra_usuario`
--
ALTER TABLE `compra_usuario`
  ADD CONSTRAINT `compra_usuario_ibfk_1` FOREIGN KEY (`id_usuario`) REFERENCES `usuario` (`id_usuario`);

--
-- Filtros para la tabla `mensajes`
--
ALTER TABLE `mensajes`
  ADD CONSTRAINT `fk_usuario` FOREIGN KEY (`usuario_id`) REFERENCES `usuario` (`id_usuario`);

--
-- Filtros para la tabla `password_resets`
--
ALTER TABLE `password_resets`
  ADD CONSTRAINT `fk_admin2` FOREIGN KEY (`admin_id`) REFERENCES `administradores` (`id_admin`),
  ADD CONSTRAINT `fk_usuario3` FOREIGN KEY (`usuario_id`) REFERENCES `usuario` (`id_usuario`);

--
-- Filtros para la tabla `productos`
--
ALTER TABLE `productos`
  ADD CONSTRAINT `fk_admin` FOREIGN KEY (`admin_id`) REFERENCES `administradores` (`id_admin`);

--
-- Filtros para la tabla `usuario`
--
ALTER TABLE `usuario`
  ADD CONSTRAINT `fk_mensaje` FOREIGN KEY (`mensajes_id`) REFERENCES `mensajes` (`id_mensajes`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
