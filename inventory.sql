-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Dec 10, 2022 at 03:44 PM
-- Server version: 10.4.22-MariaDB
-- PHP Version: 8.1.2

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `inventory`
--

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

CREATE TABLE `categories` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`id`, `name`, `slug`, `created_at`, `updated_at`) VALUES
(1, 'Category 1', 'category-1', '2022-02-02 08:16:46', '2022-02-02 08:16:46'),
(2, 'Category 2', 'category-2', '2022-02-02 08:16:52', '2022-02-02 08:16:52'),
(3, 'Category 3', 'category-3', '2022-02-02 08:17:01', '2022-02-02 08:17:01'),
(4, 'Category 4', 'category-4', '2022-03-08 13:51:00', '2022-03-08 13:51:00'),
(5, 'Category 5', 'category-5', '2022-03-08 13:51:06', '2022-03-08 13:51:06');

-- --------------------------------------------------------

--
-- Table structure for table `customers`
--

CREATE TABLE `customers` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `phone` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `address` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `photo` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `customers`
--

INSERT INTO `customers` (`id`, `name`, `email`, `phone`, `address`, `photo`, `created_at`, `updated_at`) VALUES
(2, 'Customer 1', 'customer1@gmail.com', '123456789', 'Address 1', 'public/backend/customers/1646722806.png', '2022-01-26 11:37:19', '2022-03-08 14:00:43'),
(3, 'Customer 2', 'customer2@gmail.com', '1234567890', 'Address 2', 'public/backend/customers/1646722812.png', '2022-01-26 11:39:46', '2022-03-08 14:00:47'),
(4, 'Customer 3', 'customer3@gmail.com', '1234', 'Address 3', 'public/backend/customers/1646722833.png', '2022-03-08 14:00:34', '2022-03-08 14:00:34'),
(5, 'Customer 4', 'customer4@gmail.com', '12345', 'Address 4', 'public/backend/customers/1646722867.png', '2022-03-08 14:01:07', '2022-03-08 14:01:07'),
(6, 'Customer 5', 'customer5@gmail.com', '123456', 'Address 5', 'public/backend/customers/1646722888.png', '2022-03-08 14:01:28', '2022-03-08 14:01:28');

-- --------------------------------------------------------

--
-- Table structure for table `employees`
--

CREATE TABLE `employees` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `phone` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `address` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `salary` double(8,2) NOT NULL,
  `joining_date` date NOT NULL,
  `nid` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `photo` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `employees`
--

INSERT INTO `employees` (`id`, `name`, `email`, `phone`, `address`, `salary`, `joining_date`, `nid`, `photo`, `created_at`, `updated_at`) VALUES
(1, 'Employee 1', 'employee1@gmail.com', '12345678', 'Address 1', 50000.00, '2022-02-01', '1234567890', 'public/backend/employees/1646721382.png', '2022-02-02 08:21:27', '2022-03-08 13:50:38'),
(3, 'Employee 2', 'employee2@gmail.com', '123456789', 'India', 56000.00, '2022-03-02', '1234567890', 'public/backend/employees/1646721416.png', '2022-03-08 13:36:56', '2022-03-08 13:36:56'),
(4, 'Employee 3', 'employee3@gmail.com', '12345', 'India', 45000.00, '2022-03-01', '1234567890', 'public/backend/employees/1646721451.png', '2022-03-08 13:37:31', '2022-03-08 13:37:31'),
(5, 'Employee 4', 'employee4@gmail.com', '123456', 'Kuwait', 650.00, '2022-03-01', '1234567890', 'public/backend/employees/1646721487.png', '2022-03-08 13:38:07', '2022-03-08 13:38:07'),
(6, 'Employee 5', 'employee5@gmail.com', '1234567', 'Kuwait', 750.00, '2022-02-28', '1234567890', 'public/backend/employees/1646721517.jpeg', '2022-03-08 13:38:37', '2022-03-08 13:38:37');

-- --------------------------------------------------------

--
-- Table structure for table `expenses`
--

CREATE TABLE `expenses` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `details` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `amount` double(8,2) NOT NULL,
  `date` date DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `expenses`
--

INSERT INTO `expenses` (`id`, `details`, `amount`, `date`, `created_at`, `updated_at`) VALUES
(1, 'Expense 5', 11.00, '2022-01-01', NULL, '2022-03-08 14:01:46'),
(2, 'Expense 4', 2.00, '2022-02-02', NULL, '2022-03-08 14:02:06'),
(4, 'Expense 3', 4.00, '2022-01-26', NULL, '2022-03-08 14:02:01'),
(5, 'Expense 2', 6.00, '2022-01-26', NULL, '2022-03-08 14:01:56'),
(6, 'Expense 1', 6700.00, '2022-03-08', NULL, '2022-03-08 14:01:52');

-- --------------------------------------------------------

--
-- Table structure for table `extras`
--

CREATE TABLE `extras` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `vat` decimal(8,2) NOT NULL,
  `logo` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `favicon` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `phone` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `address` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `extras`
--

INSERT INTO `extras` (`id`, `vat`, `logo`, `favicon`, `phone`, `email`, `address`, `created_at`, `updated_at`) VALUES
(1, '5.00', 'backend/extras/1643636052.png', ' ', '1234567890', 'easy@gmail.com', 'Dhaka, Bangladesh', NULL, '2022-01-31 10:34:13');

-- --------------------------------------------------------

--
-- Table structure for table `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `uuid` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `connection` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(9, '2014_10_12_000000_create_users_table', 1),
(10, '2014_10_12_100000_create_password_resets_table', 1),
(11, '2019_08_19_000000_create_failed_jobs_table', 1),
(12, '2019_12_14_000001_create_personal_access_tokens_table', 1),
(13, '2022_01_22_100738_create_employees_table', 1),
(14, '2022_01_25_074337_create_suppliers_table', 1),
(15, '2022_01_25_084800_create_categories_table', 1),
(16, '2022_01_25_131910_create_products_table', 1),
(17, '2022_02_01_091303_create_orders_table', 2),
(18, '2022_02_01_091315_create_order_details_table', 3),
(19, '2022_01_26_080328_create_expenses_table', 4),
(20, '2022_01_26_105227_create_salaries_table', 5),
(21, '2022_01_26_141557_create_customers_table', 5),
(22, '2022_01_27_143413_create_pos_table', 6),
(23, '2022_01_31_121107_create_extras_table', 6);

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

CREATE TABLE `orders` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `customer_id` int(10) UNSIGNED NOT NULL,
  `quantity` int(10) UNSIGNED DEFAULT NULL,
  `subtotal` decimal(8,2) DEFAULT NULL,
  `vat` decimal(5,2) DEFAULT NULL,
  `total` decimal(8,2) DEFAULT NULL,
  `pay` decimal(8,2) DEFAULT NULL,
  `due` decimal(8,2) DEFAULT NULL,
  `payby` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `date` date DEFAULT NULL,
  `month` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `year` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `orders`
--

INSERT INTO `orders` (`id`, `customer_id`, `quantity`, `subtotal`, `vat`, `total`, `pay`, `due`, `payby`, `date`, `month`, `year`, `created_at`, `updated_at`) VALUES
(9, 2, 10, '7500.00', '5.00', '7875.00', '700.00', '50.00', 'Cash', '2022-02-02', 'February', '2022', '2022-02-02 06:52:39', '2022-02-02 06:52:39'),
(10, 3, 10, '7500.00', '5.00', '7875.00', '500.00', '50.00', 'Cash', '2022-02-02', 'February', '2022', '2022-02-02 08:14:44', '2022-02-02 08:14:44'),
(11, 3, 10, '7500.00', '5.00', '7875.00', '500.00', '50.00', 'Cash', '2022-02-02', 'February', '2022', '2022-02-02 08:15:05', '2022-02-02 08:15:05'),
(12, 2, 4, '28000.00', '5.00', '29400.00', '7000.00', '500.00', 'Cash', '2022-02-02', 'February', '2022', '2022-02-02 08:25:22', '2022-02-02 08:25:22'),
(13, 2, 4, '28000.00', '5.00', '29400.00', '7000.00', '500.00', 'Cash', '2022-02-02', 'February', '2022', '2022-02-02 08:26:11', '2022-02-02 08:26:11'),
(14, 2, 2, '14000.00', '5.00', '14700.00', '14000.00', '700.00', 'Cheque', '2022-02-02', 'February', '2022', '2022-02-02 08:30:04', '2022-02-02 08:30:04'),
(15, 3, 2, '14000.00', '5.00', '14700.00', '14000.00', '700.00', 'Gift Card', '2022-02-02', 'February', '2022', '2022-02-02 08:31:24', '2022-02-02 08:31:24'),
(16, 3, 5, '36000.00', '5.00', '37800.00', '30000.00', '7800.00', 'Cheque', '2022-02-02', 'February', '2022', '2022-02-02 09:28:17', '2022-02-02 09:28:17'),
(17, 2, 2, '14000.00', '5.00', '14700.00', '10000.00', '4700.00', 'Cheque', '2022-02-07', 'February', '2022', '2022-02-07 19:53:35', '2022-02-07 19:53:35'),
(18, 4, 5, '23200.00', '5.00', '24360.00', '20000.00', '4360.00', 'Cash', '2022-03-08', 'March', '2022', '2022-03-08 14:31:20', '2022-03-08 14:31:20'),
(19, 2, 6, '17200.00', '5.00', '18060.00', '18000.00', '60.00', 'Cheque', '2022-05-11', 'May', '2022', '2022-05-11 07:01:24', '2022-05-11 07:01:24');

-- --------------------------------------------------------

--
-- Table structure for table `order_details`
--

CREATE TABLE `order_details` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `order_id` int(10) UNSIGNED DEFAULT NULL,
  `product_id` int(10) UNSIGNED DEFAULT NULL,
  `quantity` int(10) UNSIGNED DEFAULT NULL,
  `price` decimal(8,2) DEFAULT NULL,
  `subtotal` decimal(8,2) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `order_details`
--

INSERT INTO `order_details` (`id`, `order_id`, `product_id`, `quantity`, `price`, `subtotal`, `created_at`, `updated_at`) VALUES
(5, 9, 2, 5, '500.00', '2500.00', '2022-02-02 06:52:39', NULL),
(6, 9, 1, 5, '1000.00', '5000.00', '2022-02-02 06:52:39', NULL),
(7, 10, 2, 5, '500.00', '2500.00', '2022-02-02 08:14:44', NULL),
(8, 11, 2, 5, '500.00', '2500.00', '2022-02-02 08:15:05', NULL),
(9, 12, 2, 2, '8000.00', '16000.00', '2022-02-02 08:25:22', NULL),
(10, 12, 1, 2, '6000.00', '12000.00', '2022-02-02 08:25:22', NULL),
(11, 13, 2, 2, '8000.00', '16000.00', '2022-02-02 08:26:11', NULL),
(12, 13, 1, 2, '6000.00', '12000.00', '2022-02-02 08:26:11', NULL),
(13, 14, 2, 1, '8000.00', '8000.00', '2022-02-02 08:30:04', NULL),
(14, 14, 1, 1, '6000.00', '6000.00', '2022-02-02 08:30:04', NULL),
(15, 15, 2, 1, '8000.00', '8000.00', '2022-02-02 08:31:24', NULL),
(16, 15, 1, 1, '6000.00', '6000.00', '2022-02-02 08:31:24', NULL),
(17, 16, 2, 3, '8000.00', '24000.00', '2022-02-02 09:28:17', NULL),
(18, 16, 1, 2, '6000.00', '12000.00', '2022-02-02 09:28:17', NULL),
(19, 17, 2, 1, '8000.00', '8000.00', '2022-02-07 19:53:35', NULL),
(20, 17, 1, 1, '6000.00', '6000.00', '2022-02-07 19:53:35', NULL),
(21, 18, 4, 2, '600.00', '1200.00', '2022-03-08 14:31:20', NULL),
(22, 18, 2, 2, '8000.00', '16000.00', '2022-03-08 14:31:20', NULL),
(23, 18, 1, 1, '6000.00', '6000.00', '2022-03-08 14:31:20', NULL),
(24, 19, 8, 2, '1000.00', '2000.00', '2022-05-11 07:01:24', NULL),
(25, 19, 6, 2, '600.00', '1200.00', '2022-05-11 07:01:24', NULL),
(26, 19, 5, 2, '7000.00', '14000.00', '2022-05-11 07:01:24', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `password_resets`
--

CREATE TABLE `password_resets` (
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `personal_access_tokens`
--

CREATE TABLE `personal_access_tokens` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `tokenable_type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tokenable_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `abilities` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `pos`
--

CREATE TABLE `pos` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `product_id` int(10) UNSIGNED NOT NULL,
  `product_name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `product_quantity` int(10) UNSIGNED DEFAULT NULL,
  `product_price` decimal(8,2) DEFAULT NULL,
  `subtotal` decimal(8,2) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

CREATE TABLE `products` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `category_id` int(10) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `code` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `root` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `buying_price` double(8,2) NOT NULL,
  `selling_price` double(8,2) NOT NULL,
  `supplier_id` int(10) UNSIGNED DEFAULT NULL,
  `buying_date` date NOT NULL,
  `image` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 1,
  `quantity` int(10) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`id`, `category_id`, `name`, `code`, `root`, `buying_price`, `selling_price`, `supplier_id`, `buying_date`, `image`, `status`, `quantity`, `created_at`, `updated_at`) VALUES
(1, 1, 'Product 1', '1', 'Root 1', 5000.00, 6000.00, 1, '2022-01-01', 'public/backend/products/1646722526.jpeg', 1, 490, '2022-02-02 08:24:08', '2022-03-08 14:31:20'),
(2, 2, 'Product 2', '2', 'Root 2', 7000.00, 8000.00, 2, '2022-01-12', 'public/backend/products/1646722539.jpeg', 1, 97, '2022-02-02 08:24:40', '2022-03-08 14:31:20'),
(3, 3, 'Product 3', '3', 'Root 3', 1000.00, 2000.00, 3, '2022-03-09', 'public/backend/products/1646722576.png', 1, 0, '2022-03-08 13:56:16', '2022-03-08 14:02:32'),
(4, 4, 'Product 4', '4', 'Root 4', 568.00, 600.00, 4, '2022-03-08', 'public/backend/products/1646722608.jpeg', 1, 54, '2022-03-08 13:56:48', '2022-03-08 14:31:20'),
(5, 5, 'Product 5', '5', 'Root 5', 6789.00, 7000.00, 5, '2022-02-28', 'public/backend/products/1646722638.jpeg', 1, 65, '2022-03-08 13:57:19', '2022-05-11 07:01:24'),
(6, 1, 'Product 6', '6', 'Root 1', 500.00, 600.00, 1, '2022-03-04', 'public/backend/products/1646725627.jpeg', 1, 8, '2022-03-08 14:47:07', '2022-05-11 07:01:24'),
(7, 2, 'Product 7', '7', 'Root 2', 678.00, 899.00, 2, '2022-03-09', 'public/backend/products/1646725708.jpeg', 1, 18, '2022-03-08 14:48:28', '2022-03-08 14:48:28'),
(8, 5, 'Product 8', '8', 'Root 5', 750.00, 1000.00, 5, '2022-03-05', 'public/backend/products/1646725768.jpeg', 1, 87, '2022-03-08 14:49:28', '2022-05-11 07:01:24');

-- --------------------------------------------------------

--
-- Table structure for table `salaries`
--

CREATE TABLE `salaries` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `employee_id` int(10) UNSIGNED NOT NULL,
  `amount` decimal(8,2) DEFAULT NULL,
  `date` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `month` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `year` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `salaries`
--

INSERT INTO `salaries` (`id`, `employee_id`, `amount`, `date`, `month`, `year`, `created_at`, `updated_at`) VALUES
(1, 1, '35000.00', '26/01/2022', 'February', '2022', NULL, NULL),
(2, 1, '45000.00', '26/01/2022', 'April', '2022', NULL, '2022-01-26 10:04:06'),
(3, 1, '35000.00', '26/01/2022', 'March', '2022', NULL, '2022-01-26 10:05:49'),
(4, 3, '650.00', '26/01/2022', 'February', '2022', NULL, NULL),
(5, 5, '650.00', '08/03/2022', 'April', '2022', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `suppliers`
--

CREATE TABLE `suppliers` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `phone` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `address` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `photo` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `shopname` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `suppliers`
--

INSERT INTO `suppliers` (`id`, `name`, `email`, `phone`, `address`, `photo`, `shopname`, `created_at`, `updated_at`) VALUES
(1, 'Supplier 1', 'supplier1@gmail.com', '12345678', 'Address 1', 'public/backend/suppliers/1646722084.png', 'Shop 1', '2022-02-02 08:22:47', '2022-03-08 13:48:33'),
(2, 'Supplier 2', 'supplier2@gmail.com', '12345687890', 'Address 2', 'public/backend/suppliers/1646722098.png', 'Shop 2', '2022-02-02 08:23:12', '2022-03-08 13:48:18'),
(3, 'Supplier 3', 'supplier3@gmail.com', '1234', 'Address 3', 'public/backend/suppliers/1646722138.png', 'Shop 3', '2022-03-08 13:48:58', '2022-03-08 13:48:58'),
(4, 'Supplier 4', 'supplier4@gmail.com', '12345', 'Address 4', 'public/backend/suppliers/1646722162.png', 'Shop 4', '2022-03-08 13:49:22', '2022-03-08 13:49:22'),
(5, 'Supplier 5', 'supplier5@gmail.com', '1234567', 'Address 5', 'public/backend/suppliers/1646722206.png', 'Shop 5', '2022-03-08 13:50:06', '2022-03-08 13:50:06');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `email_verified_at`, `password`, `remember_token`, `created_at`, `updated_at`) VALUES
(1, 'Administrator', 'admin@gmail.com', NULL, '$2a$12$wTLj6yvH3JI4/dViEGoJjOok5EsRa79PPVCm9ykUsLtAOKWEbjTby', NULL, NULL, NULL),
(3, 'User', 'user@gmail.com', NULL, '$2a$12$oByC39uFPlgdzmuIr0QywuZ9fTFpiFxUVuBpN9wVNYcM6zMCXxXC.', NULL, NULL, NULL);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `customers`
--
ALTER TABLE `customers`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `employees`
--
ALTER TABLE `employees`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `expenses`
--
ALTER TABLE `expenses`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `extras`
--
ALTER TABLE `extras`
  ADD PRIMARY KEY (`id`);

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
-- Indexes for table `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `order_details`
--
ALTER TABLE `order_details`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `password_resets`
--
ALTER TABLE `password_resets`
  ADD KEY `password_resets_email_index` (`email`);

--
-- Indexes for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  ADD KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`);

--
-- Indexes for table `pos`
--
ALTER TABLE `pos`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `salaries`
--
ALTER TABLE `salaries`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `suppliers`
--
ALTER TABLE `suppliers`
  ADD PRIMARY KEY (`id`);

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
-- AUTO_INCREMENT for table `categories`
--
ALTER TABLE `categories`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `customers`
--
ALTER TABLE `customers`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `employees`
--
ALTER TABLE `employees`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `expenses`
--
ALTER TABLE `expenses`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `extras`
--
ALTER TABLE `extras`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=24;

--
-- AUTO_INCREMENT for table `orders`
--
ALTER TABLE `orders`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

--
-- AUTO_INCREMENT for table `order_details`
--
ALTER TABLE `order_details`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=27;

--
-- AUTO_INCREMENT for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `pos`
--
ALTER TABLE `pos`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `products`
--
ALTER TABLE `products`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `salaries`
--
ALTER TABLE `salaries`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `suppliers`
--
ALTER TABLE `suppliers`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
