-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Dec 19, 2022 at 01:14 PM
-- Server version: 10.4.25-MariaDB
-- PHP Version: 7.4.30

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `salon`
--

-- --------------------------------------------------------

--
-- Table structure for table `bookings`
--

CREATE TABLE `bookings` (
  `id` int(10) UNSIGNED NOT NULL,
  `service_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `phone_number` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `status` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'pending',
  `booking_date` date NOT NULL,
  `booking_time` varchar(500) COLLATE utf8_unicode_ci NOT NULL,
  `quantity` int(11) NOT NULL DEFAULT 1,
  `comment` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `adult` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `children` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `booking_bill` double NOT NULL,
  `calendar_event_id` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `bookings`
--

INSERT INTO `bookings` (`id`, `service_id`, `user_id`, `phone_number`, `status`, `booking_date`, `booking_time`, `quantity`, `comment`, `adult`, `children`, `booking_bill`, `calendar_event_id`, `created_at`, `updated_at`) VALUES
(1, 1, 1, '+91 92859 35366', 'canceled', '2022-11-16', 'a:1:{i:0;s:8:\"11:20:00\";}', 1, NULL, '1', '0', 100, 'a:0:{}', '2022-11-01 04:14:51', '2022-12-01 06:43:56'),
(2, 1, 4, '+91 97197 57533', 'confirmed', '2022-11-01', 'a:1:{i:0;s:8:\"14:00:00\";}', 1, NULL, '1', '0', 100, 'a:0:{}', '2022-11-01 08:14:47', '2022-12-01 06:42:08'),
(4, 3, 1, '+91 96197 57533', 'confirmed', '2022-11-23', 'a:1:{i:0;s:8:\"13:15:00\";}', 1, NULL, '1', '0', 200, 'a:0:{}', '2022-11-04 06:28:02', '2022-11-04 06:29:15');

-- --------------------------------------------------------

--
-- Table structure for table `break_times`
--

CREATE TABLE `break_times` (
  `id` int(10) UNSIGNED NOT NULL,
  `title` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `start_time` time DEFAULT NULL,
  `end_time` time DEFAULT NULL,
  `is_enable` tinyint(1) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `contacts`
--

CREATE TABLE `contacts` (
  `id` int(10) UNSIGNED NOT NULL,
  `email` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `subject` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `message` text COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `contact_infos`
--

CREATE TABLE `contact_infos` (
  `id` int(10) UNSIGNED NOT NULL,
  `title` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `sub_title` text COLLATE utf8_unicode_ci NOT NULL,
  `address` text COLLATE utf8_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `phone` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `contact_infos`
--

INSERT INTO `contact_infos` (`id`, `title`, `sub_title`, `address`, `email`, `phone`, `created_at`, `updated_at`) VALUES
(1, 'Contact Us', 'We\'d love to hear from you and stay with us.', '', '', '', '2022-10-31 07:44:24', '2022-10-31 07:44:24');

-- --------------------------------------------------------

--
-- Table structure for table `custom_data_fields`
--

CREATE TABLE `custom_data_fields` (
  `id` int(10) UNSIGNED NOT NULL,
  `table_name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `data_id` int(11) NOT NULL,
  `custom_fields_id` int(11) NOT NULL,
  `value` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `custom_fields`
--

CREATE TABLE `custom_fields` (
  `id` int(10) UNSIGNED NOT NULL,
  `field_type` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `options` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `label` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `table_name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `service_id` int(11) DEFAULT NULL,
  `is_enable` tinyint(4) NOT NULL DEFAULT 1,
  `show_in_table` tinyint(4) NOT NULL DEFAULT 0,
  `visible_in_client` tinyint(4) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `email_templates`
--

CREATE TABLE `email_templates` (
  `id` int(10) UNSIGNED NOT NULL,
  `template_type` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `template_subject` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `default_content` longtext COLLATE utf8_unicode_ci NOT NULL,
  `custom_content` longtext COLLATE utf8_unicode_ci NOT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `email_templates`
--

INSERT INTO `email_templates` (`id`, `template_type`, `template_subject`, `default_content`, `custom_content`, `created_at`, `updated_at`) VALUES
(1, 'user_invitation', 'Invitation', '<html>\n                            <div style=\"width: 50%; color: #333333; font-family: Helvetica; margin:auto; padding-bottom: 10px;\">\n                                <div style=\"text-align:center; padding-top: 10px; padding-bottom: 10px;\">\n                                    <h1>{app_name}</h1>\n                                </div>\n                                <div style=\"padding: 35px;padding-left:20px; border-bottom: 1px solid #cccccc; border-top: 1px solid #cccccc;\">Hi,<br>\n                The admin is inviting you to the Gain Booking\n                Please click here on the link {verification_link} to accept!        </div>\n                            </div>\n                        </html>', '', NULL, NULL),
(2, 'user_registration', 'Registration Confirmation', '<html>\n                            <div style=\"width: 50%; color: #333333; font-family: Helvetica; margin:auto; padding-bottom: 10px;\">\n                                <div style=\"text-align:center; padding-top: 10px; padding-bottom: 10px;\">\n                                    <h1>{app_name}</h1>\n                                </div>\n                                <div style=\"padding: 35px;padding-left:20px; border-bottom: 1px solid #cccccc; border-top: 1px solid #cccccc;\">Hi {first_name},<br><br>\n\n                        Your registration is completed.\n\n                        Please click the link {verification_link} here to confirm email.        </div>\n                            </div>\n                        </html>', '', NULL, NULL),
(3, 'reset_password', 'Reset Password', '<html>\n                            <div style=\"width: 50%; color: #333333; font-family: Helvetica; margin:auto; padding-bottom: 10px;\">\n                                <div style=\"text-align:center; padding-top: 10px; padding-bottom: 10px;\">\n                                    <h1>{app_name}</h1>\n                                </div>\n                                <div style=\"padding: 35px;padding-left:20px; border-bottom: 1px solid #cccccc; border-top: 1px solid #cccccc;\">Hi,<br><br>\n\n                        You requested to change your password\n\n                        Please click here on the link {reset_password_link} to change your password!        </div>\n                            </div>\n                        </html>', '', NULL, NULL),
(4, 'booking_received', 'Booking Received', '<html>\n                            <div style=\"width: 50%; color: #333333; font-family: Helvetica; margin:auto; padding-bottom: 10px;\">\n                                <div style=\"text-align:center; padding-top: 10px; padding-bottom: 10px;\">\n                                    <h1>{app_name}</h1>\n                                </div>\n                                <div style=\"padding: 35px;padding-left:20px; border-bottom: 1px solid #cccccc; border-top: 1px solid #cccccc;\">Hi {first_name},<br><br>\n\n                        Your booking is received.\n\n                        Please wait for Admins confirmation on your booking!\n\n                        <h3>Booking Summery</h3>\n\n                        <b>Booking ID:</b> {booking_id}<br>\n                        <b>Service Name:</b> {service_title}<br>\n                        <b>Quantity:</b> {booking_quantity}<br>\n                        <b>Status:</b> {booking_status}<br>\n                        <b>Date:</b> {booking_date}<br>\n                        <b>Slot:</b> {booking_slot}<br>\n                        <b>Payment:</b> {payment_status}        </div>\n                            </div>\n                        </html>', '', NULL, NULL),
(5, 'booking_confirmation', 'Booking Confirmation', '<html>\n                            <div style=\"width: 50%; color: #333333; font-family: Helvetica; margin:auto; padding-bottom: 10px;\">\n                                <div style=\"text-align:center; padding-top: 10px; padding-bottom: 10px;\">\n                                    <h1>{app_name}</h1>\n                                </div>\n                                <div style=\"padding: 35px;padding-left:20px; border-bottom: 1px solid #cccccc; border-top: 1px solid #cccccc;\">Hi {first_name},<br><br>\n\n                        Your booking has been confirmed.\n\n                        <h3>Booking Summery</h3>\n\n                        <b>Booking ID:</b> {booking_id}<br>\n                        <b>Service Name:</b> {service_title}<br>\n                        <b>Quantity:</b> {booking_quantity}<br>\n                        <b>Status:</b> {booking_status}<br>\n                        <b>Date:</b> {booking_date}<br>\n                        <b>Slot:</b> {booking_slot}<br>\n                        <b>Bill:</b> {bill}<br>\n                        <b>Payment:</b> {payment_status}        </div>\n                            </div>\n                        </html>', '', NULL, NULL),
(6, 'booking_rejected', 'Booking Rejected', '<html>\n                            <div style=\"width: 50%; color: #333333; font-family: Helvetica; margin:auto; padding-bottom: 10px;\">\n                                <div style=\"text-align:center; padding-top: 10px; padding-bottom: 10px;\">\n                                    <h1>{app_name}</h1>\n                                </div>\n                                <div style=\"padding: 35px;padding-left:20px; border-bottom: 1px solid #cccccc; border-top: 1px solid #cccccc;\">Hi {first_name},<br><br>\n\n                        We are very sorry to inform you that your booking is Canceled due to some unavailable reasons.\n                        Hoping you will be with us and we are bound to serve your satisfaction.\n\n                        <h3>Booking Summery</h3>\n\n                        <b>Booking ID:</b> {booking_id}<br>\n                        <b>Service Name:</b> {service_title}<br>\n                        <b>Status:</b> {booking_status}<br>\n                        <b>Quantity:</b> {booking_quantity}<br>\n                        <b>Date:</b> {booking_date}<br>\n                        <b>Slot:</b> {booking_slot}        </div>\n                            </div>\n                        </html>', '', NULL, NULL),
(7, 'contact_us', 'Contact Message', '<html>\n                            <div style=\"width: 50%; color: #333333; font-family: Helvetica; margin:auto; padding-bottom: 10px;\">\n                                <div style=\"text-align:center; padding-top: 10px; padding-bottom: 10px;\">\n                                    <h1>{app_name}</h1>\n                                </div>\n                                <div style=\"padding: 35px;padding-left:20px; border-bottom: 1px solid #cccccc; border-top: 1px solid #cccccc;\">Hi,<br><br>\n\n                        {message}        </div>\n                            </div>\n                        </html>', '', NULL, NULL),
(8, 'admin_notification_for_booking_request', 'Admin notification for booking request', '<html>\n                            <div style=\"width: 50%; color: #333333; font-family: Helvetica; margin:auto; padding-bottom: 10px;\">\n                                <div style=\"text-align:center; padding-top: 10px; padding-bottom: 10px;\">\n                                    <h1>{app_name}</h1>\n                                </div>\n                                <div style=\"padding: 35px;padding-left:20px; border-bottom: 1px solid #cccccc; border-top: 1px solid #cccccc;\">Hi {admin_name},<br><br>\n\n                        {customer_name} is requesting a booking. Please check for a response.\n\n                        <h3>Booking Summery</h3>\n\n                        <b>Booking ID:</b> {booking_id}<br>\n                        <b>Service Name:</b> {service_title}<br>\n                        <b>Quantity:</b> {booking_quantity}<br>\n                        <b>Status:</b> {booking_status}<br>\n                        <b>Date:</b> {booking_date}<br>\n                        <b>Slot:</b> {booking_slot}<br>\n                        <b>Payment:</b> {payment_status}        </div>\n                            </div>\n                        </html>', '', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `holidays`
--

CREATE TABLE `holidays` (
  `id` int(10) UNSIGNED NOT NULL,
  `title` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `start_date` date NOT NULL,
  `end_date` date NOT NULL,
  `created_by` int(11) NOT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `invites`
--

CREATE TABLE `invites` (
  `id` int(10) UNSIGNED NOT NULL,
  `email` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `invited_as` int(11) NOT NULL,
  `is_accepted` tinyint(1) NOT NULL DEFAULT 0,
  `invited_by` int(11) NOT NULL,
  `token` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `invites`
--

INSERT INTO `invites` (`id`, `email`, `invited_as`, `is_accepted`, `invited_by`, `token`, `created_at`, `updated_at`) VALUES
(1, 'akash.shinde@neosoftmail.com', 2, 1, 0, '', '2022-11-02 11:36:57', '2022-11-02 11:43:06');

-- --------------------------------------------------------

--
-- Table structure for table `invoices`
--

CREATE TABLE `invoices` (
  `id` int(10) UNSIGNED NOT NULL,
  `user_id` int(11) NOT NULL,
  `booking_id` int(11) NOT NULL,
  `total` double NOT NULL,
  `due` double NOT NULL DEFAULT 0,
  `created_by` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `comment` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `invoices`
--

INSERT INTO `invoices` (`id`, `user_id`, `booking_id`, `total`, `due`, `created_by`, `comment`, `created_at`, `updated_at`) VALUES
(1, 1, 1, 100, 100, '', NULL, '2022-11-01 04:14:51', '2022-11-01 04:14:51'),
(2, 4, 2, 100, 100, '', NULL, '2022-11-01 08:14:47', '2022-11-01 08:14:47'),
(3, 5, 3, 100, 100, '', NULL, '2022-11-02 14:51:54', '2022-11-02 14:51:54'),
(4, 1, 4, 200, 200, '', NULL, '2022-11-04 06:28:02', '2022-11-04 06:28:02');

-- --------------------------------------------------------

--
-- Table structure for table `invoice_items`
--

CREATE TABLE `invoice_items` (
  `id` int(10) UNSIGNED NOT NULL,
  `invoice_id` int(11) NOT NULL,
  `service_title` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `booking_date` date NOT NULL,
  `booking_time` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `unit_price` double NOT NULL,
  `quantity` int(11) NOT NULL DEFAULT 1,
  `total` double NOT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `invoice_items`
--

INSERT INTO `invoice_items` (`id`, `invoice_id`, `service_title`, `booking_date`, `booking_time`, `unit_price`, `quantity`, `total`, `created_at`, `updated_at`) VALUES
(1, 1, 'HairCut', '2022-11-16', 'a:1:{i:0;s:8:\"11:20:00\";}', 100, 1, 100, '2022-11-01 04:14:51', '2022-11-01 04:14:51'),
(2, 2, 'HairCut', '2022-11-01', 'a:1:{i:0;s:8:\"14:00:00\";}', 100, 1, 100, '2022-11-01 08:14:47', '2022-11-01 08:14:47'),
(3, 3, 'Spa', '2022-11-17', 'a:1:{i:0;s:8:\"10:00:00\";}', 100, 1, 100, '2022-11-02 14:51:54', '2022-11-02 14:51:54'),
(4, 4, 'Face Cleaning', '2022-11-23', 'a:1:{i:0;s:8:\"13:15:00\";}', 200, 1, 200, '2022-11-04 06:28:03', '2022-11-04 06:28:03');

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2014_10_12_000000_create_users_table', 1),
(2, '2014_10_12_100000_create_password_resets_table', 1),
(3, '2018_02_18_074635_create_services_table', 1),
(4, '2018_02_18_074728_create_bookings_table', 1),
(5, '2018_03_04_124154_create_settings_table', 1),
(6, '2018_03_05_134724_create_roles_table', 1),
(7, '2018_03_06_125804_create_email_templates_table', 1),
(8, '2018_03_11_081629_create_invites_table', 1),
(9, '2018_03_20_061001_create_holidays_table', 1),
(10, '2018_04_04_122419_create_notifications_table', 1),
(11, '2018_04_26_083111_create_reset_passes_table', 1),
(12, '2018_07_02_120259_create_payments_table', 1),
(13, '2018_07_05_131551_create_payment_methods_table', 1),
(14, '2019_01_17_115559_create_sessions_table', 1),
(15, '2019_05_14_061542_create_invoices_table', 1),
(16, '2019_05_14_061622_create_invoice_items_table', 1),
(17, '2019_07_09_112758_create_custom_fields_table', 1),
(18, '2019_07_25_073117_create_custom_data_table', 1),
(19, '2019_11_27_061628_create_service_policies_table', 1),
(20, '2019_12_10_112002_create_social_links_table', 1),
(21, '2019_12_17_085444_create_service_images_table', 1),
(22, '2019_12_17_132101_create_contacts_table', 1),
(23, '2019_12_18_122432_create_contact_infos_table', 1),
(24, '2019_12_18_142327_create_service_employees_table', 1),
(25, '2020_05_27_124636_create_break_times_table', 1),
(26, '2020_06_01_130224_create_sms_templates_table', 1);

-- --------------------------------------------------------

--
-- Table structure for table `notifications`
--

CREATE TABLE `notifications` (
  `id` int(10) UNSIGNED NOT NULL,
  `event` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `booking_id` int(11) NOT NULL,
  `booking_by` int(11) NOT NULL,
  `notify_to` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `activity_id` int(11) NOT NULL,
  `read_by` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `notifications`
--

INSERT INTO `notifications` (`id`, `event`, `booking_id`, `booking_by`, `notify_to`, `activity_id`, `read_by`, `created_at`, `updated_at`) VALUES
(1, 'submitted_a_new_booking', 3, 5, ',1', 5, '', '2022-11-02 14:52:06', '2022-11-02 14:52:06'),
(2, 'confirmed_the_booking', 3, 5, '', 1, '', '2022-11-02 14:52:33', '2022-11-02 14:52:33'),
(3, 'submitted_a_new_booking', 4, 1, ',1', 1, '', '2022-11-04 06:28:14', '2022-11-04 06:28:14'),
(4, 'confirmed_the_booking', 4, 1, '', 1, '', '2022-11-04 06:29:14', '2022-11-04 06:29:14'),
(5, 'confirmed_the_booking', 2, 4, ',1', 3, '', '2022-12-01 06:42:06', '2022-12-01 06:42:06'),
(6, 'canceled_the_booking', 1, 1, '', 1, '', '2022-12-01 06:43:56', '2022-12-01 06:43:56');

-- --------------------------------------------------------

--
-- Table structure for table `password_resets`
--

CREATE TABLE `password_resets` (
  `email` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `payments`
--

CREATE TABLE `payments` (
  `id` int(10) UNSIGNED NOT NULL,
  `booking_id` int(11) NOT NULL,
  `currency_code` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `paid_amount` double NOT NULL,
  `method_id` int(11) NOT NULL DEFAULT 0,
  `transaction_id` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_by` int(11) NOT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `payments`
--

INSERT INTO `payments` (`id`, `booking_id`, `currency_code`, `paid_amount`, `method_id`, `transaction_id`, `created_by`, `created_at`, `updated_at`) VALUES
(1, 1, 'Rs.', 0, 0, NULL, 0, '2022-11-01 04:14:51', '2022-11-01 04:14:51'),
(2, 2, 'Rs.', 100, 3, NULL, 1, '2022-11-01 08:14:47', '2022-12-01 06:43:44'),
(3, 3, 'Rs.', 480.1, 3, NULL, 1, '2022-11-02 14:51:54', '2022-12-01 06:43:24'),
(4, 4, 'Rs.', 200, 3, NULL, 1, '2022-11-04 06:28:03', '2022-11-04 06:29:03');

-- --------------------------------------------------------

--
-- Table structure for table `payment_methods`
--

CREATE TABLE `payment_methods` (
  `id` int(10) UNSIGNED NOT NULL,
  `title` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `type` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `available_to_client` tinyint(4) NOT NULL DEFAULT 0,
  `enable` tinyint(4) NOT NULL DEFAULT 0,
  `option` varchar(500) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `payment_methods`
--

INSERT INTO `payment_methods` (`id`, `title`, `type`, `available_to_client`, `enable`, `option`, `created_at`, `updated_at`) VALUES
(1, 'Stripe', 'stripe', 0, 0, NULL, '2022-10-31 13:14:23', '2022-10-31 13:14:23'),
(2, 'PayTM', 'paypal', 0, 1, 'a:3:{i:0;s:16:\"WXcKva8klNVedVmv\";i:1;s:20:\"gNMNiJ27579241722126\";i:2;i:1;}', '2022-10-31 13:14:23', '2022-12-01 06:40:58'),
(3, 'Cash', 'custom', 0, 1, NULL, '2022-10-31 13:14:23', '2022-10-31 13:14:23');

-- --------------------------------------------------------

--
-- Table structure for table `reset_passes`
--

CREATE TABLE `reset_passes` (
  `id` int(10) UNSIGNED NOT NULL,
  `email` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `roles`
--

CREATE TABLE `roles` (
  `id` int(10) UNSIGNED NOT NULL,
  `title` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `permissions` longtext COLLATE utf8_unicode_ci NOT NULL,
  `created_by` int(11) NOT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `roles`
--

INSERT INTO `roles` (`id`, `title`, `permissions`, `created_by`, `created_at`, `updated_at`) VALUES
(1, 'Manager', 'a:10:{i:0;s:28:\"can_edit_application_setting\";i:1;s:22:\"can_edit_email_setting\";i:2;s:15:\"can_add_service\";i:3;s:15:\"can_add_booking\";i:4;s:18:\"can_manage_booking\";i:5;s:23:\"can_manage_custom_input\";i:6;s:25:\"can_edit_holi_day_setting\";i:7;s:15:\"can_see_reports\";i:8;s:26:\"can_manage_payment_methods\";i:9;s:25:\"can_manage_client_setting\";}', 1, '2022-10-31 13:14:23', '2022-12-01 06:29:08'),
(2, 'Service Assistant', 'a:7:{i:0;s:15:\"can_add_service\";i:1;s:15:\"can_add_booking\";i:2;s:15:\"can_see_reports\";i:3;s:25:\"can_manage_client_setting\";i:4;s:26:\"can_manage_payment_methods\";i:5;s:25:\"can_edit_holi_day_setting\";i:6;s:18:\"can_manage_booking\";}', 1, '2022-10-31 13:14:23', '2022-12-01 06:30:13');

-- --------------------------------------------------------

--
-- Table structure for table `services`
--

CREATE TABLE `services` (
  `id` int(10) UNSIGNED NOT NULL,
  `title` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `referred_service_id` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `business_type` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `price` double NOT NULL,
  `allow_cancel` tinyint(1) NOT NULL DEFAULT 0,
  `auto_confirm` tinyint(1) NOT NULL DEFAULT 0,
  `allow_booking_max_day_ago` int(11) NOT NULL DEFAULT 60,
  `service_duration` time DEFAULT NULL,
  `buffer_time` time DEFAULT NULL,
  `multiple_bookings` tinyint(1) NOT NULL DEFAULT 0,
  `available_seat` int(11) NOT NULL DEFAULT 0,
  `description` longtext COLLATE utf8_unicode_ci DEFAULT NULL,
  `service_duration_type` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `service_starts` time DEFAULT NULL,
  `service_ends` time DEFAULT NULL,
  `service_starting_date` date DEFAULT NULL,
  `service_ending_date` date DEFAULT NULL,
  `max_booking` int(11) NOT NULL,
  `alias` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_by` int(11) NOT NULL,
  `activation` tinyint(1) NOT NULL DEFAULT 0,
  `consider_children_for_price` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `age_range` int(11) NOT NULL,
  `percentage` decimal(8,2) NOT NULL,
  `break_time` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `services`
--

INSERT INTO `services` (`id`, `title`, `referred_service_id`, `business_type`, `price`, `allow_cancel`, `auto_confirm`, `allow_booking_max_day_ago`, `service_duration`, `buffer_time`, `multiple_bookings`, `available_seat`, `description`, `service_duration_type`, `service_starts`, `service_ends`, `service_starting_date`, `service_ending_date`, `max_booking`, `alias`, `created_by`, `activation`, `consider_children_for_price`, `age_range`, `percentage`, `break_time`, `created_at`, `updated_at`) VALUES
(1, 'HairCut', NULL, 'salon', 100, 0, 0, 60, '00:30:00', '00:10:00', 0, 10, NULL, 'hourly', '10:00:00', '22:00:00', '2022-11-01', '2022-12-31', 0, 'haircut', 1, 1, '', 0, '0.00', NULL, '2022-10-31 15:26:28', '2022-10-31 15:26:28'),
(2, 'Spa', NULL, 'salon', 100, 0, 0, 60, '00:30:00', '00:05:00', 0, 10, NULL, 'hourly', '10:00:00', '12:00:00', '2022-11-02', '2022-11-30', 0, 'spa', 1, 1, '', 0, '0.00', NULL, '2022-11-02 14:50:09', '2022-11-02 14:50:09'),
(3, 'Face Cleaning', NULL, 'salon', 200, 0, 0, 60, '01:00:00', '00:05:00', 0, 10, NULL, 'hourly', '10:00:00', '18:00:00', '2022-11-04', '2022-11-30', 0, 'face-cleaning', 1, 1, '', 0, '0.00', NULL, '2022-11-04 06:27:24', '2022-11-04 06:27:24');

-- --------------------------------------------------------

--
-- Table structure for table `service_employees`
--

CREATE TABLE `service_employees` (
  `id` int(10) UNSIGNED NOT NULL,
  `service_id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `service_images`
--

CREATE TABLE `service_images` (
  `id` int(10) UNSIGNED NOT NULL,
  `image` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `service_id` int(10) UNSIGNED NOT NULL,
  `is_default` tinyint(1) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `service_images`
--

INSERT INTO `service_images` (`id`, `image`, `service_id`, `is_default`, `created_at`, `updated_at`) VALUES
(1, 'service.png', 1, 1, NULL, NULL),
(2, 'service.png', 2, 1, NULL, NULL),
(3, 'service.png', 3, 1, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `service_policies`
--

CREATE TABLE `service_policies` (
  `id` int(10) UNSIGNED NOT NULL,
  `custom_content` longtext COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `service_policies`
--

INSERT INTO `service_policies` (`id`, `custom_content`, `created_at`, `updated_at`) VALUES
(1, '', '2022-10-31 07:44:23', '2022-10-31 07:44:23');

-- --------------------------------------------------------

--
-- Table structure for table `sessions`
--

CREATE TABLE `sessions` (
  `id` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `user_id` int(10) UNSIGNED DEFAULT NULL,
  `ip_address` varchar(45) COLLATE utf8_unicode_ci DEFAULT NULL,
  `user_agent` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `payload` text COLLATE utf8_unicode_ci NOT NULL,
  `last_activity` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `settings`
--

CREATE TABLE `settings` (
  `id` int(10) UNSIGNED NOT NULL,
  `setting_name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `setting_value` mediumtext COLLATE utf8_unicode_ci NOT NULL,
  `setting_type` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `created_by` int(11) NOT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `settings`
--

INSERT INTO `settings` (`id`, `setting_name`, `setting_value`, `setting_type`, `user_id`, `created_by`, `created_at`, `updated_at`) VALUES
(1, 'business_type', 'salon', '', NULL, 0, NULL, '2022-11-01 04:16:42'),
(2, 'time_format', '12h', '', NULL, 0, NULL, '2022-11-01 04:16:42'),
(3, 'time_zone', 'Asia/Kolkata', '', NULL, 0, NULL, '2022-11-01 04:16:42'),
(4, 'date_format', 'Y-m-d', '', NULL, 0, NULL, '2022-11-01 04:16:42'),
(5, 'currency_symbol', 'Rs.', '', NULL, 0, NULL, '2022-11-01 04:16:42'),
(6, 'currency_format', 'left', '', NULL, 0, NULL, '2022-11-01 04:16:42'),
(7, 'thousand_separator', ',', '', NULL, 0, NULL, '2022-11-01 04:16:42'),
(8, 'language_setting', 'english', '', NULL, 0, NULL, '2022-11-01 04:16:42'),
(9, 'decimal_separator', '.', '', NULL, 0, NULL, '2022-11-01 04:16:42'),
(10, 'number_of_decimal', '2', '', NULL, 0, NULL, '2022-11-01 04:16:42'),
(11, 'offday_setting', ',2', '', NULL, 0, NULL, '2022-10-31 13:19:42'),
(12, 'email_from_name', 'admin@ezcut.com', '', NULL, 0, NULL, '2022-10-31 14:43:46'),
(13, 'email_from_address', 'akash.shinde@neosoftmail.com', '', NULL, 0, NULL, '2022-10-31 14:43:46'),
(14, 'email_driver', 'smtp', '', NULL, 0, NULL, '2022-10-31 14:43:46'),
(15, 'email_smtp_host', 'smtp-relay.sendinblue.com', '', NULL, 0, NULL, '2022-10-31 14:43:46'),
(16, 'email_port', '587', '', NULL, 0, NULL, '2022-10-31 14:43:46'),
(17, 'email_smtp_password', 'RHwvUdDaITX5LWqh', '', NULL, 0, NULL, '2022-10-31 14:43:46'),
(18, 'email_encryption_type', 'tls', '', NULL, 0, NULL, '2022-10-31 14:43:46'),
(19, 'mandrill_api', '', '', NULL, 0, NULL, '2022-10-31 14:43:46'),
(20, 'sparkpost_api', '', '', NULL, 0, NULL, '2022-10-31 14:43:46'),
(21, 'mailgun_domain', '', '', NULL, 0, NULL, '2022-10-31 14:43:46'),
(22, 'mailgun_api', '', '', NULL, 0, NULL, '2022-10-31 14:43:46'),
(23, 'max_row_per_table', '10', '', NULL, 0, NULL, '2022-11-01 04:16:42'),
(24, 'app_name', 'Ezcut', '', NULL, 0, NULL, '2022-11-01 04:16:42'),
(25, 'app_logo', '635fdc0067862.png', '', NULL, 0, NULL, '2022-11-01 04:16:42'),
(26, 'currency_code', 'Rs.', '', NULL, 0, NULL, '2022-11-01 04:16:42'),
(27, 'can_signup', '1', '', NULL, 0, NULL, NULL),
(28, 'can_login', '1', '', NULL, 0, NULL, NULL),
(29, 'invoice_logo', '635fdc663d501.png', '', NULL, 0, NULL, '2022-11-01 04:16:42'),
(30, 'submit_booking_after_login', '0', '', NULL, 0, NULL, NULL),
(31, 'landing_page_message', 'Let\'s make you an appointment to keep yourself attractive.', '', NULL, 0, NULL, '2022-11-01 04:16:42'),
(32, 'landing_page_header', 'Beauty & Salon', '', NULL, 0, NULL, '2022-11-01 04:16:42'),
(33, 'company_name', 'Ezcut', '', NULL, 0, NULL, '2022-11-01 04:16:42'),
(34, 'copyright_text', 'Copyright @ 2020 by EzCut Booking', '', NULL, 0, NULL, '2022-11-01 04:16:42'),
(35, 'contact_us_email', '', '', NULL, 0, NULL, '2022-11-01 04:16:42'),
(36, 'sms_from_name_phone_number', '', '', NULL, 0, NULL, NULL),
(37, 'sms_driver', '', '', NULL, 0, NULL, NULL),
(38, 'key', '', '', NULL, 0, NULL, NULL),
(39, 'secret_key', '', '', NULL, 0, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `sms_templates`
--

CREATE TABLE `sms_templates` (
  `id` int(10) UNSIGNED NOT NULL,
  `template_type` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `template_subject` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `default_content` longtext COLLATE utf8_unicode_ci NOT NULL,
  `custom_content` longtext COLLATE utf8_unicode_ci NOT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `sms_templates`
--

INSERT INTO `sms_templates` (`id`, `template_type`, `template_subject`, `default_content`, `custom_content`, `created_at`, `updated_at`) VALUES
(1, 'verification_code', 'Verification code', 'Your verification code is {verification_code}', '', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `social_links`
--

CREATE TABLE `social_links` (
  `id` int(10) UNSIGNED NOT NULL,
  `social_link_value` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `social_link_name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `social_links`
--

INSERT INTO `social_links` (`id`, `social_link_value`, `social_link_name`, `created_at`, `updated_at`) VALUES
(1, 'facebook', NULL, NULL, NULL),
(2, 'instagram', NULL, NULL, NULL),
(3, 'linkedin', NULL, NULL, NULL),
(4, 'twitter', NULL, NULL, NULL),
(5, 'google_plus', NULL, NULL, NULL),
(6, 'youtube', NULL, NULL, NULL),
(7, 'pinterest', NULL, NULL, NULL),
(8, 'tumblr', NULL, NULL, NULL),
(9, 'flickr', NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(10) UNSIGNED NOT NULL,
  `first_name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `last_name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `email` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `phone` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `phone_object` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `password` varchar(60) COLLATE utf8_unicode_ci NOT NULL,
  `gender` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `date_of_birth` date DEFAULT NULL,
  `avatar` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'default.jpg',
  `verified` tinyint(1) NOT NULL DEFAULT 0,
  `is_admin` tinyint(1) NOT NULL DEFAULT 0,
  `role_id` int(11) NOT NULL DEFAULT 0,
  `disabled` tinyint(4) NOT NULL DEFAULT 0,
  `token` varchar(254) COLLATE utf8_unicode_ci DEFAULT NULL,
  `remember_token` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `verification_code` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `notification_check` datetime DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `first_name`, `last_name`, `email`, `phone`, `phone_object`, `password`, `gender`, `date_of_birth`, `avatar`, `verified`, `is_admin`, `role_id`, `disabled`, `token`, `remember_token`, `verification_code`, `notification_check`, `created_at`, `updated_at`) VALUES
(1, 'Akash', 'Shinde', 'shinde.akash11@gmail.com', NULL, NULL, '$2y$10$GcctSoq97zdoCQbEVbXXkOirVAtApuNyvI7DOfZ9gneXs1oqs2k1m', NULL, NULL, 'default.jpg', 1, 1, 0, 0, '', NULL, '', '2022-12-01 06:42:50', '2022-10-31 13:14:22', '2022-12-01 06:42:50'),
(2, 'akash', 'Shinde', 'akash.shinde@gmail.com', '346543737', '\"346543737\"', '$2y$10$W/ghYybCrioJTznG5eUJJ.1vt/TWca3Yt3JWbqLqNpLjT3mOL/Hq6', NULL, NULL, 'default.jpg', 0, 0, 0, 0, 'fphIqWHk1lEGtBg3xr2Y8lxh1', NULL, '', NULL, '2022-10-31 13:22:48', '2022-10-31 13:22:48'),
(3, 'Akash', 'Shinde', 'akash.shinde@neosoftmail.com', '+91 73994 94024', '\"7399494024\"', '$2y$10$UA0cqrI0PiaA3Xt2oXI6ROVusO4qRbHw/6vnbtb0nTg8/ok4/yNFS', NULL, NULL, 'default.jpg', 1, 0, 2, 0, 'QLxzNXjcWRUKQvt8', NULL, '', NULL, '2022-10-31 15:23:18', '2022-11-02 11:43:06'),
(4, 'anas', 's', 'Anas@gmail.com', '+91 97197 57533', NULL, '$2y$10$Jek28cyboBM6MwG/DepB6eTaxxuZv3e.Cw7Dsb5MfOY7Ytv/Jo8RS', NULL, NULL, 'default.jpg', 0, 0, 0, 0, 'KmkOvGOtfADOPbs5Uagc4Xlor', NULL, '', NULL, '2022-11-01 08:14:47', '2022-11-02 11:30:42'),
(5, 'madiya', 'shaikh', 'smaddi232@gmail.com', '+91 86523 23286', NULL, '', NULL, NULL, 'default.jpg', 0, 0, 0, 0, 'DmW1Zs3ihxB496kEpBiMU6vsA', NULL, '', NULL, '2022-11-02 14:51:54', '2022-11-02 14:51:54'),
(6, 'Umesh', 'Vishwakarma', 'umeshv285@gmail.com', '+91 80977 59214', '\"8097759214\"', '$2y$10$G5wLmWIRZUMPb0eQ41Xrs.Kk0GHIIxBmTyzoy5xqCLpW/pw/P3tbG', NULL, NULL, 'default.jpg', 1, 0, 0, 0, '', NULL, '', NULL, '2022-11-09 08:31:38', '2022-11-09 08:35:54');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `bookings`
--
ALTER TABLE `bookings`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `break_times`
--
ALTER TABLE `break_times`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `contacts`
--
ALTER TABLE `contacts`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `contact_infos`
--
ALTER TABLE `contact_infos`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `custom_data_fields`
--
ALTER TABLE `custom_data_fields`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `custom_fields`
--
ALTER TABLE `custom_fields`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `email_templates`
--
ALTER TABLE `email_templates`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `holidays`
--
ALTER TABLE `holidays`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `invites`
--
ALTER TABLE `invites`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `invoices`
--
ALTER TABLE `invoices`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `invoice_items`
--
ALTER TABLE `invoice_items`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `notifications`
--
ALTER TABLE `notifications`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `password_resets`
--
ALTER TABLE `password_resets`
  ADD KEY `password_resets_email_index` (`email`);

--
-- Indexes for table `payments`
--
ALTER TABLE `payments`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `payment_methods`
--
ALTER TABLE `payment_methods`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `reset_passes`
--
ALTER TABLE `reset_passes`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `roles`
--
ALTER TABLE `roles`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `services`
--
ALTER TABLE `services`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `service_employees`
--
ALTER TABLE `service_employees`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `service_images`
--
ALTER TABLE `service_images`
  ADD PRIMARY KEY (`id`),
  ADD KEY `service_images_service_id_foreign` (`service_id`);

--
-- Indexes for table `service_policies`
--
ALTER TABLE `service_policies`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sessions`
--
ALTER TABLE `sessions`
  ADD UNIQUE KEY `sessions_id_unique` (`id`);

--
-- Indexes for table `settings`
--
ALTER TABLE `settings`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sms_templates`
--
ALTER TABLE `sms_templates`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `social_links`
--
ALTER TABLE `social_links`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`),
  ADD UNIQUE KEY `users_phone_unique` (`phone`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `bookings`
--
ALTER TABLE `bookings`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `break_times`
--
ALTER TABLE `break_times`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `contacts`
--
ALTER TABLE `contacts`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `contact_infos`
--
ALTER TABLE `contact_infos`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `custom_data_fields`
--
ALTER TABLE `custom_data_fields`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `custom_fields`
--
ALTER TABLE `custom_fields`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `email_templates`
--
ALTER TABLE `email_templates`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `holidays`
--
ALTER TABLE `holidays`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `invites`
--
ALTER TABLE `invites`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `invoices`
--
ALTER TABLE `invoices`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `invoice_items`
--
ALTER TABLE `invoice_items`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=27;

--
-- AUTO_INCREMENT for table `notifications`
--
ALTER TABLE `notifications`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `payments`
--
ALTER TABLE `payments`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `payment_methods`
--
ALTER TABLE `payment_methods`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `reset_passes`
--
ALTER TABLE `reset_passes`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `roles`
--
ALTER TABLE `roles`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `services`
--
ALTER TABLE `services`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `service_employees`
--
ALTER TABLE `service_employees`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `service_images`
--
ALTER TABLE `service_images`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `service_policies`
--
ALTER TABLE `service_policies`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `settings`
--
ALTER TABLE `settings`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=40;

--
-- AUTO_INCREMENT for table `sms_templates`
--
ALTER TABLE `sms_templates`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `social_links`
--
ALTER TABLE `social_links`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `service_images`
--
ALTER TABLE `service_images`
  ADD CONSTRAINT `service_images_service_id_foreign` FOREIGN KEY (`service_id`) REFERENCES `services` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
