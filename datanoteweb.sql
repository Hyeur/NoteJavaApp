-- MySQL dump 10.13  Distrib 8.0.23, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: datanoteweb
-- ------------------------------------------------------
-- Server version	8.0.23

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
-- Table structure for table `note`
--

DROP TABLE IF EXISTS `note`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `note` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `userid` bigint NOT NULL,
  `title` varchar(255) DEFAULT NULL,
  `content` text NOT NULL,
  `createddate` timestamp NULL DEFAULT NULL,
  `modifieddate` timestamp NULL DEFAULT NULL,
  `createdby` varchar(255) DEFAULT NULL,
  `modifiedby` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_notes_user` (`userid`),
  CONSTRAINT `fk_notes_user` FOREIGN KEY (`userid`) REFERENCES `user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=27 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `note`
--

LOCK TABLES `note` WRITE;
/*!40000 ALTER TABLE `note` DISABLE KEYS */;
INSERT INTO `note` VALUES (6,2,'Nota','ằqa','2021-06-24 14:18:13','2021-06-25 14:17:59','2','huy'),(7,3,'Note so 4','ằ','2021-06-24 14:18:13',NULL,NULL,NULL),(8,3,'ầ','ùawf','2021-06-24 14:18:13',NULL,NULL,NULL),(9,2,'Note so 4qưdqwda','o7to5oưqdqwdwqa','2021-06-24 14:18:13','2021-06-25 14:18:03','2','huy'),(10,2,'dssdđwda','asdasưqdqwa','2021-06-24 14:18:13','2021-06-25 14:18:08','2','huy'),(13,1,'Welcome to WSB - Big Pump Signal ! ','Alo alo đang ở đâu z','2021-06-24 14:18:13',NULL,'hieu',NULL),(14,1,'Welcome to WSB - Big Pump Signal ! ','asdasdasdas','2021-06-24 15:04:53',NULL,'hieu',NULL),(15,1,'Sáng 25-6: 57/91 ca COVID-19 ở TP.HCM, gần 3 triệu người đã được tiêm vắc xin','TTO - Sáng nay 25-6, Bộ Y tế cho biết đã ghi nhận thêm 91 ca mắc COVID-19 mới, 57 ca trong số này ở TP.HCM. Đáng chú ý, đã có gần 3 triệu người ở Việt Nam được tiêm vắc xin, tương đương 4% số có chỉ định tiêm ngừa.','2021-06-25 02:00:39',NULL,'hieu',NULL),(16,1,' siêu thị mua đồ 15 phút, đợi tính tiền gần 2 tiếng, vừa mệt vừa \'run\'','- Nhiều người dân mua sắm tại siêu thị Big C Trường Chinh (quận Tân Phú, TP.HCM) chiều tối 24-6 không khỏi ‘rùng mình’ trước cảnh phải xếp hàng nhiều giờ đồng hồ vẫn chưa thể tính tiền.','2021-06-25 02:16:45','2021-06-25 14:44:15','hieu','hieu'),(17,1,'TP.HCM: Hướng dẫn quy trình khai báo y tế điện tử rất đơn giản, thuận tiện','TTO - Hệ thống khai báo y tế điện tử TP.HCM đã được triển khai và hướng dẫn cụ thể. Bắt đầu từ 24-6, người dân toàn TP sẽ thực hiện khai báo giúp công tác truy vết, khoanh vùng, sàng lọc hiệu quả để cùng đẩy lùi đại dịch.','2021-06-25 02:17:48',NULL,'hieu',NULL),(18,1,'Google hướng dẫn khắc phục lỗi ‘liên tục dừng’ trên điện thoại Android','TTO - Google vừa cho biết đã sửa xong lỗi ‘Google liên tục dừng’ trên hệ điều hành Android, đồng thời hướng dẫn người dùng cách tự khắc phục nếu điện thoại họ chưa được nâng cấp.','2021-06-25 02:19:06',NULL,'hieu',NULL),(19,1,'Canada c','TTO -  người bản địa Canada, Cowessess First Nation, hôm 24-6 cho biết đã tìm thấy hài cốt của 761 người bản địa, trong đó đa số là trẻ em, tại một ngôi trường cũ ở tỉnh Saskatchewan.','2021-06-25 02:25:22','2021-06-25 14:42:27','hieu','hieu'),(20,1,'Chủ tịch UBND TP.HCM: Nghiên cứu cho tiểu thương chợ truyền thống bán luân phiên','TTO - Tại các chợ truyền thống, nên tính toán, nghiên cứu mô hình quận 8 đang áp dụng là có thể bố trí tiểu thương trong chợ buôn bán luân phiên theo ngày. Riêng các chợ đầu mối phải có phương án hoạt động cụ thể.','2021-06-25 14:44:53',NULL,'hieu',NULL),(21,1,'Long An phát hiện ca nghi nhiễm là nam bác sĩ phục vụ trong bệnh viện dã chiến','TTO - Nam bác sĩ đang phục vụ tại Bệnh viện dã chiến số 1, được thành lập từ Bệnh viện Phổi Long An, qua xét nghiệm sàng lọc PCR đã cho ra kết quả dương tính.','2021-06-25 18:35:55',NULL,'hieu',NULL),(22,2,'Long An phát hiện ca nghi nhiễm là nam bác sĩ phục vụ trong bệnh viện dã chiến','TTO - Nam bác sĩ đang phục vụ tại Bệnh viện dã chiến số 1, được thành lập từ Bệnh viện Phổi Long An, qua xét nghiệm sàng lọc PCR đã cho ra kết quả dương tính.','2021-06-25 18:37:16','2021-06-25 18:37:44','huy','huy'),(23,3,'Thủ tướng làm việc với công ty kiến nghị cấp phép khẩn vắc xin Nano Covax','TTO - Thủ tướng Phạm Minh Chính sáng 26-6 dẫn đầu đoàn công tác của Chính phủ làm việc với Công ty cổ phần công nghệ sinh học dược Nanogen (Khu công nghệ cao TP.HCM), sau khi công ty kiến nghị cấp phép khẩn cấp vắc xin Nano Covax.','2021-06-26 04:18:44',NULL,'hoa',NULL),(24,6,'Long An phát hiện ca nghi nhiễm là nam bác sĩ phục vụ trong bệnh viện dã chiến','asdadsadqwdqqwdqwdqwdqwdqwdq','2021-06-26 07:17:09','2021-06-26 07:17:15','65Kin','65Kin'),(26,2,'rưa 26-6: Điểm nóng TP.HCM không ghi nhận ca nhiễm mới trong sáng 26-6','TTO - Trưa 26-6, Bộ Y tế cho biết, Việt Nam có thêm 37 ca COVID-19, trong đó nhiều nhất ở Hưng Yên 11 ca, Hà Tĩnh 7 ca. Điểm nóng TP.HCM không ghi nhận ca nhiễm mới trong sáng cùng ngày.\r\n','2021-06-26 08:59:36',NULL,'huy',NULL);
/*!40000 ALTER TABLE `note` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `role`
--

DROP TABLE IF EXISTS `role`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `role` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `code` varchar(255) NOT NULL,
  `createddate` timestamp NULL DEFAULT NULL,
  `modifieddate` timestamp NULL DEFAULT NULL,
  `createdby` varchar(255) DEFAULT NULL,
  `modifiedby` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `role`
--

LOCK TABLES `role` WRITE;
/*!40000 ALTER TABLE `role` DISABLE KEYS */;
INSERT INTO `role` VALUES (1,'admin','ADMIN','2019-03-31 17:00:00','2019-03-31 17:00:00',NULL,NULL),(2,'user','USER','2019-03-31 17:00:00','2019-03-31 17:00:00',NULL,NULL);
/*!40000 ALTER TABLE `role` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `username` varchar(150) NOT NULL,
  `password` varchar(150) NOT NULL,
  `fullname` varchar(150) DEFAULT NULL,
  `status` int NOT NULL,
  `roleid` bigint NOT NULL,
  `createddate` timestamp NULL DEFAULT NULL,
  `modifieddate` timestamp NULL DEFAULT NULL,
  `createdby` varchar(255) DEFAULT NULL,
  `modifiedby` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_user_role` (`roleid`),
  CONSTRAINT `fk_user_role` FOREIGN KEY (`roleid`) REFERENCES `role` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES (1,'hieu','123','nhieu',1,1,'2019-03-31 17:00:00','2019-03-31 17:00:00','',''),(2,'huy','123','wqe',1,2,'2019-03-31 17:00:00','2019-03-31 17:00:00','',''),(3,'hoa','123','qwe',1,2,'2019-03-31 17:00:00','2019-03-31 17:00:00','',''),(4,'hien','123','ewq',1,2,'2019-03-31 17:00:00','2019-03-31 17:00:00','',NULL),(6,'65Kin','123','Kin',1,2,NULL,NULL,NULL,NULL);
/*!40000 ALTER TABLE `user` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2021-06-28  1:10:18
