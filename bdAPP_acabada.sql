CREATE DATABASE  IF NOT EXISTS `mydb` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `mydb`;
-- MySQL dump 10.13  Distrib 8.0.25, for Win64 (x86_64)
--
-- Host: localhost    Database: mydb
-- ------------------------------------------------------
-- Server version	8.0.25

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `cliente`
--

DROP TABLE IF EXISTS `cliente`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cliente` (
  `id_cliente` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(100) NOT NULL,
  `email` varchar(100) DEFAULT NULL,
  `telefono` varchar(20) DEFAULT NULL,
  `calle` varchar(150) DEFAULT NULL,
  `poblacion` varchar(100) DEFAULT NULL,
  `cp` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`id_cliente`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cliente`
--

LOCK TABLES `cliente` WRITE;
/*!40000 ALTER TABLE `cliente` DISABLE KEYS */;
INSERT INTO `cliente` VALUES (1,'Cliente1','cliente1@mail.com','660393336','Calle 1','Valencia','44249'),(2,'Cliente2','cliente2@mail.com','619560379','Calle 2','Valencia','16336'),(3,'Cliente3','cliente3@mail.com','696798112','Calle 3','Valencia','49249'),(4,'Cliente4','cliente4@mail.com','686701376','Calle 4','Valencia','32883'),(5,'Cliente5','cliente5@mail.com','638935109','Calle 5','Valencia','33331'),(6,'Cliente6','cliente6@mail.com','696765400','Calle 6','Valencia','35030'),(7,'Cliente7','cliente7@mail.com','632244400','Calle 7','Valencia','11955'),(8,'Cliente8','cliente8@mail.com','661008548','Calle 8','Valencia','27889'),(9,'Cliente9','cliente9@mail.com','604460178','Calle 9','Valencia','47801'),(10,'Cliente10','cliente10@mail.com','615799699','Calle 10','Valencia','33273'),(11,'Cliente11','cliente11@mail.com','697415005','Calle 11','Valencia','10395'),(12,'Cliente12','cliente12@mail.com','602796603','Calle 12','Valencia','52462'),(13,'Cliente13','cliente13@mail.com','612519807','Calle 13','Valencia','18483'),(14,'Cliente14','cliente14@mail.com','607697704','Calle 14','Valencia','11716'),(15,'Cliente15','cliente15@mail.com','605114153','Calle 15','Valencia','14322'),(16,'Cliente16','cliente16@mail.com','673385189','Calle 16','Valencia','13704'),(17,'Cliente17','cliente17@mail.com','694510933','Calle 17','Valencia','39154'),(18,'Cliente18','cliente18@mail.com','613948899','Calle 18','Valencia','24689'),(19,'Cliente19','cliente19@mail.com','675683530','Calle 19','Valencia','17098'),(20,'Cliente20','cliente20@mail.com','692022825','Calle 20','Valencia','41669');
/*!40000 ALTER TABLE `cliente` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `compra`
--

DROP TABLE IF EXISTS `compra`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `compra` (
  `id_compra` int NOT NULL AUTO_INCREMENT,
  `fecha` date NOT NULL,
  `forma_pago` varchar(50) DEFAULT NULL,
  `subtotal` decimal(10,2) DEFAULT NULL,
  `iva` decimal(10,2) DEFAULT NULL,
  `total` decimal(10,2) DEFAULT NULL,
  `id_cliente` int DEFAULT NULL,
  PRIMARY KEY (`id_compra`),
  KEY `fk_compra_cliente` (`id_cliente`),
  CONSTRAINT `fk_compra_cliente` FOREIGN KEY (`id_cliente`) REFERENCES `cliente` (`id_cliente`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `compra`
--

LOCK TABLES `compra` WRITE;
/*!40000 ALTER TABLE `compra` DISABLE KEYS */;
/*!40000 ALTER TABLE `compra` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `detalle_compra`
--

DROP TABLE IF EXISTS `detalle_compra`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `detalle_compra` (
  `id_compra` int NOT NULL,
  `id_producto` int NOT NULL,
  `cantidad` int NOT NULL,
  `precio_unitario` decimal(10,2) NOT NULL,
  PRIMARY KEY (`id_compra`,`id_producto`),
  KEY `fk_dc_producto` (`id_producto`),
  CONSTRAINT `fk_dc_compra` FOREIGN KEY (`id_compra`) REFERENCES `compra` (`id_compra`),
  CONSTRAINT `fk_dc_producto` FOREIGN KEY (`id_producto`) REFERENCES `producto` (`id_producto`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `detalle_compra`
--

LOCK TABLES `detalle_compra` WRITE;
/*!40000 ALTER TABLE `detalle_compra` DISABLE KEYS */;
/*!40000 ALTER TABLE `detalle_compra` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `detalle_factura_reparacion`
--

DROP TABLE IF EXISTS `detalle_factura_reparacion`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `detalle_factura_reparacion` (
  `id_detalle` int NOT NULL AUTO_INCREMENT,
  `id_factura_rep` int DEFAULT NULL,
  `concepto` varchar(200) DEFAULT NULL,
  `importe` decimal(10,2) DEFAULT NULL,
  PRIMARY KEY (`id_detalle`),
  KEY `fk_dfr_factura` (`id_factura_rep`),
  CONSTRAINT `fk_dfr_factura` FOREIGN KEY (`id_factura_rep`) REFERENCES `factura_reparacion` (`id_factura_rep`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `detalle_factura_reparacion`
--

LOCK TABLES `detalle_factura_reparacion` WRITE;
/*!40000 ALTER TABLE `detalle_factura_reparacion` DISABLE KEYS */;
/*!40000 ALTER TABLE `detalle_factura_reparacion` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `especialidad`
--

DROP TABLE IF EXISTS `especialidad`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `especialidad` (
  `id_especialidad` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(100) NOT NULL,
  `descripcion` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`id_especialidad`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `especialidad`
--

LOCK TABLES `especialidad` WRITE;
/*!40000 ALTER TABLE `especialidad` DISABLE KEYS */;
INSERT INTO `especialidad` VALUES (1,'Especialidad1','Area tecnica 1'),(2,'Especialidad2','Area tecnica 2'),(3,'Especialidad3','Area tecnica 3'),(4,'Especialidad4','Area tecnica 4'),(5,'Especialidad5','Area tecnica 5'),(6,'Especialidad6','Area tecnica 6'),(7,'Especialidad7','Area tecnica 7'),(8,'Especialidad8','Area tecnica 8'),(9,'Especialidad9','Area tecnica 9'),(10,'Especialidad10','Area tecnica 10'),(11,'Especialidad11','Area tecnica 11'),(12,'Especialidad12','Area tecnica 12'),(13,'Especialidad13','Area tecnica 13'),(14,'Especialidad14','Area tecnica 14'),(15,'Especialidad15','Area tecnica 15'),(16,'Especialidad16','Area tecnica 16'),(17,'Especialidad17','Area tecnica 17'),(18,'Especialidad18','Area tecnica 18'),(19,'Especialidad19','Area tecnica 19'),(20,'Especialidad20','Area tecnica 20');
/*!40000 ALTER TABLE `especialidad` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `estado_reparacion`
--

DROP TABLE IF EXISTS `estado_reparacion`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `estado_reparacion` (
  `id_estado` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(50) NOT NULL,
  PRIMARY KEY (`id_estado`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `estado_reparacion`
--

LOCK TABLES `estado_reparacion` WRITE;
/*!40000 ALTER TABLE `estado_reparacion` DISABLE KEYS */;
/*!40000 ALTER TABLE `estado_reparacion` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `factura_reparacion`
--

DROP TABLE IF EXISTS `factura_reparacion`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `factura_reparacion` (
  `id_factura_rep` int NOT NULL AUTO_INCREMENT,
  `fecha` date NOT NULL,
  `subtotal` decimal(10,2) DEFAULT NULL,
  `iva` decimal(10,2) DEFAULT NULL,
  `total` decimal(10,2) DEFAULT NULL,
  `id_reparacion` int DEFAULT NULL,
  PRIMARY KEY (`id_factura_rep`),
  UNIQUE KEY `id_reparacion` (`id_reparacion`),
  CONSTRAINT `fk_fr_reparacion` FOREIGN KEY (`id_reparacion`) REFERENCES `reparacion` (`id_reparacion`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `factura_reparacion`
--

LOCK TABLES `factura_reparacion` WRITE;
/*!40000 ALTER TABLE `factura_reparacion` DISABLE KEYS */;
/*!40000 ALTER TABLE `factura_reparacion` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `marca`
--

DROP TABLE IF EXISTS `marca`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `marca` (
  `id_marca` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(100) NOT NULL,
  PRIMARY KEY (`id_marca`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `marca`
--

LOCK TABLES `marca` WRITE;
/*!40000 ALTER TABLE `marca` DISABLE KEYS */;
INSERT INTO `marca` VALUES (1,'Marca1'),(2,'Marca2'),(3,'Marca3'),(4,'Marca4'),(5,'Marca5'),(6,'Marca6'),(7,'Marca7'),(8,'Marca8'),(9,'Marca9'),(10,'Marca10'),(11,'Marca11'),(12,'Marca12'),(13,'Marca13'),(14,'Marca14'),(15,'Marca15'),(16,'Marca16'),(17,'Marca17'),(18,'Marca18'),(19,'Marca19'),(20,'Marca20');
/*!40000 ALTER TABLE `marca` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `permiso`
--

DROP TABLE IF EXISTS `permiso`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `permiso` (
  `id_permiso` int NOT NULL AUTO_INCREMENT,
  `nombre_permiso` varchar(100) NOT NULL,
  `descripcion` varchar(200) DEFAULT NULL,
  `categoria` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id_permiso`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `permiso`
--

LOCK TABLES `permiso` WRITE;
/*!40000 ALTER TABLE `permiso` DISABLE KEYS */;
INSERT INTO `permiso` VALUES (1,'permiso1','Permite accion 1','general'),(2,'permiso2','Permite accion 2','general'),(3,'permiso3','Permite accion 3','general'),(4,'permiso4','Permite accion 4','general'),(5,'permiso5','Permite accion 5','general'),(6,'permiso6','Permite accion 6','general'),(7,'permiso7','Permite accion 7','general'),(8,'permiso8','Permite accion 8','general'),(9,'permiso9','Permite accion 9','general'),(10,'permiso10','Permite accion 10','general'),(11,'permiso11','Permite accion 11','general'),(12,'permiso12','Permite accion 12','general'),(13,'permiso13','Permite accion 13','general'),(14,'permiso14','Permite accion 14','general'),(15,'permiso15','Permite accion 15','general'),(16,'permiso16','Permite accion 16','general'),(17,'permiso17','Permite accion 17','general'),(18,'permiso18','Permite accion 18','general'),(19,'permiso19','Permite accion 19','general'),(20,'permiso20','Permite accion 20','general');
/*!40000 ALTER TABLE `permiso` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `producto`
--

DROP TABLE IF EXISTS `producto`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `producto` (
  `id_producto` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(100) NOT NULL,
  `precio` decimal(10,2) DEFAULT NULL,
  `stock` int DEFAULT NULL,
  `descripcion` varchar(300) DEFAULT NULL,
  `garantia` varchar(100) DEFAULT NULL,
  `id_marca` int DEFAULT NULL,
  `id_tipo_producto` int DEFAULT NULL,
  PRIMARY KEY (`id_producto`),
  KEY `idx_producto_marca` (`id_marca`),
  KEY `idx_producto_tipo` (`id_tipo_producto`),
  CONSTRAINT `fk_producto_marca` FOREIGN KEY (`id_marca`) REFERENCES `marca` (`id_marca`),
  CONSTRAINT `fk_producto_tipo` FOREIGN KEY (`id_tipo_producto`) REFERENCES `tipo_producto` (`id_tipo_producto`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `producto`
--

LOCK TABLES `producto` WRITE;
/*!40000 ALTER TABLE `producto` DISABLE KEYS */;
INSERT INTO `producto` VALUES (1,'Producto1',411.47,23,'Desc 1','2 años',14,13),(2,'Producto2',151.99,56,'Desc 2','2 años',17,20),(3,'Producto3',163.93,68,'Desc 3','2 años',1,12),(4,'Producto4',173.31,87,'Desc 4','2 años',17,13),(5,'Producto5',71.12,92,'Desc 5','2 años',16,11),(6,'Producto6',190.80,87,'Desc 6','2 años',12,14),(7,'Producto7',265.13,88,'Desc 7','2 años',18,3),(8,'Producto8',384.21,50,'Desc 8','2 años',20,2),(9,'Producto9',289.11,6,'Desc 9','2 años',20,13),(10,'Producto10',140.98,7,'Desc 10','2 años',6,17),(11,'Producto11',233.95,53,'Desc 11','2 años',14,3),(12,'Producto12',16.97,54,'Desc 12','2 años',9,13),(13,'Producto13',133.83,60,'Desc 13','2 años',4,20),(14,'Producto14',166.32,11,'Desc 14','2 años',13,15),(15,'Producto15',387.03,99,'Desc 15','2 años',13,5),(16,'Producto16',472.00,11,'Desc 16','2 años',3,9),(17,'Producto17',78.63,61,'Desc 17','2 años',11,6),(18,'Producto18',207.18,25,'Desc 18','2 años',12,6),(19,'Producto19',475.75,34,'Desc 19','2 años',16,3),(20,'Producto20',318.31,78,'Desc 20','2 años',15,2);
/*!40000 ALTER TABLE `producto` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `producto_reparacion`
--

DROP TABLE IF EXISTS `producto_reparacion`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `producto_reparacion` (
  `id_producto` int NOT NULL,
  `id_reparacion` int NOT NULL,
  `cantidad` int DEFAULT NULL,
  PRIMARY KEY (`id_producto`,`id_reparacion`),
  KEY `fk_pr_reparacion` (`id_reparacion`),
  CONSTRAINT `fk_pr_producto` FOREIGN KEY (`id_producto`) REFERENCES `producto` (`id_producto`),
  CONSTRAINT `fk_pr_reparacion` FOREIGN KEY (`id_reparacion`) REFERENCES `reparacion` (`id_reparacion`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `producto_reparacion`
--

LOCK TABLES `producto_reparacion` WRITE;
/*!40000 ALTER TABLE `producto_reparacion` DISABLE KEYS */;
/*!40000 ALTER TABLE `producto_reparacion` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `proveedor`
--

DROP TABLE IF EXISTS `proveedor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `proveedor` (
  `id_proveedor` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(100) NOT NULL,
  `email` varchar(100) DEFAULT NULL,
  `telefono` varchar(20) DEFAULT NULL,
  `calle` varchar(150) DEFAULT NULL,
  `poblacion` varchar(100) DEFAULT NULL,
  `cp` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`id_proveedor`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `proveedor`
--

LOCK TABLES `proveedor` WRITE;
/*!40000 ALTER TABLE `proveedor` DISABLE KEYS */;
INSERT INTO `proveedor` VALUES (1,'Proveedor1','prov1@mail.com','648561411','Calle Prov1','Valencia','17241'),(2,'Proveedor2','prov2@mail.com','647043875','Calle Prov2','Valencia','16353'),(3,'Proveedor3','prov3@mail.com','631961316','Calle Prov3','Valencia','37850'),(4,'Proveedor4','prov4@mail.com','637092026','Calle Prov4','Valencia','23102'),(5,'Proveedor5','prov5@mail.com','652103399','Calle Prov5','Valencia','36396'),(6,'Proveedor6','prov6@mail.com','637703239','Calle Prov6','Valencia','45638'),(7,'Proveedor7','prov7@mail.com','643811759','Calle Prov7','Valencia','33192'),(8,'Proveedor8','prov8@mail.com','633035805','Calle Prov8','Valencia','34766'),(9,'Proveedor9','prov9@mail.com','663092976','Calle Prov9','Valencia','21168'),(10,'Proveedor10','prov10@mail.com','696811281','Calle Prov10','Valencia','33777'),(11,'Proveedor11','prov11@mail.com','604362307','Calle Prov11','Valencia','17111'),(12,'Proveedor12','prov12@mail.com','620921086','Calle Prov12','Valencia','38756'),(13,'Proveedor13','prov13@mail.com','604338942','Calle Prov13','Valencia','36465'),(14,'Proveedor14','prov14@mail.com','665961871','Calle Prov14','Valencia','27810'),(15,'Proveedor15','prov15@mail.com','624329134','Calle Prov15','Valencia','32415'),(16,'Proveedor16','prov16@mail.com','640971373','Calle Prov16','Valencia','22590'),(17,'Proveedor17','prov17@mail.com','697795163','Calle Prov17','Valencia','22987'),(18,'Proveedor18','prov18@mail.com','655538828','Calle Prov18','Valencia','43507'),(19,'Proveedor19','prov19@mail.com','682913028','Calle Prov19','Valencia','18369'),(20,'Proveedor20','prov20@mail.com','609735246','Calle Prov20','Valencia','49375');
/*!40000 ALTER TABLE `proveedor` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `reparacion`
--

DROP TABLE IF EXISTS `reparacion`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `reparacion` (
  `id_reparacion` int NOT NULL AUTO_INCREMENT,
  `fecha_entrada` date NOT NULL,
  `fecha_salida` date DEFAULT NULL,
  `descripcion_problema` varchar(300) DEFAULT NULL,
  `descripcion_solucion` varchar(300) DEFAULT NULL,
  `horas_reparacion` decimal(5,2) DEFAULT NULL,
  `id_estado` int DEFAULT NULL,
  `id_cliente` int DEFAULT NULL,
  PRIMARY KEY (`id_reparacion`),
  KEY `fk_rep_estado` (`id_estado`),
  KEY `fk_rep_cliente` (`id_cliente`),
  CONSTRAINT `fk_rep_cliente` FOREIGN KEY (`id_cliente`) REFERENCES `cliente` (`id_cliente`),
  CONSTRAINT `fk_rep_estado` FOREIGN KEY (`id_estado`) REFERENCES `estado_reparacion` (`id_estado`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `reparacion`
--

LOCK TABLES `reparacion` WRITE;
/*!40000 ALTER TABLE `reparacion` DISABLE KEYS */;
/*!40000 ALTER TABLE `reparacion` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `rol`
--

DROP TABLE IF EXISTS `rol`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `rol` (
  `id_rol` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(100) NOT NULL,
  `nivel_acceso` int DEFAULT NULL,
  `activo` tinyint(1) DEFAULT '1',
  PRIMARY KEY (`id_rol`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `rol`
--

LOCK TABLES `rol` WRITE;
/*!40000 ALTER TABLE `rol` DISABLE KEYS */;
INSERT INTO `rol` VALUES (1,'Rol1',3,1),(2,'Rol2',1,1),(3,'Rol3',2,1),(4,'Rol4',3,1),(5,'Rol5',5,1),(6,'Rol6',2,1),(7,'Rol7',2,1),(8,'Rol8',5,1),(9,'Rol9',5,1),(10,'Rol10',5,1),(11,'Rol11',5,1),(12,'Rol12',1,1),(13,'Rol13',4,1),(14,'Rol14',3,1),(15,'Rol15',4,1),(16,'Rol16',2,1),(17,'Rol17',4,1),(18,'Rol18',3,1),(19,'Rol19',1,1),(20,'Rol20',5,1);
/*!40000 ALTER TABLE `rol` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `rol_permiso`
--

DROP TABLE IF EXISTS `rol_permiso`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `rol_permiso` (
  `id_rol` int NOT NULL,
  `id_permiso` int NOT NULL,
  PRIMARY KEY (`id_rol`,`id_permiso`),
  KEY `fk_rp_permiso` (`id_permiso`),
  CONSTRAINT `fk_rp_permiso` FOREIGN KEY (`id_permiso`) REFERENCES `permiso` (`id_permiso`),
  CONSTRAINT `fk_rp_rol` FOREIGN KEY (`id_rol`) REFERENCES `rol` (`id_rol`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `rol_permiso`
--

LOCK TABLES `rol_permiso` WRITE;
/*!40000 ALTER TABLE `rol_permiso` DISABLE KEYS */;
INSERT INTO `rol_permiso` VALUES (18,2),(19,2),(3,3),(8,4),(5,5),(15,6),(2,8),(3,9),(10,9),(4,10),(1,11),(4,15),(17,15),(18,15),(4,16),(9,16),(13,18),(7,19),(12,19),(15,19);
/*!40000 ALTER TABLE `rol_permiso` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `rol_usuario`
--

DROP TABLE IF EXISTS `rol_usuario`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `rol_usuario` (
  `id_usuario` int NOT NULL,
  `id_rol` int NOT NULL,
  PRIMARY KEY (`id_usuario`,`id_rol`),
  KEY `fk_ru_rol` (`id_rol`),
  CONSTRAINT `fk_ru_rol` FOREIGN KEY (`id_rol`) REFERENCES `rol` (`id_rol`),
  CONSTRAINT `fk_ru_usuario` FOREIGN KEY (`id_usuario`) REFERENCES `usuario` (`id_usuario`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `rol_usuario`
--

LOCK TABLES `rol_usuario` WRITE;
/*!40000 ALTER TABLE `rol_usuario` DISABLE KEYS */;
INSERT INTO `rol_usuario` VALUES (17,1),(12,3),(2,4),(13,4),(15,6),(1,7),(3,9),(9,9),(20,9),(14,10),(5,11),(8,12),(11,12),(7,13),(19,13),(10,14),(16,15),(6,16),(4,18),(18,20);
/*!40000 ALTER TABLE `rol_usuario` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `suministra`
--

DROP TABLE IF EXISTS `suministra`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `suministra` (
  `id_proveedor` int NOT NULL,
  `id_producto` int NOT NULL,
  PRIMARY KEY (`id_proveedor`,`id_producto`),
  KEY `fk_sum_producto` (`id_producto`),
  CONSTRAINT `fk_sum_producto` FOREIGN KEY (`id_producto`) REFERENCES `producto` (`id_producto`),
  CONSTRAINT `fk_sum_proveedor` FOREIGN KEY (`id_proveedor`) REFERENCES `proveedor` (`id_proveedor`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `suministra`
--

LOCK TABLES `suministra` WRITE;
/*!40000 ALTER TABLE `suministra` DISABLE KEYS */;
INSERT INTO `suministra` VALUES (20,7),(15,15),(8,18);
/*!40000 ALTER TABLE `suministra` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tecnico`
--

DROP TABLE IF EXISTS `tecnico`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tecnico` (
  `id_tecnico` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(100) NOT NULL,
  `apellido` varchar(100) DEFAULT NULL,
  `telefono` varchar(20) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `id_especialidad` int DEFAULT NULL,
  PRIMARY KEY (`id_tecnico`),
  KEY `idx_tecnico_especialidad` (`id_especialidad`),
  CONSTRAINT `fk_tecnico_especialidad` FOREIGN KEY (`id_especialidad`) REFERENCES `especialidad` (`id_especialidad`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tecnico`
--

LOCK TABLES `tecnico` WRITE;
/*!40000 ALTER TABLE `tecnico` DISABLE KEYS */;
INSERT INTO `tecnico` VALUES (1,'Tecnico1','Apellido1','674141006','tecnico1@mail.com',12),(2,'Tecnico2','Apellido2','694180398','tecnico2@mail.com',14),(3,'Tecnico3','Apellido3','658713496','tecnico3@mail.com',14),(4,'Tecnico4','Apellido4','680380227','tecnico4@mail.com',19),(5,'Tecnico5','Apellido5','662558339','tecnico5@mail.com',8),(6,'Tecnico6','Apellido6','656398536','tecnico6@mail.com',7),(7,'Tecnico7','Apellido7','612327325','tecnico7@mail.com',11),(8,'Tecnico8','Apellido8','663723295','tecnico8@mail.com',16),(9,'Tecnico9','Apellido9','667193561','tecnico9@mail.com',6),(10,'Tecnico10','Apellido10','619515729','tecnico10@mail.com',12),(11,'Tecnico11','Apellido11','671339474','tecnico11@mail.com',9),(12,'Tecnico12','Apellido12','684380843','tecnico12@mail.com',10),(13,'Tecnico13','Apellido13','609122422','tecnico13@mail.com',17),(14,'Tecnico14','Apellido14','612831904','tecnico14@mail.com',12),(15,'Tecnico15','Apellido15','642444930','tecnico15@mail.com',9),(16,'Tecnico16','Apellido16','666337581','tecnico16@mail.com',16),(17,'Tecnico17','Apellido17','621011780','tecnico17@mail.com',13),(18,'Tecnico18','Apellido18','667496960','tecnico18@mail.com',17),(19,'Tecnico19','Apellido19','613407411','tecnico19@mail.com',20),(20,'Tecnico20','Apellido20','611102460','tecnico20@mail.com',2);
/*!40000 ALTER TABLE `tecnico` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tecnico_reparacion`
--

DROP TABLE IF EXISTS `tecnico_reparacion`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tecnico_reparacion` (
  `id_tecnico` int NOT NULL,
  `id_reparacion` int NOT NULL,
  PRIMARY KEY (`id_tecnico`,`id_reparacion`),
  KEY `fk_tr_reparacion` (`id_reparacion`),
  CONSTRAINT `fk_tr_reparacion` FOREIGN KEY (`id_reparacion`) REFERENCES `reparacion` (`id_reparacion`),
  CONSTRAINT `fk_tr_tecnico` FOREIGN KEY (`id_tecnico`) REFERENCES `tecnico` (`id_tecnico`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tecnico_reparacion`
--

LOCK TABLES `tecnico_reparacion` WRITE;
/*!40000 ALTER TABLE `tecnico_reparacion` DISABLE KEYS */;
/*!40000 ALTER TABLE `tecnico_reparacion` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tipo_producto`
--

DROP TABLE IF EXISTS `tipo_producto`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tipo_producto` (
  `id_tipo_producto` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(50) NOT NULL,
  PRIMARY KEY (`id_tipo_producto`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tipo_producto`
--

LOCK TABLES `tipo_producto` WRITE;
/*!40000 ALTER TABLE `tipo_producto` DISABLE KEYS */;
INSERT INTO `tipo_producto` VALUES (1,'Tipo1'),(2,'Tipo2'),(3,'Tipo3'),(4,'Tipo4'),(5,'Tipo5'),(6,'Tipo6'),(7,'Tipo7'),(8,'Tipo8'),(9,'Tipo9'),(10,'Tipo10'),(11,'Tipo11'),(12,'Tipo12'),(13,'Tipo13'),(14,'Tipo14'),(15,'Tipo15'),(16,'Tipo16'),(17,'Tipo17'),(18,'Tipo18'),(19,'Tipo19'),(20,'Tipo20');
/*!40000 ALTER TABLE `tipo_producto` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `usuario`
--

DROP TABLE IF EXISTS `usuario`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `usuario` (
  `id_usuario` int NOT NULL AUTO_INCREMENT,
  `email` varchar(100) NOT NULL,
  `contrasena` varchar(200) NOT NULL,
  `activo` tinyint(1) DEFAULT '1',
  `Tecnico_id_tecnico` int DEFAULT NULL,
  `Cliente_id_cliente` int DEFAULT NULL,
  PRIMARY KEY (`id_usuario`),
  UNIQUE KEY `email` (`email`),
  KEY `fk_usuario_tecnico` (`Tecnico_id_tecnico`),
  KEY `fk_usuario_cliente` (`Cliente_id_cliente`),
  CONSTRAINT `fk_usuario_cliente` FOREIGN KEY (`Cliente_id_cliente`) REFERENCES `cliente` (`id_cliente`),
  CONSTRAINT `fk_usuario_tecnico` FOREIGN KEY (`Tecnico_id_tecnico`) REFERENCES `tecnico` (`id_tecnico`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `usuario`
--

LOCK TABLES `usuario` WRITE;
/*!40000 ALTER TABLE `usuario` DISABLE KEYS */;
INSERT INTO `usuario` VALUES (1,'user1@mail.com','1234',1,1,NULL),(2,'user2@mail.com','1234',1,2,NULL),(3,'user3@mail.com','1234',1,3,NULL),(4,'user4@mail.com','1234',1,4,NULL),(5,'user5@mail.com','1234',1,5,NULL),(6,'user6@mail.com','1234',1,6,NULL),(7,'user7@mail.com','1234',1,7,NULL),(8,'user8@mail.com','1234',1,8,NULL),(9,'user9@mail.com','1234',1,9,NULL),(10,'user10@mail.com','1234',1,10,NULL),(11,'user11@mail.com','1234',1,NULL,1),(12,'user12@mail.com','1234',1,NULL,2),(13,'user13@mail.com','1234',1,NULL,3),(14,'user14@mail.com','1234',1,NULL,4),(15,'user15@mail.com','1234',1,NULL,5),(16,'user16@mail.com','1234',1,NULL,6),(17,'user17@mail.com','1234',1,NULL,7),(18,'user18@mail.com','1234',1,NULL,8),(19,'user19@mail.com','1234',1,NULL,9),(20,'user20@mail.com','1234',1,NULL,10);
/*!40000 ALTER TABLE `usuario` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2026-02-12  8:09:10
