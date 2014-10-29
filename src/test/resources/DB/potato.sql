-- MySQL dump 10.13  Distrib 5.6.21, for Win64 (x86_64)
--
-- Host: localhost    Database: potato
-- ------------------------------------------------------
-- Server version	5.6.21-log

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `attributes`
--

DROP TABLE IF EXISTS `attributes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `attributes` (
  `AttributeID` int(11) NOT NULL AUTO_INCREMENT,
  `AttributeName` varchar(45) NOT NULL,
  `AttrbiuteType` varchar(45) NOT NULL,
  `AttributeValueRegex` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`AttributeID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `attributes`
--

LOCK TABLES `attributes` WRITE;
/*!40000 ALTER TABLE `attributes` DISABLE KEYS */;
/*!40000 ALTER TABLE `attributes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `carts`
--

DROP TABLE IF EXISTS `carts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `carts` (
  `CartID` int(11) NOT NULL,
  `CustomerID` int(11) NOT NULL,
  `OrderNumber` int(11) NOT NULL,
  `PaymentID` int(11) NOT NULL,
  `PaymentDate` datetime DEFAULT NULL,
  `ShipperID` int(11) DEFAULT NULL,
  `OrderDate` datetime DEFAULT NULL,
  `OrderStatusID` int(11) DEFAULT NULL,
  PRIMARY KEY (`CartID`),
  KEY `Order_Custommers_CustommerID_PK_idx` (`CustomerID`),
  KEY `Order_Shippers_ShipperID_PK_idx` (`ShipperID`),
  KEY `Order_OrderStatus_OrderStatusID_FK_idx` (`OrderStatusID`),
  KEY `Order_Payment_PaymentID_FK_idx` (`PaymentID`),
  CONSTRAINT `Order_Custommers_CustommerID_FK` FOREIGN KEY (`CustomerID`) REFERENCES `custommers` (`CustomerID`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `Order_OrderStatus_OrderStatusID_FK` FOREIGN KEY (`OrderStatusID`) REFERENCES `orderstatus` (`OrderStatusID`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `Order_Payment_PaymentID_FK` FOREIGN KEY (`PaymentID`) REFERENCES `payment` (`PaymentID`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `Order_Shippers_ShipperID_FK` FOREIGN KEY (`ShipperID`) REFERENCES `shippers` (`ShipperID`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `carts`
--

LOCK TABLES `carts` WRITE;
/*!40000 ALTER TABLE `carts` DISABLE KEYS */;
/*!40000 ALTER TABLE `carts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `category`
--

DROP TABLE IF EXISTS `category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `category` (
  `CategoryID` int(11) NOT NULL AUTO_INCREMENT,
  `CategoryName` varchar(50) NOT NULL,
  `Description` text,
  `ActiveFlg` tinyint(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`CategoryID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `category`
--

LOCK TABLES `category` WRITE;
/*!40000 ALTER TABLE `category` DISABLE KEYS */;
/*!40000 ALTER TABLE `category` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `custommers`
--

DROP TABLE IF EXISTS `custommers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `custommers` (
  `CustomerID` int(11) NOT NULL AUTO_INCREMENT,
  `Password` varchar(100) NOT NULL,
  `LastName` varchar(45) NOT NULL,
  `FirstName` varchar(50) DEFAULT NULL,
  `Address` varchar(100) DEFAULT NULL,
  `ShipAddress` varchar(100) DEFAULT NULL,
  `Phone` varchar(50) DEFAULT NULL,
  `Email` varchar(50) DEFAULT NULL,
  `DateEntered` date DEFAULT NULL,
  `Avatar` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`CustomerID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `custommers`
--

LOCK TABLES `custommers` WRITE;
/*!40000 ALTER TABLE `custommers` DISABLE KEYS */;
/*!40000 ALTER TABLE `custommers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `orderdetails`
--

DROP TABLE IF EXISTS `orderdetails`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `orderdetails` (
  `CartID` int(11) NOT NULL,
  `ProductDetailID` int(11) NOT NULL,
  `NumberProduct` int(11) NOT NULL,
  `Price` double NOT NULL,
  `Discount` double DEFAULT NULL,
  PRIMARY KEY (`CartID`,`ProductDetailID`),
  KEY `OrderDetials_Products_ProductID_FK_idx` (`ProductDetailID`),
  CONSTRAINT `OrderDetails_Cart_CartID_FK` FOREIGN KEY (`CartID`) REFERENCES `carts` (`CartID`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `OrderDetials_Products_ProductID_FK` FOREIGN KEY (`ProductDetailID`) REFERENCES `productdetail` (`ProductDetailID`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `orderdetails`
--

LOCK TABLES `orderdetails` WRITE;
/*!40000 ALTER TABLE `orderdetails` DISABLE KEYS */;
/*!40000 ALTER TABLE `orderdetails` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `orderstatus`
--

DROP TABLE IF EXISTS `orderstatus`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `orderstatus` (
  `OrderStatusID` int(11) NOT NULL,
  `StatusName` varchar(50) NOT NULL,
  PRIMARY KEY (`OrderStatusID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `orderstatus`
--

LOCK TABLES `orderstatus` WRITE;
/*!40000 ALTER TABLE `orderstatus` DISABLE KEYS */;
/*!40000 ALTER TABLE `orderstatus` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `payment`
--

DROP TABLE IF EXISTS `payment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `payment` (
  `PaymentID` int(11) NOT NULL AUTO_INCREMENT,
  `PaymentType` varchar(45) NOT NULL,
  `AllowedFlg` tinyint(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`PaymentID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `payment`
--

LOCK TABLES `payment` WRITE;
/*!40000 ALTER TABLE `payment` DISABLE KEYS */;
/*!40000 ALTER TABLE `payment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `product`
--

DROP TABLE IF EXISTS `product`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `product` (
  `ProductId` int(11) NOT NULL AUTO_INCREMENT,
  `SKU` varchar(45) DEFAULT NULL,
  `SupplierID` int(11) NOT NULL,
  `ProductName` varchar(50) DEFAULT NULL,
  `ProductDescription` varchar(50) DEFAULT NULL,
  `CategoryID` int(11) NOT NULL,
  `UnitPrice` double NOT NULL,
  `MSRP` double DEFAULT NULL,
  `Discount` double DEFAULT NULL,
  `UnitWeight` varchar(45) DEFAULT NULL,
  `OnOrderFlg` tinyint(1) DEFAULT NULL,
  `ReorderLevel` int(11) DEFAULT NULL,
  `NumberViews` int(11) DEFAULT NULL,
  `Notes` text,
  PRIMARY KEY (`ProductId`),
  KEY `Product_Supplier_SupplierID_PK_idx` (`SupplierID`),
  KEY `Product_Category_CategoryID_PK_idx` (`CategoryID`),
  CONSTRAINT `Product_Category_CategoryID_PK` FOREIGN KEY (`CategoryID`) REFERENCES `category` (`CategoryID`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `Product_Supplier_SupplierID_PK` FOREIGN KEY (`SupplierID`) REFERENCES `suppliers` (`SupplierID`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product`
--

LOCK TABLES `product` WRITE;
/*!40000 ALTER TABLE `product` DISABLE KEYS */;
/*!40000 ALTER TABLE `product` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `productdetail`
--

DROP TABLE IF EXISTS `productdetail`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `productdetail` (
  `ProductDetailID` int(11) NOT NULL AUTO_INCREMENT,
  `ProductID` int(11) NOT NULL,
  `AttrbiuteID` int(11) NOT NULL,
  `AttrbiuteValue` varchar(45) NOT NULL,
  `NumberProduct` int(11) NOT NULL,
  PRIMARY KEY (`ProductDetailID`),
  KEY `ProductDetail_Product_ProductID_FL_idx` (`ProductID`),
  KEY `ProductDetail_Attribute_AttributeID_FK_idx` (`AttrbiuteID`),
  CONSTRAINT `ProductDetail_Attribute_AttributeID_FK` FOREIGN KEY (`AttrbiuteID`) REFERENCES `attributes` (`AttributeID`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `ProductDetail_Product_ProductID_FL` FOREIGN KEY (`ProductID`) REFERENCES `product` (`ProductId`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `productdetail`
--

LOCK TABLES `productdetail` WRITE;
/*!40000 ALTER TABLE `productdetail` DISABLE KEYS */;
/*!40000 ALTER TABLE `productdetail` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `shippers`
--

DROP TABLE IF EXISTS `shippers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `shippers` (
  `ShipperID` int(11) NOT NULL AUTO_INCREMENT,
  `CompanyName` varchar(50) NOT NULL,
  `Phone` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`ShipperID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `shippers`
--

LOCK TABLES `shippers` WRITE;
/*!40000 ALTER TABLE `shippers` DISABLE KEYS */;
/*!40000 ALTER TABLE `shippers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `suppliers`
--

DROP TABLE IF EXISTS `suppliers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `suppliers` (
  `SupplierID` int(11) NOT NULL AUTO_INCREMENT,
  `CompanyName` varchar(50) NOT NULL,
  `ContactName` varchar(50) DEFAULT NULL,
  `Address` varchar(150) DEFAULT NULL,
  `Country` varchar(45) DEFAULT NULL,
  `Phone` varchar(20) DEFAULT NULL,
  `Email` varchar(50) DEFAULT NULL,
  `URL` varchar(150) DEFAULT NULL,
  `PaymentMethods` varchar(100) DEFAULT NULL,
  `Notes` text,
  `Logo` varchar(100) DEFAULT NULL,
  `SizeType` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`SupplierID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Table Suppliers';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `suppliers`
--

LOCK TABLES `suppliers` WRITE;
/*!40000 ALTER TABLE `suppliers` DISABLE KEYS */;
/*!40000 ALTER TABLE `suppliers` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2014-10-27  6:44:56
