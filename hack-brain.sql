-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Oct 19, 2020 at 09:37 AM
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
(4, 'Chúc bạn tui trăm năm hạnh phúc Thuật Trần nhìn cưng quá đê!', '2020-10-11 00:27:48', 2, 2, '2020-10-11 00:27:48', '2020-10-11 00:27:48'),
(5, 'haha', '2020-10-18 07:21:19', 5, 2, '2020-10-18 14:21:19', '2020-10-18 14:21:19'),
(6, 'ai ma xin qua', '2020-10-18 07:34:14', 5, 5, '2020-10-18 14:34:14', '2020-10-18 14:34:14');

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
(6, 'https://scontent.fsgn5-5.fna.fbcdn.net/v/t1.0-9/p843x403/120929253_1020492918395957_2421866704022844717_o.jpg?_nc_cat=108&_nc_sid=b9115d&_nc_ohc=bSszHGeAQcUAX9dKrhf&_nc_ht=scontent.fsgn5-5.fna&tp=6&oh=a3b3529ca7084aeb48bc63096fd1f120&oe=5FA7429D', 3, '2020-10-11 00:15:45', '2020-10-11 00:15:45'),
(7, 'https://scontent-hkg4-2.xx.fbcdn.net/v/t1.0-9/53431859_790037724695378_3570738017784037376_n.jpg?_nc_cat=104&_nc_sid=174925&_nc_ohc=9w3qEJQYRJ8AX8nEM4r&_nc_ht=scontent-hkg4-2.xx&oh=7d13b8533be68c8d15380f63fe4c3b6c&oe=5FAB9023', 4, '2020-10-14 20:21:28', '2020-10-14 20:21:28'),
(8, 'https://scontent-xsp1-1.xx.fbcdn.net/v/t1.0-9/s1080x2048/121611066_335064324458253_6714004544203639607_o.jpg?_nc_cat=108&_nc_sid=825194&_nc_ohc=qj2kNgqwJM8AX9LBxSN&_nc_ht=scontent-xsp1-1.xx&tp=7&oh=b87ecef7287e9d8dcf017f498efb61eb&oe=5FB21D15', 5, '2020-10-18 14:22:15', '2020-10-18 14:22:15'),
(9, 'https://scontent-sin6-2.xx.fbcdn.net/v/t1.0-9/p960x960/121614981_380333589983730_8363798913621293549_o.jpg?_nc_cat=110&_nc_sid=730e14&_nc_ohc=ReFLN0Tz3aoAX8xtcem&_nc_ht=scontent-sin6-2.xx&tp=6&oh=7970daea29e7026fbbfaf2f57c7c65e2&oe=5FB3CCD9', 6, '2020-10-18 14:42:32', '2020-10-18 14:42:32'),
(10, 'https://scontent.fsgn5-2.fna.fbcdn.net/v/t1.0-9/p843x403/121616146_2052113314928765_3586643293505037936_o.jpg?_nc_cat=1&_nc_sid=b9115d&_nc_ohc=kwaTF4ASQd8AX8zN-9M&_nc_ht=scontent.fsgn5-2.fna&tp=6&oh=630d3d64750b69b4eec13ed66e844781&oe=5FB23EE4', 7, '2020-10-18 14:52:01', '2020-10-18 14:52:01');

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
  `likeStatus` tinyint(1) DEFAULT NULL,
  `view` int(11) DEFAULT NULL,
  `active` tinyint(1) DEFAULT NULL,
  `userId` int(11) DEFAULT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `posts`
--

INSERT INTO `posts` (`postId`, `title`, `content`, `date`, `like`, `likeStatus`, `view`, `active`, `userId`, `createdAt`, `updatedAt`) VALUES
(1, 'Hôm nay mệt cả người', 'S mưa hoài z nè', '2020-10-10 18:59:10', 10, 0, 106, 1, 1, '2020-10-10 18:59:10', '2020-10-18 16:50:56'),
(2, 'Tú mới gạ 1 em xinh gái', 'Say 1 tí \r\nNghĩ lại chuyện đã qua', '2020-10-10 23:37:36', 99, 0, 292, 1, 1, '2020-10-10 23:37:36', '2020-10-18 14:32:44'),
(3, 'Được giải này sẽ bao lẩu mọi người', 'Không biết do mẫu hay do thợ chụp mà nó như thế nàyyyy', '2020-10-11 00:12:49', 134, 0, 232, 1, 2, '2020-10-11 00:12:49', '2020-10-18 14:32:55'),
(4, 'Cần Thơ chiều nặng gió', '14/10/2020, tĩnh lặng như sóng.', '2020-10-14 20:19:01', 50, 0, 101, 1, 3, '2020-10-14 19:41:04', '2020-10-18 14:33:00'),
(5, 'hom nay la ngay nghi', 'toi di ngu', '2020-10-18 07:22:15', 0, 0, 7, 1, 5, '2020-10-18 14:22:15', '2020-10-18 14:38:57'),
(6, '123', '123', '2020-10-18 07:42:32', 0, 0, 0, 1, 5, '2020-10-18 14:42:32', '2020-10-18 14:42:32'),
(7, 'da', 'toi di ngu', '2020-10-18 07:52:01', 1, 1, 4, 1, 5, '2020-10-18 14:52:01', '2020-10-19 06:24:14');

-- --------------------------------------------------------

--
-- Table structure for table `Session`
--

CREATE TABLE `Session` (
  `sid` varchar(36) NOT NULL,
  `expires` datetime DEFAULT NULL,
  `data` text DEFAULT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `Session`
--

INSERT INTO `Session` (`sid`, `expires`, `data`, `createdAt`, `updatedAt`) VALUES
('kK4MuBNZ7NTdP7p73QqH8BFhu_lvjr87', '2020-10-20 07:33:33', '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"},\"csrfSecret\":\"MvYEhYtvEeu3-R6o5xisL678\",\"flash\":{},\"isLoggedIn\":true,\"user\":{\"userId\":17,\"fullname\":\"Huynh Thi Nhien\",\"email\":\"nhienht@gmail.com\",\"password\":\"$2a$12$uRoN.doK8tbn/ZWm06QTm.CXki5nI/SPUg2dJJ8OkMhwnTIJfrF.W\",\"image\":\"uploads/2020-10-19T07:27:09.266Z-119990267_1507051709467988_8980319581349841457_o.jpg\",\"active\":true,\"createdAt\":\"2020-10-19T07:27:09.000Z\",\"updatedAt\":\"2020-10-19T07:27:09.000Z\"}}', '2020-10-19 07:25:37', '2020-10-19 07:33:33');

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
(2, 'Son Hao', 'sonhao@gmail.com', '123', 'https://scontent-sin6-1.xx.fbcdn.net/v/t1.0-9/73168445_2343709745891540_4086424003596517376_o.jpg?_nc_cat=104&_nc_sid=174925&_nc_ohc=jocbq54YmDwAX-j6UKK&_nc_ht=scontent-sin6-1.xx&oh=789c1c519efb8cce59125ffdb7386d9d&oe=5FA82696', 1, '2020-10-11 00:09:48', '2020-10-11 00:09:48'),
(3, 'Hua Quoc Vinh ', 'huavinh@gmail.com', '123', 'https://scontent-hkg4-1.xx.fbcdn.net/v/t1.0-9/69154420_899471010418715_5003434701369638912_n.jpg?_nc_cat=110&_nc_sid=174925&_nc_ohc=jSsEv2kq03AAX-Dc_BD&_nc_ht=scontent-hkg4-1.xx&oh=c4e9fb21343656eeeb23c4f44bf160be&oe=5FAB1EBA', 1, '2020-10-14 19:41:04', '2020-10-14 19:41:04'),
(4, 'HuaVinh', 'vinhhqce140143@fpt.edu.vn', '$2a$12$EFGanBJMdMXQp3c74bdLhu8tiIxt/7GEi0i6y1Vcp5QVngaUbYlBi', 'https://scontent.fvca1-2.fna.fbcdn.net/v/t1.0-9/53431859_790037724695378_3570738017784037376_n.jpg?_nc_cat=104&_nc_sid=174925&_nc_ohc=T3hytQTC4AIAX8AF5XE&_nc_ht=scontent.fvca1-2.fna&oh=a7298864ba1b90f80476c688ccd59e19&oe=5FAF84A3', 1, '2020-10-18 05:20:47', '2020-10-18 05:20:47'),
(5, 'Minh Tin Tang', 'minhtintang@gmail.com', '$2a$12$iAlgBrOng.oHKaJLIJf35.XWqMB8bzSZtdQ0FTA86PjpP/9QuCGwm', 'https://scontent.fsgn5-2.fna.fbcdn.net/v/t1.0-9/121235287_843259223093828_2384260608192219941_o.jpg?_nc_cat=107&_nc_sid=b9115d&_nc_ohc=HGwS5k28j9AAX80DZXU&_nc_ht=scontent.fsgn5-2.fna&oh=4a39f46534f8a186a131a60b467aca0a&oe=5FB07025', 1, '2020-10-18 14:20:45', '2020-10-18 14:20:45');

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
-- Indexes for table `Session`
--
ALTER TABLE `Session`
  ADD PRIMARY KEY (`sid`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`userId`),
  ADD UNIQUE KEY `email` (`email`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `comments`
--
ALTER TABLE `comments`
  MODIFY `commentId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `images`
--
ALTER TABLE `images`
  MODIFY `imageId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `posts`
--
ALTER TABLE `posts`
  MODIFY `postId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `userId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
