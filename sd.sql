-- phpMyAdmin SQL Dump
-- version 4.5.1
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: Apr 18, 2017 at 02:26 PM
-- Server version: 10.1.13-MariaDB
-- PHP Version: 7.0.5

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `sd`
--

-- --------------------------------------------------------

--
-- Table structure for table `billing`
--

CREATE TABLE `billing` (
  `bill_id` int(11) NOT NULL,
  `bill_method` varchar(45) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `billing`
--

INSERT INTO `billing` (`bill_id`, `bill_method`) VALUES
(1, 'Delivery based'),
(2, 'collection');

-- --------------------------------------------------------

--
-- Table structure for table `cmir`
--

CREATE TABLE `cmir` (
  `cus_id` int(11) NOT NULL,
  `mat_id` varchar(30) NOT NULL,
  `CMIR_id` varchar(45) NOT NULL,
  `cus_mat_name` varchar(45) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `condition_type`
--

CREATE TABLE `condition_type` (
  `con_id` varchar(25) NOT NULL,
  `con_type_name` varchar(45) DEFAULT NULL,
  `con_type_description` varchar(45) DEFAULT NULL,
  `con_amount` float NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `condition_type`
--

INSERT INTO `condition_type` (`con_id`, `con_type_name`, `con_type_description`, `con_amount`) VALUES
('1', 'none', 'none', 0),
('2', 'discount', '5% discount for an order over 100,000฿', 0.05),
('3', 'discount', '10% discount for an order over 200,000฿', 0.1),
('4', 'discount', '10% discount for an order over 500,000฿', 0.1);

-- --------------------------------------------------------

--
-- Table structure for table `customer`
--

CREATE TABLE `customer` (
  `cus_id` int(11) NOT NULL,
  `cus_company_name` varchar(80) DEFAULT NULL,
  `cus_contact_person` varchar(45) DEFAULT NULL,
  `cus_department` varchar(45) DEFAULT NULL,
  `cus_address` varchar(140) DEFAULT NULL,
  `cus_email` varchar(45) DEFAULT NULL,
  `cus_tel` varchar(45) DEFAULT NULL,
  `sales_id` int(11) NOT NULL,
  `bill_id` int(11) NOT NULL,
  `parther_id` int(11) NOT NULL,
  `cusgroup_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `customer`
--

INSERT INTO `customer` (`cus_id`, `cus_company_name`, `cus_contact_person`, `cus_department`, `cus_address`, `cus_email`, `cus_tel`, `sales_id`, `bill_id`, `parther_id`, `cusgroup_id`) VALUES
(1, '199 Export Shop', 'Mr.Pim Jaidee', 'Sale Manager', '101 Phahonyothin Rd Chatuchak, BKK', 'export@gmail.com', '02-9966-9998', 1, 1, 1, 1),
(2, 'Beauty Ware Ltd.', 'Ms. Pramate Pungboon', 'Sale Manager', '1556 Sathupradit Rd, Chongnonsee, Yanawa, BKK 10120', '2gmail.com', '02-4857-7895', 2, 1, 1, 1),
(3, 'W&N Shop Ltd.', 'Puckdee Stisod', 'sales Manager', '161 Phahonyothin Rd,Chatuchak,BKK 10900', 'Warees@gmail.com', '082-195-4896', 2, 1, 1, 1),
(4, 'BringltOn Clothing Ltd.', 'Ms. Suki Jirah', 'sale Manager', '36 Suthep Road, soi 5,Muang Chiang Mai 50200', 'bringiton@me.co.th', '053-263-556', 3, 1, 1, 1),
(5, 'Red Apple Fashion Ltd.', 'Ms. Anya Sandee', 'sale Manager', '108 soi 15 Sirimangkalajarn Rd, T.Suthep A.Muang Chiang Mai,Thailand 50200', 'reapple@gmail.com', '092-145-8899', 3, 2, 1, 1);

-- --------------------------------------------------------

--
-- Table structure for table `cus_group`
--

CREATE TABLE `cus_group` (
  `cusgroup_id` int(11) NOT NULL,
  `cusgroup_name` varchar(45) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `cus_group`
--

INSERT INTO `cus_group` (`cusgroup_id`, `cusgroup_name`) VALUES
(1, 'A'),
(2, 'B'),
(3, 'C');

-- --------------------------------------------------------

--
-- Table structure for table `docheader`
--

CREATE TABLE `docheader` (
  `dochead_id` varchar(45) NOT NULL,
  `document_type` varchar(45) DEFAULT NULL,
  `cus_id` int(11) NOT NULL,
  `sales_id` int(11) NOT NULL,
  `bill_id` int(11) NOT NULL,
  `parther_id` int(11) NOT NULL,
  `cusgroup_id` int(11) NOT NULL,
  `Ref_id` varchar(45) NOT NULL,
  `doc_dates` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `docheader`
--

INSERT INTO `docheader` (`dochead_id`, `document_type`, `cus_id`, `sales_id`, `bill_id`, `parther_id`, `cusgroup_id`, `Ref_id`, `doc_dates`) VALUES
('Inq0001', 'Inquiry', 1, 1, 1, 1, 1, 'Inq0001', '2017-04-10'),
('Inq0002', 'Inquiry', 2, 2, 1, 1, 1, 'Inq0002', '2017-04-10'),
('Inq0003', 'Inquiry', 3, 2, 1, 1, 1, 'Inq0003', '2017-04-10'),
('Inq0004', 'Inquiry', 4, 3, 1, 1, 1, 'Inq0004', '2017-04-15'),
('Inq0005', 'Inquiry', 5, 3, 2, 1, 1, 'Inq0005', '2017-04-15'),
('OR001', 'sale order', 1, 1, 1, 1, 1, 'OR0001', '2017-04-13'),
('Qt0001', 'Quotation', 1, 1, 1, 1, 1, 'Qt0001', '2017-04-11'),
('Qt0002', 'Quotation', 2, 2, 1, 1, 1, 'Qt0002', '2017-04-11'),
('Qt0003', 'Quotation', 3, 2, 1, 1, 1, 'Qt0003', '2017-04-11'),
('Qt0004', 'Quotation', 4, 3, 1, 1, 1, 'Qt0004', '2017-04-16'),
('Qt0005', 'Quotation', 5, 3, 2, 1, 1, 'Qt0005', '2017-04-16');

-- --------------------------------------------------------

--
-- Table structure for table `itemlist`
--

CREATE TABLE `itemlist` (
  `itemlist_id` int(11) NOT NULL,
  `mat_id` varchar(30) NOT NULL,
  `QTY` int(11) DEFAULT NULL,
  `dochead_id` varchar(45) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `itemlist`
--

INSERT INTO `itemlist` (`itemlist_id`, `mat_id`, `QTY`, `dochead_id`) VALUES
(101, 'WA00010', 50, 'QT0001'),
(102, 'WA00110', 30, 'QT0001'),
(103, 'WA00210', 30, 'QT0001'),
(104, 'WA00012', 30, 'QT0001'),
(105, 'WA00112', 30, 'QT0001'),
(106, 'WA00212', 30, 'QT0001'),
(107, 'WD00016', 10, 'QT0001'),
(108, 'WX00013', 15, 'QT0001'),
(109, 'WX00014', 35, 'QT0001'),
(110, 'WX00015', 35, 'QT0001'),
(111, 'MT00013', 10, 'QT0001'),
(112, 'MT00113', 10, 'QT0001'),
(113, 'MB00030', 10, 'QT0001'),
(114, 'MB00040', 10, 'QT0001'),
(201, 'MT00013', 15, 'QT0002'),
(202, 'MT00113', 15, 'QT0002'),
(203, 'MT00213', 15, 'QT0002'),
(204, 'MT00014', 20, 'QT0002'),
(205, 'MT00114', 20, 'QT0002'),
(206, 'MT00214', 20, 'QT0002'),
(207, 'MU00017', 30, 'QT0002'),
(208, 'MU00117', 30, 'QT0002'),
(209, 'MU00018', 25, 'QT0002'),
(210, 'MU00118', 25, 'QT0002'),
(211, 'WD00011', 20, 'QT0002'),
(212, 'WD00012', 20, 'QT0002'),
(213, 'WD00013', 20, 'QT0002'),
(214, 'WD00014', 20, 'QT0002'),
(215, 'WD00015', 20, 'QT0002'),
(216, 'WS00020', 10, 'QT0002'),
(217, 'WS00120', 10, 'QT0002'),
(218, 'WS00220', 10, 'QT0002'),
(301, 'WD00011', 50, 'QT0003'),
(302, 'WD00012', 50, 'QT0003'),
(303, 'WD00013', 50, 'QT0003'),
(304, 'WD00014', 50, 'QT0003'),
(305, 'WD00015', 50, 'QT0003'),
(306, 'WD00016', 50, 'QT0003'),
(307, 'WD00017', 60, 'QT0003'),
(308, 'WD00011', 30, 'QT0003'),
(309, 'WD00012', 30, 'QT0003'),
(310, 'MT00011', 40, 'QT0003'),
(311, 'MT00111', 40, 'QT0003'),
(312, 'MT00211', 40, 'QT0003'),
(313, 'MT00012', 30, 'QT0003'),
(314, 'MT00112', 30, 'QT0003'),
(315, 'MT00212', 30, 'QT0003'),
(316, 'MT00013', 40, 'QT0003'),
(317, 'MT00113', 40, 'QT0003'),
(318, 'MS00016', 20, 'QT0003'),
(319, 'MS00116', 15, 'QT0003'),
(320, 'MS00216', 15, 'QT0003'),
(401, 'WS00010', 25, 'QT0004'),
(402, 'WS00110', 20, 'QT0004'),
(403, 'WS00210', 20, 'QT0004'),
(404, 'WS00011', 25, 'QT0004'),
(405, 'WS00111', 20, 'QT0004'),
(406, 'WS00211', 20, 'QT0004'),
(407, 'WA00011', 30, 'QT0004'),
(408, 'WA00111', 30, 'QT0004'),
(409, 'WA00211', 30, 'QT0004'),
(410, 'WD00013', 10, 'QT0004'),
(411, 'WD00014', 10, 'QT0004'),
(412, 'WD00015', 10, 'QT0004'),
(413, 'WD00016', 20, 'QT0004'),
(414, 'WD00017', 30, 'QT0004'),
(501, 'WX00013', 40, 'QT0005'),
(502, 'WX00014', 40, 'QT0005'),
(503, 'WX00015', 40, 'QT0005'),
(504, 'WA00012', 20, 'QT0005'),
(505, 'WA00112', 20, 'QT0005'),
(506, 'WA00212', 20, 'QT0005'),
(507, 'WA00013', 30, 'QT0005'),
(508, 'WA00113', 30, 'QT0005'),
(509, 'WA00213', 30, 'QT0005'),
(510, 'MU00020', 30, 'QT0005'),
(511, 'MU00120', 30, 'QT0005'),
(512, 'MU00021', 25, 'QT0005'),
(513, 'MU00121', 25, 'QT0005'),
(514, 'MU00022', 25, 'QT0005'),
(515, 'MU00122', 25, 'QT0005'),
(516, 'WS00010', 50, 'QT0005'),
(517, 'WS00110', 50, 'QT0005'),
(518, 'WS00210', 50, 'QT0005'),
(519, 'WS00011', 25, 'QT0005'),
(520, 'WS00111', 25, 'QT0005'),
(521, 'WS00211', 25, 'QT0005'),
(522, 'MS00014', 50, 'QT0005'),
(523, 'MS00114', 50, 'QT0005'),
(524, 'MS00214', 50, 'QT0005'),
(525, 'MS00015', 30, 'QT0005'),
(526, 'MS00115', 30, 'QT0005'),
(527, 'MS00215', 30, 'QT0005'),
(528, 'MT00013', 50, 'QT0005'),
(529, 'MT00113', 50, 'QT0005'),
(530, 'MT00213', 50, 'QT0005');

-- --------------------------------------------------------

--
-- Table structure for table `itemlist_price`
--

CREATE TABLE `itemlist_price` (
  `itemlist_Price_id` int(11) NOT NULL,
  `price_id` int(11) NOT NULL,
  `itemlist_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `itemlist_price`
--

INSERT INTO `itemlist_price` (`itemlist_Price_id`, `price_id`, `itemlist_id`) VALUES
(0, 0, 0),
(1, 101, 101),
(2, 102, 102),
(3, 103, 103),
(59, 104, 407),
(60, 105, 408),
(61, 106, 409),
(4, 107, 104),
(70, 107, 504),
(5, 108, 105),
(71, 108, 505),
(6, 109, 106),
(72, 109, 506),
(73, 110, 507),
(74, 111, 508),
(75, 112, 509),
(25, 201, 211),
(33, 201, 301),
(40, 201, 308),
(26, 202, 212),
(34, 202, 302),
(41, 202, 309),
(27, 203, 213),
(35, 203, 303),
(62, 203, 410),
(28, 204, 214),
(36, 204, 304),
(63, 204, 411),
(29, 205, 215),
(37, 205, 305),
(64, 205, 412),
(7, 206, 107),
(38, 206, 306),
(65, 206, 413),
(39, 207, 307),
(66, 207, 414),
(8, 303, 108),
(67, 303, 501),
(9, 304, 109),
(68, 304, 502),
(10, 305, 110),
(69, 305, 503),
(53, 501, 401),
(82, 501, 516),
(54, 502, 402),
(83, 502, 517),
(55, 503, 403),
(84, 503, 518),
(56, 504, 404),
(85, 504, 519),
(57, 505, 405),
(86, 505, 520),
(58, 506, 406),
(87, 506, 521),
(30, 507, 216),
(31, 508, 217),
(32, 509, 218),
(42, 601, 310),
(43, 602, 311),
(44, 603, 312),
(45, 604, 313),
(46, 605, 314),
(47, 606, 315),
(11, 607, 111),
(15, 607, 201),
(48, 607, 316),
(94, 607, 528),
(12, 608, 112),
(16, 608, 202),
(49, 608, 317),
(95, 608, 529),
(17, 609, 203),
(96, 609, 530),
(18, 610, 204),
(19, 611, 205),
(20, 612, 206),
(13, 703, 113),
(14, 704, 114),
(21, 805, 207),
(22, 806, 208),
(23, 807, 209),
(24, 808, 210),
(76, 811, 510),
(77, 812, 511),
(78, 813, 512),
(79, 814, 513),
(80, 815, 514),
(81, 816, 515),
(88, 1001, 522),
(89, 1002, 523),
(90, 1003, 524),
(91, 1004, 525),
(92, 1005, 526),
(93, 1006, 527),
(50, 1007, 318),
(51, 1008, 319),
(52, 1009, 320);

-- --------------------------------------------------------

--
-- Table structure for table `materials`
--

CREATE TABLE `materials` (
  `mat_id` varchar(30) NOT NULL,
  `mat_description` varchar(45) DEFAULT NULL,
  `mat_type` varchar(45) DEFAULT NULL,
  `mat_group` varchar(45) DEFAULT NULL,
  `mat_price_per_unit` float DEFAULT NULL,
  `mat_Instock` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `materials`
--

INSERT INTO `materials` (`mat_id`, `mat_description`, `mat_type`, `mat_group`, `mat_price_per_unit`, `mat_Instock`) VALUES
('MB00010', 'Navy Blue Striped Blazer', 'Blazer', 'man', 1000, 500),
('MB00020', 'Black & White Striped Blazer', 'Blazer', 'man', 1000, 500),
('MB00030', 'Basic Black Blazer', 'Blazer', 'man', 900, 500),
('MB00040', 'Basic Gray Blazer', 'Blazer', 'man', 900, 500),
('MB00050', 'Basic Sky Blue Blazer', 'Blazer', 'man', 900, 500),
('MM00011', 'Two-Tone Wool Suit', 'Suit', 'man', 1800, 500),
('MM00022', 'Ink Blue Suit', 'Suit', 'man', 1500, 500),
('MM00033', 'Black Cotton Suit', 'Suit', 'man', 1500, 500),
('MS00014', 'Brown Leather Shoes 40', 'Shoes', 'man', 1200, 500),
('MS00015', 'Black Leather Shoes 40', 'Shoes', 'man', 1200, 500),
('MS00016', 'Navy Sneakers 40', 'Shoes', 'man', 1000, 500),
('MS00114', 'Brown Leather Shoes 42', 'Shoes', 'man', 1200, 500),
('MS00115', 'Black Leather Shoes 42', 'Shoes', 'man', 1200, 500),
('MS00116', 'Navy Sneakers 42', 'Shoes', 'man', 1000, 500),
('MS00214', 'Brown Leather Shoes 44', 'Shoes', 'man', 1200, 500),
('MS00215', 'Black Leather Shoes 44', 'Shoes', 'man', 1200, 500),
('MS00216', 'Navy Sneakers 44', 'Shoes', 'man', 1000, 500),
('MT00011', 'Linen T-Shirt S', 'T-Shirt', 'man', 250, 500),
('MT00012', 'Printed T-Shirt S', 'T-Shirt', 'man', 250, 500),
('MT00013', 'Blue Panels T-Shirt S', 'T-Shirt', 'man', 250, 500),
('MT00014', 'Gray Panels T-Shirt S', 'T-Shirt', 'man', 250, 500),
('MT00111', 'Linen T-Shirt M', 'T-Shirt', 'man', 250, 500),
('MT00112', 'Printed T-Shirt M', 'T-Shirt', 'man', 250, 500),
('MT00113', 'Blue Panels T-Shirt M', 'T-Shirt', 'man', 250, 500),
('MT00114', 'Gray Panels T-Shirt M', 'T-Shirt', 'man', 250, 500),
('MT00211', 'Linen T-Shirt L', 'T-Shirt', 'man', 250, 500),
('MT00212', 'Printed T-Shirt L', 'T-Shirt', 'man', 250, 500),
('MT00213', 'Blue Panels T-Shirt L', 'T-Shirt', 'man', 250, 500),
('MT00214', 'Gray Panels T-Shirt L', 'T-Shirt', 'man', 250, 500),
('MU00015', 'Jogging Trousers M', 'Trousers', 'man', 800, 500),
('MU00016', 'Soft Cargo Trousers M', 'Trousers', 'man', 800, 500),
('MU00017', 'Ink Blue Comfort Trousers M', 'Trousers', 'man', 800, 500),
('MU00018', 'Gray Basic Linen Trousers M', 'Trousers', 'man', 800, 500),
('MU00019', 'Beige Basic Linen Trousers M', 'Trousers', 'man', 800, 500),
('MU00020', 'Khaki Cotton Short M', 'Short', 'man', 500, 500),
('MU00021', 'Tan Cotton Short M', 'Short', 'man', 500, 500),
('MU00022', 'Black Cotton Short M', 'Short', 'man', 500, 500),
('MU00115', 'Jogging Trousers L', 'Trousers', 'man', 800, 500),
('MU00116', 'Soft Cargo Trousers L', 'Trousers', 'man', 800, 500),
('MU00117', 'Ink Blue Comfort Trousers L', 'Trousers', 'man', 800, 500),
('MU00118', 'Gray Basic Linen Trousers L', 'Trousers', 'man', 800, 500),
('MU00119', 'Beige Basic Linen Trousers L', 'Trousers', 'man', 800, 500),
('MU00120', 'Khaki Cotton Short L', 'Short', 'man', 500, 500),
('MU00121', 'Tan Cotton Short L', 'Short', 'man', 500, 500),
('MU00122', 'Black Cotton Short L', 'Short', 'man', 500, 500),
('WA00010', 'Pencil Skirts S', 'Skirts ', 'women', 250, 150),
('WA00011', 'Pleats Satin Skirt S', 'Skirts ', 'women', 300, 150),
('WA00012', 'Mini Denim Skirt S', 'Skirts ', 'women', 250, 150),
('WA00013', 'Maxi Printed Skrit S', 'Skirts ', 'women', 300, 100),
('WA00110', 'Pencil Skirts M', 'Skirts ', 'women', 250, 150),
('WA00111', 'Pleats Satin Skirt M', 'Skirts ', 'women', 300, 150),
('WA00112', 'Mini Denim Skirt M', 'Skirts ', 'women', 250, 150),
('WA00113', 'Maxi Printed Skrit M', 'Skirts ', 'women', 300, 100),
('WA00210', 'Pencil Skirts L', 'Skirts ', 'women', 250, 150),
('WA00211', 'Pleats Satin Skirt L', 'Skirts ', 'women', 300, 150),
('WA00212', 'Mini Denim Skirt L', 'Skirts ', 'women', 250, 150),
('WA00213', 'Maxi Printed Skrit L', 'Skirts ', 'women', 300, 100),
('WB00016', 'Navy Blue Striped Blazer M', 'Blazer', 'women', 900, 250),
('WB00017', 'Black & White Striped Blazer M', 'Blazer', 'women', 900, 250),
('WB00018', 'Basic off-White Blazer M', 'Blazer', 'women', 800, 250),
('WB00019', 'Basic Double Black Blazer M', 'Blazer', 'women', 800, 250),
('WB00116', 'Navy Blue Striped Blazer L', 'Blazer', 'women', 900, 250),
('WB00117', 'Black & White Striped Blazer L	', 'Blazer', 'women', 900, 250),
('WB00118', 'Basic off-White Blazer L', 'Blazer', 'women', 800, 250),
('WB00119', 'Basic Double Black Blazer L', 'Blazer', 'women', 800, 250),
('WD00011', 'Floral Printed Dress', 'Dress', 'women', 500, 150),
('WD00012', 'off-Shoulder Printed Dress', 'Dress', 'women', 550, 150),
('WD00013', 'Pleated Midi Dress', 'Dress', 'women', 600, 150),
('WD00014', 'Daisies Jumpsuit Dress', 'Dress', 'women', 550, 100),
('WD00015', 'Maxi Jumpsuit Dress', 'Dress', 'women', 800, 100),
('WD00016', 'Cocktail Dress red', 'Dress', 'women', 900, 100),
('WD00017', 'Cocktail Dress White', 'Dress', 'women', 900, 100),
('WS00010', 'Satin Snaeaker 37', 'Shoes', 'women', 1000, 200),
('WS00011', 'Black Leather Sandals 37', 'Shoes', 'women', 850, 200),
('WS00020', 'Metallic Hight Heel Shoes 37', 'Shoes', 'women', 1100, 200),
('WS00021', 'Platform Heel Sandals 37', 'Shoes', 'women', 1000, 200),
('WS00110', 'Satin Snaeaker 38', 'Shoes', 'women', 1000, 200),
('WS00111', 'Black Leather Sandals 38', 'Shoes', 'women', 850, 200),
('WS00120', 'Metallic Hight Heel Shoes 38', 'Shoes', 'women', 1100, 200),
('WS00121', 'Platform Heel Sandals 38', 'Shoes', 'women', 1000, 200),
('WS00210', 'Satin Snaeaker 39', 'Shoes', 'women', 1000, 200),
('WS00211', 'Black Leather Sandals 39', 'Shoes', 'women', 850, 200),
('WS00220', 'Metallic Hight Heel Shoes 39', 'Shoes', 'women', 1100, 200),
('WS00221', 'Platform Heel Sandals 39', 'Shoes', 'women', 1000, 200),
('WX00011', 'Oxford Shirt White', 'Shirt', 'women', 250, 500),
('WX00012', 'Oxford Shirt Black', 'Shirt', 'women', 250, 500),
('WX00013', 'Oxford Shirt Light Blue', 'Shirt', 'women', 250, 500),
('WX00014', 'Oxford Shirt Dark Gray', 'Shirt', 'women', 250, 500),
('WX00015', 'Oxford Shirt Prink', 'Shirt', 'women', 250, 500);

-- --------------------------------------------------------

--
-- Table structure for table `partner_functions`
--

CREATE TABLE `partner_functions` (
  `parther_id` int(11) NOT NULL,
  `partner_type_of_parther` varchar(45) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `partner_functions`
--

INSERT INTO `partner_functions` (`parther_id`, `partner_type_of_parther`) VALUES
(1, 'sold-to party '),
(2, 'ship-to party location '),
(3, 'bill-to party '),
(4, 'payer ');

-- --------------------------------------------------------

--
-- Table structure for table `pricing`
--

CREATE TABLE `pricing` (
  `price_id` int(11) NOT NULL,
  `mat_id` varchar(30) NOT NULL,
  `price_amount` float DEFAULT NULL,
  `price_valid_from` varchar(20) DEFAULT NULL,
  `scale_price_id` int(11) NOT NULL,
  `con_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `pricing`
--

INSERT INTO `pricing` (`price_id`, `mat_id`, `price_amount`, `price_valid_from`, `scale_price_id`, `con_id`) VALUES
(101, 'WA00010', 250, '2017to2018', 3, 1),
(102, 'WA00110', 250, '2017to2018', 3, 1),
(103, 'WA00210', 250, '2017to2018', 3, 1),
(104, 'WA00011', 300, '2017to2018', 3, 1),
(105, 'WA00111', 300, '2017to2018', 3, 1),
(106, 'WA00211', 300, '2017to2018', 3, 1),
(107, 'WA00012', 250, '2017to2018', 3, 1),
(108, 'WA00112', 250, '2017to2018', 3, 1),
(109, 'WA00212', 250, '2017to2018', 3, 1),
(110, 'WA00013', 300, '2017to2018', 3, 1),
(111, 'WA00113', 300, '2017to2018', 3, 1),
(112, 'WA00213', 300, '2017to2018', 3, 1),
(201, 'WD00011', 500, '2017to2018', 3, 1),
(202, 'WD00012', 550, '2017to2018', 3, 1),
(203, 'WD00013', 600, '2017to2018', 3, 1),
(204, 'WD00014', 550, '2017to2018', 3, 1),
(205, 'WD00015', 800, '2017to2018', 3, 1),
(206, 'WD00016', 900, '2017to2018', 3, 1),
(207, 'WD00017', 900, '2017to2018', 3, 1),
(301, 'WX00011', 250, '2017to2018', 2, 1),
(302, 'WX00012', 250, '2017to2018', 2, 1),
(303, 'WX00013', 250, '2017to2018', 1, 1),
(304, 'WX00014', 250, '2017to2018', 1, 1),
(305, 'WX00015', 250, '2017to2018', 1, 1),
(401, 'WB00016', 900, '2017to2018', 3, 1),
(402, 'WB00116', 900, '2017to2018', 3, 1),
(403, 'WB00017', 900, '2017to2018', 3, 1),
(404, 'WB00117', 900, '2017to2018', 3, 1),
(405, 'WB00018', 800, '2017to2018', 1, 1),
(406, 'WB00118', 800, '2017to2018', 1, 1),
(407, 'WB00019', 800, '2017to2018', 1, 1),
(408, 'WB00119', 800, '2017to2018', 1, 1),
(501, 'WS00010', 1000, '2017to2018', 3, 1),
(502, 'WS00110', 1000, '2017to2018', 3, 1),
(503, 'WS00210', 1000, '2017to2018', 3, 1),
(504, 'WS00011', 850, '2017to2018', 3, 1),
(505, 'WS00111', 850, '2017to2018', 3, 1),
(506, 'WS00211', 850, '2017to2018', 3, 1),
(507, 'WS00020', 1100, '2017to2018', 3, 1),
(508, 'WS00120', 1100, '2017to2018', 3, 1),
(509, 'WS00220', 1100, '2017to2018', 3, 1),
(510, 'WS00021', 1000, '2017to2018', 3, 1),
(511, 'WS00121', 1000, '2017to2018', 3, 1),
(512, 'WS00221', 1000, '2017to2018', 3, 1),
(601, 'MT00011', 250, '2017to2018', 1, 1),
(602, 'MT00111', 250, '2017to2018', 1, 1),
(603, 'MT00211', 250, '2017to2018', 1, 1),
(604, 'MT00012', 250, '2017to2018', 1, 1),
(605, 'MT00112', 250, '2017to2018', 1, 1),
(606, 'MT00212', 250, '2017to2018', 1, 1),
(607, 'MT00013', 250, '2017to2018', 3, 1),
(608, 'MT00113', 250, '2017to2018', 3, 1),
(609, 'MT00213', 250, '2017to2018', 3, 1),
(610, 'MT00014', 250, '2017to2018', 3, 1),
(611, 'MT00114', 250, '2017to2018', 3, 1),
(612, 'MT00214', 250, '2017to2018', 3, 1),
(701, 'MB00010', 1000, '2017to2018', 3, 1),
(702, 'MB00020', 1000, '2017to2018', 3, 1),
(703, 'MB00030', 900, '2017to2018', 3, 1),
(704, 'MB00040', 900, '2017to2018', 3, 1),
(705, 'MB00050', 900, '2017to2018', 3, 1),
(801, 'MU00015', 800, '2017to2018', 3, 1),
(802, 'MU00115', 800, '2017to2018', 3, 1),
(803, 'MU00016', 800, '2017to2018', 3, 1),
(804, 'MU00116', 800, '2017to2018', 3, 1),
(805, 'MU00017', 800, '2017to2018', 1, 1),
(806, 'MU00117', 800, '2017to2018', 1, 1),
(807, 'MU00018', 800, '2017to2018', 1, 1),
(808, 'MU00118', 800, '2017to2018', 1, 1),
(809, 'MU00019', 800, '2017to2018', 1, 1),
(810, 'MU00119', 800, '2017to2018', 1, 1),
(811, 'MU00020', 500, '2017to2018', 3, 1),
(812, 'MU00120', 500, '2017to2018', 3, 1),
(813, 'MU00021', 500, '2017to2018', 3, 1),
(814, 'MU00121', 500, '2017to2018', 3, 1),
(815, 'MU00022', 500, '2017to2018', 3, 1),
(816, 'MU00122', 500, '2017to2018', 3, 1),
(901, 'MM00011', 1800, '2017to2018', 3, 1),
(902, 'MM00022', 1500, '2017to2018', 3, 1),
(903, 'MM00033', 1500, '2017to2018', 3, 1),
(1001, 'MS00014', 1200, '2017to2018', 3, 1),
(1002, 'MS00114', 1200, '2017to2018', 3, 1),
(1003, 'MS00214', 1200, '2017to2018', 3, 1),
(1004, 'MS00015', 1200, '2017to2018', 3, 1),
(1005, 'MS00115', 1200, '2017to2018', 3, 1),
(1006, 'MS00215', 1200, '2017to2018', 3, 1),
(1007, 'MS00016', 1000, '2017to2018', 3, 1),
(1008, 'MS00116', 1000, '2017to2018', 3, 1),
(1009, 'MS00216', 1000, '2017to2018', 3, 1);

-- --------------------------------------------------------

--
-- Table structure for table `sales`
--

CREATE TABLE `sales` (
  `sales_id` int(11) NOT NULL,
  `sales_office` varchar(45) DEFAULT NULL,
  `sale_currency` varchar(45) DEFAULT NULL,
  `sale_district` varchar(45) DEFAULT NULL,
  `price_list` varchar(45) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `sales`
--

INSERT INTO `sales` (`sales_id`, `sales_office`, `sale_currency`, `sale_district`, `price_list`) VALUES
(1, 'sales office', 'THB', 'BKK', 'shop'),
(2, 'sales office', 'THB', 'BKK', 'Ltd.'),
(3, 'sales office', 'THB', 'Chiang Mai', 'Ltd.');

-- --------------------------------------------------------

--
-- Table structure for table `sale_order`
--

CREATE TABLE `sale_order` (
  `sale_order_id` int(11) NOT NULL,
  `dochead_id` varchar(45) NOT NULL,
  `good_issue_dates` date DEFAULT NULL,
  `PO_date` date DEFAULT NULL,
  `invoice_date` date DEFAULT NULL,
  `sales_Rep` varchar(45) DEFAULT NULL,
  `terms` varchar(45) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `scale_price`
--

CREATE TABLE `scale_price` (
  `scale_price_id` int(11) NOT NULL,
  `sp_description` varchar(45) DEFAULT NULL,
  `sp_amount` varchar(45) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `scale_price`
--

INSERT INTO `scale_price` (`scale_price_id`, `sp_description`, `sp_amount`) VALUES
(1, '20 Unites earn 5%', '0.05'),
(2, '30 Unites earn 5%', '0.05'),
(3, 'none', '0');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `billing`
--
ALTER TABLE `billing`
  ADD PRIMARY KEY (`bill_id`);

--
-- Indexes for table `cmir`
--
ALTER TABLE `cmir`
  ADD PRIMARY KEY (`cus_id`,`mat_id`,`CMIR_id`),
  ADD KEY `fk_customer_has_materials_materials1_idx` (`mat_id`),
  ADD KEY `fk_customer_has_materials_customer_idx` (`cus_id`);

--
-- Indexes for table `condition_type`
--
ALTER TABLE `condition_type`
  ADD PRIMARY KEY (`con_id`);

--
-- Indexes for table `customer`
--
ALTER TABLE `customer`
  ADD PRIMARY KEY (`cus_id`,`sales_id`,`bill_id`,`parther_id`,`cusgroup_id`),
  ADD KEY `fk_customer_sales1_idx` (`sales_id`),
  ADD KEY `fk_customer_billing1_idx` (`bill_id`),
  ADD KEY `fk_customer_partner_functions1_idx` (`parther_id`),
  ADD KEY `fk_customer_cus_group1_idx` (`cusgroup_id`);

--
-- Indexes for table `cus_group`
--
ALTER TABLE `cus_group`
  ADD PRIMARY KEY (`cusgroup_id`);

--
-- Indexes for table `docheader`
--
ALTER TABLE `docheader`
  ADD PRIMARY KEY (`dochead_id`,`cus_id`,`sales_id`,`bill_id`,`parther_id`,`cusgroup_id`),
  ADD KEY `fk_Docheader_customer1_idx` (`cus_id`,`sales_id`,`bill_id`,`parther_id`,`cusgroup_id`),
  ADD KEY `fk_Docheader_Docheader1_idx` (`Ref_id`);

--
-- Indexes for table `itemlist`
--
ALTER TABLE `itemlist`
  ADD PRIMARY KEY (`itemlist_id`,`mat_id`,`dochead_id`),
  ADD KEY `fk_itemlist_materials1_idx` (`mat_id`),
  ADD KEY `fk_itemlist_Docheader1_idx` (`dochead_id`);

--
-- Indexes for table `itemlist_price`
--
ALTER TABLE `itemlist_price`
  ADD PRIMARY KEY (`price_id`,`itemlist_id`,`itemlist_Price_id`),
  ADD KEY `fk_pricing_has_itemlist_itemlist1_idx` (`itemlist_id`),
  ADD KEY `fk_pricing_has_itemlist_pricing1_idx` (`price_id`);

--
-- Indexes for table `materials`
--
ALTER TABLE `materials`
  ADD PRIMARY KEY (`mat_id`);

--
-- Indexes for table `partner_functions`
--
ALTER TABLE `partner_functions`
  ADD PRIMARY KEY (`parther_id`);

--
-- Indexes for table `pricing`
--
ALTER TABLE `pricing`
  ADD PRIMARY KEY (`price_id`,`mat_id`,`scale_price_id`,`con_id`),
  ADD KEY `fk_pricing_scale_price1_idx` (`scale_price_id`),
  ADD KEY `fk_pricing_condition_type1_idx` (`con_id`),
  ADD KEY `fk_pricing_materials1_idx` (`mat_id`);

--
-- Indexes for table `sales`
--
ALTER TABLE `sales`
  ADD PRIMARY KEY (`sales_id`);

--
-- Indexes for table `sale_order`
--
ALTER TABLE `sale_order`
  ADD PRIMARY KEY (`sale_order_id`,`dochead_id`),
  ADD KEY `fk_sale_order_Docheader1_idx` (`dochead_id`);

--
-- Indexes for table `scale_price`
--
ALTER TABLE `scale_price`
  ADD PRIMARY KEY (`scale_price_id`);

--
-- Constraints for dumped tables
--

--
-- Constraints for table `cmir`
--
ALTER TABLE `cmir`
  ADD CONSTRAINT `fk_customer_has_materials_customer` FOREIGN KEY (`cus_id`) REFERENCES `customer` (`cus_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_customer_has_materials_materials1` FOREIGN KEY (`mat_id`) REFERENCES `materials` (`mat_id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `customer`
--
ALTER TABLE `customer`
  ADD CONSTRAINT `fk_customer_billing1` FOREIGN KEY (`bill_id`) REFERENCES `billing` (`bill_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_customer_cus_group1` FOREIGN KEY (`cusgroup_id`) REFERENCES `cus_group` (`cusgroup_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_customer_partner_functions1` FOREIGN KEY (`parther_id`) REFERENCES `partner_functions` (`parther_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_customer_sales1` FOREIGN KEY (`sales_id`) REFERENCES `sales` (`sales_id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
