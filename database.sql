-- MySQL dump 10.13  Distrib 8.2.0, for macos13 (x86_64)
--
-- Host: localhost    Database: db
-- ------------------------------------------------------
-- Server version	8.2.0

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `Categories`
--

DROP TABLE IF EXISTS `Categories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Categories` (
  `CategoryID` int NOT NULL AUTO_INCREMENT,
  `CategoryName` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`CategoryID`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Categories`
--

LOCK TABLES `Categories` WRITE;
/*!40000 ALTER TABLE `Categories` DISABLE KEYS */;
INSERT INTO `Categories` VALUES (1,'Cake'),(2,'No-Bake'),(3,'Vegetarian');
/*!40000 ALTER TABLE `Categories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Ingredients`
--

DROP TABLE IF EXISTS `Ingredients`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Ingredients` (
  `IngredientID` int NOT NULL AUTO_INCREMENT,
  `IngredientName` varchar(255) DEFAULT NULL,
  `Allergens` text,
  `AverageCost` decimal(10,0) DEFAULT NULL,
  PRIMARY KEY (`IngredientID`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Ingredients`
--

LOCK TABLES `Ingredients` WRITE;
/*!40000 ALTER TABLE `Ingredients` DISABLE KEYS */;
INSERT INTO `Ingredients` VALUES (1,'Condensed milk',NULL,NULL),(2,'Cream Cheese',NULL,NULL),(3,'Lemon Juice',NULL,NULL),(4,'Pie Crust',NULL,NULL),(5,'Cherry Jam',NULL,NULL);
/*!40000 ALTER TABLE `Ingredients` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `RecipeCategory`
--

DROP TABLE IF EXISTS `RecipeCategory`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `RecipeCategory` (
  `RecipeID` int DEFAULT NULL,
  `CategoryID` int DEFAULT NULL,
  KEY `RecipeID` (`RecipeID`),
  KEY `CategoryID` (`CategoryID`),
  CONSTRAINT `recipecategory_ibfk_1` FOREIGN KEY (`RecipeID`) REFERENCES `Recipes` (`RecipeID`),
  CONSTRAINT `recipecategory_ibfk_2` FOREIGN KEY (`CategoryID`) REFERENCES `Categories` (`CategoryID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `RecipeCategory`
--

LOCK TABLES `RecipeCategory` WRITE;
/*!40000 ALTER TABLE `RecipeCategory` DISABLE KEYS */;
/*!40000 ALTER TABLE `RecipeCategory` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `RecipeIngredient`
--

DROP TABLE IF EXISTS `RecipeIngredient`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `RecipeIngredient` (
  `RecipeID` int DEFAULT NULL,
  `IngredientID` int DEFAULT NULL,
  `Quantity` varchar(255) DEFAULT NULL,
  KEY `RecipeID` (`RecipeID`),
  KEY `IngredientID` (`IngredientID`),
  CONSTRAINT `recipeingredient_ibfk_1` FOREIGN KEY (`RecipeID`) REFERENCES `Recipes` (`RecipeID`),
  CONSTRAINT `recipeingredient_ibfk_2` FOREIGN KEY (`IngredientID`) REFERENCES `Ingredients` (`IngredientID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `RecipeIngredient`
--

LOCK TABLES `RecipeIngredient` WRITE;
/*!40000 ALTER TABLE `RecipeIngredient` DISABLE KEYS */;
/*!40000 ALTER TABLE `RecipeIngredient` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Recipes`
--

DROP TABLE IF EXISTS `Recipes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Recipes` (
  `RecipeID` int NOT NULL AUTO_INCREMENT,
  `RecipeName` varchar(255) DEFAULT NULL,
  `Description` text,
  `CookingTime` int DEFAULT NULL,
  `ServingSize` int DEFAULT NULL,
  PRIMARY KEY (`RecipeID`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Recipes`
--

LOCK TABLES `Recipes` WRITE;
/*!40000 ALTER TABLE `Recipes` DISABLE KEYS */;
INSERT INTO `Recipes` VALUES (1,'No-Bake Cheesecake','Delicious and easy to make cheesecake.',180,4),(2,'No-Bake Cheesecake','Delicious and easy to make cheesecake.',180,4);
/*!40000 ALTER TABLE `Recipes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `RecipeStep`
--

DROP TABLE IF EXISTS `RecipeStep`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `RecipeStep` (
  `RecipeID` int DEFAULT NULL,
  `StepID` int DEFAULT NULL,
  `StepOrder` int DEFAULT NULL,
  KEY `RecipeID` (`RecipeID`),
  KEY `StepID` (`StepID`),
  CONSTRAINT `recipestep_ibfk_1` FOREIGN KEY (`RecipeID`) REFERENCES `Recipes` (`RecipeID`),
  CONSTRAINT `recipestep_ibfk_2` FOREIGN KEY (`StepID`) REFERENCES `Steps` (`StepID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `RecipeStep`
--

LOCK TABLES `RecipeStep` WRITE;
/*!40000 ALTER TABLE `RecipeStep` DISABLE KEYS */;
/*!40000 ALTER TABLE `RecipeStep` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Steps`
--

DROP TABLE IF EXISTS `Steps`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Steps` (
  `StepID` int NOT NULL AUTO_INCREMENT,
  `StepDescription` text,
  PRIMARY KEY (`StepID`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Steps`
--

LOCK TABLES `Steps` WRITE;
/*!40000 ALTER TABLE `Steps` DISABLE KEYS */;
INSERT INTO `Steps` VALUES (1,'Beat Cream Cheese'),(2,'Add condensed Milk and blend'),(3,'Add Lemon Juice and blend'),(4,'Add the mix to the pie crust'),(5,'Spread the Cherry Jam'),(6,'Place in refrigerator for 3h');
/*!40000 ALTER TABLE `Steps` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-11-19  4:36:17
