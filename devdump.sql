-- MySQL dump 10.13  Distrib 5.7.21, for Linux (x86_64)
--
-- Host: localhost    Database: Abcd1234@
-- ------------------------------------------------------
-- Server version	5.7.21-0ubuntu0.16.04.1

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
-- MySQL dump 10.13  Distrib 5.7.21, for Linux (x86_64)
--
-- Host: localhost    Database: app_development
-- ------------------------------------------------------
-- Server version	5.7.21-0ubuntu0.16.04.1

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
-- Table structure for table `ar_internal_metadata`
--

DROP TABLE IF EXISTS `ar_internal_metadata`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ar_internal_metadata` (
  `key` varchar(255) NOT NULL,
  `value` varchar(255) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`key`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ar_internal_metadata`
--

LOCK TABLES `ar_internal_metadata` WRITE;
/*!40000 ALTER TABLE `ar_internal_metadata` DISABLE KEYS */;
INSERT INTO `ar_internal_metadata` VALUES ('environment','development','2018-02-22 04:36:33','2018-02-22 04:36:33');
/*!40000 ALTER TABLE `ar_internal_metadata` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `comments`
--

DROP TABLE IF EXISTS `comments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `comments` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `body` text,
  `ticket_id` bigint(20) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `currentstatus` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `index_comments_on_ticket_id` (`ticket_id`),
  CONSTRAINT `fk_rails_e013b60ecb` FOREIGN KEY (`ticket_id`) REFERENCES `tickets` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=64 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `comments`
--

LOCK TABLES `comments` WRITE;
/*!40000 ALTER TABLE `comments` DISABLE KEYS */;
INSERT INTO `comments` VALUES (14,'May have this fixed already',9,'2018-03-04 20:12:06','2018-03-04 20:12:06',1,'Unverified'),(15,'May have this fixed already',9,'2018-03-04 20:12:09','2018-03-04 20:12:09',1,'Unverified'),(16,'Well, maybe not',9,'2018-03-04 20:14:12','2018-03-04 20:14:12',1,'Verified'),(17,'check now?',9,'2018-03-04 20:17:36','2018-03-04 20:17:36',1,'QA'),(18,'what about now',9,'2018-03-04 20:44:38','2018-03-04 20:44:38',1,'Verified'),(19,'Test new Status',9,'2018-03-04 21:56:21','2018-03-04 21:56:21',1,'Verified'),(20,'Still testing status',9,'2018-03-04 21:57:12','2018-03-04 21:57:12',1,'Verified'),(21,'I believe this is resolved, setting comment currentstatus = \"Q.A.,\" should update ticket status as well.',9,'2018-03-04 21:59:52','2018-03-04 21:59:52',1,'Q.A.'),(22,'Resolved.',9,'2018-03-04 22:00:12','2018-03-04 22:00:12',1,'Resolved'),(23,'Mostly fixed, had too many /DIVs on ticket show page. Going to check others, but I think that was the majority of it. Also add \"z-index: -1;\" to #stripe tag.',7,'2018-03-04 22:08:04','2018-03-04 22:08:04',1,'Q.A.'),(24,'Resolved.',7,'2018-03-04 22:11:35','2018-03-04 22:11:35',1,'Resolved'),(25,'Reworked it some, I am happy with it now.',5,'2018-03-04 22:50:50','2018-03-04 22:50:50',1,'Resolved'),(26,'Not perfect but much better.',4,'2018-03-04 22:51:32','2018-03-04 22:51:32',1,'Q.A.'),(27,'I\'m just setting this to \"unverified\" to look at CSS color tags',6,'2018-03-05 02:05:26','2018-03-05 02:05:26',1,'Unverified'),(28,'Setting back, I hope to have this done tonight',6,'2018-03-05 02:06:15','2018-03-05 02:06:15',1,'Development'),(29,'First step will be to add assigned_to column to tickets db. Then, add \"Take Ticket\" button on  ticket info card. Finally, add ticket owner info to ticket informaiton card, index table, and user show page.',12,'2018-03-05 04:08:58','2018-03-05 04:08:58',1,'Development'),(30,'I\'m calling this resolved for now.',4,'2018-03-05 07:32:27','2018-03-05 07:32:27',1,'Resolved'),(31,'Tickets are assignable, will add admin re-assign when I work admin into the mix.',8,'2018-03-05 07:33:15','2018-03-05 07:33:15',1,'Q.A.'),(32,'Just an update, this is working and on Ticket show. Adding to Ticket Index will be simple, User show will come when Users get reworked.',12,'2018-03-05 07:34:20','2018-03-05 07:34:20',1,'Development'),(33,'Ticket Index done. Going to bed.',12,'2018-03-05 08:05:02','2018-03-05 08:05:02',1,'Development'),(34,'Only active tickets show much of anywhere at this point. Closed tickets will mainly be admin only I think.',10,'2018-03-06 04:27:24','2018-03-06 04:27:24',1,'Development'),(35,'BTW Ticket index wasn\'t that simple. User show downright sucked. It\'s all there, double check a few things before marking as deployed.',12,'2018-03-06 04:29:12','2018-03-06 04:29:12',1,'Q.A.'),(36,'User show page has all kinds of stuff on it in addition to active tickets. The more I think about it, I don\'t think I\'ll show deployed tickets to anyone except admins. This is all but finished.',11,'2018-03-06 04:30:39','2018-03-06 04:30:39',1,'Q.A.'),(37,'Correction: I got stuck on a bunch of other things. This is the most glaring deficiency in the system right now. Still, I\'m putting it off because I hope to knock most of it out in one fell swoop and I\'m trying to lock down other features first.',6,'2018-03-06 04:32:11','2018-03-06 04:32:11',1,'Verified'),(38,'The only part of this that hasn\'t been done is the old tickets view, and I\'m not sure I\'m even going to implement that for admin (maybe just all on one page)',11,'2018-03-06 05:14:48','2018-03-06 05:14:48',1,'Resolved'),(40,'I\'m just going to add User info to this page. There isn\'t that much else to say, and it\'s slightly pertinent as it shows tickets that the user has already going before he makes another one.',15,'2018-03-06 05:19:41','2018-03-06 05:19:41',1,'Q.A.'),(41,'On User show, form needs to be on left and info needs to be on right to match every other page layout.',14,'2018-03-06 05:25:30','2018-03-06 05:25:30',1,'Development'),(42,'Ticket Resolved.',12,'2018-03-06 05:28:11','2018-03-06 05:28:11',1,'Resolved'),(43,'Wish list: better color scheme for ticket statuses.',14,'2018-03-06 05:29:20','2018-03-06 05:29:20',1,'Development'),(44,'Good enough. User info card on new ticket page.',15,'2018-03-07 00:31:27','2018-03-07 00:31:27',1,'Resolved'),(45,'Done. Doesn\'t look like I missed anything.',17,'2018-03-07 00:42:59','2018-03-07 00:42:59',1,'Resolved'),(46,'On second thought, Old tickets should be viewable and searchable by everybody. I\'ll come up with something.',10,'2018-03-07 00:45:49','2018-03-07 00:45:49',1,'Development'),(47,'Pretty much taken care of, I\'m not marking it Resolved outright because I want it in my face on the index page until I\'m much closer to being done.',14,'2018-03-07 01:11:09','2018-03-07 01:11:09',1,'Q.A.'),(48,'Resolved status',18,'2018-03-07 01:15:42','2018-03-07 01:15:42',1,'Resolved'),(49,'Qual. Assurance',18,'2018-03-07 01:15:55','2018-03-07 01:15:55',1,'Q.A.'),(50,'Development',18,'2018-03-07 01:16:14','2018-03-07 01:16:14',1,'Development'),(51,'Verified',18,'2018-03-07 01:16:31','2018-03-07 01:16:31',1,'Verified'),(52,'Unverified. tweak css tags until these look good',18,'2018-03-07 01:16:56','2018-03-07 01:16:56',1,'Unverified'),(53,'\"Resolved Tickets\" Page is linkable off of index, almost toggle-like (but not quite). Similar to Index but no status (since it will be resolved), and took description off, just going with summary (title).',10,'2018-03-07 02:18:22','2018-03-07 02:18:22',1,'Development'),(54,'Commenting so that I can see a new event (hopefully)',21,'2018-03-07 05:21:14','2018-03-07 05:21:14',1,'Development'),(55,'Commenting so that I can see a new event (hopefully)',21,'2018-03-07 05:21:19','2018-03-07 05:21:19',1,'Development'),(56,'commenting again',21,'2018-03-07 05:23:22','2018-03-07 05:23:22',1,'Development'),(57,'one more time',21,'2018-03-07 05:25:09','2018-03-07 05:25:09',1,'Development'),(58,'I\'m commenting too!',21,'2018-03-07 05:27:22','2018-03-07 05:27:22',2,'Development'),(59,'Hot dog I think it actually works',21,'2018-03-07 05:33:01','2018-03-07 05:33:01',1,'Q.A.'),(60,'Not quite there yet, I\'m double checking',21,'2018-03-07 05:34:09','2018-03-07 05:34:09',1,'Development'),(61,'Much Much better.',21,'2018-03-07 06:15:11','2018-03-07 06:15:11',1,'Q.A.'),(62,'Got a lot done. Admin Tier has its own view, where you get to see all recent events sitewide (linkable). Next will be additional functions added to forms on other pages. ',6,'2018-03-07 06:18:15','2018-03-07 06:18:15',1,'Development'),(63,'Set to QA for now, not sure if I\'ll get search done in time',10,'2018-03-07 06:19:12','2018-03-07 06:19:12',1,'Q.A.');
/*!40000 ALTER TABLE `comments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `events`
--

DROP TABLE IF EXISTS `events`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `events` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `event_id` varchar(255) DEFAULT NULL,
  `action` varchar(255) DEFAULT NULL,
  `user` int(11) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `object` varchar(24) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `events`
--

LOCK TABLES `events` WRITE;
/*!40000 ALTER TABLE `events` DISABLE KEYS */;
INSERT INTO `events` VALUES (1,'21','Created ',1,'2018-03-07 05:07:44','2018-03-07 05:07:44','Ticket'),(2,'57','Created ',1,'2018-03-07 05:25:09','2018-03-07 05:25:09','Comment'),(3,'21','Updated ',1,'2018-03-07 05:25:44','2018-03-07 05:25:44','Ticket'),(4,'1','Updated ',1,'2018-03-07 05:26:11','2018-03-07 05:26:11','User'),(5,'1','Updated ',1,'2018-03-07 05:26:25','2018-03-07 05:26:25','User'),(6,'58','Created ',2,'2018-03-07 05:27:22','2018-03-07 05:27:22','Comment'),(7,'59','Created ',1,'2018-03-07 05:33:01','2018-03-07 05:33:01','Comment'),(8,'60','Created ',1,'2018-03-07 05:34:09','2018-03-07 05:34:09','Comment'),(9,'61','Created ',1,'2018-03-07 06:15:11','2018-03-07 06:15:11','Comment'),(10,'62','Created ',1,'2018-03-07 06:18:15','2018-03-07 06:18:15','Comment'),(11,'63','Created ',1,'2018-03-07 06:19:12','2018-03-07 06:19:12','Comment'),(12,'22','Created ',1,'2018-03-07 06:22:18','2018-03-07 06:22:18','Ticket'),(13,'13','Deleted ',1,'2018-03-07 06:36:35','2018-03-07 06:36:35','Ticket'),(14,'23','Deleted ',1,'2018-03-07 07:02:39','2018-03-07 07:02:39','Ticket'),(15,'22','Updated ',1,'2018-03-07 07:10:46','2018-03-07 07:10:46','Ticket'),(16,'1','Updated ',1,'2018-03-07 17:29:42','2018-03-07 17:29:42','User'),(17,'1','Updated ',1,'2018-03-07 17:31:52','2018-03-07 17:31:52','User');
/*!40000 ALTER TABLE `events` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `schema_migrations`
--

DROP TABLE IF EXISTS `schema_migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `schema_migrations` (
  `version` varchar(255) NOT NULL,
  PRIMARY KEY (`version`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `schema_migrations`
--

LOCK TABLES `schema_migrations` WRITE;
/*!40000 ALTER TABLE `schema_migrations` DISABLE KEYS */;
INSERT INTO `schema_migrations` VALUES ('20180125041555'),('20180125053629'),('20180208055302'),('20180208070338'),('20180222050411'),('20180228051438'),('20180304192639'),('20180305041011'),('20180307042529');
/*!40000 ALTER TABLE `schema_migrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tickets`
--

DROP TABLE IF EXISTS `tickets`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tickets` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) DEFAULT NULL,
  `description` text,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `status` text,
  `screenshot_file_name` varchar(255) DEFAULT NULL,
  `screenshot_content_type` varchar(255) DEFAULT NULL,
  `screenshot_file_size` int(11) DEFAULT NULL,
  `screenshot_updated_at` datetime DEFAULT NULL,
  `assigned_user` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tickets`
--

LOCK TABLES `tickets` WRITE;
/*!40000 ALTER TABLE `tickets` DISABLE KEYS */;
INSERT INTO `tickets` VALUES (4,'Do Something about stripe div','div id=\"stripe\" is the element I made to serve as a divider for portions of the page. It looked okay up until a  point, but something has broken it now and it causes problems on multiple pages. Screenshot has just one example, it goes over my fixed position menu when you scroll past.(edited)','2018-03-04 19:45:09','2018-03-05 07:32:27','Resolved','Screenshot_from_2018-03-04_13-42-19.png','image/png',29328,'2018-03-04 19:45:08',1),(5,'Table on Ticket Index','The status icons to the right of the table have the same background as the rest of the table. I want that gone.','2018-03-04 19:51:38','2018-03-05 07:19:31','Resolved','Screenshot_from_2018-03-04_13-49-02.png','image/png',29302,'2018-03-04 19:51:38',1),(6,'User Privileges','User accounts have been created, and there is an admin tier. So far, admin tier does nothing and that needs to change.','2018-03-04 19:52:56','2018-03-07 06:18:15','Development',NULL,NULL,NULL,NULL,1),(7,'Footer Partial Screwed Up','This is probably related to my header div problem (see ticket ID# 4), but the site-wide footer content is all kinds of jacked up. See screenshot.','2018-03-04 19:56:42','2018-03-05 07:19:47','Resolved','Screenshot_from_2018-03-04_13-53-07.png','image/png',160253,'2018-03-04 19:56:42',1),(8,'Assign Ticket to User','Need to be able to assign a ticket to a particular user. Once assigned, only admin can re-assign if needed.','2018-03-04 19:58:01','2018-03-05 07:33:16','Q.A.',NULL,NULL,NULL,NULL,1),(9,'Status on Ticket Index','On tickets index page, show current status instead of ticket status. In fact, that should probably be the same thing. See if you can make a comment update the status of the ticket itself (probably can)','2018-03-04 20:05:44','2018-03-05 07:20:06','Resolved',NULL,NULL,NULL,NULL,1),(10,'Split up Current and Past Tickets','Index page should only show tickets that are still unresolved/being worked on. Make another page for resolved tickets (probably need a way to mark them resolved)','2018-03-05 02:57:20','2018-03-07 06:19:12','Q.A.',NULL,NULL,NULL,NULL,1),(11,'User Show Page','Flesh out user page. Currently just shows contact information as pulled from users table. Add Edit User form and assigned tickets both current and closed. Users can only edit their own information, Admin can edit anybody\'s.','2018-03-05 04:00:41','2018-03-06 05:14:48','Resolved',NULL,NULL,NULL,NULL,1),(12,'\"Take Ticket\" button(?)','Add a \"take ticket\" button to ticket show page to assign ticket to current user. This will show on Tickets Index, Ticket show, and User Show.','2018-03-05 04:03:37','2018-03-06 05:28:11','Resolved',NULL,NULL,NULL,NULL,1),(14,'Layout/Design Requirements','Should have done this weeks ago. LAYOUT:\r\n- All info that is pulled from database for DISPLAY ONLY is put on a card\r\n-header from that card uses \"infoheader\"\r\n- as much info on that card (user, ticketname, etc) is linkable\r\n- forms on page are NOT on a card, they are embedded into bg\r\n-buttons float above bg, links look just like regular text\r\n\r\n-this is a good start. If these rules are followed strictly, there should be a pretty cohesive layout across views.','2018-03-06 04:46:41','2018-03-07 01:11:09','Q.A.',NULL,NULL,NULL,NULL,1),(15,'New Ticket Page','Need to add something to New Ticket page. Currently just has the new ticket form and a bunch of empty space on the right. Not sure what pertinent information can go here.','2018-03-06 05:02:33','2018-03-07 00:31:27','Resolved',NULL,NULL,NULL,NULL,1),(16,'Admin Stuff','Separate admin page is required with all functions on it. Admin functions for specific objects/pages still show on those individual pages. List of  functions are below:\r\n\r\n-USERS: add, edit, delete any user, make other users admin\r\n\r\n-TICKETS: delete tickets, edit anybody\'s ticket, re-assign tickets to users\r\n\r\n-COMMENTS: edit or delete comments','2018-03-06 05:10:22','2018-03-06 05:11:57','Verified',NULL,NULL,NULL,NULL,NULL),(17,'Change Final Status From \"Deployed\" to \"Resolved\"','I think I like calling the final state of a ticket \"Resolved\" rather than \"Deployed.\" I\'ve already made this distinction several places in the code, I plan on double checking and then going into db and changing all status from \"Deployed\" to \"Resolved.\"','2018-03-07 00:36:12','2018-03-07 00:42:59','Resolved',NULL,NULL,NULL,NULL,1),(18,'Ticket stats colors','Look at all the colors next to each other to verify cohesiveness','2018-03-07 01:15:22','2018-03-07 01:16:56','Unverified',NULL,NULL,NULL,NULL,1),(21,'Created Events Table','Created events table so I could log CRUD events on various objects. doesn\'t hold the object itself, and as of right now it\'s pretty simple. Hopefully, saving this ticket creates a log event. Now, I\'m editing this ticket so hopefully that shows correctly too.','2018-03-07 05:07:44','2018-03-07 06:15:11','Q.A.',NULL,NULL,NULL,NULL,NULL),(22,'Tidying Up','I have some admin stuff set up now, but most of the rules aren\'t being enforced. I need to check very carefully that users are being properly confined to areas where they can\'t do too much damage.','2018-03-07 06:22:18','2018-03-07 07:10:46','Verified',NULL,NULL,NULL,NULL,1);
/*!40000 ALTER TABLE `tickets` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `users` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `password_digest` varchar(255) DEFAULT NULL,
  `admin` tinyint(1) DEFAULT '0',
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'Andrew Palmer','andy@showcasetech.net','$2a$10$QtRasp1Tecx/c0eQuNVMBu1S3CJ6300U2fTaAKl6HLsYTbYqKg5o.',1,'2018-02-22 05:11:26','2018-03-07 17:31:52'),(2,'Carrie McClard','Carrie@gmail.com','$2a$10$q5gkK9LOb8HTsoeAcf0CNuyHAnIq59gdHA6u73bKn4q.37MNQJcpq',0,'2018-02-22 05:11:57','2018-02-22 05:11:57'),(3,'Harry Stone','harry@showcasetech.net','$2a$10$vLH.YVI5zgw.Tlo0PN/Jlu5OxRdmK8j7CJ73JKT4RVlaxatrIyIhu',1,'2018-03-07 17:31:10','2018-03-07 17:31:10');
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2018-03-07 14:29:48
