-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Máy chủ: 127.0.0.1
-- Thời gian đã tạo: Th10 18, 2024 lúc 03:47 PM
-- Phiên bản máy phục vụ: 10.4.32-MariaDB
-- Phiên bản PHP: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Cơ sở dữ liệu: `musicart`
--

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `comment`
--

CREATE TABLE `comment` (
  `id` int(11) NOT NULL,
  `description` text NOT NULL,
  `username` varchar(255) NOT NULL,
  `title` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `contact`
--

CREATE TABLE `contact` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `subject` varchar(255) NOT NULL,
  `message` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `contact`
--

INSERT INTO `contact` (`id`, `name`, `email`, `subject`, `message`) VALUES
(1, 'huudatlego', 'huudat.peashooer@gmail.com', 'Nhạc J97', 'Thêm nhạc jack đi ạ'),
(2, 'huudatlego', 'huudat.peashooer@gmail.com', 'Nhạc J97', 'thêm nahcj');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `favorite`
--

CREATE TABLE `favorite` (
  `id` int(11) NOT NULL,
  `title` varchar(255) NOT NULL,
  `username` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `singer`
--

CREATE TABLE `singer` (
  `singer_id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `image` varchar(255) NOT NULL,
  `age` int(11) DEFAULT NULL,
  `description` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `singer`
--

INSERT INTO `singer` (`singer_id`, `name`, `image`, `age`, `description`) VALUES
(1, 'Sơn Tùng MTP', 'sontung.jpg', 30, 'Nguyễn Thanh Tùng (born 5 July 1994), known as Sơn Tùng M-TP, is a Vietnamese singer-songwriter \r\nand actor. Born in Thái Bình, he showed musical talent from age two. His self-written singles \r\n<b>Cơn mưa ngang qua</b> (2012) and <b>Em của ngày hôm qua</b> (2013) launched his career, followed by \r\nhits like <b>Chắc ai đó sẽ về</b>, <b>Lạc trôi</b>, and <b>Nơi này có anh</b>. In 2017, he released the \r\ncompilation album <b>M-tp M-TP</b> and his autobiography, <b>Chạm tới giấc mơ</b>.\r\n'),
(2, 'Taylor Swift', 'talor.jpg', 25, 'Taylor Alison Swift là một nữ ca sĩ kiêm nhạc sĩ sáng tác bài hát người Mỹ. Cô nhận được nhiều sự quan tâm rộng rãi đến từ truyền thông và công chúng cũng như được nhiều ấn phẩm vinh danh là một trong những gương mặt tiêu biểu trong các danh sách hàng đầu. Bên cạnh phong cách nghệ thuật đa dạng, khả năng sáng tác nhạc và tư duy kinh doanh của cô có sức ảnh hưởng lớn đến ngành công nghiệp âm nhạc và văn hóa đại chúng, Swift còn là một người tích cực tham gia các hoạt động xã hội và chính trị nhằm trao từ thiện, ủng hộ quyền nghệ sĩ và nữ quyền.'),
(3, 'Jack 97', 'jack.jpg', 25, 'Trịnh Trần Phương Tuấn, thường được biết đến với nghệ danh Jack – J97, là một nam ca sĩ kiêm sáng tác nhạc, rapper, diễn viên người Việt Nam'),
(4, 'Nal', 'nal.png', 30, 'nal'),
(5, 'huyle', 'Conan1.jpg', 30, 'huyle');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `song`
--

CREATE TABLE `song` (
  `song_id` int(11) NOT NULL,
  `title` varchar(100) NOT NULL,
  `image` varchar(255) NOT NULL,
  `singer` varchar(255) NOT NULL,
  `file_name` varchar(100) NOT NULL,
  `description` text NOT NULL,
  `views` int(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `song`
--

INSERT INTO `song` (`song_id`, `title`, `image`, `singer`, `file_name`, `description`, `views`) VALUES
(1, 'Hãy trao cho anh', 'hay-trao-cho-anh.jpg', 'Sơn Tùng MTP', 'hay-trao-cho-anh.mp3', '', 23),
(2, 'Em của ngày hôm qua', 'em-cua-ngay-hom-qua.jpg', 'Sơn Tùng MTP', 'em-cua-ngay-hom-qua.mp3', '', 47),
(3, 'Making my way', 'making-my-way.jpg', 'Sơn Tùng MTP', 'making-my-way.mp3', '', 64),
(4, 'Đừng làm trái tim anh đau', 'dung-lam-trai-tim-anh-dau.jpg', 'Sơn Tùng MTP', 'dung-lam-trai-tim-anh-dau.mp3', '', 104),
(5, 'Sóng gió', 'song-gio.png', 'Jack 97', 'song-gio.mp3', '\"Sóng gió\" là một đĩa đơn của nhà sản xuất âm nhạc người Việt Nam KHÁNH và ca sĩ kiêm sáng tác nhạc, rapper người Việt Nam – Jack – J97 sáng tác và trình bày, được ra mắt vào lúc 20h ngày 12 tháng 7 năm 2019 trên Zing MP3 cùng với một video âm nhạc (MV) trên kênh YouTube của KHÁNH. Sóng gió trở thành một trong những ca khúc thành công nhất trong sự nghiệp của Jack, và là một trong những ca khúc nổi bật nhất năm 2019. Trước đó, teaser của MV này cũng từng lọt top 2 trending YouTube cùng hơn 3 triệu lượt xem. Các từ khóa \"J97\", \"Sóng gió\"... cũng lọt top tìm kiếm trên Google.', 118),
(6, 'Bạc Phận', 'bac-phan.jpg', 'Jack 97', 'bac-phan.mp3', '', 40),
(7, 'mây', 'sơ đò.png', 'Jack 97', 'Mây Remix - Jank x Sỹ Tây x Orinn - Mây Hòa Theo Gió Có Người Đơn Phương Remix Hot TikTok.mp3', 'mây', 2),
(8, 'thay lòng', 'sơ đò.png', 'Jack 97', 'Thay Lòng - NAL x TVK x Truzg -Cover Sáo Trúc Nhạc Hót Tiktok- - Sáo Trúc Bính Trần.mp3', 'thay lòng', 5),
(9, 'không bằng', 'sơ đò.png', 'Jack 97', 'Không Bằng.mp3', 'mây', 3);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `user`
--

CREATE TABLE `user` (
  `id` int(10) NOT NULL,
  `username` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `role` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `user`
--

INSERT INTO `user` (`id`, `username`, `email`, `password`, `role`) VALUES
(1, 'admin', 'admin@gmail.com', '123456', 'admin'),
(3, '522h00812', 'huudat.peashooer@gmail.com', 'huudat', 'user'),
(4, 'admin', 'admin@gmail.com', '1234', 'admin'),
(5, 'nam', 'nam@gmail.com', 'huudat', 'user');

--
-- Chỉ mục cho các bảng đã đổ
--

--
-- Chỉ mục cho bảng `comment`
--
ALTER TABLE `comment`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `contact`
--
ALTER TABLE `contact`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `favorite`
--
ALTER TABLE `favorite`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `singer`
--
ALTER TABLE `singer`
  ADD PRIMARY KEY (`singer_id`);

--
-- Chỉ mục cho bảng `song`
--
ALTER TABLE `song`
  ADD PRIMARY KEY (`song_id`);

--
-- Chỉ mục cho bảng `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT cho các bảng đã đổ
--

--
-- AUTO_INCREMENT cho bảng `comment`
--
ALTER TABLE `comment`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `contact`
--
ALTER TABLE `contact`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT cho bảng `favorite`
--
ALTER TABLE `favorite`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `singer`
--
ALTER TABLE `singer`
  MODIFY `singer_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT cho bảng `song`
--
ALTER TABLE `song`
  MODIFY `song_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT cho bảng `user`
--
ALTER TABLE `user`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
