/*
SQLyog Community v11.31 (32 bit)
MySQL - 5.7.19-log : Database - myhouse
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`myhouse` /*!40100 DEFAULT CHARACTER SET utf8 */;

USE `myhouse`;

/*Table structure for table `bonustype` */

DROP TABLE IF EXISTS `bonustype`;

CREATE TABLE `bonustype` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(300) NOT NULL,
  `note` varchar(1000) NOT NULL,
  `parentId` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;

/*Data for the table `bonustype` */

insert  into `bonustype`(`id`,`name`,`note`,`parentId`) values (1,'bonus 1','ha ha ha ha',0),(2,'bonus 1.1','he he he e',1),(3,'bonus 2','asdfsaf safd sf ',0),(4,'bonus 2.1','ha ',3),(5,'bonus 1.2','sadfasfsa',1),(6,'bonus 1.1.1','thuong 1.1.1',2);

/*Table structure for table `category` */

DROP TABLE IF EXISTS `category`;

CREATE TABLE `category` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `categoryName` varchar(500) NOT NULL,
  `parentId` int(11) NOT NULL DEFAULT '0',
  `templateId` int(11) NOT NULL DEFAULT '0',
  `languageId` varchar(100) NOT NULL DEFAULT '1',
  `order` int(10) unsigned NOT NULL DEFAULT '0',
  `hostId` int(11) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`),
  KEY `templateId` (`templateId`)
) ENGINE=MyISAM AUTO_INCREMENT=22 DEFAULT CHARSET=utf8;

/*Data for the table `category` */

insert  into `category`(`id`,`categoryName`,`parentId`,`templateId`,`languageId`,`order`,`hostId`) values (1,'News',0,1,'vi',0,1),(21,'Product List',4,0,'vi',0,1),(4,'Products',0,1,'vi',0,1),(8,'Technologies',1,0,'vi',0,1),(12,'E-category 1',0,0,'en',0,1),(13,'E-category 2',0,0,'en',0,1);

/*Table structure for table `children` */

DROP TABLE IF EXISTS `children`;

CREATE TABLE `children` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `fatherId` int(10) unsigned DEFAULT NULL,
  `motherId` int(10) unsigned DEFAULT NULL,
  `birthDay` datetime NOT NULL,
  `studenTypeId` int(10) unsigned NOT NULL,
  `schools` varchar(500) NOT NULL,
  `note` varchar(1000) NOT NULL,
  `isDeleted` tinyint(1) NOT NULL DEFAULT '0',
  `deletedDate` datetime DEFAULT NULL,
  `deletedBy` int(10) unsigned DEFAULT '0',
  `modifiedDate` datetime DEFAULT NULL,
  `modifiedBy` int(10) unsigned DEFAULT '0',
  `fullName` varchar(300) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;

/*Data for the table `children` */

insert  into `children`(`id`,`fatherId`,`motherId`,`birthDay`,`studenTypeId`,`schools`,`note`,`isDeleted`,`deletedDate`,`deletedBy`,`modifiedDate`,`modifiedBy`,`fullName`) values (1,4,5,'0000-00-00 00:00:00',1,'am','afasfsaf',0,NULL,0,'0000-00-00 00:00:00',0,'he he'),(2,3,1,'2005-05-12 00:00:00',3,'Hoang Mai','kfjlksdf',0,NULL,0,NULL,0,'Nguyen Van B'),(3,3,1,'2005-12-12 00:00:00',2,'BiEBFt c?1B0EDDi tr? nED7i ?111au v?kh? khi thEA5y m?h hEA1nh ph?','CEA7n phEA3i sED1ng ?111EC3 nh? thEA5y m?h c?169ng biEBFt c?h ?111ED5i thay\nBiEBFt c?1B0EDDi tr? nED7i ?111au v?kh? khi thEA5y m?h hEA1nh ph?026',0,NULL,0,NULL,0,'CEA7n phEA3i sED1ng '),(4,2,2,'2011-11-08 00:00:00',1,'th?h c?g','',0,NULL,0,NULL,0,'h?gi'),(5,2,3,'2011-11-05 00:00:00',1,'dddd','sdfa sdfasfd af',0,NULL,0,NULL,0,'ddddd'),(6,4,3,'2011-11-04 00:00:00',1,'thEED coi','CEE7 chuED1i chEA5m muED1i ',0,NULL,0,NULL,0,'thEED coi'),(7,4,5,'2011-11-01 00:00:00',1,'ý tưởng.','ý tưởng.',0,NULL,0,NULL,0,'ý tưởng.');

/*Table structure for table `coefficientssalary` */

DROP TABLE IF EXISTS `coefficientssalary`;

CREATE TABLE `coefficientssalary` (
  `id` int(11) NOT NULL,
  `coefficients` double NOT NULL,
  `salary` double NOT NULL,
  `description` varchar(500) CHARACTER SET utf8 NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

/*Data for the table `coefficientssalary` */

insert  into `coefficientssalary`(`id`,`coefficients`,`salary`,`description`) values (5,5,4000000,'he so luong bac 5'),(4,4,3200000,'he so luong bac 4'),(3,3,2400000,'he so luon g bac 3'),(2,2,1600000,'he so luong bac 2'),(1,1,800000,'he so luong bac 1');

/*Table structure for table `comment` */

DROP TABLE IF EXISTS `comment`;

CREATE TABLE `comment` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `webContentId` int(11) NOT NULL,
  `createdBy` int(11) NOT NULL,
  `createddate` date NOT NULL,
  `content` varchar(10000) NOT NULL,
  `isDeleted` tinyint(1) NOT NULL DEFAULT '0',
  `deletedDate` date DEFAULT NULL,
  `deletedBy` int(11) DEFAULT NULL,
  `isHidden` tinyint(1) NOT NULL DEFAULT '0',
  `isApproved` tinyint(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`),
  KEY `webContentId` (`webContentId`),
  KEY `createdBy` (`createdBy`),
  KEY `deletedBy` (`deletedBy`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

/*Data for the table `comment` */

insert  into `comment`(`id`,`webContentId`,`createdBy`,`createddate`,`content`,`isDeleted`,`deletedDate`,`deletedBy`,`isHidden`,`isApproved`) values (1,6,1,'2015-07-05','the second comment',0,NULL,NULL,0,1),(2,6,1,'2015-07-05','test comment',0,NULL,NULL,0,1),(3,15,1,'2015-09-05','Comment 20150905',0,NULL,NULL,0,1);

/*Table structure for table `contracttype` */

DROP TABLE IF EXISTS `contracttype`;

CREATE TABLE `contracttype` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(200) NOT NULL,
  `description` varchar(500) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=8 DEFAULT CHARSET=latin1;

/*Data for the table `contracttype` */

insert  into `contracttype`(`id`,`name`,`description`) values (7,'Hong dong 3 nam','hop dong keo dai trong 36 thang'),(6,'Hop dong 2 nam','hop dong keo dai trong 24 thang'),(5,'Hop dong 1  nam','hop dong keo dai trong 12 thang'),(4,'Hop dong ko thoi han','ko xac dinh thoi han ket thuc'),(3,'Hop dong ngan han','Hop dong theo thoi vu, cong viec'),(2,'Hop dong thu viec 1 thang','Thu viec trong 1 thang'),(1,'Hop dong thu viec 2 thang','thu viec trong 2 thang');

/*Table structure for table `departments` */

DROP TABLE IF EXISTS `departments`;

CREATE TABLE `departments` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(200) NOT NULL,
  `address` varchar(1000) NOT NULL,
  `phoneNumber` varchar(20) NOT NULL,
  `note` varchar(1000) DEFAULT NULL,
  `isDeleted` tinyint(1) NOT NULL DEFAULT '0',
  `deletedDate` datetime DEFAULT NULL,
  `deletedBy` int(10) unsigned DEFAULT NULL,
  `modifiedDate` datetime DEFAULT NULL,
  `modifiedBy` int(10) unsigned DEFAULT NULL,
  `parentId` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=9 DEFAULT CHARSET=utf8 COMMENT='phong-ban lam viec';

/*Data for the table `departments` */

insert  into `departments`(`id`,`name`,`address`,`phoneNumber`,`note`,`isDeleted`,`deletedDate`,`deletedBy`,`modifiedDate`,`modifiedBy`,`parentId`) values (1,'ThEED xem','Ha Noi','123456789','h? h?',0,NULL,0,NULL,0,0),(2,'department3','Hai Phong','123455443','note',0,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0,0),(3,'department2','Ha Noi','213141515','note',0,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0,0),(4,'department 1.1','ha noi','098709809','ahflkjasf aslkdjf aslfj',0,NULL,0,NULL,0,1),(5,'departmen 1.2','ha noi','098765432','adfjaslkdfj',0,NULL,0,NULL,0,1),(6,'department 4','ha noi','390948','akjfklsajdf',0,NULL,0,NULL,0,0),(7,'department 1.1.1','ha noi','980984958','lksjaflkasjdfsf',0,NULL,0,NULL,0,4),(8,'department 1.1.2','kahfdlks','9457345809','lkfjlksdf',0,NULL,0,NULL,0,4);

/*Table structure for table `hostname` */

DROP TABLE IF EXISTS `hostname`;

CREATE TABLE `hostname` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `hostName` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

/*Data for the table `hostname` */

insert  into `hostname`(`id`,`hostName`) values (1,'localhost:8080');

/*Table structure for table `informations` */

DROP TABLE IF EXISTS `informations`;

CREATE TABLE `informations` (
  `inforId` int(11) NOT NULL AUTO_INCREMENT,
  `webContentId` int(11) NOT NULL,
  `header` varchar(500) NOT NULL,
  `summary` varchar(2000) NOT NULL,
  `content` longtext NOT NULL,
  PRIMARY KEY (`inforId`),
  KEY `webContentId` (`webContentId`)
) ENGINE=MyISAM AUTO_INCREMENT=16 DEFAULT CHARSET=utf8;

/*Data for the table `informations` */

insert  into `informations`(`inforId`,`webContentId`,`header`,`summary`,`content`) values (1,1,'header of information 1','<p>summary of information 1</p>','<p>main content of information 1</p>'),(2,2,'header of information 2','<p>summary of information 2</p>','<p>main content of information 2</p>'),(3,3,'header of information 3','<p>summary of information 3</p>','<p>main content of information 3</p>'),(4,4,'header of information 4','<p>summary of information 4</p>','<p>main content of information 4</p>'),(5,5,'header of information 5','<p>summary of information 5</p>','<p>main content of information 5</p>'),(6,6,'new header','<p>new summary</p>','<p>new content</p>'),(7,7,'new information in category 2','<p>summary for this information</p>','<p>content</p>'),(8,7,'new information in category 2','<p>summary for this information</p>','<p>content</p>'),(9,10,'Hệ thống Quản lý Nhân sự - eHRM (Human Resource Management System)','<p>Tự cấu h&igrave;nh linh hoạt theo m&ocirc; h&igrave;nh hoạt động của bạn</p>','<!-- Container (About Section) -->\r\n	<div id=\"eHRM_OverView\" class=\"container-fluid bg-grey text-center\">\r\n		<h2>Hệ thống Quản lý Nhân sự - eHRM (Human Resource Management System)</h2>\r\n		<div class=\"row\">\r\n			<div class=\"col-sm-4\">\r\n				<img src=\"../../UserFiles//Image/eHRM_OverView.jpg\" alt=\"eHRM\" style=\"width: 100%\">\r\n			</div>\r\n			<div class=\"col-sm-4\">\r\n				<img src=\"../../UserFiles//Image/saokhue_cup.png\" alt=\"eHRM\" style=\"padding-top: 35px; width: 30%; min-width: 136px;\"><br/>\r\n				<strong>\"Giải thưởng Sao Khuê 2014 dành cho phần mềm Quản lý nhân sự eHRM\"</strong>\r\n			</div>\r\n			<div class=\"col-sm-4\">\r\n				<img src=\"../../UserFiles//Image/Quan ly nhan su.png\" alt=\"eHRM\" style=\"width: 100%; padding-top: 35px;\">\r\n			</div>\r\n		</div>\r\n	</div>\r\n\r\n	<!-- Container (1. Quản lý thông tin nhân viên) -->\r\n	<div id=\"employeInformation\" class=\"container-fluid text-center\">\r\n		<h2><strong>1. Quản lý thông tin nhân viên</strong></h2>\r\n		<div class=\"row slideanim\">\r\n			<div class=\"col-sm-4\">\r\n				<h4>All in One</h4>\r\n				<p>Điều hành công ty ngay cả khi bạn không ở văn phòng</p>\r\n			</div>\r\n			<div class=\"col-sm-8\">\r\n				<img src=\"../../UserFiles//Image/eHRM_StaffInfor.PNG\" alt=\"eHRM\" width=\"100%\">\r\n			</div>\r\n		</div>\r\n	</div>\r\n\r\n	<!-- Container (2. Tính lương) -->\r\n	<div id=\"salary\" class=\"container-fluid text-center bg-grey\">\r\n		<h2><strong>2. Tính lương</strong></h2>\r\n		<div class=\"row text-center slideanim\">\r\n			<div class=\"col-sm-7\">\r\n				<img src=\"../../UserFiles//Image/eHRM_monthlySalary.PNG\" alt=\"Salary\" width=\"100%\">\r\n			</div>\r\n			<div class=\"col-sm-5\">\r\n				<p>\r\n					<strong>Quản lý Nhân sự</strong>\r\n				</p>\r\n				<p>Khối nhà máy, ngân hàng của Nhật; Văn phòng Đại diện tại Việt Nam</p>\r\n			</div>\r\n		</div>\r\n	</div>\r\n	\r\n	<!-- Container (3. Quy trình Xử lý các yêu cầu) -->\r\n	<div id=\"RequestApprovalProcess\" class=\"container-fluid text-center\">\r\n		<h2><strong>3. Quy trình Xử lý các yêu cầu</strong></h2>\r\n		<div class=\"row slideanim\">\r\n			<div class=\"col-sm-5\">\r\n				<img src=\"../../UserFiles//Image/eHRM_RequestProcess1.PNG\" alt=\"eHRM\" width=\"100%\">\r\n			</div>\r\n			<div class=\"col-sm-2\">Xây dựng quy trình phê duyệt theo đúng với mô hình của bạn</div>\r\n			<div class=\"col-sm-5\">\r\n				<img src=\"../../UserFiles//Image/eHRM_RequestProcess2.PNG\" alt=\"eHRM\" width=\"100%\" style=\"padding-top: 20px;\">\r\n			</div>\r\n		</div>\r\n	</div>\r\n	\r\n	<!-- Container (4. Quản lý nghỉ phép/ vắng mặt) -->\r\n	<div id=\"LeaveRequest\" class=\"container-fluid text-center bg-grey\">\r\n		<h2><strong>4. Quản lý nghỉ phép/ vắng mặt</strong></h2>\r\n		<div class=\"row text-center slideanim\">\r\n			<div class=\"col-sm-7\">\r\n				<img src=\"../../UserFiles//Image/eHRM_leaveRequestManagement.png\" alt=\"Salary\" width=\"100%\">\r\n			</div>\r\n			<div class=\"col-sm-5\">\r\n				<p>\r\n					<strong>Đăng ký nghỉ phép và Phê duyệt yêu cầu nghỉ phép</strong>\r\n				</p>\r\n				<p>Khối nhà máy, ngân hàng của Nhật; Văn phòng Đại diện tại Việt Nam</p>\r\n			</div>\r\n		</div>\r\n	</div>\r\n	\r\n	<!-- Container (5. Quản lý Đi công tác và công tác phí) -->\r\n	<div id=\"TripRequest\" class=\"container-fluid text-center\">\r\n		<h2><strong>5. Quản lý Đi công tác và công tác phí</strong></h2>\r\n		<div class=\"row text-center slideanim\">\r\n			<div class=\"col-sm-5\">\r\n				<p>\r\n					<strong>Quản lý Công tác và tính toán công tác phí</strong>\r\n				</p>\r\n				<p>Khối nhà máy, ngân hàng của Nhật; Văn phòng Đại diện tại Việt Nam</p>\r\n			</div>\r\n			<div class=\"col-sm-7\">\r\n				<img src=\"../../UserFiles//Image/eHRM_tripManagement.PNG\" alt=\"Salary\" width=\"100%\">\r\n			</div>\r\n		</div>\r\n	</div>\r\n	\r\n	<!-- Container (6. Quản lý làm ngoài giờ) -->\r\n	<div id=\"OTRequest\" class=\"container-fluid text-center bg-grey\">\r\n		<h2><strong>6. Quản lý làm ngoài giờ</strong></h2>\r\n		<div class=\"row text-center slideanim\">\r\n			<div class=\"col-sm-8\">\r\n				<img src=\"../../UserFiles//Image/eHRM_OTManagement.png\" alt=\"Salary\" width=\"100%\">\r\n			</div>\r\n			<div class=\"col-sm-4\">\r\n				<p>\r\n					<strong>Đăng ký nghỉ phép và Phê duyệt yêu cầu nghỉ phép</strong>\r\n				</p>\r\n				<p>Khối nhà máy, ngân hàng của Nhật; Văn phòng Đại diện tại Việt Nam</p>\r\n			</div>\r\n		</div>\r\n	</div>\r\n	\r\n	<!-- Container (7. Đến muộn – Về sớm – Ra giữa giờ) -->\r\n	<div id=\"LateIn_EarlyOut\" class=\"container-fluid text-center\">\r\n		<h2><strong>7. Đến muộn – Về sớm – Ra giữa giờ</strong></h2>\r\n		<div class=\"row text-center slideanim\">\r\n			<div class=\"col-sm-5\">\r\n				<p>\r\n					<strong>Quản lý việc đến sớm, về muộn, ra khỏi văn phòng giữa giờ...</strong>\r\n				</p>\r\n				<p>Khối nhà máy, ngân hàng của Nhật; Văn phòng Đại diện tại Việt Nam</p>\r\n			</div>\r\n			<div class=\"col-sm-7\">\r\n				<img src=\"../../UserFiles//Image/eHRM_LateIn_EarlyOut_GoOut.png\" alt=\"Salary\" width=\"100%\">\r\n			</div>\r\n		</div>\r\n	</div>\r\n	\r\n	<!-- Container (8. Chấm công – Tự động) -->\r\n	<div id=\"TimeAttendace_Automation\" class=\"container-fluid text-center bg-grey\">\r\n		<h2><strong>8. Chấm công – Tự động</strong></h2>\r\n		<div class=\"row text-center slideanim\">\r\n			<div class=\"col-sm-7\">\r\n				<img src=\"../../UserFiles//Image/eHRM_TimeAttendance_Automation.png\" alt=\"Salary\" width=\"100%\">\r\n			</div>\r\n			<div class=\"col-sm-5\">\r\n				<p>\r\n					<strong>Đăng ký nghỉ phép và Phê duyệt yêu cầu nghỉ phép</strong>\r\n				</p>\r\n				<p>Khối nhà máy, ngân hàng của Nhật; Văn phòng Đại diện tại Việt Nam</p>\r\n			</div>\r\n		</div>\r\n	</div>\r\n	\r\n	<!-- Container (9. Chấm công – Timesheet) -->\r\n	<div id=\"TimeAttendance_TimeSheet\" class=\"container-fluid text-center\">\r\n		<h2><strong>9. Chấm công – Timesheet</strong></h2>\r\n		<div class=\"row text-center slideanim\">\r\n			<div class=\"col-sm-5\">\r\n				<p>\r\n					<strong>Quản lý việc đến sớm, về muộn, ra khỏi văn phòng giữa giờ...</strong>\r\n				</p>\r\n				<p>Khối nhà máy, ngân hàng của Nhật; Văn phòng Đại diện tại Việt Nam</p>\r\n			</div>\r\n			<div class=\"col-sm-7\">\r\n				<img src=\"../../UserFiles//Image/eHRM_TimeAttendance_TImeSheet.png\" alt=\"Salary\" width=\"100%\">\r\n			</div>\r\n		</div>\r\n	</div>\r\n	\r\n	<!-- Container (10. Quy trình xử lý Công - Lương) -->\r\n	<div id=\"SalaryProcess\" class=\"container-fluid text-center bg-grey\">\r\n		<h2><strong>10. Quy trình xử lý Công - Lương</strong></h2>\r\n		<div class=\"row text-center slideanim\">\r\n			<div class=\"col-sm-6\">\r\n				<img src=\"../../UserFiles//Image/eHRM_SalaryProcess.png\" alt=\"Salary\" width=\"100%\">\r\n			</div>\r\n			<div class=\"col-sm-6\">\r\n				<p>\r\n					<strong>Đăng ký nghỉ phép và Phê duyệt yêu cầu nghỉ phép</strong>\r\n				</p>\r\n				<p>Khối nhà máy, ngân hàng của Nhật; Văn phòng Đại diện tại Việt Nam</p>\r\n			</div>\r\n		</div>\r\n	</div>\r\n	\r\n	<!-- Container (11. more than...) -->\r\n	<div id=\"HRSupport\" class=\"container-fluid\">\r\n		<h2 class=\"text-center\"><strong>Hỗ trợ cán bộ nhân sự nhiều hơn nữa ...</strong></h2>\r\n		<div class=\"row slideanim\">\r\n			<div class=\"col-sm-2\">\r\n				<h3>\r\n					<strong>Đánh giá nhân sự</strong>\r\n				</h3>\r\n				<ul>\r\n					<li>Quản lý mục tiêu cá nhân</li>\r\n					<li>Đánh giá hiệu quả công việc</li>\r\n					<li>Đánh giá nhân viên theo nhiều cấp</li>\r\n					<li>...</li>\r\n				</ul>\r\n			</div>\r\n			<div class=\"col-sm-3\">\r\n				<h3>\r\n					<strong>Báo cáo</strong>\r\n				</h3>\r\n				<ul>\r\n					<li>Xuất báo cáo ở nhiều định dạng: web, word, excel, pdf</li>\r\n					<li>Báo cáo nhân sự hàng tháng</li>\r\n					<li>Bảng lương tháng</li>\r\n					<li>Báo cáo chấm công hàng ngày</li>\r\n					<li>Báo cáo quyết toán thuế</li>\r\n					<li>...</li>\r\n				</ul>\r\n			</div>\r\n			<div class=\"col-sm-3\">\r\n				<h3>\r\n					<strong>Nhắc nhở sự kiện</strong>\r\n				</h3>\r\n				<ul>\r\n					<li>Cảnh báo sắp hết hạn hợp đồng</li>\r\n					<li>Thông báo có yêu cầu cần phê duyệt</li>\r\n					<li>Thông báo trạng thái xử lý các yêu cầu gửi đi (nghỉ phép, đi công tác, OT ...)</li>\r\n					<li>Nhắc nhở khai TimeSheet</li>\r\n					<li>...</li>\r\n				</ul>\r\n			</div>\r\n			<div class=\"col-sm-4\">\r\n				<h3>\r\n					<strong>Thiết lập các thông số cho riêng bạn</strong>\r\n				</h3>\r\n				<ul>\r\n					<li>Cấu hình hệ thống: Tài khoản, Phân quyền, Địa điểm đặt chi nhánh, Cấu trúc đơn vị - tổ chức, ...</li>\r\n					<li>Cấu hình quản lý nhân sự: quốc gia, chức danh, ...</li>\r\n					<li>Cấu hình lương: Năm tài chính, Danh sách các khoản thu nhập, danh sách các khoản giảm trừ, ...</li>\r\n					<li>Cấu hình nghỉ: Loại nghỉ, Ngày nghỉ lễ quốc gia, ...</li>\r\n					<li>Cấu hình chấm công: Lịch làm việc trong năm, Các ca làm việc, ...</li>\r\n					<li>...</li>\r\n				</ul>\r\n			</div>\r\n		</div>\r\n	</div>\r\n	\r\n	<!-- Container (Portfolio Section) -->\r\n	<div id=\"portfolio\" class=\"container-fluid text-center bg-grey\">\r\n		<h2>Danh mục</h2>\r\n		<h4>Một số dự án đã triển khai</h4>\r\n		<div class=\"row text-center slideanim\">\r\n			<div class=\"col-sm-4\">\r\n				<div class=\"thumbnail\">\r\n					<div style=\"height: 351px;\">\r\n						<img src=\"../../UserFiles//Image/TDKT-BTC.PNG\" alt=\"Paris\" width=\"400\" height=\"300\">\r\n					</div>\r\n					<p>\r\n						<strong>Quản lý Thi đua - Khen thưởng</strong>\r\n					</p>\r\n					<p>Bộ Tài chính</p>\r\n				</div>\r\n			</div>\r\n			<div class=\"col-sm-4\">\r\n				<div class=\"thumbnail\">\r\n					<div style=\"height: 351px;\">\r\n						<img src=\"../../UserFiles//Image/eHRM-Pol.PNG\" alt=\"New York\" width=\"400\" height=\"300\">\r\n					</div>\r\n					<p>\r\n						<strong>Quản lý Nhân sự</strong>\r\n					</p>\r\n					<p>Khối nhà máy, ngân hàng của Nhật; Văn phòng Đại diện tại Việt Nam</p>\r\n				</div>\r\n			</div>\r\n			<div class=\"col-sm-4\">\r\n				<div class=\"thumbnail\">\r\n					<div style=\"height: 351px;\">\r\n						<img src=\"../../UserFiles//Image/wms-hanoitv.PNG\" alt=\"San Francisco\" width=\"400\" height=\"300\">\r\n					</div>\r\n					<p>\r\n						<strong>Quản lý Quy trình sản xuất</strong>\r\n					</p>\r\n					<p>Đài Phát thanh và Truyền hình Hà Nội</p>\r\n				</div>\r\n			</div>\r\n		</div>\r\n	</div>'),(10,11,'thu nghiem 1','<p>&aacute; flkasdfhklajfkljwqeoif hsdo</p>','<p>a s;kldjfoiqwehlksdhjksl fhds</p>'),(11,12,'thử nghiệm 2','<p>tổng quan về th&ocirc;ng tin thử nghiệm 2</p>','<p>nooij dung ve thong tin thu nghiem nay</p>'),(12,13,'asdfasf ưef','<p>&aacute; fdă&egrave;&nbsp;</p>','<p>a fwaef</p>'),(13,14,'ádfasdf','<p>as fase fsdafeưf</p>','<p>a fasfwae fsdafưerf</p>'),(14,15,'Bài viết 20150905','<p>T&oacute;m tắt nội dung b&agrave;i viết</p>','<p>Nội dung chi tiết b&agrave;i viết</p>'),(15,16,'Test','<p>N&ocirc;i dung m&ocirc; tả ngắng gọn</p>','<p>Chi tiết</p>');

/*Table structure for table `language` */

DROP TABLE IF EXISTS `language`;

CREATE TABLE `language` (
  `name` varchar(100) NOT NULL,
  `flag` varchar(500) NOT NULL,
  `displayName` varchar(100) NOT NULL DEFAULT 'language',
  PRIMARY KEY (`name`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

/*Data for the table `language` */

insert  into `language`(`name`,`flag`,`displayName`) values ('vi','flagsVietNamIcon','Vietnamese'),('en','flagsEnglandIcon','English');

/*Table structure for table `orderdetail` */

DROP TABLE IF EXISTS `orderdetail`;

CREATE TABLE `orderdetail` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `orderId` int(11) NOT NULL,
  `webContentId` int(11) NOT NULL,
  `numberOfProduct` int(11) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`),
  KEY `orderId` (`orderId`),
  KEY `productId` (`webContentId`)
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

/*Data for the table `orderdetail` */

insert  into `orderdetail`(`id`,`orderId`,`webContentId`,`numberOfProduct`) values (1,1,9,1),(2,2,9,1),(3,1,8,1);

/*Table structure for table `orders` */

DROP TABLE IF EXISTS `orders`;

CREATE TABLE `orders` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `orderKey` varchar(100) NOT NULL,
  `fullName` varchar(100) NOT NULL,
  `address` varchar(1000) NOT NULL,
  `serviceId` int(11) NOT NULL,
  `paymentId` int(11) NOT NULL,
  `desposite` double NOT NULL DEFAULT '0',
  `timeOfDeliver` date DEFAULT NULL,
  `note` varchar(1000) NOT NULL DEFAULT 'no note',
  `phoneNumber` varchar(30) NOT NULL,
  `vat` double NOT NULL DEFAULT '0.1',
  `createdDate` date NOT NULL,
  `isReaded` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `serviceId` (`serviceId`),
  KEY `paymentId` (`paymentId`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

/*Data for the table `orders` */

insert  into `orders`(`id`,`orderKey`,`fullName`,`address`,`serviceId`,`paymentId`,`desposite`,`timeOfDeliver`,`note`,`phoneNumber`,`vat`,`createdDate`,`isReaded`) values (1,'order1311710514249','root demo','Yen Hoa, Cau Giay,Ha Noi',1,1,0,'2011-08-02',' ','null',0.1,'2011-08-02',0),(2,'order1312554492476','root demo','Yen Hoa, Cau Giay,Ha Noi',1,1,0,'2011-08-02',' ','123456789',0.1,'2011-08-02',0);

/*Table structure for table `paymentmethod` */

DROP TABLE IF EXISTS `paymentmethod`;

CREATE TABLE `paymentmethod` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(500) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

/*Data for the table `paymentmethod` */

/*Table structure for table `permission` */

DROP TABLE IF EXISTS `permission`;

CREATE TABLE `permission` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `permissionName` varchar(1000) NOT NULL,
  `description` varchar(2000) NOT NULL,
  `isManagerUser` tinyint(1) NOT NULL DEFAULT '0',
  `isManagerCategory` tinyint(1) NOT NULL DEFAULT '0',
  `isManagerPermission` tinyint(1) NOT NULL DEFAULT '0',
  `canAddProduct` tinyint(1) NOT NULL DEFAULT '0',
  `canAddShareFile` tinyint(1) NOT NULL DEFAULT '0',
  `canAddInformation` tinyint(1) NOT NULL DEFAULT '0',
  `isOrderReportManager` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;

/*Data for the table `permission` */

insert  into `permission`(`id`,`permissionName`,`description`,`isManagerUser`,`isManagerCategory`,`isManagerPermission`,`canAddProduct`,`canAddShareFile`,`canAddInformation`,`isOrderReportManager`) values (1,'root','only one user is root',1,1,1,1,1,1,1),(2,'Admin','Admin of blog system',1,1,0,1,1,1,0),(3,'Moderator','Moderator',0,1,0,1,1,1,0),(4,'VIP','very importal user',0,0,0,0,0,1,0),(5,'Member','member of blog',0,0,0,0,0,1,0),(6,'User','th?h vi? b?h th?1B0EDDng',0,0,0,0,0,0,0);

/*Table structure for table `permissionview` */

DROP TABLE IF EXISTS `permissionview`;

CREATE TABLE `permissionview` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `webContentId` int(11) NOT NULL,
  `permissionId` int(11) NOT NULL DEFAULT '0',
  `userId` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `webContentId` (`webContentId`),
  KEY `permissionId` (`permissionId`)
) ENGINE=MyISAM AUTO_INCREMENT=23 DEFAULT CHARSET=utf8;

/*Data for the table `permissionview` */

insert  into `permissionview`(`id`,`webContentId`,`permissionId`,`userId`) values (1,1,0,0),(2,2,0,0),(3,3,0,0),(4,6,0,0),(5,5,0,0),(6,4,0,0),(7,7,0,0),(8,8,0,0),(9,9,0,0),(10,10,0,0),(11,11,0,0),(12,12,1,0),(13,13,1,0),(14,13,2,0),(15,13,3,0),(16,13,4,0),(20,12,2,0),(18,14,0,0),(19,15,0,0),(21,12,3,0),(22,16,0,0);

/*Table structure for table `position` */

DROP TABLE IF EXISTS `position`;

CREATE TABLE `position` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(500) NOT NULL,
  `discription` varchar(1000) NOT NULL,
  `createdBy` int(11) NOT NULL,
  `createdDate` datetime NOT NULL,
  `isDeleted` tinyint(1) NOT NULL DEFAULT '0',
  `deletedBy` int(11) DEFAULT NULL,
  `deletedDate` datetime DEFAULT NULL,
  `editedBy` int(11) DEFAULT NULL,
  `editedDate` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;

/*Data for the table `position` */

insert  into `position`(`id`,`name`,`discription`,`createdBy`,`createdDate`,`isDeleted`,`deletedBy`,`deletedDate`,`editedBy`,`editedDate`) values (1,'tr?1B0EDFng ph?g','mo ta cho position 1',0,'0000-00-00 00:00:00',0,NULL,NULL,NULL,NULL);

/*Table structure for table `product` */

DROP TABLE IF EXISTS `product`;

CREATE TABLE `product` (
  `productId` int(11) NOT NULL AUTO_INCREMENT,
  `webContentId` int(11) NOT NULL,
  `productKey` varchar(500) DEFAULT NULL,
  `productName` varchar(500) NOT NULL,
  `productDiscription` varchar(2000) NOT NULL,
  `cost` double NOT NULL,
  `isNewProduct` tinyint(1) NOT NULL DEFAULT '1',
  `havesale` tinyint(1) NOT NULL DEFAULT '0',
  `costSale` double DEFAULT NULL,
  `topInWeek` tinyint(1) NOT NULL DEFAULT '0',
  `topInMonth` tinyint(1) NOT NULL DEFAULT '0',
  `numberOfProduct` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`productId`),
  KEY `webContentId` (`webContentId`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

/*Data for the table `product` */

insert  into `product`(`productId`,`webContentId`,`productKey`,`productName`,`productDiscription`,`cost`,`isNewProduct`,`havesale`,`costSale`,`topInWeek`,`topInMonth`,`numberOfProduct`) values (1,8,'SP01','San pham so 1','<p>thong tin san pham</p>',150000,1,0,10,0,0,1000),(2,9,'SP02','San pham 02','<p>Thong tin chi tiet san pham</p>',250000,1,0,10,0,0,110);

/*Table structure for table `service` */

DROP TABLE IF EXISTS `service`;

CREATE TABLE `service` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `servicename` varchar(500) NOT NULL,
  `cost` double NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

/*Data for the table `service` */

/*Table structure for table `sharefile` */

DROP TABLE IF EXISTS `sharefile`;

CREATE TABLE `sharefile` (
  `shareId` int(11) NOT NULL AUTO_INCREMENT,
  `webContentId` int(11) NOT NULL,
  `fileUrl` varchar(500) NOT NULL,
  `author` varchar(5000) NOT NULL DEFAULT 'unKnow',
  `typeShareId` int(11) NOT NULL,
  PRIMARY KEY (`shareId`),
  KEY `webContentId` (`webContentId`),
  KEY `typeShareId` (`typeShareId`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

/*Data for the table `sharefile` */

/*Table structure for table `sharetypes` */

DROP TABLE IF EXISTS `sharetypes`;

CREATE TABLE `sharetypes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(500) NOT NULL,
  `description` varchar(1000) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

/*Data for the table `sharetypes` */

insert  into `sharetypes`(`id`,`name`,`description`) values (1,'share Images','Share Image'),(2,'Share Datas','Share Datas'),(3,'Share Video','Share Video');

/*Table structure for table `staffinfor` */

DROP TABLE IF EXISTS `staffinfor`;

CREATE TABLE `staffinfor` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `userId` int(10) unsigned NOT NULL,
  `departmentId` int(10) unsigned NOT NULL,
  `dateStartWorking` datetime NOT NULL,
  `dateFinishWorking` datetime DEFAULT NULL,
  `dateJoinUnion` datetime DEFAULT NULL COMMENT 'ngày vào công doàn.',
  `dateStartPayUnion` datetime DEFAULT NULL COMMENT 'ngay bat dau dong doan phy',
  `dateOutUnion` datetime DEFAULT NULL COMMENT 'ngay ra khoi cong doan',
  `isDeleted` tinyint(1) NOT NULL,
  `modifiedDate` datetime NOT NULL,
  `modifiedBy` int(10) unsigned NOT NULL,
  `deletedBy` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

/*Data for the table `staffinfor` */

/*Table structure for table `studenttype` */

DROP TABLE IF EXISTS `studenttype`;

CREATE TABLE `studenttype` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `typeName` varchar(500) NOT NULL,
  `note` varchar(1000) DEFAULT NULL,
  `isDeleted` tinyint(1) NOT NULL DEFAULT '0',
  `deletedDate` datetime DEFAULT NULL,
  `deletedBy` int(10) unsigned DEFAULT NULL,
  `modifiedDate` datetime DEFAULT NULL,
  `modifiedBy` int(10) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

/*Data for the table `studenttype` */

/*Table structure for table `studentypeyear` */

DROP TABLE IF EXISTS `studentypeyear`;

CREATE TABLE `studentypeyear` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `typeId` int(11) NOT NULL,
  `childId` int(11) NOT NULL,
  `year` date NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

/*Data for the table `studentypeyear` */

/*Table structure for table `template` */

DROP TABLE IF EXISTS `template`;

CREATE TABLE `template` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(500) NOT NULL,
  `pageUrl` varchar(500) NOT NULL,
  `imageUrl` varchar(500) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

/*Data for the table `template` */

insert  into `template`(`id`,`name`,`pageUrl`,`imageUrl`) values (1,'Default Template','','');

/*Table structure for table `typestudent` */

DROP TABLE IF EXISTS `typestudent`;

CREATE TABLE `typestudent` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `typeStudent` varchar(500) NOT NULL,
  `description` varchar(1000) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;

/*Data for the table `typestudent` */

insert  into `typestudent`(`id`,`typeStudent`,`description`) values (1,'kha\'','loai kha'),(2,'Gioi','loai hoc sinh joi'),(3,'Trung Binh','loai hoc sinh trung binh'),(4,'Suat xac','Suat xac');

/*Table structure for table `unioninfor` */

DROP TABLE IF EXISTS `unioninfor`;

CREATE TABLE `unioninfor` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `userId` int(11) NOT NULL,
  `joinedDate` datetime NOT NULL,
  `startedDate` datetime NOT NULL,
  `outedDate` datetime DEFAULT NULL,
  `contractTypeId` int(11) NOT NULL,
  `startedDateContract` date DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;

/*Data for the table `unioninfor` */

insert  into `unioninfor`(`id`,`userId`,`joinedDate`,`startedDate`,`outedDate`,`contractTypeId`,`startedDateContract`) values (1,4,'1999-01-01 00:00:00','1999-02-01 00:00:00',NULL,7,'2011-01-01'),(2,2,'2000-01-01 00:00:00','2000-02-01 00:00:00',NULL,7,'2011-03-01'),(3,5,'1988-10-11 00:00:00','1984-10-16 00:00:00',NULL,0,NULL),(4,3,'2000-10-15 00:00:00','2000-11-15 00:00:00',NULL,7,'2011-12-15'),(5,1,'1999-10-15 00:00:00','1999-11-15 00:00:00',NULL,6,'2011-12-15');

/*Table structure for table `unionpay` */

DROP TABLE IF EXISTS `unionpay`;

CREATE TABLE `unionpay` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `userId` int(10) unsigned NOT NULL,
  `datepay` datetime NOT NULL,
  `payMoney` double NOT NULL,
  `isDeleted` tinyint(1) NOT NULL DEFAULT '0',
  `deletedDate` datetime DEFAULT NULL,
  `deletedBy` int(10) unsigned DEFAULT NULL,
  `modifiedDate` datetime DEFAULT NULL,
  `modifiedBy` int(10) unsigned DEFAULT NULL,
  `payTypeId` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

/*Data for the table `unionpay` */

insert  into `unionpay`(`id`,`userId`,`datepay`,`payMoney`,`isDeleted`,`deletedDate`,`deletedBy`,`modifiedDate`,`modifiedBy`,`payTypeId`) values (1,1,'2011-12-27 00:00:00',300000,0,NULL,0,NULL,0,1),(3,1,'2011-12-26 00:00:00',250000,0,NULL,0,NULL,0,2),(4,1,'2011-12-26 00:00:00',250000,0,NULL,0,NULL,0,3),(5,1,'2011-12-27 00:00:00',200000,0,NULL,0,NULL,0,4);

/*Table structure for table `unionpaytype` */

DROP TABLE IF EXISTS `unionpaytype`;

CREATE TABLE `unionpaytype` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(200) NOT NULL,
  `description` varchar(500) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

/*Data for the table `unionpaytype` */

insert  into `unionpaytype`(`id`,`name`,`description`) values (1,'quy 1 - 2011','quy 1 - 2011'),(2,'quy 2 - 2011','quy 2 - 2011'),(3,'quý 3 - 2011','quý 3 - 2011'),(4,'quý 4 - 2011','quý 4 năm 2011'),(5,'quý 1 - 2012','quý 1 năm 2012');

/*Table structure for table `unionpossition` */

DROP TABLE IF EXISTS `unionpossition`;

CREATE TABLE `unionpossition` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uninonId` int(11) NOT NULL,
  `possionId` int(11) NOT NULL,
  `fromDate` date NOT NULL,
  `toDate` date NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

/*Data for the table `unionpossition` */

insert  into `unionpossition`(`id`,`uninonId`,`possionId`,`fromDate`,`toDate`) values (1,1,1,'2001-12-21','0000-00-00'),(2,2,2,'2003-11-15','0000-00-00');

/*Table structure for table `userbonus` */

DROP TABLE IF EXISTS `userbonus`;

CREATE TABLE `userbonus` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `unionId` int(11) NOT NULL,
  `bonusId` int(11) NOT NULL,
  `dateBonus` date NOT NULL,
  `description` varchar(500) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

/*Data for the table `userbonus` */

/*Table structure for table `usercoefficientssalary` */

DROP TABLE IF EXISTS `usercoefficientssalary`;

CREATE TABLE `usercoefficientssalary` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `userId` int(11) NOT NULL,
  `fromDate` datetime NOT NULL,
  `coefficientsId` double NOT NULL,
  `toDate` date NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

/*Data for the table `usercoefficientssalary` */

/*Table structure for table `userdepartment` */

DROP TABLE IF EXISTS `userdepartment`;

CREATE TABLE `userdepartment` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `userId` int(11) NOT NULL,
  `departmentId` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;

/*Data for the table `userdepartment` */

insert  into `userdepartment`(`id`,`userId`,`departmentId`) values (5,4,3),(3,3,3),(1,1,4),(2,2,1);

/*Table structure for table `users` */

DROP TABLE IF EXISTS `users`;

CREATE TABLE `users` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `firstName` varchar(100) NOT NULL,
  `lastName` varchar(100) NOT NULL,
  `email` varchar(1000) NOT NULL,
  `city` varchar(500) DEFAULT '',
  `country` varchar(500) DEFAULT '',
  `permissionId` int(11) DEFAULT '5',
  `userName` varchar(100) NOT NULL,
  `password` varchar(100) NOT NULL,
  `birthDay` date DEFAULT NULL,
  `dateSingUp` date DEFAULT NULL,
  `address` varchar(1000) DEFAULT NULL,
  `website` varchar(500) DEFAULT NULL,
  `avatar` varchar(1000) DEFAULT NULL,
  `phone` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `permissionId` (`permissionId`)
) ENGINE=MyISAM AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;

/*Data for the table `users` */

insert  into `users`(`id`,`firstName`,`lastName`,`email`,`city`,`country`,`permissionId`,`userName`,`password`,`birthDay`,`dateSingUp`,`address`,`website`,`avatar`,`phone`) values (1,'root','demo','root@localhost.com','Ha Noi','Viet Nam',1,'root','e10adc3949ba59abbe56e057f20f883e','1984-10-16','2009-07-28','Yen Hoa, Cau Giay,Ha Noi',NULL,NULL,NULL),(2,'H','admin','admin@localhost.com','Ha Noi','Viet Name',2,'admin','e10adc3949ba59abbe56e057f20f883e','1984-10-16','2009-07-31','Yen Hoa, Cau Giay,Ha Noi','null',' ','null'),(3,'moderator','moderator','moderator@localhost.com','Ha Noi','Viet Nam',6,'moderator','e10adc3949ba59abbe56e057f20f883e','1984-10-16','2009-07-31','Yen Hoa, Cau Giay,Ha Noi',NULL,NULL,NULL),(4,'ha','mai van','maivanha1610@gmail.com','Ha Noi','Viet Nam',6,'user','e10adc3949ba59abbe56e057f20f883e','1984-10-20','2009-08-01','Yen Hoa','',' ','0972348615'),(5,'new','commer','newcommer@gmail.com','ha noi','Viet Nam',4,'newcommer','e10adc3949ba59abbe56e057f20f883e','1984-04-18','2010-04-08','Yen Hoa','newcommer.com.vn',' ','123456789'),(6,'H','Mai V?103n','maivanha1610@gmail.com','Ha Noi','Viet Nam',5,'maivanha','e10adc3949ba59abbe56e057f20f883e','1985-10-16','2011-11-22','Yen Hoa, Cau Giay','tinyworld.us',' ','0972348615'),(7,'client','client','client@gmail.com',NULL,NULL,5,'customer','123456',NULL,NULL,'Hanoi',NULL,NULL,NULL),(8,'customer','customer','customer@gmail.com',NULL,NULL,5,'customer','123456',NULL,NULL,'Hanoi',NULL,NULL,NULL),(9,'customer2','customer2','customer2@gmai.com',NULL,NULL,NULL,'customer2','123456',NULL,NULL,'Le Van Luon',NULL,NULL,NULL);

/*Table structure for table `vote` */

DROP TABLE IF EXISTS `vote`;

CREATE TABLE `vote` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `mark` double NOT NULL DEFAULT '0',
  `numberOfVote` int(11) NOT NULL DEFAULT '0',
  `usersVoted` varchar(5000) DEFAULT NULL,
  `voteFor` varchar(1000) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

/*Data for the table `vote` */

/*Table structure for table `webcontent` */

DROP TABLE IF EXISTS `webcontent`;

CREATE TABLE `webcontent` (
  `webId` int(11) NOT NULL AUTO_INCREMENT,
  `categoryId` int(11) NOT NULL,
  `typeId` int(11) NOT NULL,
  `createdBy` int(11) NOT NULL,
  `createdDate` date NOT NULL,
  `modifiedDate` date DEFAULT NULL,
  `modifiedBy` int(11) DEFAULT '0',
  `isDeleted` tinyint(1) NOT NULL DEFAULT '0',
  `deletedBy` int(11) DEFAULT '0',
  `deletedDate` date DEFAULT NULL,
  `ishidden` tinyint(1) NOT NULL DEFAULT '0',
  `haveVote` tinyint(1) NOT NULL DEFAULT '1',
  `haveComment` tinyint(1) NOT NULL DEFAULT '1',
  `imageUrl` varchar(500) DEFAULT NULL,
  `order` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`webId`),
  KEY `categoryId` (`categoryId`),
  KEY `createdBy` (`createdBy`),
  KEY `modifiedBy` (`modifiedBy`),
  KEY `deletedBy` (`deletedBy`),
  KEY `typeId` (`typeId`)
) ENGINE=MyISAM AUTO_INCREMENT=17 DEFAULT CHARSET=utf8;

/*Data for the table `webcontent` */

insert  into `webcontent`(`webId`,`categoryId`,`typeId`,`createdBy`,`createdDate`,`modifiedDate`,`modifiedBy`,`isDeleted`,`deletedBy`,`deletedDate`,`ishidden`,`haveVote`,`haveComment`,`imageUrl`,`order`) values (1,1,1,1,'2009-07-28','2010-04-09',1,0,0,NULL,0,1,1,'1270820446187DSC_7298.JPG',0),(2,1,1,1,'2009-07-28','2010-04-09',1,0,0,NULL,0,1,1,'1270820405046FSG_5198.jpg',16),(3,1,1,1,'2009-07-28','2010-04-09',1,0,1,'2009-07-28',0,1,1,'1270820385218moshui.jpg',0),(4,1,1,1,'2009-08-04','2010-04-09',1,0,0,NULL,0,1,1,'1270820366796v4.jpg',0),(5,1,1,1,'2009-08-04','2010-04-09',1,0,0,NULL,0,1,1,'127082034309328087465418200247779_thumb.png.jpeg',0),(6,1,1,1,'2009-08-04','2010-04-09',1,0,0,NULL,0,1,1,'12708203191400-13.jpg',15),(7,2,1,1,'2009-08-05','2011-05-27',1,1,1,'2017-10-30',0,0,0,'127082070145310.jpg',0),(8,3,5,1,'2010-04-09','2010-04-09',1,1,1,'2017-10-30',0,1,1,'127082081743713933_1308504512071_1214326574_30915059_6163922_n.jpg',0),(9,3,5,1,'2010-04-09',NULL,0,1,1,'2017-10-30',0,1,1,'1270820894843KY0.4175616_26522_1.png',0),(10,21,1,1,'2010-04-09','2017-10-30',1,0,0,NULL,0,1,1,'1509348530413product-eHRM.png',0),(11,7,1,1,'2011-05-02','2017-10-18',1,1,1,'2017-10-25',0,1,1,'15083426209421237814_516401081776241_1826892200_n.jpg',0),(12,7,1,1,'2011-05-02','2017-10-18',1,0,0,NULL,0,1,1,'150834260313221557871_1467233526692987_3552181589047951813_n.jpg',0),(13,8,1,1,'2011-05-21','2017-10-18',1,0,0,NULL,0,1,1,'150834257700422490050_1501719183244421_708717968378902133_n.jpg',0),(14,12,1,1,'2011-06-17',NULL,0,0,0,NULL,0,1,1,'1308329623806weird-photos-of-girls-from-social-sites33.jpg',0),(15,8,1,1,'2015-09-05','2017-10-18',1,0,0,NULL,0,1,0,'150834256124622141123_1485963111486695_8704186254768451886_n.jpg',0),(16,1,1,1,'2016-08-12',NULL,0,0,0,NULL,0,0,0,'1471004710313DSC_0000003.jpg',0);

/*Table structure for table `webcontenttypes` */

DROP TABLE IF EXISTS `webcontenttypes`;

CREATE TABLE `webcontenttypes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `typeName` varchar(500) NOT NULL,
  `description` varchar(1000) NOT NULL,
  `tableName` varchar(1000) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

/*Data for the table `webcontenttypes` */

insert  into `webcontenttypes`(`id`,`typeName`,`description`,`tableName`) values (1,'webcontenType.News','news','informations'),(2,'webcontenType.shareFile','share file','sharedfile'),(3,'webcontenType.shareImages','share images','shareimages'),(4,'webcontenType.shareVideo','share video','sharevideo'),(5,'webcontenType.product','product','product');

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
