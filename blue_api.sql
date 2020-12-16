-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Dec 14, 2020 at 02:03 PM
-- Server version: 8.0.21
-- PHP Version: 7.3.24

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `blue_api`
--

-- --------------------------------------------------------

--
-- Table structure for table `applications`
--

CREATE TABLE `applications` (
  `id` int NOT NULL,
  `full_name` varchar(255) COLLATE utf8mb4_general_ci NOT NULL,
  `date_of_birth` date DEFAULT NULL,
  `email` varchar(255) COLLATE utf8mb4_general_ci NOT NULL,
  `phone` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `country_id` int DEFAULT NULL,
  `address` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `linkedin_link` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `behance_link` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `resume` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `portofolio` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `comment` text COLLATE utf8mb4_general_ci,
  `job_id` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ;

-- --------------------------------------------------------

--
-- Table structure for table `careers`
--

CREATE TABLE `careers` (
  `id` int NOT NULL,
  `job_title` varchar(255) COLLATE utf8mb4_general_ci NOT NULL,
  `job_desc` text COLLATE utf8mb4_general_ci NOT NULL,
  `cat_id` int NOT NULL,
  `start_date` date DEFAULT NULL,
  `end_date` date DEFAULT NULL,
  `created_by` int DEFAULT NULL,
  `created_date` timestamp NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ;

-- --------------------------------------------------------

--
-- Table structure for table `career_categories`
--

CREATE TABLE `career_categories` (
  `id` int NOT NULL,
  `category_name` varchar(255) COLLATE utf8mb4_general_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ;

-- --------------------------------------------------------

--
-- Table structure for table `countries`
--

CREATE TABLE `countries` (
  `id` int NOT NULL,
  `country_name` varchar(255) NOT NULL,
  `language` varchar(255) DEFAULT NULL,
  `time_zone` varchar(255) DEFAULT NULL,
  `nationality_name` varchar(255) DEFAULT NULL,
  `country_code` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ;

--
-- Dumping data for table `countries`
--

INSERT INTO `countries` (`id`, `country_name`, `language`, `time_zone`, `nationality_name`, `country_code`) VALUES
(1, 'Afghanistan', NULL, 'Asia/Kabul', '', 'AF'),
(2, 'Albania', NULL, 'Europe/Tirane', '', 'AL'),
(3, 'Algeria', NULL, 'Africa/Algiers', 'Algerian', 'DZ'),
(4, 'Andorra', NULL, 'Europe/Andorra', '', 'AD'),
(5, 'Angola', NULL, 'Africa/Luanda', '', 'AO'),
(6, 'Antigua and Barbuda', NULL, 'America/Antigua', '', 'AG'),
(7, 'Argentina', NULL, '	America/Argentina/Buenos_Aires', '', 'AR'),
(8, 'Armenia', NULL, 'Asia/Yerevan', '', 'AM'),
(9, 'Aruba', NULL, 'America/Aruba', '', 'AW'),
(10, 'Australia', NULL, 'Australia/Sydney', 'Australian', 'AU'),
(11, 'Austria', NULL, 'Europe/Vienna', '', 'AT'),
(12, 'Azerbaijan', NULL, 'Asia/Baku', '', 'AZ'),
(13, 'Bahamas', NULL, 'America/Nassau', '', 'BS'),
(14, 'Bahrain', 'Arabic', 'Asia/Bahrain', 'Bahraini', 'BH'),
(15, 'Bangladesh', NULL, 'Asia/Dhaka', '', 'BD'),
(16, 'Barbados', NULL, 'America/Barbados', '', 'BB'),
(17, 'Belarus', NULL, 'Europe/Minsk', '', 'BY'),
(18, 'Belgium', NULL, 'Europe/Brussels', 'Belgian', 'BE'),
(19, 'Belize', NULL, 'America/Belize', '', 'BZ'),
(20, 'Bolivia', NULL, 'America/La_Paz', '', 'BO'),
(21, 'Bosnia and Herzegovina', NULL, 'Europe/Sarajevo', '', 'BA'),
(22, 'Botswana', NULL, 'Africa/Gaborone', '', 'BW'),
(23, 'Brazil', NULL, 'America/Sao_Paulo', 'Brazilian', 'BR'),
(24, 'Brunei', NULL, 'Asia/Brunei', '', 'BN'),
(25, 'Bulgaria', NULL, 'Europe/Sofia', '', 'BG'),
(26, 'Cambodia', NULL, 'Asia/Phnom_Penh', '', 'KH'),
(27, 'Cameroon', NULL, 'Africa/Douala', '', 'CM'),
(28, 'Canada', NULL, 'America/Toronto', '', 'CA'),
(29, 'Cayman Islands', NULL, 'America/Cayman', '', 'KY'),
(30, 'Chile', NULL, 'America/Santiago', '', 'CL'),
(31, 'China', 'Chinese', 'Asia/Shanghai', 'Chinese', 'CN'),
(32, 'Colombia', NULL, 'America/Bogota', '', 'CO'),
(33, 'Congo', NULL, 'Africa/Kinshasa', '', 'CD'),
(34, 'Costa Rica', NULL, 'America/Costa_Rica', '', 'CR'),
(35, 'Croatia', NULL, 'Europe/Zagreb', '', 'HR'),
(36, 'Cuba', NULL, 'America/Havana', '', 'CU'),
(37, 'Cyprus', NULL, 'Asia/Nicosia', '', 'CY'),
(38, 'Czech Republic', NULL, 'Europe/Prague', '', 'CZ'),
(39, 'Denmark', NULL, 'Europe/Copenhagen', '', 'DK'),
(40, 'Dominican Republic', NULL, 'America/Santo_Domingo', '', 'DO'),
(41, 'Ecuador', NULL, 'America/Guayaquil', '', 'EC'),
(42, 'Egypt', 'Arabic', 'Africa/Cairo', 'Egyptian', 'EG'),
(43, 'El Salvador', NULL, 'America/El_Salvador', '', 'SV'),
(44, 'Estonia', NULL, 'Europe/Tallinn', '', 'EE'),
(45, 'Faroe Islands', NULL, 'Atlantic/Faroe', '', 'FO'),
(46, 'Finland', NULL, 'Europe/Helsinki', '', 'FI'),
(47, 'France', NULL, 'Europe/Paris', '', 'FR'),
(48, 'French Polynesia', NULL, 'Pacific/Tahiti', '', 'PF'),
(49, 'Gabon', NULL, 'Africa/Libreville', '', 'GA'),
(50, 'Georgia', NULL, 'Asia/Tbilisi', '', 'GE'),
(51, 'Germany', NULL, 'Europe/Berlin', '', 'DE'),
(52, 'Ghana', NULL, 'Africa/Accra', '', 'GH'),
(53, 'Greece', NULL, 'Europe/Athens', '', 'GR'),
(54, 'Greenland', NULL, 'America/Godthab', '', 'GL'),
(55, 'Guadeloupe', NULL, 'America/Guadeloupe', '', 'GP'),
(56, 'Guam', NULL, 'Pacific/Guam', '', 'GU'),
(57, 'Guatemala', NULL, 'America/Guatemala', '', 'GT'),
(58, 'Guinea', NULL, 'Africa/Conakry', '', 'GN'),
(59, 'Haiti', NULL, 'America/Port-au-Prince', '', 'HT'),
(60, 'Jordan', NULL, 'Asia/Amman', '', 'JO'),
(61, 'Honduras', NULL, 'America/Tegucigalpa', '', 'HN'),
(62, 'Hong Kong', NULL, 'Asia/Hong_Kong', '', 'HK'),
(63, 'Hungary', NULL, 'Europe/Budapest', '', 'HU'),
(64, 'Iceland', NULL, 'Atlantic/Reykjavik', '', 'IS'),
(65, 'India', 'Indian', 'Asia/Kolkata', 'Indian', 'IN'),
(66, 'Indonesia', NULL, 'Asia/Jakarta', 'Indonesian', 'ID'),
(67, 'Iran', NULL, 'Asia/Tehran', '', 'IR'),
(68, 'Iraq', 'Arabic', 'Asia/Baghdad', 'Iraqi', 'IQ'),
(69, 'Ireland', NULL, 'Europe/Dublin', '', 'IE'),
(70, 'Isle of Man', NULL, 'Europe/Isle_of_Man', '', 'IM'),
(71, 'Israel', NULL, 'Asia/Jerusalem', '', 'IL'),
(72, 'Italy', NULL, 'Europe/Rome', '', 'IT'),
(73, 'Jamaica', NULL, 'America/Jamaica', '', 'JM'),
(74, 'Japan', 'Japanese', 'Asia/Tokyo', 'Japanese', 'JP'),
(75, 'Kazakhstan', NULL, 'Asia/Almaty', 'Kazakh', 'KZ'),
(76, 'Kenya', NULL, 'Africa/Nairobi', '', 'KE'),
(77, 'Kosovo', NULL, 'Europe/Belgrade', '', 'XK'),
(78, 'Kuwait', 'Arabic', 'Asia/Kuwait', 'Kuwaiti', 'KW'),
(79, 'Latvia', NULL, 'Europe/Riga', '', 'LV'),
(80, 'Lebanon', 'Arabic', 'Asia/Beirut', 'Lebanese', 'LB'),
(81, 'Libya', 'Arabic', 'Africa/Tripoli', 'Libyan', 'LY'),
(82, 'Liechtenstein', NULL, 'Europe/Vaduz', '', 'LI'),
(83, 'Luxembourg', NULL, 'Europe/Luxembourg', '', 'LU'),
(84, 'Macedonia', NULL, 'Europe/Skopje', '', 'MK'),
(85, 'Madagascar', NULL, 'Indian/Antananarivo', '', 'MG'),
(86, 'Malaysia', NULL, 'Asia/Kuala_Lumpur', 'Malaysian', 'MY'),
(87, 'Malta', NULL, 'Europe/Malta', '', 'MT'),
(88, 'Martinique', NULL, 'America/Martinique', '', 'MQ'),
(89, 'Mauritius', NULL, 'Indian/Mauritius', '', 'MU'),
(90, 'Mayotte', NULL, 'Indian/Mayotte', '', 'YT'),
(91, 'Mexico', NULL, 'America/Mexico_City', '', 'MX'),
(92, 'Mongolia', NULL, 'Asia/Ulaanbaatar', '', 'MN'),
(93, 'Montenegro', NULL, 'Europe/Podgorica', '', 'ME'),
(94, 'Morocco', 'Arabic', 'Africa/Casablanca', 'Moroccan', 'MA'),
(95, 'Mozambique', NULL, 'Africa/Maputo', '', 'MZ'),
(96, 'Myanmar [Burma]', NULL, 'Asia/Yangon', '', 'MM'),
(97, 'Namibia', NULL, 'Africa/Windhoek', '', 'NA'),
(98, 'Nepal', NULL, 'Asia/Kathmandu', '', 'NP'),
(99, 'Netherlands', NULL, 'Europe/Amsterdam', 'Dutch', 'NL'),
(100, 'New Caledonia', NULL, 'Pacific/Noumea', '', 'NC'),
(101, 'New Zealand', NULL, 'Pacific/Auckland', 'New Zealander', 'NZ'),
(102, 'Nicaragua', NULL, 'America/Managua', '', 'NI'),
(103, 'Nigeria', NULL, 'Africa/Lagos', '', 'NG'),
(104, 'Norway', NULL, 'Europe/Oslo', '', 'NO'),
(105, 'Oman', 'Arabic', 'Asia/Muscat', 'Omani', 'OM'),
(106, 'Pakistan', NULL, 'Asia/Karachi', 'Pakistani', 'PK'),
(107, 'Palestine', NULL, 'Asia/Jerusalem', 'Palestinian', 'PS'),
(108, 'Panama', NULL, 'America/Panama', '', 'PA'),
(109, 'Papua New Guinea', NULL, 'Pacific/Port_Moresby', '', 'PG'),
(110, 'Paraguay', NULL, 'America/Asuncion', '', 'PY'),
(111, 'Peru', NULL, 'America/Lima', '', 'PE'),
(112, 'Philippines', NULL, 'Asia/Manila', 'Filipino', 'PH'),
(113, 'Poland', NULL, 'Europe/Warsaw', '', 'PL'),
(114, 'Portugal', NULL, 'Europe/Lisbon', '', 'PT'),
(115, 'Puerto Rico', NULL, 'America/Puerto_Rico', '', 'PR'),
(116, 'South Korea', NULL, 'Asia/Seoul', '', 'KR'),
(117, 'Lithuania', NULL, 'Europe/Vilnius', '', 'LT'),
(118, 'Moldova', NULL, 'Europe/Chisinau', '', 'MD'),
(119, 'Romania', NULL, 'Europe/Bucharest', '', 'RO'),
(120, 'Russia', NULL, 'Europe/Moscow', '', 'RU'),
(121, 'Saint Lucia', NULL, 'America/St_Lucia', '', 'LC'),
(122, 'San Marino', NULL, 'Europe/San_Marino', '', 'SM'),
(123, 'Saudi Arabia', 'Arabic', 'Asia/Riyadh', 'Saudi Arabian', 'SA'),
(124, 'Senegal', NULL, 'Africa/Dakar', '', 'SN'),
(125, 'Serbia', NULL, 'Europe/Belgrade', '', 'RS'),
(126, 'Singapore', NULL, 'Asia/Singapore', '', 'SG'),
(127, 'Slovakia', NULL, 'Europe/Bratislava', '', 'SK'),
(128, 'Slovenia', NULL, 'Europe/Ljubljana', '', 'SI'),
(129, 'South Africa', NULL, 'Africa/Johannesburg', 'South African', 'ZA'),
(130, 'Spain', NULL, 'Europe/Madrid', 'Spanish', 'ES'),
(131, 'Sri Lanka', NULL, 'Asia/Colombo', '', 'LK'),
(132, 'Sudan', NULL, 'Africa/Khartoum', 'Sudanese', 'SD'),
(133, 'Suriname', NULL, 'America/Paramaribo', '', 'SR'),
(134, 'Swaziland', NULL, 'Africa/Mbabane', '', 'SZ'),
(135, 'Sweden', NULL, 'Europe/Stockholm', 'Swedish', 'SE'),
(136, 'Switzerland', NULL, 'Europe/Zurich', 'Swiss', 'CH'),
(137, 'Taiwan', NULL, 'Asia/Taipei', 'Taiwanese', 'TW'),
(138, 'Tanzania', NULL, 'Africa/Dar_es_Salaam', 'Tanzanian', 'TZ'),
(139, 'Thailand', NULL, 'Asia/Bangkok', 'Thai', 'TH'),
(140, 'Trinidad and Tobago', NULL, 'America/Port_of_Spain', '', 'TT'),
(141, 'Tunisia', 'Arabic', 'Africa/Tunis', 'Tunisian', 'TN'),
(142, 'Turkey', 'Turkish', 'Europe/Istanbul', 'Turkish', 'TR'),
(143, 'U.S. Virgin Islands', NULL, 'America/St_Thomas', '', 'VI'),
(144, 'Ukraine', NULL, 'Europe/Kiev', '', 'UA'),
(145, 'United Arab Emirates', 'Arabic', 'Asia/Dubai', 'Emirati', 'AE'),
(146, 'United Kingdom', 'English', 'Europe/London', 'British', 'GB'),
(147, 'United States', 'English', 'America/New_York', 'American', 'US'),
(148, 'Uruguay', NULL, 'America/Montevideo', '', 'UY'),
(149, 'Venezuela', NULL, 'America/Caracas', '', 'VE'),
(150, 'Vietnam', NULL, 'Asia/Ho_Chi_Minh', 'Vietnamese', 'VN'),
(151, 'Zambia', NULL, 'Africa/Lusaka', '', 'ZM'),
(152, 'Zimbabwe', NULL, 'Africa/Harare', '', 'ZW'),
(153, 'North Korea', NULL, 'Asia/Pyongyang', 'north korean', 'KP'),
(154, 'Qatar', 'Arabic', 'Asia/Qatar', 'Qatari', 'QA'),
(155, 'Syria', 'Arabic', 'Asia/Damascus', 'syrian', 'SY'),
(156, 'yemen', NULL, NULL, 'Yemeni', NULL),
(157, 'mauritania', NULL, NULL, 'Mauritanian', NULL),
(158, 'ethiopia', NULL, NULL, 'Ethiopian', NULL),
(159, 'Other', NULL, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `site_settings`
--

CREATE TABLE `site_settings` (
  `id` int NOT NULL,
  `param_name` varchar(255) NOT NULL,
  `param_value` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ;

--
-- Dumping data for table `site_settings`
--

INSERT INTO `site_settings` (`id`, `param_name`, `param_value`) VALUES
(1, 'email_address', 'info@alexcopharma.net'),
(2, 'phone_number_1', '(03)3302228'),
(3, 'phone_number_2', '(03)3315555'),
(4, 'phone_number_3', '(03)3312223'),
(5, 'address', 'Alexandria, Gamila Bohreid Road - Awayed, in front of Al-Awayed Bridge EG Alexandria, Egypt'),
(6, 'facebook_link', 'https://www.facebook.com/alexcopharmaofficial'),
(7, 'twitter_link', 'https://twitter.com/alexcopharma'),
(8, 'linkedin_link', 'https://www.linkedin.com/company/alexcopharmaofficial/'),
(9, 'youtube_link', '#');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int NOT NULL,
  `username` varchar(255) COLLATE utf8mb4_general_ci NOT NULL,
  `password` varchar(255) COLLATE utf8mb4_general_ci NOT NULL,
  `salt` varchar(255) COLLATE utf8mb4_general_ci NOT NULL,
  `session_id` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `applications`
--
ALTER TABLE `applications`
  ADD PRIMARY KEY (`id`),
  ADD KEY `job_id` (`job_id`),
  ADD KEY `country_id` (`country_id`);

--
-- Indexes for table `careers`
--
ALTER TABLE `careers`
  ADD PRIMARY KEY (`id`),
  ADD KEY `cat_id` (`cat_id`),
  ADD KEY `created_by` (`created_by`);

--
-- Indexes for table `career_categories`
--
ALTER TABLE `career_categories`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `countries`
--
ALTER TABLE `countries`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `site_settings`
--
ALTER TABLE `site_settings`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `applications`
--
ALTER TABLE `applications`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `careers`
--
ALTER TABLE `careers`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `career_categories`
--
ALTER TABLE `career_categories`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `countries`
--
ALTER TABLE `countries`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=160;

--
-- AUTO_INCREMENT for table `site_settings`
--
ALTER TABLE `site_settings`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `applications`
--
ALTER TABLE `applications`
  ADD CONSTRAINT `applications_ibfk_1` FOREIGN KEY (`job_id`) REFERENCES `careers` (`id`),
  ADD CONSTRAINT `applications_ibfk_2` FOREIGN KEY (`country_id`) REFERENCES `countries` (`id`);

--
-- Constraints for table `careers`
--
ALTER TABLE `careers`
  ADD CONSTRAINT `careers_ibfk_1` FOREIGN KEY (`cat_id`) REFERENCES `career_categories` (`id`),
  ADD CONSTRAINT `careers_ibfk_2` FOREIGN KEY (`created_by`) REFERENCES `users` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
