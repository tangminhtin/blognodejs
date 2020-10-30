-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Máy chủ: 127.0.0.1
-- Thời gian đã tạo: Th10 30, 2020 lúc 08:01 PM
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
(1, 'uploads\\122796772_638589523476461_6211694582273628990_n.jpg', 1, '2020-10-30 17:53:29', '2020-10-30 17:53:29');

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
(2, 2, 1, 0, '2020-10-30 18:25:58', '2020-10-30 18:27:06');

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
(1, 'CV outfit', 'Di xin viec', '2020-10-30 10:53:28', 2, 0, 1, 1, '2020-10-30 17:53:29', '2020-10-30 18:27:29');

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
('NMiDXKRRHe5WhKhp3-KpLn-39osMDptG', '2020-10-31 18:40:08', '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"},\"csrfSecret\":\"uLMbmcFBcDGf9AUEgYVb2llG\",\"flash\":{},\"isLoggedIn\":true,\"user\":{\"userId\":1,\"fullname\":\"Hua Quoc Vinh\",\"email\":\"quocvinh12360@gmail.com\",\"password\":\"$2a$12$K/HS/zm2frcwNFBUvIT0EuvT1lD.zwrLeoQ7ySFJwNCTyYIkDKB8W\",\"image\":\"uploads\\\\53431859_790037724695378_3570738017784037376_n.jpg\",\"active\":true,\"createdAt\":\"2020-10-30T17:53:06.000Z\",\"updatedAt\":\"2020-10-30T17:53:06.000Z\"}}', '2020-10-30 18:27:10', '2020-10-30 18:40:08'),
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
(2, 'Tang Minh Tin', 'tin123@gmail.com', '$2a$12$7Xhw3KTT2XUb50YBBawe3urSG1to17DwrQQxK.72MZFMlSVapGxGa', 'uploads\\58721770_1047873875411545_7074014537573203968_o.jpg', 1, '2020-10-30 18:25:47', '2020-10-30 18:25:47');

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
  MODIFY `commentId` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `images`
--
ALTER TABLE `images`
  MODIFY `imageId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT cho bảng `likehearts`
--
ALTER TABLE `likehearts`
  MODIFY `likeheartId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT cho bảng `posts`
--
ALTER TABLE `posts`
  MODIFY `postId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT cho bảng `users`
--
ALTER TABLE `users`
  MODIFY `userId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
