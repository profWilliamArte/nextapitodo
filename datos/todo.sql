-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: localhost:3306
-- Tiempo de generación: 07-08-2024 a las 18:34:41
-- Versión del servidor: 8.0.30
-- Versión de PHP: 8.2.18

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `todo`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `porhacer`
--

CREATE TABLE `porhacer` (
  `id` int NOT NULL,
  `tarea` varchar(500) NOT NULL,
  `completado` varchar(2) NOT NULL,
  `fechacreacion` date NOT NULL,
  `fecharealizacion` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

--
-- Volcado de datos para la tabla `porhacer`
--

INSERT INTO `porhacer` (`id`, `tarea`, `completado`, `fechacreacion`, `fecharealizacion`) VALUES
(7, 'Agregar interactividad con JavaScript', 'Si', '2022-01-17', '2024-08-05'),
(8, 'Crear formularios para recopilar datos del usuario', 'No', '2022-01-18', '2022-01-18'),
(9, 'Conectar la página a una base de datos MySQL', 'No', '2022-01-19', '2022-01-19'),
(10, 'Implementar un sistema de inicio de sesión', 'Si', '2022-01-20', '2022-01-17'),
(11, 'Optimizar la página para mejorar el rendimiento', 'No', '2022-01-21', '2022-01-21'),
(12, 'Realizar pruebas y depuración', 'Si', '2022-01-22', '2022-01-12'),
(13, 'contenido de css II', 'No', '2024-07-03', '2024-07-03'),
(14, 'Contenido de HTML', 'No', '2024-07-03', '2024-07-03'),
(16, 'Contenido de Node', 'Si', '2024-07-03', '2024-07-01'),
(19, 'Contenido de Astro', 'Si', '2024-07-04', '2024-07-01'),
(23, 'Contenido del curso de Node II', 'Si', '2024-07-04', '2024-07-03'),
(24, 'Crear el servidor don 8 de ram ssd de 500 en wqs', 'Si', '2024-07-04', '2024-07-03'),
(25, 'nueva tarea desde el api II', 'No', '2024-08-05', '2024-08-05'),
(26, 'prueba desde el dashboard', 'No', '2024-08-05', '2024-08-05'),
(35, 'Estudiar Nest para poder entender el proceso de recompra en binance', 'No', '2024-08-05', '2024-08-05'),
(36, 'esta es otra prueba IV', 'Si', '2024-08-05', '2024-07-29'),
(38, 'Una nueva Tarea', 'No', '2024-08-06', '2024-08-06'),
(39, 'Crear guia de next  14', 'Si', '2024-08-07', '2024-08-07');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `users`
--

CREATE TABLE `users` (
  `id` int NOT NULL,
  `firstName` varchar(50) DEFAULT NULL,
  `lastName` varchar(50) DEFAULT NULL,
  `age` int DEFAULT NULL,
  `gender` varchar(10) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `phone` varchar(20) DEFAULT NULL,
  `username` varchar(50) DEFAULT NULL,
  `password` varchar(50) DEFAULT NULL,
  `birthDate` date DEFAULT NULL,
  `role` varchar(20) DEFAULT NULL,
  `address` varchar(250) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

--
-- Volcado de datos para la tabla `users`
--

INSERT INTO `users` (`id`, `firstName`, `lastName`, `age`, `gender`, `email`, `phone`, `username`, `password`, `birthDate`, `role`, `address`) VALUES
(1, 'Emily II', 'Johnson', 28, 'female', 'emily.johnson@x.dummyjson.com', '+81 965-431-3024', 'emilys', 'emilyspass', '1996-05-30', 'admin', 'prueba'),
(2, 'Michael', 'Williams', 35, 'male', 'michael.williams@x.dummyjson.com', '+49 258-627-6644', 'michaelw', 'michaelwpass', '1989-08-10', 'admin', ''),
(3, 'Sophia', 'Brown', 42, 'female', 'sophia.brown@x.dummyjson.com', '+81 210-652-2785', 'sophiab', 'sophiabpass', '1982-11-06', 'admin', ''),
(4, 'James', 'Davis', 45, 'male', 'james.davis@x.dummyjson.com', '+49 614-958-9364', 'jamesd', 'jamesdpass', '1979-05-04', 'admin', ''),
(5, 'Emma', 'Miller', 30, 'female', 'emma.miller@x.dummyjson.com', '+91 759-776-1614', 'emmaj', 'emmajpass', '1994-06-13', 'admin', ''),
(6, 'Olivia', 'Wilson', 22, 'female', 'olivia.wilson@x.dummyjson.com', '+91 607-295-6448', 'oliviaw', 'oliviawpass', '2002-04-20', 'operator', ''),
(7, 'Alexander', 'Jones', 38, 'male', 'alexander.jones@x.dummyjson.com', '+61 260-824-4986', 'alexanderj', 'alexanderjpass', '1986-10-20', 'operator', ''),
(8, 'Ava', 'Taylor', 27, 'female', 'ava.taylor@x.dummyjson.com', '+1 458-853-7877', 'avat', 'avatpass', '1997-08-25', 'operator', ''),
(9, 'Ethan', 'Martinez', 33, 'male', 'ethan.martinez@x.dummyjson.com', '+92 933-608-5081', 'ethanm', 'ethanmpass', '1991-02-12', 'operator', ''),
(10, 'Isabella', 'Anderson', 31, 'female', 'isabella.anderson@x.dummyjson.com', '+49 770-658-4885', 'isabellad', 'isabelladpass', '1993-06-10', 'operator', ''),
(11, 'Liam', 'Garcia', 29, 'male', 'liam.garcia@x.dummyjson.com', '+92 870-217-6201', 'liamg', 'liamgpass', '1995-06-06', 'operator', ''),
(12, 'Mia', 'Rodriguez', 24, 'female', 'mia.rodriguez@x.dummyjson.com', '+49 989-461-8403', 'miar', 'miarpass', '2000-08-04', 'operator', ''),
(13, 'Noah', 'Hernandez', 40, 'male', 'noah.hernandez@x.dummyjson.com', '+49 393-605-6968', 'noahh', 'noahhpass', '1984-06-05', 'operator', ''),
(15, 'William', 'Gonzalez', 32, 'male', 'william.gonzalez@x.dummyjson.com', '+81 905-252-7319', 'williamg', 'williamgpass', '1992-03-27', 'operator', ''),
(16, 'Avery', 'Perez', 25, 'female', 'avery.perez@x.dummyjson.com', '+61 731-431-3457', 'averyp', 'averyppass', '1999-03-10', 'user', ''),
(17, 'Evelyn', 'Sanchez', 37, 'female', 'evelyn.sanchez@x.dummyjson.com', '+1 623-880-6871', 'evelyns', 'evelynspass', '1987-10-13', 'user', ''),
(18, 'Logan', 'Torres', 31, 'male', 'logan.torres@x.dummyjson.com', '+81 507-434-8733', 'logant', 'logantpass', '1993-10-26', 'user', ''),
(20, 'Jackson', 'Evans', 34, 'male', 'jackson.evans@x.dummyjson.com', '+44 468-628-6686', 'jacksone', 'jacksonepass', '1990-11-30', 'user', ''),
(21, 'Madison', 'Collins', 26, 'female', 'madison.collins@x.dummyjson.com', '+81 259-957-5711', 'madisonc', 'madisoncpass', '1998-03-07', 'user', ''),
(22, 'Elijah', 'Stewart', 33, 'male', 'elijah.stewart@x.dummyjson.com', '+44 468-357-7872', 'elijahs', 'elijahspass', '1991-10-22', 'user', ''),
(23, 'Chloe', 'Morales', 39, 'female', 'chloe.morales@x.dummyjson.com', '+92 468-541-7133', 'chloem', 'chloempass', '1985-04-21', 'user', ''),
(24, 'Mateo', 'Nguyen', 30, 'male', 'mateo.nguyen@x.dummyjson.com', '+1 341-597-6694', 'mateon', 'mateonpass', '1994-06-02', 'user', ''),
(26, 'Evelyn', 'Gonzalez', 35, 'female', 'evelyn.gonzalez@x.dummyjson.com', '+61 708-508-4638', 'evelyng', 'evelyngpass', '1989-02-05', 'user', ''),
(27, 'Daniel', 'Cook', 41, 'male', 'daniel.cook@x.dummyjson.com', '+44 254-761-6843', 'danielc', 'danielcpass', '1983-12-25', 'user', ''),
(28, 'Lily', 'Lee', 29, 'female', 'lily.lee@x.dummyjson.com', '+1 808-757-9867', 'lilyb', 'lilybpass', '1995-12-03', 'user', ''),
(30, 'Addison', 'Wright', 32, 'female', 'addison.wright@x.dummyjson.com', '+1 514-384-3300', 'addisonw', 'addisonwpass', '1992-01-03', 'user', ''),
(31, 'William  E', 'Arteaga', 56, 'female', 'emily.johnson@x.dummyjson.com', '+81 965-431-3024', 'emilys', 'emilyspass', '1996-05-30', 'admin', 'san diego'),
(32, 'Luis', 'David', 25, 'male', 'luisda@gmail.com', '0412-895632', 'luisda91', '12345678', '1980-05-15', 'admin', 'Las Chimeneas'),
(33, 'Maria', 'Gonzalez', 35, 'female', 'maria@gmail.com', '0412-896523', 'prueba@gmail.com', '123', '1980-12-05', 'operator', 'San diego');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `porhacer`
--
ALTER TABLE `porhacer`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `porhacer`
--
ALTER TABLE `porhacer`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=40;

--
-- AUTO_INCREMENT de la tabla `users`
--
ALTER TABLE `users`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=34;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
