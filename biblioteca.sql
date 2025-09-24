-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 24-09-2025 a las 22:43:40
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
-- Base de datos: `biblioteca`
--
CREATE DATABASE IF NOT EXISTS `biblioteca` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `biblioteca`;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `comentarios`
--

CREATE TABLE `comentarios` (
  `idComentario` int(11) NOT NULL,
  `idLibro` int(11) DEFAULT NULL,
  `idMiembro` int(11) DEFAULT NULL,
  `contenido` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `comentarios`
--

INSERT INTO `comentarios` (`idComentario`, `idLibro`, `idMiembro`, `contenido`) VALUES
(1, 1, 1, 'excelente libro, muy recomendable.'),
(2, 2, 2, 'me gusto, pero me gusto mas la peli.'),
(3, 3, 2, 'me dio miedo, pero muy buena historia de terror.'),
(4, 4, 3, 'Es muy romantico.');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `info_libros`
--

CREATE TABLE `info_libros` (
  `idLibro` int(11) NOT NULL,
  `titulo` varchar(255) DEFAULT NULL,
  `autor` varchar(255) DEFAULT NULL,
  `genero` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `info_libros`
--

INSERT INTO `info_libros` (`idLibro`, `titulo`, `autor`, `genero`) VALUES
(1, 'El señor de los anillos.', 'J. R. R. Tolkien', 'fantasía'),
(2, 'Harry Potter: la piedra filosofal.', 'J. K. Rowling', 'fantasia'),
(3, 'La caída de la casa Usher', 'Edgar Allan Poe', 'terror literario'),
(4, 'Un amor de otra epoca', 'Adam West', 'Novela Rosa');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `miembros`
--

CREATE TABLE `miembros` (
  `idMiembro` int(11) NOT NULL,
  `nombre` varchar(255) DEFAULT NULL,
  `direccion` varchar(255) DEFAULT NULL,
  `telefono` bigint(20) DEFAULT NULL,
  `correoElectronico` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `miembros`
--

INSERT INTO `miembros` (`idMiembro`, `nombre`, `direccion`, `telefono`, `correoElectronico`) VALUES
(1, 'Jessica', 'Av. Siempre Viva 742', NULL, 'pintamostodalacasa@'),
(2, 'Cintia', 'Calle falsa 123', NULL, 'dosdetrescaidas@'),
(3, 'Luis', 'Fondo de bikini 124', NULL, ' pupitre15@');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `prestamos`
--

CREATE TABLE `prestamos` (
  `idPrestamo` int(11) NOT NULL,
  `idLibro` int(11) DEFAULT NULL,
  `idMiembro` int(11) DEFAULT NULL,
  `fechaPrestamo` date DEFAULT NULL,
  `fechaDevolucion` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `prestamos`
--

INSERT INTO `prestamos` (`idPrestamo`, `idLibro`, `idMiembro`, `fechaPrestamo`, `fechaDevolucion`) VALUES
(1, 1, 1, '2024-03-15', '2024-03-25'),
(2, 2, 2, '2024-04-10', NULL),
(3, 3, 3, '2024-04-12', NULL);

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `comentarios`
--
ALTER TABLE `comentarios`
  ADD PRIMARY KEY (`idComentario`),
  ADD KEY `idLibro` (`idLibro`),
  ADD KEY `idMiembro` (`idMiembro`);

--
-- Indices de la tabla `info_libros`
--
ALTER TABLE `info_libros`
  ADD PRIMARY KEY (`idLibro`);

--
-- Indices de la tabla `miembros`
--
ALTER TABLE `miembros`
  ADD PRIMARY KEY (`idMiembro`);

--
-- Indices de la tabla `prestamos`
--
ALTER TABLE `prestamos`
  ADD PRIMARY KEY (`idPrestamo`),
  ADD KEY `idLibro` (`idLibro`),
  ADD KEY `idMiembro` (`idMiembro`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `comentarios`
--
ALTER TABLE `comentarios`
  MODIFY `idComentario` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de la tabla `miembros`
--
ALTER TABLE `miembros`
  MODIFY `idMiembro` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `prestamos`
--
ALTER TABLE `prestamos`
  MODIFY `idPrestamo` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `comentarios`
--
ALTER TABLE `comentarios`
  ADD CONSTRAINT `comentarios_ibfk_1` FOREIGN KEY (`idLibro`) REFERENCES `info_libros` (`idLibro`),
  ADD CONSTRAINT `comentarios_ibfk_2` FOREIGN KEY (`idMiembro`) REFERENCES `miembros` (`idMiembro`);

--
-- Filtros para la tabla `prestamos`
--
ALTER TABLE `prestamos`
  ADD CONSTRAINT `prestamos_ibfk_1` FOREIGN KEY (`idLibro`) REFERENCES `info_libros` (`idLibro`),
  ADD CONSTRAINT `prestamos_ibfk_2` FOREIGN KEY (`idMiembro`) REFERENCES `miembros` (`idMiembro`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
