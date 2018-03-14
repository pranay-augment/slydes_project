-- phpMyAdmin SQL Dump
-- version 4.7.4
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Feb 27, 2018 at 02:57 PM
-- Server version: 10.1.26-MariaDB
-- PHP Version: 7.0.23

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `augment_slydes`
--

-- --------------------------------------------------------

--
-- Table structure for table `roles`
--

CREATE TABLE `roles` (
  `id` int(11) NOT NULL,
  `role_name` varchar(255) NOT NULL,
  `created_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_date` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `roles`
--

INSERT INTO `roles` (`id`, `role_name`, `created_date`, `updated_date`) VALUES
(1, 'Super Admin', '2018-02-20 16:21:25', '0000-00-00 00:00:00'),
(2, 'User', '2018-02-20 16:21:25', '0000-00-00 00:00:00');

-- --------------------------------------------------------

--
-- Table structure for table `shared_slides`
--

CREATE TABLE `shared_slides` (
  `id` int(11) NOT NULL,
  `slide_id` int(11) NOT NULL,
  `email` varchar(255) NOT NULL,
  `activation_key` varchar(255) NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '1',
  `created_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `shared_slides`
--

INSERT INTO `shared_slides` (`id`, `slide_id`, `email`, `activation_key`, `status`, `created_date`) VALUES
(1, 3, 'ussain@goaugment.io', 'Slydes-ct5o4cw8je4cxi6i-2018-02-26 15:07:33', 1, '2018-02-26 15:07:33'),
(2, 3, ' ussain2@goaugment.io', 'Slydes-ct5o4cw8je4cxi6n-2018-02-26 15:07:33', 1, '2018-02-26 15:07:33'),
(3, 3, ' ussain3@goaugment.io', 'Slydes-ct5o4cw8je4cxi6o-2018-02-26 15:07:33', 1, '2018-02-26 15:07:33'),
(4, 3, ' ussain@goaugment.io', 'Slydes-ct5o4cw8je4cxi6p-2018-02-26 15:07:33', 1, '2018-02-26 15:07:33'),
(5, 3, 'ussain@goaugment.io', 'Slydes-ct5o4cw8je4cypso-2018-02-26 15:08:30', 1, '2018-02-26 15:08:30'),
(6, 3, ' ussain2@goaugment.io', 'Slydes-ct5o4cw8je4cypsp-2018-02-26 15:08:30', 1, '2018-02-26 15:08:30'),
(7, 3, ' ussain3@goaugment.io', 'Slydes-ct5o4cw8je4cypsq-2018-02-26 15:08:30', 1, '2018-02-26 15:08:30'),
(8, 3, ' ussain@goaugment.io', 'Slydes-ct5o4cw8je4cypsr-2018-02-26 15:08:30', 1, '2018-02-26 15:08:30'),
(9, 3, 'ussain@goaugment.io', 'Slydes-ct5o4cw8je4d8mdw-2018-02-26 15:16:12', 1, '2018-02-26 15:16:12'),
(10, 3, 'ussain@goaugment.io', 'Slydes-ct5o4cw8je4db6zn-2018-02-26 15:18:12', 1, '2018-02-26 15:18:12'),
(11, 3, 'ussain@goaugment.io', 'Slydes-ct5o4rcje4dct3n-2018-02-26 15:19:27', 1, '2018-02-26 15:19:27'),
(12, 3, 'ussain@goaugment.io', 'Slydes-ct5o4rcje4dfsg9-2018-02-26 15:21:46', 1, '2018-02-26 15:21:46'),
(13, 1, 'ussain@goaugment.io', 'Slydes-ct5o48iwje5pitjx-2018-02-27 13:47:49', 1, '2018-02-27 13:47:49'),
(14, 1, 'ussain@goaugment.io', 'Slydes-ct5o4hocje5pjytw-2018-02-27 13:48:43', 1, '2018-02-27 13:48:43'),
(15, 1, 'ussain@goaugment.io', 'Slydes-ct5o4hocje5pmrjf-2018-02-27 13:50:53', 1, '2018-02-27 13:50:53');

-- --------------------------------------------------------

--
-- Table structure for table `slides`
--

CREATE TABLE `slides` (
  `id` int(11) NOT NULL,
  `slide_title` varchar(255) NOT NULL,
  `slide_description` longtext NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '1',
  `created_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_date` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `slides`
--

INSERT INTO `slides` (`id`, `slide_title`, `slide_description`, `status`, `created_date`, `updated_date`) VALUES
(1, 'First slide', 'First slide description', 1, '2018-02-22 14:44:56', '0000-00-00 00:00:00'),
(2, 'Second slide', 'Second slide description', 1, '2018-02-22 14:44:56', '0000-00-00 00:00:00'),
(3, 'Third slide', 'Third slide description', 1, '2018-02-22 14:44:56', '0000-00-00 00:00:00'),
(4, 'Fourth slide', 'Fourth slide description', 1, '2018-02-22 14:44:56', '0000-00-00 00:00:00'),
(5, 'Fifth slide', 'Fifth slide description', 1, '2018-02-22 14:44:56', '0000-00-00 00:00:00');

-- --------------------------------------------------------

--
-- Table structure for table `slide_audio`
--

CREATE TABLE `slide_audio` (
  `id` int(11) NOT NULL,
  `audio_src` longtext NOT NULL,
  `slide_id` int(11) NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '1',
  `created_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `slide_image`
--

CREATE TABLE `slide_image` (
  `id` int(11) NOT NULL,
  `image_src` varchar(255) NOT NULL,
  `slide_id` int(11) NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '1',
  `created_date` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_date` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `slide_image`
--

INSERT INTO `slide_image` (`id`, `image_src`, `slide_id`, `status`, `created_date`, `updated_date`) VALUES
(1, '08-Square Company profile Brochure.jpg', 1, 1, '2018-02-22 14:49:43', '0000-00-00 00:00:00'),
(2, '1.jpg', 1, 1, '2018-02-22 14:49:43', '0000-00-00 00:00:00'),
(3, '2.jpg', 2, 1, '2018-02-22 14:49:43', '0000-00-00 00:00:00'),
(4, '3.jpg', 2, 1, '2018-02-22 14:49:43', '0000-00-00 00:00:00'),
(5, '5.jpg', 2, 1, '2018-02-22 14:49:43', '0000-00-00 00:00:00'),
(6, '2.jpg', 3, 1, '2018-02-22 14:49:43', '0000-00-00 00:00:00'),
(7, '4.jpg', 3, 1, '2018-02-22 14:49:43', '0000-00-00 00:00:00'),
(8, '4.jpg', 4, 1, '2018-02-22 14:49:43', '0000-00-00 00:00:00'),
(9, '2.jpg', 5, 1, '2018-02-22 14:49:43', '0000-00-00 00:00:00');

-- --------------------------------------------------------

--
-- Table structure for table `slide_video`
--

CREATE TABLE `slide_video` (
  `id` int(11) NOT NULL,
  `video_src` longtext NOT NULL,
  `slide_id` int(11) NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '1',
  `created_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `email` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `role` int(11) NOT NULL DEFAULT '2',
  `company_name` varchar(255) NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '1',
  `created_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `email`, `password`, `role`, `company_name`, `status`, `created_date`) VALUES
(1, 'ussain@goaugment.io', 'sha1$71b24629$1$d5958d8cdc0e93e5dc9d0e187353ad67e1aac19a', 1, 'augment', 1, '2018-02-20 15:54:14'),
(2, 'krishna@goaugment.io', 'sha1$4e05c83e$1$b48dc90336906ff0e981c15ef493c9b75d21efc4', 2, 'augment', 1, '2018-02-20 16:30:43'),
(3, 'ussain+1@goaugment.io', 'sha1$d7a876c8$1$491f9dbad4b749b1bfd79cb948be086e2e52d146', 2, 'augment', 1, '2018-02-21 13:20:40');

-- --------------------------------------------------------

--
-- Table structure for table `user_slide`
--

CREATE TABLE `user_slide` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `slide_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `user_slide`
--

INSERT INTO `user_slide` (`id`, `user_id`, `slide_id`) VALUES
(1, 2, 1),
(2, 3, 2),
(3, 2, 3),
(4, 3, 4),
(5, 3, 5);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `roles`
--
ALTER TABLE `roles`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `shared_slides`
--
ALTER TABLE `shared_slides`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `slides`
--
ALTER TABLE `slides`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `slide_audio`
--
ALTER TABLE `slide_audio`
  ADD PRIMARY KEY (`id`),
  ADD KEY `slide-audio` (`slide_id`);

--
-- Indexes for table `slide_image`
--
ALTER TABLE `slide_image`
  ADD PRIMARY KEY (`id`),
  ADD KEY `slide_img` (`slide_id`);

--
-- Indexes for table `slide_video`
--
ALTER TABLE `slide_video`
  ADD PRIMARY KEY (`id`),
  ADD KEY `slide_vdeo` (`slide_id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `email` (`email`);

--
-- Indexes for table `user_slide`
--
ALTER TABLE `user_slide`
  ADD PRIMARY KEY (`id`),
  ADD KEY `slide_usr` (`user_id`),
  ADD KEY `usr_slide` (`slide_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `roles`
--
ALTER TABLE `roles`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `shared_slides`
--
ALTER TABLE `shared_slides`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT for table `slides`
--
ALTER TABLE `slides`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `slide_audio`
--
ALTER TABLE `slide_audio`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `slide_image`
--
ALTER TABLE `slide_image`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `slide_video`
--
ALTER TABLE `slide_video`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `user_slide`
--
ALTER TABLE `user_slide`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `slide_audio`
--
ALTER TABLE `slide_audio`
  ADD CONSTRAINT `slide-audio` FOREIGN KEY (`slide_id`) REFERENCES `slides` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `slide_image`
--
ALTER TABLE `slide_image`
  ADD CONSTRAINT `slide_img` FOREIGN KEY (`slide_id`) REFERENCES `slides` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `slide_video`
--
ALTER TABLE `slide_video`
  ADD CONSTRAINT `slide_vdeo` FOREIGN KEY (`slide_id`) REFERENCES `slides` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `user_slide`
--
ALTER TABLE `user_slide`
  ADD CONSTRAINT `slide_usr` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `usr_slide` FOREIGN KEY (`slide_id`) REFERENCES `slides` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
