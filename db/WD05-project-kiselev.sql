-- phpMyAdmin SQL Dump
-- version 4.6.5.2
-- https://www.phpmyadmin.net/
--
-- Хост: 127.0.0.1:3306
-- Время создания: Янв 28 2019 г., 21:50
-- Версия сервера: 5.5.53
-- Версия PHP: 5.6.29

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- База данных: `WD05-project-kiselev`
--

-- --------------------------------------------------------

--
-- Структура таблицы `about`
--

CREATE TABLE `about` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `description` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `about`
--

INSERT INTO `about` (`id`, `name`, `description`) VALUES
(1, 'Емельян Казаков', 'Веб-разработчик.');

-- --------------------------------------------------------

--
-- Структура таблицы `users`
--

CREATE TABLE `users` (
  `id` int(11) UNSIGNED NOT NULL,
  `email` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `password` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `role` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `secondname` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `country` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `city` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `avatar` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `avatar_small` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `recovery_code` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `recovery_code_times` double DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `users`
--

INSERT INTO `users` (`id`, `email`, `password`, `role`, `name`, `secondname`, `country`, `city`, `avatar`, `avatar_small`, `recovery_code`, `recovery_code_times`) VALUES
(4, '123@mail.com', '$2y$10$itSi0A1TfmbMSIkLRXxzt.kLH3.YT7CQsNqKY0GVtYB15sY5zuRRe', 'user', 'Григорий', 'Распутин', 'Российская Империя', 'Санкт-Петербург', '800417181.jpg', '48-800417181.jpg', NULL, NULL),
(5, '456@mail.com', '$2y$10$JtAw6ASpPe3MKJ14.TeyzuzwLY4yWfMzCLpYAtwcf5JAq1tGeLPd2', 'user', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(6, '789@mail.com', '$2y$10$QjwYhJwtiNX19izHrDgyyuEx9Z5fP06g2lOcBcfe8shjjyLZOQKZG', 'user', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(7, 'mail@mail.com', '$2y$10$g6eGay8a3OLQfzEzyJu/keRlnCI1zngvBZXKTUJy3h/Xnl0RcsLKa', 'user', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(8, 'admin@mysite.com', '$2y$10$H/Co2OLA5doOSAMcgzZ2q.sWE94Lq4W4hAguvyZRQxCNoI9wzcyTS', 'admin', 'Сергей', 'Киселев', 'Россия', 'Нижний Новгород', '549164405.jpg', '48-549164405.jpg', NULL, NULL),
(9, 'sam@mail.com', '$2y$10$3pW6h0t4VQp6Peuc296tEeaO5mLbz3.WOzqgEjUUlJcMeOQxPNQ4W', 'user', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(10, 'vova@mail.com', '$2y$10$unbPxVaQo02u1g2ox3JI5OPLnW/H3PNbhLzGBg/U6gYCvA.YhB4Bi', 'user', 'Вова', 'Вованов', 'Казахстан', 'Астана', NULL, NULL, 'KtMGUilj9CSf4pa', 0),
(11, 'less@less.com', '$2y$10$Ue0.wDIRP7EG4lLZPO4GYOrRG6AQ00ovyFKUXPwXR0MI3z7A4c2HW', 'user', NULL, NULL, NULL, NULL, NULL, NULL, 'R9BbxP2GL7a35Mn', -2),
(12, 'sass@mail.com', '$2y$10$fj1LPHEiYo80QjSbb.uBZuCufEQx39ye/dmVctZ4atAWApCrVVCdq', 'user', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(13, 'scss@mail.ru', '$2y$10$BPRT9ftMq1DsAuqpy4XruO7Lq/aKekkvqZDyb5aY7t80v7auwX9jq', 'user', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);

--
-- Индексы сохранённых таблиц
--

--
-- Индексы таблицы `about`
--
ALTER TABLE `about`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT для сохранённых таблиц
--

--
-- AUTO_INCREMENT для таблицы `about`
--
ALTER TABLE `about`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT для таблицы `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
