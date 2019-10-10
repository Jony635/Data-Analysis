CREATE DATABASE  IF NOT EXISTS `kpis` /*!40100 DEFAULT CHARACTER SET utf8 */;
USE `kpis`;
-- MySQL dump 10.13  Distrib 8.0.12, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: kpis
-- ------------------------------------------------------
-- Server version	8.0.12

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
 SET NAMES utf8 ;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Temporary view structure for view `mau`
--

DROP TABLE IF EXISTS `mau`;
/*!50001 DROP VIEW IF EXISTS `mau`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8mb4;
/*!50001 CREATE VIEW `mau` AS SELECT 
 1 AS `Date`,
 1 AS `mau`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `firstsessionlength`
--

DROP TABLE IF EXISTS `firstsessionlength`;
/*!50001 DROP VIEW IF EXISTS `firstsessionlength`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8mb4;
/*!50001 CREATE VIEW `firstsessionlength` AS SELECT 
 1 AS `DATE(d.date)`,
 1 AS `“NewUsers”`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `dau`
--

DROP TABLE IF EXISTS `dau`;
/*!50001 DROP VIEW IF EXISTS `dau`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8mb4;
/*!50001 CREATE VIEW `dau` AS SELECT 
 1 AS `Date`,
 1 AS `dau`*/;
SET character_set_client = @saved_cs_client;

--
-- Final view structure for view `mau`
--

/*!50001 DROP VIEW IF EXISTS `mau`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `mau` AS select cast(`d`.`date` as date) AS `Date`,count(distinct `s`.`player_id`) AS `mau` from (`dates` `d` left join `sessions` `s` on(((cast(`s`.`start` as date) > cast((`d`.`date` - interval 30 day) as date)) and (cast(`s`.`start` as date) <= cast(`d`.`date` as date))))) group by cast(`d`.`date` as date) order by cast(`d`.`date` as date) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `firstsessionlength`
--

/*!50001 DROP VIEW IF EXISTS `firstsessionlength`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `firstsessionlength` AS select cast(`d`.`date` as date) AS `DATE(d.date)`,avg(timestampdiff(MINUTE,`su`.`start`,`su`.`end`)) AS `“NewUsers”` from (`dates` `d` left join (select `o`.`session_id` AS `session_id`,`o`.`game_id` AS `game_id`,`o`.`player_id` AS `player_id`,`o`.`start` AS `start`,`o`.`end` AS `end`,`o`.`lastControl` AS `lastControl` from (select `s`.`session_id` AS `session_id`,`s`.`game_id` AS `game_id`,`s`.`player_id` AS `player_id`,`s`.`start` AS `start`,`s`.`end` AS `end`,`s`.`lastControl` AS `lastControl` from `sessions` `s` order by `s`.`start`) `o` group by `o`.`player_id`) `su` on((cast(`su`.`start` as date) = cast(`d`.`date` as date)))) group by cast(`d`.`date` as date) order by cast(`d`.`date` as date) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `dau`
--

/*!50001 DROP VIEW IF EXISTS `dau`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `dau` AS select cast(`d`.`date` as date) AS `Date`,count(distinct `s`.`player_id`) AS `dau` from (`dates` `d` left join `sessions` `s` on((cast(`s`.`start` as date) = cast(`d`.`date` as date)))) group by cast(`d`.`date` as date) order by cast(`d`.`date` as date) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2018-10-01 12:47:14
