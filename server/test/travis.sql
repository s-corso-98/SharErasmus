CREATE USER 'dev'@'localhost' IDENTIFIED BY 'dev';
GRANT SELECT,INSERT,UPDATE,DELETE,CREATE,DROP ON *.* TO 'dev'@'localhost';
CREATE DATABASE  IF NOT EXISTS `progetto` /*!40100 DEFAULT CHARACTER SET utf8 */;
USE `progetto`;
-- MySQL dump 10.13  Distrib 5.7.17, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: progetto
-- ------------------------------------------------------
-- Server version	5.6.26

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
-- Table structure for table `avviso`
--

DROP TABLE IF EXISTS `avviso`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `avviso` (
  `idAvviso` int(8) NOT NULL AUTO_INCREMENT,
  `data` date NOT NULL,
  `ora` time NOT NULL,
  `emailCoordinatore` varchar(50) NOT NULL,
  `avviso` varchar(300) NOT NULL,
  `documentoPath` varchar(400) DEFAULT NULL,
  PRIMARY KEY (`idAvviso`),
  KEY `Email_Coordinatore` (`emailCoordinatore`),
  CONSTRAINT `avviso_ibfk_1` FOREIGN KEY (`emailCoordinatore`) REFERENCES `coordinatore` (`emailCoordinatore`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `avviso`
--

LOCK TABLES `avviso` WRITE;
/*!40000 ALTER TABLE `avviso` DISABLE KEYS */;
/*!40000 ALTER TABLE `avviso` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `coordinatore`
--

DROP TABLE IF EXISTS `coordinatore`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `coordinatore` (
  `emailCoordinatore` varchar(50) NOT NULL,
  `password` varchar(64) NOT NULL,
  `nome` varchar(100) NOT NULL,
  `cognome` varchar(100) NOT NULL,
  `codiceFiscale` varchar(16) NOT NULL,
  `via` varchar(100) NOT NULL,
  `ruolo` varchar(30) NOT NULL,
  `recapito` varchar(20) NOT NULL,
  `bio` varchar(500) DEFAULT NULL,
  `facolta` varchar(100) NOT NULL,
  `imgProfiloPath` varchar(400) DEFAULT NULL,
  `passToken` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`emailCoordinatore`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `coordinatore`
--

LOCK TABLES `coordinatore` WRITE;
/*!40000 ALTER TABLE `coordinatore` DISABLE KEYS */;
/*
INSERT INTO `coordinatore` VALUES ('fferrucci1@unisa.it', 'ff123456', 'Filomena', 'Ferrucci', 'FFFLMN80R10M082K', 'Via niiiiiiiiiii','prof. ordinario','+39123456789','Professoressa del corso di Ingegneria del Software','Song a meglj','../upload/fferrucci1@unisa.it\\ferrucci1.jpg',NULL);
INSERT INTO `coordinatore` VALUES ('fferrucci5@unisa.it', 'ff123456', 'Filomena', 'Ferrucci', 'FFFLMN80R10M082K', 'Via niiiiiiiiiii','prof. ordinario','+39123456789','Professoressa del corso di Ingegneria del Software','Song a meglj','../upload/fferrucci5@unisa.it\\ferrucci5.jpg',NULL);
INSERT INTO `coordinatore` VALUES ('fferrucci2@unisa.it', 'ff123456', 'Filomena', 'Ferrucci', 'FFFLMN80R10M082K', 'Via niiiiiiiiiii','prof. ordinario','+39123456789','Professoressa del corso di Ingegneria del Software','Song a meglj','../upload/fferrucci2@unisa.it\\ferrucci2.jpg',NULL);
*/
INSERT INTO `coordinatore` VALUES ('fferrucci@unisa.it', 'ciao1234', 'Filomena', 'Ferrucci', 'FFFLMN80R10M082K', 'Via Giovi','Prof. ordinario','+39123456789','Professoressa del corso di Ingegneria del Software','Dipartimento di informatica','../upload/fferrucci@unisa.it\\ferrucci.jpg',NULL);
INSERT INTO `coordinatore` VALUES ('gravino@unisa.it', 'ciao1234', 'Carmine', 'Gravino', 'CRGRVN80R10M082K', 'Via dei Principati','Prof. ordinario','+39123456789','Professore del corso di Ingegneria del Software','Dipartimento di informatica','../upload/gravino@unisa.it\\gravino.jpg',NULL);
/*
INSERT INTO `coordinatore` VALUES ('a.azzurro@unisa.it','alberoazzurro','Albero','Azzurro','SBTVCN98D03H703K','Alberi 12','Ord','1234567890','se','','../server/upload/a.azzurro@unisa.it\\9.jpg',NULL);
*/
INSERT INTO `coordinatore` VALUES ('a.azzurro@unisa.it','alberoazzurro','Albero','Azzurro','SBTVCN98D03H703K','Alberi 12','Ord','1234567890','se','','../server/upload/a.azzurro@unisa.it\\9.jpg',NULL),('fferrucci10@unisa.it','ff123456','Filomena','Ferrucci','FFFLMN80R10M082K','via Giovanni P. II','prof.ordinario','+39123456789',NULL,'Dipartimento di Informatica',NULL,NULL),('fferrucci1@unisa.it','asdfghjk','Filomena','Ferrucci','FFFLMN80R10M082K','via Giovanni P. II','prof. ordinario','+39123456789',NULL,'Dipartimento di Informatica','../upload\\f.jpg','bh7c5ocqapcf3uk4sado'),('fferrucci2@unisa.it','ff123456','Filomena','Ferrucci','FFFLMN80R10M082K','via Giovanni P. II','prof. ordinario','+39123456789','55YVHp','Dipartimento di Informatica','../upload\\f.jpg',NULL),('fferrucci4@unisa.it','ff123456','Filomena','Ferrucci','FFFLMN80R10M082K','via Giovanni P. II','prof. ordinario','+39123456789','XdUYZl','Dipartimento di Informatica','../server/upload\\f.jpg',NULL),('fferrucci5@unisa.it','ff123456','Filomena','Ferrucci','FFFLMN80R10M082K','via Giovanni P. II','prof. ordinario','+39123456789','zyukey','Dipartimento di Informatica',NULL,NULL),('fferrucci6@unisa.it','ff123456','Filomena','Ferrucci','FFFLMN80R10M082K','via Giovanni P. II','prof. ordinario','+39123456789','ExyPEH','Dipartimento di Informatica',NULL,NULL),('fferrucci7@unisa.it','ff123456','Filomena','3H89Y','FFFLMN80R10M082K','via Giovanni P. II','prof.ordinario','+39123456789','rRvI01sSem','Dipartimento di Informatica',NULL,NULL);
/*!40000 ALTER TABLE `coordinatore` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `documento`
--

DROP TABLE IF EXISTS `documento`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `documento` (
  `idDocumento` int(8) NOT NULL AUTO_INCREMENT,
  `titolo` varchar(100) NOT NULL,
  `contenutoPath` varchar(400) NOT NULL,
  `idTimeline` int(8) NOT NULL,
  `dataUpload` date NOT NULL,
  `emailCoordinatore` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`idDocumento`),
  KEY `ID_Timeline` (`idTimeline`),
  KEY `Email_Coordinatore` (`emailCoordinatore`),
  CONSTRAINT `documento_ibfk_2` FOREIGN KEY (`emailCoordinatore`) REFERENCES `coordinatore` (`emailCoordinatore`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_idTimeline` FOREIGN KEY (`idTimeline`) REFERENCES `timeline` (`idTimeline`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `documento`
--

LOCK TABLES `documento` WRITE;
/*!40000 ALTER TABLE `documento` DISABLE KEYS */;
INSERT INTO `documento` VALUES (1, '20180110_verifica-3-18.pdf', './docs/docs_timeline/20180110_verifica-3-18.pdf', 1, '2019-01-16', 'fferrucci@unisa.it');
/*!40000 ALTER TABLE `documento` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `post`
--

DROP TABLE IF EXISTS `post`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `post` (
  `idPost` int(8) NOT NULL AUTO_INCREMENT,
  `data` date NOT NULL,
  `ora` time NOT NULL,
  `tag` varchar(100) NOT NULL,
  `fissato` tinyint(1) NOT NULL,
  `emailStudente` varchar(50) DEFAULT NULL,
  `emailCoordinatore` varchar(50) DEFAULT NULL,
  `post` varchar(300) NOT NULL,
  PRIMARY KEY (`idPost`),
  KEY `Email_Studente` (`emailStudente`),
  KEY `Email_Coordinatore` (`emailCoordinatore`),
  CONSTRAINT `fk_emailCoordinatore` FOREIGN KEY (`emailCoordinatore`) REFERENCES `coordinatore` (`emailCoordinatore`),
  CONSTRAINT `fk_emailStudente` FOREIGN KEY (`emailStudente`) REFERENCES `studente` (`emailStudente`)
) ENGINE=InnoDB AUTO_INCREMENT=56 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `post`
--

LOCK TABLES `post` WRITE;
/*!40000 ALTER TABLE `post` DISABLE KEYS */;
INSERT INTO `post` VALUES (1,'2018-03-15','09:38:00','#londra',0,'l.davinci@studenti.unisa.it',NULL,"Com'è il servizio di trasporto?");
INSERT INTO `post` VALUES (2,'2019-01-15','09:38:00','#bologna',0,'pippo31@studenti.unisa.it',NULL,"Com'è il ragu?");
INSERT INTO `post` VALUES (3,'2019-01-15','10:00:00','#sanità',0,'pippo31@studenti.unisa.it',NULL,'La sanità è gratuita?');
INSERT INTO `post` VALUES (4,'2019-01-16','22:24:39','#dipartimentoinformaticaunisa',1,NULL,'fferrucci@unisa.it','Scadenza bando erasmus');
/*!40000 ALTER TABLE `post` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `risposta`
--

DROP TABLE IF EXISTS `risposta`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `risposta` (
  `idRisposta` int(8) NOT NULL AUTO_INCREMENT,
  `risposta` varchar(300) NOT NULL,
  `data` date NOT NULL,
  `ora` time NOT NULL,
  `idPost` int(8) NOT NULL,
  `emailStudente` varchar(50) DEFAULT NULL,
  `emailCoordinatore` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`idRisposta`),
  KEY `ID_Post` (`idPost`),
  KEY `Email_Studente` (`emailStudente`),
  KEY `Email_Coordinatore` (`emailCoordinatore`),
  CONSTRAINT `fk_idPost` FOREIGN KEY (`idPost`) REFERENCES `post` (`idPost`),
  CONSTRAINT `risposta_ibfk_2` FOREIGN KEY (`emailStudente`) REFERENCES `studente` (`emailStudente`),
  CONSTRAINT `risposta_ibfk_3` FOREIGN KEY (`emailCoordinatore`) REFERENCES `coordinatore` (`emailCoordinatore`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `risposta`
--

LOCK TABLES `risposta` WRITE;
/*!40000 ALTER TABLE `risposta` DISABLE KEYS */;
INSERT INTO `risposta` VALUES (1,'Una stringa casuale','2018-03-16','09:48:00',1,'l.davinci@studenti.unisa.it',NULL);
/*!40000 ALTER TABLE `risposta` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `studente`
--

DROP TABLE IF EXISTS `studente`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `studente` (
  `emailStudente` varchar(50) NOT NULL,
  `password` varchar(64) NOT NULL,
  `nome` varchar(100) NOT NULL,
  `cognome` varchar(100) NOT NULL,
  `codiceFiscale` varchar(16) NOT NULL,
  `via` varchar(100) NOT NULL,
  `recapito` varchar(20) NOT NULL,
  `facolta` varchar(100) NOT NULL,
  `matricola` varchar(10) NOT NULL,
  `status` enum('Normale','Partito','Tornato') NOT NULL,
  `bio` varchar(500) DEFAULT NULL,
  `imgProfiloPath` varchar(400) DEFAULT NULL,
  `passToken` varchar(20) DEFAULT NULL,
  `rating` int(4) NOT NULL DEFAULT '0',
  PRIMARY KEY (`emailStudente`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `studente`
--

LOCK TABLES `studente` WRITE;
/*!40000 ALTER TABLE `studente` DISABLE KEYS */;
/*
INSERT INTO `studente` VALUES ('a.emiliano@studenti.unisa.it','alessachiuraport','Alessandro','Emiliano','MLNLSN80A01H703G','Allegria 2','1234567890','Elettronica','0512102323','Normale',NULL,NULL,NULL,0);
INSERT INTO `studente` VALUES ('a.ruggiero114@studenti.unisa.it','change123','Alfonso','Ruggiero','RGGLNS56D67G123X','S.ambr','3470136888','Informatica','0512104807','Normale',NULL,NULL,NULL,0);
INSERT INTO `studente` VALUES ('g.tarantella@studenti.unisa.it','gigione123','Gigione','Tarantella','VRDGPP80A01F913I','ddd','1234567890','dsddd','0512104559','Normale',NULL,'../server/upload/g.tarantella@studenti.unisa.it\\8.jpg',NULL,0);
INSERT INTO `studente` VALUES ('g.verdi@studenti.unisa.it','peppe123','Giuseppe','Verdi','VRDGPP80A01F913I','Alberi 12','1234567890','Conservatorio','0512104559','Normale',"sono un compositore di fama mondiale!.... Non c'è nient'altro da dire",NULL,NULL,0);
INSERT INTO `studente` VALUES ('pippo1@studenti.unisa.it','pippoplutoepaperino','pippo','pluto','PPPPLT80R10M082K','walt d 23','+39123456789','Scienze della comunicazione','0512101234','Normale',NULL,NULL,NULL,0);
INSERT INTO `studente` VALUES ('pippo2@studenti.unisa.it','pippoplutoepaperino','pippo','pluto','PPPPLT80R10M082K','walt d 23','+39123456789','Scienze della comunicazione','0512101234','Normale','IbZR9',NULL,NULL,0);
INSERT INTO `studente` VALUES ('pippo30@studenti.unisa.it','pippoplutoepaperino','pippo','pluto','PPPPLT80R10M082K','walt d 23','+39123456789','Scienze della comunicazione','0512101234','Normale','BA5eZ','../server/upload/pippo30@studenti.unisa.it\\9.jpg',NULL,0);
INSERT INTO `studente` VALUES ('pippo31@studenti.unisa.it','pippoplutoepaperino','pippo','pluto','PPPPLT80R10M082K','walt d 23','+39123456789','Scienze della comunicazione','0512101234','Normale','koDUL','../upload\\\\8.jpg',NULL,0);
INSERT INTO `studente` VALUES ('pippo32@studenti.unisa.it','pippoplutoepaperino','pippo','pluto','PPPPLT80R10M082K','walt d 23','+39123456789','Scienze della comunicazione','0512101234','Normale','s1gS0',NULL,NULL,0);
INSERT INTO `studente` VALUES ('pippo34@studenti.unisa.it','pippoplutoepaperino','pippo','pluto','PPPPLT80R10M082K','walt d 23','+39123456789','Sceinze della comunicazione','0512101234','Normale','8D7np',NULL,NULL,0);
INSERT INTO `studente` VALUES ('pippo38@studenti.unisa.it','pippoplutoepaper','pippo','8V7Gp','PPPPLT80R10M082K','via walt d 23','+39123456789','Scienze della comunicazione','0512101234','Normale','OU0FhmS8o5',NULL,NULL,0);
INSERT INTO `studente` VALUES ('pippo3@studenti.unisa.it','pippoplutoepaperino','pippo','pluto','PPPPLT80R10M082K','walt d 23','+39123456789','Scienze della comunicazione','0512101234','Normale',NULL,'../upload\\\\8.jpg',NULL,0);
INSERT INTO `studente` VALUES ('v.sabato1@studenti.unisa.it','Enzo9804','Vincenzo','Sabato','SBTVCN98D03H703K','santa margherita 28','3392210385','Informatica','0512104559','Normale',NULL,'../upload/s.corso1@studenti.unisa.it\\silvioC.jpg',NULL,0);
*/
INSERT INTO `studente` VALUES ('s.corso1@studenti.unisa.it','Silvio9801','Silvio','Corso','CRSSLV98A17F138W','Via Giovanni Lanzalone 78','+393894724714','Informatica','0512104529','Normale','Studente presso il dipartimento di Informatica','../upload/s.corso1@studenti.unisa.it\\silvioC.jpg',NULL,0);
INSERT INTO `studente` VALUES ('g.cavaliere10@studenti.unisa.it','Giuseppe9701','Giuseppe','Cavaliere','GPPCVLM0197C361L','Via Vincenzo Forte 1','+393279479106','Informatica','0512104961','Partito','Studente presso il dipartimento di Informatica','../upload/g.cavaliere10@studenti.unisa.it\\giuseppeC.jpg',NULL,0);
INSERT INTO `studente` VALUES ('f.vicidomini@studenti.unisa.it','Francesco9405','Francesco','Vicidomini','VCDFNC94E24H703S','Via Corso Claudio 1','+393279479106','Informatica','0512104961','Partito','Studente presso il dipartimento di Informatica','../upload/f.vicidomini@studenti.unisa.it\\francescoC.jpg',NULL,0);
INSERT INTO `studente` VALUES ('l.davinci@studenti.unisa.it','Leonardo5204','Leonardo','Da Vinci','LNRDVN94E24H703S','Via Firenze 1','+39123456789','Dipartimento di matematica','0312104001','Tornato','Studente presso il dipartimento di Matematica','../upload/l.davinci@studenti.unisa.it\\leonardoD.jpg',NULL,0);
/*INSERT INTO `studente` VALUES ('w.egg@studenti.unisa.it','worldegg','Wolrd','Egg','MLNLSN80A01H703G','naturella','1234567890','Uovo','0512100001','Normale',"Sono l'uovo più bello del mondo!",'../server/upload/w.egg@studenti.unisa.it\\WorldRecordUovo.jpg',NULL,0);*/
INSERT INTO `studente` VALUES ('s.lavori@studenti.unisa.it', 'stevejobs', 'Stefano', 'Lavori', 'LVRSTF97T24A717H', 'Apple', '3333333333', 'Tante cose belle e costose', '0512104672', 'Normale', 'Sono la versione italiana del celebre SJ, mi piacciono le mele', NULL, NULL, 0);

INSERT INTO `studente` VALUES ('a.emiliano@studenti.unisa.it','alessachiuraport','Alessandro','Emiliano','MLNLSN80A01H703G','Allegria 2','1234567890','Elettronica','0512102323','Normale',NULL,NULL,NULL,0),('a.ruggiero114@studenti.unisa.it','change123','Alfonso','Ruggiero','RGGLNS56D67G123X','S.ambr','3470136888','Informatica','0512104807','Normale',NULL,NULL,NULL,0),('g.tarantella@studenti.unisa.it','gigione123','Gigione','Tarantella','VRDGPP80A01F913I','ddd','1234567890','dsddd','0512104559','Normale',NULL,'../server/upload/g.tarantella@studenti.unisa.it\\8.jpg',NULL,0),('g.verdi@studenti.unisa.it','peppe123','Giuseppe','Verdi','VRDGPP80A01F913I','Alberi 12','1234567890','Conservatorio','0512104559','Normale',"sono un compositore di fama mondiale!.... Non c'è nient'altro da dire",NULL,NULL,0),('pippo1@studenti.unisa.it','pippoplutoepaperino','pippo','pluto','PPPPLT80R10M082K','walt d 23','+39123456789','Scienze della comunicazione','0512101234','Normale',NULL,NULL,NULL,0),('pippo2@studenti.unisa.it','pippoplutoepaperino','pippo','pluto','PPPPLT80R10M082K','walt d 23','+39123456789','Scienze della comunicazione','0512101234','Normale','IbZR9',NULL,NULL,0),('pippo30@studenti.unisa.it','pippoplutoepaperino','pippo','pluto','PPPPLT80R10M082K','walt d 23','+39123456789','Scienze della comunicazione','0512101234','Normale','BA5eZ','../server/upload/pippo30@studenti.unisa.it\\9.jpg',NULL,0),('pippo31@studenti.unisa.it','pippoplutoepaperino','pippo','pluto','PPPPLT80R10M082K','walt d 23','+39123456789','Scienze della comunicazione','0512101234','Normale','koDUL','../upload\\\\8.jpg',NULL,0),('pippo32@studenti.unisa.it','pippoplutoepaperino','pippo','pluto','PPPPLT80R10M082K','walt d 23','+39123456789','Scienze della comunicazione','0512101234','Normale','s1gS0',NULL,NULL,0),('pippo34@studenti.unisa.it','pippoplutoepaperino','pippo','pluto','PPPPLT80R10M082K','walt d 23','+39123456789','Sceinze della comunicazione','0512101234','Normale','8D7np',NULL,NULL,0),('pippo38@studenti.unisa.it','pippoplutoepaper','pippo','8V7Gp','PPPPLT80R10M082K','via walt d 23','+39123456789','Scienze della comunicazione','0512101234','Normale','OU0FhmS8o5',NULL,NULL,0),('pippo3@studenti.unisa.it','pippoplutoepaperino','pippo','pluto','PPPPLT80R10M082K','walt d 23','+39123456789','Scienze della comunicazione','0512101234','Normale',NULL,'../upload\\\\8.jpg',NULL,0),('v.sabato1@studenti.unisa.it','Enzo9804','Vincenzo','Sabato','SBTVCN98D03H703K','santa margherita 28','3392210385','Informatica','0512104559','Normale',NULL,NULL,NULL,0),('w.egg@studenti.unisa.it','worldegg','Wolrd','Egg','MLNLSN80A01H703G','naturella','1234567890','Uovo','0512100001','Normale',"Sono l'uovo più bello del mondo!",'../server/upload/w.egg@studenti.unisa.it\\WorldRecordUovo.jpg',NULL,0);

/*!40000 ALTER TABLE `studente` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `timeline`
--

DROP TABLE IF EXISTS `timeline`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `timeline` (
  `idTimeline` int(8) NOT NULL AUTO_INCREMENT,
  `emailStudente` varchar(50) NOT NULL,
  `emailCoordinatore` varchar(50) NOT NULL,
  `citta` varchar(70) NOT NULL,
  `nazione` varchar(45) NOT NULL,
  PRIMARY KEY (`idTimeline`),
  KEY `Email_Studente` (`emailStudente`),
  KEY `Email_Coordinatore` (`emailCoordinatore`),
  CONSTRAINT `timeline_ibfk_1` FOREIGN KEY (`emailStudente`) REFERENCES `studente` (`emailStudente`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `timeline_ibfk_2` FOREIGN KEY (`emailCoordinatore`) REFERENCES `coordinatore` (`emailCoordinatore`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `timeline`
--

LOCK TABLES `timeline` WRITE;
/*!40000 ALTER TABLE `timeline` DISABLE KEYS */;
INSERT INTO `timeline` VALUES (1, 's.corso1@studenti.unisa.it', 'fferrucci@unisa.it', 'Parigi', 'Francia');
INSERT INTO `timeline` VALUES (2, 'v.sabato1@studenti.unisa.it', 'fferrucci@unisa.it', 'Parigi', 'Francia');
INSERT INTO `timeline` VALUES (3, 'f.vicidomini@studenti.unisa.it', 'gravino@unisa.it', 'Londra', 'Inghilterra');
INSERT INTO `timeline` VALUES (4, 'g.cavaliere10@studenti.unisa.it', 'gravino@unisa.it', 'Lisbona', 'Portogallo');
/*!40000 ALTER TABLE `timeline` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `vota`
--

DROP TABLE IF EXISTS `vota`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `vota` (
  `idVoto` int(8) NOT NULL AUTO_INCREMENT,
  `voto` enum('-1','1') NOT NULL,
  `idRisposta` int(8) NOT NULL,
  `emailStudente` varchar(50) DEFAULT NULL,
  `emailCoordinatore` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`idVoto`),
  KEY `ID_Risposta` (`idRisposta`),
  KEY `Email_Studente` (`emailStudente`),
  KEY `Email_Coordinatore` (`emailCoordinatore`),
  CONSTRAINT `fk_vota_idRisposta` FOREIGN KEY (`idRisposta`) REFERENCES `risposta` (`idRisposta`),
  CONSTRAINT `vota_ibfk_2` FOREIGN KEY (`emailStudente`) REFERENCES `studente` (`emailStudente`),
  CONSTRAINT `vota_ibfk_3` FOREIGN KEY (`emailCoordinatore`) REFERENCES `coordinatore` (`emailCoordinatore`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `vota`
--

LOCK TABLES `vota` WRITE;
/*!40000 ALTER TABLE `vota` DISABLE KEYS */;
/*!40000 ALTER TABLE `vota` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `votazione`
--

DROP TABLE IF EXISTS `votazione`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `votazione` (
  `idTimeline` int(8) NOT NULL,
  `emailStudente` varchar(50) NOT NULL,
  `nomeEsame` varchar(50) NOT NULL,
  `votoIta` int(2) NOT NULL,
  `esameEstero` varchar(45) NOT NULL,
  `votoEstero` varchar(1) NOT NULL,
  PRIMARY KEY (`idTimeline`,`nomeEsame`),
  KEY `Email_Studente` (`emailStudente`),
  CONSTRAINT `fk_votazione_idTimeline` FOREIGN KEY (`idTimeline`) REFERENCES `timeline` (`idTimeline`),
  CONSTRAINT `votazione_ibfk_2` FOREIGN KEY (`emailStudente`) REFERENCES `studente` (`emailStudente`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `votazione`
--

LOCK TABLES `votazione` WRITE;
/*!40000 ALTER TABLE `votazione` DISABLE KEYS */;
INSERT INTO `votazione` VALUES (1,'s.corso1@studenti.unisa.it','Programmazione 1',30,'Programacion 1','A');
INSERT INTO `votazione` VALUES (3,'f.vicidomini@studenti.unisa.it','Programmazione 2',30,'Programming 2','A');
/*!40000 ALTER TABLE `votazione` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2019-01-16 22:32:00
