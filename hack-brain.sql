-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Oct 11, 2020 at 07:32 AM
-- Server version: 10.4.14-MariaDB
-- PHP Version: 7.2.33

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `hack-brain`
--

-- --------------------------------------------------------

--
-- Table structure for table `comments`
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
-- Dumping data for table `comments`
--

INSERT INTO `comments` (`commentId`, `content`, `date`, `userId`, `postId`, `createdAt`, `updatedAt`) VALUES
(1, 'Heo hay gì 1 mình 3ly', '2020-10-10 19:02:05', 1, 1, '2020-10-10 19:02:05', '2020-10-10 19:02:05'),
(2, 'Hic mk gái thẳng mà nhìn nụ cười cụa bạn thì sắp cong mất gòi, có nhận chơi les ko ợ.…', '2020-10-11 00:24:12', 2, 1, '2020-10-11 00:24:12', '2020-10-11 00:24:12'),
(3, 'Để Mị nói cho mà nghe...\r\nGặt đi chứ không mai các bác nhiếp gặt hết đó', '2020-10-11 00:25:15', 2, 1, '2020-10-11 00:25:15', '2020-10-11 00:25:15'),
(4, 'Chúc bạn tui trăm năm hạnh phúc Thuật Trần nhìn cưng quá đê!', '2020-10-11 00:27:48', 2, 2, '2020-10-11 00:27:48', '2020-10-11 00:27:48');

-- --------------------------------------------------------

--
-- Table structure for table `images`
--

CREATE TABLE `images` (
  `imageId` int(11) NOT NULL,
  `image` varchar(255) DEFAULT NULL,
  `postId` int(11) DEFAULT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `images`
--

INSERT INTO `images` (`imageId`, `image`, `postId`, `createdAt`, `updatedAt`) VALUES
(1, 'https://scontent.fsgn5-4.fna.fbcdn.net/v/t1.0-9/57176808_2310772395862440_4677370477998505984_n.jpg?_nc_cat=102&_nc_sid=730e14&_nc_ohc=EStB0_yY7loAX_c63rj&_nc_ht=scontent.fsgn5-4.fna&oh=4b129ed75db0f9f61ceed8b34f824dd7&oe=5FA985E5', 1, '2020-10-10 19:01:43', '2020-10-10 19:01:43'),
(3, 'https://scontent.fsgn5-5.fna.fbcdn.net/v/t1.0-9/s1080x2048/120838578_1000231983753556_7098471953511895813_o.jpg?_nc_cat=100&_nc_sid=8bfeb9&_nc_ohc=oJ_pY77zcsMAX9_1eoV&_nc_ht=scontent.fsgn5-5.fna&tp=7&oh=0c13ae24685c9562df98654876a9dd4c&oe=5FA5D0BA', 1, '2020-10-10 23:35:08', '2020-10-10 23:35:08'),
(4, 'https://scontent.fsgn5-3.fna.fbcdn.net/v/t1.0-9/52328308_2394305224189594_3661053045350858752_n.jpg?_nc_cat=110&_nc_sid=8bfeb9&_nc_ohc=3t09_QieGBgAX-rEZVX&_nc_ht=scontent.fsgn5-3.fna&oh=68260078d96257a4f4bcbe1dd20eb122&oe=5FA91936', 2, '2020-10-10 23:40:15', '2020-10-10 23:40:15'),
(5, 'https://scontent-sin6-2.xx.fbcdn.net/v/t1.0-9/120175326_782484252565059_7606333950439117425_o.jpg?_nc_cat=108&_nc_sid=8bfeb9&_nc_ohc=GN8MNAvxxVMAX9ZlXn4&_nc_ht=scontent-sin6-2.xx&oh=e5596b5703f49345101891318bfca834&oe=5FA95EED', 3, '2020-10-11 00:15:45', '2020-10-11 00:15:45'),
(6, 'https://scontent.fsgn5-5.fna.fbcdn.net/v/t1.0-9/p843x403/120929253_1020492918395957_2421866704022844717_o.jpg?_nc_cat=108&_nc_sid=b9115d&_nc_ohc=bSszHGeAQcUAX9dKrhf&_nc_ht=scontent.fsgn5-5.fna&tp=6&oh=a3b3529ca7084aeb48bc63096fd1f120&oe=5FA7429D', 3, '2020-10-11 00:15:45', '2020-10-11 00:15:45');

-- --------------------------------------------------------

--
-- Table structure for table `posts`
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
-- Dumping data for table `posts`
--

INSERT INTO `posts` (`postId`, `title`, `content`, `date`, `like`, `view`, `active`, `userId`, `createdAt`, `updatedAt`) VALUES
(1, 'Hôm nay mệt cả người', 'S mưa hoài z nè', '2020-10-10 18:59:10', 10, 99, 1, 1, '2020-10-10 18:59:10', '2020-10-10 18:59:10'),
(2, 'Tú mới gạ 1 em xinh gái', 'Say 1 tí \r\nNghĩ lại chuyện đã qua', '2020-10-10 23:37:36', 99, 289, 1, 1, '2020-10-10 23:37:36', '2020-10-10 23:37:36'),
(3, 'Được giải này sẽ bao lẩu mọi người', 'Không biết do mẫu hay do thợ chụp mà nó như thế nàyyyy', '2020-10-11 00:12:49', 134, 231, 1, 2, '2020-10-11 00:12:49', '2020-10-11 00:12:49');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `userId` int(11) NOT NULL,
  `fullname` varchar(255) NOT NULL,
  `email` varchar(255) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `image` varchar(255) DEFAULT NULL,
  `active` tinyint(1) DEFAULT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`userId`, `fullname`, `email`, `password`, `image`, `active`, `createdAt`, `updatedAt`) VALUES
(1, 'Tu Nguyen', 'tunguyen@gmail.com', '123', 'https://scontent-sin6-1.xx.fbcdn.net/v/t1.0-9/60285766_2334417313497948_7506251336048967680_n.jpg?_nc_cat=111&_nc_sid=09cbfe&_nc_ohc=tw1mMlxKRIIAX9wKRvw&_nc_ht=scontent-sin6-1.xx&oh=b2f2860b4b4220f2b0b3a14f4e6254ba&oe=5FA8F933', 1, '2020-10-10 18:57:35', '2020-10-10 18:57:35'),
(2, 'Son Hao', 'sonhao@gmail.com', '123', 'https://scontent-sin6-1.xx.fbcdn.net/v/t1.0-9/73168445_2343709745891540_4086424003596517376_o.jpg?_nc_cat=104&_nc_sid=174925&_nc_ohc=jocbq54YmDwAX-j6UKK&_nc_ht=scontent-sin6-1.xx&oh=789c1c519efb8cce59125ffdb7386d9d&oe=5FA82696', 1, '2020-10-11 00:09:48', '2020-10-11 00:09:48');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `comments`
--
ALTER TABLE `comments`
  ADD PRIMARY KEY (`commentId`);

--
-- Indexes for table `images`
--
ALTER TABLE `images`
  ADD PRIMARY KEY (`imageId`);

--
-- Indexes for table `posts`
--
ALTER TABLE `posts`
  ADD PRIMARY KEY (`postId`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`userId`),
  ADD UNIQUE KEY `fullname` (`fullname`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `comments`
--
ALTER TABLE `comments`
  MODIFY `commentId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `images`
--
ALTER TABLE `images`
  MODIFY `imageId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `posts`
--
ALTER TABLE `posts`
  MODIFY `postId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `userId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
