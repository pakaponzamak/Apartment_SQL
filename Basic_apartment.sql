-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Sep 16, 2022 at 06:26 PM
-- Server version: 10.4.24-MariaDB
-- PHP Version: 8.1.6

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `abc_apartment`
--

-- --------------------------------------------------------

--
-- Table structure for table `bill`
--

CREATE TABLE `bill` (
  `bill_id` int(11) NOT NULL,
  `room_id` int(11) NOT NULL,
  `pay_date` date DEFAULT NULL,
  `paid` varchar(5) NOT NULL,
  `customer_id` int(11) NOT NULL,
  `electricity_bill` decimal(5,2) NOT NULL,
  `water_bill` decimal(5,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `bill`
--

INSERT INTO `bill` (`bill_id`, `room_id`, `pay_date`, `paid`, `customer_id`, `electricity_bill`, `water_bill`) VALUES
(101, 101, NULL, 'No', 1001, '807.45', '107.69'),
(102, 201, NULL, 'No', 1002, '502.23', '175.72'),
(103, 301, '2021-05-07', 'Yes', 1003, '912.47', '204.87'),
(104, 401, '2021-07-01', 'Yes', 1004, '723.40', '183.02'),
(105, 501, NULL, 'No', 1005, '498.23', '214.32');

-- --------------------------------------------------------

--
-- Table structure for table `customer`
--

CREATE TABLE `customer` (
  `customer_id` int(11) NOT NULL,
  `first_name` varchar(20) NOT NULL,
  `last_name` varchar(20) NOT NULL,
  `street` varchar(20) DEFAULT NULL,
  `city` varchar(20) NOT NULL,
  `state` varchar(20) DEFAULT NULL,
  `zipcode` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `customer`
--

INSERT INTO `customer` (`customer_id`, `first_name`, `last_name`, `street`, `city`, `state`, `zipcode`) VALUES
(1001, 'Ananda', 'Timeater', NULL, 'Nakorn Ratchasima', 'Park Chong', '30140'),
(1002, 'Beerama', 'sukhong', NULL, 'Nakorn pathom', 'Sampran', '73110'),
(1003, 'Pakapon', 'Phuaphoomthai', 'Tamlu-Bangphee', 'Samut Prakarn', 'Bang Phee', '10540'),
(1004, 'Thanadol', 'Pinato', NULL, 'Mahasarakham', 'Wapi Pathum', '44120'),
(1005, 'Nathakrit', 'Kongtan', NULL, 'Trang', NULL, '92150');

-- --------------------------------------------------------

--
-- Table structure for table `privilege`
--

CREATE TABLE `privilege` (
  `privilege_id` int(11) NOT NULL,
  `bill_id` int(11) NOT NULL,
  `promotion_id` int(11) NOT NULL,
  `discount` decimal(5,2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `privilege`
--

INSERT INTO `privilege` (`privilege_id`, `bill_id`, `promotion_id`, `discount`) VALUES
(1001, 101, 1001, '2.00'),
(1002, 102, 1002, '5.00'),
(1003, 103, 1003, '8.00'),
(1004, 104, 1004, '10.00'),
(1005, 105, 1001, '2.00');

-- --------------------------------------------------------

--
-- Table structure for table `promotion`
--

CREATE TABLE `promotion` (
  `promotion_id` int(11) NOT NULL,
  `promotion_description` varchar(50) NOT NULL,
  `valid_date` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `promotion`
--

INSERT INTO `promotion` (`promotion_id`, `promotion_description`, `valid_date`) VALUES
(1001, 'Room price 2% discount', '2020-06-01'),
(1002, 'Room price 5% discount', '2020-05-01'),
(1003, 'Room price 8% discount', '2021-09-01'),
(1004, 'Room price 10% discount', '2021-10-01');

-- --------------------------------------------------------

--
-- Table structure for table `room`
--

CREATE TABLE `room` (
  `room_id` int(11) NOT NULL,
  `room_type` int(11) NOT NULL,
  `floor` varchar(5) NOT NULL,
  `staff_id` int(11) NOT NULL,
  `rental_fee` decimal(10,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `room`
--

INSERT INTO `room` (`room_id`, `room_type`, `floor`, `staff_id`, `rental_fee`) VALUES
(101, 2, '2', 2, '7453.28'),
(201, 2, 'G', 3, '6853.19'),
(301, 3, '3', 3, '7542.75'),
(401, 4, '4', 2, '6753.58'),
(501, 4, '5', 3, '7128.90');

-- --------------------------------------------------------

--
-- Table structure for table `room_type`
--

CREATE TABLE `room_type` (
  `room_type` int(11) NOT NULL,
  `type_desc` varchar(100) NOT NULL,
  `air_cond` varchar(20) NOT NULL,
  `refrigerator` varchar(20) NOT NULL,
  `furniture` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `room_type`
--

INSERT INTO `room_type` (`room_type`, `type_desc`, `air_cond`, `refrigerator`, `furniture`) VALUES
(1, 'Single bed room', 'No', 'No', 'Yes'),
(2, 'Double bed room', 'Yes', 'No', 'Yes'),
(3, 'Triple bed room', 'Yes', 'No', 'Yes'),
(4, 'Half-Duplex room', 'Yes', 'Yes', 'Yes'),
(5, 'Duplex room', 'Yes', 'Yes', 'Yes');

-- --------------------------------------------------------

--
-- Table structure for table `staff`
--

CREATE TABLE `staff` (
  `staff_id` int(11) NOT NULL,
  `first_name` varchar(20) NOT NULL,
  `last_name` varchar(20) NOT NULL,
  `position` varchar(20) NOT NULL,
  `salary` decimal(8,2) NOT NULL,
  `hire_date` date NOT NULL,
  `phone_number` varchar(20) NOT NULL,
  `email` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `staff`
--

INSERT INTO `staff` (`staff_id`, `first_name`, `last_name`, `position`, `salary`, `hire_date`, `phone_number`, `email`) VALUES
(1, 'Pakin', 'Kwansuwan', 'Manager', '24000.00', '2020-01-14', '089-784-5638', 'pakinkwan'),
(2, 'Thanakarn', 'chinwong', 'Housekeeper', '17000.00', '2020-11-24', '096-484-7100', 'ThanakarnChin'),
(3, 'Nayotsakorn', 'junyim', 'Housekeeper', '17000.00', '2020-10-15', '081-777-2233', 'NayotsakornJun'),
(4, 'Thada', 'pipat', 'gardener', '18000.00', '2020-04-15', '091-555-6666', 'ThadaPipat'),
(5, 'Pasit', 'tosan', 'security', '20000.00', '2020-03-30', '088-123-7539', 'Pasittosan');

-- --------------------------------------------------------

--
-- Table structure for table `utility`
--

CREATE TABLE `utility` (
  `utility_id` int(11) NOT NULL,
  `utility_description` varchar(50) DEFAULT NULL,
  `price` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `utility`
--

INSERT INTO `utility` (`utility_id`, `utility_description`, `price`) VALUES
(101, 'Laundry', 20),
(102, 'Washing Machine', 15),
(103, 'Parking lot', 1),
(104, 'Fitness', 100);

-- --------------------------------------------------------

--
-- Table structure for table `utility_bill`
--

CREATE TABLE `utility_bill` (
  `bill_id` int(11) NOT NULL,
  `customer_id` int(11) NOT NULL,
  `utility_id` int(11) NOT NULL,
  `pay_date` date DEFAULT NULL,
  `paid` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `utility_bill`
--

INSERT INTO `utility_bill` (`bill_id`, `customer_id`, `utility_id`, `pay_date`, `paid`) VALUES
(10001, 1001, 101, '2021-09-11', 'Yes'),
(10002, 1001, 103, '2021-09-11', 'Yes'),
(10004, 1001, 104, '2021-09-11', 'Yes'),
(10005, 1002, 101, '2021-08-11', 'Yes'),
(10006, 1002, 104, '2021-08-11', 'Yes'),
(10007, 1003, 102, '2021-08-15', 'Yes'),
(10008, 1004, 102, '2021-10-01', 'Yes'),
(10009, 1004, 103, '2021-10-01', 'Yes'),
(10010, 1004, 104, '2021-10-01', 'Yes'),
(10011, 1005, 101, '2021-11-01', 'Yes'),
(10012, 1005, 104, '2021-11-01', 'Yes');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `bill`
--
ALTER TABLE `bill`
  ADD PRIMARY KEY (`bill_id`),
  ADD KEY `customer_id` (`customer_id`),
  ADD KEY `room_id` (`room_id`);

--
-- Indexes for table `customer`
--
ALTER TABLE `customer`
  ADD PRIMARY KEY (`customer_id`);

--
-- Indexes for table `privilege`
--
ALTER TABLE `privilege`
  ADD PRIMARY KEY (`privilege_id`),
  ADD KEY `bill_id` (`bill_id`),
  ADD KEY `promotion_id` (`promotion_id`);

--
-- Indexes for table `promotion`
--
ALTER TABLE `promotion`
  ADD PRIMARY KEY (`promotion_id`);

--
-- Indexes for table `room`
--
ALTER TABLE `room`
  ADD PRIMARY KEY (`room_id`),
  ADD KEY `room_type` (`room_type`),
  ADD KEY `staff_id` (`staff_id`);

--
-- Indexes for table `room_type`
--
ALTER TABLE `room_type`
  ADD PRIMARY KEY (`room_type`);

--
-- Indexes for table `staff`
--
ALTER TABLE `staff`
  ADD PRIMARY KEY (`staff_id`);

--
-- Indexes for table `utility`
--
ALTER TABLE `utility`
  ADD PRIMARY KEY (`utility_id`);

--
-- Indexes for table `utility_bill`
--
ALTER TABLE `utility_bill`
  ADD PRIMARY KEY (`bill_id`),
  ADD KEY `utility_bill` (`customer_id`),
  ADD KEY `utility_id` (`utility_id`);

--
-- Constraints for dumped tables
--

--
-- Constraints for table `bill`
--
ALTER TABLE `bill`
  ADD CONSTRAINT `bill_ibfk_1` FOREIGN KEY (`customer_id`) REFERENCES `customer` (`customer_id`),
  ADD CONSTRAINT `bill_ibfk_2` FOREIGN KEY (`room_id`) REFERENCES `room` (`room_id`);

--
-- Constraints for table `privilege`
--
ALTER TABLE `privilege`
  ADD CONSTRAINT `privilege_ibfk_1` FOREIGN KEY (`bill_id`) REFERENCES `bill` (`bill_id`),
  ADD CONSTRAINT `privilege_ibfk_2` FOREIGN KEY (`promotion_id`) REFERENCES `promotion` (`promotion_id`);

--
-- Constraints for table `room`
--
ALTER TABLE `room`
  ADD CONSTRAINT `room_ibfk_1` FOREIGN KEY (`room_type`) REFERENCES `room_type` (`room_type`),
  ADD CONSTRAINT `room_ibfk_2` FOREIGN KEY (`staff_id`) REFERENCES `staff` (`staff_id`);

--
-- Constraints for table `utility_bill`
--
ALTER TABLE `utility_bill`
  ADD CONSTRAINT `utility_bill` FOREIGN KEY (`customer_id`) REFERENCES `customer` (`customer_id`),
  ADD CONSTRAINT `utility_bill_ibfk_1` FOREIGN KEY (`utility_id`) REFERENCES `utility` (`utility_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
