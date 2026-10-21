-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 17-10-2026 a las 04:58:05
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
-- Base de datos: `eco_puntos`
-- 
CREATE DATABASE IF NOT EXISTS `eco_puntos`;
USE `eco_puntos`;
-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `actividad`
--

CREATE TABLE `actividad` (
  `id_actividad` int(11) NOT NULL,
  `nombre` varchar(150) NOT NULL,
  `descripcion` text NOT NULL,
  `puntos` int(11) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `actividad`
--

INSERT INTO `actividad` (`id_actividad`, `nombre`, `descripcion`, `puntos`) VALUES
(1, 'Reciclaje de PET', 'Traer 1kg de botellas plásticas', 20),
(2, 'Limpieza de Jardín', 'Apoyo en mantenimiento de áreas verdes', 30),
(3, 'Taller de Composta', 'Asistencia al taller socioecológico', 15);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `alumno`
--

CREATE TABLE `alumno` (
  `no_control` int(11) NOT NULL,
  `nombre` varchar(255) NOT NULL,
  `grado_grupo` varchar(80) NOT NULL,
  `puntos` int(11) NOT NULL DEFAULT 0,
  `id_usuario` int(11) NOT NULL,
  `id_grupo` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `alumno`
--

INSERT INTO `alumno` (`no_control`, `nombre`, `grado_grupo`, `puntos`, `id_usuario`, `id_grupo`) VALUES
(1001, 'Luis Hernandez', '5ATP', 50, 6, 1),
(1002, 'Magnus Gallardo', '3ATP', 80, 3, 1),
(1003, 'Matias Verdugo', '5ATB', 30, 2, 2);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `canje`
--

CREATE TABLE `canje` (
  `id_canje` int(11) NOT NULL,
  `no_control` int(11) NOT NULL,
  `id_recompensa` int(11) NOT NULL,
  `fecha` datetime DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `canje`
--

INSERT INTO `canje` (`id_canje`, `no_control`, `id_recompensa`, `fecha`) VALUES
(1, 1001, 2, '2026-10-16 20:35:55'),
(2, 1002, 1, '2026-10-16 20:35:55'),
(3, 1003, 2, '2026-10-16 20:35:55');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `grupo`
--

CREATE TABLE `grupo` (
  `id_grupo` int(11) NOT NULL,
  `nombre_grupo` varchar(150) NOT NULL,
  `puntos` int(11) NOT NULL DEFAULT 0,
  `no_control_rep` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `grupo`
--

INSERT INTO `grupo` (`id_grupo`, `nombre_grupo`, `puntos`, `no_control_rep`) VALUES
(1, 'bloque a bloque', 150, NULL),
(2, 'RP', 500, NULL),
(3, 'chavalines', 67, NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `maestro`
--

CREATE TABLE `maestro` (
  `id_maestro` int(11) NOT NULL,
  `nombre` varchar(255) NOT NULL,
  `area` varchar(150) NOT NULL,
  `id_usuario` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `maestro`
--

INSERT INTO `maestro` (`id_maestro`, `nombre`, `area`, `id_usuario`) VALUES
(1, 'Carlos Mendoza', 'Sistemas', 4),
(2, 'Elena Rodriguez', 'Ecología', 5),
(3, 'Luis Hernadez', 'Taller', 6);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `participacion`
--

CREATE TABLE `participacion` (
  `id_participacion` int(11) NOT NULL,
  `no_control` int(11) NOT NULL,
  `id_actividad` int(11) NOT NULL,
  `fecha_registro` datetime DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `participacion`
--

INSERT INTO `participacion` (`id_participacion`, `no_control`, `id_actividad`, `fecha_registro`) VALUES
(1, 1001, 1, '2026-10-16 20:35:55'),
(2, 1002, 2, '2026-10-16 20:35:55'),
(3, 1003, 1, '2026-10-16 20:35:55');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `recompensa`
--

CREATE TABLE `recompensa` (
  `id_recompensa` int(11) NOT NULL,
  `nombre` varchar(255) NOT NULL,
  `descripcion` text NOT NULL,
  `puntos_n` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `recompensa`
--

INSERT INTO `recompensa` (`id_recompensa`, `nombre`, `descripcion`, `puntos_n`) VALUES
(1, 'Termo Ecológico', 'Termo de aluminio 500ml', 100),
(2, 'Libreta Reciclada', 'Libreta con hojas de papel reciclado', 50),
(3, 'Punto Extra en Módulo', 'Punto adicional en evaluación parcial', 150);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuario`
--

CREATE TABLE `usuario` (
  `id_usuario` int(11) NOT NULL,
  `correo` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `rol` varchar(40) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `usuario`
--

INSERT INTO `usuario` (`id_usuario`, `correo`, `password`, `rol`) VALUES
(1, 'franciscomontaño@cbta197.net', 'matematicas', 'Maestro'),
(2, 'matiasverdugo@cbta197.net', '12345', 'Alumno'),
(3, 'magnusgallardo@cbta197.net', 'contraseña', 'Alumno'),
(4, 'carlos.mendoza@cbta197.net', 'profe_carlos', 'Maestro'),
(5, 'elena.rodriguez@cbta197.net', 'maestra_elena', 'Maestro'),
(6, 'luis.hernandez@cbta197.net', 'luisito2026', 'Alumno');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `actividad`
--
ALTER TABLE `actividad`
  ADD PRIMARY KEY (`id_actividad`);

--
-- Indices de la tabla `alumno`
--
ALTER TABLE `alumno`
  ADD PRIMARY KEY (`no_control`),
  ADD KEY `id_usuario` (`id_usuario`),
  ADD KEY `id_grupo` (`id_grupo`);

--
-- Indices de la tabla `canje`
--
ALTER TABLE `canje`
  ADD PRIMARY KEY (`id_canje`),
  ADD KEY `no_control` (`no_control`),
  ADD KEY `id_recompensa` (`id_recompensa`);

--
-- Indices de la tabla `grupo`
--
ALTER TABLE `grupo`
  ADD PRIMARY KEY (`id_grupo`),
  ADD KEY `fk_grupo_representante` (`no_control_rep`);

--
-- Indices de la tabla `maestro`
--
ALTER TABLE `maestro`
  ADD PRIMARY KEY (`id_maestro`),
  ADD KEY `id_usuario` (`id_usuario`);

--
-- Indices de la tabla `participacion`
--
ALTER TABLE `participacion`
  ADD PRIMARY KEY (`id_participacion`),
  ADD KEY `no_control` (`no_control`),
  ADD KEY `id_actividad` (`id_actividad`);

--
-- Indices de la tabla `recompensa`
--
ALTER TABLE `recompensa`
  ADD PRIMARY KEY (`id_recompensa`);

--
-- Indices de la tabla `usuario`
--
ALTER TABLE `usuario`
  ADD PRIMARY KEY (`id_usuario`),
  ADD UNIQUE KEY `correo` (`correo`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `actividad`
--
ALTER TABLE `actividad`
  MODIFY `id_actividad` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `canje`
--
ALTER TABLE `canje`
  MODIFY `id_canje` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `grupo`
--
ALTER TABLE `grupo`
  MODIFY `id_grupo` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `maestro`
--
ALTER TABLE `maestro`
  MODIFY `id_maestro` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `participacion`
--
ALTER TABLE `participacion`
  MODIFY `id_participacion` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `recompensa`
--
ALTER TABLE `recompensa`
  MODIFY `id_recompensa` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `usuario`
--
ALTER TABLE `usuario`
  MODIFY `id_usuario` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `alumno`
--
ALTER TABLE `alumno`
  ADD CONSTRAINT `alumno_ibfk_1` FOREIGN KEY (`id_usuario`) REFERENCES `usuario` (`id_usuario`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `alumno_ibfk_2` FOREIGN KEY (`id_grupo`) REFERENCES `grupo` (`id_grupo`) ON UPDATE CASCADE;

--
-- Filtros para la tabla `canje`
--
ALTER TABLE `canje`
  ADD CONSTRAINT `canje_ibfk_1` FOREIGN KEY (`no_control`) REFERENCES `alumno` (`no_control`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `canje_ibfk_2` FOREIGN KEY (`id_recompensa`) REFERENCES `recompensa` (`id_recompensa`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `grupo`
--
ALTER TABLE `grupo`
  ADD CONSTRAINT `fk_grupo_representante` FOREIGN KEY (`no_control_rep`) REFERENCES `alumno` (`no_control`) ON DELETE SET NULL ON UPDATE CASCADE;

--
-- Filtros para la tabla `maestro`
--
ALTER TABLE `maestro`
  ADD CONSTRAINT `maestro_ibfk_1` FOREIGN KEY (`id_usuario`) REFERENCES `usuario` (`id_usuario`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `participacion`
--
ALTER TABLE `participacion`
  ADD CONSTRAINT `participacion_ibfk_1` FOREIGN KEY (`no_control`) REFERENCES `alumno` (`no_control`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `participacion_ibfk_2` FOREIGN KEY (`id_actividad`) REFERENCES `actividad` (`id_actividad`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
