-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 09-06-2020 a las 00:58:04
-- Versión del servidor: 10.4.11-MariaDB
-- Versión de PHP: 7.2.30

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `milco`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `categoria`
--

CREATE TABLE `categoria` (
  `id_categoria` int(11) NOT NULL,
  `nombre_cate` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL,
  `detalle` varchar(30) COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `categoria`
--

INSERT INTO `categoria` (`id_categoria`, `nombre_cate`, `detalle`) VALUES
(1, 'ENLATADO', ''),
(2, 'LACTEO', ''),
(3, 'BOTANA', ''),
(4, 'CONFITERIA', ''),
(5, 'HARINA', ''),
(6, 'FRUTA', ''),
(7, 'VERDURA', ''),
(8, 'BEBIDA', ''),
(9, 'BEBIDA ALCOHOLICA', ''),
(10, 'ALIMENTO PREPARADO', ''),
(11, 'CARNE EMBUTIDO', ''),
(12, 'AUTOMEDICACION', ''),
(13, 'HIGIENE PERSONAL', ''),
(14, 'USO DOMESTICO', ''),
(15, 'HELADOS', ''),
(16, 'PRODUCTO DE LIMPIEZA', ''),
(17, 'CONDIMENTO DE COCINA', ''),
(18, 'CEREAL', ''),
(19, 'PASTA', ''),
(20, 'PINTURA', ''),
(21, 'FERRETERIA', ''),
(22, 'HIERVA', ''),
(23, 'MENESTRA', ''),
(34, 'MERCERIA', NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `clase`
--

CREATE TABLE `clase` (
  `id_clase` int(11) NOT NULL,
  `nombre_cla` varchar(40) COLLATE utf8mb4_unicode_ci NOT NULL,
  `detalle` varchar(30) COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `clase`
--

INSERT INTO `clase` (`id_clase`, `nombre_cla`, `detalle`) VALUES
(1, 'HERRAMIENTA DE MANO', ''),
(2, 'HERRAMIENTA DE SEGURIDAD', ''),
(3, 'HERRAMIENTA ELECTRICA', ''),
(4, 'HERRAMIENTA DE REPARACION DE HOGAR', ''),
(5, 'HERRAMIENTA DE ACABADO DE HOGAR', ''),
(6, 'HERRAMIENTA ', ''),
(7, 'ADORNO', ''),
(8, 'RECETA', ''),
(9, 'ACCESORIO', 'COMPLEMENTO DE ALGUN OBJETO'),
(10, 'ESCOLAR', '');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cliente`
--

CREATE TABLE `cliente` (
  `id_cliente` int(11) NOT NULL,
  `dni` int(8) NOT NULL,
  `nombre` varchar(30) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `sexo` varchar(6) COLLATE utf8mb4_unicode_ci NOT NULL,
  `detalle` varchar(80) COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `compra`
--

CREATE TABLE `compra` (
  `id_compra` int(11) NOT NULL,
  `proveedor_id` int(11) NOT NULL,
  `fecha` date NOT NULL,
  `detalle` varchar(80) COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `detalle_compra`
--

CREATE TABLE `detalle_compra` (
  `id_Dcompra` int(11) NOT NULL,
  `compra_id` int(11) NOT NULL,
  `producto_id` int(11) NOT NULL,
  `precio_compra` decimal(5,2) NOT NULL,
  `cantidad` decimal(5,2) NOT NULL,
  `impuesto` decimal(5,0) NOT NULL,
  `total` decimal(5,0) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `detalle_venta`
--

CREATE TABLE `detalle_venta` (
  `id_Dventa` int(11) NOT NULL,
  `producto_id` int(11) NOT NULL,
  `venta_id` int(11) NOT NULL,
  `cantidad` decimal(5,2) NOT NULL,
  `precio_venta` decimal(5,2) NOT NULL,
  `impuesto` decimal(5,2) NOT NULL,
  `total` decimal(5,0) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `producto`
--

CREATE TABLE `producto` (
  `id_producto` int(11) NOT NULL,
  `categoria_id` int(11) NOT NULL,
  `clase_id` int(11) NOT NULL,
  `codigo_prod` varchar(11) COLLATE utf8mb4_unicode_ci NOT NULL,
  `nombre_prod` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL,
  `cantidad_prod_compra` int(5) DEFAULT NULL,
  `marca_prod` varchar(30) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `precio_venta_may` decimal(5,2) NOT NULL,
  `precio_venta_uni` decimal(5,2) NOT NULL,
  `fecha_ingreso` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `proveedor`
--

CREATE TABLE `proveedor` (
  `id_proveedor` int(11) NOT NULL,
  `nombre` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `correo` varchar(25) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `telefono` int(20) NOT NULL,
  `direccion` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `representante` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `sexo` varchar(6) COLLATE utf8mb4_unicode_ci NOT NULL,
  `telefono_rep` int(9) NOT NULL,
  `detalle` varchar(80) COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `retiro`
--

CREATE TABLE `retiro` (
  `id_retiro` int(11) NOT NULL,
  `trabajador_id` int(11) NOT NULL,
  `fecha_salida` date DEFAULT NULL,
  `detalle_reti` text COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `retiro`
--

INSERT INTO `retiro` (`id_retiro`, `trabajador_id`, `fecha_salida`, `detalle_reti`) VALUES
(2, 1, '2015-12-10', 'SE VENCIÓ EL CONTRATO BUEN TRABAJADOR ');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `trabajador`
--

CREATE TABLE `trabajador` (
  `id_trabajador` int(11) NOT NULL,
  `nombre` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL,
  `apellido_pa` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL,
  `apellido_ma` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL,
  `sexo` varchar(9) COLLATE utf8mb4_unicode_ci NOT NULL,
  `edad` int(2) DEFAULT NULL,
  `dni` int(8) NOT NULL,
  `telefono` int(9) NOT NULL,
  `direccion` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `correo` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `estado_civil` varchar(15) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `codigo_trab` int(5) NOT NULL,
  `fecha_ingreso` date DEFAULT NULL,
  `estado` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `trabajador`
--

INSERT INTO `trabajador` (`id_trabajador`, `nombre`, `apellido_pa`, `apellido_ma`, `sexo`, `edad`, `dni`, `telefono`, `direccion`, `correo`, `estado_civil`, `codigo_trab`, `fecha_ingreso`, `estado`) VALUES
(1, 'JOSE', 'SALCEDO', 'QUISPE', 'MASCULINO', 35, 26785412, 986574123, 'JR. 8 DE NOVIEMBRE 96', 'null', 'casado', 16352, '2013-03-10', 'DESACTIVO'),
(2, 'MARIA', 'ENRIQUEZ', 'MAZCO', 'FEMENINO', 26, 65231045, 963568741, 'AV. MARIANO NUÑEZ 112', 'mariamazco69@gmail.com', 'conviviente', 15874, '2013-04-10', 'DESACTIVO'),
(3, 'RENATA', 'ESCOBEDO', 'RIVERA', 'FEMENINO', 23, 85963210, 951357842, 'JR. 14 DE JULIO 698', 'renata65@gmail.com', 'soltera', 12547, '2014-11-21', 'DESACTIVO'),
(4, 'LUIS', 'CHARRES', 'CHINO', 'MASCULINO', 22, 38634575, 987456321, 'AV. MICAELA 852', 'luischino@gmail.com', 'soltero', 15425, '2014-06-06', 'DESACTIVO'),
(5, 'MARCO', 'QUISPE', 'ORTEGA', 'MASCULINO', 25, 35456845, 95102364, 'JR.28 DE JULIO 3698', 'marco8965@gmail.com', 'soltero', 25863, '2015-06-07', 'DESACTIVO'),
(6, 'ERNAN', 'MAMANI', 'VILCA', 'MASCULINO', 21, 32019820, 981753624, 'JR. INGENIEROS 314', 'quispe852@gmail.com', 'soltero', 35241, '2015-04-13', 'DESACTIVO'),
(7, 'ALEX', 'QUISPE', 'PACHARI', 'MASCULINO', 20, 10201460, 988746532, 'JR. CAUHIDE 586', 'alex.quispe@gmail.com', 'conviviente', 65874, '2016-12-01', 'DESACTIVO'),
(8, 'JIMENA', 'COTALUQUE', 'PANCCA', 'FEMENINO', 19, 75354585, 902736859, 'AV. MARINES 1475', 'jimenatuni@gmail.com', 'conviviente', 12012, '2016-04-11', 'DESACTIVO'),
(9, 'XHIOMARA', 'CUTIPA', 'TICONA', 'FEMENINO', 22, 25457585, 932153475, 'JR. PALMAS 2569', 'xhiomialv@gmail.com', 'conviviente', 15324, '2017-12-12', 'DESACTIVO'),
(10, 'LUZ MARIA', 'ZAPANA', 'CUEVA', 'FEMENINO', 23, 68532410, 968730420, 'JR. PROFESORES 2365', 'luz85@gmail.com', 'conviviente', 14747, '2017-12-12', 'DESACTIVO'),
(11, 'LEYDI', 'QUIZA', 'QUISPE', 'FEMENINO', 20, 10424241, 963669360, 'AV. MARINES 3241', 'leydi.zapana@gmail.com', 'soltera', 14736, '2017-12-12', 'DESACTIVO'),
(12, 'EDIT', 'MAMANI', 'SILLO', 'FEMENINO', 18, 32101490, 925874478, 'JR. SAN MARTIN 669', 'editmamani@gmail.com', 'conviviente', 17895, '2018-11-04', 'DESACTIVO'),
(13, 'ERIKA', 'GONZALES', 'PILCO', 'FEMENINO', 22, 20968693, 911086855, 'JR. PARIHUANA 556', 'erikapilco@gmail.com', 'conviviente', 196320, '2018-11-03', 'DESACTIVO'),
(14, 'ESTEFANI', 'MOCHICA', 'FLORES', 'FEMENINO', 21, 10147412, 908007025, 'JR. SAN MARCOS 2414', 'floresestefani@gmail.com', 'soltera', 102547, '2019-04-29', 'DESACTIVO'),
(15, 'FRANKLIN', 'MAMANI', 'MUNIZ', 'MASCULINO', 26, 20258520, 900557841, 'JR. HEROES DEL CENEPA 1010', 'frenk96@gmail.com', 'conviviente', 13024, '2019-09-05', 'DESACTIVO'),
(16, 'ROSBELIA', 'CALLO', 'RAMOS', 'FEMENINO', 24, 36969630, 51635958, 'JR. MARGARINAS 484', 'rosa963@gmail.com', 'conviviente', 15963, '2019-09-05', 'DESACTIVO'),
(17, 'YAQUELIN', 'MOLINA', 'MIRANDA', 'FEMENINO', 18, 5689778, 903322575, 'AV. JULIACA 4875', 'yaquelinmolinamiranda@gmail.com', 'soltera', 14785, '2020-05-28', 'ACTIVO'),
(18, 'LESLY', 'PARRILA', 'MAMANI', 'FEMENINO', 20, 6052870, 985757502, 'JR. AZANGARO 635', 'leslylove@gmail.com', 'soltera', 15987, '2020-01-28', 'ACTIVO');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `vendedor`
--

CREATE TABLE `vendedor` (
  `id_vendedor` int(11) NOT NULL,
  `trabajador_id` int(11) NOT NULL,
  `usuario` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `passwor` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL,
  `detalle` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `venta`
--

CREATE TABLE `venta` (
  `id_venta` int(11) NOT NULL,
  `cliente_id` int(11) NOT NULL,
  `vendedor_id` int(11) NOT NULL,
  `fecha` timestamp NOT NULL DEFAULT current_timestamp(),
  `detalle` varchar(200) COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `categoria`
--
ALTER TABLE `categoria`
  ADD PRIMARY KEY (`id_categoria`);

--
-- Indices de la tabla `clase`
--
ALTER TABLE `clase`
  ADD PRIMARY KEY (`id_clase`);

--
-- Indices de la tabla `cliente`
--
ALTER TABLE `cliente`
  ADD PRIMARY KEY (`id_cliente`);

--
-- Indices de la tabla `compra`
--
ALTER TABLE `compra`
  ADD PRIMARY KEY (`id_compra`),
  ADD KEY `proveedor_id` (`proveedor_id`),
  ADD KEY `proveedor_id_2` (`proveedor_id`);

--
-- Indices de la tabla `detalle_compra`
--
ALTER TABLE `detalle_compra`
  ADD PRIMARY KEY (`id_Dcompra`),
  ADD KEY `producto_id` (`producto_id`),
  ADD KEY `compra_id` (`compra_id`);

--
-- Indices de la tabla `detalle_venta`
--
ALTER TABLE `detalle_venta`
  ADD PRIMARY KEY (`id_Dventa`),
  ADD KEY `producto_id` (`producto_id`),
  ADD KEY `venta_id` (`venta_id`);

--
-- Indices de la tabla `producto`
--
ALTER TABLE `producto`
  ADD PRIMARY KEY (`id_producto`),
  ADD KEY `categoria_id` (`categoria_id`),
  ADD KEY `clase_id` (`clase_id`);

--
-- Indices de la tabla `proveedor`
--
ALTER TABLE `proveedor`
  ADD PRIMARY KEY (`id_proveedor`);

--
-- Indices de la tabla `retiro`
--
ALTER TABLE `retiro`
  ADD PRIMARY KEY (`id_retiro`),
  ADD KEY `trabajador_id` (`trabajador_id`);

--
-- Indices de la tabla `trabajador`
--
ALTER TABLE `trabajador`
  ADD PRIMARY KEY (`id_trabajador`);

--
-- Indices de la tabla `vendedor`
--
ALTER TABLE `vendedor`
  ADD PRIMARY KEY (`id_vendedor`),
  ADD KEY `trabajador_id` (`trabajador_id`);

--
-- Indices de la tabla `venta`
--
ALTER TABLE `venta`
  ADD PRIMARY KEY (`id_venta`),
  ADD KEY `cliente_id` (`cliente_id`),
  ADD KEY `vendedor_id` (`vendedor_id`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `categoria`
--
ALTER TABLE `categoria`
  MODIFY `id_categoria` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=35;

--
-- AUTO_INCREMENT de la tabla `clase`
--
ALTER TABLE `clase`
  MODIFY `id_clase` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT de la tabla `cliente`
--
ALTER TABLE `cliente`
  MODIFY `id_cliente` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `compra`
--
ALTER TABLE `compra`
  MODIFY `id_compra` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `detalle_compra`
--
ALTER TABLE `detalle_compra`
  MODIFY `id_Dcompra` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `detalle_venta`
--
ALTER TABLE `detalle_venta`
  MODIFY `id_Dventa` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `producto`
--
ALTER TABLE `producto`
  MODIFY `id_producto` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `proveedor`
--
ALTER TABLE `proveedor`
  MODIFY `id_proveedor` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `retiro`
--
ALTER TABLE `retiro`
  MODIFY `id_retiro` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `trabajador`
--
ALTER TABLE `trabajador`
  MODIFY `id_trabajador` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT de la tabla `vendedor`
--
ALTER TABLE `vendedor`
  MODIFY `id_vendedor` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `venta`
--
ALTER TABLE `venta`
  MODIFY `id_venta` int(11) NOT NULL AUTO_INCREMENT;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `compra`
--
ALTER TABLE `compra`
  ADD CONSTRAINT `compra_ibfk_2` FOREIGN KEY (`proveedor_id`) REFERENCES `proveedor` (`id_proveedor`) ON UPDATE CASCADE;

--
-- Filtros para la tabla `detalle_compra`
--
ALTER TABLE `detalle_compra`
  ADD CONSTRAINT `detalle_compra_ibfk_1` FOREIGN KEY (`producto_id`) REFERENCES `producto` (`id_producto`) ON UPDATE CASCADE,
  ADD CONSTRAINT `detalle_compra_ibfk_2` FOREIGN KEY (`compra_id`) REFERENCES `compra` (`id_compra`) ON UPDATE CASCADE;

--
-- Filtros para la tabla `detalle_venta`
--
ALTER TABLE `detalle_venta`
  ADD CONSTRAINT `detalle_venta_ibfk_1` FOREIGN KEY (`producto_id`) REFERENCES `producto` (`id_producto`) ON UPDATE CASCADE,
  ADD CONSTRAINT `detalle_venta_ibfk_2` FOREIGN KEY (`venta_id`) REFERENCES `venta` (`id_venta`);

--
-- Filtros para la tabla `producto`
--
ALTER TABLE `producto`
  ADD CONSTRAINT `producto_ibfk_1` FOREIGN KEY (`categoria_id`) REFERENCES `categoria` (`id_categoria`) ON UPDATE CASCADE,
  ADD CONSTRAINT `producto_ibfk_2` FOREIGN KEY (`clase_id`) REFERENCES `clase` (`id_clase`) ON UPDATE CASCADE;

--
-- Filtros para la tabla `retiro`
--
ALTER TABLE `retiro`
  ADD CONSTRAINT `retiro_ibfk_1` FOREIGN KEY (`trabajador_id`) REFERENCES `trabajador` (`id_trabajador`) ON UPDATE CASCADE;

--
-- Filtros para la tabla `vendedor`
--
ALTER TABLE `vendedor`
  ADD CONSTRAINT `vendedor_ibfk_1` FOREIGN KEY (`trabajador_id`) REFERENCES `trabajador` (`id_trabajador`) ON UPDATE CASCADE;

--
-- Filtros para la tabla `venta`
--
ALTER TABLE `venta`
  ADD CONSTRAINT `venta_ibfk_1` FOREIGN KEY (`cliente_id`) REFERENCES `cliente` (`id_cliente`) ON UPDATE CASCADE,
  ADD CONSTRAINT `venta_ibfk_3` FOREIGN KEY (`vendedor_id`) REFERENCES `vendedor` (`id_vendedor`) ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
