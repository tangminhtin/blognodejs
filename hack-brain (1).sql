-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Máy chủ: 127.0.0.1
-- Thời gian đã tạo: Th10 31, 2020 lúc 04:54 AM
-- Phiên bản máy phục vụ: 10.4.14-MariaDB
-- Phiên bản PHP: 7.4.10

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Cơ sở dữ liệu: `hack-brain`
--

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `comments`
--

CREATE TABLE `comments` (
  `commentId` int(11) NOT NULL,
  `content` text DEFAULT NULL,
  `date` datetime DEFAULT NULL,
  `userId` int(11) DEFAULT NULL,
  `postId` int(11) DEFAULT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Đang đổ dữ liệu cho bảng `comments`
--

INSERT INTO `comments` (`commentId`, `content`, `date`, `userId`, `postId`, `createdAt`, `updatedAt`) VALUES
(1, 'Về hồi nào vậy?', '2020-10-30 12:50:51', 1, 2, '2020-10-30 19:50:51', '2020-10-30 19:50:51'),
(2, 'sao vậy?', '2020-10-30 12:51:22', 1, 3, '2020-10-30 19:51:22', '2020-10-30 19:51:22'),
(3, 'Trường thế nào ông ?', '2020-10-30 12:51:42', 1, 4, '2020-10-30 19:51:42', '2020-10-30 19:51:42'),
(4, 'Mới về hồi sáng nè. Nay về sớm mai lên sài gòn nữa', '2020-10-30 12:52:42', 3, 2, '2020-10-30 19:52:42', '2020-10-30 19:52:42'),
(5, 'thất tình bạn ơi', '2020-10-30 12:53:09', 3, 3, '2020-10-30 19:53:09', '2020-10-30 19:53:09'),
(6, 'Dữ :)', '2020-10-30 12:53:48', 3, 4, '2020-10-30 19:53:48', '2020-10-30 19:53:48'),
(7, 'bảnh :))', '2020-10-30 12:54:08', 3, 1, '2020-10-30 19:54:08', '2020-10-30 19:54:08');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `images`
--

CREATE TABLE `images` (
  `imageId` int(11) NOT NULL,
  `image` varchar(255) DEFAULT NULL,
  `postId` int(11) DEFAULT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Đang đổ dữ liệu cho bảng `images`
--

INSERT INTO `images` (`imageId`, `image`, `postId`, `createdAt`, `updatedAt`) VALUES
(1, 'uploads\\122796772_638589523476461_6211694582273628990_n.jpg', 1, '2020-10-30 17:53:29', '2020-10-30 17:53:29'),
(2, 'uploads\\91375565_2451762288467235_446865259517444096_o.jpg', 2, '2020-10-30 19:45:11', '2020-10-30 19:45:11'),
(3, 'uploads\\2b24317b-dc44-4001-99ab-46eb87652e5c.jpg', 3, '2020-10-30 19:45:51', '2020-10-30 19:45:51'),
(4, 'uploads\\58721770_1047873875411545_7074014537573203968_o.jpg', 4, '2020-10-30 19:49:13', '2020-10-30 19:49:13'),
(5, 'uploads\\Of98R0.png', 5, '2020-10-30 19:50:19', '2020-10-30 19:50:19');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `likehearts`
--

CREATE TABLE `likehearts` (
  `likeheartId` int(11) NOT NULL,
  `userId` int(11) DEFAULT NULL,
  `postId` int(11) DEFAULT NULL,
  `status` tinyint(1) DEFAULT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Đang đổ dữ liệu cho bảng `likehearts`
--

INSERT INTO `likehearts` (`likeheartId`, `userId`, `postId`, `status`, `createdAt`, `updatedAt`) VALUES
(1, 1, 1, 0, '2020-10-30 18:18:58', '2020-10-30 18:27:29'),
(2, 2, 1, 0, '2020-10-30 18:25:58', '2020-10-30 18:27:06'),
(3, 1, 3, 1, '2020-10-30 19:50:26', '2020-10-30 19:50:26'),
(4, 1, 2, 1, '2020-10-30 19:50:28', '2020-10-30 19:50:28'),
(5, 1, 4, 1, '2020-10-30 19:50:31', '2020-10-30 19:50:31'),
(6, 3, 2, 1, '2020-10-30 19:52:08', '2020-10-30 19:52:08'),
(7, 3, 1, 1, '2020-10-30 19:54:13', '2020-10-30 19:54:13');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `posts`
--

CREATE TABLE `posts` (
  `postId` int(11) NOT NULL,
  `title` varchar(255) DEFAULT NULL,
  `content` text DEFAULT NULL,
  `date` datetime DEFAULT NULL,
  `like` int(11) DEFAULT NULL,
  `view` int(11) DEFAULT NULL,
  `active` tinyint(1) DEFAULT NULL,
  `userId` int(11) DEFAULT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Đang đổ dữ liệu cho bảng `posts`
--

INSERT INTO `posts` (`postId`, `title`, `content`, `date`, `like`, `view`, `active`, `userId`, `createdAt`, `updatedAt`) VALUES
(1, 'CV outfit', 'Di xin viec', '2020-10-30 10:53:28', 3, 2, 1, 1, '2020-10-30 17:53:29', '2020-10-30 19:54:13'),
(2, 'Về quê', 'Về quê với bạn Hiển', '2020-10-30 12:45:11', 2, 7, 1, 3, '2020-10-30 19:45:11', '2020-10-31 01:07:14'),
(3, ':( sad', 'Tâm trạng hơi buồn', '2020-10-30 12:45:51', 1, 4, 1, 3, '2020-10-30 19:45:51', '2020-10-30 19:53:09'),
(4, 'FUCT', 'Hồ sen đẹp quá', '2020-10-30 12:49:13', 1, 4, 1, 2, '2020-10-30 19:49:13', '2020-10-30 19:53:48'),
(5, 'My love desktop screen', 'My love desktop screen', '2020-10-30 12:50:19', 0, 0, 1, 1, '2020-10-30 19:50:19', '2020-10-30 19:50:19');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `session`
--

CREATE TABLE `session` (
  `sid` varchar(36) NOT NULL,
  `expires` datetime DEFAULT NULL,
  `data` text DEFAULT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Đang đổ dữ liệu cho bảng `session`
--

INSERT INTO `session` (`sid`, `expires`, `data`, `createdAt`, `updatedAt`) VALUES
('1wc-PHTeYM1vcj4XqS-FMotRzCmNTdFe', '2020-11-01 01:07:16', '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"},\"csrfSecret\":\"Dtq0Vw_0WXhsfH72G9MNEkWy\",\"flash\":{},\"isLoggedIn\":true,\"user\":{\"userId\":3,\"fullname\":\"Nguyen Son Hao\",\"email\":\"hao123@gmail.com\",\"password\":\"$2a$12$h3aljfckm/szZZUzg4lv0O.MPTp1OOrR.MhFrztrySJn5SzGcb3GW\",\"image\":\"uploads\\\\27657856_1953220501607135_5109945302575959156_n.jpg\",\"active\":true,\"createdAt\":\"2020-10-30T19:44:11.000Z\",\"updatedAt\":\"2020-10-30T19:44:11.000Z\"}}', '2020-10-30 19:51:45', '2020-10-31 01:07:16'),
('TyVdzz9Go3ohS9T5rXM-khy6gZXPGb7B', '2020-10-31 18:19:08', '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"},\"csrfSecret\":\"oO2G2lA1WKBSiRXunY7Tw3jE\"}', '2020-10-30 18:19:08', '2020-10-30 18:19:08');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `users`
--

CREATE TABLE `users` (
  `userId` int(11) NOT NULL,
  `fullname` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `password` varchar(255) DEFAULT NULL,
  `image` varchar(255) DEFAULT NULL,
  `active` tinyint(1) DEFAULT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Đang đổ dữ liệu cho bảng `users`
--

INSERT INTO `users` (`userId`, `fullname`, `email`, `password`, `image`, `active`, `createdAt`, `updatedAt`) VALUES
(1, 'Hua Quoc Vinh', 'quocvinh12360@gmail.com', '$2a$12$K/HS/zm2frcwNFBUvIT0EuvT1lD.zwrLeoQ7ySFJwNCTyYIkDKB8W', 'uploads\\53431859_790037724695378_3570738017784037376_n.jpg', 1, '2020-10-30 17:53:06', '2020-10-30 17:53:06'),
(2, 'Tang Minh Tin', 'tin123@gmail.com', '$2a$12$7Xhw3KTT2XUb50YBBawe3urSG1to17DwrQQxK.72MZFMlSVapGxGa', 'uploads\\58721770_1047873875411545_7074014537573203968_o.jpg', 1, '2020-10-30 18:25:47', '2020-10-30 18:25:47'),
(3, 'Nguyen Son Hao', 'hao123@gmail.com', '$2a$12$h3aljfckm/szZZUzg4lv0O.MPTp1OOrR.MhFrztrySJn5SzGcb3GW', 'uploads\\27657856_1953220501607135_5109945302575959156_n.jpg', 1, '2020-10-30 19:44:11', '2020-10-30 19:44:11');

--
-- Chỉ mục cho các bảng đã đổ
--

--
-- Chỉ mục cho bảng `comments`
--
ALTER TABLE `comments`
  ADD PRIMARY KEY (`commentId`);

--
-- Chỉ mục cho bảng `images`
--
ALTER TABLE `images`
  ADD PRIMARY KEY (`imageId`);

--
-- Chỉ mục cho bảng `likehearts`
--
ALTER TABLE `likehearts`
  ADD PRIMARY KEY (`likeheartId`);

--
-- Chỉ mục cho bảng `posts`
--
ALTER TABLE `posts`
  ADD PRIMARY KEY (`postId`);

--
-- Chỉ mục cho bảng `session`
--
ALTER TABLE `session`
  ADD PRIMARY KEY (`sid`);

--
-- Chỉ mục cho bảng `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`userId`),
  ADD UNIQUE KEY `email` (`email`);

--
-- AUTO_INCREMENT cho các bảng đã đổ
--

--
-- AUTO_INCREMENT cho bảng `comments`
--
ALTER TABLE `comments`
  MODIFY `commentId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT cho bảng `images`
--
ALTER TABLE `images`
  MODIFY `imageId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT cho bảng `likehearts`
--
ALTER TABLE `likehearts`
  MODIFY `likeheartId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT cho bảng `posts`
--
ALTER TABLE `posts`
  MODIFY `postId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT cho bảng `users`
--
ALTER TABLE `users`
  MODIFY `userId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
