-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: localhost
-- Tiempo de generación: 23-09-2025 a las 02:20:24
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
  `idLibro` int(11) NOT NULL,
  `idMiembro` int(11) NOT NULL,
  `contenido` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `comentarios`
--

INSERT INTO `comentarios` (`idComentario`, `idLibro`, `idMiembro`, `contenido`) VALUES
(1, 6, 2, 'La verdad que es un muy buen libro, lo recomiendo, leere el proximo'),
(2, 8, 4, 'Muy linda novela.'),
(3, 5, 4, 'Un espectaculo'),
(4, 7, 6, 'Allan Poe es de mis escritores favoritos'),
(5, 5, 6, 'Libro muy extenso pero muy bonito.'),
(6, 8, 6, 'Una novela empalagosa');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `libros`
--

CREATE TABLE `libros` (
  `idLibro` int(11) NOT NULL,
  `titulo` varchar(70) NOT NULL,
  `autor` varchar(30) NOT NULL,
  `genero` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `libros`
--

INSERT INTO `libros` (`idLibro`, `titulo`, `autor`, `genero`) VALUES
(5, 'El señor de los anillos.', 'J. R. R. Tolkien', 'fantasia'),
(6, 'Harry Potter: la piedra filosofal.', 'J. K. Rowling', 'fantasia'),
(7, 'La caída de la casa Usher', 'Edgar Allan Poe', 'terror literario'),
(8, 'Un amor de otra época', 'Adam West', 'Novela Rosa');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `miembros`
--

CREATE TABLE `miembros` (
  `idMiembro` int(11) NOT NULL,
  `nombre` varchar(30) NOT NULL,
  `direccion` varchar(50) NOT NULL,
  `correoE` varchar(50) NOT NULL,
  `numeroTelefono` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `miembros`
--

INSERT INTO `miembros` (`idMiembro`, `nombre`, `direccion`, `correoE`, `numeroTelefono`) VALUES
(1, 'Jose Bossa', 'Av. Siempre Viva 742', 'pintamostodalacasa@', '2664202122'),
(2, 'Enzo Fet', 'Calle Falsa 123', 'dosdetrescaidas@', '2664232425'),
(3, 'Naiara Bongiovanni', 'Las Catitas 104', 'soychicarebelde@', '2664262728'),
(4, 'Gonza Achucarro', 'Fondo de Bikini 124', 'pupitre15@', '2664293031'),
(5, 'Claudia Bonisoni', 'Av. Mitre 502', 'clau.bonisoni@gmail.com', '111520311'),
(6, 'Jesús Emanuel Dupre', 'Suipacha 1618', 'dupre.dev@gmail.com', '2657542764');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `prestamos`
--

CREATE TABLE `prestamos` (
  `idPrestamo` int(11) NOT NULL,
  `idLibro` int(11) NOT NULL,
  `idMiembro` int(11) NOT NULL,
  `fechaP` date NOT NULL,
  `fechaD` date DEFAULT NULL,
  `estado` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `prestamos`
--

INSERT INTO `prestamos` (`idPrestamo`, `idLibro`, `idMiembro`, `fechaP`, `fechaD`, `estado`) VALUES
(1, 6, 2, '2025-08-22', NULL, 0),
(2, 8, 4, '2025-09-10', NULL, 0),
(3, 5, 1, '2025-08-13', '2025-09-22', 1);

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
-- Indices de la tabla `libros`
--
ALTER TABLE `libros`
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
  MODIFY `idComentario` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT de la tabla `libros`
--
ALTER TABLE `libros`
  MODIFY `idLibro` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT de la tabla `miembros`
--
ALTER TABLE `miembros`
  MODIFY `idMiembro` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

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
  ADD CONSTRAINT `comentarios_ibfk_1` FOREIGN KEY (`idLibro`) REFERENCES `libros` (`idLibro`),
  ADD CONSTRAINT `comentarios_ibfk_2` FOREIGN KEY (`idMiembro`) REFERENCES `miembros` (`idMiembro`);

--
-- Filtros para la tabla `prestamos`
--
ALTER TABLE `prestamos`
  ADD CONSTRAINT `prestamos_ibfk_1` FOREIGN KEY (`idLibro`) REFERENCES `libros` (`idLibro`),
  ADD CONSTRAINT `prestamos_ibfk_2` FOREIGN KEY (`idMiembro`) REFERENCES `miembros` (`idMiembro`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
