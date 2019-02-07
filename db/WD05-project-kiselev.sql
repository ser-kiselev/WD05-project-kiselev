-- phpMyAdmin SQL Dump
-- version 4.6.5.2
-- https://www.phpmyadmin.net/
--
-- Хост: 127.0.0.1:3306
-- Время создания: Фев 06 2019 г., 23:18
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
-- Структура таблицы `categories`
--

CREATE TABLE `categories` (
  `id` int(11) UNSIGNED NOT NULL,
  `cat_title` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `categories`
--

INSERT INTO `categories` (`id`, `cat_title`) VALUES
(1, 'В мире IT'),
(2, 'JavaScript'),
(3, 'PHP'),
(4, 'Заметки');

-- --------------------------------------------------------

--
-- Структура таблицы `comments`
--

CREATE TABLE `comments` (
  `id` int(11) UNSIGNED NOT NULL,
  `post_id` int(11) UNSIGNED DEFAULT NULL,
  `user_id` int(11) UNSIGNED DEFAULT NULL,
  `text` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `date_time` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `comments`
--

INSERT INTO `comments` (`id`, `post_id`, `user_id`, `text`, `date_time`) VALUES
(1, 17, 8, 'первый смартфон Samsung со складным экраном', '2019-02-06 23:12:37'),
(2, 17, 4, 'Судя по видео, у новой модели будет внутренний и наружный дисплеи', '2019-02-06 23:17:44');

-- --------------------------------------------------------

--
-- Структура таблицы `posts`
--

CREATE TABLE `posts` (
  `id` int(11) UNSIGNED NOT NULL,
  `title` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `text` text COLLATE utf8mb4_unicode_ci,
  `author_id` int(11) UNSIGNED DEFAULT NULL,
  `date_time` datetime DEFAULT NULL,
  `post_img` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `post_img_small` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `cat` int(11) UNSIGNED DEFAULT NULL,
  `update_time` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `posts`
--

INSERT INTO `posts` (`id`, `title`, `text`, `author_id`, `date_time`, `post_img`, `post_img_small`, `cat`, `update_time`) VALUES
(10, '170 расширений Chrome открывают злоумышленникам доступ к данным пользователей', 'Как оказалось, злоумышленники могут через API некоторых расширений атаковать пользователей браузеров: запускать произвольный код, получать куки, закладки и историю просмотров, устанавливать другие расширения, сохранять/извлекать файлы и так далее. В Opera таких расширений 10 штук, Firefox — 16, а в Chrome — 171.\r\n\r\n170 расширений Chrome открывают пользователей для атак через API\r\n\r\nКак можно защититься?\r\nСамый надёжный способ — удалить уязвимое расширение. Проверить свои расширения можно прямо на этой странице. Для этого в Google Chrome перейдите по адресу chrome://system/ и нажмите на кнопку «Expand» напротив «extensions». Скопируйте список расширений вместе с их идентификаторами (строки из 32 строчных символов в поле ниже). Для Firefox и Opera действия аналогичные — нужно найти список расширений и вставить список айдишников.\r\n\r\nЕсли расширение есть в списке уязвимых, его идентификатор отобразится в строке над полем ввода:\r\n\r\nВы можете скопировать его, найти в исходном докладе и узнать, что именно с ним не так. Лучше всего это расширение потом удалить.\r\n\r\nКоманда Opera уже удалила 8 из 10 уязвимых приложений, Firefox — все 16, а Chrome пока не знает, как действовать: выбросить больше полутора сотен расширений или добиться, чтобы разработчики их исправили. Так что пользователям Chrome на первых порах придётся самим озаботиться своей безопасностью.', 8, '2019-01-31 19:31:00', '431869623.jpg', '320-431869623.jpg', 2, NULL),
(11, 'РКН: блокировал Telegram, разблокировал AWS, оправдал утечку &laquo;АКАДО&raquo; и завёл дело против Facebook и Twitter', 'Telegram\r\nПосле длительной спячки выгрузка реестра запрещённых сайтов ожила. 21−22 января Роскомнадзор добавил в список порядка 3 тысяч IP-адресов. Источники сказали «Ведомостям», что РКН снова пытается «отловить» прокси-сервера Telegram, и небезуспешно: российские пользователи вчера в обед жаловались на неполадки с мессенджером.\r\n\r\nА сегодня ведомство вдруг разблокировало 2,7 миллиона IP-адресов AWS, которые пролежали в реестре 9 месяцев. Причина такая: «Специалистами Роскомнадзора установлено, что данные подсети длительное время не используются для обеспечения функционирования мессенджера Telegram». Остальные, видимо, ещё во власти мессенджера.\r\n\r\n«АКАДО»\r\nВсплывала в ноябре прошлого года такая новость: провайдер «АКАДО Телеком» выгружает в открытую БД RIPE информацию о клиентах. ФИО и названия организаций, физические и IP-адреса, телефоны. В незашифрованном виде, простым текстом.\r\n\r\nТак вот, РКН проверил эту утечку и заключил, что ничьи права тут не нарушены и всё ок.\r\n\r\nFacebook и Twitter\r\nЭти две компании до сих пор не перенесли свои сервера на территорию России. РКН давал им поблажки несколько лет, а теперь заводит административное дело. Компаниям грозит штраф 5 тысяч рублей. Каждой.\r\n\r\nVc.ru как-то считал, сколько им понадобится времени, чтобы «отбить» штрафы: Facebook — 0,04 секунды, Twitter — 0,8 секунд. Такие дела.', 8, '2019-01-31 19:31:58', '-698323121.png', '320--698323121.png', 4, NULL),
(12, 'Нейросеть научилась анимировать людей на изображениях', '<p>Исследователи из Вашингтонского университета совместно с разработчиками из Facebook создали алгоритм, который &laquo;оживляет&raquo; людей на фотографиях. По единственному снимку он генерирует трёхмерную движущуюся модель фигуры, которая может садиться, прыгать, бегать и даже &laquo;выходить&raquo; за пределы изображения. Алгоритм работает также для рисунков и персонажей аниме. Работа алгоритма Для создания такой технологии исследователи воспользовались наработками коллег. Нейросеть Mask R-CNN распознаёт на изображении фигуру человека и выделяет её из фона. Другой алгоритм накладывает на фигуру упрощённую разметку скелета, определяя то, как она будет двигаться. Третий алгоритм &laquo;заполняет&raquo; пространство фона, ранее скрытое фигурой. Далее собственный алгоритм исследователей на основе размеченной двумерной фигуры создаёт трёхмерную модель и по исходному изображению генерирует уровень текстуры. Разработчики добавили пользовательский интерфейс, который позволяет менять позу фигуры, чтобы отредактировать саму фотографию или определить, с чего начнётся анимация. Кроме того, можно &laquo;оживить&raquo; рисунок или фотографию в дополненной реальности и увидеть объёмную фигуру в VR- или AR-очках. Похожую технологию представили исследователи из DeepMind. Их алгоритм способен построить трёхмерную модель объекта по нескольким изображениям, что позволяет по фотографиям воссоздавать в виртуальной реальности объёмные сцены.</p>\r\n', 8, '2019-01-31 19:32:45', '-535901277.jpg', '320--535901277.jpg', 1, '2019-02-05 20:52:06'),
(13, 'Google ускорила закрытие Google+ из-за новой утечки данных', 'Google решила закрыть соцсеть Google+ не в августе 2019 года, а уже в апреле. Причиной стала ещё одна уязвимость в API, из-за которой можно было получить приватную информацию 52,5 миллионов учётных записей. Компания планирует закрыть API соцсети до середины марта 2019 года.\r\n\r\nПодробности уязвимости\r\nК 10 декабря 2018 года опубликованы следующие сведения об ошибке:\r\n\r\nсторонние приложения, запрашивающие доступ к данным профиля, из-за бага в API получали разрешение на просмотр информации, даже если она скрыта настройками приватности;\r\nпод угрозой были имена пользователей, их электронные адреса, информация о роде занятий, возрасте и другая конфиденциальная информация;\r\nпароли, финансовые данные и национальные идентификационные номера не были скомпрометированы;\r\nкомпания не имеет свидетельств того, что кто-либо использовал уязвимость;\r\nошибка была устранена в течение 6 дней: с 7 по 13 ноября 2018 года.\r\nGoogle заявила, что рассылает уведомления всем пользователям, которых затронул баг.\r\n\r\nПредыдущая утечка данных пользователей Google+ произошла в октябре 2018 года. Тогда было скомпрометировано около 500 тысяч аккаунтов. Злоумышленники могли получить имена, адреса электронной почты, возраст, пол и род занятий пользователей.', 8, '2019-01-31 19:33:12', '1071298154.jpg', '320-1071298154.jpg', 1, NULL),
(14, 'Python назвали языком 2018 года в январском рейтинге TIOBE', 'Эксперты TIOBE назвали Python языком программирования 2018 года — по их словам, Python стал неотъемлемой частью многих IT-сфер. Он лидирует по использованию в статистике, разработке систем искусственного интеллекта, скриптов и системных тестов, а ещё широко применяется в веб-разработке и научных вычислениях.\r\n\r\nКстати, Python поднимается на эту вершину уже в третий раз — такого не показывал ни один из языков.\r\n\r\nсписок языков года TIOBE\r\n\r\nЭксперты TIOBE подвели итоги не только всего года, но и месяца. Вернувшись в тройку лидеров в декабре, в январе Python продолжил теснить C++, хотя в прошлый раз сдал позиции довольно быстро.\r\n\r\nЧто ещё изменилось в рейтинге?\r\nMATLAB с Ruby поменялись местами: первый поднялся к 11 строчке, второй опустился до 18. TypeScript взлетел на целых 118 пунктов и занял 49 место. F# потерял два десятка пунктов, а Alice — все четыре.\r\n\r\nянварский рейтинг TIOBE\r\n\r\nУ Kotlin год начался с позитива. Язык поднялся до 31 места, и эксперты считают, что в 2019 году он войдёт в топ-20.', 8, '2019-01-31 19:33:55', '-566855713.jpg', '320--566855713.jpg', 3, NULL),
(15, 'Доступна система контроля версий Git 2.20', 'Распределённая система контроля версий Git получила очередное обновление. Чтобы появилась Git 2.20, 83 разработчика внесли в код 962 изменения. По словам команды, это на порядок превышает тот же показатель в самом большом релизе ветки 2.x.x.\r\n\r\nОбратная совместимость\r\nКоманда git branch -l теперь является сокращённой версией git branch --list — раньше она помогала запустить reflog во время создания новой ветки. Запуск git fetch разработчики ограничили: он возможен только с указанием --force, чтобы исключить проблемы с согласованностью при обновлении ссылки.\r\n\r\nКоманды git help -a и git help -av в целях помощи новичкам отображают более подробный вывод. Чтобы вернуться к старому виду, достаточно ввести git help --no-verbose -a. В git send-email появилась возможность извлекать из подписей строки с адресами, которые заканчиваются на «-by». Это обратно несовместимое изменение, и его можно отключить, если добавить к команде --suppress-cc=misc-by.\r\n\r\nИнтерфейс и рабочие процессы\r\nЕсли в репозитории окажутся файлы, адреса которых отличаются только регистром букв, во время выполнения git clone высветится предупреждение.\r\nКоманда git format-patch получила опции --interdiff и --range-diff, которые выдают в примечании или комментарии списки различий между существующей и предыдущей версиями.\r\ngit mailinfo научилась восстанавливать код патчей, отправленных по email простым текстом и повреждённых из-за расстановки переносов.\r\ngit multi-pack-index теперь фиксирует повреждения в файлах формата .midx.\r\nСоздание экспериментальных файлов commit-graph для больших репозиториев занимает много времени, поэтому разработчики предусмотрели форму вывода о состоянии процесса.\r\nПроизводительность и поддержка разработки\r\nДля рабочих сборок предусмотрена опция компиляции -Wunused-function.\r\ngit submodule update полностью переписан на С.\r\nОдин из тестов непрерывной интеграции (CI), призванный работать с настройками unusual/experimental/random, теперь поддерживает файлы midx и commit-graph.\r\nПредставлен новый механизм поиска объектов среди большого количества pack-файлов. Он опирается на объединение всех .idx-файлов в один.\r\nПредыдущая версия системы вышла в сентябре 2018 года. Она включала в себя усовершенствованный поиск по репозиторию, настройки для сортировки веток по умолчанию и инструмент, позволяющий сравнивать цепочки коммитов.', 8, '2019-01-31 19:34:25', '-327107077.jpg', '320--327107077.jpg', 1, NULL),
(17, 'Samsung случайно показал свой первый смартфон с&nbsp;гибким экраном', '<p>В&nbsp;Сети появилось видео, на&nbsp;котором показан первый смартфон Samsung со&nbsp;складным экраном. Об&nbsp;этом сообщает портал Xda&nbsp;Developers. Ролик появился в&nbsp;аккаунтах вьетнамского подразделения компании в&nbsp;соцсетях. Позже видео удалили. На&nbsp;кадры попали новинки компании, которые, как&nbsp;ожидается, будут представлены на&nbsp;видеоконференции Samsung Unpacked. Мероприятие запланировано на&nbsp;20&nbsp;февраля. Судя по&nbsp;видео, у&nbsp;новой модели будет внутренний и&nbsp;наружный дисплеи, которые можно будет соединить в&nbsp;один экран. В&nbsp;то&nbsp;же&nbsp;время финальный дизайн смартфона может отличаться от&nbsp;того, что&nbsp;разработчики показали в&nbsp;ролике, отмечает издание.</p>\r\n', 8, '2019-02-01 20:37:57', NULL, NULL, 4, '2019-02-05 22:27:53');

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
(8, 'admin@mysite.com', '$2y$10$H/Co2OLA5doOSAMcgzZ2q.sWE94Lq4W4hAguvyZRQxCNoI9wzcyTS', 'admin', 'Сергей', 'Киселев', 'Россия', 'Нижний Новгород', '362963387.jpg', '48-362963387.jpg', NULL, NULL),
(9, 'sam@mail.com', '$2y$10$3pW6h0t4VQp6Peuc296tEeaO5mLbz3.WOzqgEjUUlJcMeOQxPNQ4W', 'user', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(10, 'vova@mail.com', '$2y$10$unbPxVaQo02u1g2ox3JI5OPLnW/H3PNbhLzGBg/U6gYCvA.YhB4Bi', 'user', 'Вова', 'Вованов', 'Казахстан', 'Астана', NULL, NULL, 'KtMGUilj9CSf4pa', 0),
(11, 'less@less.com', '$2y$10$Ue0.wDIRP7EG4lLZPO4GYOrRG6AQ00ovyFKUXPwXR0MI3z7A4c2HW', 'user', 'Less', 'Less', '', '', NULL, NULL, 'R9BbxP2GL7a35Mn', -2),
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
-- Индексы таблицы `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `comments`
--
ALTER TABLE `comments`
  ADD PRIMARY KEY (`id`),
  ADD KEY `index_foreignkey_comments_post` (`post_id`),
  ADD KEY `index_foreignkey_comments_user` (`user_id`);

--
-- Индексы таблицы `posts`
--
ALTER TABLE `posts`
  ADD PRIMARY KEY (`id`),
  ADD KEY `index_foreignkey_posts_author` (`author_id`);

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
-- AUTO_INCREMENT для таблицы `categories`
--
ALTER TABLE `categories`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT для таблицы `comments`
--
ALTER TABLE `comments`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT для таблицы `posts`
--
ALTER TABLE `posts`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;
--
-- AUTO_INCREMENT для таблицы `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
