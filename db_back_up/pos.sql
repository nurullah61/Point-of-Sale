-- phpMyAdmin SQL Dump
-- version 4.6.4
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Oct 04, 2017 at 10:04 AM
-- Server version: 5.7.14
-- PHP Version: 5.6.25

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `pos`
--

-- --------------------------------------------------------

--
-- Table structure for table `ac_ledgers`
--

CREATE TABLE `ac_ledgers` (
  `VLEDGER_NO` bigint(14) NOT NULL DEFAULT '0' COMMENT 'Primary Key',
  `VLEDGER_DT` date DEFAULT NULL COMMENT 'This Ledger Create Date',
  `TRX_CODE_NO` varchar(10) DEFAULT NULL COMMENT 'This Trangation Code ex. GR = GOOD Receive etc',
  `VOUCHER_NO` bigint(14) DEFAULT NULL COMMENT 'Primary Key of ac_vouchermst table',
  `VOUCHER_CNO` bigint(14) DEFAULT NULL COMMENT 'Primary Key of ac_voucherchd table',
  `PROD_CODE` varchar(250) DEFAULT NULL COMMENT 'Primary Key of sa_product',
  `CR_AMT` double DEFAULT NULL COMMENT 'This product Credit Amount',
  `DR_AMT` double DEFAULT NULL COMMENT 'Total Devit Amount',
  `ACTIVE_STATUS` tinyint(1) DEFAULT '1' COMMENT 'It keeps boolean value representing Active/Inactive. e.g. 1 = Active, 0 = Inactive',
  `CRE_BY` int(10) UNSIGNED DEFAULT NULL,
  `CRE_DT` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `UPD_BY` int(10) UNSIGNED DEFAULT NULL,
  `UPD_DT` datetime DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `ac_voucherchd`
--

CREATE TABLE `ac_voucherchd` (
  `VOUCHER_CNO` bigint(14) NOT NULL DEFAULT '0' COMMENT 'Primary Key',
  `VOUCHER_CDT` date DEFAULT NULL COMMENT 'Voucher Child Create Date',
  `VOUCHER_NO` bigint(14) DEFAULT NULL COMMENT 'Voucher Number Primary Key of ac_vouchermst',
  `CUST_ID` varchar(250) NOT NULL COMMENT 'Customer ID From customer_info',
  `PROD_CODE` varchar(250) DEFAULT NULL COMMENT 'Primary Key of sa_product',
  `QUANTITY` int(10) DEFAULT NULL COMMENT 'This Product Quantity',
  `SELL_PRICE` int(10) DEFAULT NULL COMMENT 'This Product unit of selling price',
  `TOTAL_AMT` int(10) NOT NULL COMMENT 'This Product total selling amount',
  `ACTIVE_STATUS` tinyint(1) DEFAULT '1' COMMENT 'It keeps boolean value representing Active/Inactive. e.g. 1 = Active, 0 = Inactive',
  `CRE_BY` int(10) UNSIGNED DEFAULT NULL,
  `CRE_DT` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `UPD_BY` int(10) UNSIGNED DEFAULT NULL,
  `UPD_DT` datetime DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `ac_vouchermst`
--

CREATE TABLE `ac_vouchermst` (
  `VOUCHER_NO` bigint(14) NOT NULL DEFAULT '0' COMMENT 'Primary Key',
  `VOUCHER_DT` date NOT NULL COMMENT 'Voucher Create Date',
  `CUST_ID` varchar(250) NOT NULL COMMENT 'Customer ID From customer_info',
  `TOTAL_AMT` int(10) NOT NULL COMMENT 'Total Voucher amount',
  `ACTIVE_STATUS` tinyint(1) DEFAULT '1' COMMENT 'It keeps boolean value representing Active/Inactive. e.g. 1 = Active, 0 = Inactive',
  `CRE_BY` int(10) UNSIGNED DEFAULT NULL,
  `CRE_DT` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `UPD_BY` int(10) UNSIGNED DEFAULT NULL,
  `UPD_DT` datetime DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `customer_info`
--

CREATE TABLE `customer_info` (
  `CUST_ID` bigint(20) NOT NULL COMMENT 'Primary Key',
  `CUST_NAME` varchar(250) NOT NULL COMMENT 'Full Name of Customer',
  `MOBILE_NO` bigint(20) NOT NULL COMMENT 'Customer Mobile Number',
  `EMAIL` varchar(100) DEFAULT NULL COMMENT 'Customer Email',
  `ADDRESS` varchar(300) DEFAULT NULL COMMENT 'Customer Full Address',
  `IMAGE` varchar(100) DEFAULT NULL COMMENT 'Customer Image',
  `ACTIVE_STATUS` tinyint(1) DEFAULT '1' COMMENT 'It keeps boolean value representing Active/Inactive. e.g. 1 = Active, 0 = Inactive',
  `CRE_BY` int(10) UNSIGNED DEFAULT NULL,
  `CRE_DT` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `UPD_BY` int(10) UNSIGNED DEFAULT NULL,
  `UPD_DT` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `invoice_chd`
--

CREATE TABLE `invoice_chd` (
  `INVOICE_ID` bigint(20) NOT NULL COMMENT 'Primary Key',
  `ORDER_NO` varchar(250) NOT NULL COMMENT 'Customer Order Number From invoice_mst',
  `CUST_CODE` varchar(250) NOT NULL COMMENT 'Customer Code From sa_customer',
  `PROD_CODE` varchar(250) NOT NULL COMMENT 'Product Cood From sa_product',
  `QUANTITY` int(10) NOT NULL COMMENT 'Total Product Quantity you sell',
  `SELL_PRICE` int(10) NOT NULL COMMENT 'Product selling price',
  `TOTAL_AMT` int(10) NOT NULL COMMENT 'Product total Selling price == QUANTITY * SELL_PRICE',
  `ACTIVE_STATUS` tinyint(1) DEFAULT '1' COMMENT 'It keeps boolean value representing Active/Inactive. e.g. 1 = Active, 0 = Inactive',
  `CRE_BY` int(10) UNSIGNED DEFAULT NULL,
  `CRE_DT` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `UPD_BY` int(10) UNSIGNED DEFAULT NULL,
  `UPD_DT` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `invoice_mst`
--

CREATE TABLE `invoice_mst` (
  `INVOICE_ID` bigint(20) NOT NULL COMMENT 'Primary Key',
  `ORDER_NO` varchar(250) NOT NULL COMMENT 'Customer Order Number',
  `ORDER_DATE` date NOT NULL COMMENT 'Order Date',
  `CUST_CODE` varchar(250) NOT NULL COMMENT 'Customer Code From sa_customer',
  `TOTAL_AMT` int(10) NOT NULL COMMENT 'Total Amount of Order',
  `ACTIVE_STATUS` tinyint(1) DEFAULT '1' COMMENT 'It keeps boolean value representing Active/Inactive. e.g. 1 = Active, 0 = Inactive',
  `CRE_BY` int(10) UNSIGNED DEFAULT NULL,
  `CRE_DT` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `UPD_BY` int(10) UNSIGNED DEFAULT NULL,
  `UPD_DT` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `receive_chd`
--

CREATE TABLE `receive_chd` (
  `RECEIVE_ID` bigint(20) NOT NULL COMMENT 'Primary Key',
  `GRN_NO` varchar(250) NOT NULL COMMENT 'Good Receive Number From receive_mst',
  `PROD_CODE` varchar(250) NOT NULL COMMENT 'Product Cood From sa_product',
  `QUANTITY` int(10) NOT NULL COMMENT 'Total Product Quantity you Receive',
  `UNIT_PRICE` int(10) NOT NULL COMMENT 'Receive Product unit price',
  `TOTAL_AMT` int(10) NOT NULL COMMENT 'Receive Product total price == QUANTITY * UNIT_PRICE',
  `BATCH_NO` varchar(30) DEFAULT NULL COMMENT 'This Product Batch No',
  `ACTIVE_STATUS` tinyint(1) DEFAULT '1' COMMENT 'It keeps boolean value representing Active/Inactive. e.g. 1 = Active, 0 = Inactive',
  `CRE_BY` int(10) UNSIGNED DEFAULT NULL,
  `CRE_DT` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `UPD_BY` int(10) UNSIGNED DEFAULT NULL,
  `UPD_DT` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `receive_mst`
--

CREATE TABLE `receive_mst` (
  `RECEIVE_ID` bigint(20) NOT NULL COMMENT 'Primary Key',
  `GRN_NO` varchar(250) NOT NULL COMMENT 'Good Receive Number',
  `GRN_DATE` date NOT NULL COMMENT 'Good Receive Date',
  `SUPP_CODE` varchar(250) NOT NULL COMMENT 'Good Receive Supplier Code From suplier_info',
  `TOTAL_AMT` bigint(20) NOT NULL COMMENT 'Total Good Receive Amount',
  `ACTIVE_STATUS` tinyint(1) DEFAULT '1' COMMENT 'It keeps boolean value representing Active/Inactive. e.g. 1 = Active, 0 = Inactive',
  `CRE_BY` int(10) UNSIGNED DEFAULT NULL,
  `CRE_DT` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `UPD_BY` int(10) UNSIGNED DEFAULT NULL,
  `UPD_DT` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `sa_category`
--

CREATE TABLE `sa_category` (
  `CAT_ID` int(10) NOT NULL COMMENT 'Primary Key',
  `CAT_NAME` varchar(250) NOT NULL COMMENT 'Full Name of Product Category',
  `ACTIVE_STATUS` tinyint(1) DEFAULT '1' COMMENT 'It keeps boolean value representing Active/Inactive. e.g. 1 = Active, 0 = Inactive',
  `CRE_BY` int(10) UNSIGNED DEFAULT NULL,
  `CRE_DT` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `UPD_BY` int(10) UNSIGNED DEFAULT NULL,
  `UPD_DT` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `sa_product`
--

CREATE TABLE `sa_product` (
  `PROD_ID` bigint(20) NOT NULL COMMENT 'Primary Key',
  `PROD_CODE` varchar(20) NOT NULL COMMENT 'product unique Code',
  `PROD_NAME` varchar(200) NOT NULL COMMENT 'Full Name of Product',
  `CAT_ID` int(10) DEFAULT NULL COMMENT 'Primary Key of product category table',
  `SUBCAT_ID` int(10) DEFAULT NULL COMMENT 'Primary Key of product Sub category table',
  `IMAGE` varchar(100) DEFAULT NULL COMMENT 'Product Image',
  `PRICE` int(11) NOT NULL COMMENT 'Customer Selling Price',
  `ACTIVE_STATUS` tinyint(1) DEFAULT '1' COMMENT 'It keeps boolean value representing Active/Inactive. e.g. 1 = Active, 0 = Inactive',
  `CRE_BY` int(10) UNSIGNED DEFAULT NULL,
  `CRE_DT` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `UPD_BY` int(10) UNSIGNED DEFAULT NULL,
  `UPD_DT` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `sa_sub_category`
--

CREATE TABLE `sa_sub_category` (
  `SUBCAT_ID` int(10) NOT NULL COMMENT 'Primary Key',
  `CAT_ID` int(10) NOT NULL COMMENT 'Primary Key of sa_category',
  `SUBCAT_NAME` varchar(250) NOT NULL COMMENT 'Full Name of Product Sub Category',
  `ACTIVE_STATUS` tinyint(1) DEFAULT '1' COMMENT 'It keeps boolean value representing Active/Inactive. e.g. 1 = Active, 0 = Inactive',
  `CRE_BY` int(10) UNSIGNED DEFAULT NULL,
  `CRE_DT` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `UPD_BY` int(10) UNSIGNED DEFAULT NULL,
  `UPD_DT` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `sa_users`
--

CREATE TABLE `sa_users` (
  `USER_ID` bigint(20) NOT NULL,
  `USER_TYPE` varchar(10) NOT NULL COMMENT 'E.G. N = Internal User, C = Citizen',
  `FULL_NAME` varchar(100) NOT NULL COMMENT 'Full Name',
  `USERNAME` varchar(60) NOT NULL COMMENT 'Username for Login',
  `PASSWORD` varchar(100) NOT NULL COMMENT 'Password for Login',
  `GENDER` varchar(10) NOT NULL COMMENT 'Gender of User',
  `EMAIL` varchar(100) DEFAULT NULL COMMENT 'Email ID for Login',
  `MOBILE_NO` varchar(15) NOT NULL COMMENT 'User mobile no for Login or notification purpose',
  `IMAGE` varchar(100) DEFAULT NULL COMMENT 'User image',
  `ACTIVE_STATUS` tinyint(1) DEFAULT '1' COMMENT 'It keeps boolean value representing Active/Inactive. e.g. 1 = Active, 0 = Inactive',
  `CRE_BY` int(10) UNSIGNED DEFAULT NULL,
  `CRE_DT` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `UPD_BY` int(10) UNSIGNED DEFAULT NULL,
  `UPD_DT` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `stock`
--

CREATE TABLE `stock` (
  `STOCK_ID` bigint(20) NOT NULL COMMENT 'Primary Key',
  `PROD_CODE` varchar(250) NOT NULL COMMENT 'Product Cood From sa_product',
  `TRANSACTION_DATE` date NOT NULL COMMENT 'Every Stock Transaction Date',
  `OPENING_BAL` varchar(250) NOT NULL COMMENT 'Stock Opening Balance of this product',
  `RECEIVE_QTY` int(10) NOT NULL COMMENT 'IN every Receive transaction receive product Quantity',
  `ISSUE_QTY` int(10) NOT NULL COMMENT 'In Every Order issue this product quantity',
  `BATCH_NO` varchar(50) NOT NULL COMMENT 'This Product Batch No when receive this',
  `ACTIVE_STATUS` tinyint(1) DEFAULT '1' COMMENT 'It keeps boolean value representing Active/Inactive. e.g. 1 = Active, 0 = Inactive',
  `CRE_BY` int(10) UNSIGNED DEFAULT NULL,
  `CRE_DT` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `UPD_BY` int(10) UNSIGNED DEFAULT NULL,
  `UPD_DT` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `supplier_info`
--

CREATE TABLE `supplier_info` (
  `SUPP_ID` int(11) NOT NULL COMMENT 'Primary Key',
  `SUPP_CODE` varchar(100) NOT NULL COMMENT 'Supplier Code',
  `SUPP_NAME` varchar(250) NOT NULL COMMENT 'Supplier Full Name',
  `ADDRESS` varchar(300) DEFAULT NULL COMMENT 'Supplier Address',
  `CONTACT_PERSON` varchar(250) DEFAULT NULL COMMENT 'Supplier Contact Person Name',
  `DESIGNATION` varchar(100) DEFAULT NULL COMMENT 'Contact Person Designation',
  `MOBILE` varchar(30) DEFAULT NULL COMMENT 'Contact Person Mobile',
  `EMAIL` varchar(50) DEFAULT NULL COMMENT 'Contact Person Email',
  `ACTIVE_STATUS` tinyint(1) DEFAULT '1' COMMENT 'It keeps boolean value representing Active/Inactive. e.g. 1 = Active, 0 = Inactive',
  `CRE_BY` int(10) UNSIGNED DEFAULT NULL,
  `CRE_DT` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `UPD_BY` int(10) UNSIGNED DEFAULT NULL,
  `UPD_DT` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `ac_ledgers`
--
ALTER TABLE `ac_ledgers`
  ADD PRIMARY KEY (`VLEDGER_NO`);

--
-- Indexes for table `ac_voucherchd`
--
ALTER TABLE `ac_voucherchd`
  ADD PRIMARY KEY (`VOUCHER_CNO`);

--
-- Indexes for table `ac_vouchermst`
--
ALTER TABLE `ac_vouchermst`
  ADD PRIMARY KEY (`VOUCHER_NO`);

--
-- Indexes for table `customer_info`
--
ALTER TABLE `customer_info`
  ADD PRIMARY KEY (`CUST_ID`);

--
-- Indexes for table `invoice_chd`
--
ALTER TABLE `invoice_chd`
  ADD PRIMARY KEY (`INVOICE_ID`);

--
-- Indexes for table `invoice_mst`
--
ALTER TABLE `invoice_mst`
  ADD PRIMARY KEY (`INVOICE_ID`);

--
-- Indexes for table `receive_chd`
--
ALTER TABLE `receive_chd`
  ADD PRIMARY KEY (`RECEIVE_ID`);

--
-- Indexes for table `receive_mst`
--
ALTER TABLE `receive_mst`
  ADD PRIMARY KEY (`RECEIVE_ID`);

--
-- Indexes for table `sa_category`
--
ALTER TABLE `sa_category`
  ADD PRIMARY KEY (`CAT_ID`);

--
-- Indexes for table `sa_product`
--
ALTER TABLE `sa_product`
  ADD PRIMARY KEY (`PROD_ID`);

--
-- Indexes for table `sa_sub_category`
--
ALTER TABLE `sa_sub_category`
  ADD PRIMARY KEY (`SUBCAT_ID`);

--
-- Indexes for table `sa_users`
--
ALTER TABLE `sa_users`
  ADD PRIMARY KEY (`USER_ID`);

--
-- Indexes for table `stock`
--
ALTER TABLE `stock`
  ADD PRIMARY KEY (`STOCK_ID`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `customer_info`
--
ALTER TABLE `customer_info`
  MODIFY `CUST_ID` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'Primary Key';
--
-- AUTO_INCREMENT for table `invoice_chd`
--
ALTER TABLE `invoice_chd`
  MODIFY `INVOICE_ID` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'Primary Key';
--
-- AUTO_INCREMENT for table `invoice_mst`
--
ALTER TABLE `invoice_mst`
  MODIFY `INVOICE_ID` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'Primary Key';
--
-- AUTO_INCREMENT for table `receive_chd`
--
ALTER TABLE `receive_chd`
  MODIFY `RECEIVE_ID` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'Primary Key';
--
-- AUTO_INCREMENT for table `receive_mst`
--
ALTER TABLE `receive_mst`
  MODIFY `RECEIVE_ID` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'Primary Key';
--
-- AUTO_INCREMENT for table `sa_category`
--
ALTER TABLE `sa_category`
  MODIFY `CAT_ID` int(10) NOT NULL AUTO_INCREMENT COMMENT 'Primary Key';
--
-- AUTO_INCREMENT for table `sa_product`
--
ALTER TABLE `sa_product`
  MODIFY `PROD_ID` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'Primary Key';
--
-- AUTO_INCREMENT for table `sa_sub_category`
--
ALTER TABLE `sa_sub_category`
  MODIFY `SUBCAT_ID` int(10) NOT NULL AUTO_INCREMENT COMMENT 'Primary Key';
--
-- AUTO_INCREMENT for table `sa_users`
--
ALTER TABLE `sa_users`
  MODIFY `USER_ID` bigint(20) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `stock`
--
ALTER TABLE `stock`
  MODIFY `STOCK_ID` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'Primary Key';
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
