-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: May 14, 2025 at 12:30 PM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `period_management`
--

-- --------------------------------------------------------

--
-- Table structure for table `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `uuid` varchar(255) NOT NULL,
  `connection` text NOT NULL,
  `queue` text NOT NULL,
  `payload` longtext NOT NULL,
  `exception` longtext NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(255) NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(18, '2014_10_12_000000_create_users_table', 1),
(19, '2014_10_12_100000_create_password_reset_tokens_table', 1),
(20, '2019_08_19_000000_create_failed_jobs_table', 1),
(21, '2019_12_14_000001_create_personal_access_tokens_table', 1),
(22, '2025_05_13_090701_add_column_phone_to_users_table', 1),
(23, '2025_05_13_111330_create_time_tables_table', 1),
(24, '2025_05_13_130642_create_time_table_details_table', 2);

-- --------------------------------------------------------

--
-- Table structure for table `password_reset_tokens`
--

CREATE TABLE `password_reset_tokens` (
  `email` varchar(255) NOT NULL,
  `token` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `personal_access_tokens`
--

CREATE TABLE `personal_access_tokens` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `tokenable_type` varchar(255) NOT NULL,
  `tokenable_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `token` varchar(64) NOT NULL,
  `abilities` text DEFAULT NULL,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `expires_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `time_tables`
--

CREATE TABLE `time_tables` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `class` varchar(255) NOT NULL,
  `no_of_days` int(11) NOT NULL DEFAULT 0,
  `no_of_periods` int(11) NOT NULL DEFAULT 0,
  `start_time` time NOT NULL,
  `period_duration` int(11) NOT NULL,
  `breaks` int(11) NOT NULL DEFAULT 0,
  `break_details` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`break_details`)),
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `time_tables`
--

INSERT INTO `time_tables` (`id`, `user_id`, `class`, `no_of_days`, `no_of_periods`, `start_time`, `period_duration`, `breaks`, `break_details`, `deleted_at`, `created_at`, `updated_at`) VALUES
(1, 1, '1', 0, 0, '17:14:00', 47, 3, '[{\"after_period\":\"2\",\"duration\":\"10\"},{\"after_period\":\"4\",\"duration\":\"30\"},{\"after_period\":\"6\",\"duration\":\"10\"}]', NULL, '2025-05-13 06:14:41', '2025-05-13 06:14:41'),
(2, 1, '1', 0, 0, '17:14:00', 47, 3, '[{\"after_period\":\"2\",\"duration\":\"10\"},{\"after_period\":\"4\",\"duration\":\"30\"},{\"after_period\":\"6\",\"duration\":\"10\"}]', NULL, '2025-05-13 06:19:56', '2025-05-13 06:19:56'),
(3, 1, '1', 6, 6, '17:14:00', 47, 3, '[{\"after_period\":\"2\",\"duration\":\"10\"},{\"after_period\":\"4\",\"duration\":\"30\"},{\"after_period\":\"6\",\"duration\":\"10\"}]', NULL, '2025-05-13 06:20:31', '2025-05-13 06:20:31'),
(4, 1, '1', 6, 6, '17:14:00', 60, 3, '[{\"after_period\":\"2\",\"duration\":\"10\"},{\"after_period\":\"4\",\"duration\":\"30\"},{\"after_period\":\"6\",\"duration\":\"10\"}]', NULL, '2025-05-13 06:20:42', '2025-05-13 06:20:42'),
(5, 2, '1', 4, 5, '20:48:00', 60, 2, '[{\"after_period\":\"2\",\"duration\":\"10\"},{\"after_period\":\"4\",\"duration\":\"20\"}]', NULL, '2025-05-13 08:48:52', '2025-05-13 08:48:52'),
(6, 2, '2', 6, 6, '22:34:00', 59, 2, '[{\"after_period\":\"3\",\"duration\":\"10\"},{\"after_period\":\"6\",\"duration\":\"20\"}]', NULL, '2025-05-13 10:34:38', '2025-05-13 10:34:38'),
(7, 1, '3', 5, 4, '09:11:00', 45, 2, '[{\"after_period\":\"3\",\"duration\":\"30\"},{\"after_period\":\"2\",\"duration\":\"10\"}]', NULL, '2025-05-13 22:12:18', '2025-05-13 22:12:18'),
(8, 1, '5', 3, 6, '10:37:00', 60, 2, '[{\"after_period\":\"2\",\"duration\":\"10\"},{\"after_period\":\"4\",\"duration\":\"30\"}]', NULL, '2025-05-13 22:37:54', '2025-05-13 22:37:54'),
(9, 3, '1', 6, 6, '11:10:00', 60, 3, '[{\"after_period\":\"2\",\"duration\":\"10\"},{\"after_period\":\"4\",\"duration\":\"30\"},{\"after_period\":\"6\",\"duration\":\"10\"}]', NULL, '2025-05-13 23:11:19', '2025-05-13 23:11:19'),
(10, 7, '1', 4, 6, '11:00:00', 50, 2, '[{\"after_period\":\"2\",\"duration\":\"10\"},{\"after_period\":\"4\",\"duration\":\"30\"}]', NULL, '2025-05-14 00:00:49', '2025-05-14 00:00:49'),
(11, 7, '2', 7, 6, '13:04:00', 60, 3, '[{\"after_period\":\"2\",\"duration\":\"10\"},{\"after_period\":\"4\",\"duration\":\"30\"},{\"after_period\":\"6\",\"duration\":\"10\"}]', NULL, '2025-05-14 00:04:44', '2025-05-14 00:04:44'),
(12, 8, '3', 5, 8, '09:15:00', 45, 3, '[{\"after_period\":\"2\",\"duration\":\"10\"},{\"after_period\":\"4\",\"duration\":\"25\"},{\"after_period\":\"6\",\"duration\":\"13\"}]', NULL, '2025-05-14 04:50:25', '2025-05-14 04:50:25');

-- --------------------------------------------------------

--
-- Table structure for table `time_table_details`
--

CREATE TABLE `time_table_details` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `time_table_id` bigint(20) UNSIGNED NOT NULL,
  `day` varchar(255) NOT NULL,
  `period_index` int(10) UNSIGNED NOT NULL,
  `subject` varchar(255) NOT NULL,
  `teacher` varchar(255) NOT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `time_table_details`
--

INSERT INTO `time_table_details` (`id`, `user_id`, `time_table_id`, `day`, `period_index`, `subject`, `teacher`, `deleted_at`, `created_at`, `updated_at`) VALUES
(1, 1, 4, 'Monday', 0, 'ew', 'qw', NULL, '2025-05-13 08:43:37', '2025-05-14 04:10:12'),
(2, 1, 4, 'Monday', 1, 'tets', '100', NULL, '2025-05-13 08:46:30', '2025-05-14 04:08:42'),
(3, 2, 5, 'Monday', 0, 'qeqwr', 'werwer', NULL, '2025-05-13 08:50:08', '2025-05-13 09:13:33'),
(4, 2, 5, 'Monday', 1, 'adasd', 'asdasd', NULL, '2025-05-13 08:55:58', '2025-05-13 09:09:37'),
(5, 2, 6, 'Monday', 0, 'werwer', 'werwer', NULL, '2025-05-13 10:35:46', '2025-05-13 10:35:46'),
(6, 2, 6, 'Monday', 1, 'hvuhu', 'bhbij', NULL, '2025-05-13 10:36:40', '2025-05-13 10:36:40'),
(7, 2, 6, 'Monday', 2, 'ftyfyt', 'hbn jb', NULL, '2025-05-13 10:37:11', '2025-05-13 10:37:11'),
(8, 2, 6, 'Monday', 4, 'fsdfsd', 'sfsdfsf', NULL, '2025-05-13 11:58:48', '2025-05-13 11:58:48'),
(9, 2, 6, 'Monday', 5, 'dfsdf', 'dvfsdf', NULL, '2025-05-13 12:06:29', '2025-05-13 12:06:29'),
(10, 2, 6, 'Monday', 6, 'fddhggh', 'gcg', NULL, '2025-05-13 12:20:12', '2025-05-13 12:20:12'),
(11, 2, 6, 'Tuesday', 0, 'yufyf', 'jjhhj', NULL, '2025-05-13 12:21:54', '2025-05-13 12:21:54'),
(12, 1, 7, 'Monday', 0, 'tyty', 'vbvn', NULL, '2025-05-13 22:14:14', '2025-05-13 22:14:14'),
(13, 1, 7, 'Monday', 1, 'tfhfjh', 'bvvvv', NULL, '2025-05-13 22:36:47', '2025-05-13 22:36:47'),
(14, 1, 8, 'Wednesday', 7, 'rrrr', 'bbbb', NULL, '2025-05-13 22:38:06', '2025-05-13 22:38:06'),
(15, 1, 8, 'Tuesday', 0, 'wwww', 'qqqqq', NULL, '2025-05-13 22:38:19', '2025-05-13 22:38:19'),
(16, 1, 4, 'Saturday', 7, 'dasdasduoiuoi', 'asdasd', NULL, '2025-05-13 22:55:41', '2025-05-13 22:55:41'),
(17, 3, 9, 'Monday', 0, 'rrrr', 'rrrr', NULL, '2025-05-13 23:33:40', '2025-05-13 23:33:40'),
(18, 7, 10, 'Monday', 0, 'test', 'test100', NULL, '2025-05-14 00:01:05', '2025-05-14 00:01:05'),
(19, 7, 11, 'Wednesday', 3, 'vicky', 'vicky', NULL, '2025-05-14 00:05:07', '2025-05-14 00:05:07'),
(20, 7, 11, 'Sunday', 7, 'testing', 'testing', NULL, '2025-05-14 00:05:21', '2025-05-14 00:05:21'),
(21, 7, 10, 'Monday', 4, 'vvv', 'bbb', NULL, '2025-05-14 01:35:25', '2025-05-14 01:35:25'),
(22, 1, 4, 'Monday', 4, 'test', 'test', NULL, '2025-05-14 03:54:53', '2025-05-14 03:54:53'),
(23, 1, 4, 'Monday', 6, 'te', 'te', NULL, '2025-05-14 04:12:28', '2025-05-14 04:12:28'),
(24, 1, 4, 'Tuesday', 0, 're', 're', NULL, '2025-05-14 04:14:12', '2025-05-14 04:14:12'),
(25, 1, 4, 'Tuesday', 3, 're', 're', NULL, '2025-05-14 04:17:58', '2025-05-14 04:17:58'),
(26, 1, 4, 'Wednesday', 0, 'ee', 'ee', NULL, '2025-05-14 04:21:59', '2025-05-14 04:21:59'),
(27, 1, 4, 'Wednesday', 1, '22', '22', NULL, '2025-05-14 04:22:34', '2025-05-14 04:22:34'),
(28, 1, 4, 'Wednesday', 3, '2', '2', NULL, '2025-05-14 04:23:26', '2025-05-14 04:23:26'),
(29, 1, 4, 'Wednesday', 4, '55', '77', NULL, '2025-05-14 04:27:32', '2025-05-14 04:27:32'),
(30, 1, 4, 'Friday', 0, '77', '77', NULL, '2025-05-14 04:31:41', '2025-05-14 04:31:41'),
(31, 8, 12, 'Monday', 0, 'english', 'bala', NULL, '2025-05-14 04:51:09', '2025-05-14 04:51:09'),
(32, 8, 12, 'Friday', 10, 'tamil', 'bala2', NULL, '2025-05-14 04:51:36', '2025-05-14 04:51:36'),
(33, 8, 12, 'Wednesday', 4, 'physics', 'kumar', NULL, '2025-05-14 04:52:07', '2025-05-14 04:52:07');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `phone` varchar(15) DEFAULT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) NOT NULL,
  `remember_token` varchar(100) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `phone`, `email_verified_at`, `password`, `remember_token`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 'test', 'test@gmail.com', '6385843353', NULL, '$2y$10$qAGlyViOsvBCidzsDS3F.uFx6npbV442nXmNLSsYkQ/Qb4c1pWDha', NULL, '2025-05-13 06:13:41', '2025-05-13 06:13:41', NULL),
(2, 'vicky', 'vicky@gmail.com', '6354634637', NULL, '$2y$10$6kYQKwSVwmDLE9DV0of0MeqEfR2.cI6QEepFpfd2tKCM..ZSTufRq', NULL, '2025-05-13 08:47:52', '2025-05-13 08:47:52', NULL),
(3, 'test100', 'test100@gmail.com', '8907676789', NULL, '$2y$10$pTryAapk9o/u8LeBL6qHdOmoRMf03w5bh4XERqU018q60zj9ZR3gi', NULL, '2025-05-13 23:09:31', '2025-05-13 23:09:31', NULL),
(4, 'jyfhfhj', 'qwe@gmail.com', '6776767676', NULL, '$2y$10$hIIgdBgF4oYrusZkONBL2.C39O/1F/2qQEAelIbA25bbCdvhNuy3O', NULL, '2025-05-13 23:40:12', '2025-05-13 23:40:12', NULL),
(5, 'ewq', 'ewq@gmail.com', '789898989', NULL, '$2y$10$5G6W035IY4gyCVbHEpsWGOklTHYUcaH7ON17rtxDlPuleSeYahjxu', NULL, '2025-05-13 23:43:33', '2025-05-13 23:43:33', NULL),
(6, 'asd', 'asd@gmail.com', '8989898989', NULL, '$2y$10$8LVuSvY1GKJ9hlSkuSr9Qu5tEF5NxPj7UCkl.nWSRMDcKLkFn/146', NULL, '2025-05-13 23:45:52', '2025-05-13 23:45:52', NULL),
(7, 'auth', 'auth@gmail.com', '6385843353', NULL, '$2y$10$DRwHNfwlwYQcKZTbFFFETOAIt/MawndYbtj0S4NMHYaD39ttkKZtm', NULL, '2025-05-13 23:57:51', '2025-05-13 23:57:51', NULL),
(8, 'raju', 'raju@gmail.com', '6385843353', NULL, '$2y$10$0Fd/i.RMvl/ei/4KSt3M3OGweD.9E0/gq.p4AlGCBzrBwaBsqULNW', NULL, '2025-05-14 04:48:03', '2025-05-14 04:48:03', NULL),
(9, 'kumar', 'kumar@gmail.com', '8760992575', NULL, '$2y$10$JsESxl8YFIOyFVHjuC4LbuGVJ4Ha8ZJlbZf9upR1RcvmHjAccytoC', NULL, '2025-05-14 04:52:52', '2025-05-14 04:52:52', NULL);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `password_reset_tokens`
--
ALTER TABLE `password_reset_tokens`
  ADD PRIMARY KEY (`email`);

--
-- Indexes for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  ADD KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`);

--
-- Indexes for table `time_tables`
--
ALTER TABLE `time_tables`
  ADD PRIMARY KEY (`id`),
  ADD KEY `time_tables_user_id_foreign` (`user_id`);

--
-- Indexes for table `time_table_details`
--
ALTER TABLE `time_table_details`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `time_table_details_timetable_id_day_period_index_unique` (`time_table_id`,`day`,`period_index`),
  ADD KEY `time_table_details_user_id_foreign` (`user_id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=25;

--
-- AUTO_INCREMENT for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `time_tables`
--
ALTER TABLE `time_tables`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `time_table_details`
--
ALTER TABLE `time_table_details`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=34;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `time_tables`
--
ALTER TABLE `time_tables`
  ADD CONSTRAINT `time_tables_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `time_table_details`
--
ALTER TABLE `time_table_details`
  ADD CONSTRAINT `time_table_details_timetable_id_foreign` FOREIGN KEY (`time_table_id`) REFERENCES `time_tables` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `time_table_details_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
