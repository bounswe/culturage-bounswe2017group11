-- phpMyAdmin SQL Dump
-- version 4.5.4.1deb2ubuntu2
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: Jan 01, 2018 at 11:10 AM
-- Server version: 5.7.20-0ubuntu0.16.04.1
-- PHP Version: 7.0.22-0ubuntu0.16.04.1

SET FOREIGN_KEY_CHECKS=0;
SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `culturage`
--

-- --------------------------------------------------------

--
-- Table structure for table `authtoken_token`
--

CREATE TABLE `authtoken_token` (
  `key` varchar(40) COLLATE utf8mb4_bin NOT NULL,
  `created` datetime(6) NOT NULL,
  `user_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

-- --------------------------------------------------------

--
-- Table structure for table `auth_group`
--

CREATE TABLE `auth_group` (
  `id` int(11) NOT NULL,
  `name` varchar(80) COLLATE utf8mb4_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

-- --------------------------------------------------------

--
-- Table structure for table `auth_group_permissions`
--

CREATE TABLE `auth_group_permissions` (
  `id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

-- --------------------------------------------------------

--
-- Table structure for table `auth_permission`
--

CREATE TABLE `auth_permission` (
  `id` int(11) NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_bin NOT NULL,
  `content_type_id` int(11) NOT NULL,
  `codename` varchar(100) COLLATE utf8mb4_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

--
-- Dumping data for table `auth_permission`
--

INSERT INTO `auth_permission` (`id`, `name`, `content_type_id`, `codename`) VALUES
(1, 'Can add log entry', 1, 'add_logentry'),
(2, 'Can change log entry', 1, 'change_logentry'),
(3, 'Can delete log entry', 1, 'delete_logentry'),
(4, 'Can add group', 2, 'add_group'),
(5, 'Can change group', 2, 'change_group'),
(6, 'Can delete group', 2, 'delete_group'),
(7, 'Can add user', 3, 'add_user'),
(8, 'Can change user', 3, 'change_user'),
(9, 'Can delete user', 3, 'delete_user'),
(10, 'Can add permission', 4, 'add_permission'),
(11, 'Can change permission', 4, 'change_permission'),
(12, 'Can delete permission', 4, 'delete_permission'),
(13, 'Can add content type', 5, 'add_contenttype'),
(14, 'Can change content type', 5, 'change_contenttype'),
(15, 'Can delete content type', 5, 'delete_contenttype'),
(16, 'Can add session', 6, 'add_session'),
(17, 'Can change session', 6, 'change_session'),
(18, 'Can delete session', 6, 'delete_session'),
(19, 'Can add reported', 7, 'add_reported'),
(20, 'Can change reported', 7, 'change_reported'),
(21, 'Can delete reported', 7, 'delete_reported'),
(22, 'Can add profile', 8, 'add_profile'),
(23, 'Can change profile', 8, 'change_profile'),
(24, 'Can delete profile', 8, 'delete_profile'),
(25, 'Can add user rated item', 9, 'add_userrateditem'),
(26, 'Can change user rated item', 9, 'change_userrateditem'),
(27, 'Can delete user rated item', 9, 'delete_userrateditem'),
(28, 'Can add text anno', 10, 'add_textanno'),
(29, 'Can change text anno', 10, 'change_textanno'),
(30, 'Can delete text anno', 10, 'delete_textanno'),
(31, 'Can add timeline', 11, 'add_timeline'),
(32, 'Can change timeline', 11, 'change_timeline'),
(33, 'Can delete timeline', 11, 'delete_timeline'),
(34, 'Can add item follow', 12, 'add_itemfollow'),
(35, 'Can change item follow', 12, 'change_itemfollow'),
(36, 'Can delete item follow', 12, 'delete_itemfollow'),
(37, 'Can add location', 13, 'add_location'),
(38, 'Can change location', 13, 'change_location'),
(39, 'Can delete location', 13, 'delete_location'),
(40, 'Can add media', 14, 'add_media'),
(41, 'Can change media', 14, 'change_media'),
(42, 'Can delete media', 14, 'delete_media'),
(43, 'Can add user rated annotation', 15, 'add_userratedannotation'),
(44, 'Can change user rated annotation', 15, 'change_userratedannotation'),
(45, 'Can delete user rated annotation', 15, 'delete_userratedannotation'),
(46, 'Can add audio anno', 16, 'add_audioanno'),
(47, 'Can change audio anno', 16, 'change_audioanno'),
(48, 'Can delete audio anno', 16, 'delete_audioanno'),
(49, 'Can add annotation', 17, 'add_annotation'),
(50, 'Can change annotation', 17, 'change_annotation'),
(51, 'Can delete annotation', 17, 'delete_annotation'),
(52, 'Can add image anno', 18, 'add_imageanno'),
(53, 'Can change image anno', 18, 'change_imageanno'),
(54, 'Can delete image anno', 18, 'delete_imageanno'),
(55, 'Can add tag', 19, 'add_tag'),
(56, 'Can change tag', 19, 'change_tag'),
(57, 'Can delete tag', 19, 'delete_tag'),
(58, 'Can add follow', 20, 'add_follow'),
(59, 'Can change follow', 20, 'change_follow'),
(60, 'Can delete follow', 20, 'delete_follow'),
(61, 'Can add item edit', 21, 'add_itemedit'),
(62, 'Can change item edit', 21, 'change_itemedit'),
(63, 'Can delete item edit', 21, 'delete_itemedit'),
(64, 'Can add comment', 22, 'add_comment'),
(65, 'Can change comment', 22, 'change_comment'),
(66, 'Can delete comment', 22, 'delete_comment'),
(67, 'Can add tag list', 23, 'add_taglist'),
(68, 'Can change tag list', 23, 'change_taglist'),
(69, 'Can delete tag list', 23, 'delete_taglist'),
(70, 'Can add item', 24, 'add_item'),
(71, 'Can change item', 24, 'change_item'),
(72, 'Can delete item', 24, 'delete_item'),
(73, 'Can add video anno', 25, 'add_videoanno'),
(74, 'Can change video anno', 25, 'change_videoanno'),
(75, 'Can delete video anno', 25, 'delete_videoanno'),
(76, 'Can add user rated comment', 26, 'add_userratedcomment'),
(77, 'Can change user rated comment', 26, 'change_userratedcomment'),
(78, 'Can delete user rated comment', 26, 'delete_userratedcomment'),
(79, 'Can add Token', 27, 'add_token'),
(80, 'Can change Token', 27, 'change_token'),
(81, 'Can delete Token', 27, 'delete_token'),
(82, 'Can add report', 7, 'add_report'),
(83, 'Can change report', 7, 'change_report'),
(84, 'Can delete report', 7, 'delete_report');

-- --------------------------------------------------------

--
-- Table structure for table `auth_user`
--

CREATE TABLE `auth_user` (
  `id` int(11) NOT NULL,
  `password` varchar(128) COLLATE utf8mb4_bin NOT NULL,
  `last_login` datetime(6) DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(150) COLLATE utf8mb4_bin NOT NULL,
  `first_name` varchar(30) COLLATE utf8mb4_bin NOT NULL,
  `last_name` varchar(30) COLLATE utf8mb4_bin NOT NULL,
  `email` varchar(254) COLLATE utf8mb4_bin NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

--
-- Dumping data for table `auth_user`
--

INSERT INTO `auth_user` (`id`, `password`, `last_login`, `is_superuser`, `username`, `first_name`, `last_name`, `email`, `is_staff`, `is_active`, `date_joined`) VALUES
(1, 'pbkdf2_sha256$36000$C3Ek43zkS5Fp$KSBZmQFpmoRk+w3FK1jwHmEq/YkuONQHRyKlm7y47f0=', NULL, 0, 'enescakir11', '', '', 'deneme@deneme.com', 0, 1, '2017-11-23 11:59:46.000000'),
(2, 'pbkdf2_sha256$36000$pRxQ9lYIo2zt$SNrEWOvK4dd7wW5rwWWGcBR87Rhc/upuzZvhNKNbWmU=', '2018-01-01 11:06:17.472716', 1, 'admin', '', '', 'admin@admin.com', 1, 1, '2017-11-23 12:15:16.484094'),
(3, 'pbkdf2_sha256$36000$jNFjoYLWpRLC$3AKc4v19zBy4HDZh0SaTXL7kb5OfCL0EIR0XogDYH9U=', NULL, 0, 'halil', '', '', 'halilkalkan95@gmail.com', 0, 1, '2017-11-29 19:50:36.130079'),
(4, 'pbkdf2_sha256$36000$W31KT98fHT9m$/M7PFVNVzvO9SO7Z6Cz5ajVJMZl8hQGRYB+KURsBTOM=', NULL, 0, 'akoksal', '', '', 'denem1e@deneme.com', 0, 1, '2017-11-29 20:39:24.580933'),
(7, 'pbkdf2_sha256$36000$afSuWbANa5TF$9ZWJCr7CUfRrUiDOLxvuNKYuKcwYjcm5suNl56J/ZIs=', NULL, 0, 'q', '', '', 'deneme@deneme.com', 0, 1, '2017-12-01 13:43:00.889226'),
(8, 'pbkdf2_sha256$36000$hDdV9CkRpdNG$gmEbhJ7MN7tasuFb0U1Sx86RVH1G7Lz3oZ+hgtP+NK0=', NULL, 0, 'asda', '', '', 'das@asdsa.com', 0, 1, '2017-12-01 13:43:31.639802'),
(9, 'pbkdf2_sha256$36000$PQ5vSB3LboYd$9ymIwZjwU0XF03y4yUamv9+XpXwz5HTHeL58C4tRBwE=', NULL, 0, 'hilal', '', '', 'hilal@hilal.com', 0, 1, '2017-12-01 18:21:38.598303'),
(10, 'pbkdf2_sha256$36000$68isIGj5JAZW$+9zIX3Gh3l2Th++QOuG3uMtS3ihsbweZdD2USAdLtGE=', NULL, 0, 'a', '', '', 'a@a.com', 0, 1, '2017-12-01 18:25:40.065767'),
(11, 'pbkdf2_sha256$36000$Zjul5ShxiUtS$Nf4prgTScPNeTKlyc8o2pDn1RcPqacwyyoNXBTiLAIM=', NULL, 0, 'sds', '', '', 'aa@asd.com', 0, 1, '2017-12-01 19:02:37.880768'),
(12, 'pbkdf2_sha256$36000$J4tbttfsJoCe$JlpIPo4/H3li3YGfuz3vcj5eSYza0QYU0OVgtCiyDRA=', NULL, 0, 'reg1', '', '', 'reg@reg.com', 0, 1, '2017-12-01 19:03:37.733231'),
(13, 'pbkdf2_sha256$36000$zZf50zIz5ISb$kkM4tRF/hgx5/TeHVvXbRHmjFe3c3ezqhuisnXgyhNE=', NULL, 0, 'reg2', '', '', 'reg2@reg2.com', 0, 1, '2017-12-01 19:06:21.555956'),
(14, 'pbkdf2_sha256$36000$s8YGuDlD9SnB$2+u4aVLxKKbl5bNsv9aBdKgqqJRbp6GCQxDUT+Jkszo=', NULL, 0, 'asdasdasd', '', '', 'asdasd@asd.com', 0, 1, '2017-12-01 19:14:52.582179'),
(15, 'pbkdf2_sha256$36000$jlYFpzuJ8foC$+Y0ndcsUWRVeSSV3NSMogeNfH/8au6S1Desw9ShFkQE=', NULL, 0, 'xx', '', '', 'xx@xx.com', 0, 1, '2017-12-01 19:27:51.311856'),
(16, 'pbkdf2_sha256$36000$jmVMadAJfgLj$BmNRF5cQZdqvt1g8e8rRoHAVPLcHVveOjTl9ZFaXTJ8=', NULL, 0, 'register', '', '', '123@ds.com', 0, 1, '2017-12-03 21:44:40.010274'),
(17, 'pbkdf2_sha256$36000$oc4g2T2vQ359$HLdIEEsmkdsyOak4Heslm7/1tngb7tsV3mhoyx5KyLs=', NULL, 0, 'guest', '', '', 'guest@test.com', 0, 1, '2017-12-04 12:43:49.970938'),
(18, 'pbkdf2_sha256$36000$1ZQApwAQbprm$XJPxKoSUWuve2dhPdOsEZslo7GBE89GmaG+3cLtPkww=', NULL, 0, 'kaan', '', '', 'kaanuzdogan@hotmail.com', 0, 1, '2017-12-04 20:46:44.241564'),
(19, 'pbkdf2_sha256$36000$vRcovgczxuq5$CW/erc8dV6eISbzHKE6qSM75epZr/1+NsR0vfl0UGck=', NULL, 0, 'qqq', '', '', 'qqq@qqq.com', 0, 1, '2017-12-04 20:53:47.644907'),
(20, 'pbkdf2_sha256$36000$cC59THjM68Lt$hmNfG7fZvTrXwDApcwHo+5IsWmMT7GYs93to8Wvhaj0=', NULL, 0, 'qq', '', '', 'qq@qq.com', 0, 1, '2017-12-04 20:57:30.860091'),
(21, 'pbkdf2_sha256$36000$tGbGKXQ63oPb$6dIO/qcB3JoKE8L3V/HUB7wwujCOrZOASeIAwx+Jnwo=', NULL, 0, 'w', '', '', 'w@w.com', 0, 1, '2017-12-04 21:00:07.053916'),
(22, 'pbkdf2_sha256$36000$95wLzAdlzu1P$hkIG1jqKwSXC39ZQYKSpkZqO+rYfx1gSHkdXXM9royI=', NULL, 0, 'mrg', '', '', 'mrg@gmail.com', 0, 1, '2017-12-05 17:03:28.322778'),
(23, 'pbkdf2_sha256$36000$zCVEw5o9nl5C$kUJIDKOeIu5SiGgYBPkw8mApFwqPMR6/WBOSvFrjYfE=', NULL, 0, 'Riza', '', '', 'rizaozcelik96@gmail.com', 0, 1, '2017-12-06 06:32:34.456327'),
(24, 'pbkdf2_sha256$36000$a7RwFWeDaOx9$sN1yeQ58OMGv9lUPCkrEboY0IjAq9pIvLm0x8wd8zwk=', NULL, 0, 'test', '', '', 'test@test.com', 0, 1, '2017-12-06 14:12:01.882668'),
(25, 'pbkdf2_sha256$36000$Gu8O0vLtrjln$QB4QUtqy9viu195Qwoad2RPkHmv9g8Y30gqIG47P0mM=', NULL, 0, 'lilith', '', '', 'nhlezgiyctrk@gmail.com', 0, 1, '2017-12-06 15:42:15.961444'),
(26, 'pbkdf2_sha256$36000$pxOU3xXluMQJ$JzHaJHDVA5i1MhXXL9ZbeE/b+yIogbIopGJDEaEjpJY=', NULL, 0, 'yy', '', '', 'yy@yy.com', 0, 1, '2017-12-06 17:05:37.615654'),
(27, 'pbkdf2_sha256$36000$M52g90zAtChc$HiX7F28I+3W+pX5md1oKfB4ThKxy+/d7uIIisMCLS40=', NULL, 0, 'ozmenbrn', '', '', 'ozmenbrn@gmail.com', 0, 1, '2017-12-06 17:10:09.579091'),
(28, 'pbkdf2_sha256$36000$Dt0PybumSOWX$VnlrcilVETVMwzPyV2bNbSeaFHuvX+QKpBGMrpCMMhk=', NULL, 0, 'enescakir', '', '', 'enes@cakir.web.tr', 0, 1, '2017-12-06 19:50:35.001779'),
(29, 'pbkdf2_sha256$36000$ymrq1HEx9eow$2XyHoEEqAnJMlzeqxK7QuIoyJ5rmBqGUdlVGukDIWBg=', NULL, 0, 'abdullatif', '', '', 'abdullatif@koksal.com', 0, 1, '2017-12-06 20:38:45.132036'),
(30, 'pbkdf2_sha256$36000$5JQtcc3w34QU$VAvuJmyphfHOjX0HEa+TYwFZFUhuGlRJbcpfEeyntlw=', NULL, 0, 'aaabbb', '', '', 'aaabbb@ccc.com', 0, 1, '2017-12-07 10:14:49.813113'),
(31, 'pbkdf2_sha256$36000$BrO3SrSsSVjj$QDFqU8OE2Gcl1E6hjuPOXVe0flqzY24Vp1Cl6VM57ho=', NULL, 0, 'halilkalkan', '', '', 'halilkalkan@hotmail.com', 0, 1, '2017-12-07 10:18:03.841139'),
(32, 'pbkdf2_sha256$36000$VKQx8wcqFj95$Ye8lwXWv3Z3RjQ/0j4F47f3SSrKZ00Gb+JFv1V9m9RI=', NULL, 0, 'halilk', '', '', 'halil@hotmail.com', 0, 1, '2017-12-07 10:38:25.019127'),
(33, 'pbkdf2_sha256$36000$oACsJOwXlMJf$XzATCwGwpUMMdHmEGJnmxhNdnA59SUInFbbYprAdtGI=', NULL, 0, 'S', '', '', 'Sp@gmail.com', 0, 1, '2017-12-07 20:11:22.084039'),
(34, 'pbkdf2_sha256$36000$CbAyWNuuKpu5$pR5bUB4xVu6fjXb7P2anyGu23+HPeHiMcKYwWvqS49E=', NULL, 0, 'baklavaEdict', '', '', 'baklavaEdict@gmail.com', 0, 1, '2017-12-08 12:07:57.673851'),
(35, 'pbkdf2_sha256$36000$7v5IPf9BW0zE$9cT9Yn5EX8VpflevNeHGl5hKp+GRVT86OFgCl5Mtv94=', NULL, 0, 'lmn', '', '', 'lmn@gmail.com', 0, 1, '2017-12-25 08:39:18.086716'),
(36, 'pbkdf2_sha256$36000$uovPy9gEGkkw$XQnldHMks6D0A4thAdQA+o3p2Xy/PRhd97XkGy7x0RE=', NULL, 0, 'troll', '', '', 'troll@gmail.com', 0, 1, '2017-12-27 18:57:01.484039'),
(39, 'pbkdf2_sha256$36000$9F9i7fqwGVn8$Y/DtEcZrfMUni4zDfNPXMMw3PkSlyguOe0BKxrQrZyw=', NULL, 0, 'culturage', '', '', 'culturage@gmail.com', 0, 1, '2017-12-31 11:46:58.845688'),
(40, 'pbkdf2_sha256$36000$OvzBzuyOfDBf$cCLs3JyOAZHNTXQ/4YNYtOwxGRDS5VOmsW97cuae7r8=', NULL, 0, 'dummy', '', '', 'dummy@gmail.com', 0, 1, '2018-01-01 10:42:39.867151');

-- --------------------------------------------------------

--
-- Table structure for table `auth_user_groups`
--

CREATE TABLE `auth_user_groups` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

-- --------------------------------------------------------

--
-- Table structure for table `auth_user_user_permissions`
--

CREATE TABLE `auth_user_user_permissions` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

-- --------------------------------------------------------

--
-- Table structure for table `base_annotation`
--

CREATE TABLE `base_annotation` (
  `id` int(11) NOT NULL,
  `text` varchar(500) COLLATE utf8mb4_bin NOT NULL,
  `h` int(11) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `media_id` int(11) DEFAULT NULL,
  `w` int(11) DEFAULT NULL,
  `x` int(11) DEFAULT NULL,
  `y` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

--
-- Dumping data for table `base_annotation`
--

INSERT INTO `base_annotation` (`id`, `text`, `h`, `user_id`, `media_id`, `w`, `x`, `y`) VALUES
(15, 'Animal spirit', 1, 25, 139, 1, 369, 201),
(16, 'Dreamland', 1, 25, 139, 1, 292, 94),
(17, 'Dreamtime', 1, 25, 139, 1, 53, 38),
(19, 'Iron', 1, 28, 150, 1, 340, 60),
(21, 'Well', 1, 28, 154, 1, 319, 307),
(22, 'R2D2', 1, 3, 165, 1, 343, 317),
(23, 'hey', 1, 3, 162, 1, 150, 81),
(24, 'Dead man', 1, 28, 150, 1, 673, 322),
(25, 'Samba costume', 1, 18, 167, 1, 396, 239),
(26, 'Samba dancer', 1, 18, 167, 1, 248, 183),
(30, 'NativeAmerican Chief', 1, 18, 142, 1, 327, 195),
(31, 'bracelets', 1, 18, 176, 1, 308, 44),
(32, 'house', 1, 9, 151, 1, 536, 242),
(33, 'efes', 1, 18, 178, 1, 312, 254),
(34, 'river', 1, 40, 255, 1, 267, 324);

-- --------------------------------------------------------

--
-- Table structure for table `base_comment`
--

CREATE TABLE `base_comment` (
  `id` int(11) NOT NULL,
  `text` varchar(500) COLLATE utf8mb4_bin NOT NULL,
  `rate` int(11) DEFAULT NULL,
  `created_at` datetime(6) NOT NULL,
  `updated_at` datetime(6) DEFAULT NULL,
  `related_item_id` int(11) DEFAULT NULL,
  `written_by_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

--
-- Dumping data for table `base_comment`
--

INSERT INTO `base_comment` (`id`, `text`, `rate`, `created_at`, `updated_at`, `related_item_id`, `written_by_id`) VALUES
(8, 'jhnkn', NULL, '2017-12-05 10:35:37.386229', NULL, 23, 9),
(10, 'such an exotic instrument, i wonder if i could play it. i am not such a musician but i can guess that it should be hard to play', NULL, '2017-12-05 17:58:30.211449', NULL, 29, 22),
(12, 'Here is a link showing a small piece from the movie', NULL, '2017-12-06 15:56:05.727014', NULL, 36, 25),
(13, 'https://www.youtube.com/watch?v=pZvlh9ef_m4', NULL, '2017-12-06 15:57:47.211480', NULL, 36, 25),
(14, 'Some sailors actually believe that mermaids are a kind of or beautiful sisters of Sirens. Their attention is the same nonetheless, which is to draw handsome sailors into the depths of the ocean.', NULL, '2017-12-06 16:09:18.204857', NULL, 28, 25),
(15, 'I love it', NULL, '2017-12-06 16:10:59.155340', NULL, 23, 25),
(17, 'The violin looks astonishingly good. Does anyone know that when this sculpture is made?', NULL, '2017-12-06 20:48:05.493482', NULL, 45, 29),
(18, 'He was one of the best artists in Turkey. Also, he was the greatest advocate of cigarettes. "Fakirin bir cugarasi var": https://www.youtube.com/watch?v=fjtzl4D2OF4', NULL, '2017-12-06 20:53:21.136592', NULL, 47, 29),
(19, 'What a dangerous creature? "The Sirens of Greek mythology began specifically as a group of creatures who looked like beautiful women, but were really man-eating beasts.  They sat on the shore and sang with voices so seductive and compelling that anyone who heard their song became absolutely mesmerized with them.  So mesmerized, in fact, that they became obsessed with reaching the shore to get closer to the sound."', NULL, '2017-12-06 21:43:30.269140', NULL, 28, 29),
(20, 'Is not this group great? I mean I am a fan each one of their songs!', NULL, '2017-12-07 06:43:43.640530', NULL, 55, 23),
(21, 'This man is so special for every Turk! Lots of generations grew up with his songs.', NULL, '2017-12-07 06:45:04.510764', NULL, 40, 23),
(22, 'Sir, though I agree that he is a great artist, you don\'t have any right to promote cigarettes! #yesilayWasHere', NULL, '2017-12-07 06:56:43.791313', NULL, 47, 23),
(23, 'it should take years of practice to be able to dance like that, music  is thrilling too', NULL, '2017-12-07 07:34:00.302993', NULL, 58, 22),
(24, 'it goes amazing with icecream from Maraş, delicious', NULL, '2017-12-07 07:35:15.276656', NULL, 46, 22),
(25, '"An object is coming at us sir"', NULL, '2017-12-07 08:09:18.579058', NULL, 36, 23),
(26, 'Delicious!!!', NULL, '2017-12-07 09:41:48.269541', NULL, 24, 27),
(27, 'Great guy', NULL, '2017-12-07 09:57:37.528012', NULL, 43, 28),
(29, 'Oh my god', NULL, '2017-12-07 10:04:29.334268', NULL, 57, 28),
(32, 'I just added a human faced lion', NULL, '2017-12-07 11:19:15.198746', NULL, 42, 32),
(33, 'Thank you halil', NULL, '2017-12-07 11:21:32.706505', NULL, 42, 27),
(34, 'I wish it was here now and I could eat that...', NULL, '2017-12-08 12:07:37.939804', NULL, 46, 27),
(35, 'baklava is not just a desert, it is history! but also delicious!', NULL, '2017-12-08 12:09:19.854310', NULL, 46, 34),
(36, 'Perfect!', NULL, '2017-12-20 10:28:34.249993', NULL, 46, 28),
(42, 'I was there yesterday! Beautiful place', NULL, '2017-12-28 10:52:36.238245', NULL, 109, 7),
(43, 'I watched the movie yesterday, so sad', NULL, '2017-12-28 11:04:01.533951', NULL, 118, 7),
(44, 'Looks delicious', NULL, '2017-12-28 11:27:20.030152', NULL, 125, 9),
(45, 'Lovely people who have been tortured for centuries', NULL, '2017-12-28 12:29:15.957728', NULL, 131, 25),
(46, 'https://m.youtube.com/watch?v=-stkMRVkCIU', NULL, '2017-12-28 12:32:09.536277', NULL, 133, 27),
(47, 'Oh my god!', NULL, '2017-12-28 12:33:33.463904', NULL, 136, 28),
(48, 'Thanks for sharing this heritage. Nice!', NULL, '2017-12-28 12:35:17.496032', NULL, 139, 27),
(49, 'Wooww. Japanease culture looks great.', NULL, '2017-12-28 12:36:36.910143', NULL, 134, 27),
(51, 'Amazing history they have', NULL, '2017-12-28 12:38:30.030806', NULL, 131, 27),
(53, 'Eiffel?', NULL, '2017-12-28 13:45:32.268087', NULL, 21, 32),
(54, 'Anıtkabir is the mausoleum of Mustafa Kemal Atatürk, the leader of the Turkish War of Independence and the founder and first President of the Republic of Turkey.', NULL, '2017-12-31 11:59:45.667058', NULL, 102, 39),
(55, 'The location is incorrect on the maps', NULL, '2017-12-31 12:01:48.821161', NULL, 195, 18),
(56, 'This item might have some location problems :)', NULL, '2017-12-31 16:19:36.774427', NULL, 205, 32);

-- --------------------------------------------------------

--
-- Table structure for table `base_follow`
--

CREATE TABLE `base_follow` (
  `id` int(11) NOT NULL,
  `followed_id` int(11) DEFAULT NULL,
  `follower_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

-- --------------------------------------------------------

--
-- Table structure for table `base_item`
--

CREATE TABLE `base_item` (
  `id` int(11) NOT NULL,
  `name` varchar(200) COLLATE utf8mb4_bin NOT NULL,
  `created_at` datetime(6) NOT NULL,
  `created_by_id` int(11) DEFAULT NULL,
  `description` longtext COLLATE utf8mb4_bin,
  `rate` double NOT NULL,
  `updated_at` datetime(6) DEFAULT NULL,
  `updated_by_id` int(11) DEFAULT NULL,
  `featured_img` varchar(100) COLLATE utf8mb4_bin DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

--
-- Dumping data for table `base_item`
--

INSERT INTO `base_item` (`id`, `name`, `created_at`, `created_by_id`, `description`, `rate`, `updated_at`, `updated_by_id`, `featured_img`) VALUES
(11, 'The City of Love', '2017-12-03 00:01:57.741942', 3, 'The Eiffel Tower is a wrought iron lattice tower on the Champ de Mars in Paris, France. It is named after the engineer Gustave Eiffel, whose company designed and built the tower.', 2, NULL, 9, 'item/item_Dq7aeNj.jpeg'),
(16, 'Hagia Sophia', '2017-12-03 15:04:28.341410', 9, 'Hagia Sophia (/ˈhɑːɡiə soʊˈfiːə/; from the Greek: Αγία Σοφία, pronounced [aˈʝia soˈfia], "Holy Wisdom"; Latin: Sancta Sophia or Sancta Sapientia; Turkish: Ayasofya) was a Greek Orthodox Christian patriarchal basilica (church), later an imperial mosque, and is now a museum (Ayasofya Müzesi) in Istanbul, Turkey. The Roman Empire\'s first Christian Cathedral, from the date of its construction in 537 AD, and until 1453, it served as an Eastern Orthodox cathedral and seat of the Patriarch of Constantinople, except between 1204 and 1261, when it was converted by the Fourth Crusaders to a Roman Catholic cathedral under the Latin Empire. The building was later converted into an Ottoman mosque from 29 May 1453 until 1931. It was then secularized and opened as a museum on 1 February 1935. Famous in particular for its massive dome, it is considered the epitome of Byzantine architecture and is said to have "changed the history of architecture". It remained the world\'s largest cathedral for nearly a thousand years, until Seville Cathedral was completed in 1520.', 2, NULL, NULL, 'item/item_lJAYL7t.png'),
(20, 'Maiden\'s Tower', '2017-12-04 14:41:11.338217', 9, 'The Maiden\'s Tower (Turkish: Kız Kulesi), also known as Leander\'s Tower (Tower of Leandros) since the medieval Byzantine period, is a tower lying on a small islet located at the southern entrance of the Bosphorus strait 200 m (220 yd) from the coast of Üsküdar in Istanbul, Turkey.\n\nToday, there is a restaurant in the first floor and a café at the top of the tower.\n\nThe tower was depicted on the reverse of the Turkish 10 lira banknotes of 1966–1981.', 3, NULL, NULL, 'item/item_ELQFCgY.png'),
(21, 'Tokyo Tower', '2017-12-04 14:44:23.350571', 9, 'Tokyo Tower (東京タワー Tōkyō tawā) is a communications and observation tower in the Shiba-koen district of Minato, Tokyo, Japan. At 332.9 metres (1,092 ft), it is the second-tallest structure in Japan. The structure is an Eiffel Tower-inspired lattice tower that is painted white and international orange to comply with air safety regulations.\n\nBuilt in 1958, the tower\'s main sources of income are tourism and antenna leasing. Over 150 million people have visited the tower. FootTown, a four-story building directly under the tower, houses museums, restaurants and shops. Departing from there, guests can visit two observation decks. The two-story Main Observatory is at 150 metres (490 ft), while the smaller Special Observatory reaches a height of 249.6 metres (819 ft).', 3, NULL, NULL, 'item/item_a6DdyAC.png'),
(23, 'Turkish Coffee', '2017-12-04 14:55:56.780913', 9, 'Turkish coffee (Turkish: Türk kahvesi) is a method of preparing unfiltered coffee. Turkish coffee is made by boiling the ground coffee beans (and is not made, for example, by filtering or percolation). Its preparation is done by a method that has two characteristic features. First, if sugar is to be added to the coffee, it is done at the start of the boiling, not after. Second, the boiling is done as slowly as possible, without letting the water get to a state beyond that of simmering. When the grounds begin to froth, about one-third of the coffee is distributed to the various individual cups, after which the remaining two-thirds is returned to the fire. After the coffee froths a second time, the process is completed and the remaining coffee is distributed to the individual cups.', 4, NULL, NULL, 'item/item_ilsom0Q.png'),
(24, 'Turkish Delight', '2017-12-04 14:57:41.507143', 9, 'Turkish delight, lokum or rahat lokum and many other transliterations (Ottoman Turkish: رَاحَة الْحُلْقُوم‎ rāḥat al-ḥulqūm, Turkish: Lokum or rahat lokum) is a family of confections based on a gel of starch and sugar. Premium varieties consist largely of chopped dates, pistachios, and hazelnuts or walnuts bound by the gel; traditional varieties are mostly flavored with rosewater, mastic, Bergamot orange, or lemon. The confection is often packaged and eaten in small cubes dusted with icing sugar, copra, or powdered cream of tartar, to prevent clinging. Other common flavors include cinnamon and mint. In the production process, soapwort may be used as an emulsifying additive.\n\nThe origin of the confection is not well established, but it is known to have been produced in Turkey as early as the late 1700s.', 4, NULL, NULL, 'item/item_qKLbDe8.png'),
(28, 'Siren', '2017-12-05 13:24:50.342413', 7, 'In Greek mythology, the Sirens (Greek singular: Σειρήν Seirēn; Greek plural: Σειρῆνες Seirēnes) were dangerous creatures, who lured nearby sailors with their enchanting music and voices to shipwreck on the rocky coast of their island. Roman poets placed them on some small islands called Sirenum scopuli. In some later, rationalized traditions, the literal geography of the "flowery" island of Anthemoessa, or Anthemusa, is fixed: sometimes on Cape Pelorum and at others in the islands known as the Sirenuse, near Paestum, or in Capreae. All such locations were surrounded by cliffs and rocks.', 1, NULL, NULL, 'item/item_d7tLq3S.png'),
(29, 'Qanun', '2017-12-05 13:34:20.342120', 7, 'The kanun, ganoun or kanoon (Arabic: قانون‎, translit. qānūn; Hebrew: קָנוֹן‎, qanon; Persian: قانون‎‎, qānūn; Turkish: kanun; Armenian: քանոն, translit. k’anon; Azerbaijani: qanun; Greek: κανονάκι, translit. kanonaki; Uyghur: قالون‎, ULY: qalon) is a string instrument played either solo, or more often as part of an ensemble, in much of the Middle East, Maghreb, West Africa, Central Asia, and southeastern regions of Europe. The name derives from the Arabic word qanun, meaning "rule, law, norm, principle", which is borrowed from the ancient Greek word and musical instrument κανών (rule), which in Latin was called canon (not to be confused with the European polyphonic musical style and composition technique known by the same name). Traditional and Classical musics executed on the qanun are based on Maqamat or Makamlar. As the historical relative of santur from the same geography, qanun is thought to trace its origins back to Assyria, where an ancestral homologue might have been used in Mesopotamian royal courts and religious ceremonies. The instrument today is a type of large zither with a thin trapezoidal soundboard that is famous for its unique melodramatic sound.', 1, NULL, NULL, 'item/item_PDnvVAW.png'),
(35, 'Pan', '2017-12-06 15:54:20.606245', 18, 'PAN was the god of shepherds and hunters, and of the meadows and forests of the mountain wilds. His unseen presence aroused panic in those who traversed his realm.\n\nPan idled in the rugged countryside of Arkadia (Arcadia), playing his panpipes and chasing Nymphs. One of these, Pitys, fled his advances and was transformed into a mountain-pine, the god\'s sacred tree. Another, Syrinx, escaped but was turned into a clump of reeds from which Pan crafted his pipes. And a third, Ekho (Echo), was cursed to fade away for spurning the god, leaving behind just a voice to repeat his mountain cries.\n\nPan was depicted as a man with the horns, legs and tail of a goat, a thick beard, snub nose and pointed ears. He often appears in scenes of the company of Dionysos.', 1, NULL, NULL, 'item/item_bu2GHFA.jpeg'),
(36, 'G.O.R.A - Benimsin', '2017-12-06 15:54:50.374727', 25, 'Captain Logar, fictional character from a well-know Turkish movie G.O.R.A which presents hilarious escape story of a human, Arif. He is captured by Captain Logar and brought to the planet GORA.', 1, NULL, NULL, 'item/item_bz0ziQ3.jpeg'),
(37, 'Pan Flute', '2017-12-06 16:04:05.850766', 18, 'The pan flutes (also known as panpipes or syrinx) are a group of musical instruments based on the principle of the closed tube, consisting of multiple pipes of gradually increasing length (and occasionally girth). Multiple varieties of panflutes have long been popular as folk instruments. The pipes are typically made from bamboo, giant cane, or local reeds. Other materials include wood, plastic, metal and ivory.\r\n\r\nThe pan flute is named after Pan, the Greek god of nature and shepherds often depicted with such an instrument.', 2, NULL, 7, 'item/item_8MoXUiz.jpeg'),
(38, 'Terpsichore', '2017-12-06 16:05:06.049975', 25, 'In Greek mythology Terpsichore, delight in dancing, was one of the nine Muses and Goddess of dance and chorus. She lends her name to the word "terpsichorean" which means "of or relating to dance".', 3, NULL, NULL, 'item/item_Ua1lquM.jpeg'),
(39, 'Achilles', '2017-12-06 16:46:52.297524', 9, 'In Greek mythology, Achilles was a Greek hero of the Trojan War and the central character and greatest warrior of Homer\'s Iliad. Achilles\' most notable feat during the Trojan War was the slaying of the Trojan hero Hector outside the gates of Troy. Although the death of Achilles is not presented in the Iliad, other sources concur that he was killed near the end of the Trojan War by Paris, who shot him in the heel with an arrow. Later legends state that Achilles was invulnerable in all of his body except for his heel because, when his mother Thetis dipped him in the river Styx as an infant, she held him by one of his heels. Alluding to these legends, the term "Achilles heel" has come to mean a point of weakness, especially in someone or something with an otherwise strong constitution.', 0, NULL, NULL, 'item/item_Knb6OHj.png'),
(40, 'Barış Manço', '2017-12-06 17:00:09.416520', 9, 'Barış Manço was a Turkish rock musician, singer, songwriter, composer, actor, television producer and show host. Beginning his musical career while attending Galatasaray High School, he was a pioneer of rock music in Turkey and one of the founders of the Anatolian rock genre. Manço composed around 200 songs and is among the best-selling and most awarded Turkish artists to date. Many of his songs were translated into a variety of languages including English, French, Japanese, Greek, Italian, Bulgarian, Romanian, Persian, Hebrew, Urdu, Arabic, and German, among others. He remains one of the most popular public figures of Turkey.', 5, NULL, NULL, 'item/item_8IvGAk4.png'),
(41, 'Colosseum', '2017-12-06 17:18:28.387360', 27, 'The Colosseum or Coliseum, also known as the Flavian Amphitheatre, is an oval amphitheatre in the centre of the city of Rome, Italy. Built of travertine, tuff, and brick-faced concrete, it is the largest amphitheatre ever built.', 1, NULL, NULL, 'item/item_ozDlZW8.png'),
(42, 'Egyptian pyramids', '2017-12-06 17:59:25.295911', 27, 'The Egyptian pyramids are ancient pyramid-shaped masonry structures located in Egypt.\nAs of November 2008, sources cite either 118 or 138 as the number of identified Egyptian pyramids.[1][2] Most were built as tombs for the country\'s pharaohs and their consorts during the Old and Middle Kingdom periods.[3][4][5]\nThe earliest known Egyptian pyramids are found at Saqqara, northwest of Memphis. The earliest among these is the Pyramid of Djoser (constructed 2630 BC–2611 BC) which was built during the third dynasty. This pyramid and its surrounding complex were designed by the architect Imhotep, and are generally considered to be the world\'s oldest monumental structures constructed of dressed masonry.[6]\nThe most famous Egyptian pyramids are those found at Giza, on the outskirts of Cairo. Several of the Giza pyramids are counted among the largest structures ever built.[7] The Pyramid of Khufu at Giza is the largest Egyptian pyramid. It is the only one of the Seven Wonders of the Ancient World still in existence.', 3, NULL, NULL, 'item/item_lnoC7dE.jpeg'),
(43, 'Aşık Veysel Şatıroğlu', '2017-12-06 18:04:26.601152', 27, 'Aşık Veysel Şatıroğlu (25 October 1894 – 21 March 1973), commonly known simply as Âşık Veysel, was a Turkish minstrel and highly regarded poet of the Turkish folk literature. He was born in the Sivrialan village of the Şarkışla district, in the province of Sivas. He was an ashik, poet, songwriter, and a bağlama virtuoso, the prominent representative of the Anatolian ashik tradition in the 20th century. He was blind for most of his lifetime. His songs are usually sad tunes, often dealing with the inevitability of death. However, Veysel used a wide range of themes for his lyrics; based on morals, values, and constant questioning on issues such as love, care, beliefs, and how he saw the world as a blind man.', 3, NULL, NULL, 'item/item_uICKkGu.jpeg'),
(45, 'Orpheus', '2017-12-06 19:56:09.919368', 28, 'Orpheus is a legendary Thracian musician, poet, and prophet in ancient Greek religion and myth. The major stories about him are centered on his ability to charm all living things and even stones with his music, his attempt to retrieve his wife, Eurydice, from the underworld, and his death at the hands of those who could not hear his divine music. As an archetype of the inspired singer, Orpheus is one of the most significant figures in the reception of classical mythology in Western culture, portrayed or alluded to in countless forms of art and popular culture including poetry, film, opera, music, and painting.\n\nOrpheus was born as a son of the Muse Kalliope and the Thracian king Oeagrus in a cave between Pimpleia and Leivithra.\n\nFor the Greeks, Orpheus was a founder and prophet of the so-called "Orphic" mysteries. He was credited with the composition of the Orphic Hymns, a collection of which only two have survived. Shrines containing purported relics of Orpheus were regarded as oracles. Some ancient Greek sources note Orpheus\' Thracian origins.', 1, NULL, NULL, 'item/item_ST157OJ.jpeg'),
(46, 'Baklava', '2017-12-06 20:03:13.288473', 28, 'Baklava is a rich, sweet dessert pastry made of layers of filo filled with chopped nuts and sweetened and held together with syrup or honey. It is characteristic of the cuisines of the Levant, the Caucasus, Balkans, Maghreb, and of Central and West Asia.\n\nAlthough the history of baklava is not well documented, its current form was probably developed in the imperial kitchens of the Topkapı Palace in Istanbul. The Sultan presented trays of baklava to the Janissaries every 15th of the month of Ramadan in a ceremonial procession called the Baklava Alayı.\n\nThere are three proposals for the pre-Ottoman roots of baklava: the Roman placenta cake, as developed through Byzantine cuisine, the Central Asian Turkic tradition of layered breads, or the Persian lauzinaq.\n\nThe oldest (2nd century BCE) recipe that resembles a similar dessert is the honey covered baked layered-dough dessert placenta of Roman times, which Patrick Faas identifies as the origin of baklava: "The Greeks and the Turks still argue over which dishes were originally Greek and which Turkish. Baklava, for example, is claimed by both countries. Greek and Turkish cuisine both built upon the cookery of the Byzantine Empire, which was a continuation of the cooking of the Roman Empire. Roman cuisine had borrowed a great deal from the ancient Greeks, but placenta (and hence baklava) had a Latin, not a Greek, origin—please note that the conservative, anti-Greek Cato left us this recipe."', 5, NULL, NULL, 'item/item_XXvhigP.jpeg'),
(47, 'Neşet Ertaş', '2017-12-06 20:06:24.753898', 28, 'Neşet Ertaş (1938 – 25 September 2012) was a Turkish folk music singer, lyricist, modern ashik and virtuoso of the traditional Turkish instrument the bağlama. His profession in Turkish is known as halk ozanı, which literally means "folk bard". Yaşar Kemal gave Ertaş his nickname, "Bozkırın Tezenesi" (literally: "Plectrum of the Steppe"), writing it in a book he gave him as a gift.', 4, NULL, NULL, 'item/item_DOxfnUh.jpeg'),
(54, 'Hypnos', '2017-12-06 21:00:33.787071', 29, 'In Greek mythology, Hypnos (/ˈhɪpnɒs/; Greek: Ὕπνος, "sleep") is the personification of sleep; the Roman equivalent is known as Somnus.\n\nIn the Greek mythology, Hypnos is the son of Nyx ("The Night") and Erebus ("The Darkness"). His brother is Thanatos ("Death"). Both siblings live in the underworld (Hades) or in Erebus, another valley of the Greek underworld. According to rumors, Hypnos lives in a big cave, which the river Lethe ("Forgetfulness") comes from and where night and day meet. His bed is made of ebony, on the entrance of the cave grow a number of poppies and other hypnotic plants. No light and no sound would ever enter his grotto. According to Homer, he lives on the island Lemnos, which later on has been claimed to be his very own dream-island. His children Morpheus ("Shape"), Phobetor ("Fear") and Phantasos ("Imagination, Phantasy") are the gods of the dream. It is claimed that he has many more children, which are also Oneiroi. He is said to be a calm and gentle god, as he helps humans in need and, due to their sleep, owns half of their lives.', 2, NULL, NULL, 'item/item_Qa3SNi5.jpeg'),
(55, 'Duman', '2017-12-06 21:13:22.933606', 29, 'Duman (English: Smoke) is a Turkish rock band. Founded in 1999, the band features Kaan Tangöze on vocals and guitar, Ari Barokas on bass guitar and backing vocals, Batuhan Mutlugil on lead guitar and backing vocals and Cengiz Baysal on drums. However, Duman announced that in november 2016, Cengiz Baysal left the group. Accordingly, they explained that, their new drummer is Mehmet Demirdelen.[1] The band musically combines elements of traditional Turkish folk music with modern rock and grunge.\n\nThey composed a song titled "Eyvallah" following May 2013 Taksim Gezi Park protests which they published on YouTube. Duman - Eyvallah\n\nAlbums\n\nEski Köprünün Altında (1999)\nBelki Alışman Lazım (2002)\nKonser (2003)\nBu Akşam Konser DVD (2004)\nSeni Kendime Sakladım (2005)\nEn Güzel Günüm Gecem 1999-2006 (2007)\nRock\'N Coke Konseri (2008)\nDuman I & II (2009)\nCanlı (2011)\nDarmaduman (2013)\nClips\nKöprüaltı (1999) - Eski Köprünün Altında\nHayatı Yaşa (1999) - Eski Köprünün Altında\nBebek (2000) - Eski Köprünün Altında\nHer Şeyi Yak (2002) - Belki Alışman Lazım\nOje (2002) - Belki Alışman Lazım\nBu Akşam (2003) - Belki Alışman Lazım\nÇile Bülbülüm [Konser] (2003) - Konser\nOlmadı Yar [Konser] (2003) - Konser\nBelki Alışman Lazım (2003) - Belki Alışman Lazım\nSeni Kendime Sakladım (2005) - Seni Kendime Sakladım\nAman Aman (2006) - Seni Kendime Sakladım\nKaranlıkta (2006) - Yakup & Kaan & Batuhan - Karanlıkta\nEn Güzel Günüm Gecem (2006) - Seni Kendime Sakladım\nDibine Kadar (2009) - Duman I\nSenden Daha Güzel (2009) - Duman II\nElleri Ellerime (2010) - Duman II\nSor Bana Pişman Mıyım (2011) - Duman I\nHelal Olsun (2011) - Canlı\nİyi De Bana Ne (Akustik) (2012) - Canlı\nYürek (2013) - Darmaduman\nMelankoli (2014) - Darmaduman\nÖyle Dertli (2015) - Darmaduman\n\nDuet Albums\nİstanbul Hatırası: Köprüyü Geçmek (albüm) (2005) - Doublemoon\nYakup & Kaan & Batuhan - Karanlıkta (2006) - EMI\nSınav Soundtrack (2006) - Sony BMG\nBulutsuzluk Özlemi 20 Yaşında (2007) - DMC\nİstanbul Sensin (2010) - Sony BMG\nOrhan Gencebay ile Bir Ömür (2012) - Poll Production', 6, NULL, NULL, 'item/item_k1ljSQ9.jpeg'),
(57, 'Zeus', '2017-12-07 06:41:45.721215', 23, 'Zeus (/ˈzjuːs/; Greek: Ζεύς Zeús [zdeǔ̯s]) is the sky and thunder god in ancient Greek religion, who ruled as king of the gods of Mount Olympus. His name is cognate with the first element of his Roman equivalent Jupiter.', 2, NULL, NULL, 'item/item_Fd9Lw4V.png'),
(58, 'Horon (dance)', '2017-12-07 06:51:40.211806', 23, 'Horon (Greek)[1] or khoron (Turkish: horon), which is related to Modern Greek χορός (chorós), refers to a group of a circle folk dances from the Black Sea region of Turkey.\n\nHoron or \'χορός\'(dance) is a traditional dance of Pontic Greeks and it is originated in Pontus, which is located in the north region of today\'s Turkey at the Black Sea coast.\n\nMany Pontian dances are almost identical in steps to Greek dances. Pontian dances also resemble Persian and Middle Eastern dances in that they are not led, with no single leader in the dance formation. This is different from Greek dances but is a widespread aspect of Persian and Middle Eastern dances. A unique aspect of Pontian dance is the tremoulo, which is a fast shaking of the upper torso by a turning of the back on its axis.\n\nThe rapid shoulder and upper body movements from the waist might have evolved only in modern times, during the Ottoman reign, as some people seem to believe.[citation needed] These movements are said to have derived from the shimmying of the little silver anchovy fish (Turkish hamsi) found in mass abundance in the Black Sea, which has worked its way into an inseparable part of northern Anatolian culture', 3, NULL, NULL, 'item/item_uFnXlYm.jpeg'),
(59, 'Egyptian hieroglyphs', '2017-12-07 10:13:15.747043', 29, 'Egyptian hieroglyphs (/ˈhaɪərəˌɡlɪf, -roʊ-/[2][3]) were the formal writing system used in Ancient Egypt. It combined logographic, syllabic and alphabetic elements, with a total of some 1,000 distinct characters.[4][5] Cursive hieroglyphs were used for religious literature on papyrus and wood. The later hieratic and demotic Egyptian scripts are derived from hieroglyphic writing; Meroitic was a late derivation from demotic.\n\nUse of hieroglyphic writing arises from proto-literate symbol systems in the Early Bronze Age, around the 32nd century BC (Naqada III),[1] with the first decipherable sentence written in the Egyptian language dating to the Second Dynasty (28th century BC). Egyptian hieroglyphs developed into a mature writing system used for monumental inscription in the classical language of the Middle Kingdom period; during this period, the system made use of about 900 distinct signs. The writing system continued to be used throughout the Late Period, as well as the Persian and Ptolemaic periods. Late survivals of hieroglyphic use are found well into the Roman period, extending into the 4th century AD.\n\nWith the final closing of pagan temples in the 5th century, knowledge of hieroglyphic writing was lost, and the script remained undeciphered throughout the medieval and early modern period. The decipherment of hieroglyphs would only be solved in the 1820s by Jean-François Champollion, with the help of the Rosetta Stone.', 4, NULL, NULL, 'item/item_OCq0lOi.jpeg'),
(102, 'Anıtkabir', '2017-12-27 21:50:41.332332', 9, 'Anıtkabir is the mausoleum of Mustafa Kemal Atatürk, the leader of the Turkish War of Independence and the founder and first President of the Republic of Turkey. It is located in Ankara and was designed by architects Professor Emin Onat and Assistant Professor Ahmet Orhan Arda, whose proposal beat 48 other entries from several countries in a competition held by the Turkish Government in 1941 for a "monumental tomb" for Atatürk.\nThe site is also the final resting place of İsmet İnönü, the second President of Turkey, who was interred there after he died in 1973. His tomb faces the Atatürk Mausoleum, on the opposite side of the Ceremonial Ground.', 4, NULL, NULL, 'item/item_BWTk7V7.png'),
(107, 'Galata Tower', '2017-12-28 09:38:24.761872', 9, 'The Galata Tower called Christea Turris (the Tower of Christ in Latin) by the Genoese — is a medieval stone tower in the Galata/Karaköy quarter of Istanbul, Turkey, just to the north of the Golden Horn\'s junction with the Bosphorus. One of the city\'s most striking landmarks, it is a high, cone-capped cylinder that dominates the skyline and offers a panoramic vista of Istanbul\'s historic peninsula and its environs.', 1, NULL, NULL, 'item/item_PFs7ihC.png'),
(108, 'Alexander the Great', '2017-12-28 09:40:18.291985', 18, 'Alexander III of Macedon (20/21 July 356 BC – 10/11 June 323 BC), commonly known as Alexander the Great (Greek: Ἀλέξανδρος ὁ Μέγας, Aléxandros ho Mégas Koine Greek: [a.lék.san.dros ho mé.gas]), was a king (basileus) of the ancient Greek kingdom of Macedon[a] and a member of the Argead dynasty. He was born in Pella in 356 BC and succeeded his father Philip II to the throne at the age of twenty. He spent most of his ruling years on an unprecedented military campaign through Asia and northeast Africa, and he created one of the largest empires of the ancient world by the age of thirty, stretching from Greece to northwestern India. He was undefeated in battle and is widely considered one of history\'s most successful military commanders.', 0, NULL, NULL, 'item/item_NE3JDQx.jpeg'),
(109, 'Ortaköy Mosque', '2017-12-28 09:42:20.780551', 9, 'Ortaköy Mosque,  in Beşiktaş, Istanbul, Turkey, is situated at the waterside of the Ortaköy pier square, one of the most popular locations on the Bosphorus. On this site, a masjid commissioned by the son-in-law of Vizier Ibrahim Pasha used to stand. Built in 1721, it was ruined during the Patrona Halil Uprising. The current mosque, which was erected in its place, was ordered by the Ottoman sultan Abdülmecid and built between 1854 and 1856, on the ruins of the Cantemir Palace. Its architects were Armenian father and son Garabet Amira Balyan and Nigoğayos Balyan (who also designed the nearby Dolmabahçe Palace and the Dolmabahçe Mosque), who designed it in the Neo-Baroque style.', 1, NULL, NULL, 'item/item_yr0eygw.png'),
(110, 'Turkish Tea', '2017-12-28 09:44:33.419709', 9, 'Turkish tea is typically prepared using two stacked kettles called "çaydanlık" specially designed for tea preparation. Water is brought to a boil in the larger lower kettle and then some of the water is used to fill the smaller kettle on top and steep (infuse) several spoons of loose tea leaves, producing a very strong tea. When served, the remaining water is used to dilute the tea on an individual basis, giving each consumer the choice between strong (Turkish: koyu; literally "dark", tavşan kanı (literally: rabbit\'s blood) – a deep brownish red or weak (Turkish: açık; literally "light"). Tea is drunk from small glasses to enjoy it hot in addition to showing its colour, with cubes of beet sugar and without milk.', 0, NULL, NULL, 'item/item_Qi71PeU.png'),
(111, 'Spoonmaker\'s Diamond', '2017-12-28 09:48:00.395777', 9, 'The Spoonmaker\'s Diamond is a 86 carats (17.2 g) pear-shaped diamond in the Imperial Treasury exhibitions at the Topkapi Palace Museum and its most valuable single exhibit. It is considered the fourth largest diamond of its kind in the world.\n\nSet in silver, surrounded by a double row of 49 Old-mine cut diamonds (brilliants), it hangs in a glass case on the wall of the third room in Imperial Treasury section of Topkapı\'s "Conqueror’s Pavilion".\n\nThese surrounding separate brilliants give it "the appearance of a full moon lighting a bright and shining sky amidst the stars" and are considered to have been commissioned either by Ali Pasha or by Sultan Mahmud II – though this, as all other details of the diamond\'s origins, is doubtful and disputed.', 1, NULL, NULL, 'item/item_y9o2TD5.png'),
(112, 'Teacher\'s Day in Turkey', '2017-12-28 09:52:40.867154', 9, 'Teachers\' Day is a special day for the appreciation of teachers, and may include celebrations to honor them for their special contributions in a particular field area, or the community in general.\nMustafa Kemal Atatürk stated that "The new generation will be created by teachers" and as founding President adopted a new alphabet for the newly founded Turkish Republic in 1923. On November 24, 1928 Mustafa Kemal officially accepted the title of head teacher of the nation\'s schools, granted by the cabinet of ministers. It has been celebrated since 1981 (after the 1980 Coup d\'État) as The Teachers’ Day', 1, NULL, NULL, 'item/item_KVbkWQg.png'),
(114, 'Bağlama', '2017-12-28 09:59:44.471602', 9, 'The bağlama is a stringed musical instrument.\nIt is sometimes referred to as the saz, it is also sometimes referred to as the "cura", although the term "saz" actually refers to a family of plucked string instruments, long-necked lutes used in Ottoman classical music, Turkish folk music, Iranian music, Azeri music, Kurdish music, Assyrian music, Armenian music, and in parts of Syria, Iraq and the Balkan countries. Instruments resembling today\'s bağlama have been found in archaeological excavations of Sumerian and Hittite mounds in Anatolia dating before Common Era, and in ancient Greek works.\nAccording to The New Grove Dictionary of Music and Musicians, "the terms \'bağlama\' and \'saz\' are used somewhat interchangeably in Turkey." Like the Western lute and the Middle-Eastern oud, it has a deep round back, but a much longer neck. It can be played with a plectrum or with a fingerpicking style known as şelpe.', 0, NULL, NULL, 'item/item_Yrx6EXJ.png'),
(116, 'Doner kebab', '2017-12-28 10:03:19.752905', 9, 'Döner kebab is a Turkish kebab, made of meat cooked on a vertical rotisserie. Seasoned meat stacked in the shape of an inverted cone is turned slowly on the rotisserie, next to a vertical cooking element. The outer layer is sliced vertically into thin shavings as it cooks. Originally invented in the 19th century Ottoman Empire, it inspired similar dishes such as the Arab shawarma, Greek gyros, and Mexican al pastor.\nThe sliced meat of a döner kebab may be served on a plate with various accompaniments, stuffed into a pita or other type of bread as a sandwich, or wrapped in a thin flatbread such as lavash or yufka, known as a dürüm. Since the early 1970s, the sandwich or wrap form has become popular around the world as a fast food dish sold by kebab shops, and is often called simply a "kebab". The sandwich generally contains salad or vegetables, which may include tomato, lettuce, cabbage, onion with sumac, fresh or pickled cucumber, or chili, and various types of sauces.', 1, NULL, NULL, 'item/item_6m1hTej.png'),
(117, 'Yıldız Palace', '2017-12-28 10:07:31.927765', 9, 'Yıldız Palace is a vast complex of former imperial Ottoman pavilions and villas in Istanbul, Turkey, built in the 19th and early 20th centuries. It was used as a residence by the Sultan and his court in the late 19th century.\nYıldız Palace, meaning "Star Palace", was built in 1880 and was used by the Ottoman Empire Ottoman Sultan Abdülhamid II. The area of the palace was originally made of natural woodlands and became an imperial estate during the reign of Sultan Ahmed I (1603-1617). Various sultans after Ahmed I enjoyed vacationing on these lands and Sultans Abdülmecid I and Abdülaziz built mansions here.\nIn the late 19th century, Sultan Abdülhamid II left Dolmabahçe Palace Dolmabahçe because he feared a seaside attack on the palace, which is located at the shore of the Bosporus strait. He expanded the Yıldız Palace and ordered the renowned Italian architect Raimondo D\'Aronco to build new buildings to the palace complex. When he moved there, the palace became the fourth seat of Ottoman government (the previous ones were the Eski Saray Old Palace in Edirne, and the Topkapı Palace Topkapı and Dolmabahçe Palace Dolmabahçe Palaces in Istanbul.', 0, NULL, NULL, 'item/item_i6xm7tT.png'),
(118, 'Titanic', '2017-12-28 10:18:33.039429', 9, 'RMS Titanic was a British passenger liner that sank in the North Atlantic Ocean in the early morning hours of 15 April 1912, after it collided with an iceberg during its maiden voyage from Southampton to New York City. There were an estimated 2,224 passengers and crew aboard the ship, and more than 1,500 died, making it one of the deadliest commercial peacetime maritime disasters in modern history. The RMS Titanic was the largest ship afloat at the time it entered service and was the second of three Olympic-class ocean liners operated by the White Star Line. The Titanic was built by the Harland and Wolff shipyard in Belfast. Thomas Andrews, her architect, died in the disaster.', 2, NULL, NULL, 'item/item_I5sMdTb.png'),
(120, 'Mona Lisa', '2017-12-28 10:24:26.912859', 9, 'The Mona Lisa is a half-length portrait painting by the Italian Renaissance artist Leonardo da Vinci that has been described as "the best known, the most visited, the most written about, the most sung about, the most parodied work of art in the world". The Mona Lisa is also one of the most valuable paintings in the world. It holds the Guinness World Record for the highest known insurance valuation in history at $100 million in 1962, which is worth nearly $800 million in 2017.\nThe painting is thought to be a portrait of Lisa Gherardini, the wife of Francesco del Giocondo, and is in oil on a white Lombardy poplar panel. It had been believed to have been painted between 1503 and 1506; however, Leonardo may have continued working on it as late as 1517. Recent academic work suggests that it would not have been started before 1513. It was acquired by King Francis I of France and is now the property of the French Republic, on permanent display at the Louvre Museum in Paris since 1797.', 3, NULL, NULL, 'item/item_gS7E43s.png'),
(122, 'Green Mosque', '2017-12-28 10:33:34.959289', 7, 'One of the earliest examples of Ottoman architecture, the Yeşil Mosque was constructed by order of the Grand Vizier Çandarlı Kara Halil Hayreddin Pasha of Sultan Murad I in Iznik. It was later completed by his son Ali Pasha. The inscription on the mosque gives the date of construction as AH 780-794 (1378-1391), and the name of the architect as Haci bin Musa. The Yeşil Mosque is located near the Lefke Gate on the eastern edge of the city. It is composed of a three-bay portico and a single prayer hall covered with a single dome measuring 10.5 m (34 ft) in diameter. The height of the dome is 17.5 m (57 ft) above the floor, it has four windows and the lower portion of the interior walls are coated with gray marble panels. The mosque has a single minaret in the northwestern corner of the building which is decorated with composed glazed terra-cotta green, yellow, turqouise and dark purple coloured tiles. The colourful tiles minaret gives the mosque its name: Yeşil (green in Turkish).', 0, NULL, NULL, 'item/item_SjJWjRM.png'),
(123, 'Latin', '2017-12-28 10:38:51.329493', 7, 'The Latin alphabet or the Roman alphabet is a writing system originally used by the ancient Romans to write the Latin language. By way of its use throughout Europe in English, French, and Germanic variants, Romanized writing has grown to become the preferred alphabet globally (see Latin script), being used officially in China (separate from its ideographic writing), and being semi-adopted by Slavic (Russia) and Baltic states. The Latin alphabet evolved from the visually similar Cumaean Greek version of the Greek alphabet, which was itself descended from the Phoenician abjad, which in turn was derived from Egyptian hieroglyphics. The Etruscans who ruled early Rome adopted the Cumaean Greek alphabet which was modified over time to become the Etruscan alphabet, which was in turn adopted and further modified by the Romans to produce the Latin alphabet.', 0, NULL, NULL, 'item/item_U5YLtnE.png'),
(124, 'Pamukkale', '2017-12-28 10:41:26.217508', 3, 'Pamukkale, meaning "cotton castle" in Turkish, is a natural site in Denizli Province in southwestern Turkey. The area is famous for its hot springs and enormous white terraces of travertine, a carbonate mineral left by the flowing water.[1] It is located in Turkey\'s Inner Aegean region, in the River Menderes valley, which has a temperate climate for most of the year.\r\n\r\n\r\nTravertine terrace formations at Pamukkale, Turkey. May 21, 2011\r\nThe ancient Greco-Roman city of Hierapolis was built on top of the white "castle" which is in total about 2,700 metres (8,860 ft) long, 600 m (1,970 ft) wide and 160 m (525 ft) high. It can be seen from the hills on the opposite side of the valley in the town of Denizli, 20 km away.\r\n\r\nKnown as Pamukkale (Cotton Castle) or ancient Hierapolis (Holy City), this area has been drawing the weary to its thermal springs since the time of Classical antiquity.[1] The Turkish name refers to the surface of the shimmering, snow-white limestone, shaped over millennia by calcium-rich springs. Dripping slowly down the vast mountainside, mineral-rich waters foam and collect in terraces, spilling over cascades of stalactites into milky pools below. Legend has it that the formations are solidified cotton (the area’s principal crop) that giants left out to dry.[citation needed]\r\n\r\nTourism is and has been a major industry in the area for thousands of years, due to the attraction of the thermal pools.[1] As recently as the mid-20th century, hotels were built over the ruins of Hierapolis, causing considerable damage.[citation needed] An approach road was built from the valley over the terraces, and motor bikes were allowed to go up and down the slopes. When the area was declared a World Heritage Site, the hotels were demolished and the road removed and replaced with artificial pools.[citation needed]\r\n\r\nOvershadowed by natural wonder, Pamukkale’s well-preserved Roman ruins and museum have been remarkably underestimated and unadvertised; tourist brochures over the past 20 years have mainly featured photos of people bathing in the calcium pools. Aside from a small footpath running up the mountain face, the terraces are all currently off-limits, having suffered erosion and water pollution at the feet of tourists.', 3, NULL, 3, 'item/item_GzVQN5O.jpeg'),
(125, 'Adana Kebab', '2017-12-28 10:42:17.107531', 27, 'Adana kebabı (colloquially known as Kıyma kebabı) is a long, hand-minced meat kebab mounted on a wide iron skewer and grilled on an open mangal filled with burning charcoal. The culinary item is named after Adana, the fifth largest city of Turkey and was originally known as the "Kıyma kebabı" (lit: minced meat kebab) or Kıyma in Adana-Mersin and the southeastern provinces of Turkey.', 0, NULL, NULL, 'item/item_5ZMO194.png'),
(126, 'Fez', '2017-12-28 10:45:25.452912', 7, 'The fez, named after the Moroccan city Fez and former capital of the Kingdom of Morocco until 1927, as well as its equivalent, the tarboosh , is a felt headdress of two types: either in the shape of a close-fitting skull cap, or a short cylindrical peakless hat made of kilim fabric, both usually red, and sometimes with a tassel attached to the top. The tarboosh and the modern fez, which is similar, owe much of their development and popularity to the Ottoman era.\n\nThe fez is a part of the traditional clothing of Cyprus, and is still worn by some Cypriots today. Traditionally, women wore a red fez over their heads, instead of a headscarf, while men wore a black or red cap.The fez was sometimes worn by men with material (similar to a wrapped keffiyeh or turban) around the base. In his 1811 journey to Cyprus, John Pinkerton describes the fez, "a red cap turned up with fur", as "the proper Greek dress". In the Karpass Peninsula, white caps are worn, a style considered to be based on ancient Cypriot Hellenic-Phoenician attire, thus preserving men\'s head-wear from 2,700 years earlier.', 0, NULL, NULL, 'item/item_9CmvrnI.png'),
(127, 'The Tortoise Trainer', '2017-12-28 10:50:04.164041', 7, 'The Tortoise Trainer is a painting by Osman Hamdi Bey which was crafted in 1906 and 1907 (two versions). In 2004 it was sold for $3.5M and is currently displayed at the Pera Museum in Istanbul.\nIn the Tortoise Trainer, Osman Hamdi Bey satirises the slow and ineffective attempts at reforming the Ottoman Empire, through the attempts of an anachronistic historical character to train tortoises. The painting depicts an elderly man in traditional Ottoman religious costume which predates the introduction of the fez and the spread of Western style dress with the Tanzimat reforms in the mid 19th century. He holds a traditional ney flute with which he is attempting to "train" the tortoises at his feet.', 1, NULL, NULL, 'item/item_PS4to4Z.png'),
(128, 'Aztec', '2017-12-28 10:56:43.363678', 27, 'Aztec culture (/ˈæztɛk/[1]), also known as Mexica culture, was a Mesoamerican culture that flourished in central Mexico in the post-classic period from 1300 to 1521, during the time in which a triple alliance of the Mexica, Texcoca and Tepaneca tribes established the Aztec empire. The Aztec people were certain ethnic groups of central Mexico, particularly those groups who spoke the Nahuatl language and who dominated large parts of Mesoamerica from the 14th to the 16th centuries. The Aztec have also referred to themselves as the Meshika or Mehika.', 0, NULL, NULL, 'item/item_WvgURMU.png'),
(130, 'İzmir Clock Tower', '2017-12-28 10:59:51.912733', 7, 'Izmir Clock Tower is a historic clock tower located at the Konak Square in the Konak district of İzmir, Turkey. The clock tower was designed by the Levantine French architect Raymond Charles Père and built in 1901 to commemorate the 25th anniversary of Abdülhamid II\'s accession to the throne (reigned 1876–1909). The clock itself was a gift from German Emperor Wilhelm II (reigned 1888–1918). It is decorated in an elaborate Ottoman architecture style. The tower, which has an iron and lead skeleton, is 25 m (82 ft) high and features four fountains (şadırvan), which are placed around the base in a circular pattern. The columns are inspired by Moorish themes. The clock tower was depicted on the reverse of the Turkish 500 lira banknotes of 1983-1989.', 3, NULL, NULL, 'item/item_JCHen0C.png'),
(131, 'Indigenous Australians - Aborigines', '2017-12-28 11:05:44.197369', 25, 'Aboriginal and Torres Strait Islander cultures are complex and diverse. The Indigenous cultures of Australia are the oldest living cultural history in the world – they go back at least 50,000 years and some argue closer to 65,000 years. One of the reasons Aboriginal cultures have survived for so long is their ability to adapt and change over time. It was this affinity with their surroundings that goes a long way to explaining how Aboriginal people survived for so many millennia.\n\nCultural heritage is seen as \'the total ways of living built up by a group of human beings, which is passed from one generation to the next\', given to them by reason of their birth.\n\nIn Australia, Indigenous communities keep their cultural heritage alive by passing their knowledge, arts, rituals and performances from one generation to another, speaking and teaching languages, protecting cultural materials, sacred and significant sites, and objects', 5, NULL, NULL, 'item/item_PxiGLSI.jpeg'),
(132, 'Hades', '2017-12-28 11:14:50.247760', 27, 'Hades (/ˈheɪdiːz/; Greek: ᾍδης Háidēs) was the ancient Greek chthonic god of the underworld, which eventually took his name.In Greek mythology, Hades was regarded as the oldest son of Cronus and Rhea, although the last son regurgitated by his father.[2] He and his brothers Zeus and Poseidon defeated their father\'s generation of gods, the Titans, and claimed rulership over the cosmos. Hades received the underworld, Zeus the sky, and Poseidon the sea, with the solid earth—long the province of Gaia—available to all three concurrently. Hades was often portrayed with his three-headed guard dog Cerberus.\n\nThe Etruscan god Aita and Roman gods Dis Pater and Orcus were eventually taken as equivalent to the Greek Hades and merged as Pluto, a Latinization of his euphemistic Greek name Plouton.', 2, NULL, NULL, 'item/item_Le8gNrf.png'),
(133, 'Native Americans', '2017-12-28 11:17:01.539566', 23, 'Native Americans, also known as American Indians, Indians, Indigenous Americans and other terms, are the indigenous peoples of the United States. There are over 500 federally recognized tribes within the U.S., about half of which are associated with Indian reservations. The term excludes Native Hawaiians and some Alaska Natives.\n\nThe ancestors of modern Native Americans arrived in what is now the United States at least 15,000 years ago, possibly much longer, from Asia through Beringia. A vast variety of peoples, societies and cultures subsequently developed. Native Americans were greatly affected by the European colonization of the Americas, which began in 1492, and their population declined precipitously due to introduced diseases, warfare, and slavery. After the founding of the United States, many Native American peoples were subjected to warfare, removals, and one-sided treaties, and they continued to suffer from discriminatory government policies into the 20th century. Since the 1960s, Native American self-determination movements have resulted in many changes to the lives of Native Americans, though there are still many contemporary issues faced by Native Americans. Today, there are over five million Native Americans in the United States.', 2, NULL, NULL, 'item/item_GLjNon0.jpeg'),
(134, 'Kimono', '2017-12-28 11:20:51.136118', 7, 'The kimono is a traditional Japanese garment. The word "kimono", which actually means a "thing to wear" (ki "wear" and mono "thing"), has come to denote these full-length robes. The standard plural of the word kimono in English is kimonos, but the unmarked Japanese plural kimono is also used. The kimono is always worn for important festivals or formal occasions. It is a formal style of clothing associated with politeness and good manners.\n\nKimono have T-shaped, straight-lined robes worn so that the hem falls to the ankle, with attached collars and long, wide sleeves. Kimono are wrapped around the body, always with the left side over the right (except when dressing the dead for burial) and are secured by a sash called an obi, which is tied at the back. Kimono are generally worn with traditional footwear (especially zōri or geta) and split-toe socks (tabi).\n\nToday, kimono are most often worn by women, particularly on special occasions. Traditionally, unmarried women wore a style of kimono called furisode,[5] with almost floor-length sleeves, on special occasions. A few older women and even fewer men still wear the kimono on a daily basis. Men wear the kimono most often at weddings, tea ceremonies, and other very special or very formal occasions. Professional sumo wrestlers are often seen in the kimono because they are required to wear traditional Japanese dress whenever appearing in public.', 1, NULL, NULL, 'item/item_WhtyqOA.png'),
(135, 'Ra', '2017-12-28 11:54:24.997797', 27, 'In later Egyptian dynastic times, Ra was merged with the god Horus, as Ra-Horakhty ("Ra, who is Horus of the Two Horizons"). He was believed to rule in all parts of the created world: the sky, the earth, and the underworld.[3] He was associated with the falcon or hawk. When in the New Kingdom the god Amun rose to prominence he was fused with Ra as Amun-Ra. During the Amarna Period, Akhenaten suppressed the cult of Ra in favor of another solar deity, the Aten, the deified solar disc, but after the death of Akhenaten the cult of Ra was restored.\n\nThe cult of the Mnevis bull, an embodiment of Ra, had its center in Heliopolis and there was a formal burial ground for the sacrificed bulls north of the city.\n\nAll forms of life were believed to have been created by Ra, who called each of them into existence by speaking their secret names. Alternatively man was created from Ra\'s tears and sweat, hence the Egyptians call themselves the "Cattle of Ra." In the myth of the Celestial Cow it is recounted how mankind plotted against Ra and how he sent his eye as the goddess Sekhmet to punish them. When she became bloodthirsty she was pacified by drinking beer mixed with red dye.', 1, NULL, NULL, 'item/item_BtAKrd0.png'),
(136, 'Thor', '2017-12-28 12:05:12.321955', 27, 'In Norse mythology, Thor (/θɔːr/; from Old Norse Þórr) is the hammer-wielding Æsir god of thunder and lightning, associated with storms, oak trees, strength, the protection of mankind and of the fortress of Asgard, as well as hallowing and fertility. The son of Odin All-Father and Jörð (the personification of Earth), he is physically the strongest of the Æsir. The cognate deity in wider Germanic mythologyand paganism was known in Old English as Þunor (Thunor) and in Old High German as Donar (runic þonar ᚦᛟᚾᚨᚱ), stemming from a Common Germanic *Þunraz, meaning "thunder".', 1, NULL, NULL, 'item/item_HdkwvfU.png'),
(137, 'Safranbolu', '2017-12-28 12:26:25.297133', 9, 'Safranbolu is a town and district of Karabük Province in the Black Sea region of Turkey. It is about 9 km north of the city of Karabük, 200 kilometres (120 mi) north of Ankara and about 100 km south of the Black Sea coast. The town\'s historic names in Greek were Theodoroupolis (Θεοδωρούπολις, i.e. city of Theodorus or female Theodora) and later Saframpolis (Σαφράμπολις). Its former names in Turkish were Zalifre and Taraklıborlu. It was part of Kastamonu Province until 1923 and Zonguldak Province between 1923 and 1995. According to the 2000 census, the population of the district was 47,257, of which 31,697 lived in the town of Safranbolu. The district covers an area of 1,000 km2 (386 sq mi), and the town lies at an elevation of 485 m (1,591 ft). The Old Town preserves many historic buildings, with 1008 registered historical artifacts. These are: 1 private museum, 25 mosques, 5 tombs, 8 historical fountains, 5 Turkish baths, 3 caravanserais, 1 historical clock tower, 1 sundial and hundreds of houses and mansions. Also, there are mounds of ancient settlements, rock tombs and historical bridges. The Old Town is situated in a deep ravine in a fairly dry area in the rain shadow of the mountains. The New Town can be found on the plateau about two kilometers west of the Old Town. The name of the town derives from "saffron" and the Greek word polis (πόλις) meaning "city",[5][6] since Safranbolu was a trading place and a center for growing saffron.[5][6] Today, saffron is still grown at the village of Davutobası to the east of Safranbolu, with a road distance of 22 kilometres.', 1, NULL, NULL, 'item/item_eEvZmxu.png');
INSERT INTO `base_item` (`id`, `name`, `created_at`, `created_by_id`, `description`, `rate`, `updated_at`, `updated_by_id`, `featured_img`) VALUES
(138, 'Medusa', '2017-12-28 12:28:37.011133', 27, 'In Greek mythology, Medusa (/məˈdjuːzə, məˈdʒuː-, -sə/, US: /məˈduː-/; Μέδουσα "guardian, protectress")[1] was a monster, a Gorgon, generally described as a winged human female with living venomous snakes in place of hair. Gazers upon her face would turn to stone. Most sources describe her as the daughter of Phorcys and Ceto,[2] though the author Hyginus makes her the daughter of Gorgon and Ceto.[3] According to Hesiod and Aeschylus, she lived and died on an island named Sarpedon, somewhere near Cisthene. The 2nd-century BCE novelist Dionysios Skytobrachion puts her somewhere in Libya, where Herodotus had said the Berbersoriginated her myth, as part of their religion.', 1, NULL, NULL, 'item/item_aycnae8.png'),
(139, 'Archaeological Site of Troy', '2017-12-28 12:28:59.536205', 9, 'Troy was a city situated in the far northwest of the region known in late Classical antiquity as Asia Minor, now known as Anatolia in modern Turkey, near (just south of) the southwest mouth of the Dardanelles strait and northwest of Mount Ida. The present-day location is known as Hisarlik. It was the setting of the Trojan War described in the Greek Epic Cycle, in particular in the Iliad, one of the two epic poems attributed to Homer. Metrical evidence from the Iliad and the Odyssey suggests that the name Ἴλιον (Ilion) formerly began with a digamma: Ϝίλιον (Wilion); this is also supported by the Hittite name for what is thought to be the same city, Wilusa. A new capital called Ilium (from Greek Ilion) was founded on the site in the reign of the Roman Emperor Augustus. It flourished until the establishment of Constantinople, became a bishopric and declined gradually in the Byzantine era, but is now a Latin Catholic titular see. In 1865, English archaeologist Frank Calvert excavated trial trenches in a field he had bought from a local farmer at Hisarlik, and in 1868, Heinrich Schliemann, a wealthy German businessman and archaeologist, also began excavating in the area after a chance meeting with Calvert in Çanakkale.[3][4] These excavations revealed several cities built in succession. Schliemann was at first skeptical about the identification of Hisarlik with Troy, but was persuaded by Calvert[5] and took over Calvert\'s excavations on the eastern half of the Hisarlik site, which was on Calvert\'s property. Troy VII has been identified with the city called Wilusa by the Hittites, the probable origin of the Greek Ἴλιον, and is generally (but not conclusively) identified with Homeric Troy. Today, the hill at Hisarlik has given its name to a small village near the ruins, which supports the tourist trade visiting the Troia archaeological site.[6] It lies within the province of Çanakkale, some 30 km south-west of the provincial capital, also called Çanakkale. The nearest village is Tevfikiye. The map here shows the adapted Scamander estuary with Ilium a little way inland across the Homeric plain. Due to Troy\'s location near the Aegean Sea, the Sea of Marmara, and the Black Sea, it was a central hub for the military and trade.', 3, NULL, NULL, 'item/item_IHys0jN.png'),
(140, 'Star Wars', '2017-12-28 13:08:55.947266', 18, 'Star Wars is a science-fiction franchise comprising movies, books, comics, video games, toys, and animated shows. It is a fictional universe created by George Lucas. The Star Wars story employs archetypal motifs common to science fiction, political climax and classical mythology, as well as musical motifs of those aspects.\n\nAs one of the foremost examples of the space opera subgenre of science fiction, Star Wars has become part of mainstream popular culture, as well as being one of the highest-grossing series of all time.', 2, NULL, NULL, 'item/item_FDcJNh9.png'),
(142, 'Samba', '2017-12-28 13:28:57.904969', 18, 'Samba is one of the best known forms of Afro-Brazilian music. Afro Brazilian culture developed through a blending of cultures as a result of the Portuguese colonisation of Brazil in the 1500s. The Portuguese wished to use the temperate climate Brazil to grow crops such as coffee and sugar and subjugated the local indigenous Indian population to work their plantations. The Indians found this way of life unacceptable and were subsequently wiped out through a mixture of military campaigns and diseases imported from Europe. To replace them, slave labour was transported from Africa and inevitably brought elements of their culture with them, despite the best efforts of the Portuguese. Out of this racial melting pot, Afro-Brazilian culture was born. This vibrant and exciting culture is still evolving and is expressed in different ways in different parts of Brazil.', 1, NULL, NULL, 'item/item_a61TuCK.jpeg'),
(145, 'Rio Carnival', '2017-12-28 16:38:56.324737', 18, 'Carnival in Rio De Janeiro, one of the best-known parties in the world, is also the largest carnival celebration in the world. It’s filled with music, parades, drinking and people having fun. The carnival, a national holiday in Brazil, runs from Friday night to noon of the following Wednesday. That’s the official length, but many Brazilians turn it into a 10-day holiday. It brings in about half a million foreign tourists each year.', 0, NULL, NULL, 'item/item_GowYwuG.jpeg'),
(146, 'Ephesus', '2017-12-28 21:28:34.200474', 32, 'Ephesus was an ancient Greek city on the coast of Ionia, three kilometres southwest of present-day Selçuk in İzmir Province, Turkey.', 0, NULL, NULL, 'item/item_emNNljs.jpeg'),
(147, 'The London Eye', '2017-12-29 20:11:46.087903', 23, 'The London Eye is a giant Ferris wheel on the South Bank of the River Thames in London.\n\nThe structure is 443 feet (135 m) tall and the wheel has a diameter of 394 feet (120 m). When it opened to the public in 2000 it was the world\'s tallest Ferris wheel. Its height was surpassed by the 525-foot (160 m) Star of Nanchang in 2006, the 541-foot (165 m) Singapore Flyer in 2008, and the 550-foot (167.6 m) High Roller (Las Vegas) in 2014. Supported by an A-frame on one side only, unlike the taller Nanchang and Singapore wheels, the Eye is described by its operators as "the world\'s tallest cantilevered observation wheel".[10]\n\nIt is Europe\'s tallest Ferris wheel,[11] and offered the highest public viewing point in London[12] until it was superseded by the 804-foot (245 m) high[13] observation deck on the 72nd floor of The Shard, which opened to the public on 1 February 2013.[14] It is the most popular paid tourist attraction in the United Kingdom with over 3.75 million visitors annually,[15] and has made many appearances in popular culture.\n\nThe London Eye adjoins the western end of Jubilee Gardens (previously the site of the former Dome of Discovery), on the South Bank of the River Thames between Westminster Bridge and Hungerford Bridge beside County Hall, in the London Borough of Lambeth.', 0, NULL, NULL, 'item/item_rOGQM6Y.jpeg'),
(148, 'Rumelian Castle', '2017-12-29 20:15:13.436514', 23, 'Rumelihisarı (also known as Rumelian Castle and Roumeli Hissar Castle[1]) or Boğazkesen Castle (literally meaning "the Strait-Cutter Castle") is a medieval fortress located in the Sarıyer district of Istanbul, Turkey, on a series of hills on the European banks of the Bosphorus. The fortress also lends its name to the immediate neighborhood around it.\n\nConceived and built between 1451 and 1452 on the orders of Ottoman Sultan Mehmed II, the complex was commissioned in preparation for the Ottoman conquest of Constantinople[1] in 1453 to cut off any potential maritime military or logistical relief that may have come to the Byzantine Empire\'s aid by way of the Bosphorus Strait, hence the fortress\'s alternative name, "Boğazkesen", i.e. "Strait-cutter" Castle. Its older sister structure, Anadoluhisari ("Anatolian Fortress"), sits on the opposite banks of the Bosporus, and the two fortresses worked in tandem in 1453 to throttle all maritime traffic along the Bosphorus, thus helping the Ottomans achieve their goal of making the city of Constantinople (later renamed Istanbul) their new imperial capital.\n\nAfter the conquest of the city, Rumelihisarı served as a customs checkpoint and occasional prison, notably for the embassies of states that were at war with the Empire. After suffering extensive damage in the great earthquake of 1509, the structure was repaired, and was used continuously until the late 19th century.', 0, NULL, NULL, 'item/item_TSVWTw8.jpeg'),
(149, 'Cappadocia', '2017-12-30 11:57:39.596503', 23, 'Cappadocia (/kæpəˈdoʊʃə/; also Capadocia; Turkish: Kapadokya, Greek: Καππαδοκία Kappadokía, from Old Persian: Katpatuka) is a historical region in Central Anatolia, largely in the Nevşehir, Kayseri, Kırşehir, Aksaray, and Niğde Provinces in Turkey.\n\nAccording to Herodotus,[1] in the time of the Ionian Revolt (499 BC), the Cappadocians were reported as occupying a region from Mount Taurus to the vicinity of the Euxine (Black Sea). Cappadocia, in this sense, was bounded in the south by the chain of the Taurus Mountains that separate it from Cilicia, to the east by the upper Euphrates, to the north by Pontus, and to the west by Lycaonia and eastern Galatia.[2]\n\nThe name, traditionally used in Christian sources throughout history, continues in use as an international tourism concept to define a region of exceptional natural wonders, in particular characterized by fairy chimneys and a unique historical and cultural heritage.', 0, NULL, NULL, 'item/item_WMXSk7u.jpeg'),
(150, 'Dolmabahçe Palace', '2017-12-30 12:00:52.341187', 23, 'Dolmabahçe Palace (Turkish: Dolmabahçe Sarayı, IPA: [doɫmabahˈtʃe saɾaˈjɯ]) located in the Beşiktaş district of Istanbul, Turkey, on the European coast of the Bosphorus, served as the main administrative center of the Ottoman Empire from 1856 to 1887 and 1909 to 1922 (Yıldız Palace was used in the interim).', 0, NULL, NULL, 'item/item_eK8fqsa.jpeg'),
(151, 'Belgrade Fortress', '2017-12-30 12:05:40.207049', 23, 'Belgrade Fortress[1][2] (Serbian: Београдска тврђава/Beogradska tvrđava), consists of the old citadel (Upper and Lower Town) and Kalemegdan Park[3] (Large and Little Kalemegdan) on the confluence of the River Sava and Danube, in an urban area of modern Belgrade, the capital of Serbia. It is located in Belgrade\'s municipality of Stari Grad. Belgrade Fortress was declared a Monument of Culture of Exceptional Importance in 1979, and is protected by the Republic of Serbia.[2] It is the most visited tourist attraction in Belgrade, with Skadarlija being the second.[4] Since the admission is free, it is estimated that the total number of visitors (foreign, domestic, citizens of Belgrade) is over 2 million yearly.[5][6]', 0, NULL, NULL, 'item/item_KqWRSfB.jpeg'),
(152, 'Pastırma', '2017-12-30 15:22:29.229264', 18, 'Pastırma is a form of Turkish cured meat with exceptional flavor, a delicate texture, and a lingering taste. The predecessor to the Italian pastrami, this delicacy originated before the Byzantine times, in the East of Turkey in the town of Kayseri where it is still produced today. The story of its invention has to do with meat being pressed, bastırmak in Turkish, by the legs of horsemen as they rode with sides of meat hanging from their saddles.\n\nToday, shanks of beef are cut from domestically grown beef, and dry cured in the fresh air for a couple days. Next, the meat is covered in a paste called çemen, which is made from garlic, fenugreek seeds, and red peppers, and left to cure for another couple days. Connoisseurs will tell you that if your pastirma is cut with a machine, as opposed to a hand knife, it is inferior. Believe what you will.', 0, NULL, NULL, 'item/item_1OJjAMt.jpeg'),
(153, 'Sphinx', '2017-12-30 15:28:40.690553', 18, 'Sphinx (sfĬngks), mythical beast of ancient Egypt, frequently symbolizing the pharaoh as an incarnation of the sun god Ra. The sphinx was represented in sculpture usually in a recumbent position with the head of a man and the body of a lion, although some were constructed with rams\' heads and others with hawks\' heads. Thousands of sphinxes were built in ancient Egypt; the most famous is the Great Sphinx at Giza, a colossal figure sculptured out of natural rock, near the pyramid of Khafre. It was considered by the ancients one of the Seven Wonders of the World. \n\nSphinxes, however, were not peculiar to Egypt; represented in various shapes and forms, they were common throughout the ancient Middle East and Greece. In Greek mythology and art the Sphinx was a winged monster with the head and breasts of a woman and the body of a lion. In the legend of Oedipus she acts as a destructive agent of the gods, posing the riddle of the three ages of man: "What walks on four feet in the morning, on two at noon, and on three in the evening?" She killed all who failed to answer her question until Oedipus solved the riddle by saying, "Man crawls on all fours as a baby, walks upright in the prime of life, and uses a staff in old age." The Sphinx then killed herself.', 0, NULL, NULL, 'item/item_yiGSsIY.jpeg'),
(154, 'Statue of Liberty', '2017-12-30 15:29:58.409792', 18, 'Statue of Liberty, originally named "Liberty Enlightening the World," was a gift from France, unveiled on 28 October 1886 at Bedloe\'s Island (later Liberty Island) in New York Harbor. There, President Grover Cleveland accepted it as a long-delayed commemoration of a century of American independence. Rising 151 feet above an 89-foot pedestal, it was then the tallest structure in New York City.\n\nThe French sculptor Frédéric Auguste Bartholdi had designed the statue with assistance from the great engineer Gustave Eiffel. It was then shipped from Paris in sections. The project\'s sponsors were a group of French liberals who tirelessly promoted the United States as a model of popular government rooted in stability and order and wanted France to follow the American example. Accordingly, Bartholdi\'s gigantic classical goddess carries a tablet representing the American Declaration of Independence. Yet she faces outward, stolid, strong, and unmovable as beams from her upraised lamp radiate across the sea.', 1, NULL, NULL, 'item/item_Y67rZs4.jpeg'),
(155, 'Tres leches cake', '2017-12-30 18:38:37.356279', 18, 'A tres leches cake (Spanish: pastel de tres leches or torta de tres leches), also known as pan tres leches ("three milks bread"), is a sponge cake—in some recipes, a butter cake—soaked in three kinds of milk: evaporated milk, condensed milk, and heavy cream.\n\nWhen butter is not used, the Tres Leches is a very light cake, with many air bubbles. This distinct texture is why it does not have a soggy consistency, despite being soaked in a mixture of three types of milk.', 0, NULL, NULL, 'item/item_8F5ROij.jpeg'),
(156, 'Pad Thai', '2017-12-30 18:42:34.822550', 18, 'Pad Thai is a stir-fried noodle dish, typical street fare in Thailand and perhaps the #1 order at your local Thai restaurant. The traditional version is a bit funky (fish sauce and dried shrimp), sour (fresh tamarind paste), and sweet (palm sugar). There’s also almost always a base of wide rice noodles, a generous sprinkle of crushed peanuts on top, and a lime wedge served alongside. The addition of an egg, scrambled in the wok, and a pile of fresh bean sprouts are also in most versions of the dish.\n\n\nMost Pad Thai recipes for the home cook get their sweet and sour components from brown sugar and vinegar or lime juice. Though a combination of shrimp and tofu are traditional, you can use boneless, skinless chicken thighs in place of the shrimp, or add more vegetables and tofu for a vegetarian version.', 0, NULL, NULL, 'item/item_MRGEUnk.jpeg'),
(157, 'Zeybek', '2017-12-30 20:49:58.813289', 18, 'Zeybek (Harmandalı) dance is part of the Turkish Culture. This dance is the symbol of courage and honour.\n\nZeybek’s were people living in Asia Minor. The majority of them came from Yörük and Türkmen villages. Before the establishment of the Republic of  Turkey, large concentrations of Zeybek’s could be found in western Anatolia particularly in İzmir, Burdur, Afyon, Kütahya, Uşak, Denizli, Aydın, Isparta, Manisa, Mugla, Antalya, and the Balıkesir area. Zeybeks were mountain warriors of  Western Anatolia during the 13th – 19th centuries. Zeybeks generally had Turkmen and Yörük origins. They acted as protectors of village people against landlords, bandits and tax collectors. A leader of a Zeybek gang was called “EFE” and his soldiers were known as “Kızan”. “Kızan” was generally used for untrained Zeybeks. There was generally a tribe democracy in group. Decisions was taken in a democratic way, after the decision was taken “EFE” has an uncontroversial authority. They followed definite rituals for all actions; for example, the promotion of a “kızan” to zeybek was very similar to Ahi rituals.', 0, NULL, NULL, 'item/item_ODvsPiZ.png'),
(158, 'Sami People', '2017-12-30 20:54:46.670569', 18, 'Sami, also spelled Saami, or Same, Sami Sabme, also called Lapp, any member of a people speaking the Sami language and inhabiting Lapland and adjacent areas of northern Norway, Sweden, and Finland, as well as the Kola Peninsula of Russia. The three Sami languages, which are mutually unintelligible, are sometimes considered dialects of one language. They belong to the Finno-Ugric branch of the Uralic family. Almost all Sami are now bilingual, and many no longer even speak their native language. In the late 20th century there were from 30,000 to 40,000 Sami in Norway and about 20,000 in Sweden, 6,000 in Finland, and 2,000 in Russia.', 2, NULL, NULL, 'item/item_1fgEOF1.jpeg'),
(159, 'Christmas', '2017-12-30 20:58:58.538758', 18, 'Christmas is an annual festival commemorating the birth of Jesus Christ, observed primarily on December 25 as a religious and cultural celebration among billions of people around the world.\n\nA feast central to the Christian liturgical year, it is preceded by the season of Advent or the Nativity Fast and initiates the season of Christmastide, which historically in the West lasts twelve days and culminates on Twelfth Night; in some traditions, Christmastide includes an octave.\n\nThe traditional Christmas narrative, the Nativity of Jesus, delineated in the New Testament says that Jesus was born in Bethlehem, in accordance with messianic prophecies; when Joseph and Mary arrived in the city, the inn had no room and so they were offered a stable where the Christ Child was soon born, with angels proclaiming this news to shepherds who then further disseminated the information.\n\nChristmas Day is a public holiday in many of the world\'s nations, is celebrated religiously by a majority of Christians, as well as culturally by many non-Christians,and forms an integral part of the holiday season.', 0, NULL, NULL, 'item/item_EdMoQd8.jpeg'),
(160, 'Hanbok', '2017-12-31 07:33:42.776740', 7, 'Hanbok (South Korea) or Joseon-oth (North Korea) is the representative example of traditional Korean dress. It is characterized by vibrant colors and simple lines without pockets. Although the term literally means "Korean clothing", hanbok usually refers specifically to clothing of the Joseon period and is worn as semi-formal or formal wear during traditional festivals and celebrations. Korea had a dual clothing tradition in which rulers and aristocrats adopted different kinds of mixed foreign-influenced indigenous styles while commoners preserved a distinct style of indigenous clothing, today known as hanbok', 0, NULL, NULL, 'item/item_JogydRJ.jpeg'),
(161, 'Golden Pavilion', '2017-12-31 07:41:22.839439', 7, 'Kinkakuji (金閣寺, Golden Pavilion) is a Zen temple in northern Kyoto whose top two floors are completely covered in gold leaf. Formally known as Rokuonji, the temple was the retirement villa of the shogun Ashikaga Yoshimitsu, and according to his will it became a Zen temple of the Rinzai sect after his death in 1408. Kinkakuji was the inspiration for the similarly named Ginkakuji (Silver Pavilion), built by Yoshimitsu\'s grandson, Ashikaga Yoshimasa, on the other side of the city a few decades later.', 0, NULL, NULL, 'item/item_iRRccbV.jpeg'),
(162, 'The Great Wave', '2017-12-31 07:47:16.508922', 7, 'The Great Wave off Kanagawa (神奈川沖浪裏 Kanagawa-oki nami ura, "Under a wave off Kanagawa"), also known as The Great Wave or simply The Wave, is a woodblock print by the Japanese ukiyo-e artist Hokusai. It was published sometime between 1829 and 1833[1] in the late Edo period as the first print in Hokusai\'s series Thirty-six Views of Mount Fuji. It is Hokusai\'s most famous work, and one of the most recognizable works of Japanese art in the world.', 0, NULL, NULL, 'item/item_4n5XBha.jpeg'),
(163, 'Big Ben', '2017-12-31 07:49:39.237756', 9, 'Big Ben is the nickname for the Great Bell of the clock at the north end of the Palace of Westminster in London and is usually extended to refer to both the clock and the clock tower. The tower is officially Elizabeth Tower, renamed to celebrate the Diamond Jubilee of Elizabeth II in 2012; before that, it was known simply as the Clock Tower.\nThe tower was designed by Augustus Pugin in a neo-gothic style. When completed in 1859, it was, says horologist Ian Westworth, "the prince of timekeepers: the biggest, most accurate four-faced striking and chiming clock in the world". It stands 315 feet (96 m) tall, and the climb from ground level to the belfry is 334 steps. Its base is square, measuring 39 feet (12 m) on each side. Dials of the clock are 23 feet (7.0 m) in diameter. On 31 May 2009, celebrations were held to mark the tower\'s 150th anniversary', 0, NULL, NULL, 'item/item_PD3Vzv5.png'),
(164, 'Bibimbap', '2017-12-31 07:51:33.491511', 7, 'Bibimbap (/ˈbiːbɪmbæp/ BEE-bim-bap,from Korean bibimbap [pi.bim.p͈ap̚]), sometimes anglicized as bi bim bap or bi bim bop, is a Korean dish. The word literally means "mixed rice". Bibimbap is served as a bowl of warm white rice topped with namul (sautéed and seasoned vegetables) and gochujang (chili pepper paste), soy sauce, or doenjang (a fermented soybean paste). A raw or fried egg and sliced meat (usually beef) are common additions. The hot dish is stirred together thoroughly just before eating.', 0, NULL, NULL, 'item/item_0jImNcR.jpeg'),
(165, 'Stonehenge', '2017-12-31 07:58:14.238894', 9, 'Stonehenge is a prehistoric monument in Wiltshire, England, 2 miles (3 km) west of Amesbury. It consists of a ring of standing stones, with each standing stone around 13 feet (4.0 m) high, 7 feet (2.1 m) wide and weighing around 25 tons. The stones are set within earthworks in the middle of the most dense complex of Neolithic and Bronze Age monuments in England, including several hundred burial mounds.\n\nArchaeologists believe it was constructed from 3000 BC to 2000 BC. The surrounding circular earth bank and ditch, which constitute the earliest phase of the monument, have been dated to about 3100 BC. Radiocarbon dating suggests that the first bluestones were raised between 2400 and 2200 BC, although they may have been at the site as early as 3000 BC', 0, NULL, NULL, 'item/item_z9av8xm.png'),
(166, 'Okonomiyaki', '2017-12-31 07:58:25.941822', 7, 'Okonomiyaki (お好み焼き o-konomi-yaki) is a Japanese savory pancake containing a variety of ingredients. The name is derived from the word okonomi, meaning "how you like" or "what you like", and yaki meaning "grill". Okonomiyaki is mainly associated with the Kansai or Hiroshima areas of Japan, but is widely available throughout the country. Toppings and batters tend to vary according to region. In Tokyo, there is liquid okonomiyaki called \'monjayaki.\'', 0, NULL, NULL, 'item/item_mAoQgFV.jpeg'),
(167, 'Basilica Cistern', '2017-12-31 08:03:08.317009', 9, 'The Basilica Cistern, is the largest of several hundred ancient cisterns that lie beneath the city of Istanbul, Turkey. The cistern, located 150 metres (490 ft) southwest of the Hagia Sophia on the historical peninsula of Sarayburnu, was built in the 6th century during the reign of Byzantine Emperor Justinian I.\nHistorical texts claim that 7,000 slaves were involved in the construction of the cistern.\nThe enlarged cistern provided a water filtration system for the Great Palace of Constantinople and other buildings on the First Hill, and continued to provide water to the Topkapi Palace after the Ottoman conquest in 1453 and into modern times.', 0, NULL, NULL, 'item/item_RCV4cob.png'),
(168, 'Cheoyongmu', '2017-12-31 08:05:07.430971', 7, 'Cheoyongmu is a representative Korean mask dance based on the legend of Cheoyeong (처용, 處容), a son of the Dragon King of the Eastern Sea. It is also the oldest surviving Korean court dance created during the Unified Silla period. Cheoyongmu also has been considered as a shamanistic dance because it was performed to drive off evil spirits at the end of the year.', 0, NULL, NULL, 'item/item_3noQn1k.jpeg'),
(169, 'Great Wall of China', '2017-12-31 08:07:19.887411', 9, 'The Great Wall of China is a series of fortifications made of stone, brick, tamped earth, wood, and other materials, generally built along an east-to-west line across the historical northern borders of China to protect the Chinese states and empires against the raids and invasions of the various nomadic groups of the Eurasian Steppe. Several walls were being built as early as the 7th century BC; these, later joined together and made bigger and stronger, are collectively referred to as the Great Wall.[Especially famous is the wall built in 220–206 BC by Qin Shi Huang, the first Emperor of China. Little of that wall remains. The Great Wall has been rebuilt, maintained, and enhanced over various dynasties; the majority of the existing wall is from the Ming Dynasty', 0, NULL, NULL, 'item/item_5ScUJ72.png'),
(170, 'Acropolis of Athens', '2017-12-31 08:14:12.564886', 9, 'The Acropolis of Athens is an ancient citadel located on a rocky outcrop above the city of Athens and contains the remains of several ancient buildings of great architectural and historic significance, the most famous being the Parthenon. The word acropolis is from the Greek words ἄκρον (akron, "highest point, extremity") and πόλις (polis, "city"). Although the term acropolis is generic and there are many other acropoleis in Greece, the significance of the Acropolis of Athens is such that it is commonly known as "The Acropolis" without qualification. During ancient times it was known also more properly as Cecropia, after the legendary serpent-man, Cecrops, the first Athenian king.\nWhile there is evidence that the hill was inhabited as far back as the fourth millennium BC, it was Pericles (c. 495 – 429 BC) in the fifth century BC who coordinated the construction of the site\'s most important present remains including the Parthenon, the Propylaia, the Erechtheion and the Temple of Athena Nike. The Parthenon and the other buildings were damaged seriously during the 1687 siege by the Venetians during the Morean War when gunpowder being stored in the Parthenon was hit by a cannonball and exploded', 0, NULL, NULL, 'item/item_iuR4lNn.png'),
(171, 'Tuho', '2017-12-31 08:19:43.954207', 7, 'Tuho is a traditional  game that requires players to throw sticks from a set distance into a large, sometimes ornate, canister. "Pitch-pot" is a literal translation of the two Chinese characters in the name (as in "pitch it into the pot"), and is used in Sinological literature.', 0, NULL, NULL, 'item/item_R8yxCOb.jpeg'),
(172, 'Hattusha', '2017-12-31 08:21:10.592419', 9, 'Ḫattuša was the capital of the Hittite Empire in the late Bronze Age. Its ruins lie near modern Boğazkale, Turkey, within the great loop of the Kızılırmak River. \nThe landscape surrounding the city included rich agricultural fields and hill lands for pasture as well as woods. Smaller woods are still found outside the city, but in ancient times, they were far more widespread. This meant the inhabitants had an excellent supply of timber when building their houses and other structures. The fields provided the people with a subsistence crop of wheat, barley and lentils. Flax was also harvested, but their primary source for clothing was sheep wool. They also hunted deer in the forest, but this was probably only a luxury reserved for the nobility. Domestic animals provided meat.\nThere were several other settlements in the vicinity, such as the rock shrine at Yazılıkaya and the town at Alacahöyük. Since the rivers in the area are unsuitable for major ships, all transport to and from Hattusa had to go by land.', 0, NULL, NULL, 'item/item_6nFXxRO.png'),
(173, 'Katana', '2017-12-31 08:24:15.912678', 7, 'Historically, katana (刀) were one of the traditionally made Japanese swords (日本刀 nihontō) that were used by the samurai of ancient and feudal Japan. The katana is characterized by its distinctive appearance: a curved, single-edged blade with a circular or squared guard and long grip to accommodate two hands.', 0, NULL, NULL, 'item/item_v0JAFrc.jpeg'),
(174, 'Kemenche', '2017-12-31 08:27:40.517807', 9, 'The Kemençe of the Black Sea, Laz Çilili or Armenian Qamani is a bottle-shaped bowed lute found in the Black Sea region of Turkey (Pontus), adjacent Armenian and Georgian peopled lands, as well as in Greece. It is also known as the "kementche of Laz". The name kemençe comes from Iranian Music Instrument Kamancheh.\nIt is played in the downright position, either by resting it on the knee when sitting, or held in front of the player when standing. It is always played "braccio", that is, with the tuning head uppermost. The kemenche bow is called the yay and the doksar, the Greek term for bow. The kemençe is similar to a kit violin, as it allows for the violinist to dance while playing.\nThe strings are depressed onto the neck of the instrument by the player’s finger pads in the way violin strings are pressed, such as the large Cappadocian kemane.', 0, NULL, NULL, 'item/item_EfEWMdJ.png'),
(175, 'Piri', '2017-12-31 08:28:33.298622', 7, 'The piri is a Korean double reed instrument, used in both the folk and classical (court) music of Korea. It is made of bamboo. Its large reed and cylindrical bore gives it a sound mellower than that of many other types of oboe. In the typical piri, there are eight finger holes on the bamboo body. Seven of the finger holes are on the front and one is on the back for the thumb', 0, NULL, NULL, 'item/item_nBAVimr.jpeg'),
(176, 'Oil wrestling', '2017-12-31 08:40:56.277529', 9, 'Oil wrestling, also called grease wrestling, is the Turkish national sport. It is so called because the wrestlers douse themselves with olive oil. The term "Güreş" is shared with other forms of wrestling practiced by Turkic-speakers across Europe and Central Asia, such as the Uzbek kurash, Tuvan khuresh and Tatar köräş. The wrestlers, known as pehlivan (meaning "hero" or "champion"), wear a type of hand-stitched leather trousers called a kisbet (sometimes kispet), which is traditionally made of water buffalo hide, and most recently has been made of calfskin.\nUnlike Olympic wrestling, oil wrestling matches may be won by achieving an effective hold of the kisbet. Thus, the pehlivan aims to control his opponent by putting his arm through the latter\'s kisbet. To win by this move is called paça kazık. Originally, matches had no set duration and could go on for one or two days until one man was able to establish his superiority, but in 1975 the duration was capped at 40 minutes for the baspehlivan[clarification needed] and 30 minutes for the pehlivan category. If there is no winner, play continues for another 15 minutes—10 minutes for the pehlivan category, wherein scores are kept to determine the victor.', 0, NULL, NULL, 'item/item_GgV0U08.png'),
(177, 'Gayageum', '2017-12-31 08:41:02.716675', 7, 'The gayageum or kayagum is a traditional Korean zither-like string instrument, with 12 strings, though some more recent variants have 21 or other number of strings. It is probably the best known traditional Korean musical instrument. It is related to other Asian instruments, including the Chinese guzheng, the Japanese koto, the Mongolian yatga, and the Vietnamese đàn tranh. When played, the sound varies between traditional Eurasian stringed instruments and the Appalachian banjo.', 0, NULL, NULL, 'item/item_IrbAqWP.jpeg'),
(178, 'Karagöz and Hacivat', '2017-12-31 08:44:25.781314', 9, 'Karagöz (meaning blackeye in Turkish) and Hacivat (shortened in time from "Hacı İvaz" meaning "İvaz the Pilgrim", and also sometimes written as Hacivad) are the lead characters of the traditional Turkish shadow play, popularized during the Ottoman period and then spread to most nation states that comprised the Ottoman Empire and most prominently in Turkey and Greece. In Greece, Karagöz is known by his local name Karagiozis; in Bosnia-Herzegovina, he is known by his local name Karađoz or Karadjoz.', 0, NULL, NULL, 'item/item_RFljjcv.png'),
(179, 'İznik Pottery', '2017-12-31 08:48:45.994431', 9, 'Iznik pottery, or Iznik ware, named after the town of İznik in western Anatolia where it was made, is a decorated ceramic that was produced from the last quarter of the 15th century until the end of the 17th century.\nİznik was an established centre for the production of simple earthenware pottery with an underglaze decoration when, in the last quarter of the 15th century, craftsmen in the town began to manufacture high quality pottery with a fritware body painted with cobalt blue under a colourless transparent lead glaze. The designs combined traditional Ottoman arabesque patterns with Chinese elements. The change was almost certainly a result of active intervention and patronage by the recently established Ottoman court in Istanbul who greatly valued Chinese blue-and-white porcelain.', 0, NULL, NULL, 'item/item_HT2t6TN.png'),
(180, 'Paella', '2017-12-31 08:50:27.597521', 7, 'Paella[a] (Catalan: [paˈeʎa, pə-]; Spanish: [paˈeʎa]) is a Valencian rice dish. Paella has ancient roots, but its modern form originated in the mid-19th century in the area around Albufera lagoon on the east coast of Spain, adjacent to the city of Valencia.Many non-Spaniards view paella as Spain\'s national dish, but most Spaniards consider it to be a regional Valencian dish. Valencians, in turn, regard paella as one of their identifying symbols.\n\nTypes of paella include Valencian paella, vegetable paella (Spanish: paella de verduras), seafood paella (Spanish: paella de marisco), and mixed paella (Spanish: paella mixta), among many others. Valencian paella is believed to be the original recipe[5] and consists of white rice, green beans (bajoqueta and tavella), meat (chicken, duck and rabbit), white beans (garrofón), snails, and seasoning such as saffron and rosemary. Another very common but seasonal ingredient is artichokes. Seafood paella replaces meat with seafood and omits beans and green vegetables. Mixed paella is a free-style combination of meat from land animals, seafood, vegetables, and sometimes beans. Most paella chefs use bomba[6] rice due to it being less likely to overcook, but Valencians tend to use a slightly stickier (and thus more susceptible to overcooking) variety known as Senia. All types of paellas use olive oil.', 0, NULL, NULL, 'item/item_PVwFown.jpeg'),
(181, 'Semmering Railway', '2017-12-31 09:39:40.112420', 28, 'The Semmering Railway, built over 41 km of high mountains between 1848 and 1854, is one of the greatest feats of civil engineering from this pioneering phase of railway building. The high standard of the tunnels, viaducts and other works has ensured the continuous use of the line up to the present day. It runs through a spectacular mountain landscape and there are many fine buildings designed for leisure activities along the way, built when the area was opened up due to the advent of the railway.', 0, NULL, NULL, 'item/item_S2d6HXM.jpeg'),
(182, 'Beyti Kebab', '2017-12-31 09:40:30.894665', 23, 'Beyti is a Turkish dish consisting of ground beef or lamb, grilled on a skewer and served wrapped in lavash and topped with tomato sauce and yogurt.\n\nThe dish is named after Beyti Güler, the owner of the popular restaurant Beyti in Istanbul. He was inspired to create his own dish in 1961 after witnessing Swiss butcher Möller\'s method of preparing meat, when he was visiting Switzerland. His version consists of lamb fillets wrapped in strips of cutlet fat, and grilled. The dish of ground meat commonly sold as street food under this name, bears little resemblance to his original.[1][2]', 0, NULL, NULL, 'item/item_7tA3Nt1.jpeg'),
(183, 'Historic Mosque City of Bagerhat', '2017-12-31 09:42:10.376876', 28, 'The Historic Mosque City of Bagerhat is an important evidence of medieval city in the south-west part of present Bagerhat district which is located in the south-west part of Bangladesh, at the meeting-point of the Ganges and Brahmaputra rivers. The ancient city, formerly known as Khalifatabad, sprawls over on the southern bank of the old river Bhairab and flourished in the 15th century BC.\n\nThe magnificent city, which extended for 50 km2, contains some of the most significant buildings of the initial period of the development of Muslim architecture of Bengal. They include 360 mosques, public buildings, mausoleums, bridges, roads, water tanks and other public buildings constructed from baked brick.\n\nThis old city, created within a few years and covered up by the jungle after the death of its founder in 1459, is striking because of certain uncommon features. The density of Islamic religious monuments is explained by the piety of Khan Jahan, which is evidenced by the engraved inscription on his tomb. The lack of fortifications is attributable to the possibilities of retreat into the impenetrable mangrove swamps of the Sunderbans. The quality of the infrastructures - the supply and evacuation of water, the cisterns and reservoirs, the roads and bridges - all reveal a perfect mastery of the techniques of planning and a will towards spatial organization.\n\nThe monuments, which have been partially disengaged from the vegetation, may be divided into two principal zones 6.5 km apart: to the West, around the mosque of Shait-Gumbad and to the East, around the mausoleum of Khan Jahan. More than 50 monuments have been catalogued: in the first group, the mosques of Singar, Bibi Begni and Clumakkola; and in the second, the mosques of Reza Khoda, Zindavir and Ranvijoypur.', 0, NULL, NULL, 'item/item_J9ft5tO.jpeg'),
(184, 'Rumi', '2017-12-31 09:43:30.303696', 23, 'Jalāl ad-Dīn Muhammad Rūmī (Persian: جلال‌الدین محمد رومی‎), also known as Jalāl ad-Dīn Muhammad Balkhī (جلال‌الدین محمد بلخى), Mevlânâ/Mawlānā (مولانا, "our master"), Mevlevî/Mawlawī (مولوی, "my master"), and more popularly simply as Rumi (30 September 1207 – 17 December 1273), was a 13th-century Persian[1][7] Sunni[8] Muslim poet, jurist, Islamic scholar, theologian, and Sufi mystic.[9] Rumi\'s influence transcends national borders and ethnic divisions: Iranians, Tajiks, Turks, Greeks, Pashtuns, other Central Asian Muslims, and the Muslims of South Asia have greatly appreciated his spiritual legacy for the past seven centuries.[10] His poems have been widely translated into many of the world\'s languages and transposed into various formats. Rumi has been described as the "most popular poet"[11] and the "best selling poet" in the United States.[12][13]', 0, NULL, NULL, 'item/item_6LidOyM.jpeg'),
(185, 'Historic Centre of Brugge', '2017-12-31 09:43:46.827030', 28, 'The Historic Centre of Brugge is an outstanding example of an architectural ensemble, illustrating significant stages in the commercial and cultural fields in medieval Europe.\n\nBrugge in medieval times was known as a commercial metropolis in the heart of Europe.\n\nThe city reflects a considerable exchange of influences on the development of art and architecture, particularly in brick Gothic, which is characteristic of northern Europe and the Baltic. This architecture strongly determines the character of the historic centre of the city.\n\nThe 1th century city walls marked the boundaries of the medieval city. Although the walls themselves are lost today, they remain clearly visible, emphasized by the four surviving gates, the ramparts and one of the defence water towers. The medieval street pattern, with main roads leading towards the important public squares, has mostly been preserved, as well as the network of canals which, once used for mercantile traffic, played an important role in the development of the city.\n\nIn the 15th century, Brugge was the cradle of the Flemish Primitives and a centre of patronage and painting development for artists such as Jan van Eyck and Hans Memling. Many of their works were exported and influenced painting styles all over Europe. Exceptionally important collections have remained in the city until today.\n\nEven after its economic and artistic peak at the end of the Middle Ages, building and urban development continued, although Brugge mostly missed the 19th-century industrial revolution. In the 18th and 19th centuries, many medieval parcels were joined to larger entities and new quarters were also developed. The most striking examples of large scale post-medieval interventions in the historic centre are the urbanization around Coupure (1751-1755), the Zand and the first railway station (1838), the Theatre quarter (1867), the Koningin Elisabethlaan and Gulden Vlieslaan (1897) and the creation of the Guido Gezelle-neighbourhood (1920-1930).\n\nIn the second half of the 20th century, some major changes occurred with Zilverpand (1976), the new Public Library (1975-1978), the new Palace of Justice and Kartuizerswijk (1980), Clarendam (1990) and Colettijnenhof (1997).\n\nBrugge is characterized by a continuity reflected in the relative harmony of changes. As part of this continuity, the late 19th century renovation of facades introduced a Neo-Gothic style that is particular for Brugge. The Brugge ‘neo’ style of construction and its restoration philosophy became a subject of interest, study and inspiration.\n\nStill an active, living city today, Brugge has preserved the architectural and urban structures which document the different phases of its development including the central Market Place with its belfry, the Béguinage, as well as the hospitals, the religious and commercial complexes and the historic urban fabric.', 0, NULL, NULL, 'item/item_Com3FFn.jpeg'),
(186, 'Mostar Bridge', '2017-12-31 09:45:32.736689', 28, 'The historic town of Mostar, spanning a deep valley of the Neretva River, developed in the 15th and 16th centuries as an Ottoman frontier town and during the Austro-Hungarian period in the 19th and 20th centuries. Mostar has long been known for its old Turkish houses and Old Bridge, Stari Most, after which it is named. In the 1990s conflict, however, most of the historic town and the Old Bridge, designed by the renowned architect Sinan, was destroyed. The Old Bridge was recently rebuilt and many of the edifices in the Old Town have been restored or rebuilt with the contribution of an international scientific committee established by UNESCO. The Old Bridge area, with its pre-Ottoman, eastern Ottoman, Mediterranean and western European architectural features, is an outstanding example of a multicultural urban settlement. The reconstructed Old Bridge and Old City of Mostar is a symbol of reconciliation, international co-operation and of the coexistence of diverse cultural, ethnic and religious communities.', 0, NULL, NULL, 'item/item_maVtJYr.jpeg'),
(187, 'Temple of Preah Vihear', '2017-12-31 09:46:42.502987', 28, 'Situated on the edge of a plateau that dominates the plain of Cambodia, the Temple of Preah Vihear is dedicated to Shiva. The Temple is composed of a series of sanctuaries linked by a system of pavements and staircases over an 800 metre long axis and dates back to the first half of the 11th century AD. Nevertheless, its complex history can be traced to the 9th century, when the hermitage was founded. This site is particularly well preserved, mainly due to its remote location. The site is exceptional for the quality of its architecture, which is adapted to the natural environment and the religious function of the temple, as well as for the exceptional quality of its carved stone ornamentation.', 0, NULL, NULL, 'item/item_bvUAVPf.jpeg'),
(188, 'Kaiping Diaolou and Villages', '2017-12-31 09:48:30.828655', 28, 'Kaiping Diaolou and Villages feature the Diaolou, multi-storeyed defensive village houses in Kaiping, which display a complex and flamboyant fusion of Chinese and Western structural and decorative forms. They reflect the significant role of émigré Kaiping people in the development of several countries in South Asia, Australasia and North America, during the late 19th and early 20th centuries. There are four groups of Diaolou and twenty of the most symbolic ones are inscribed on the List. These buildings take three forms: communal towers built by several families and used as temporary refuge, residential towers built by individual rich families and used as fortified residences, and watch towers. Built of stone, pise , brick or concrete, these buildings represent a complex and confident fusion between Chinese and Western architectural styles. Retaining a harmonious relationship with the surrounding landscape, the Diaolou testify to the final flowering of local building traditions that started in the Ming period in response to local banditry.', 1, NULL, NULL, 'item/item_wAimnV7.jpeg'),
(189, 'Fujian Tulou', '2017-12-31 09:49:32.771420', 28, 'Fujian Tulou is a property of 46 buildings constructed between the 15th and 20th centuries over 120 km in south-west of Fujian province, inland from the Taiwan Strait. Set amongst rice, tea and tobacco fields the Tulou are earthen houses. Several storeys high, they are built along an inward-looking, circular or square floor plan as housing for up to 800 people each. They were built for defence purposes around a central open courtyard with only one entrance and windows to the outside only above the first floor. Housing a whole clan, the houses functioned as village units and were known as “a little kingdom for the family” or “bustling small city.” They feature tall fortified mud walls capped by tiled roofs with wide over-hanging eaves. The most elaborate structures date back to the 17th and 18th centuries. The buildings were divided vertically between families with each disposing of two or three rooms on each floor. In contrast with their plain exterior, the inside of the tulou were built for comfort and were often highly decorated. They are inscribed as exceptional examples of a building tradition and function exemplifying a particular type of communal living and defensive organization, and, in terms of their harmonious relationship with their environment, an outstanding example of human settlement.', 0, NULL, NULL, 'item/item_QQo9rOn.jpeg'),
(191, 'Divriği Great Mosque', '2017-12-31 09:53:42.577357', 28, 'This region of Anatolia was conquered by the Turks at the beginning of the 11th century. In 1228–29 Emir Ahmet Shah founded a mosque, with its adjoining hospital, at Divrigi. The mosque has a single prayer room and is crowned by two cupolas. The highly sophisticated technique of vault construction, and a creative, exuberant type of decorative sculpture – particularly on the three doorways, in contrast to the unadorned walls of the interior – are the unique features of this masterpiece of Islamic architecture.', 1, NULL, NULL, 'item/item_AaQucOr.jpeg'),
(192, 'Pergamon', '2017-12-31 09:55:36.864863', 28, 'This site rises high above the Bakirçay Plain in Turkey’s Aegean region. The acropolis of Pergamon was the capital of the Hellenistic Attalid dynasty, a major centre of learning in the ancient world. Monumental temples, theatres, stoa or porticoes, gymnasium, altar and library were set into the sloping terrain surrounded by an extensive city wall. The rock-cut Kybele Sanctuary lies to the north-west on another hill visually linked to the acropolis. Later the city became capital of the Roman province of Asia known for its Asclepieion healing centre. The acropolis crowns a landscape containing burial mounds and remains of the Roman, Byzantine and Ottoman empires in and around the modern town of Bergama on the lower slopes.', 0, NULL, NULL, 'item/item_c8PiJYM.jpeg'),
(193, 'Aphrodisias', '2017-12-31 09:57:35.602117', 28, 'Located in southwestern Turkey, in the upper valley of the Morsynus River, the site consists of two components: the archaeological site of Aphrodisias and the marble quarries northeast of the city. The temple of Aphrodite dates from the 3rd century BC and the city was built one century later. The wealth of Aphrodisias came from the marble quarries and the art produced by its sculptors. The city streets are arranged around several large civic structures, which include temples, a theatre, an agora and two bath complexes.', 1, NULL, NULL, 'item/item_RYjmgM9.jpeg'),
(194, 'Minotaur', '2017-12-31 11:54:21.446290', 39, 'In Greek mythology, the Minotaur (/ˈmaɪnətɔːr/,[1] /ˈmɪnəˌtɔːr/;[2] Ancient Greek: Μῑνώταυρος [miːnɔ̌ːtau̯ros], Latin: Minotaurus, Etruscan: Θevrumineś) is a mythical creature portrayed in Classical times with the head of a bull and the body of a man[3] or, as described by Roman poet Ovid, a being "part man and part bull".[4] The Minotaur dwelt at the center of the Labyrinth, which was an elaborate maze-like construction[5] designed by the architect Daedalus and his son Icarus, on the command of King Minos of Crete. The Minotaur was eventually killed by the Athenian hero Theseus.', 1, NULL, NULL, 'item/item_w3ROhGV.png');
INSERT INTO `base_item` (`id`, `name`, `created_at`, `created_by_id`, `description`, `rate`, `updated_at`, `updated_by_id`, `featured_img`) VALUES
(195, 'Flamenco', '2017-12-31 12:01:07.883497', 18, 'Flamenco is a form of song, dance, and instrumental (mostly guitar) music commonly associated with the Andalusian Roma (Gypsies) of southern Spain. (There, the Roma people are called Gitanos.) The roots of flamenco, though somewhat mysterious, seem to lie in the Roma migration from Rajasthan (in northwest India) to Spain between the 9th and 14th centuries. These migrants brought with them musical instruments, such as tambourines, bells, and wooden castanets, and an extensive repertoire of songs and dances. In Spain they encountered the rich cultures of the Sephardic Jews and the Moors. Their centuries-long cultural intermingling produced the unique art form known as flamenco.', 1, NULL, NULL, 'item/item_bI8UvY7.jpeg'),
(196, 'Pastel de nata', '2017-12-31 12:05:10.416727', 18, 'Pastel de nata is a Portuguese egg tart pastry, originally from Portugal which can also be found in countries with significant Portuguese immigrant populations.\nPastéis de nata were created before the 18th century by Catholic monks at the Jerónimos Monastery (Portuguese: Mosteiro dos Jerónimos) in the civil parish of Santa Maria de Belém, in Lisbon. These monks were originally based in France where these pastries could be found in local bakeries. At the time, convents and monasteries used large quantities of egg-whites for starching clothes, such as nuns\' habits. It was quite common for monasteries and convents to use the leftover egg yolks to make cakes and pastries, resulting in the proliferation of sweet pastry recipes throughout the country.\n\nFollowing the extinction of the religious orders and in the face of the impending closure of many of the convents and monasteries in the aftermath of the Liberal Revolution of 1820, the monks started selling pastéis de nata at a nearby sugar refinery to bring in some revenue. In 1834 the monastery was closed and the recipe was sold to the sugar refinery, whose owners in 1837 opened the Fábrica de Pastéis de Belém. The descendants own the business to this day.', 1, NULL, NULL, 'item/item_SIqz6Ew.jpeg'),
(197, 'Colosseum', '2017-12-31 12:11:30.076563', 32, 'The Colosseum or Coliseum also known as the Flavian Amphitheatre is an oval amphitheatre in the centre of the city of Rome, Italy. Built of travertine, tuff, and brick-faced concrete, it is the largest amphitheatre ever built.', 2, NULL, NULL, 'item/item_V1SULb4.jpeg'),
(199, 'Pantheon', '2017-12-31 15:23:49.722941', 32, 'Even today, almost 2000 years after its construction, the breathtaking pantheon is a remarkable building to see. The spectacular design, proportions, elegance and harmony are a striking reminder of the architecture of the great Roman Empire.', 0, NULL, NULL, 'item/item_84bCMYb.jpeg'),
(200, 'The Great Sphinx of Tanis', '2017-12-31 15:29:49.793006', 32, 'The sphinx is a fabulous creature with the body of a lion and the head of a king.', 0, NULL, NULL, 'item/item_At0tI5e.jpeg'),
(201, 'Manneken Pis', '2017-12-31 15:55:09.192444', 32, 'Manneken Pis is a landmark small bronze sculpture (61 cm) in Brussels, depicting a naked little boy urinating into a fountain\'s basin.', 0, NULL, NULL, 'item/item_8ebeEjw.jpeg'),
(202, 'Brandenburg Gate', '2017-12-31 15:59:51.620511', 32, 'The Brandenburg Gate (German: Brandenburger Tor) is an 18th-century neoclassical monument in Berlin, built on the orders of Prussian king Frederick William II after the (temporarily) successful restoration of order during the early Batavian Revolution.', 0, NULL, NULL, 'item/item_xDJDLte.jpeg'),
(203, 'St. Vitus Cathedral', '2017-12-31 16:06:08.120401', 32, 'The Metropolitan Cathedral of Saints Vitus, Wenceslaus and Adalbert is a Roman Catholic metropolitan cathedral in Prague, the seat of the Archbishop of Prague. Until 1997, the cathedral was dedicated only to Saint Vitus, and is still commonly named only as St. Vitus Cathedral.', 0, NULL, NULL, 'item/item_0NvKM5a.jpeg'),
(204, 'Pallas Athene Fountain', '2017-12-31 16:11:25.435300', 32, 'If you stay at the front of the parliament the view of the visitor is dominated by a 5,5 m high statue of Pallas Athene which stands in the middle of a large fountain. The sculptor Carl Kundmann created the statue according to the plans from architect Hansen.', 0, NULL, NULL, 'item/item_w5D8qmG.jpeg'),
(205, 'Astronomical clock', '2017-12-31 16:18:14.732351', 32, 'An astronomical clock is a clock with special mechanisms and dials to display astronomical information, such as the relative positions of the sun, moon, zodiacal constellations, and sometimes major planets.', 0, NULL, NULL, 'item/item_mzoEjLc.jpeg'),
(206, 'Golden Gate', '2017-12-31 16:22:25.581026', 32, 'The Golden Gate is a strait on the west coast of North America that connects San Francisco Bay to the Pacific Ocean. It is defined by the headlands of the San Francisco Peninsula and the Marin Peninsula, and, since 1937, has been spanned by the Golden Gate Bridge.', 0, NULL, NULL, 'item/item_jAIkobg.jpeg'),
(207, 'The Great Wall', '2017-12-31 18:28:14.258273', 25, 'The Great Wall of China is a series of fortifications made of stone, brick, tamped earth, wood, and other materials, generally built along an east-to-west line across the historical northern borders of China to protect the Chinese states and empires against the raids and invasions of the various nomadic groups of the Eurasian Steppe. Several walls were being built as early as the 7th century BC; these, later joined together and made bigger and stronger, are collectively referred to as the Great Wall. Especially famous is the wall built in 220–206 BC by Qin Shi Huang, the first Emperor of China. Little of that wall remains. The Great Wall has been rebuilt, maintained, and enhanced over various dynasties; the majority of the existing wall is from the Ming Dynasty (1368–1644).', 0, NULL, NULL, 'item/item_3YpZbOS.jpeg'),
(208, 'The Catholic Church', '2017-12-31 18:31:12.106073', 25, 'The Catholic Church, also known as the Roman Catholic Church, is the largest Christian church, with more than 1.29 billion members worldwide. As one of the oldest religious institutions in the world, it has played a prominent role in the history and development of Western civilisation. Headed by the Bishop of Rome, known as the Pope, the church\'s doctrines are summarised in the Nicene Creed. Its central administration, the Holy See, is in the Vatican City, enclaved within Rome, Italy.\n\nThe Catholic Church teaches that it is the One, Holy, Catholic and Apostolic church founded by Jesus Christ in his Great Commission,that its bishops are the successors of Christ\'s apostles, and that the Pope is the successor to Saint Peter to whom primacy was conferred by Jesus Christ. It maintains that it practises the original Christian faith, reserving infallibility, passed down by sacred tradition. The Latin Church, the Eastern Catholic Churches, and institutes such as mendicant orders and enclosed monastic orders reflect a variety of theological and spiritual emphases in the Church.', 0, NULL, NULL, 'item/item_zydhVSb.jpeg'),
(209, 'The Nutcracker Ballet', '2017-12-31 18:33:43.448232', 25, 'The Nutcracker (Russian: Щелкунчик, Балет-феерия / Shchelkunchik, Balet-feyeriya About this sound listen (help·info); French: Casse-Noisette, ballet-féerie) is a two-act ballet, originally choreographed by Marius Petipa and Lev Ivanov with a score by Pyotr Ilyich Tchaikovsky (op. 71). The libretto is adapted from E. T. A. Hoffmann\'s story "The Nutcracker and the Mouse King", by way of Alexandre Dumas\' adapted story "The Nutcracker". It was given its premiere at the Mariinsky Theatre in Saint Petersburg on Sunday, December 18, 1892, on a double-bill with Tchaikovsky\'s opera Iolanta.\n\nAlthough the original production was not a success, the 20-minute suite that Tchaikovsky extracted from the ballet was. However, the complete Nutcracker has enjoyed enormous popularity since the late 1960s and is now performed by countless ballet companies, primarily during the Christmas season, especially in North America.[2] Major American ballet companies generate around 40% of their annual ticket revenues from performances of The Nutcracker.\n\nTchaikovsky\'s score has become one of his most famous compositions, in particular the pieces featured in the suite.Among other things, the score is noted for its use of the celesta, an instrument that the composer had already employed in his much lesser known symphonic ballad The Voyevoda.', 0, NULL, NULL, 'item/item_uwVqd3Q.jpeg'),
(210, 'Pizza', '2017-12-31 18:37:16.148072', 25, 'Pizza is a traditional Italian dish consisting of a yeasted flatbread typically topped with tomato sauce and cheese and baked in an oven. It can also be topped with additional vegetables, meats, and condiments.\n\nThe term pizza was first recorded in the 10th century, in a Latin manuscript from the Southern Italy town of Gaeta in Lazio, on the border with Campania. Modern pizza was invented in Naples, and the dish and its variants have since become popular and common in many areas of the world.In 2009, upon Italy\'s request, Neapolitan pizza was registered with the European Union as a Traditional Speciality Guaranteed dish. Associazione Verace Pizza Napoletana (True Neapolitan Pizza Association), a non-profit organization founded in 1984 with headquarters in Naples, aims to "promote and protect... the true Neapolitan pizza".\n\nPizza is one of the most popular foods in the world and common fast food item in Europe and North America. Many independent or chain restaurants, cafes, and fast food outlets offer pizza. Restaurants or chains specializing in pizza are pizzerias. Pizza delivery is common in some parts of the world.\n\nPizza is sold fresh or frozen, either whole or in portions. Various types of ovens are used to cook them and many varieties exist. Several similar dishes are prepared from ingredients commonly used in pizza preparation, such as calzone and stromboli. In the United States, pizza is usually eaten out of hand after dividing into slices from a large pizza or small pizzetta as a whole. In Italy, pizza is eaten with a fork and knife in restaurants, but is also sold to take away and eaten out of hand. Frozen pizza became popular in the late 20th century.', 0, NULL, NULL, 'item/item_pA5EZc0.jpeg'),
(211, 'The Forbidden City', '2017-12-31 18:39:45.820611', 25, 'The Forbidden City is a palace complex in central Beijing, China. The former seat of Imperial Chinese Dragon Throne from the Ming dynasty to the end of the Qing dynasty—the years 1420 to 1912, it now houses the Palace Museum. The Forbidden City served as the home of emperors and their households as well as the ceremonial and political center of Chinese government for almost 500 years.\n\nConstructed from 1406 to 1420, the complex consists of 980 buildings and covers 72 ha (over 180 acres).The palace exemplifies traditional Chinese palatial architecture,and has influenced cultural and architectural developments in East Asia and elsewhere. The Forbidden City was declared a World Heritage Site in 1987,and is listed by UNESCO as the largest collection of preserved ancient wooden structures in the world.\n\nSince 1925 the Forbidden City has been under the charge of the Palace Museum, whose extensive collection of artwork and artefacts were built upon the imperial collections of the Ming and Qing dynasties. Part of the museum\'s former collection is now in the National Palace Museum in Taipei. Both museums descend from the same institution, but were split after the Chinese Civil War. Since 2012, the Forbidden City has seen an average of 15 million visitors annually, and had 16 million visitors in 2016.', 1, NULL, NULL, 'item/item_pOlnvaq.jpeg'),
(212, 'Terra Cotta Soliders', '2017-12-31 18:43:55.301755', 25, 'The Terracotta Army (simplified Chinese: 兵马俑; traditional Chinese: 兵馬俑; literally: "Soldier-and-horse funerary statues") is a collection of terracotta sculptures depicting the armies of Qin Shi Huang, the first Emperor of China. It is a form of funerary art buried with the emperor in 210–209 BCE and whose purpose was to protect the emperor in his afterlife.\n\nThe figures, dating from approximately the late third century BCE,[1] were discovered in 1974 by local farmers in Lintong District, Xi\'an, Shaanxi province. The figures vary in height according to their roles, with the tallest being the generals. The figures include warriors, chariots and horses. Estimates from 2007 were that the three pits containing the Terracotta Army held more than 8,000 soldiers, 130 chariots with 520 horses and 150 cavalry horses, the majority of which remained buried in the pits nearby Qin Shi Huang\'s mausoleum. Other terracotta non-military figures were found in other pits, including officials, acrobats, strongmen and musicians.', 0, NULL, NULL, 'item/item_BJkVVVN.jpeg'),
(213, 'Çatalhöyük', '2017-12-31 19:01:42.185449', 25, 'Çatalhöyük (Turkish pronunciation: [tʃaˈtaɫhøjyk]; also Çatal Höyük and Çatal Hüyük; from Turkish çatal "fork" + höyük "mound") was a very large Neolithic and Chalcolithic proto-city settlement in southern Anatolia, which existed from approximately 7500 BC to 5700 BC, and flourished around 7000 BC.[1] In July 2012, it was inscribed as a UNESCO World Heritage Site.[2]\n\nÇatalhöyük is located overlooking the Konya Plain, southeast of the present-day city of Konya (ancient Iconium) in Turkey, approximately 140 km (87 mi) from the twin-coned volcano of Mount Hasan. The eastern settlement forms a mound which would have risen about 20 m (66 ft) above the plain at the time of the latest Neolithic occupation. There is also a smaller settlement mound to the west and a Byzantine settlement a few hundred meters to the east. The prehistoric mound settlements were abandoned before the Bronze Age. A channel of the Çarşamba River once flowed between the two mounds, and the settlement was built on alluvial clay which may have been favourable for early agriculture.', 0, NULL, NULL, 'item/item_BCyPIHx.jpeg'),
(214, 'Charles Bridge', '2017-12-31 19:06:43.689885', 25, 'Charles Bridge (Czech: Karlův most [ˈkarluːf ˈmost] (About this sound listen)) is a historic bridge that crosses the Vltava river in Prague, Czech Republic. Its construction started in 1357 under the auspices of King Charles IV, and finished in the beginning of the 15th century.[2] The bridge replaced the old Judith Bridge built 1158–1172 that had been badly damaged by a flood in 1342. This new bridge was originally called Stone Bridge (Kamenný most) or Prague Bridge (Pražský most) but has been "Charles Bridge" since 1870.[2] As the only means of crossing the river Vltava (Moldau) until 1841, Charles Bridge was the most important connection between Prague Castle and the city\'s Old Town and adjacent areas. This "solid-land" connection made Prague important as a trade route between Eastern and Western Europe.\n\nThe bridge is 621 metres (2,037 ft) long and nearly 10 metres (33 ft) wide, following the example of the Stone Bridge in Regensburg, it was built as a bow bridge with 16 arches shielded by ice guards.[2] It is protected by three bridge towers, two of them on the Lesser Quarter side and the third one on the Old Town side. The Old Town Bridge Tower is often[vague] considered to be one of the most astonishing civil gothic-style buildings in the world[according to whom?]. The bridge is decorated by a continuous alley of 30 statues and statuaries, most of them baroque-style, originally erected around 1700 but now all replaced by replicas.', 0, NULL, NULL, 'item/item_LAOqLIO.jpeg'),
(215, 'Charles Bridge', '2017-12-31 19:06:55.321632', 25, 'Charles Bridge (Czech: Karlův most [ˈkarluːf ˈmost] (About this sound listen)) is a historic bridge that crosses the Vltava river in Prague, Czech Republic. Its construction started in 1357 under the auspices of King Charles IV, and finished in the beginning of the 15th century.[2] The bridge replaced the old Judith Bridge built 1158–1172 that had been badly damaged by a flood in 1342. This new bridge was originally called Stone Bridge (Kamenný most) or Prague Bridge (Pražský most) but has been "Charles Bridge" since 1870.[2] As the only means of crossing the river Vltava (Moldau) until 1841, Charles Bridge was the most important connection between Prague Castle and the city\'s Old Town and adjacent areas. This "solid-land" connection made Prague important as a trade route between Eastern and Western Europe.\n\nThe bridge is 621 metres (2,037 ft) long and nearly 10 metres (33 ft) wide, following the example of the Stone Bridge in Regensburg, it was built as a bow bridge with 16 arches shielded by ice guards.[2] It is protected by three bridge towers, two of them on the Lesser Quarter side and the third one on the Old Town side. The Old Town Bridge Tower is often[vague] considered to be one of the most astonishing civil gothic-style buildings in the world[according to whom?]. The bridge is decorated by a continuous alley of 30 statues and statuaries, most of them baroque-style, originally erected around 1700 but now all replaced by replicas.', 0, NULL, NULL, 'item/item_CXsuMWl.jpeg'),
(216, 'Charles Bridge', '2017-12-31 19:08:41.544493', 25, 'Charles Bridge (Czech: Karlův most [ˈkarluːf ˈmost] (About this sound listen)) is a historic bridge that crosses the Vltava river in Prague, Czech Republic. Its construction started in 1357 under the auspices of King Charles IV, and finished in the beginning of the 15th century.[2] The bridge replaced the old Judith Bridge built 1158–1172 that had been badly damaged by a flood in 1342. This new bridge was originally called Stone Bridge (Kamenný most) or Prague Bridge (Pražský most) but has been "Charles Bridge" since 1870.[2] As the only means of crossing the river Vltava (Moldau) until 1841, Charles Bridge was the most important connection between Prague Castle and the city\'s Old Town and adjacent areas. This "solid-land" connection made Prague important as a trade route between Eastern and Western Europe.\n\nThe bridge is 621 metres (2,037 ft) long and nearly 10 metres (33 ft) wide, following the example of the Stone Bridge in Regensburg, it was built as a bow bridge with 16 arches shielded by ice guards.[2] It is protected by three bridge towers, two of them on the Lesser Quarter side and the third one on the Old Town side. The Old Town Bridge Tower is often[vague] considered to be one of the most astonishing civil gothic-style buildings in the world[according to whom?]. The bridge is decorated by a continuous alley of 30 statues and statuaries, most of them baroque-style, originally erected around 1700 but now all replaced by replicas.', 0, NULL, NULL, 'item/item_RBGQ0Ts.jpeg'),
(217, 'Charles Bridge', '2017-12-31 19:10:09.433930', 25, 'Charles Bridge (Czech: Karlův most [ˈkarluːf ˈmost] (About this sound listen)) is a historic bridge that crosses the Vltava river in Prague, Czech Republic. Its construction started in 1357 under the auspices of King Charles IV, and finished in the beginning of the 15th century.[2] The bridge replaced the old Judith Bridge built 1158–1172 that had been badly damaged by a flood in 1342. This new bridge was originally called Stone Bridge (Kamenný most) or Prague Bridge (Pražský most) but has been "Charles Bridge" since 1870.[2] As the only means of crossing the river Vltava (Moldau) until 1841, Charles Bridge was the most important connection between Prague Castle and the city\'s Old Town and adjacent areas. This "solid-land" connection made Prague important as a trade route between Eastern and Western Europe.\n\nThe bridge is 621 metres (2,037 ft) long and nearly 10 metres (33 ft) wide, following the example of the Stone Bridge in Regensburg, it was built as a bow bridge with 16 arches shielded by ice guards.[2] It is protected by three bridge towers, two of them on the Lesser Quarter side and the third one on the Old Town side. The Old Town Bridge Tower is often[vague] considered to be one of the most astonishing civil gothic-style buildings in the world[according to whom?]. The bridge is decorated by a continuous alley of 30 statues and statuaries, most of them baroque-style, originally erected around 1700 but now all replaced by replicas.', 0, NULL, NULL, 'item/item_ZKYz2a8.jpeg'),
(218, 'Charles Bridge', '2017-12-31 19:10:20.384959', 25, 'Charles Bridge (Czech: Karlův most [ˈkarluːf ˈmost] (About this sound listen)) is a historic bridge that crosses the Vltava river in Prague, Czech Republic. Its construction started in 1357 under the auspices of King Charles IV, and finished in the beginning of the 15th century.[2] The bridge replaced the old Judith Bridge built 1158–1172 that had been badly damaged by a flood in 1342. This new bridge was originally called Stone Bridge (Kamenný most) or Prague Bridge (Pražský most) but has been "Charles Bridge" since 1870.[2] As the only means of crossing the river Vltava (Moldau) until 1841, Charles Bridge was the most important connection between Prague Castle and the city\'s Old Town and adjacent areas. This "solid-land" connection made Prague important as a trade route between Eastern and Western Europe.\nThe bridge is 621 metres (2,037 ft) long and nearly 10 metres (33 ft) wide, following the example of the Stone Bridge in Regensburg, it was built as a bow bridge with 16 arches shielded by ice guards.[2] It is protected by three bridge towers, two of them on the Lesser Quarter side and the third one on the Old Town side. The Old Town Bridge Tower is often[vague] considered to be one of the most astonishing civil gothic-style buildings in the world[according to whom?]. The bridge is decorated by a continuous alley of 30 statues and statuaries, most of them baroque-style, originally erected around 1700 but now all replaced by replicas.', 0, NULL, NULL, 'item/item_Bm6LnI8.jpeg'),
(219, 'The Charles Bridge', '2017-12-31 19:12:22.924481', 25, 'Charles Bridge (Czech: Karlův most [ˈkarluːf ˈmost] (About this sound listen)) is a historic bridge that crosses the Vltava river in Prague, Czech Republic. Its construction started in 1357 under the auspices of King Charles IV, and finished in the beginning of the 15th century.[2] The bridge replaced the old Judith Bridge built 1158–1172 that had been badly damaged by a flood in 1342. This new bridge was originally called Stone Bridge (Kamenný most) or Prague Bridge (Pražský most) but has been "Charles Bridge" since 1870.[2] As the only means of crossing the river Vltava (Moldau) until 1841, Charles Bridge was the most important connection between Prague Castle and the city\'s Old Town and adjacent areas. This "solid-land" connection made Prague important as a trade route between Eastern and Western Europe.\nThe bridge is 621 metres (2,037 ft) long and nearly 10 metres (33 ft) wide, following the example of the Stone Bridge in Regensburg, it was built as a bow bridge with 16 arches shielded by ice guards.[2] It is protected by three bridge towers, two of them on the Lesser Quarter side and the third one on the Old Town side. The Old Town Bridge Tower is often[vague] considered to be one of the most astonishing civil gothic-style buildings in the world[according to whom?]. The bridge is decorated by a continuous alley of 30 statues and statuaries, most of them baroque-style, originally erected around 1700 but now all replaced by replicas.\n\n<CORUM OSMANCIK ADAMDIR>', 0, NULL, NULL, 'item/item_Mq2ooLl.jpeg'),
(220, 'The Charles Bridge', '2017-12-31 19:13:51.218869', 25, 'Charles Bridge (Czech: Karlův most [ˈkarluːf ˈmost] (About this sound listen)) is a historic bridge that crosses the Vltava river in Prague, Czech Republic. Its construction started in 1357 under the auspices of King Charles IV, and finished in the beginning of the 15th century.[2] The bridge replaced the old Judith Bridge built 1158–1172 that had been badly damaged by a flood in 1342. This new bridge was originally called Stone Bridge (Kamenný most) or Prague Bridge (Pražský most) but has been "Charles Bridge" since 1870.[2] As the only means of crossing the river Vltava (Moldau) until 1841, Charles Bridge was the most important connection between Prague Castle and the city\'s Old Town and adjacent areas. This "solid-land" connection made Prague important as a trade route between Eastern and Western Europe.\n\nThe bridge is 621 metres (2,037 ft) long and nearly 10 metres (33 ft) wide, following the example of the Stone Bridge in Regensburg, it was built as a bow bridge with 16 arches shielded by ice guards.[2] It is protected by three bridge towers, two of them on the Lesser Quarter side and the third one on the Old Town side. The Old Town Bridge Tower is often[vague] considered to be one of the most astonishing civil gothic-style buildings in the world[according to whom?]. The bridge is decorated by a continuous alley of 30 statues and statuaries, most of them baroque-style, originally erected around 1700 but now all replaced by replicas.\n\n<CORUM OSMANCIK ADAMDIR>', 0, NULL, NULL, 'item/item_UhfaGcJ.jpeg');

-- --------------------------------------------------------

--
-- Table structure for table `base_itemedit`
--

CREATE TABLE `base_itemedit` (
  `id` int(11) NOT NULL,
  `item_id` int(11) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

-- --------------------------------------------------------

--
-- Table structure for table `base_itemfollow`
--

CREATE TABLE `base_itemfollow` (
  `id` int(11) NOT NULL,
  `item_id` int(11) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

-- --------------------------------------------------------

--
-- Table structure for table `base_item_tags`
--

CREATE TABLE `base_item_tags` (
  `id` int(11) NOT NULL,
  `item_id` int(11) NOT NULL,
  `tag_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

--
-- Dumping data for table `base_item_tags`
--

INSERT INTO `base_item_tags` (`id`, `item_id`, `tag_id`) VALUES
(34, 11, 11),
(35, 11, 12),
(36, 11, 13),
(33, 11, 22),
(22, 16, 17),
(23, 16, 18),
(24, 16, 19),
(27, 20, 17),
(28, 20, 22),
(29, 20, 23),
(30, 21, 22),
(31, 21, 24),
(32, 21, 25),
(40, 23, 29),
(41, 23, 30),
(42, 24, 29),
(43, 24, 30),
(46, 28, 33),
(47, 28, 34),
(48, 28, 35),
(49, 28, 36),
(50, 28, 37),
(53, 29, 33),
(51, 29, 38),
(52, 29, 39),
(54, 29, 40),
(55, 29, 41),
(63, 35, 46),
(64, 35, 47),
(65, 35, 48),
(66, 35, 49),
(67, 36, 33),
(68, 36, 50),
(69, 36, 51),
(70, 36, 52),
(71, 36, 53),
(72, 37, 46),
(73, 37, 54),
(74, 37, 55),
(76, 38, 33),
(75, 38, 35),
(77, 38, 50),
(78, 38, 56),
(80, 39, 35),
(79, 39, 36),
(81, 39, 57),
(84, 40, 33),
(82, 40, 58),
(83, 40, 59),
(85, 41, 8),
(86, 41, 9),
(87, 42, 60),
(88, 42, 61),
(90, 43, 33),
(89, 43, 62),
(91, 43, 63),
(92, 43, 64),
(96, 45, 35),
(95, 45, 36),
(97, 45, 65),
(98, 45, 66),
(99, 46, 29),
(100, 46, 67),
(101, 46, 68),
(102, 46, 69),
(106, 47, 58),
(104, 47, 63),
(105, 47, 65),
(103, 47, 69),
(107, 47, 70),
(138, 54, 35),
(139, 54, 57),
(140, 54, 71),
(141, 54, 72),
(142, 54, 73),
(143, 55, 74),
(144, 55, 75),
(145, 55, 76),
(146, 55, 77),
(151, 57, 35),
(148, 57, 47),
(152, 57, 48),
(149, 57, 78),
(150, 57, 79),
(155, 58, 30),
(153, 58, 80),
(154, 58, 81),
(156, 58, 82),
(157, 59, 61),
(158, 59, 83),
(159, 59, 84),
(202, 102, 30),
(201, 102, 103),
(203, 102, 104),
(206, 107, 105),
(207, 107, 106),
(208, 108, 107),
(209, 108, 108),
(210, 108, 109),
(211, 109, 106),
(212, 109, 110),
(214, 110, 30),
(213, 110, 111),
(215, 111, 106),
(216, 111, 112),
(217, 112, 30),
(218, 112, 113),
(219, 112, 114),
(225, 114, 30),
(224, 114, 55),
(223, 114, 118),
(231, 116, 30),
(230, 116, 111),
(233, 117, 106),
(232, 117, 123),
(234, 118, 124),
(238, 120, 128),
(239, 120, 129),
(240, 120, 130),
(241, 120, 131),
(245, 122, 30),
(244, 122, 110),
(246, 123, 133),
(247, 124, 3),
(250, 125, 29),
(248, 125, 134),
(249, 125, 135),
(251, 125, 136),
(252, 126, 137),
(253, 126, 138),
(254, 127, 129),
(255, 128, 139),
(256, 128, 140),
(257, 128, 141),
(263, 130, 22),
(264, 130, 132),
(266, 131, 142),
(265, 131, 144),
(268, 131, 146),
(267, 131, 147),
(269, 131, 148),
(270, 132, 36),
(271, 132, 149),
(272, 132, 150),
(273, 132, 151),
(274, 133, 142),
(275, 133, 148),
(276, 133, 152),
(277, 133, 153),
(278, 134, 137),
(282, 135, 35),
(281, 135, 61),
(280, 135, 149),
(279, 135, 154),
(284, 136, 35),
(286, 136, 149),
(283, 136, 155),
(285, 136, 156),
(287, 136, 157),
(288, 137, 158),
(291, 138, 35),
(289, 138, 159),
(290, 138, 160),
(292, 138, 161),
(293, 140, 51),
(294, 140, 162),
(295, 140, 163),
(301, 142, 33),
(300, 142, 80),
(302, 142, 165),
(307, 145, 80),
(309, 145, 165),
(308, 145, 167),
(310, 146, 168),
(311, 146, 169),
(312, 146, 170),
(313, 147, 22),
(314, 147, 171),
(315, 147, 172),
(316, 147, 173),
(317, 148, 151),
(318, 148, 174),
(321, 149, 84),
(319, 149, 175),
(320, 149, 176),
(324, 150, 39),
(322, 150, 177),
(323, 150, 178),
(325, 151, 174),
(326, 151, 179),
(327, 151, 180),
(328, 152, 181),
(329, 152, 182),
(330, 152, 183),
(331, 152, 184),
(333, 153, 61),
(334, 153, 175),
(332, 153, 185),
(335, 154, 186),
(336, 154, 187),
(337, 154, 188),
(340, 155, 29),
(339, 155, 67),
(338, 155, 189),
(343, 156, 111),
(341, 156, 190),
(342, 156, 191),
(347, 157, 30),
(345, 157, 63),
(346, 157, 80),
(344, 157, 192),
(348, 158, 193),
(349, 158, 194),
(350, 158, 195),
(351, 158, 196),
(352, 158, 197),
(353, 158, 198),
(354, 158, 199),
(355, 159, 200),
(356, 159, 201),
(357, 159, 202),
(358, 160, 203),
(359, 160, 204),
(360, 160, 205),
(361, 160, 206),
(362, 160, 207),
(366, 161, 25),
(363, 161, 208),
(364, 161, 209),
(365, 161, 210),
(367, 161, 211),
(368, 162, 25),
(369, 162, 212),
(370, 163, 105),
(371, 163, 213),
(373, 164, 29),
(372, 164, 204),
(374, 164, 214),
(376, 165, 127),
(375, 165, 213),
(379, 166, 29),
(377, 166, 215),
(378, 166, 216),
(380, 166, 217),
(381, 167, 106),
(382, 167, 218),
(384, 168, 80),
(386, 168, 204),
(383, 168, 219),
(385, 168, 220),
(387, 169, 221),
(388, 169, 222),
(389, 170, 82),
(390, 170, 223),
(392, 171, 204),
(394, 171, 206),
(391, 171, 224),
(393, 171, 225),
(395, 172, 30),
(396, 172, 226),
(397, 172, 227),
(398, 172, 228),
(399, 173, 215),
(400, 173, 229),
(401, 173, 230),
(403, 174, 30),
(402, 174, 55),
(404, 174, 82),
(405, 174, 118),
(407, 175, 38),
(408, 175, 204),
(406, 175, 231),
(409, 176, 30),
(410, 176, 232),
(413, 177, 38),
(411, 177, 220),
(412, 177, 231),
(414, 178, 30),
(415, 178, 233),
(416, 178, 234),
(418, 179, 30),
(417, 179, 235),
(419, 179, 236),
(420, 179, 237),
(423, 180, 29),
(422, 180, 216),
(421, 180, 238),
(424, 181, 239),
(425, 181, 240),
(426, 182, 29),
(429, 182, 135),
(427, 182, 241),
(428, 182, 242),
(431, 183, 18),
(430, 183, 170),
(433, 184, 66),
(432, 184, 243),
(434, 184, 244),
(436, 185, 116),
(435, 185, 245),
(437, 185, 246),
(438, 186, 239),
(439, 186, 247),
(440, 187, 209),
(441, 188, 248),
(442, 189, 249),
(443, 189, 250),
(446, 191, 18),
(448, 191, 109),
(447, 191, 251),
(449, 192, 175),
(450, 192, 252),
(452, 193, 36),
(451, 193, 253),
(453, 194, 35),
(454, 194, 254),
(455, 194, 255),
(456, 195, 80),
(457, 195, 256),
(458, 195, 257),
(459, 195, 258),
(462, 196, 67),
(460, 196, 259),
(461, 196, 260),
(463, 196, 261),
(465, 197, 8),
(464, 197, 9),
(469, 199, 8),
(468, 199, 262),
(471, 200, 185),
(470, 200, 263),
(472, 201, 264),
(473, 201, 265),
(474, 202, 266),
(475, 202, 267),
(476, 203, 268),
(477, 203, 269),
(478, 204, 270),
(479, 205, 269),
(480, 205, 271),
(481, 206, 267),
(482, 206, 272),
(483, 206, 273),
(484, 207, 274),
(485, 207, 275),
(486, 207, 276),
(488, 208, 8),
(487, 208, 277),
(489, 208, 278),
(490, 209, 80),
(491, 209, 279),
(492, 209, 280),
(495, 210, 10),
(493, 210, 29),
(494, 210, 281),
(496, 210, 282),
(497, 210, 283),
(499, 211, 84),
(500, 211, 170),
(498, 211, 276),
(501, 211, 284),
(504, 212, 84),
(503, 212, 265),
(505, 212, 276),
(502, 212, 285),
(506, 213, 39),
(509, 213, 175),
(507, 213, 286),
(508, 213, 287),
(512, 214, 4),
(511, 214, 284),
(510, 214, 288),
(515, 215, 4),
(514, 215, 284),
(513, 215, 288),
(518, 216, 4),
(517, 216, 284),
(516, 216, 288),
(521, 217, 4),
(520, 217, 284),
(519, 217, 288),
(524, 218, 4),
(523, 218, 284),
(522, 218, 288),
(527, 219, 4),
(526, 219, 284),
(525, 219, 288),
(529, 220, 284),
(528, 220, 288);

-- --------------------------------------------------------

--
-- Table structure for table `base_location`
--

CREATE TABLE `base_location` (
  `id` int(11) NOT NULL,
  `name` varchar(200) COLLATE utf8mb4_bin NOT NULL,
  `longtitude` double DEFAULT NULL,
  `latitude` double DEFAULT NULL,
  `created_at` datetime(6) NOT NULL,
  `created_by_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

--
-- Dumping data for table `base_location`
--

INSERT INTO `base_location` (`id`, `name`, `longtitude`, `latitude`, `created_at`, `created_by_id`) VALUES
(1, ' Adıyaman', NULL, NULL, '2017-11-23 12:14:27.471656', NULL),
(2, 'Adıyaman', NULL, NULL, '2017-12-04 18:30:54.514950', NULL),
(3, 'BM ', NULL, NULL, '2017-12-06 11:41:58.001578', NULL),
(4, 'Regio IV Templum Pacis ("Temple of Peace")', NULL, NULL, '2017-12-06 17:18:28.391811', NULL),
(5, 'Istanbul', NULL, NULL, '2017-12-07 10:32:00.474769', 4),
(6, 'İstanbul', 41.010499, 29.040746, '2017-12-23 13:52:49.943594', NULL),
(7, 'Boğaziçi University', 29.0510399, 41.0847571, '2017-12-25 14:36:37.009661', NULL),
(8, 'London', -0.1277583, 51.5073509, '2017-12-25 14:48:25.368455', NULL),
(9, 'burası', NULL, NULL, '2017-12-25 17:59:26.722413', NULL),
(10, 'orası', NULL, NULL, '2017-12-25 18:07:46.610487', NULL),
(11, 'here', NULL, NULL, '2017-12-25 18:11:43.957390', NULL),
(12, '', NULL, NULL, '2017-12-25 18:13:49.362216', NULL),
(13, 'loc', NULL, NULL, '2017-12-25 19:19:45.126897', NULL),
(14, '0°00\'00.0"N 0°00\'00.0"W', -0.00000390625000079581, 0.0000075000000023806, '2017-12-26 14:37:01.399027', NULL),
(15, 'Bursa, Turkey', 29.0609636, 40.1885281, '2017-12-27 11:01:26.700735', NULL),
(16, 'Bebek Mahallesi, Boğaziçi University, Beşiktaş/Istanbul, Turkey', 29.0510399, 41.0847571, '2017-12-27 11:05:03.510930', NULL),
(17, 'Istanbul, Turkey', 28.9783589, 41.0082376, '2017-12-27 11:23:00.719974', NULL),
(18, '27°40\'14.1"N 135°58\'59.4"E', 135.98316015625, 27.6705825, '2017-12-27 17:59:19.615522', NULL),
(19, '24°20\'24.7"N 140°56\'38.2"E', 140.94394140625, 24.3401875, '2017-12-27 18:22:46.622914', NULL),
(20, 'ÖzdilekPARK Istanbul Shopping Mall', 29.012717, 41.077415, '2017-12-27 18:34:22.724190', NULL),
(21, 'Paris, France', 2.35222190000002, 48.856614, '2017-12-27 19:29:13.978023', NULL),
(22, 'Tokyo, Japan', 139.6917064, 35.6894875, '2017-12-27 19:35:14.846049', NULL),
(23, 'anıtk', 86.8196994, 25.162269, '2017-12-27 21:42:48.612382', NULL),
(24, 'Mebusevleri Mahallesi, Anıtkabir, Çankaya/Ankara, Turkey', 32.8369439000001, 39.925054, '2017-12-27 21:50:41.336492', NULL),
(25, 'Athens, GA, United States', -83.357567, 33.9519347, '2017-12-28 09:28:03.159274', NULL),
(26, 'Bereketzade Mahallesi, Galata Tower, Galata Kulesi, Istanbul, Turkey', 28.9743778, 41.0257736, '2017-12-28 09:38:24.768091', NULL),
(27, 'Macedonia (FYROM)', 21.745275, 41.608635, '2017-12-28 09:40:18.296525', NULL),
(28, 'Mecidiye Mahallesi, Ortaköy Mosque, Mecidiye Köprüsü Sokak, Istanbul, Turkey', 29.0269894, 41.0473269, '2017-12-28 09:42:20.784977', NULL),
(29, 'Cankurtaran Mahallesi, Topkapi Palace Museum, Fatih/Istanbul, Turkey', 28.9833788999999, 41.0115195, '2017-12-28 09:48:00.426144', NULL),
(30, 'safran', -96.9794374, 32.9023055, '2017-12-28 09:54:49.280616', NULL),
(31, 'truva', -84.385803, 33.759758, '2017-12-28 10:03:07.239149', NULL),
(32, 'Yıldız Mahallesi, Yildiz Palace, Serencebey Yokuşu, Istanbul, Turkey', 29.0111992, 41.0492694, '2017-12-28 10:07:31.932145', NULL),
(33, 'Statue of Liberty National Monument, New York, NY, United States', -74.0445004, 40.6892494, '2017-12-28 10:20:48.022592', NULL),
(34, 'Louvre Museum, Rue de Rivoli, Paris, France', 2.33764399999995, 48.8606111, '2017-12-28 10:24:26.917196', NULL),
(35, 'Konak Mahallesi, İzmir Clock Tower, Konak/İzmir, Turkey', 27.1287, 38.4189, '2017-12-28 10:30:18.817014', NULL),
(36, 'Yeşil Camii Mahallesi, Green Mosque, İznik/Bursa, Turkey', 29.7272093, 40.4296418, '2017-12-28 10:33:34.966107', NULL),
(37, 'pamukkale', 29.1187097, 37.9136957, '2017-12-28 10:41:26.222338', NULL),
(38, 'Adana', 35.3905046, 37.2612315, '2017-12-28 10:42:17.113547', NULL),
(39, 'Asmalı Mescit Mahallesi, Pera Museum, Meşrutiyet Caddesi, Beyoğlu/Istanbul, Turkey', 28.9751681, 41.0318079, '2017-12-28 10:50:04.168372', NULL),
(40, 'Aztec', -107.9928455, 36.8222261, '2017-12-28 10:56:43.368043', NULL),
(41, 'victori', -97.0035982, 28.8052674, '2017-12-28 10:56:53.498762', NULL),
(42, 'australia vic', 144.7851531, -37.4713077, '2017-12-28 11:05:44.201708', NULL),
(43, 'Mount Olympus', 22.3585552, 40.0884128, '2017-12-28 11:14:50.253434', NULL),
(44, 'North Amer', -105.2551187, 54.5259614, '2017-12-28 11:17:01.543805', NULL),
(45, 'Japan', 138.252924, 36.204824, '2017-12-28 11:20:51.142732', NULL),
(46, 'Heliopolis', 31.322709, 30.0909837, '2017-12-28 11:54:25.002144', NULL),
(47, 'THOR GmbH', 8.42025, 49.33567, '2017-12-28 12:05:12.326575', NULL),
(48, 'Safranbolu, Karabük, Turkey', 32.683128, 41.249306, '2017-12-28 12:26:25.301961', NULL),
(49, 'Libya', 17.228331, 26.3351, '2017-12-28 12:28:37.017412', NULL),
(50, 'Troy, Tevfikiye Köyü/Çanakkale Merkez/Çanakkale, Turkey', 26.2391526, 39.9572581, '2017-12-28 12:28:59.540629', NULL),
(51, 'santa claus villa', 25.8471973000001, 66.5436144, '2017-12-28 13:25:57.398498', NULL),
(52, 'Rio de Janeiro - State of Rio de Janeiro, Brazil', -43.1728965, -22.9068467, '2017-12-28 13:51:19.748450', NULL),
(53, 'Rio ', -43.1728965, -22.9068467, '2017-12-28 16:38:56.328988', NULL),
(54, 'efes antik kenti', 27.3676408, 37.9489313, '2017-12-28 21:28:34.204976', NULL),
(55, 'London eye', -0.119543000000021, 51.503324, '2017-12-29 20:11:46.094752', NULL),
(56, 'Rumeli ', 29.0566979, 41.0848224, '2017-12-29 20:15:13.440946', NULL),
(57, 'kapadok', -1.08657400000004, 53.957574, '2017-12-30 11:57:39.600953', NULL),
(58, 'Dolmaba', -74.045929, 40.716355, '2017-12-30 12:00:52.345178', NULL),
(59, 'belgrade for', 20.4489215999999, 44.786568, '2017-12-30 12:05:40.211529', NULL),
(60, 'thailand', 100.992541, 15.870032, '2017-12-30 18:42:34.826970', NULL),
(61, 'Seoul, South Korea', 126.9779692, 37.566535, '2017-12-31 07:33:42.781148', NULL),
(62, 'Kinkakuji Temple, Kyoto, Kyoto Prefecture, Japan', 135.7292431, 35.03937, '2017-12-31 07:41:22.843694', NULL),
(63, 'Millbank Big Ben Private Residence, London, England, United Kingdom', -0.132256200000029, 51.4941883, '2017-12-31 07:49:39.242179', NULL),
(64, 'Stonehenge Road, Amesbury, Wiltshire, United Kingdom', -1.78958769999997, 51.1718187, '2017-12-31 07:58:14.259134', NULL),
(65, 'Alemdar Mahallesi, The Basilica Cistern, Yerebatan Caddesi, Fatih/Istanbul, Turkey', 28.977878, 41.008384, '2017-12-31 08:03:08.321020', NULL),
(66, 'Seou', 126.9779692, 37.566535, '2017-12-31 08:05:07.435179', NULL),
(67, 'Great Wall of China, Beijing, China', 116.5703749, 40.4319077, '2017-12-31 08:07:19.891547', NULL),
(68, 'Acropolis, Athens, Central Athens, Greece', 23.7257492, 37.9715323, '2017-12-31 08:14:12.571067', NULL),
(69, 'Asia', 100.6196553, 34.047863, '2017-12-31 08:19:43.961427', NULL),
(70, 'Hisar Mahallesi, Hattuşaş Örenyeri, Boğazkale/Çorum, Turkey', 34.6177633, 40.0139832, '2017-12-31 08:21:10.596739', NULL),
(71, 'Edirne, Turkey', 26.5557145, 41.6771297, '2017-12-31 08:40:56.291396', NULL),
(72, 'İznik/Bursa, Turkey', 29.719743, 40.429524, '2017-12-31 08:48:45.999321', NULL),
(73, 'Spain', -3.74922000000004, 40.463667, '2017-12-31 08:50:27.602635', NULL),
(74, 'Semmering Railway', 15.830497, 47.639013, '2017-12-31 09:39:40.120223', NULL),
(75, 'Bagerhat', 89.7895478, 22.6602436, '2017-12-31 09:42:10.381704', NULL),
(76, 'mevlana', 32.717358, 37.2811, '2017-12-31 09:43:30.309304', NULL),
(77, 'Brugge', 3.22469950000004, 51.209348, '2017-12-31 09:43:46.831632', NULL),
(78, 'mostar ', 17.8077578, 43.3437748, '2017-12-31 09:45:32.743009', NULL),
(79, 'temple of prea', 100.2065541, 18.4773165, '2017-12-31 09:46:42.506922', NULL),
(80, 'Kaiping Diaolou', 112.586078, 22.36073, '2017-12-31 09:48:30.833052', NULL),
(81, 'Fujian Tulou', 116.726646, 24.716661, '2017-12-31 09:49:32.775920', NULL),
(82, 'Divriği Great Mosque', 38.1217119, 39.371077, '2017-12-31 09:53:42.581533', NULL),
(83, 'Pergamon', 13.3969, 52.521183, '2017-12-31 09:55:36.869468', NULL),
(84, 'Aphrodisias', 33.6904019999999, 36.157337, '2017-12-31 09:57:35.606531', NULL),
(85, 'andalu', -122.4240081, 37.7650146, '2017-12-31 12:01:07.887786', NULL),
(86, 'belem', -48.4901968, -1.4557794, '2017-12-31 12:05:10.423469', NULL),
(87, 'colossem', 12.4922309, 41.8902102, '2017-12-31 12:11:30.086544', NULL),
(88, 'pantheon', 12.4768729, 41.8986108, '2017-12-31 15:23:49.727250', NULL),
(89, 'Louvre', 2.33764399999995, 48.8606111, '2017-12-31 15:29:49.799814', NULL),
(90, 'manneken', -105.081285, 39.799515, '2017-12-31 15:55:09.196731', NULL),
(91, 'brandenburg gat', 13.3777041, 52.5162746, '2017-12-31 15:59:51.624653', NULL),
(92, 'St. vitus', -73.9551337, 40.7367758, '2017-12-31 16:06:08.124761', NULL),
(93, 'Restaurant Pallas Athene, Staudingerstraße, Münih, Bruck, Almanya', 11.631949, 48.111784, '2017-12-31 16:11:25.439698', NULL),
(94, 'Astronomical clock, Memed Abashidze Avenue, Batum, Gürcistan', 41.6375473000001, 41.6511384, '2017-12-31 16:18:14.737077', NULL),
(95, 'golden gate', -122.4782551, 37.8199286, '2017-12-31 16:22:25.585622', NULL),
(96, 'beij', 116.4073963, 39.9041999, '2017-12-31 18:28:14.262509', NULL),
(97, 'vatican', 12.453389, 41.902916, '2017-12-31 18:31:12.111156', NULL),
(98, 'sai', 73.7950802, 15.621332, '2017-12-31 18:33:43.452372', NULL),
(99, 'sicil', -86.4871741, 38.7313434, '2017-12-31 18:37:16.152360', NULL),
(100, 'peki', 20.4879490000001, 44.7612444, '2017-12-31 18:39:45.824893', NULL),
(101, 'xi', 108.93977, 34.341574, '2017-12-31 18:43:55.306612', NULL),
(102, 'çorum', 34.9537242, 40.5499256, '2017-12-31 19:01:42.190036', NULL),
(103, 'prag', 14.4378005, 50.0755381, '2017-12-31 19:06:43.694720', NULL),
(104, 'tü', -95.946, 36.1519879, '2017-12-31 19:16:43.628321', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `base_media`
--

CREATE TABLE `base_media` (
  `id` int(11) NOT NULL,
  `mediaType` varchar(100) COLLATE utf8mb4_bin NOT NULL,
  `extension` varchar(100) COLLATE utf8mb4_bin NOT NULL,
  `name` varchar(200) COLLATE utf8mb4_bin NOT NULL,
  `item_id` int(11) DEFAULT NULL,
  `created_at` datetime(6) NOT NULL,
  `created_by_id` int(11) DEFAULT NULL,
  `file` varchar(100) COLLATE utf8mb4_bin DEFAULT NULL,
  `url` varchar(200) COLLATE utf8mb4_bin DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

--
-- Dumping data for table `base_media`
--

INSERT INTO `base_media` (`id`, `mediaType`, `extension`, `name`, `item_id`, `created_at`, `created_by_id`, `file`, `url`) VALUES
(7, 'video', 'youtube', '', 11, '2017-12-03 16:38:39.711476', 3, '', 'https://www.youtube.com/watch?v=3k6RD9zVvpE'),
(8, 'video', 'youtube', '', 11, '2017-12-03 16:39:25.070357', 3, '', 'https://www.youtube.com/watch?v=3k6RD9zVvpE'),
(9, 'video', 'youtube', '', 11, '2017-12-03 16:46:32.718074', 3, '', 'https://www.youtube.com'),
(10, 'video', 'youtube', '', 11, '2017-12-03 16:48:35.867925', 3, '', 'https://www.youtube.com'),
(11, 'video', 'youtube', '', 11, '2017-12-03 16:48:36.842865', 3, '', 'https://www.youtube.com'),
(12, 'video', 'youtube', '', 11, '2017-12-03 16:48:37.641572', 3, '', 'https://www.youtube.com'),
(13, 'video', 'youtube', '', 11, '2017-12-03 16:48:37.651116', 3, '', 'https://www.youtube.com'),
(14, 'video', 'youtube', '', 11, '2017-12-03 16:48:38.008518', 3, '', 'https://www.youtube.com'),
(15, 'video', 'youtube', '', 11, '2017-12-03 16:48:49.214873', 3, '', 'https://www.youtube.com'),
(16, 'video', 'youtube', '', 11, '2017-12-03 16:51:54.968863', 3, '', 'https://www.youtube.com'),
(26, 'image', 'png', 'Screen Shot 2017-12-04 at 3.08.12 PM', 16, '2017-12-04 12:08:27.498768', 9, 'item/Screen_Shot_2017-12-04_at_3.08.12_PM.png', NULL),
(27, 'video', 'youtube', '', 24, '2017-12-04 14:59:46.274992', 9, '', 'https://www.youtube.com/watch?v=le9VUp6h7iM'),
(34, 'image', 'jpg', 'pan-greek-god-photo-researchers', 35, '2017-12-06 15:59:44.199024', 7, 'item/pan-greek-god-photo-researchers.jpg', NULL),
(35, 'video', 'youtube', '', 37, '2017-12-06 16:04:22.562577', 18, '', 'https://www.youtube.com/watch?v=fGzISmJzyi8'),
(36, 'image', 'jpg', 'maxresdefault', 37, '2017-12-06 16:04:50.375885', 18, 'item/maxresdefault.jpg', NULL),
(37, 'image', 'jpg', 'maxresdefault', 37, '2017-12-06 16:04:50.501234', 18, 'item/maxresdefault_ch0a5WH.jpg', NULL),
(38, 'image', 'png', 'Screen Shot 2017-12-06 at 7.47.10 PM', 39, '2017-12-06 16:47:31.330056', 9, 'item/Screen_Shot_2017-12-06_at_7.47.10_PM.png', NULL),
(39, 'image', 'jpg', 'Bosphorus_University', 41, '2017-12-06 17:34:17.634335', 3, 'item/Bosphorus_University.jpg', NULL),
(40, 'video', 'youtube', '', 36, '2017-12-06 19:57:19.911371', 28, '', 'https://www.youtube.com/watch?v=pZvlh9ef_m4'),
(41, 'image', 'jpg', 'hyp1', 54, '2017-12-06 21:09:18.143250', 29, 'item/hyp1.jpg', NULL),
(44, 'video', 'youtube', '', 55, '2017-12-06 21:37:13.416417', 29, '', 'https://www.youtube.com/watch?v=Xbmnawre7xk'),
(46, 'video', 'youtube', '', 58, '2017-12-07 06:52:05.060994', 23, '', 'https://www.youtube.com/watch?v=8TElA2vhMzE'),
(47, 'image', 'jpg', 'mermaid', 28, '2017-12-07 08:38:41.737134', 25, 'item/mermaid.jpg', NULL),
(48, 'image', 'jpg', 's-469a2b4f614591dc94b0b6825fc9cd11039baa1f', 58, '2017-12-07 09:59:12.321593', 28, 'item/s-469a2b4f614591dc94b0b6825fc9cd11039baa1f.jpg', NULL),
(50, 'image', 'png', 'Screen Shot 2017-12-07 at 1.08.12 PM', 58, '2017-12-07 10:08:27.462646', 9, 'item/Screen_Shot_2017-12-07_at_1.08.12_PM.png', NULL),
(51, 'image', 'png', 'QuickMemo+_2017-12-07-13-09-07', 57, '2017-12-07 10:09:53.639825', 23, 'item/QuickMemo_2017-12-07-13-09-07.png', NULL),
(52, 'video', 'youtube', '', 47, '2017-12-07 10:21:04.552374', 28, '', 'https://www.youtube.com/watch?v=haibIAXpkz8'),
(53, 'image', 'jpg', 'IMG_1588', 45, '2017-12-07 10:48:02.710610', 32, 'item/IMG_1588.JPG', NULL),
(54, 'image', 'jpg', 'IMG_1588', 45, '2017-12-07 10:49:05.506150', 32, 'item/IMG_1588_sqkfqhV.JPG', NULL),
(55, 'image', 'jpg', 'IMG_1588', 42, '2017-12-07 11:18:09.605465', 32, 'item/IMG_1588_ZbnY0tG.JPG', NULL),
(68, 'video', 'youtube', '', 47, '2017-12-26 18:39:22.679668', 29, '', 'https://www.youtube.com/watch?v=zHdjVORHKPA'),
(69, 'video', 'youtube', '', 47, '2017-12-26 19:12:47.369233', 29, '', 'https://www.youtube.com/watch?v=zHdjVORHKPA'),
(70, 'video', 'youtube', '', 47, '2017-12-26 19:15:19.161426', 29, '', 'https://www.youtube.com/watch?v=zHdjVORHKPA'),
(71, 'video', 'youtube', '', 47, '2017-12-26 19:15:58.608115', 29, '', 'https://www.youtube.com/watch?v=zHdjVORHKPA'),
(72, 'video', 'youtube', '', 40, '2017-12-26 19:16:28.863360', 29, '', 'https://www.youtube.com/watch?v=2D2jkKde8ZU'),
(73, 'video', 'youtube', '', 40, '2017-12-26 19:20:29.876223', 29, '', 'https://www.youtube.com/watch?v=2D2jkKde8ZU'),
(74, 'video', 'youtube', '', 47, '2017-12-26 22:24:50.037343', 29, '', 'https://www.youtube.com/watch?v=J5eLFREBpIA'),
(95, 'video', 'youtube', '', 47, '2017-12-27 20:09:07.690758', 29, '', 'https://www.youtube.com/watch?v=664ZOtRYAsY'),
(96, 'video', 'youtube', '', 47, '2017-12-27 20:09:14.570705', 29, '', 'https://www.youtube.com/watch?v=664ZOtRYAsY'),
(97, 'video', 'youtube', '', 39, '2017-12-27 20:10:32.545602', 29, '', 'https://www.youtube.com/watch?v=JQs4QyKnYMQ'),
(99, 'image', 'png', 'item', 102, '2017-12-27 21:50:41.368048', 9, 'item/item_0p2sCYv.png', NULL),
(102, 'image', 'png', 'Screen Shot 2017-12-28 at 12.18.39 PM', 102, '2017-12-28 09:18:55.884287', 9, 'item/Screen_Shot_2017-12-28_at_12.18.39_PM.png', NULL),
(105, 'image', 'png', 'item', 107, '2017-12-28 09:38:24.797653', 9, 'item/item_G6LYpBq.png', NULL),
(106, 'image', 'jpeg', 'item', 108, '2017-12-28 09:40:18.338418', 18, 'item/item_lsPHRL7.jpeg', NULL),
(107, 'image', 'png', 'item', 109, '2017-12-28 09:42:20.811608', 9, 'item/item_3qJGbDo.png', NULL),
(108, 'image', 'png', 'item', 110, '2017-12-28 09:44:33.454672', 9, 'item/item_n8D7i5R.png', NULL),
(109, 'image', 'png', 'item', 111, '2017-12-28 09:48:00.452651', 9, 'item/item_JAoIOhx.png', NULL),
(110, 'image', 'png', 'item', 112, '2017-12-28 09:52:40.906452', 9, 'item/item_af3KpAx.png', NULL),
(112, 'image', 'png', 'item', 114, '2017-12-28 09:59:44.508236', 9, 'item/item_NyjVL7h.png', NULL),
(114, 'image', 'png', 'item', 116, '2017-12-28 10:03:19.782972', 9, 'item/item_Ljugvxg.png', NULL),
(115, 'image', 'png', 'item', 117, '2017-12-28 10:07:31.983908', 9, 'item/item_jS7qpid.png', NULL),
(116, 'image', 'jpg', 'yildiz-palace-royal-garden-ulus-park-1', 117, '2017-12-28 10:12:56.813553', 28, 'item/yildiz-palace-royal-garden-ulus-park-1.jpg', NULL),
(117, 'image', 'png', 'item', 118, '2017-12-28 10:18:33.059334', 9, 'item/item_gcuG3ef.png', NULL),
(119, 'image', 'png', 'item', 120, '2017-12-28 10:24:26.967857', 9, 'item/item_RQaTMM5.png', NULL),
(121, 'image', 'png', 'item', 122, '2017-12-28 10:33:34.990793', 7, 'item/item_YtgijTn.png', NULL),
(122, 'image', 'png', 'item', 123, '2017-12-28 10:38:51.355294', 7, 'item/item_BtLZSKX.png', NULL),
(124, 'image', 'jpeg', 'item', 124, '2017-12-28 10:41:26.236835', 3, 'item/item_jXoiJvb.jpeg', NULL),
(126, 'image', 'png', 'item', 125, '2017-12-28 10:42:17.194452', 27, 'item/item_PtkHXii.png', NULL),
(127, 'image', 'png', 'item', 126, '2017-12-28 10:45:25.487692', 7, 'item/item_0HZAVlE.png', NULL),
(128, 'image', 'png', 'item', 127, '2017-12-28 10:50:04.184676', 7, 'item/item_QqmRk80.png', NULL),
(129, 'image', 'png', 'Screen Shot 2017-12-28 at 1.53.33 PM', 120, '2017-12-28 10:53:52.061192', 7, 'item/Screen_Shot_2017-12-28_at_1.53.33_PM.png', NULL),
(130, 'image', 'png', 'item', 128, '2017-12-28 10:56:43.409812', 27, 'item/item_sPRij59.png', NULL),
(133, 'image', 'png', 'item', 130, '2017-12-28 10:59:51.939525', 7, 'item/item_K6egk6i.png', NULL),
(134, 'image', 'png', 'Screen Shot 2017-12-28 at 1.57.38 PM', 130, '2017-12-28 11:00:08.801019', 7, 'item/Screen_Shot_2017-12-28_at_1.57.38_PM.png', NULL),
(135, 'image', 'png', 'Screen Shot 2017-12-28 at 2.05.11 PM', 125, '2017-12-28 11:05:26.037878', 7, 'item/Screen_Shot_2017-12-28_at_2.05.11_PM.png', NULL),
(136, 'image', 'jpeg', 'item', 131, '2017-12-28 11:05:44.278571', 25, 'item/item_2cAy6rG.jpeg', NULL),
(137, 'image', 'jpg', 'RYzXUSQOgiX3T5BFfolArgwEiI4', 131, '2017-12-28 11:07:10.898155', 25, 'item/RYzXUSQOgiX3T5BFfolArgwEiI4.jpg', NULL),
(138, 'image', 'jpg', 'A-1', 131, '2017-12-28 11:07:46.531566', 25, 'item/A-1.jpg', NULL),
(139, 'image', 'jpg', 'kang', 131, '2017-12-28 11:08:55.487629', 25, 'item/kang.jpg', NULL),
(140, 'video', 'youtube', '', 109, '2017-12-28 11:09:07.595529', 7, '', 'https://www.youtube.com/watch?v=l6Td86u3cd8'),
(141, 'image', 'png', 'item', 132, '2017-12-28 11:14:50.301961', 27, 'item/item_OKUWNxT.png', NULL),
(142, 'image', 'jpeg', 'item', 133, '2017-12-28 11:17:01.623134', 23, 'item/item_XL6cgRW.jpeg', NULL),
(143, 'image', 'png', 'item', 134, '2017-12-28 11:20:51.160691', 7, 'item/item_mfVIH9E.png', NULL),
(144, 'video', 'youtube', '', 109, '2017-12-28 11:46:27.657757', 3, '', 'https://www.youtube.com/watch?v=QJBWQqtwTgA'),
(147, 'video', 'youtube', '', 128, '2017-12-28 11:53:38.537046', 3, '', 'https://www.youtube.com/watch?v=_ABoaAyhMZQ'),
(148, 'image', 'png', 'item', 135, '2017-12-28 11:54:25.042851', 27, 'item/item_qRxkRhV.png', NULL),
(150, 'image', 'png', 'item', 136, '2017-12-28 12:05:12.438220', 27, 'item/item_6gIvL3i.png', NULL),
(151, 'image', 'png', 'item', 137, '2017-12-28 12:26:25.319699', 9, 'item/item_Pwd8oNV.png', NULL),
(152, 'video', 'youtube', '', 55, '2017-12-28 12:28:19.952195', 29, '', 'https://www.youtube.com/watch?v=c1ivrVbzUGw'),
(153, 'image', 'png', 'item', 138, '2017-12-28 12:28:37.091408', 27, 'item/item_j21TtIu.png', NULL),
(154, 'image', 'png', 'item', 139, '2017-12-28 12:28:59.547663', 9, 'item/item_sMgSBZx.png', NULL),
(155, 'image', 'jpg', 'duman_yeni02', 55, '2017-12-28 12:29:11.406045', 18, 'item/duman_yeni02.jpg', NULL),
(156, 'image', 'jpg', '1200px-Safranbolu_arasta', 137, '2017-12-28 12:30:11.940444', 18, 'item/1200px-Safranbolu_arasta.jpg', NULL),
(157, 'video', 'youtube', '', 39, '2017-12-28 12:48:22.969777', 29, '', 'https://www.youtube.com/watch?v=Rqy-F5ib1nU'),
(158, 'video', 'youtube', '', 39, '2017-12-28 12:48:49.810417', 29, '', 'https://www.youtube.com/watch?v=Rqy-F5ib1nU'),
(159, 'video', 'youtube', '', 39, '2017-12-28 12:48:50.004050', 29, '', 'https://www.youtube.com/watch?v=Rqy-F5ib1nU'),
(162, 'image', 'png', 'item', 140, '2017-12-28 13:08:55.987862', 18, 'item/item_sqdh3Rq.png', NULL),
(163, 'video', 'youtube', '', 140, '2017-12-28 13:09:22.458723', 29, '', 'https://www.youtube.com/watch?v=Q0CbN8sfihY'),
(164, 'video', 'youtube', '', 139, '2017-12-28 13:10:49.500857', 3, '', 'https://www.youtube.com/watch?v=1TRMNQHj41U'),
(165, 'image', 'jpg', 'Star-Wars-1200x675', 140, '2017-12-28 13:18:06.347419', 3, 'item/Star-Wars-1200x675.jpg', NULL),
(167, 'image', 'jpeg', 'item', 142, '2017-12-28 13:28:57.943003', 18, 'item/item_zUyf62q.jpeg', NULL),
(170, 'video', 'youtube', '', 43, '2017-12-28 13:47:16.863440', 18, '', 'https://www.youtube.com/watch?v=-AuTDKjfdyc'),
(175, 'video', 'youtube', '', 124, '2017-12-28 16:36:37.886440', 29, '', 'https://www.youtube.com/watch?v=Y3SACYjAu7U'),
(176, 'image', 'jpeg', 'item', 145, '2017-12-28 16:38:56.361873', 18, 'item/item_UM3Dcnl.jpeg', NULL),
(177, 'image', 'jpg', '20171228_194256', 131, '2017-12-28 16:43:04.865583', 23, 'item/20171228_194256.jpg', NULL),
(178, 'image', 'jpeg', 'item', 146, '2017-12-28 21:28:34.244338', 32, 'item/item_QOj5N6n.jpeg', NULL),
(179, 'image', 'jpg', 'site_1018_0016-750-0-20150610132534', 146, '2017-12-28 21:32:36.708190', 32, 'item/site_1018_0016-750-0-20150610132534.jpg', NULL),
(180, 'image', 'jpeg', 'item', 147, '2017-12-29 20:11:46.144128', 23, 'item/item_Anby6z4.jpeg', NULL),
(181, 'image', 'jpeg', 'item', 148, '2017-12-29 20:15:13.476748', 23, 'item/item_uE3RTpI.jpeg', NULL),
(182, 'image', 'jpeg', 'item', 149, '2017-12-30 11:57:39.643318', 23, 'item/item_jBJ3Bza.jpeg', NULL),
(183, 'image', 'jpeg', 'item', 150, '2017-12-30 12:00:52.382077', 23, 'item/item_uRzCcAV.jpeg', NULL),
(184, 'image', 'jpeg', 'item', 151, '2017-12-30 12:05:40.247800', 23, 'item/item_9r2DxOO.jpeg', NULL),
(185, 'image', 'jpeg', 'item', 152, '2017-12-30 15:22:29.277988', 18, 'item/item_DhHbQ9c.jpeg', NULL),
(186, 'image', 'jpeg', 'item', 153, '2017-12-30 15:28:40.726287', 18, 'item/item_XTYURat.jpeg', NULL),
(187, 'image', 'jpeg', 'item', 154, '2017-12-30 15:29:58.450130', 18, 'item/item_scioQ3Q.jpeg', NULL),
(188, 'video', 'youtube', '', 154, '2017-12-30 15:30:14.526204', 18, '', 'https://www.youtube.com/watch?v=42yO2FUWL6A'),
(189, 'image', 'jpeg', 'item', 155, '2017-12-30 18:38:37.396747', 18, 'item/item_hoJFRne.jpeg', NULL),
(190, 'video', 'youtube', '', 155, '2017-12-30 18:38:57.967060', 18, '', 'https://www.youtube.com/watch?v=k89lemE4bIc'),
(191, 'image', 'jpeg', 'item', 156, '2017-12-30 18:42:34.865623', 18, 'item/item_pgjywyw.jpeg', NULL),
(192, 'video', 'youtube', '', 156, '2017-12-30 18:42:51.172748', 18, '', 'https://www.youtube.com/watch?v=kEvIiOvOT0Q'),
(193, 'image', 'png', 'item', 157, '2017-12-30 20:49:58.861219', 18, 'item/item_HNyN0mx.png', NULL),
(194, 'image', 'jpeg', 'item', 158, '2017-12-30 20:54:46.758933', 18, 'item/item_9w1tbqO.jpeg', NULL),
(195, 'image', 'jpg', 'vintage-sami-people-and-arctic-1900s-03', 158, '2017-12-30 20:55:00.986836', 18, 'item/vintage-sami-people-and-arctic-1900s-03.jpg', NULL),
(196, 'video', 'youtube', '', 158, '2017-12-30 20:55:18.884683', 18, '', 'https://www.youtube.com/watch?v=B2WpJHzbbpc'),
(197, 'image', 'jpeg', 'item', 159, '2017-12-30 20:58:58.583262', 18, 'item/item_HZ97n1R.jpeg', NULL),
(198, 'image', 'jpeg', 'item', 160, '2017-12-31 07:33:42.842548', 7, 'item/item_SOtGHtW.jpeg', NULL),
(199, 'image', 'jpeg', 'item', 161, '2017-12-31 07:41:22.899599', 7, 'item/item_ZDjBJdO.jpeg', NULL),
(200, 'image', 'jpeg', 'item', 162, '2017-12-31 07:47:16.543974', 7, 'item/item_sWJaqUW.jpeg', NULL),
(201, 'image', 'png', 'item', 163, '2017-12-31 07:49:39.271862', 9, 'item/item_Ni6gjH0.png', NULL),
(202, 'image', 'jpeg', 'item', 164, '2017-12-31 07:51:33.527118', 7, 'item/item_7qrkYbK.jpeg', NULL),
(203, 'image', 'png', 'item', 165, '2017-12-31 07:58:14.291465', 9, 'item/item_LEM0Rfp.png', NULL),
(204, 'image', 'jpeg', 'item', 166, '2017-12-31 07:58:25.995162', 7, 'item/item_S1LUUrq.jpeg', NULL),
(205, 'image', 'png', 'item', 167, '2017-12-31 08:03:08.351080', 9, 'item/item_ZATp6Nz.png', NULL),
(206, 'image', 'jpeg', 'item', 168, '2017-12-31 08:05:07.519432', 7, 'item/item_hmFgy4P.jpeg', NULL),
(207, 'video', 'youtube', '', 168, '2017-12-31 08:05:49.681493', 7, '', 'https://www.youtube.com/watch?v=YJrA7VWidLY'),
(208, 'image', 'png', 'item', 169, '2017-12-31 08:07:19.919820', 9, 'item/item_vnnvU8F.png', NULL),
(209, 'image', 'png', 'item', 170, '2017-12-31 08:14:12.627164', 9, 'item/item_y57QHKd.png', NULL),
(210, 'image', 'jpeg', 'item', 171, '2017-12-31 08:19:44.011383', 7, 'item/item_L5vq7dw.jpeg', NULL),
(211, 'video', 'youtube', '', 171, '2017-12-31 08:20:31.309312', 7, '', 'https://www.youtube.com/watch?v=iRJxKv5W7Nw'),
(212, 'image', 'png', 'item', 172, '2017-12-31 08:21:10.642208', 9, 'item/item_HJtS7wR.png', NULL),
(213, 'image', 'jpeg', 'item', 173, '2017-12-31 08:24:15.951369', 7, 'item/item_l53qdWL.jpeg', NULL),
(214, 'image', 'png', 'item', 174, '2017-12-31 08:27:40.560959', 9, 'item/item_Z2gnjeI.png', NULL),
(215, 'image', 'jpeg', 'item', 175, '2017-12-31 08:28:33.335648', 7, 'item/item_7sAOo1r.jpeg', NULL),
(216, 'video', 'youtube', '', 175, '2017-12-31 08:29:47.914968', 7, '', 'https://www.youtube.com/watch?v=p3LJXdyrh4A'),
(217, 'image', 'png', 'item', 176, '2017-12-31 08:40:56.359306', 9, 'item/item_Xxfthwp.png', NULL),
(218, 'image', 'jpeg', 'item', 177, '2017-12-31 08:41:02.848963', 7, 'item/item_KgdVupT.jpeg', NULL),
(219, 'video', 'youtube', '', 177, '2017-12-31 08:41:19.022597', 7, '', 'https://www.youtube.com/watch?v=HrtRfOUYrMI'),
(220, 'image', 'png', 'item', 178, '2017-12-31 08:44:25.823851', 9, 'item/item_1Bb31Q4.png', NULL),
(221, 'image', 'png', 'item', 179, '2017-12-31 08:48:46.047115', 9, 'item/item_Dij75PJ.png', NULL),
(222, 'image', 'jpeg', 'item', 180, '2017-12-31 08:50:27.640712', 7, 'item/item_RFDQ6vx.jpeg', NULL),
(223, 'image', 'jpeg', 'item', 181, '2017-12-31 09:39:40.174835', 28, 'item/item_3BqSpnV.jpeg', NULL),
(224, 'image', 'jpeg', 'item', 182, '2017-12-31 09:40:30.976803', 23, 'item/item_h892G4a.jpeg', NULL),
(225, 'image', 'jpeg', 'item', 183, '2017-12-31 09:42:10.403714', 28, 'item/item_yzyYaHw.jpeg', NULL),
(226, 'image', 'jpeg', 'item', 184, '2017-12-31 09:43:30.350833', 23, 'item/item_tm5SPAc.jpeg', NULL),
(227, 'image', 'jpeg', 'item', 185, '2017-12-31 09:43:46.867868', 28, 'item/item_DKguz2y.jpeg', NULL),
(228, 'image', 'jpeg', 'item', 186, '2017-12-31 09:45:32.765795', 28, 'item/item_vhiXopO.jpeg', NULL),
(229, 'image', 'jpeg', 'item', 187, '2017-12-31 09:46:42.524439', 28, 'item/item_VsP7qap.jpeg', NULL),
(230, 'image', 'jpeg', 'item', 188, '2017-12-31 09:48:30.850949', 28, 'item/item_ti9OUAp.jpeg', NULL),
(231, 'image', 'jpeg', 'item', 189, '2017-12-31 09:49:32.802100', 28, 'item/item_eJrSysW.jpeg', NULL),
(233, 'image', 'jpeg', 'item', 191, '2017-12-31 09:53:42.615798', 28, 'item/item_CqF7dE3.jpeg', NULL),
(234, 'image', 'jpeg', 'item', 192, '2017-12-31 09:55:36.895221', 28, 'item/item_sU3jf7B.jpeg', NULL),
(235, 'image', 'jpeg', 'item', 193, '2017-12-31 09:57:35.632570', 28, 'item/item_0AP5tYL.jpeg', NULL),
(236, 'image', 'png', 'item', 194, '2017-12-31 11:54:21.495900', 39, 'item/item_dfPntAD.png', NULL),
(237, 'image', 'jpeg', 'item', 195, '2017-12-31 12:01:07.935938', 18, 'item/item_cLcvqAO.jpeg', NULL),
(238, 'video', 'youtube', '', 195, '2017-12-31 12:01:25.741690', 18, '', 'https://www.youtube.com/watch?v=XNhfV_53W7A'),
(239, 'image', 'jpeg', 'item', 196, '2017-12-31 12:05:10.471509', 18, 'item/item_XMD8rZC.jpeg', NULL),
(240, 'image', 'jpeg', 'item', 197, '2017-12-31 12:11:30.113771', 32, 'item/item_G7MoKBk.jpeg', NULL),
(242, 'image', 'jpeg', 'item', 199, '2017-12-31 15:23:49.755250', 32, 'item/item_GePpQQ0.jpeg', NULL),
(243, 'image', 'jpeg', 'item', 200, '2017-12-31 15:29:49.829886', 32, 'item/item_Z4Fs7tP.jpeg', NULL),
(244, 'image', 'jpeg', 'item', 201, '2017-12-31 15:55:09.225989', 32, 'item/item_yQTFcof.jpeg', NULL),
(245, 'image', 'jpeg', 'item', 202, '2017-12-31 15:59:51.654890', 32, 'item/item_CSS6GcN.jpeg', NULL),
(246, 'image', 'jpeg', 'item', 203, '2017-12-31 16:06:08.155318', 32, 'item/item_85Vr4J0.jpeg', NULL),
(247, 'image', 'jpeg', 'item', 204, '2017-12-31 16:11:25.459920', 32, 'item/item_FzCqW0P.jpeg', NULL),
(248, 'image', 'jpeg', 'item', 205, '2017-12-31 16:18:14.765337', 32, 'item/item_RG2HCAq.jpeg', NULL),
(249, 'image', 'jpeg', 'item', 206, '2017-12-31 16:22:25.626877', 32, 'item/item_55DgZ1a.jpeg', NULL),
(250, 'image', 'jpeg', 'item', 207, '2017-12-31 18:28:14.302178', 25, 'item/item_U7nN5bc.jpeg', NULL),
(251, 'image', 'jpeg', 'item', 208, '2017-12-31 18:31:12.148009', 25, 'item/item_3M4knBr.jpeg', NULL),
(252, 'image', 'jpeg', 'item', 209, '2017-12-31 18:33:43.489451', 25, 'item/item_cckArw0.jpeg', NULL),
(253, 'image', 'jpeg', 'item', 210, '2017-12-31 18:37:16.206404', 25, 'item/item_E1shPBv.jpeg', NULL),
(254, 'image', 'jpeg', 'item', 211, '2017-12-31 18:39:45.867280', 25, 'item/item_HzYCPl6.jpeg', NULL),
(255, 'image', 'jpg', 'forbidden city', 211, '2017-12-31 18:40:07.609820', 25, 'item/forbidden_city.jpg', NULL),
(256, 'image', 'jpeg', 'item', 212, '2017-12-31 18:43:55.349068', 25, 'item/item_4wKz7RX.jpeg', NULL),
(257, 'image', 'jpg', 'soliders2', 212, '2017-12-31 18:44:37.239298', 25, 'item/soliders2.jpg', NULL),
(258, 'image', 'jpeg', 'item', 213, '2017-12-31 19:01:42.234952', 25, 'item/item_XYxqH5X.jpeg', NULL),
(259, 'image', 'jpeg', 'item', 214, '2017-12-31 19:06:43.727684', 25, 'item/item_b5FnMUU.jpeg', NULL),
(260, 'image', 'jpeg', 'item', 215, '2017-12-31 19:06:55.354409', 25, 'item/item_1GqDhJn.jpeg', NULL),
(261, 'image', 'jpeg', 'item', 216, '2017-12-31 19:08:41.605432', 25, 'item/item_L6VuW3B.jpeg', NULL),
(262, 'image', 'jpeg', 'item', 217, '2017-12-31 19:10:09.467507', 25, 'item/item_svfiHtM.jpeg', NULL),
(263, 'image', 'jpeg', 'item', 218, '2017-12-31 19:10:20.421965', 25, 'item/item_JI9plOG.jpeg', NULL),
(264, 'image', 'jpeg', 'item', 219, '2017-12-31 19:12:22.958033', 25, 'item/item_uJbHoAv.jpeg', NULL),
(265, 'image', 'jpeg', 'item', 220, '2017-12-31 19:13:51.271274', 25, 'item/item_vj1pmtq.jpeg', NULL),
(266, 'image', 'jpg', 'bridge2', 220, '2017-12-31 19:14:09.867954', 25, 'item/bridge2.jpg', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `base_profile`
--

CREATE TABLE `base_profile` (
  `id` int(11) NOT NULL,
  `fullName` varchar(500) COLLATE utf8mb4_bin DEFAULT NULL,
  `location` varchar(500) COLLATE utf8mb4_bin DEFAULT NULL,
  `birthday` date DEFAULT NULL,
  `moderatorDate` datetime(6) DEFAULT NULL,
  `photo` varchar(100) COLLATE utf8mb4_bin DEFAULT NULL,
  `user_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

--
-- Dumping data for table `base_profile`
--

INSERT INTO `base_profile` (`id`, `fullName`, `location`, `birthday`, `moderatorDate`, `photo`, `user_id`) VALUES
(1, NULL, NULL, NULL, NULL, '', 1),
(2, NULL, NULL, NULL, NULL, '', 2),
(3, 'Enes', 'deneme', NULL, NULL, '', 3),
(4, NULL, NULL, NULL, NULL, '', 4),
(8, 'Olcay', NULL, '1990-01-01', NULL, 'profile/item_8r8cHjn.jpeg', 7),
(9, NULL, NULL, NULL, NULL, '', 8),
(10, 'Hilal Benzer', NULL, '1995-07-10', NULL, 'profile/item_Rd25dUh.png', 9),
(11, NULL, NULL, NULL, NULL, '', 10),
(12, NULL, NULL, NULL, NULL, '', 11),
(13, NULL, NULL, NULL, NULL, '', 12),
(14, NULL, NULL, NULL, NULL, '', 13),
(15, NULL, NULL, NULL, NULL, '', 14),
(16, NULL, NULL, NULL, NULL, '', 15),
(17, NULL, NULL, NULL, NULL, '', 16),
(18, 'guest', NULL, NULL, NULL, '', 17),
(19, 'Kaan Uzdogan', NULL, '1993-12-09', NULL, 'profile/item_AuAwZEZ.jpeg', 18),
(20, NULL, NULL, NULL, NULL, '', 19),
(21, NULL, NULL, NULL, NULL, '', 20),
(22, NULL, NULL, NULL, NULL, '', 21),
(23, 'mrg', '', NULL, NULL, 'profile/item_aRyxJSL.png', 22),
(24, 'Riza Ozcelik', NULL, '1996-01-21', NULL, 'profile/item_C9rmzdu.png', 23),
(25, NULL, NULL, NULL, NULL, '', 24),
(26, 'ezgiy', NULL, '1995-04-10', NULL, 'profile/item_Bm4KWct.jpeg', 25),
(27, NULL, NULL, NULL, NULL, '', 26),
(28, 'Barin Ozmen', 'Istanbul', '1994-03-22', NULL, 'profile/item_5EcQ7Xm.png', 27),
(29, 'Enes Çakır', NULL, '1995-03-18', NULL, 'profile/item_q7TYsRh.jpeg', 28),
(30, 'Abdullatif Koksal', NULL, '1995-08-10', NULL, 'profile/item_cbzuDVy.png', 29),
(31, NULL, NULL, NULL, NULL, '', 30),
(32, 'Halil Kalkan', NULL, '1995-06-09', NULL, 'profile/item_Kud6pUk.png', 31),
(33, 'Halil Kalkan', NULL, '1995-06-08', NULL, 'profile/item_bH3vmjI.png', 32),
(34, NULL, NULL, NULL, NULL, '', 33),
(35, '', '', NULL, NULL, 'profile/item_bvP62zp.png', 34),
(36, NULL, NULL, NULL, NULL, '', 35),
(37, NULL, NULL, NULL, NULL, '', 36),
(40, 'Oceans Eleven', 'Istanbul', '1994-01-01', NULL, 'profile/item_F05qcrF.png', 39),
(41, NULL, NULL, NULL, NULL, '', 40);

-- --------------------------------------------------------

--
-- Table structure for table `base_report`
--

CREATE TABLE `base_report` (
  `id` int(11) NOT NULL,
  `item_id` int(11) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `created_at` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

--
-- Dumping data for table `base_report`
--

INSERT INTO `base_report` (`id`, `item_id`, `user_id`, `created_at`) VALUES
(85, 36, 9, '2017-12-28 10:10:52.699464'),
(90, 36, 7, '2017-12-28 10:51:15.374672'),
(91, 127, 3, '2017-12-28 10:54:32.928199'),
(92, 55, 7, '2017-12-28 11:13:32.735626'),
(93, 36, 27, '2017-12-28 11:15:41.276398'),
(107, 36, 18, '2017-12-28 12:06:01.749941'),
(120, 125, 27, '2017-12-28 13:50:30.842732'),
(123, 36, 23, '2017-12-28 16:44:04.750383'),
(124, 195, 18, '2017-12-31 12:01:41.076193'),
(126, 195, 9, '2017-12-31 12:33:25.569355'),
(127, 195, 28, '2017-12-31 12:34:11.401506'),
(128, 205, 32, '2017-12-31 16:19:42.715355');

-- --------------------------------------------------------

--
-- Table structure for table `base_tag`
--

CREATE TABLE `base_tag` (
  `id` int(11) NOT NULL,
  `name` varchar(200) COLLATE utf8mb4_bin NOT NULL,
  `created_by_id` int(11) DEFAULT NULL,
  `created_at` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

--
-- Dumping data for table `base_tag`
--

INSERT INTO `base_tag` (`id`, `name`, `created_by_id`, `created_at`) VALUES
(1, 'mount', 1, '2017-11-23 12:14:27.478364'),
(2, 'nemrut', 1, '2017-11-23 12:14:27.490158'),
(3, 'pamukkale', 3, '2017-12-02 18:13:29.651928'),
(4, 'beauty', 3, '2017-12-02 18:13:29.663197'),
(5, 'pamuk', 3, '2017-12-02 19:25:30.963497'),
(6, 'kale', 3, '2017-12-02 19:25:30.974564'),
(7, 'denizli', 3, '2017-12-02 19:25:30.989170'),
(8, 'rome', 3, '2017-12-02 23:58:33.526968'),
(9, 'colosseum', 3, '2017-12-02 23:58:33.538453'),
(10, 'italy', 3, '2017-12-02 23:58:33.551333'),
(11, 'eiffel', 3, '2017-12-03 00:01:57.749948'),
(12, 'paris', 3, '2017-12-03 00:01:57.761320'),
(13, 'france', 3, '2017-12-03 00:01:57.773542'),
(14, 'de', 7, '2017-12-03 12:06:18.178753'),
(15, 'ne', 7, '2017-12-03 12:06:18.190774'),
(16, 'me', 7, '2017-12-03 12:06:18.203495'),
(17, 'istanbul', 9, '2017-12-03 15:04:28.347574'),
(18, 'mosque', 9, '2017-12-03 15:04:28.361140'),
(19, 'museum', 9, '2017-12-03 15:04:28.371102'),
(20, 'asdas', 3, '2017-12-03 17:44:47.405569'),
(21, 'asd', 3, '2017-12-03 19:24:48.424164'),
(22, 'tower', 9, '2017-12-04 14:41:11.356155'),
(23, 'üsküdar', 9, '2017-12-04 14:41:11.370096'),
(24, 'tokyo', 9, '2017-12-04 14:44:23.367205'),
(25, 'japan', 9, '2017-12-04 14:44:23.377854'),
(26, 'Halide Edip Adıvar', 9, '2017-12-04 14:51:27.799913'),
(27, 'book', 9, '2017-12-04 14:51:27.810598'),
(28, 'literature', 9, '2017-12-04 14:51:27.819552'),
(29, 'food', 9, '2017-12-04 14:55:56.790099'),
(30, 'Turkey', 9, '2017-12-04 14:55:56.805324'),
(31, 'bc', 7, '2017-12-04 18:30:06.098507'),
(32, 'deneme', 7, '2017-12-04 18:39:16.115212'),
(33, 'music', 7, '2017-12-05 13:24:50.351019'),
(34, 'Myth', 7, '2017-12-05 13:24:50.363705'),
(35, 'mythology', 7, '2017-12-05 13:24:50.375530'),
(36, 'greek', 7, '2017-12-05 13:24:50.387583'),
(37, 'greece', 7, '2017-12-05 13:24:50.399112'),
(38, 'instrument', 7, '2017-12-05 13:34:20.350840'),
(39, 'turkey', 7, '2017-12-05 13:34:20.361703'),
(40, 'middle east', 7, '2017-12-05 13:34:20.383476'),
(41, 'tradition', 7, '2017-12-05 13:34:20.395731'),
(42, '', 23, '2017-12-06 06:49:04.335359'),
(43, 'cool', 23, '2017-12-06 11:41:58.007497'),
(44, 'prof', 23, '2017-12-06 11:41:58.019044'),
(45, 'education', 23, '2017-12-06 11:41:58.029489'),
(46, 'Pan', 18, '2017-12-06 15:54:20.613082'),
(47, 'God', 18, '2017-12-06 15:54:20.623194'),
(48, 'Greek', 18, '2017-12-06 15:54:20.635306'),
(49, 'Mythology', 18, '2017-12-06 15:54:20.646064'),
(50, 'lyre', 25, '2017-12-06 15:54:50.390561'),
(51, 'movie', 25, '2017-12-06 15:54:50.401546'),
(52, 'gora', 25, '2017-12-06 15:54:50.411376'),
(53, 'ET', 25, '2017-12-06 15:54:50.422606'),
(54, 'Flute', 18, '2017-12-06 16:04:05.868510'),
(55, 'Music', 18, '2017-12-06 16:04:05.881844'),
(56, 'Goddess', 25, '2017-12-06 16:05:06.083382'),
(57, 'myth', 9, '2017-12-06 16:46:52.319750'),
(58, 'singer', 9, '2017-12-06 17:00:09.433550'),
(59, 'anatolian rock', 9, '2017-12-06 17:00:09.443167'),
(60, 'pyramid', 27, '2017-12-06 17:59:25.303437'),
(61, 'egypt', 27, '2017-12-06 17:59:25.315518'),
(62, 'reed', 27, '2017-12-06 18:04:26.608116'),
(63, 'folk', 27, '2017-12-06 18:04:26.627324'),
(64, 'song', 27, '2017-12-06 18:04:26.638243'),
(65, 'musician', 28, '2017-12-06 19:56:09.946666'),
(66, 'poet', 28, '2017-12-06 19:56:09.957686'),
(67, 'dessert', 28, '2017-12-06 20:03:13.305293'),
(68, 'sweet', 28, '2017-12-06 20:03:13.317215'),
(69, 'Turkish', 28, '2017-12-06 20:03:13.326613'),
(70, 'ozan', 28, '2017-12-06 20:06:24.794501'),
(71, 'sleep', 29, '2017-12-06 20:58:33.525632'),
(72, 'sleeping', 29, '2017-12-06 20:58:33.535109'),
(73, 'hypnose', 29, '2017-12-06 20:58:33.545926'),
(74, 'rock', 29, '2017-12-06 21:13:22.939789'),
(75, 'anatolian', 29, '2017-12-06 21:13:22.950690'),
(76, 'album', 29, '2017-12-06 21:13:22.961669'),
(77, 'band', 29, '2017-12-06 21:13:22.974158'),
(78, 'power', 23, '2017-12-07 06:41:45.740312'),
(79, 'leader', 23, '2017-12-07 06:41:45.750799'),
(80, 'dance', 23, '2017-12-07 06:51:40.219195'),
(81, 'Anatolia', 23, '2017-12-07 06:51:40.230180'),
(82, 'Greece', 23, '2017-12-07 06:51:40.249159'),
(83, 'hieroglyph', 29, '2017-12-07 10:13:15.761897'),
(84, 'history', 29, '2017-12-07 10:13:15.773137'),
(85, 'enes', 28, '2017-12-23 13:52:49.951462'),
(86, 'co', 35, '2017-12-25 17:59:26.730434'),
(87, 'hos', 35, '2017-12-25 17:59:26.742575'),
(88, 'daha', 35, '2017-12-25 18:07:46.615536'),
(89, 'here', 35, '2017-12-25 18:11:43.978798'),
(90, 'tag', 35, '2017-12-25 18:43:27.266947'),
(91, 'tag2', 35, '2017-12-25 18:43:27.277737'),
(92, 'a', 35, '2017-12-25 18:44:19.520444'),
(93, 'b', 35, '2017-12-25 18:44:19.545430'),
(94, 'c', 35, '2017-12-25 18:44:19.561499'),
(95, 'd', 35, '2017-12-25 18:44:19.571001'),
(96, 'test', 35, '2017-12-26 14:02:58.103301'),
(97, 'somewhere', 35, '2017-12-26 14:37:01.407604'),
(98, 'Pokémon', 35, '2017-12-27 17:59:19.622065'),
(99, 'pikachu', 35, '2017-12-27 18:22:46.628928'),
(100, 'elektric', 35, '2017-12-27 18:22:46.649030'),
(101, 'ysy', 35, '2017-12-27 18:40:31.770937'),
(102, 'tags', 35, '2017-12-27 18:54:08.734923'),
(103, 'Ankara', 9, '2017-12-27 21:42:48.618045'),
(104, 'Mausoleum', 9, '2017-12-27 21:42:48.630534'),
(105, 'Tower', 9, '2017-12-28 09:38:24.774747'),
(106, 'İstanbul', 9, '2017-12-28 09:38:24.786582'),
(107, 'alexander', 18, '2017-12-28 09:40:18.302587'),
(108, 'macedonia', 18, '2017-12-28 09:40:18.313593'),
(109, 'anatolia', 18, '2017-12-28 09:40:18.325405'),
(110, 'Mosque', 9, '2017-12-28 09:42:20.799906'),
(111, 'Food', 9, '2017-12-28 09:44:33.430365'),
(112, 'Jewelry', 9, '2017-12-28 09:48:00.442220'),
(113, 'Important Day', 9, '2017-12-28 09:52:40.883504'),
(114, 'Education', 9, '2017-12-28 09:52:40.894689'),
(115, 'place', 28, '2017-12-28 09:54:49.287554'),
(116, 'city', 28, '2017-12-28 09:54:49.299955'),
(117, 'house', 28, '2017-12-28 09:54:49.310890'),
(118, 'Instrument', 9, '2017-12-28 09:59:44.479565'),
(119, 'Archaeological', 28, '2017-12-28 10:03:07.252195'),
(120, 'site', 28, '2017-12-28 10:03:07.263149'),
(121, 'troy', 28, '2017-12-28 10:03:07.274383'),
(122, 'horse', 28, '2017-12-28 10:03:07.285236'),
(123, 'Palace', 9, '2017-12-28 10:07:31.938456'),
(124, 'Ship', 9, '2017-12-28 10:18:33.047147'),
(125, 'Statue', 9, '2017-12-28 10:20:48.029026'),
(126, 'USA', 9, '2017-12-28 10:20:48.038974'),
(127, 'Monument', 9, '2017-12-28 10:20:48.051510'),
(128, 'Portrait', 9, '2017-12-28 10:24:26.925645'),
(129, 'Art', 9, '2017-12-28 10:24:26.936978'),
(130, 'Paris', 9, '2017-12-28 10:24:26.946512'),
(131, 'Leonardo da Vinci', 9, '2017-12-28 10:24:26.957274'),
(132, 'İzmir', 9, '2017-12-28 10:30:18.831492'),
(133, 'Alphabet', 7, '2017-12-28 10:38:51.339113'),
(134, 'adana', 27, '2017-12-28 10:42:17.130128'),
(135, 'kebab', 27, '2017-12-28 10:42:17.151247'),
(136, 'culture', 27, '2017-12-28 10:42:17.183217'),
(137, 'Clothing', 7, '2017-12-28 10:45:25.461243'),
(138, 'Ottoman', 7, '2017-12-28 10:45:25.475370'),
(139, 'aztec', 27, '2017-12-28 10:56:43.377684'),
(140, 'mexico', 27, '2017-12-28 10:56:43.387427'),
(141, 'mesoamerican', 27, '2017-12-28 10:56:43.398538'),
(142, 'islander', 25, '2017-12-28 10:56:53.503578'),
(143, 'australia', 25, '2017-12-28 10:56:53.518092'),
(144, 'dreamtime', 25, '2017-12-28 10:56:53.527548'),
(145, 'Ancestor Spirits', 25, '2017-12-28 10:56:53.538229'),
(146, 'kangoroo', 25, '2017-12-28 10:56:53.548955'),
(147, 'animal-spirit', 25, '2017-12-28 11:05:44.249595'),
(148, 'dancer', 25, '2017-12-28 11:05:44.267210'),
(149, 'god', 27, '2017-12-28 11:14:50.267455'),
(150, 'hound', 27, '2017-12-28 11:14:50.278227'),
(151, 'war', 27, '2017-12-28 11:14:50.288979'),
(152, 'america', 23, '2017-12-28 11:17:01.601821'),
(153, 'native', 23, '2017-12-28 11:17:01.611531'),
(154, 'sun', 27, '2017-12-28 11:54:25.007059'),
(155, 'german', 27, '2017-12-28 12:05:12.343732'),
(156, 'hammer', 27, '2017-12-28 12:05:12.378189'),
(157, 'thunder', 27, '2017-12-28 12:05:12.419090'),
(158, 'House', 9, '2017-12-28 12:26:25.307242'),
(159, 'godess', 27, '2017-12-28 12:28:37.022402'),
(160, 'snake', 27, '2017-12-28 12:28:37.062595'),
(161, 'stone', 27, '2017-12-28 12:28:37.081559'),
(162, 'starwars', 18, '2017-12-28 13:08:55.966101'),
(163, 'sci-fi', 18, '2017-12-28 13:08:55.977470'),
(164, 'samba', 18, '2017-12-28 13:25:57.403790'),
(165, 'brazil', 18, '2017-12-28 13:25:57.423921'),
(166, 'rio', 18, '2017-12-28 13:51:19.759261'),
(167, 'festival', 18, '2017-12-28 13:51:19.790745'),
(168, 'ephesus', 32, '2017-12-28 21:28:34.212176'),
(169, 'heritage', 32, '2017-12-28 21:28:34.223397'),
(170, 'building', 32, '2017-12-28 21:28:34.234110'),
(171, 'london', 23, '2017-12-29 20:11:46.112393'),
(172, 'eye', 23, '2017-12-29 20:11:46.123375'),
(173, 'view', 23, '2017-12-29 20:11:46.134011'),
(174, 'castle', 23, '2017-12-29 20:15:13.463215'),
(175, 'ancient', 23, '2017-12-30 11:57:39.610514'),
(176, 'kingdom', 23, '2017-12-30 11:57:39.621710'),
(177, 'palace', 23, '2017-12-30 12:00:52.351135'),
(178, 'ottomans', 23, '2017-12-30 12:00:52.362540'),
(179, 'belgrade', 23, '2017-12-30 12:05:40.227305'),
(180, 'fortress', 23, '2017-12-30 12:05:40.237915'),
(181, '#pastirma', 18, '2017-12-30 15:22:29.237026'),
(182, '#turkey', 18, '2017-12-30 15:22:29.246462'),
(183, '#food', 18, '2017-12-30 15:22:29.257202'),
(184, '#meat', 18, '2017-12-30 15:22:29.266837'),
(185, 'sphinx', 18, '2017-12-30 15:28:40.698672'),
(186, 'usa', 18, '2017-12-30 15:29:58.417836'),
(187, 'statue of liberty', 18, '2017-12-30 15:29:58.427942'),
(188, 'new york', 18, '2017-12-30 15:29:58.438846'),
(189, 'tres leches', 18, '2017-12-30 18:38:37.364297'),
(190, 'pad thai', 18, '2017-12-30 18:42:34.833383'),
(191, 'Thailand', 18, '2017-12-30 18:42:34.845976'),
(192, 'zeybek', 18, '2017-12-30 20:49:58.823298'),
(193, 'Sami', 18, '2017-12-30 20:54:46.683181'),
(194, 'People', 18, '2017-12-30 20:54:46.694586'),
(195, 'Scandinavia', 18, '2017-12-30 20:54:46.705837'),
(196, 'Finland', 18, '2017-12-30 20:54:46.717670'),
(197, 'Norway', 18, '2017-12-30 20:54:46.727214'),
(198, 'Sweden', 18, '2017-12-30 20:54:46.738121'),
(199, 'Russia', 18, '2017-12-30 20:54:46.747416'),
(200, 'Christmas', 18, '2017-12-30 20:58:58.546966'),
(201, 'Holiday', 18, '2017-12-30 20:58:58.562213'),
(202, 'Jesus', 18, '2017-12-30 20:58:58.573352'),
(203, 'hanbok', 7, '2017-12-31 07:33:42.787606'),
(204, 'korea', 7, '2017-12-31 07:33:42.799164'),
(205, 'koreanclothing', 7, '2017-12-31 07:33:42.810054'),
(206, 'asia', 7, '2017-12-31 07:33:42.822074'),
(207, 'dress', 7, '2017-12-31 07:33:42.831296'),
(208, 'zen', 7, '2017-12-31 07:41:22.849713'),
(209, 'temple', 7, '2017-12-31 07:41:22.859434'),
(210, 'kinkakuji', 7, '2017-12-31 07:41:22.870152'),
(211, 'kyoto', 7, '2017-12-31 07:41:22.889561'),
(212, 'art', 7, '2017-12-31 07:47:16.531822'),
(213, 'England', 9, '2017-12-31 07:49:39.258508'),
(214, 'bibimbap', 7, '2017-12-31 07:51:33.515853'),
(215, 'japanese', 7, '2017-12-31 07:58:25.951879'),
(216, 'cuisine', 7, '2017-12-31 07:58:25.964004'),
(217, 'okonomiyaki', 7, '2017-12-31 07:58:25.983142'),
(218, 'Medusa', 9, '2017-12-31 08:03:08.338373'),
(219, 'mask', 7, '2017-12-31 08:05:07.441643'),
(220, 'korean', 7, '2017-12-31 08:05:07.498928'),
(221, 'China', 9, '2017-12-31 08:07:19.898539'),
(222, 'Fortification', 9, '2017-12-31 08:07:19.909663'),
(223, 'Temple', 9, '2017-12-31 08:14:12.585883'),
(224, 'game', 7, '2017-12-31 08:19:43.967925'),
(225, 'tuho', 7, '2017-12-31 08:19:43.990954'),
(226, 'Hittite', 9, '2017-12-31 08:21:10.611591'),
(227, 'Çorum', 9, '2017-12-31 08:21:10.622356'),
(228, 'Sphinx', 9, '2017-12-31 08:21:10.631607'),
(229, 'sword', 7, '2017-12-31 08:24:15.929629'),
(230, 'samurai', 7, '2017-12-31 08:24:15.939395'),
(231, 'musical', 7, '2017-12-31 08:28:33.307519'),
(232, 'Sport', 9, '2017-12-31 08:40:56.347394'),
(233, 'Theatre', 9, '2017-12-31 08:44:25.801156'),
(234, 'Puppet', 9, '2017-12-31 08:44:25.812255'),
(235, 'Pottery', 9, '2017-12-31 08:48:46.005512'),
(236, 'Porcelain', 9, '2017-12-31 08:48:46.023064'),
(237, 'Ceramic', 9, '2017-12-31 08:48:46.033986'),
(238, 'Spanish', 7, '2017-12-31 08:50:27.609680'),
(239, 'bridge', 28, '2017-12-31 09:39:40.126352'),
(240, 'train', 28, '2017-12-31 09:39:40.137248'),
(241, 'turkish', 23, '2017-12-31 09:40:30.942565'),
(242, 'meat', 23, '2017-12-31 09:40:30.956699'),
(243, 'tolerance', 23, '2017-12-31 09:43:30.318203'),
(244, 'konya', 23, '2017-12-31 09:43:30.338591'),
(245, 'center', 28, '2017-12-31 09:43:46.838369'),
(246, 'historical', 28, '2017-12-31 09:43:46.857503'),
(247, 'ottoman', 28, '2017-12-31 09:45:32.757331'),
(248, 'village', 28, '2017-12-31 09:48:30.839296'),
(249, 'courtyard', 28, '2017-12-31 09:49:32.781858'),
(250, 'defence', 28, '2017-12-31 09:49:32.791290'),
(251, 'hospital', 28, '2017-12-31 09:53:42.595346'),
(252, 'monument', 28, '2017-12-31 09:55:36.884166'),
(253, 'marble', 28, '2017-12-31 09:57:35.611672'),
(254, 'giant', 39, '2017-12-31 11:54:21.474807'),
(255, 'figther', 39, '2017-12-31 11:54:21.486021'),
(256, 'flamenco', 18, '2017-12-31 12:01:07.902769'),
(257, 'spain', 18, '2017-12-31 12:01:07.913660'),
(258, 'gypsies', 18, '2017-12-31 12:01:07.925833'),
(259, 'pastel de nata', 18, '2017-12-31 12:05:10.430842'),
(260, 'portugal', 18, '2017-12-31 12:05:10.441480'),
(261, 'pastry', 18, '2017-12-31 12:05:10.460284'),
(262, 'pantheon', 32, '2017-12-31 15:23:49.733705'),
(263, 'louvre', 32, '2017-12-31 15:29:49.806585'),
(264, 'brussels', 32, '2017-12-31 15:55:09.203120'),
(265, 'sculpture', 32, '2017-12-31 15:55:09.214032'),
(266, 'berlin', 32, '2017-12-31 15:59:51.630864'),
(267, 'gate', 32, '2017-12-31 15:59:51.642346'),
(268, 'cathedral', 32, '2017-12-31 16:06:08.131364'),
(269, 'prague', 32, '2017-12-31 16:06:08.142389'),
(270, 'wien', 32, '2017-12-31 16:11:25.447071'),
(271, 'clock', 32, '2017-12-31 16:18:14.751920'),
(272, 'golden', 32, '2017-12-31 16:22:25.599764'),
(273, 'sanfrancisco', 32, '2017-12-31 16:22:25.611584'),
(274, 'theWall', 25, '2017-12-31 18:28:14.267494'),
(275, 'chiniese', 25, '2017-12-31 18:28:14.280942'),
(276, 'china', 25, '2017-12-31 18:28:14.290826'),
(277, 'cristian', 25, '2017-12-31 18:31:12.117987'),
(278, 'vatican', 25, '2017-12-31 18:31:12.135542'),
(279, ' Pyotr Ilyich Tchaikovsky', 25, '2017-12-31 18:33:43.469267'),
(280, 'ballet', 25, '2017-12-31 18:33:43.478588'),
(281, 'dish', 25, '2017-12-31 18:37:16.166570'),
(282, 'wine', 25, '2017-12-31 18:37:16.185387'),
(283, 'mozzarella', 25, '2017-12-31 18:37:16.195175'),
(284, 'architecture', 25, '2017-12-31 18:39:45.856170'),
(285, 'army', 25, '2017-12-31 18:43:55.313084'),
(286, 'oldPeole', 25, '2017-12-31 19:01:42.203929'),
(287, 'firstSociety', 25, '2017-12-31 19:01:42.215117'),
(288, 'prag', 25, '2017-12-31 19:06:43.699649'),
(289, 'fun', 25, '2017-12-31 19:16:43.642999'),
(290, 'gamle', 25, '2017-12-31 19:16:43.653921'),
(291, 'royals', 25, '2017-12-31 19:16:43.663502');

-- --------------------------------------------------------

--
-- Table structure for table `base_taglist`
--

CREATE TABLE `base_taglist` (
  `id` int(11) NOT NULL,
  `item_id` int(11) DEFAULT NULL,
  `tag_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

--
-- Dumping data for table `base_taglist`
--

INSERT INTO `base_taglist` (`id`, `item_id`, `tag_id`) VALUES
(12, 11, 11),
(13, 11, 12),
(14, 11, 13),
(21, 16, 17),
(22, 16, 18),
(23, 16, 19),
(26, 20, 17),
(27, 20, 22),
(28, 20, 23),
(29, 21, 22),
(30, 21, 24),
(31, 21, 25),
(35, 23, 29),
(36, 23, 30),
(37, 24, 29),
(38, 24, 30),
(41, 28, 33),
(42, 28, 34),
(43, 28, 35),
(44, 28, 36),
(45, 28, 37),
(46, 29, 38),
(47, 29, 39),
(48, 29, 33),
(49, 29, 40),
(50, 29, 41),
(58, 35, 46),
(59, 35, 47),
(60, 35, 48),
(61, 35, 49),
(62, 36, 33),
(63, 36, 50),
(64, 36, 51),
(65, 36, 52),
(66, 36, 53),
(67, 37, 46),
(68, 37, 54),
(69, 37, 55),
(70, 38, 35),
(71, 38, 33),
(72, 38, 50),
(73, 38, 56),
(74, 39, 36),
(75, 39, 35),
(76, 39, 57),
(77, 40, 58),
(78, 40, 59),
(79, 40, 33),
(80, 41, 8),
(81, 41, 9),
(82, 42, 60),
(83, 42, 61),
(84, 43, 62),
(85, 43, 33),
(86, 43, 63),
(87, 43, 64),
(90, 45, 36),
(91, 45, 35),
(92, 45, 65),
(93, 45, 66),
(94, 46, 29),
(95, 46, 67),
(96, 46, 68),
(97, 46, 69),
(98, 47, 69),
(99, 47, 63),
(100, 47, 65),
(101, 47, 58),
(102, 47, 70),
(133, 54, 35),
(134, 54, 57),
(135, 54, 71),
(136, 54, 72),
(137, 54, 73),
(138, 55, 74),
(139, 55, 75),
(140, 55, 76),
(141, 55, 77),
(143, 57, 47),
(144, 57, 78),
(145, 57, 79),
(146, 57, 35),
(147, 57, 48),
(148, 58, 80),
(149, 58, 81),
(150, 58, 30),
(151, 58, 82),
(152, 59, 61),
(153, 59, 83),
(154, 59, 84),
(196, 102, 103),
(197, 102, 30),
(198, 102, 104),
(201, 107, 105),
(202, 107, 106),
(203, 108, 107),
(204, 108, 108),
(205, 108, 109),
(206, 109, 106),
(207, 109, 110),
(208, 110, 111),
(209, 110, 30),
(210, 111, 106),
(211, 111, 112),
(212, 112, 30),
(213, 112, 113),
(214, 112, 114),
(218, 114, 118),
(219, 114, 55),
(220, 114, 30),
(225, 116, 111),
(226, 116, 30),
(227, 117, 123),
(228, 117, 106),
(229, 118, 124),
(233, 120, 128),
(234, 120, 129),
(235, 120, 130),
(236, 120, 131),
(239, 122, 110),
(240, 122, 30),
(241, 123, 133),
(242, 124, 3),
(243, 125, 134),
(244, 125, 135),
(245, 125, 29),
(246, 125, 136),
(247, 126, 137),
(248, 126, 138),
(249, 127, 129),
(250, 128, 139),
(251, 128, 140),
(252, 128, 141),
(258, 130, 22),
(259, 130, 132),
(260, 131, 144),
(261, 131, 142),
(262, 131, 147),
(263, 131, 146),
(264, 131, 148),
(265, 132, 36),
(266, 132, 149),
(267, 132, 150),
(268, 132, 151),
(269, 133, 142),
(270, 133, 148),
(271, 133, 152),
(272, 133, 153),
(273, 134, 137),
(274, 135, 154),
(275, 135, 149),
(276, 135, 61),
(277, 135, 35),
(278, 136, 155),
(279, 136, 35),
(280, 136, 156),
(281, 136, 149),
(282, 136, 157),
(283, 137, 158),
(284, 138, 159),
(285, 138, 160),
(286, 138, 35),
(287, 138, 161),
(288, 140, 51),
(289, 140, 162),
(290, 140, 163),
(295, 142, 80),
(296, 142, 33),
(297, 142, 165),
(302, 145, 80),
(303, 145, 167),
(304, 145, 165),
(305, 146, 168),
(306, 146, 169),
(307, 146, 170),
(308, 147, 22),
(309, 147, 171),
(310, 147, 172),
(311, 147, 173),
(312, 148, 151),
(313, 148, 174),
(314, 149, 175),
(315, 149, 176),
(316, 149, 84),
(317, 150, 177),
(318, 150, 178),
(319, 150, 39),
(320, 151, 174),
(321, 151, 179),
(322, 151, 180),
(323, 152, 181),
(324, 152, 182),
(325, 152, 183),
(326, 152, 184),
(327, 153, 185),
(328, 153, 61),
(329, 153, 175),
(330, 154, 186),
(331, 154, 187),
(332, 154, 188),
(333, 155, 189),
(334, 155, 67),
(335, 155, 29),
(336, 156, 190),
(337, 156, 191),
(338, 156, 111),
(339, 157, 192),
(340, 157, 63),
(341, 157, 80),
(342, 157, 30),
(343, 158, 193),
(344, 158, 194),
(345, 158, 195),
(346, 158, 196),
(347, 158, 197),
(348, 158, 198),
(349, 158, 199),
(350, 159, 200),
(351, 159, 201),
(352, 159, 202),
(353, 160, 203),
(354, 160, 204),
(355, 160, 205),
(356, 160, 206),
(357, 160, 207),
(358, 161, 208),
(359, 161, 209),
(360, 161, 210),
(361, 161, 25),
(362, 161, 211),
(363, 162, 25),
(364, 162, 212),
(365, 163, 105),
(366, 163, 213),
(367, 164, 204),
(368, 164, 29),
(369, 164, 214),
(370, 165, 213),
(371, 165, 127),
(372, 166, 215),
(373, 166, 216),
(374, 166, 29),
(375, 166, 217),
(376, 167, 106),
(377, 167, 218),
(378, 168, 219),
(379, 168, 80),
(380, 168, 220),
(381, 168, 204),
(382, 169, 221),
(383, 169, 222),
(384, 170, 82),
(385, 170, 223),
(386, 171, 224),
(387, 171, 204),
(388, 171, 225),
(389, 171, 206),
(390, 172, 30),
(391, 172, 226),
(392, 172, 227),
(393, 172, 228),
(394, 173, 215),
(395, 173, 229),
(396, 173, 230),
(397, 174, 55),
(398, 174, 30),
(399, 174, 82),
(400, 174, 118),
(401, 175, 231),
(402, 175, 38),
(403, 175, 204),
(404, 176, 30),
(405, 176, 232),
(406, 177, 220),
(407, 177, 231),
(408, 177, 38),
(409, 178, 30),
(410, 178, 233),
(411, 178, 234),
(412, 179, 235),
(413, 179, 30),
(414, 179, 236),
(415, 179, 237),
(416, 180, 238),
(417, 180, 216),
(418, 180, 29),
(419, 181, 239),
(420, 181, 240),
(421, 182, 29),
(422, 182, 241),
(423, 182, 242),
(424, 182, 135),
(425, 183, 170),
(426, 183, 18),
(427, 184, 243),
(428, 184, 66),
(429, 184, 244),
(430, 185, 245),
(431, 185, 116),
(432, 185, 246),
(433, 186, 239),
(434, 186, 247),
(435, 187, 209),
(436, 188, 248),
(437, 189, 249),
(438, 189, 250),
(441, 191, 18),
(442, 191, 251),
(443, 191, 109),
(444, 192, 175),
(445, 192, 252),
(446, 193, 253),
(447, 193, 36),
(448, 194, 35),
(449, 194, 254),
(450, 194, 255),
(451, 195, 80),
(452, 195, 256),
(453, 195, 257),
(454, 195, 258),
(455, 196, 259),
(456, 196, 260),
(457, 196, 67),
(458, 196, 261),
(459, 197, 9),
(460, 197, 8),
(463, 199, 262),
(464, 199, 8),
(465, 200, 263),
(466, 200, 185),
(467, 201, 264),
(468, 201, 265),
(469, 202, 266),
(470, 202, 267),
(471, 203, 268),
(472, 203, 269),
(473, 204, 270),
(474, 205, 269),
(475, 205, 271),
(476, 206, 267),
(477, 206, 272),
(478, 206, 273),
(479, 207, 274),
(480, 207, 275),
(481, 207, 276),
(482, 208, 277),
(483, 208, 8),
(484, 208, 278),
(485, 209, 80),
(486, 209, 279),
(487, 209, 280),
(488, 210, 29),
(489, 210, 281),
(490, 210, 10),
(491, 210, 282),
(492, 210, 283),
(493, 211, 276),
(494, 211, 84),
(495, 211, 170),
(496, 211, 284),
(497, 212, 285),
(498, 212, 265),
(499, 212, 84),
(500, 212, 276),
(501, 213, 39),
(502, 213, 286),
(503, 213, 287),
(504, 213, 175),
(505, 214, 288),
(506, 214, 284),
(507, 214, 4),
(508, 215, 288),
(509, 215, 284),
(510, 215, 4),
(511, 216, 288),
(512, 216, 284),
(513, 216, 4),
(514, 217, 288),
(515, 217, 284),
(516, 217, 4),
(517, 218, 288),
(518, 218, 284),
(519, 218, 4),
(520, 219, 288),
(521, 219, 284),
(522, 219, 4),
(523, 220, 288),
(524, 220, 284);

-- --------------------------------------------------------

--
-- Table structure for table `base_timeline`
--

CREATE TABLE `base_timeline` (
  `id` int(11) NOT NULL,
  `name` varchar(200) COLLATE utf8mb4_bin NOT NULL,
  `text` varchar(500) COLLATE utf8mb4_bin DEFAULT NULL,
  `startDate` varchar(20) COLLATE utf8mb4_bin DEFAULT NULL,
  `endDate` varchar(20) COLLATE utf8mb4_bin DEFAULT NULL,
  `item_id` int(11) DEFAULT NULL,
  `location_id` int(11) DEFAULT NULL,
  `created_at` datetime(6) NOT NULL,
  `created_by_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

--
-- Dumping data for table `base_timeline`
--

INSERT INTO `base_timeline` (`id`, `name`, `text`, `startDate`, `endDate`, `item_id`, `location_id`, `created_at`, `created_by_id`) VALUES
(10, 'Item is created', NULL, '2017-01-01', NULL, 11, NULL, '2017-12-03 00:01:57.746502', NULL),
(15, 'Item is created', NULL, '2017-01-01', NULL, 16, NULL, '2017-12-03 15:04:28.344753', NULL),
(19, 'Item is created', NULL, '2017-01-01', NULL, 20, NULL, '2017-12-04 14:41:11.342887', NULL),
(20, 'Item is created', NULL, '2017-01-01', NULL, 21, NULL, '2017-12-04 14:44:23.353879', NULL),
(22, 'Item is created', NULL, '2017-01-01', NULL, 23, NULL, '2017-12-04 14:55:56.786622', NULL),
(23, 'Item is created', NULL, '2017-01-01', NULL, 24, NULL, '2017-12-04 14:57:41.510704', NULL),
(26, 'Moved to Italy', 'It\'s moved by Italy Goverment. It\'s in Bla Bla Museum', '-1000-03-00', '0000-03-18', 16, 2, '2017-12-04 18:30:54.519585', 1),
(35, 'Item is created', NULL, '0000-00-00', NULL, 35, NULL, '2017-12-06 15:54:20.609604', NULL),
(36, 'Item is created', NULL, '2017-01-01', NULL, 36, NULL, '2017-12-06 15:54:50.378364', NULL),
(37, 'Item is created', NULL, '0000-00-00', NULL, 37, NULL, '2017-12-06 16:04:05.854623', NULL),
(38, 'Item is created', NULL, '-520-00-00', NULL, 38, NULL, '2017-12-06 16:05:06.054101', NULL),
(39, 'Item is created', NULL, '0000-00-00', NULL, 39, NULL, '2017-12-06 16:46:52.300991', NULL),
(40, 'Item is created', NULL, '0000-00-00', NULL, 40, NULL, '2017-12-06 17:00:09.422139', NULL),
(41, 'Item is created', NULL, '80-00-00', NULL, 41, 4, '2017-12-06 17:18:28.397022', NULL),
(42, 'Item is created', NULL, '-2611-00-00', NULL, 42, NULL, '2017-12-06 17:59:25.299674', NULL),
(43, 'Item is created', NULL, '1894-10-25', NULL, 43, NULL, '2017-12-06 18:04:26.604648', NULL),
(45, 'Item is created', NULL, '-440-00-00', NULL, 45, NULL, '2017-12-06 19:56:09.924962', NULL),
(46, 'Item is created', NULL, '0000-00-00', NULL, 46, NULL, '2017-12-06 20:03:13.293546', NULL),
(47, 'Item is created', NULL, '1938-00-00', NULL, 47, NULL, '2017-12-06 20:06:24.758291', NULL),
(54, 'Item is created', NULL, '-500-00-00', NULL, 54, NULL, '2017-12-06 21:00:33.813140', NULL),
(55, 'Item is created', NULL, '1999-10-00', NULL, 55, 5, '2017-12-06 21:13:22.937401', 4),
(57, 'Item is created', NULL, '0000-00-00', NULL, 57, NULL, '2017-12-07 06:41:45.726637', NULL),
(58, 'Item is created', NULL, '0000-00-00', NULL, 58, NULL, '2017-12-07 06:51:40.215562', NULL),
(59, 'Item is created', NULL, '-3200-00-00', NULL, 59, NULL, '2017-12-07 10:13:15.750456', NULL),
(93, 'Item is created', NULL, '1953-9-1', NULL, 102, 24, '2017-12-27 21:50:41.339061', NULL),
(98, 'Item is created', NULL, '1348-00-00', NULL, 107, 26, '2017-12-28 09:38:24.771339', NULL),
(99, 'Item is created', NULL, '-356-6-00', '-323-6-00', 108, 27, '2017-12-28 09:40:18.299145', NULL),
(100, 'Item is created', NULL, '1853-00-00', NULL, 109, 28, '2017-12-28 09:42:20.788096', NULL),
(101, 'Item is created', NULL, '0000-00-00', NULL, 110, 12, '2017-12-28 09:44:33.424210', NULL),
(102, 'Item is created', NULL, '1798-00-00', NULL, 111, 29, '2017-12-28 09:48:00.430197', NULL),
(103, 'Item is created', NULL, '0000-11-24~', NULL, 112, 12, '2017-12-28 09:52:40.871734', NULL),
(105, 'Item is created', NULL, '1400-00-00', NULL, 114, 12, '2017-12-28 09:59:44.476063', NULL),
(107, 'Item is created', NULL, '1700-00-00', NULL, 116, 12, '2017-12-28 10:03:19.760366', NULL),
(108, 'Item is created', NULL, '1880-00-00', NULL, 117, 32, '2017-12-28 10:07:31.934825', NULL),
(109, 'Item is created', NULL, '1912-4-10', '1912-4-15', 118, 12, '2017-12-28 10:18:33.043795', NULL),
(111, 'Item is created', NULL, '1503-00-00', NULL, 120, 34, '2017-12-28 10:24:26.922280', NULL),
(113, 'Item is created', NULL, '1391-00-00', NULL, 122, 36, '2017-12-28 10:33:34.968918', NULL),
(114, 'Item is created', NULL, '-700-00-00', NULL, 123, 12, '2017-12-28 10:38:51.335305', NULL),
(115, 'Item is created', NULL, '2005-08-08', NULL, 124, 37, '2017-12-28 10:41:26.225196', NULL),
(116, 'Item is created', NULL, '0000-00-00', NULL, 125, 38, '2017-12-28 10:42:17.121428', NULL),
(117, 'Item is created', NULL, '1800-00-00', NULL, 126, 12, '2017-12-28 10:45:25.457449', NULL),
(118, 'Item is created', NULL, '1906-00-00', NULL, 127, 39, '2017-12-28 10:50:04.173362', NULL),
(119, 'Item is created', NULL, '1300-00-00~', '1521-00-00~', 128, 40, '2017-12-28 10:56:43.372891', NULL),
(121, 'Item is created', NULL, '1901-00-00', NULL, 130, 35, '2017-12-28 10:59:51.921268', NULL),
(122, 'Item is created', NULL, '-5000-00-00', NULL, 131, 42, '2017-12-28 11:05:44.204467', NULL),
(123, 'Item is created', NULL, '-500-00-00~', NULL, 132, 43, '2017-12-28 11:14:50.256047', NULL),
(124, 'Item is created', NULL, '1500-00-00', NULL, 133, 44, '2017-12-28 11:17:01.547141', NULL),
(125, 'Item is created', NULL, '800-00-00', NULL, 134, 45, '2017-12-28 11:20:51.146334', NULL),
(126, 'Item is created', NULL, '-1300-00-00~', NULL, 135, 46, '2017-12-28 11:54:25.004808', NULL),
(127, 'Item is created', NULL, '1100-00-00~', NULL, 136, 47, '2017-12-28 12:05:12.334441', NULL),
(128, 'Item is created', NULL, '0000-00-00', NULL, 137, 48, '2017-12-28 12:26:25.304727', NULL),
(129, 'Item is created', NULL, '-200-00-00~', NULL, 138, 49, '2017-12-28 12:28:37.018881', NULL),
(130, 'Item is created', NULL, '-1184-00-00', NULL, 139, 50, '2017-12-28 12:28:59.543449', NULL),
(131, 'Item is created', NULL, '1985-00-00', '2017-00-00', 140, 12, '2017-12-28 13:08:55.953301', NULL),
(133, 'Item is created', NULL, '0000-00-00', NULL, 142, 12, '2017-12-28 13:28:57.911719', NULL),
(136, 'Item is created', NULL, '0000-02-9~', '0000-02-14~', 145, 53, '2017-12-28 16:38:56.332486', NULL),
(137, 'Item is created', NULL, '-10-00-00', NULL, 146, 54, '2017-12-28 21:28:34.207572', NULL),
(138, 'Item is created', NULL, '2000-3-9', NULL, 147, 55, '2017-12-29 20:11:46.100463', NULL),
(139, 'Item is created', NULL, '1452-00-00', NULL, 148, 56, '2017-12-29 20:15:13.452710', NULL),
(140, 'Item is created', NULL, '0000-00-00', NULL, 149, 57, '2017-12-30 11:57:39.603987', NULL),
(141, 'Item is created', NULL, '1856-00-00', NULL, 150, 58, '2017-12-30 12:00:52.347741', NULL),
(142, 'Item is created', NULL, '-3000-00-00', NULL, 151, 59, '2017-12-30 12:05:40.216876', NULL),
(143, 'Item is created', NULL, '0000-00-00', NULL, 152, 12, '2017-12-30 15:22:29.233564', NULL),
(144, 'Item is created', NULL, '0000-00-00', NULL, 153, 12, '2017-12-30 15:28:40.695033', NULL),
(145, 'Item is created', NULL, '0000-00-00', NULL, 154, 33, '2017-12-30 15:29:58.414180', NULL),
(146, 'Item is created', NULL, '0000-00-00', NULL, 155, 12, '2017-12-30 18:38:37.360851', NULL),
(147, 'Item is created', NULL, '0000-00-00', NULL, 156, 60, '2017-12-30 18:42:34.829769', NULL),
(148, 'Item is created', NULL, '0000-00-00', NULL, 157, 12, '2017-12-30 20:49:58.819709', NULL),
(149, 'Item is created', NULL, '0000-00-00', NULL, 158, 12, '2017-12-30 20:54:46.675172', NULL),
(150, 'Item is created', NULL, '0000-12-25~', NULL, 159, 12, '2017-12-30 20:58:58.543465', NULL),
(151, 'Item is created', NULL, '0000-00-00', NULL, 160, 61, '2017-12-31 07:33:42.783965', NULL),
(152, 'Item is created', NULL, '0000-00-00', NULL, 161, 62, '2017-12-31 07:41:22.846334', NULL),
(153, 'Item is created', NULL, '1829-00-00', '1833-00-00', 162, 45, '2017-12-31 07:47:16.515878', NULL),
(154, 'Item is created', NULL, '1859-5-31', NULL, 163, 63, '2017-12-31 07:49:39.246540', NULL),
(155, 'Item is created', NULL, '0000-00-00', NULL, 164, 61, '2017-12-31 07:51:33.495847', NULL),
(156, 'Item is created', NULL, '-2000-00-00~', NULL, 165, 64, '2017-12-31 07:58:14.265812', NULL),
(157, 'Item is created', NULL, '0000-00-00', NULL, 166, 22, '2017-12-31 07:58:25.946646', NULL),
(158, 'Item is created', NULL, '300-00-00~', NULL, 167, 65, '2017-12-31 08:03:08.323569', NULL),
(159, 'Item is created', NULL, '0000-00-00', NULL, 168, 66, '2017-12-31 08:05:07.437926', NULL),
(160, 'Item is created', NULL, '-220-00-00', NULL, 169, 67, '2017-12-31 08:07:19.896262', NULL),
(161, 'Item is created', NULL, '-5000-00-00', NULL, 170, 68, '2017-12-31 08:14:12.573566', NULL),
(162, 'Item is created', NULL, '0000-00-00', NULL, 171, 69, '2017-12-31 08:19:43.964119', NULL),
(163, 'Item is created', NULL, '-2000-00-00~', NULL, 172, 70, '2017-12-31 08:21:10.599384', NULL),
(164, 'Item is created', NULL, '0000-00-00', NULL, 173, 45, '2017-12-31 08:24:15.917312', NULL),
(165, 'Item is created', NULL, '0000-00-00', NULL, 174, 12, '2017-12-31 08:27:40.522199', NULL),
(166, 'Item is created', NULL, '0000-00-00', NULL, 175, 61, '2017-12-31 08:28:33.303808', NULL),
(167, 'Item is created', NULL, '1300-00-00~', NULL, 176, 71, '2017-12-31 08:40:56.295984', NULL),
(168, 'Item is created', NULL, '0000-00-00', NULL, 177, 61, '2017-12-31 08:41:02.721025', NULL),
(169, 'Item is created', NULL, '1500-00-00~', NULL, 178, 12, '2017-12-31 08:44:25.785742', NULL),
(170, 'Item is created', NULL, '1300-00-00~', NULL, 179, 72, '2017-12-31 08:48:46.002116', NULL),
(171, 'Item is created', NULL, '0000-00-00', NULL, 180, 73, '2017-12-31 08:50:27.606123', NULL),
(172, 'Item is created', NULL, '1848-00-00', '1854-00-00', 181, 74, '2017-12-31 09:39:40.122910', NULL),
(173, 'Item is created', NULL, '1961-00-00', NULL, 182, 12, '2017-12-31 09:40:30.902522', NULL),
(174, 'Item is created', NULL, '1500-00-00', NULL, 183, 75, '2017-12-31 09:42:10.384508', NULL),
(175, 'Item is created', NULL, '1207-9-30', '1273-12-17', 184, 76, '2017-12-31 09:43:30.314677', NULL),
(176, 'Item is created', NULL, '1400-00-00', NULL, 185, 77, '2017-12-31 09:43:46.834638', NULL),
(177, 'Item is created', NULL, '1566-00-00', NULL, 186, 78, '2017-12-31 09:45:32.745699', NULL),
(178, 'Item is created', NULL, '900-00-00', NULL, 187, 79, '2017-12-31 09:46:42.509443', NULL),
(179, 'Item is created', NULL, '1800-00-00', NULL, 188, 80, '2017-12-31 09:48:30.835800', NULL),
(180, 'Item is created', NULL, '1500-00-00', '1900-00-00', 189, 81, '2017-12-31 09:49:32.778590', NULL),
(182, 'Item is created', NULL, '1228-00-00', NULL, 191, 82, '2017-12-31 09:53:42.584303', NULL),
(183, 'Item is created', NULL, '-281-00-00', '-133-00-00', 192, 83, '2017-12-31 09:55:36.872406', NULL),
(184, 'Item is created', NULL, '-300-00-00', NULL, 193, 84, '2017-12-31 09:57:35.609328', NULL),
(185, 'Item is created', NULL, '-200-00-00~', '400-00-00~', 194, 43, '2017-12-31 11:54:21.455560', NULL),
(186, 'Item is created', NULL, '0000-00-00', NULL, 195, 85, '2017-12-31 12:01:07.890584', NULL),
(187, 'Item is created', NULL, '1820-00-00', NULL, 196, 86, '2017-12-31 12:05:10.428509', NULL),
(188, 'Item is created', NULL, '70-00-00', NULL, 197, 87, '2017-12-31 12:11:30.089401', NULL),
(190, 'Item is created', NULL, '120-00-00', NULL, 199, 88, '2017-12-31 15:23:49.730042', NULL),
(191, 'Item is created', NULL, '-2600-00-00', NULL, 200, 89, '2017-12-31 15:29:49.802665', NULL),
(192, 'Item is created', NULL, '1619-00-00', NULL, 201, 90, '2017-12-31 15:55:09.199661', NULL),
(193, 'Item is created', NULL, '1788-00-00', NULL, 202, 91, '2017-12-31 15:59:51.627448', NULL),
(194, 'Item is created', NULL, '1344-00-00', NULL, 203, 92, '2017-12-31 16:06:08.127829', NULL),
(195, 'Item is created', NULL, '1893-00-00', NULL, 204, 93, '2017-12-31 16:11:25.443031', NULL),
(196, 'Item is created', NULL, '1410-00-00', NULL, 205, 94, '2017-12-31 16:18:14.739812', NULL),
(197, 'Item is created', NULL, '1933-00-00', NULL, 206, 95, '2017-12-31 16:22:25.588900', NULL),
(198, 'Item is created', NULL, '-220-00-00', NULL, 207, 96, '2017-12-31 18:28:14.265196', NULL),
(199, 'Item is created', NULL, '200-00-00', NULL, 208, 97, '2017-12-31 18:31:12.114602', NULL),
(200, 'Item is created', NULL, '1892-12-18', NULL, 209, 98, '2017-12-31 18:33:43.454945', NULL),
(201, 'Item is created', NULL, '1300-00-00', NULL, 210, 99, '2017-12-31 18:37:16.155039', NULL),
(202, 'Item is created', NULL, '1406-00-00', '1420-00-00', 211, 100, '2017-12-31 18:39:45.827623', NULL),
(203, 'Item is created', NULL, '-200-00-00', NULL, 212, 101, '2017-12-31 18:43:55.309606', NULL),
(204, 'Item is created', NULL, '-7500-00-00', NULL, 213, 102, '2017-12-31 19:01:42.192808', NULL),
(205, 'Item is created', NULL, '1357-00-', '1402-00-00', 214, 103, '2017-12-31 19:06:43.697424', NULL),
(206, 'Item is created', NULL, '1357-00-', '1402-00-00', 215, 103, '2017-12-31 19:06:55.326253', NULL),
(207, 'Item is created', NULL, '1357-00-', '1402-00-00', 216, 103, '2017-12-31 19:08:41.549125', NULL),
(208, 'Item is created', NULL, '1357-00-', '1402-00-00', 217, 103, '2017-12-31 19:10:09.438479', NULL),
(209, 'Item is created', NULL, '1357-00-', '1402-00-00', 218, 103, '2017-12-31 19:10:20.389692', NULL),
(210, 'Item is created', NULL, '1357-00-', '1402-00-00', 219, 103, '2017-12-31 19:12:22.928959', NULL),
(211, 'Item is created', NULL, '1352-00-00', NULL, 220, 103, '2017-12-31 19:13:51.223461', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `base_userratedannotation`
--

CREATE TABLE `base_userratedannotation` (
  `id` int(11) NOT NULL,
  `rate` int(11) DEFAULT NULL,
  `annotation_id` int(11) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

-- --------------------------------------------------------

--
-- Table structure for table `base_userratedcomment`
--

CREATE TABLE `base_userratedcomment` (
  `id` int(11) NOT NULL,
  `rate` int(11) DEFAULT NULL,
  `comment_id` int(11) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

-- --------------------------------------------------------

--
-- Table structure for table `base_userrateditem`
--

CREATE TABLE `base_userrateditem` (
  `id` int(11) NOT NULL,
  `rate` int(11) DEFAULT NULL,
  `item_id` int(11) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `created_at` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

--
-- Dumping data for table `base_userrateditem`
--

INSERT INTO `base_userrateditem` (`id`, `rate`, `item_id`, `user_id`, `created_at`) VALUES
(10, 1, 24, 9, '2017-12-04 15:15:22.024450'),
(14, 1, 21, 9, '2017-12-05 07:55:57.020730'),
(16, 1, 23, 9, '2017-12-05 10:35:29.905352'),
(17, 1, 24, 7, '2017-12-05 17:01:49.541596'),
(23, 1, 16, 22, '2017-12-05 17:55:37.750793'),
(24, 1, 29, 22, '2017-12-05 17:55:56.548820'),
(25, 1, 21, 22, '2017-12-05 18:18:06.040232'),
(27, 1, 20, 22, '2017-12-05 19:13:08.616982'),
(29, 1, 28, 25, '2017-12-06 16:09:40.388834'),
(31, 1, 20, 25, '2017-12-06 16:11:33.224659'),
(32, 1, 11, 25, '2017-12-06 16:11:40.857710'),
(35, 1, 37, 18, '2017-12-06 16:21:07.275774'),
(37, 1, 38, 27, '2017-12-06 17:50:32.005040'),
(40, 1, 20, 27, '2017-12-06 18:09:41.475980'),
(46, 1, 38, 25, '2017-12-06 18:22:53.461929'),
(49, 1, 38, 28, '2017-12-06 19:56:46.893735'),
(50, 1, 36, 28, '2017-12-06 19:57:01.342610'),
(51, 1, 23, 28, '2017-12-06 20:04:19.258584'),
(52, 1, 24, 28, '2017-12-06 20:04:20.649541'),
(55, 1, 47, 29, '2017-12-06 20:55:15.116274'),
(56, 1, 40, 29, '2017-12-06 20:55:22.278088'),
(57, 1, 43, 29, '2017-12-06 20:55:25.835479'),
(58, 1, 54, 29, '2017-12-06 21:08:58.683098'),
(59, 1, 55, 29, '2017-12-06 21:13:29.210621'),
(60, 1, 46, 22, '2017-12-07 05:43:39.871468'),
(61, 1, 55, 23, '2017-12-07 06:38:09.609561'),
(62, 1, 57, 23, '2017-12-07 06:41:59.396607'),
(63, 1, 40, 23, '2017-12-07 06:45:09.824574'),
(64, 1, 58, 22, '2017-12-07 07:31:26.875101'),
(65, 1, 47, 22, '2017-12-07 09:25:40.596310'),
(66, 1, 43, 22, '2017-12-07 09:25:48.465387'),
(67, 1, 42, 22, '2017-12-07 09:25:50.657100'),
(68, 1, 40, 22, '2017-12-07 09:25:55.564451'),
(69, 1, 24, 22, '2017-12-07 09:26:06.537238'),
(70, 1, 23, 22, '2017-12-07 09:26:08.688979'),
(71, 1, 45, 27, '2017-12-07 09:41:27.643253'),
(72, 1, 23, 27, '2017-12-07 09:42:00.334886'),
(75, 1, 55, 30, '2017-12-07 10:16:45.542165'),
(77, 1, 55, 31, '2017-12-07 10:20:10.443431'),
(78, 1, 37, 3, '2017-12-07 10:20:27.010938'),
(82, 1, 55, 32, '2017-12-07 10:42:55.711676'),
(83, 1, 40, 9, '2017-12-07 10:43:11.696099'),
(84, 1, 42, 32, '2017-12-07 11:19:26.844762'),
(85, 1, 40, 27, '2017-12-07 11:22:01.873669'),
(90, 1, 47, 27, '2017-12-07 11:54:08.190707'),
(92, 1, 59, 22, '2017-12-07 13:09:44.438519'),
(93, 1, 58, 33, '2017-12-07 20:11:37.810551'),
(94, 1, 46, 9, '2017-12-08 15:59:28.514396'),
(95, 1, 59, 27, '2017-12-11 16:15:16.838553'),
(97, 1, 59, 7, '2017-12-12 13:08:59.830576'),
(98, 1, 58, 18, '2017-12-18 22:27:06.036824'),
(99, 1, 46, 28, '2017-12-20 10:28:27.481848'),
(125, 1, 42, 35, '2017-12-26 16:02:10.969585'),
(126, 1, 59, 35, '2017-12-26 16:02:47.976958'),
(127, 1, 46, 35, '2017-12-26 16:03:49.296178'),
(137, 1, 55, 28, '2017-12-26 18:31:36.896426'),
(138, 1, 21, 28, '2017-12-26 18:31:59.149710'),
(141, 1, 35, 18, '2017-12-27 21:56:14.444918'),
(142, 1, 47, 18, '2017-12-27 21:58:36.025856'),
(155, 1, 46, 7, '2017-12-28 03:57:31.170023'),
(156, 1, 102, 7, '2017-12-28 06:24:17.629435'),
(157, 1, 102, 9, '2017-12-28 09:16:37.462400'),
(224, 1, 118, 27, '2017-12-28 10:45:19.964275'),
(225, 1, 116, 27, '2017-12-28 10:45:23.842760'),
(226, 1, 112, 27, '2017-12-28 10:45:30.881068'),
(237, 1, 120, 7, '2017-12-28 10:46:08.077882'),
(242, 1, 102, 27, '2017-12-28 10:46:58.672867'),
(243, 1, 57, 27, '2017-12-28 10:47:35.194469'),
(244, 1, 54, 27, '2017-12-28 10:47:43.739923'),
(245, 1, 43, 27, '2017-12-28 10:47:51.660043'),
(246, 1, 41, 27, '2017-12-28 10:47:56.531041'),
(247, 1, 11, 27, '2017-12-28 10:48:27.838867'),
(249, 1, 124, 3, '2017-12-28 10:48:44.187006'),
(250, 1, 124, 27, '2017-12-28 10:49:09.357380'),
(251, 1, 120, 27, '2017-12-28 10:49:21.252313'),
(252, 1, 109, 7, '2017-12-28 10:52:39.280109'),
(255, 1, 127, 3, '2017-12-28 10:54:24.770628'),
(264, 1, 118, 7, '2017-12-28 11:03:42.976752'),
(265, 1, 111, 7, '2017-12-28 11:04:09.621072'),
(266, 1, 131, 7, '2017-12-28 11:08:18.825241'),
(267, 1, 131, 23, '2017-12-28 11:12:17.728583'),
(268, 1, 131, 27, '2017-12-28 11:15:12.875020'),
(269, 1, 130, 7, '2017-12-28 11:22:16.676270'),
(271, 1, 132, 7, '2017-12-28 11:26:05.901901'),
(272, 1, 134, 9, '2017-12-28 12:02:43.772185'),
(281, 1, 136, 18, '2017-12-28 12:05:45.366958'),
(282, 1, 120, 9, '2017-12-28 12:05:45.643472'),
(283, 1, 133, 27, '2017-12-28 12:19:06.782182'),
(284, 1, 130, 27, '2017-12-28 12:19:17.144197'),
(285, 1, 124, 36, '2017-12-28 12:24:25.417774'),
(287, 1, 139, 9, '2017-12-28 12:29:30.073966'),
(288, 1, 139, 27, '2017-12-28 12:30:24.471338'),
(289, 1, 137, 18, '2017-12-28 12:31:02.660192'),
(290, 1, 132, 27, '2017-12-28 12:32:24.028653'),
(291, 1, 138, 28, '2017-12-28 12:33:43.519223'),
(292, 1, 139, 28, '2017-12-28 12:37:20.558987'),
(311, 1, 135, 28, '2017-12-28 12:37:57.685413'),
(312, 1, 124, 18, '2017-12-28 12:53:53.824402'),
(316, 1, 131, 18, '2017-12-28 13:29:42.889965'),
(317, 1, 142, 18, '2017-12-28 13:32:56.912354'),
(318, 1, 130, 32, '2017-12-28 13:45:11.783026'),
(320, 1, 140, 9, '2017-12-28 14:35:13.725252'),
(321, 1, 140, 25, '2017-12-28 15:37:15.168852'),
(322, 1, 131, 25, '2017-12-28 15:38:15.500625'),
(323, 1, 133, 18, '2017-12-28 16:41:35.763951'),
(324, 1, 16, 27, '2017-12-28 18:10:45.785609'),
(325, 1, 107, 27, '2017-12-28 18:10:53.552116'),
(326, 1, 154, 18, '2017-12-30 15:30:10.554302'),
(327, 1, 158, 18, '2017-12-31 07:13:38.351332'),
(328, 1, 158, 28, '2017-12-31 09:32:28.302856'),
(329, 1, 102, 39, '2017-12-31 11:59:01.916128'),
(330, 1, 195, 18, '2017-12-31 12:01:29.091147'),
(331, 1, 197, 28, '2017-12-31 12:33:53.643062'),
(332, 1, 194, 28, '2017-12-31 12:34:26.724837'),
(333, 1, 191, 28, '2017-12-31 13:00:05.687180'),
(334, 1, 197, 32, '2017-12-31 13:02:13.374273'),
(335, 1, 193, 32, '2017-12-31 13:02:32.141541'),
(336, 1, 188, 32, '2017-12-31 13:02:43.530204'),
(337, 1, 196, 18, '2017-12-31 14:27:38.958732'),
(338, 1, 211, 25, '2017-12-31 18:40:24.771320');

-- --------------------------------------------------------

--
-- Table structure for table `django_admin_log`
--

CREATE TABLE `django_admin_log` (
  `id` int(11) NOT NULL,
  `action_time` datetime(6) NOT NULL,
  `object_id` longtext COLLATE utf8mb4_bin,
  `object_repr` varchar(200) COLLATE utf8mb4_bin NOT NULL,
  `action_flag` smallint(5) UNSIGNED NOT NULL,
  `change_message` longtext COLLATE utf8mb4_bin NOT NULL,
  `content_type_id` int(11) DEFAULT NULL,
  `user_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

--
-- Dumping data for table `django_admin_log`
--

INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES
(1, '2017-11-23 12:15:56.540318', '1', 'Mount Nemrut', 3, '', 24, 2),
(2, '2017-11-29 20:05:35.920101', '2', 'Bebek', 1, '[{"added": {}}]', 24, 2),
(3, '2017-11-30 20:58:53.761613', '6', 'hilal', 1, '[{"added": {}}]', 3, 2),
(4, '2017-11-30 20:59:10.741023', '6', 'hilal', 2, '[{"changed": {"fields": ["email"]}}]', 3, 2),
(5, '2017-12-01 18:20:56.973060', '6', 'hilal', 3, '', 3, 2),
(6, '2017-12-01 18:56:09.998028', '6', 'Sinekli Bakkal', 3, '', 24, 2),
(7, '2017-12-01 18:56:14.700614', '5', 'Turkish Delight', 3, '', 24, 2),
(8, '2017-12-01 18:56:18.938146', '4', 'Hagia Sophia', 3, '', 24, 2),
(9, '2017-12-01 18:56:23.421822', '3', 'Sumela Monastery', 3, '', 24, 2),
(10, '2017-12-02 16:01:15.377654', '8', 'Profile object', 2, '[{"changed": {"fields": ["birthday"]}}]', 8, 2),
(11, '2017-12-03 12:27:33.994143', '15', 'deneme3', 3, '', 24, 2),
(12, '2017-12-03 12:27:33.997159', '14', 'deneme2', 3, '', 24, 2),
(13, '2017-12-04 14:39:20.422124', '7', 'deneme', 3, '', 24, 2),
(14, '2017-12-04 14:40:04.475294', '12', 'Maiden\'s Tower', 3, '', 24, 2),
(15, '2017-12-04 14:41:59.759243', '19', 'deneme', 3, '', 24, 2),
(16, '2017-12-04 14:42:05.443321', '18', 'asd', 3, '', 24, 2),
(17, '2017-12-04 14:42:10.605170', '17', 'denemasd', 3, '', 24, 2),
(18, '2017-12-04 14:43:55.298789', '13', 'Tokyo Tower', 3, '', 24, 2),
(19, '2017-12-04 14:45:29.857365', '11', 'The City of Love', 2, '[{"changed": {"fields": ["updated_by", "tags"]}}]', 24, 2),
(20, '2017-12-04 14:46:04.472855', '11', 'The City of Love', 2, '[{"changed": {"fields": ["tags"]}}]', 24, 2),
(21, '2017-12-04 18:32:18.252285', '26', 'deneme5', 2, '[{"changed": {"fields": ["updated_by"]}}]', 24, 2),
(22, '2017-12-06 16:52:43.546110', '27', 'dnm', 3, '', 24, 2),
(23, '2017-12-06 16:52:52.519043', '26', 'deneme5', 3, '', 24, 2),
(24, '2017-12-06 19:48:16.816787', '33', 'item', 3, '', 24, 2),
(25, '2017-12-06 19:48:16.822298', '32', 'last', 3, '', 24, 2),
(26, '2017-12-06 19:48:16.824230', '31', 'try', 3, '', 24, 2),
(27, '2017-12-06 19:48:16.825949', '25', 'deneme', 3, '', 24, 2),
(28, '2017-12-06 19:48:42.573976', '30', 'my computer', 3, '', 24, 2),
(29, '2017-12-06 19:50:20.946724', '1', 'enescakir11', 2, '[{"changed": {"fields": ["username"]}}]', 3, 2),
(30, '2017-12-06 19:54:20.809669', '44', 'deneme', 3, '', 24, 2),
(31, '2017-12-06 21:08:04.286096', '53', 'Hypnos', 3, '', 24, 2),
(32, '2017-12-06 21:08:04.290524', '52', 'Hypnos', 3, '', 24, 2),
(33, '2017-12-06 21:08:04.293191', '51', 'Hypnos', 3, '', 24, 2),
(34, '2017-12-06 21:08:04.294606', '50', 'Hypnos', 3, '', 24, 2),
(35, '2017-12-06 21:08:04.297312', '49', 'Hypnos', 3, '', 24, 2),
(36, '2017-12-06 21:08:04.298779', '48', 'Hypnos', 3, '', 24, 2),
(37, '2017-12-06 21:43:54.983623', '56', 'deneme', 3, '', 24, 2),
(38, '2017-12-07 07:00:42.676926', '34', 'Barın hoca', 3, '', 24, 2),
(39, '2017-12-07 10:15:52.945892', '22', 'Sinekli Bakkal', 3, '', 24, 2),
(40, '2017-12-07 10:32:00.475354', '5', 'Istanbul', 1, '[{"added": {}}]', 13, 2),
(41, '2017-12-07 10:32:07.273456', '55', 'Item is created - 1999-10-0', 2, '[{"changed": {"fields": ["startDate", "location", "created_by"]}}]', 11, 2),
(42, '2017-12-23 13:53:09.604373', '60', 'deneme', 3, '', 24, 2),
(43, '2017-12-25 12:01:30.828349', '61', 'japanese1', 3, '', 24, 2),
(44, '2017-12-25 18:08:38.898657', '66', 'helloo', 3, '', 24, 2),
(45, '2017-12-25 18:08:38.901964', '65', 'heloo', 3, '', 24, 2),
(46, '2017-12-25 18:12:21.177247', '67', 'title', 3, '', 24, 2),
(47, '2017-12-25 18:14:37.964500', '68', 'title', 3, '', 24, 2),
(48, '2017-12-26 15:18:33.295741', '76', 'yotei da', 3, '', 24, 2),
(49, '2017-12-26 15:18:33.301552', '75', 'shikata ga nai', 3, '', 24, 2),
(50, '2017-12-26 15:18:33.304471', '72', 'title2', 3, '', 24, 2),
(51, '2017-12-26 15:18:33.306065', '71', 'title', 3, '', 24, 2),
(52, '2017-12-27 18:20:56.213751', '84', 'tit', 3, '', 24, 2),
(53, '2017-12-27 18:20:56.217079', '83', 'title', 3, '', 24, 2),
(54, '2017-12-27 18:20:56.218721', '82', 'pikachu', 3, '', 24, 2),
(55, '2017-12-27 18:20:56.221497', '81', 'pikachu', 3, '', 24, 2),
(56, '2017-12-27 18:20:56.225968', '73', 'title', 3, '', 24, 2),
(57, '2017-12-27 18:29:13.829597', '88', 't', 3, '', 24, 2),
(58, '2017-12-27 18:29:13.832955', '87', 'tit2', 3, '', 24, 2),
(59, '2017-12-27 18:29:13.834355', '86', 'titdes', 3, '', 24, 2),
(60, '2017-12-27 18:29:13.836935', '85', 'pikachu', 3, '', 24, 2),
(61, '2017-12-27 18:30:50.758441', '90', 'j', 3, '', 24, 2),
(62, '2017-12-27 18:30:50.761483', '89', 'y', 3, '', 24, 2),
(63, '2017-12-27 18:51:28.776568', '95', 'ss', 3, '', 24, 2),
(64, '2017-12-27 18:51:28.782057', '94', 'h', 3, '', 24, 2),
(65, '2017-12-27 18:51:28.784748', '93', 'jsj', 3, '', 24, 2),
(66, '2017-12-27 18:51:28.786214', '92', 'hello', 3, '', 24, 2),
(67, '2017-12-27 21:49:43.457251', '101', 'Anıtkabir', 3, '', 24, 2),
(68, '2017-12-28 09:13:03.968029', '104', 'jjz', 3, '', 24, 2),
(69, '2017-12-28 09:38:49.457885', '105', 'asd', 3, '', 24, 2),
(70, '2017-12-28 09:38:49.460770', '103', 'Some item', 3, '', 24, 2),
(71, '2017-12-28 09:38:49.462184', '100', 'as', 3, '', 24, 2),
(72, '2017-12-28 09:38:49.464895', '99', 'aaaa', 3, '', 24, 2),
(73, '2017-12-28 09:38:49.469060', '98', 'asd', 3, '', 24, 2),
(74, '2017-12-28 09:38:49.470499', '97', 'bug', 3, '', 24, 2),
(75, '2017-12-28 09:38:49.473207', '96', 'pika', 3, '', 24, 2),
(76, '2017-12-28 09:38:49.474649', '91', 'title', 3, '', 24, 2),
(77, '2017-12-28 09:38:49.477247', '80', 'deneme', 3, '', 24, 2),
(78, '2017-12-28 09:38:49.478680', '79', 'deneme', 3, '', 24, 2),
(79, '2017-12-28 09:38:49.481415', '78', 'deneme', 3, '', 24, 2),
(80, '2017-12-28 09:38:49.484144', '77', 'deneme', 3, '', 24, 2),
(81, '2017-12-28 09:38:49.485598', '74', 'some', 3, '', 24, 2),
(82, '2017-12-28 09:38:49.488319', '70', 'again new item', 3, '', 24, 2),
(83, '2017-12-28 09:38:49.489794', '69', 'again new item', 3, '', 24, 2),
(84, '2017-12-28 09:38:49.492670', '64', 'janana', 3, '', 24, 2),
(85, '2017-12-28 09:38:49.494369', '63', 'again new item', 3, '', 24, 2),
(86, '2017-12-28 09:38:49.497130', '62', 'new item', 3, '', 24, 2),
(87, '2017-12-28 09:49:16.676172', '106', 'asdasdasd', 3, '', 24, 2),
(88, '2017-12-28 10:58:59.768093', '121', 'İzmir Clock Tower', 3, '', 24, 2),
(89, '2017-12-28 11:00:30.530407', '129', 'Aborigines', 3, '', 24, 2),
(90, '2017-12-28 11:25:17.832878', '8', 'Pamukkale', 3, '', 24, 2),
(91, '2017-12-28 12:25:30.490538', '113', 'Safranbolu', 3, '', 24, 2),
(92, '2017-12-28 12:27:44.499958', '115', 'Archaeological Site of Troy', 3, '', 24, 2),
(93, '2017-12-28 12:35:15.463748', '37', 'Pan Flute', 2, '[{"changed": {"fields": ["description", "updated_by"]}}]', 24, 2),
(94, '2017-12-28 12:54:25.887619', '124', 'Pamukkale', 2, '[{"changed": {"fields": ["description", "rate", "updated_by"]}}]', 24, 2),
(95, '2017-12-28 13:28:28.097514', '141', 'Samba', 3, '', 24, 2),
(96, '2017-12-28 14:12:27.485448', '144', 'PRio', 3, '', 24, 2),
(97, '2017-12-28 14:12:27.488387', '143', 'Rio Carnival', 3, '', 24, 2),
(98, '2017-12-31 07:09:31.208319', '37', 'melike', 1, '[{"added": {}}]', 3, 2),
(99, '2017-12-31 07:10:24.422762', '37', 'melike', 2, '[{"changed": {"fields": ["email"]}}]', 3, 2),
(100, '2017-12-31 07:12:27.311006', '37', 'melike', 3, '', 3, 2),
(101, '2017-12-31 07:21:50.619769', '38', 'melike', 1, '[{"added": {}}]', 3, 2),
(102, '2017-12-31 07:28:02.507420', '38', 'melike', 3, '', 3, 2),
(103, '2017-12-31 07:45:17.970190', '119', 'Statue of Liberty', 3, '', 24, 2),
(104, '2017-12-31 09:51:01.261118', '190', 'Fujian Tulou', 3, '', 24, 2),
(105, '2017-12-31 12:33:16.297254', '198', 'Colosseum', 3, '', 24, 2),
(106, '2017-12-31 13:06:55.433001', '10', 'Colosseum', 3, '', 24, 2),
(107, '2017-12-31 21:58:37.120392', '221', 'Play Carts', 3, '', 24, 2);

-- --------------------------------------------------------

--
-- Table structure for table `django_content_type`
--

CREATE TABLE `django_content_type` (
  `id` int(11) NOT NULL,
  `app_label` varchar(100) COLLATE utf8mb4_bin NOT NULL,
  `model` varchar(100) COLLATE utf8mb4_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

--
-- Dumping data for table `django_content_type`
--

INSERT INTO `django_content_type` (`id`, `app_label`, `model`) VALUES
(1, 'admin', 'logentry'),
(2, 'auth', 'group'),
(4, 'auth', 'permission'),
(3, 'auth', 'user'),
(27, 'authtoken', 'token'),
(17, 'base', 'annotation'),
(16, 'base', 'audioanno'),
(22, 'base', 'comment'),
(20, 'base', 'follow'),
(18, 'base', 'imageanno'),
(24, 'base', 'item'),
(21, 'base', 'itemedit'),
(12, 'base', 'itemfollow'),
(13, 'base', 'location'),
(14, 'base', 'media'),
(8, 'base', 'profile'),
(7, 'base', 'report'),
(19, 'base', 'tag'),
(23, 'base', 'taglist'),
(10, 'base', 'textanno'),
(11, 'base', 'timeline'),
(15, 'base', 'userratedannotation'),
(26, 'base', 'userratedcomment'),
(9, 'base', 'userrateditem'),
(25, 'base', 'videoanno'),
(5, 'contenttypes', 'contenttype'),
(6, 'sessions', 'session');

-- --------------------------------------------------------

--
-- Table structure for table `django_migrations`
--

CREATE TABLE `django_migrations` (
  `id` int(11) NOT NULL,
  `app` varchar(255) COLLATE utf8mb4_bin NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_bin NOT NULL,
  `applied` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

--
-- Dumping data for table `django_migrations`
--

INSERT INTO `django_migrations` (`id`, `app`, `name`, `applied`) VALUES
(1, 'contenttypes', '0001_initial', '2017-11-23 11:45:54.842110'),
(2, 'auth', '0001_initial', '2017-11-23 11:45:55.243331'),
(3, 'admin', '0001_initial', '2017-11-23 11:45:55.341889'),
(4, 'admin', '0002_logentry_remove_auto_add', '2017-11-23 11:45:55.359443'),
(5, 'contenttypes', '0002_remove_content_type_name', '2017-11-23 11:45:55.429656'),
(6, 'auth', '0002_alter_permission_name_max_length', '2017-11-23 11:45:55.466668'),
(7, 'auth', '0003_alter_user_email_max_length', '2017-11-23 11:45:55.483719'),
(8, 'auth', '0004_alter_user_username_opts', '2017-11-23 11:45:55.495421'),
(9, 'auth', '0005_alter_user_last_login_null', '2017-11-23 11:45:55.530402'),
(10, 'auth', '0006_require_contenttypes_0002', '2017-11-23 11:45:55.533807'),
(11, 'auth', '0007_alter_validators_add_error_messages', '2017-11-23 11:45:55.545051'),
(12, 'auth', '0008_alter_user_username_max_length', '2017-11-23 11:45:55.793588'),
(13, 'authtoken', '0001_initial', '2017-11-23 11:45:55.857918'),
(14, 'authtoken', '0002_auto_20160226_1747', '2017-11-23 11:45:55.937387'),
(15, 'base', '0001_initial', '2017-11-23 11:45:55.956575'),
(16, 'base', '0002_auto_20171003_1936', '2017-11-23 11:45:56.209716'),
(17, 'base', '0003_auto_20171003_1936', '2017-11-23 11:45:56.283390'),
(18, 'base', '0004_item_featured_img', '2017-11-23 11:45:56.325866'),
(19, 'base', '0005_auto_20171019_2336', '2017-11-23 11:45:58.589671'),
(20, 'base', '0006_auto_20171022_2030', '2017-11-23 11:45:58.655494'),
(21, 'base', '0007_auto_20171022_2041', '2017-11-23 11:45:58.795618'),
(22, 'base', '0008_auto_20171022_2049', '2017-11-23 11:45:58.970014'),
(23, 'base', '0009_auto_20171023_1651', '2017-11-23 11:45:59.253315'),
(24, 'base', '0010_auto_20171023_1653', '2017-11-23 11:45:59.272525'),
(25, 'base', '0011_auto_20171023_2118', '2017-11-23 11:45:59.454730'),
(26, 'base', '0012_auto_20171114_2349', '2017-11-23 11:46:01.278265'),
(27, 'base', '0013_auto_20171116_2314', '2017-11-23 11:46:01.334762'),
(28, 'base', '0014_auto_20171121_1405', '2017-11-23 11:46:01.807883'),
(29, 'base', '0015_auto_20171121_1504', '2017-11-23 11:46:01.907449'),
(30, 'sessions', '0001_initial', '2017-11-23 11:46:01.939858'),
(31, 'base', '0016_auto_20171204_2057', '2017-12-04 18:27:00.629692'),
(32, 'base', '0017_auto_20171204_2058', '2017-12-04 18:27:00.692434'),
(33, 'base', '0018_auto_20171220_2300', '2017-12-23 13:51:56.535698'),
(34, 'base', '0019_remove_annotation_item', '2017-12-23 13:51:56.597877'),
(35, 'base', '0020_reported_created_at', '2017-12-23 13:51:56.658054'),
(36, 'base', '0021_auto_20171223_1601', '2017-12-23 13:51:56.720649');

-- --------------------------------------------------------

--
-- Table structure for table `django_session`
--

CREATE TABLE `django_session` (
  `session_key` varchar(40) COLLATE utf8mb4_bin NOT NULL,
  `session_data` longtext COLLATE utf8mb4_bin NOT NULL,
  `expire_date` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

--
-- Dumping data for table `django_session`
--

INSERT INTO `django_session` (`session_key`, `session_data`, `expire_date`) VALUES
('34rtvsun2uhdcz8d6r3j428gjmnalsa6', 'ZDI1NjEwZWU3Njc3OWYyZjE4YWI5YzA2MmE0NTg2NWUwZDEyMjY3MTp7Il9hdXRoX3VzZXJfaWQiOiIyIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiJhNjZjODE0MzJiYzIyNDZhZjQ1OGY0MzkwNDA2YmQ3MDc3MTQzNGY1In0=', '2017-12-13 08:33:33.277447'),
('5cyq650tws4ri5q0bt6780iyx2yryj4u', 'YTAyOGQ1ZTBhNGUxOWY1YzdmMTA5ZWU5ZTYyODA3YWNhOWJjNGI2NTp7Il9hdXRoX3VzZXJfaGFzaCI6ImE2NmM4MTQzMmJjMjI0NmFmNDU4ZjQzOTA0MDZiZDcwNzcxNDM0ZjUiLCJfYXV0aF91c2VyX2lkIjoiMiIsIl9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIn0=', '2018-01-08 14:36:49.880876'),
('5kq39avnybyhugk3n5hwbhdu6iefc6qg', 'MGRhYmVjZmM2ZTM5MzY1ZGNjNDU5NjhhYWYwODY2YTM1ZDRkY2Q3Njp7Il9hdXRoX3VzZXJfaGFzaCI6ImE2NmM4MTQzMmJjMjI0NmFmNDU4ZjQzOTA0MDZiZDcwNzcxNDM0ZjUiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIyIn0=', '2018-01-11 12:26:33.366465'),
('6yexuhzusf6yfsl46bqo3hledla1ycn4', 'ODk3YWEzMDAxNmJjZmI3NzZlNDlkMzQ1YjQ5NGExZTJiYzFhYTA2Njp7Il9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9pZCI6IjIiLCJfYXV0aF91c2VyX2hhc2giOiJhNjZjODE0MzJiYzIyNDZhZjQ1OGY0MzkwNDA2YmQ3MDc3MTQzNGY1In0=', '2018-01-13 15:53:08.993840'),
('82gcc2gxm4bml3id483k97bpvlt0tmlh', 'ZDI1NjEwZWU3Njc3OWYyZjE4YWI5YzA2MmE0NTg2NWUwZDEyMjY3MTp7Il9hdXRoX3VzZXJfaWQiOiIyIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiJhNjZjODE0MzJiYzIyNDZhZjQ1OGY0MzkwNDA2YmQ3MDc3MTQzNGY1In0=', '2017-12-13 09:40:20.373687'),
('9hn6otdyojavvy3p35aa9hgvb6y4p8mp', 'YTAyOGQ1ZTBhNGUxOWY1YzdmMTA5ZWU5ZTYyODA3YWNhOWJjNGI2NTp7Il9hdXRoX3VzZXJfaGFzaCI6ImE2NmM4MTQzMmJjMjI0NmFmNDU4ZjQzOTA0MDZiZDcwNzcxNDM0ZjUiLCJfYXV0aF91c2VyX2lkIjoiMiIsIl9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIn0=', '2018-01-08 12:01:01.208751'),
('b70vab6rhu6c75kl1y946cq3blmp83h2', 'ZTZlMzNmMTBmODc0MWY5MGUyYjJiMDk0NWI4ZDY2ZDhjNTkzZWRlMTp7Il9hdXRoX3VzZXJfaWQiOiIyIiwiX2F1dGhfdXNlcl9oYXNoIjoiYTY2YzgxNDMyYmMyMjQ2YWY0NThmNDM5MDQwNmJkNzA3NzE0MzRmNSIsIl9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIn0=', '2017-12-20 07:04:39.434675'),
('cp2tsv2pgbegwxqr41m9geqwtujcxtnh', 'ODk3YWEzMDAxNmJjZmI3NzZlNDlkMzQ1YjQ5NGExZTJiYzFhYTA2Njp7Il9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9pZCI6IjIiLCJfYXV0aF91c2VyX2hhc2giOiJhNjZjODE0MzJiYzIyNDZhZjQ1OGY0MzkwNDA2YmQ3MDc3MTQzNGY1In0=', '2018-01-14 10:14:55.337366'),
('dm5zsj266fstdip583bljv7zg4xmooq3', 'ZTZlMzNmMTBmODc0MWY5MGUyYjJiMDk0NWI4ZDY2ZDhjNTkzZWRlMTp7Il9hdXRoX3VzZXJfaWQiOiIyIiwiX2F1dGhfdXNlcl9oYXNoIjoiYTY2YzgxNDMyYmMyMjQ2YWY0NThmNDM5MDQwNmJkNzA3NzE0MzRmNSIsIl9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIn0=', '2017-12-12 20:18:33.358217'),
('drxv8ircl2k4xm1bciiy6f0fby9bqmds', 'YTAyOGQ1ZTBhNGUxOWY1YzdmMTA5ZWU5ZTYyODA3YWNhOWJjNGI2NTp7Il9hdXRoX3VzZXJfaGFzaCI6ImE2NmM4MTQzMmJjMjI0NmFmNDU4ZjQzOTA0MDZiZDcwNzcxNDM0ZjUiLCJfYXV0aF91c2VyX2lkIjoiMiIsIl9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIn0=', '2018-01-08 18:08:34.405582'),
('ehvu9z2yz9rlg1452cj25kwcwjwwlnvc', 'ZDI1NjEwZWU3Njc3OWYyZjE4YWI5YzA2MmE0NTg2NWUwZDEyMjY3MTp7Il9hdXRoX3VzZXJfaWQiOiIyIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiJhNjZjODE0MzJiYzIyNDZhZjQ1OGY0MzkwNDA2YmQ3MDc3MTQzNGY1In0=', '2017-12-13 20:01:59.065191'),
('fe3c5y7ar7gy60wwrl48r19vrao6kft6', 'ZTZlMzNmMTBmODc0MWY5MGUyYjJiMDk0NWI4ZDY2ZDhjNTkzZWRlMTp7Il9hdXRoX3VzZXJfaWQiOiIyIiwiX2F1dGhfdXNlcl9oYXNoIjoiYTY2YzgxNDMyYmMyMjQ2YWY0NThmNDM5MDQwNmJkNzA3NzE0MzRmNSIsIl9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIn0=', '2017-12-20 17:25:46.988871'),
('i6mw97dyoxv2fvsb8opfqq8mgzxu0btc', 'ZDI1NjEwZWU3Njc3OWYyZjE4YWI5YzA2MmE0NTg2NWUwZDEyMjY3MTp7Il9hdXRoX3VzZXJfaWQiOiIyIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiJhNjZjODE0MzJiYzIyNDZhZjQ1OGY0MzkwNDA2YmQ3MDc3MTQzNGY1In0=', '2018-01-11 09:12:33.983528'),
('kjeazavrsxvsmiq45fnqt6m38gdsegae', 'ZjM4ZDY1Y2NiNWQ2ZjUzNTJmNjM3MTFiMDAzMjBlMDE0MTJhMzdhNjp7Il9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9oYXNoIjoiYTY2YzgxNDMyYmMyMjQ2YWY0NThmNDM5MDQwNmJkNzA3NzE0MzRmNSIsIl9hdXRoX3VzZXJfaWQiOiIyIn0=', '2017-12-19 15:52:07.738107'),
('nbjkiqgtc9xlglan66c7diprlo9541hr', 'ZjM4ZDY1Y2NiNWQ2ZjUzNTJmNjM3MTFiMDAzMjBlMDE0MTJhMzdhNjp7Il9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9oYXNoIjoiYTY2YzgxNDMyYmMyMjQ2YWY0NThmNDM5MDQwNmJkNzA3NzE0MzRmNSIsIl9hdXRoX3VzZXJfaWQiOiIyIn0=', '2018-01-09 14:00:50.653896'),
('o83mut6tzrq1knx6p4azmqm9w2brlbb4', 'ZjM4ZDY1Y2NiNWQ2ZjUzNTJmNjM3MTFiMDAzMjBlMDE0MTJhMzdhNjp7Il9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9oYXNoIjoiYTY2YzgxNDMyYmMyMjQ2YWY0NThmNDM5MDQwNmJkNzA3NzE0MzRmNSIsIl9hdXRoX3VzZXJfaWQiOiIyIn0=', '2018-01-10 18:05:58.760709'),
('pntriz4zwfj7vclwbqbeipcobhad2zea', 'ODk3YWEzMDAxNmJjZmI3NzZlNDlkMzQ1YjQ5NGExZTJiYzFhYTA2Njp7Il9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9pZCI6IjIiLCJfYXV0aF91c2VyX2hhc2giOiJhNjZjODE0MzJiYzIyNDZhZjQ1OGY0MzkwNDA2YmQ3MDc3MTQzNGY1In0=', '2018-01-10 21:49:11.722850'),
('wa2e5orswkquouy8mbbzoy4zx3ggrpig', 'ODk3YWEzMDAxNmJjZmI3NzZlNDlkMzQ1YjQ5NGExZTJiYzFhYTA2Njp7Il9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9pZCI6IjIiLCJfYXV0aF91c2VyX2hhc2giOiJhNjZjODE0MzJiYzIyNDZhZjQ1OGY0MzkwNDA2YmQ3MDc3MTQzNGY1In0=', '2017-12-20 21:07:03.458336');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `authtoken_token`
--
ALTER TABLE `authtoken_token`
  ADD PRIMARY KEY (`key`),
  ADD UNIQUE KEY `user_id` (`user_id`);

--
-- Indexes for table `auth_group`
--
ALTER TABLE `auth_group`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `name` (`name`);

--
-- Indexes for table `auth_group_permissions`
--
ALTER TABLE `auth_group_permissions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_group_permissions_group_id_permission_id_0cd325b0_uniq` (`group_id`,`permission_id`),
  ADD KEY `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` (`permission_id`);

--
-- Indexes for table `auth_permission`
--
ALTER TABLE `auth_permission`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_permission_content_type_id_codename_01ab375a_uniq` (`content_type_id`,`codename`);

--
-- Indexes for table `auth_user`
--
ALTER TABLE `auth_user`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `username` (`username`);

--
-- Indexes for table `auth_user_groups`
--
ALTER TABLE `auth_user_groups`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_user_groups_user_id_group_id_94350c0c_uniq` (`user_id`,`group_id`),
  ADD KEY `auth_user_groups_group_id_97559544_fk_auth_group_id` (`group_id`);

--
-- Indexes for table `auth_user_user_permissions`
--
ALTER TABLE `auth_user_user_permissions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_user_user_permissions_user_id_permission_id_14a6b632_uniq` (`user_id`,`permission_id`),
  ADD KEY `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` (`permission_id`);

--
-- Indexes for table `base_annotation`
--
ALTER TABLE `base_annotation`
  ADD PRIMARY KEY (`id`),
  ADD KEY `base_annotation_user_id_62fd8059_fk_auth_user_id` (`user_id`),
  ADD KEY `base_annotation_media_id_38b564be_fk_base_media_id` (`media_id`);

--
-- Indexes for table `base_comment`
--
ALTER TABLE `base_comment`
  ADD PRIMARY KEY (`id`),
  ADD KEY `base_comment_related_item_id_18e77b7f_fk_base_item_id` (`related_item_id`),
  ADD KEY `base_comment_written_by_id_d8e6d03c_fk_auth_user_id` (`written_by_id`);

--
-- Indexes for table `base_follow`
--
ALTER TABLE `base_follow`
  ADD PRIMARY KEY (`id`),
  ADD KEY `base_follow_followed_id_964ca1de_fk_auth_user_id` (`followed_id`),
  ADD KEY `base_follow_follower_id_22db1308_fk_auth_user_id` (`follower_id`);

--
-- Indexes for table `base_item`
--
ALTER TABLE `base_item`
  ADD PRIMARY KEY (`id`),
  ADD KEY `base_item_created_by_id_d325ce0e_fk_auth_user_id` (`created_by_id`),
  ADD KEY `base_item_updated_by_id_1bffa7f4_fk_auth_user_id` (`updated_by_id`);

--
-- Indexes for table `base_itemedit`
--
ALTER TABLE `base_itemedit`
  ADD PRIMARY KEY (`id`),
  ADD KEY `base_itemedit_item_id_2719a5df_fk_base_item_id` (`item_id`),
  ADD KEY `base_itemedit_user_id_11737ea2_fk_auth_user_id` (`user_id`);

--
-- Indexes for table `base_itemfollow`
--
ALTER TABLE `base_itemfollow`
  ADD PRIMARY KEY (`id`),
  ADD KEY `base_itemfollow_item_id_8295f9d0_fk_base_item_id` (`item_id`),
  ADD KEY `base_itemfollow_user_id_d41bb996_fk_auth_user_id` (`user_id`);

--
-- Indexes for table `base_item_tags`
--
ALTER TABLE `base_item_tags`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `base_item_tags_item_id_tag_id_3e8a01e4_uniq` (`item_id`,`tag_id`),
  ADD KEY `base_item_tags_tag_id_7a331bcc_fk_base_tag_id` (`tag_id`);

--
-- Indexes for table `base_location`
--
ALTER TABLE `base_location`
  ADD PRIMARY KEY (`id`),
  ADD KEY `base_location_created_by_id_5cf9ef80_fk_auth_user_id` (`created_by_id`);

--
-- Indexes for table `base_media`
--
ALTER TABLE `base_media`
  ADD PRIMARY KEY (`id`),
  ADD KEY `base_media_item_id_20b71d05_fk_base_item_id` (`item_id`),
  ADD KEY `base_media_created_by_id_89d604fa_fk_auth_user_id` (`created_by_id`);

--
-- Indexes for table `base_profile`
--
ALTER TABLE `base_profile`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `user_id` (`user_id`);

--
-- Indexes for table `base_report`
--
ALTER TABLE `base_report`
  ADD PRIMARY KEY (`id`),
  ADD KEY `base_reported_item_id_dd73812b_fk_base_item_id` (`item_id`),
  ADD KEY `base_reported_user_id_72996cdb_fk_auth_user_id` (`user_id`);

--
-- Indexes for table `base_tag`
--
ALTER TABLE `base_tag`
  ADD PRIMARY KEY (`id`),
  ADD KEY `base_tag_created_by_id_d843665b_fk_auth_user_id` (`created_by_id`);

--
-- Indexes for table `base_taglist`
--
ALTER TABLE `base_taglist`
  ADD PRIMARY KEY (`id`),
  ADD KEY `base_taglist_item_id_83b6ab25_fk_base_item_id` (`item_id`),
  ADD KEY `base_taglist_tag_id_7df03970_fk_base_tag_id` (`tag_id`);

--
-- Indexes for table `base_timeline`
--
ALTER TABLE `base_timeline`
  ADD PRIMARY KEY (`id`),
  ADD KEY `base_timeline_item_id_92fef43b_fk_base_item_id` (`item_id`),
  ADD KEY `base_timeline_location_id_b90bb132_fk_base_location_id` (`location_id`),
  ADD KEY `base_timeline_created_by_id_f98f1b54_fk_auth_user_id` (`created_by_id`);

--
-- Indexes for table `base_userratedannotation`
--
ALTER TABLE `base_userratedannotation`
  ADD PRIMARY KEY (`id`),
  ADD KEY `base_userratedannota_annotation_id_4ee40aa2_fk_base_anno` (`annotation_id`),
  ADD KEY `base_userratedannotation_user_id_66a02fcf_fk_auth_user_id` (`user_id`);

--
-- Indexes for table `base_userratedcomment`
--
ALTER TABLE `base_userratedcomment`
  ADD PRIMARY KEY (`id`),
  ADD KEY `base_userratedcomment_comment_id_db8548cb_fk_base_comment_id` (`comment_id`),
  ADD KEY `base_userratedcomment_user_id_1da6bcab_fk_auth_user_id` (`user_id`);

--
-- Indexes for table `base_userrateditem`
--
ALTER TABLE `base_userrateditem`
  ADD PRIMARY KEY (`id`),
  ADD KEY `base_userrateditem_item_id_ce99fe36_fk_base_item_id` (`item_id`),
  ADD KEY `base_userrateditem_user_id_40aee453_fk_auth_user_id` (`user_id`);

--
-- Indexes for table `django_admin_log`
--
ALTER TABLE `django_admin_log`
  ADD PRIMARY KEY (`id`),
  ADD KEY `django_admin_log_content_type_id_c4bce8eb_fk_django_co` (`content_type_id`),
  ADD KEY `django_admin_log_user_id_c564eba6_fk_auth_user_id` (`user_id`);

--
-- Indexes for table `django_content_type`
--
ALTER TABLE `django_content_type`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `django_content_type_app_label_model_76bd3d3b_uniq` (`app_label`,`model`);

--
-- Indexes for table `django_migrations`
--
ALTER TABLE `django_migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `django_session`
--
ALTER TABLE `django_session`
  ADD PRIMARY KEY (`session_key`),
  ADD KEY `django_session_expire_date_a5c62663` (`expire_date`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `auth_group`
--
ALTER TABLE `auth_group`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `auth_group_permissions`
--
ALTER TABLE `auth_group_permissions`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `auth_permission`
--
ALTER TABLE `auth_permission`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=85;
--
-- AUTO_INCREMENT for table `auth_user`
--
ALTER TABLE `auth_user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=41;
--
-- AUTO_INCREMENT for table `auth_user_groups`
--
ALTER TABLE `auth_user_groups`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `auth_user_user_permissions`
--
ALTER TABLE `auth_user_user_permissions`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `base_annotation`
--
ALTER TABLE `base_annotation`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=35;
--
-- AUTO_INCREMENT for table `base_comment`
--
ALTER TABLE `base_comment`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=57;
--
-- AUTO_INCREMENT for table `base_follow`
--
ALTER TABLE `base_follow`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `base_item`
--
ALTER TABLE `base_item`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=222;
--
-- AUTO_INCREMENT for table `base_itemedit`
--
ALTER TABLE `base_itemedit`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `base_itemfollow`
--
ALTER TABLE `base_itemfollow`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `base_item_tags`
--
ALTER TABLE `base_item_tags`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=534;
--
-- AUTO_INCREMENT for table `base_location`
--
ALTER TABLE `base_location`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=105;
--
-- AUTO_INCREMENT for table `base_media`
--
ALTER TABLE `base_media`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=268;
--
-- AUTO_INCREMENT for table `base_profile`
--
ALTER TABLE `base_profile`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=42;
--
-- AUTO_INCREMENT for table `base_report`
--
ALTER TABLE `base_report`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=129;
--
-- AUTO_INCREMENT for table `base_tag`
--
ALTER TABLE `base_tag`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=292;
--
-- AUTO_INCREMENT for table `base_taglist`
--
ALTER TABLE `base_taglist`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=529;
--
-- AUTO_INCREMENT for table `base_timeline`
--
ALTER TABLE `base_timeline`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=213;
--
-- AUTO_INCREMENT for table `base_userratedannotation`
--
ALTER TABLE `base_userratedannotation`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `base_userratedcomment`
--
ALTER TABLE `base_userratedcomment`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `base_userrateditem`
--
ALTER TABLE `base_userrateditem`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=339;
--
-- AUTO_INCREMENT for table `django_admin_log`
--
ALTER TABLE `django_admin_log`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=108;
--
-- AUTO_INCREMENT for table `django_content_type`
--
ALTER TABLE `django_content_type`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=28;
--
-- AUTO_INCREMENT for table `django_migrations`
--
ALTER TABLE `django_migrations`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=37;
--
-- Constraints for dumped tables
--

--
-- Constraints for table `authtoken_token`
--
ALTER TABLE `authtoken_token`
  ADD CONSTRAINT `authtoken_token_user_id_35299eff_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);

--
-- Constraints for table `auth_group_permissions`
--
ALTER TABLE `auth_group_permissions`
  ADD CONSTRAINT `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  ADD CONSTRAINT `auth_group_permissions_group_id_b120cbf9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`);

--
-- Constraints for table `auth_permission`
--
ALTER TABLE `auth_permission`
  ADD CONSTRAINT `auth_permission_content_type_id_2f476e4b_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`);

--
-- Constraints for table `auth_user_groups`
--
ALTER TABLE `auth_user_groups`
  ADD CONSTRAINT `auth_user_groups_group_id_97559544_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  ADD CONSTRAINT `auth_user_groups_user_id_6a12ed8b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);

--
-- Constraints for table `auth_user_user_permissions`
--
ALTER TABLE `auth_user_user_permissions`
  ADD CONSTRAINT `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  ADD CONSTRAINT `auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);

--
-- Constraints for table `base_annotation`
--
ALTER TABLE `base_annotation`
  ADD CONSTRAINT `base_annotation_media_id_38b564be_fk_base_media_id` FOREIGN KEY (`media_id`) REFERENCES `base_media` (`id`),
  ADD CONSTRAINT `base_annotation_user_id_62fd8059_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);

--
-- Constraints for table `base_comment`
--
ALTER TABLE `base_comment`
  ADD CONSTRAINT `base_comment_related_item_id_18e77b7f_fk_base_item_id` FOREIGN KEY (`related_item_id`) REFERENCES `base_item` (`id`),
  ADD CONSTRAINT `base_comment_written_by_id_d8e6d03c_fk_auth_user_id` FOREIGN KEY (`written_by_id`) REFERENCES `auth_user` (`id`);

--
-- Constraints for table `base_follow`
--
ALTER TABLE `base_follow`
  ADD CONSTRAINT `base_follow_followed_id_964ca1de_fk_auth_user_id` FOREIGN KEY (`followed_id`) REFERENCES `auth_user` (`id`),
  ADD CONSTRAINT `base_follow_follower_id_22db1308_fk_auth_user_id` FOREIGN KEY (`follower_id`) REFERENCES `auth_user` (`id`);

--
-- Constraints for table `base_item`
--
ALTER TABLE `base_item`
  ADD CONSTRAINT `base_item_created_by_id_d325ce0e_fk_auth_user_id` FOREIGN KEY (`created_by_id`) REFERENCES `auth_user` (`id`),
  ADD CONSTRAINT `base_item_updated_by_id_1bffa7f4_fk_auth_user_id` FOREIGN KEY (`updated_by_id`) REFERENCES `auth_user` (`id`);

--
-- Constraints for table `base_itemedit`
--
ALTER TABLE `base_itemedit`
  ADD CONSTRAINT `base_itemedit_item_id_2719a5df_fk_base_item_id` FOREIGN KEY (`item_id`) REFERENCES `base_item` (`id`),
  ADD CONSTRAINT `base_itemedit_user_id_11737ea2_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);

--
-- Constraints for table `base_itemfollow`
--
ALTER TABLE `base_itemfollow`
  ADD CONSTRAINT `base_itemfollow_item_id_8295f9d0_fk_base_item_id` FOREIGN KEY (`item_id`) REFERENCES `base_item` (`id`),
  ADD CONSTRAINT `base_itemfollow_user_id_d41bb996_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);

--
-- Constraints for table `base_item_tags`
--
ALTER TABLE `base_item_tags`
  ADD CONSTRAINT `base_item_tags_item_id_d87136b4_fk_base_item_id` FOREIGN KEY (`item_id`) REFERENCES `base_item` (`id`),
  ADD CONSTRAINT `base_item_tags_tag_id_7a331bcc_fk_base_tag_id` FOREIGN KEY (`tag_id`) REFERENCES `base_tag` (`id`);

--
-- Constraints for table `base_location`
--
ALTER TABLE `base_location`
  ADD CONSTRAINT `base_location_created_by_id_5cf9ef80_fk_auth_user_id` FOREIGN KEY (`created_by_id`) REFERENCES `auth_user` (`id`);

--
-- Constraints for table `base_media`
--
ALTER TABLE `base_media`
  ADD CONSTRAINT `base_media_created_by_id_89d604fa_fk_auth_user_id` FOREIGN KEY (`created_by_id`) REFERENCES `auth_user` (`id`),
  ADD CONSTRAINT `base_media_item_id_20b71d05_fk_base_item_id` FOREIGN KEY (`item_id`) REFERENCES `base_item` (`id`);

--
-- Constraints for table `base_profile`
--
ALTER TABLE `base_profile`
  ADD CONSTRAINT `base_profile_user_id_8081352f_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);

--
-- Constraints for table `base_report`
--
ALTER TABLE `base_report`
  ADD CONSTRAINT `base_reported_item_id_dd73812b_fk_base_item_id` FOREIGN KEY (`item_id`) REFERENCES `base_item` (`id`),
  ADD CONSTRAINT `base_reported_user_id_72996cdb_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);

--
-- Constraints for table `base_tag`
--
ALTER TABLE `base_tag`
  ADD CONSTRAINT `base_tag_created_by_id_d843665b_fk_auth_user_id` FOREIGN KEY (`created_by_id`) REFERENCES `auth_user` (`id`);

--
-- Constraints for table `base_taglist`
--
ALTER TABLE `base_taglist`
  ADD CONSTRAINT `base_taglist_item_id_83b6ab25_fk_base_item_id` FOREIGN KEY (`item_id`) REFERENCES `base_item` (`id`),
  ADD CONSTRAINT `base_taglist_tag_id_7df03970_fk_base_tag_id` FOREIGN KEY (`tag_id`) REFERENCES `base_tag` (`id`);

--
-- Constraints for table `base_timeline`
--
ALTER TABLE `base_timeline`
  ADD CONSTRAINT `base_timeline_created_by_id_f98f1b54_fk_auth_user_id` FOREIGN KEY (`created_by_id`) REFERENCES `auth_user` (`id`),
  ADD CONSTRAINT `base_timeline_item_id_92fef43b_fk_base_item_id` FOREIGN KEY (`item_id`) REFERENCES `base_item` (`id`),
  ADD CONSTRAINT `base_timeline_location_id_b90bb132_fk_base_location_id` FOREIGN KEY (`location_id`) REFERENCES `base_location` (`id`);

--
-- Constraints for table `base_userratedannotation`
--
ALTER TABLE `base_userratedannotation`
  ADD CONSTRAINT `base_userratedannota_annotation_id_4ee40aa2_fk_base_anno` FOREIGN KEY (`annotation_id`) REFERENCES `base_annotation` (`id`),
  ADD CONSTRAINT `base_userratedannotation_user_id_66a02fcf_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);

--
-- Constraints for table `base_userratedcomment`
--
ALTER TABLE `base_userratedcomment`
  ADD CONSTRAINT `base_userratedcomment_comment_id_db8548cb_fk_base_comment_id` FOREIGN KEY (`comment_id`) REFERENCES `base_comment` (`id`),
  ADD CONSTRAINT `base_userratedcomment_user_id_1da6bcab_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);

--
-- Constraints for table `base_userrateditem`
--
ALTER TABLE `base_userrateditem`
  ADD CONSTRAINT `base_userrateditem_item_id_ce99fe36_fk_base_item_id` FOREIGN KEY (`item_id`) REFERENCES `base_item` (`id`),
  ADD CONSTRAINT `base_userrateditem_user_id_40aee453_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);

--
-- Constraints for table `django_admin_log`
--
ALTER TABLE `django_admin_log`
  ADD CONSTRAINT `django_admin_log_content_type_id_c4bce8eb_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  ADD CONSTRAINT `django_admin_log_user_id_c564eba6_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);
SET FOREIGN_KEY_CHECKS=1;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
