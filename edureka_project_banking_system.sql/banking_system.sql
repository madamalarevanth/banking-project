--
-- Database: `banking_system`
--
CREATE DATABASE IF NOT EXISTS `banking_system` DEFAULT CHARACTER SET latin1 COLLATE latin1_swedish_ci;
USE `banking_system`;

-- --------------------------------------------------------

--
-- Table structure for table `account`
--

DROP TABLE IF EXISTS `account`;
CREATE TABLE `account` (
  `name` char(10) NOT NULL,
  `dob` char(10) NOT NULL,
  `contact_no` int(10) NOT NULL,
  `email_id` varchar(50) NOT NULL,
  `adress` varchar(500) NOT NULL,
  `acc_type` char(15) NOT NULL,
  `balance` int(11) NOT NULL,
  `account_no` bigint(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- RELATIONS FOR TABLE `account`:
--

--
-- Dumping data for table `account`
--

INSERT INTO `account` (`name`, `dob`, `contact_no`, `email_id`, `adress`, `acc_type`, `balance`, `account_no`) VALUES
('revanth', '2017-11-05', 1324567980, 'qwerty', 'd.no.1346;\r\nrevj;\r\nnasp.', 'SB_account', 42075, 123456789),
('mnrao', '2017-11-15', 2147483647, 'qwewqw', 'qwe;\r\nqwe;\r\nqwe.', 'SB_account', 1214, 1234567809),
('halo', '2101-12-12', 1234561234, 'qereqtyufghlkjhf', 'jtqtasdfqkwqfuwd\r\nqwdqwh,\r\nqwdgqfcd.', 'sb', 123456666, 1234567812),
('revanb', '1234-12-12', 1234567898, 'email id', 'address', 'sb', 1234, 1234567892);

-- --------------------------------------------------------

--
-- Table structure for table `authentication`
--

DROP TABLE IF EXISTS `authentication`;
CREATE TABLE `authentication` (
  `user_id` int(10) NOT NULL,
  `username` varchar(12) NOT NULL,
  `pswd` varchar(12) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- RELATIONS FOR TABLE `authentication`:
--

--
-- Dumping data for table `authentication`
--

INSERT INTO `authentication` (`user_id`, `username`, `pswd`) VALUES
(2, 'mnrao', '234'),
(1, 'revanth', '123');

-- --------------------------------------------------------

--
-- Table structure for table `credit_card`
--

DROP TABLE IF EXISTS `credit_card`;
CREATE TABLE `credit_card` (
  `name` char(25) NOT NULL,
  `card_no` int(10) NOT NULL,
  `cvv` int(3) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- RELATIONS FOR TABLE `credit_card`:
--

--
-- Dumping data for table `credit_card`
--

INSERT INTO `credit_card` (`name`, `card_no`, `cvv`) VALUES
('bhargavi', 1765432108, 345),
('mnrao', 2145678901, 234),
('raj', 1864208709, 456),
('revanth', 1234567890, 234);

-- --------------------------------------------------------

--
-- Table structure for table `transactions`
--

DROP TABLE IF EXISTS `transactions`;
CREATE TABLE `transactions` (
  `s.no` int(11) NOT NULL,
  `account_no` int(11) NOT NULL,
  `date` varchar(10) NOT NULL,
  `description` char(50) NOT NULL,
  `cheque_no` int(11) NOT NULL,
  `withdrawal` int(11) NOT NULL,
  `deposit` int(11) NOT NULL,
  `balance` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- RELATIONS FOR TABLE `transactions`:
--   `account_no`
--       `account` -> `account_no`
--

--
-- Dumping data for table `transactions`
--

INSERT INTO `transactions` (`s.no`, `account_no`, `date`, `description`, `cheque_no`, `withdrawal`, `deposit`, `balance`) VALUES
(1, 123456789, '2017-12-09', 'atm', 0, 1000, 0, 12000),
(1, 123456789, '2017-12-09', 'atm', 0, 1000, 0, 12000),
(3, 123456789, '2017-12-23', 'fee payment', 12345612, 0, 45000, 120000),
(4, 123456789, '2017-12-24', 'payment', 0, 0, 3243, 2342342);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `account`
--
ALTER TABLE `account`
  ADD PRIMARY KEY (`account_no`);

--
-- Indexes for table `authentication`
--
ALTER TABLE `authentication`
  ADD PRIMARY KEY (`username`);

--
-- Indexes for table `credit_card`
--
ALTER TABLE `credit_card`
  ADD PRIMARY KEY (`name`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
