# HeidiSQL Dump 
#
# --------------------------------------------------------
# Host:                         127.0.0.1
# Database:                     db_clickbus
# Server version:               5.0.51b-community-nt
# Server OS:                    Win32
# Target compatibility:         ANSI SQL
# HeidiSQL version:             4.0
# Date/time:                    12-05-2023 19:26:56
# --------------------------------------------------------

/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ANSI,NO_BACKSLASH_ESCAPES';*/
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;*/


#
# Database structure for database 'db_clickbus'
#

CREATE DATABASE /*!32312 IF NOT EXISTS*/ "db_clickbus" /*!40100 DEFAULT CHARACTER SET latin1 */;

USE "db_clickbus";


#
# Table structure for table 'tbl_admin'
#

CREATE TABLE /*!32312 IF NOT EXISTS*/ "tbl_admin" (
  "admin_id" int(10) unsigned NOT NULL auto_increment,
  "admin_name" varchar(50) NOT NULL,
  "admin_email" varchar(50) NOT NULL,
  "admin_password" varchar(50) NOT NULL,
  PRIMARY KEY  ("admin_id")
) AUTO_INCREMENT=2;



#
# Dumping data for table 'tbl_admin'
#

LOCK TABLES "tbl_admin" WRITE;
/*!40000 ALTER TABLE "tbl_admin" DISABLE KEYS;*/
REPLACE INTO "tbl_admin" ("admin_id", "admin_name", "admin_email", "admin_password") VALUES
	('1','Akhila','akhila@gmail.com','akhila@123');
/*!40000 ALTER TABLE "tbl_admin" ENABLE KEYS;*/
UNLOCK TABLES;


#
# Table structure for table 'tbl_booking'
#

CREATE TABLE /*!32312 IF NOT EXISTS*/ "tbl_booking" (
  "booking_id" int(11) NOT NULL auto_increment,
  "user_id" int(11) NOT NULL,
  "shedule_id" int(11) NOT NULL,
  "booking_amount" varchar(100) NOT NULL default '0',
  "booking_status" varchar(100) NOT NULL default '0',
  "booking_date" varchar(100) NOT NULL default '0',
  "booked_date" varchar(100) NOT NULL default '0',
  PRIMARY KEY  ("booking_id")
) AUTO_INCREMENT=4;



#
# Dumping data for table 'tbl_booking'
#

LOCK TABLES "tbl_booking" WRITE;
/*!40000 ALTER TABLE "tbl_booking" DISABLE KEYS;*/
REPLACE INTO "tbl_booking" ("booking_id", "user_id", "shedule_id", "booking_amount", "booking_status", "booking_date", "booked_date") VALUES
	(1,1,2,'10240','1','2023-05-12','2023-05-12');
REPLACE INTO "tbl_booking" ("booking_id", "user_id", "shedule_id", "booking_amount", "booking_status", "booking_date", "booked_date") VALUES
	(2,1,2,'5120','1','2023-05-12','2023-05-12');
REPLACE INTO "tbl_booking" ("booking_id", "user_id", "shedule_id", "booking_amount", "booking_status", "booking_date", "booked_date") VALUES
	(3,1,2,'5120','1','2023-05-12','2023-05-12');
/*!40000 ALTER TABLE "tbl_booking" ENABLE KEYS;*/
UNLOCK TABLES;


#
# Table structure for table 'tbl_bus_service'
#

CREATE TABLE /*!32312 IF NOT EXISTS*/ "tbl_bus_service" (
  "bs_id" int(11) NOT NULL auto_increment,
  "bs_name" varchar(50) NOT NULL,
  "bs_contact" varchar(50) NOT NULL,
  "bs_email" varchar(50) NOT NULL,
  "bs_photo" varchar(50) NOT NULL,
  "bs_password" varchar(50) NOT NULL,
  "place_id" int(11) NOT NULL,
  PRIMARY KEY  ("bs_id")
) AUTO_INCREMENT=2;



#
# Dumping data for table 'tbl_bus_service'
#

LOCK TABLES "tbl_bus_service" WRITE;
/*!40000 ALTER TABLE "tbl_bus_service" DISABLE KEYS;*/
REPLACE INTO "tbl_bus_service" ("bs_id", "bs_name", "bs_contact", "bs_email", "bs_photo", "bs_password", "place_id") VALUES
	(1,'Suraj K S','9876543210','surajks@gmail.com','DriverPhoto_2045.jpeg','suraj@123',1);
/*!40000 ALTER TABLE "tbl_bus_service" ENABLE KEYS;*/
UNLOCK TABLES;


#
# Table structure for table 'tbl_district'
#

CREATE TABLE /*!32312 IF NOT EXISTS*/ "tbl_district" (
  "district_id" int(10) unsigned NOT NULL auto_increment,
  "district_name" varchar(50) NOT NULL,
  "state_id" int(11) NOT NULL,
  PRIMARY KEY  ("district_id")
) AUTO_INCREMENT=4;



#
# Dumping data for table 'tbl_district'
#

LOCK TABLES "tbl_district" WRITE;
/*!40000 ALTER TABLE "tbl_district" DISABLE KEYS;*/
REPLACE INTO "tbl_district" ("district_id", "district_name", "state_id") VALUES
	('1','Idukki',1);
REPLACE INTO "tbl_district" ("district_id", "district_name", "state_id") VALUES
	('2','Ernakulam',1);
REPLACE INTO "tbl_district" ("district_id", "district_name", "state_id") VALUES
	('3','Bangalore',2);
/*!40000 ALTER TABLE "tbl_district" ENABLE KEYS;*/
UNLOCK TABLES;


#
# Table structure for table 'tbl_place'
#

CREATE TABLE /*!32312 IF NOT EXISTS*/ "tbl_place" (
  "place_id" int(11) NOT NULL auto_increment,
  "place_name" varchar(50) NOT NULL,
  "district_id" int(11) NOT NULL,
  PRIMARY KEY  ("place_id")
) AUTO_INCREMENT=4;



#
# Dumping data for table 'tbl_place'
#

LOCK TABLES "tbl_place" WRITE;
/*!40000 ALTER TABLE "tbl_place" DISABLE KEYS;*/
REPLACE INTO "tbl_place" ("place_id", "place_name", "district_id") VALUES
	(1,'Thodupuzha',1);
REPLACE INTO "tbl_place" ("place_id", "place_name", "district_id") VALUES
	(2,'Muvattupuzha',2);
REPLACE INTO "tbl_place" ("place_id", "place_name", "district_id") VALUES
	(3,'Malleshwaram',3);
/*!40000 ALTER TABLE "tbl_place" ENABLE KEYS;*/
UNLOCK TABLES;


#
# Table structure for table 'tbl_route'
#

CREATE TABLE /*!32312 IF NOT EXISTS*/ "tbl_route" (
  "route_id" int(10) unsigned NOT NULL auto_increment,
  "route_name" varchar(50) NOT NULL,
  "place_from" int(10) unsigned NOT NULL,
  "place_to" int(10) unsigned NOT NULL,
  "route_time" varchar(50) NOT NULL,
  "route_km" varchar(100) NOT NULL,
  PRIMARY KEY  ("route_id")
) AUTO_INCREMENT=2;



#
# Dumping data for table 'tbl_route'
#

LOCK TABLES "tbl_route" WRITE;
/*!40000 ALTER TABLE "tbl_route" DISABLE KEYS;*/
REPLACE INTO "tbl_route" ("route_id", "route_name", "place_from", "place_to", "route_time", "route_km") VALUES
	('1','Thodupuzha-Bangalore','1','3','680','562');
/*!40000 ALTER TABLE "tbl_route" ENABLE KEYS;*/
UNLOCK TABLES;


#
# Table structure for table 'tbl_schedule'
#

CREATE TABLE /*!32312 IF NOT EXISTS*/ "tbl_schedule" (
  "schedule_id" int(10) unsigned NOT NULL auto_increment,
  "route_id" int(10) unsigned NOT NULL,
  "schedule_time" varchar(50) NOT NULL,
  "bus_name" varchar(50) NOT NULL,
  "bs_id" int(10) unsigned NOT NULL,
  "schedule_longitude" varchar(50) default '76.5950595',
  "schedule_latitude" varchar(50) default '10.0286512',
  PRIMARY KEY  ("schedule_id")
) AUTO_INCREMENT=24;



#
# Dumping data for table 'tbl_schedule'
#

LOCK TABLES "tbl_schedule" WRITE;
/*!40000 ALTER TABLE "tbl_schedule" DISABLE KEYS;*/
REPLACE INTO "tbl_schedule" ("schedule_id", "route_id", "schedule_time", "bus_name", "bs_id", "schedule_longitude", "schedule_latitude") VALUES
	('2','1','10:00','KL 15 K1570','1','76.9527723','8.4934317');
/*!40000 ALTER TABLE "tbl_schedule" ENABLE KEYS;*/
UNLOCK TABLES;


#
# Table structure for table 'tbl_seat'
#

CREATE TABLE /*!32312 IF NOT EXISTS*/ "tbl_seat" (
  "seat_id" int(11) NOT NULL auto_increment,
  "seat_no" varchar(100) NOT NULL,
  "booking_id" int(11) NOT NULL,
  "seat_status" int(11) NOT NULL default '0',
  PRIMARY KEY  ("seat_id")
) AUTO_INCREMENT=5;



#
# Dumping data for table 'tbl_seat'
#

LOCK TABLES "tbl_seat" WRITE;
/*!40000 ALTER TABLE "tbl_seat" DISABLE KEYS;*/
REPLACE INTO "tbl_seat" ("seat_id", "seat_no", "booking_id", "seat_status") VALUES
	(1,'s1',1,1);
REPLACE INTO "tbl_seat" ("seat_id", "seat_no", "booking_id", "seat_status") VALUES
	(2,'s2',1,1);
REPLACE INTO "tbl_seat" ("seat_id", "seat_no", "booking_id", "seat_status") VALUES
	(3,'s3',2,1);
REPLACE INTO "tbl_seat" ("seat_id", "seat_no", "booking_id", "seat_status") VALUES
	(4,'s4',3,1);
/*!40000 ALTER TABLE "tbl_seat" ENABLE KEYS;*/
UNLOCK TABLES;


#
# Table structure for table 'tbl_state'
#

CREATE TABLE /*!32312 IF NOT EXISTS*/ "tbl_state" (
  "state_id" int(11) NOT NULL auto_increment,
  "state_name" varchar(100) NOT NULL,
  PRIMARY KEY  ("state_id")
) AUTO_INCREMENT=3;



#
# Dumping data for table 'tbl_state'
#

LOCK TABLES "tbl_state" WRITE;
/*!40000 ALTER TABLE "tbl_state" DISABLE KEYS;*/
REPLACE INTO "tbl_state" ("state_id", "state_name") VALUES
	(1,'Kerala');
REPLACE INTO "tbl_state" ("state_id", "state_name") VALUES
	(2,'Karnataka');
/*!40000 ALTER TABLE "tbl_state" ENABLE KEYS;*/
UNLOCK TABLES;


#
# Table structure for table 'tbl_stop'
#

CREATE TABLE /*!32312 IF NOT EXISTS*/ "tbl_stop" (
  "stop_id" int(10) unsigned NOT NULL auto_increment,
  "route_id" int(10) unsigned NOT NULL,
  "stop_number" int(10) unsigned NOT NULL,
  "place_id" int(10) unsigned NOT NULL,
  "stop_time" varchar(50) NOT NULL,
  "stop_km" int(11) NOT NULL,
  PRIMARY KEY  ("stop_id")
) AUTO_INCREMENT=4;



#
# Dumping data for table 'tbl_stop'
#

LOCK TABLES "tbl_stop" WRITE;
/*!40000 ALTER TABLE "tbl_stop" DISABLE KEYS;*/
REPLACE INTO "tbl_stop" ("stop_id", "route_id", "stop_number", "place_id", "stop_time", "stop_km") VALUES
	('1','1','1','1','0',0);
REPLACE INTO "tbl_stop" ("stop_id", "route_id", "stop_number", "place_id", "stop_time", "stop_km") VALUES
	('2','1','2','2','20',21);
REPLACE INTO "tbl_stop" ("stop_id", "route_id", "stop_number", "place_id", "stop_time", "stop_km") VALUES
	('3','1','3','3','640',542);
/*!40000 ALTER TABLE "tbl_stop" ENABLE KEYS;*/
UNLOCK TABLES;


#
# Table structure for table 'tbl_user'
#

CREATE TABLE /*!32312 IF NOT EXISTS*/ "tbl_user" (
  "user_id" int(11) NOT NULL auto_increment,
  "user_name" varchar(100) NOT NULL,
  "user_contact" varchar(100) NOT NULL,
  "user_photo" varchar(100) NOT NULL,
  "user_email" varchar(100) NOT NULL,
  "user_password" varchar(100) NOT NULL,
  PRIMARY KEY  ("user_id")
) AUTO_INCREMENT=2;



#
# Dumping data for table 'tbl_user'
#

LOCK TABLES "tbl_user" WRITE;
/*!40000 ALTER TABLE "tbl_user" DISABLE KEYS;*/
REPLACE INTO "tbl_user" ("user_id", "user_name", "user_contact", "user_photo", "user_email", "user_password") VALUES
	(1,'Jun','9876543210','UserPhoto_1215.jpg','jun@gmail.com','qwerty@123');
/*!40000 ALTER TABLE "tbl_user" ENABLE KEYS;*/
UNLOCK TABLES;
/*!40101 SET SQL_MODE=@OLD_SQL_MODE;*/
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;*/
