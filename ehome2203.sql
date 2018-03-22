# HeidiSQL Dump 
#
# --------------------------------------------------------
# Host:                         127.0.0.1
# Database:                     ehome
# Server version:               5.0.51b-community-nt
# Server OS:                    Win32
# Target compatibility:         ANSI SQL
# HeidiSQL version:             4.0
# Date/time:                    2018-03-22 15:37:17
# --------------------------------------------------------

/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ANSI,NO_BACKSLASH_ESCAPES';*/
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;*/


#
# Database structure for database 'ehome'
#

CREATE DATABASE /*!32312 IF NOT EXISTS*/ "ehome" /*!40100 DEFAULT CHARACTER SET latin1 */;

USE "ehome";


#
# Table structure for table 'tbl_builders'
#

CREATE TABLE /*!32312 IF NOT EXISTS*/ "tbl_builders" (
  "builders_id" int(11) NOT NULL auto_increment,
  "builders_name" varchar(500) default NULL,
  "builders_address" varchar(500) default NULL,
  "builders_contact" varchar(50) default NULL,
  "builders_emailid" varchar(100) default NULL,
  "district_id" int(10) default NULL,
  "builders_logo" varchar(50) default NULL,
  "builders_status" varchar(50) default '0',
  "login_id" int(11) default NULL,
  "builders_proof" varchar(50) default NULL,
  PRIMARY KEY  ("builders_id")
) AUTO_INCREMENT=8;



#
# Dumping data for table 'tbl_builders'
#

LOCK TABLES "tbl_builders" WRITE;
/*!40000 ALTER TABLE "tbl_builders" DISABLE KEYS;*/
REPLACE INTO "tbl_builders" ("builders_id", "builders_name", "builders_address", "builders_contact", "builders_emailid", "district_id", "builders_logo", "builders_status", "login_id", "builders_proof") VALUES
	(5,'ABAD BUILDERS ','8th Floor,Nucleus Mall And Office,N.H.49 Kundannoor - petta road,Maradu P. O','9895633334','info@abadbuilders.com',3,'LOGO_1559.png','1',19,'PROOF_1741.jpeg');
REPLACE INTO "tbl_builders" ("builders_id", "builders_name", "builders_address", "builders_contact", "builders_emailid", "district_id", "builders_logo", "builders_status", "login_id", "builders_proof") VALUES
	(6,'Asset Homes','Asset Homes Pvt. Ltd.G-129, 28/34 A, Panampilly Nagar, Kochi-36','9846499989','enquiry@assethomes.in',3,'LOGO_1319.jpg','1',23,'PROOF_1506.jpg');
REPLACE INTO "tbl_builders" ("builders_id", "builders_name", "builders_address", "builders_contact", "builders_emailid", "district_id", "builders_logo", "builders_status", "login_id", "builders_proof") VALUES
	(7,'Desai Homes','DD Trade Tower, 2nd Floor, Kaloor-Kadavanthra Road,Opp.Wellmart Super Market, Ernakulam,Kerala, India.Pin: 682 017','91 484 4177888','sales@desaihomes.com',3,'LOGO_1234.png','1',24,'PROOF_1236.jpg');
/*!40000 ALTER TABLE "tbl_builders" ENABLE KEYS;*/
UNLOCK TABLES;


#
# Table structure for table 'tbl_buildersgallery'
#

CREATE TABLE /*!32312 IF NOT EXISTS*/ "tbl_buildersgallery" (
  "gallery_id" int(11) NOT NULL auto_increment,
  "gallery_caption" varchar(500) default NULL,
  "gallery_image" varchar(50) default NULL,
  PRIMARY KEY  ("gallery_id")
);



#
# Dumping data for table 'tbl_buildersgallery'
#

# No data found.



#
# Table structure for table 'tbl_comments'
#

CREATE TABLE /*!32312 IF NOT EXISTS*/ "tbl_comments" (
  "comment_id" int(11) NOT NULL auto_increment,
  "comment_date" date default NULL,
  "user_id" int(10) unsigned default NULL,
  "builders_id" int(11) default NULL,
  "comment_description" varchar(500) default NULL,
  PRIMARY KEY  ("comment_id")
);



#
# Dumping data for table 'tbl_comments'
#

# No data found.



#
# Table structure for table 'tbl_companysite'
#

CREATE TABLE /*!32312 IF NOT EXISTS*/ "tbl_companysite" (
  "site_id" int(11) NOT NULL auto_increment,
  "site_name" varchar(100) default NULL,
  "site_address" varchar(500) default NULL,
  "district_id" int(11) default NULL,
  "builders_id" int(11) default NULL,
  "totalarea" varchar(100) default NULL,
  "site_image" tinyint(3) unsigned default NULL,
  PRIMARY KEY  ("site_id")
) AUTO_INCREMENT=7;



#
# Dumping data for table 'tbl_companysite'
#

LOCK TABLES "tbl_companysite" WRITE;
/*!40000 ALTER TABLE "tbl_companysite" DISABLE KEYS;*/
REPLACE INTO "tbl_companysite" ("site_id", "site_name", "site_address", "district_id", "builders_id", "totalarea", "site_image") VALUES
	(1,'abad Site No3','kaloor,Ernankulam',3,5,'3000',NULL);
REPLACE INTO "tbl_companysite" ("site_id", "site_name", "site_address", "district_id", "builders_id", "totalarea", "site_image") VALUES
	(2,'AssetHomes1',' Panampilly Nagar, Kochi-36',3,6,'70000 sq feet',NULL);
REPLACE INTO "tbl_companysite" ("site_id", "site_name", "site_address", "district_id", "builders_id", "totalarea", "site_image") VALUES
	(3,'Assethomes2','South, Kochi-36',6,6,'1000000 Sq feet',NULL);
REPLACE INTO "tbl_companysite" ("site_id", "site_name", "site_address", "district_id", "builders_id", "totalarea", "site_image") VALUES
	(4,'AssetSiteMaradu','Maradu, Ernakulam',3,6,'120000 Sq feet',NULL);
REPLACE INTO "tbl_companysite" ("site_id", "site_name", "site_address", "district_id", "builders_id", "totalarea", "site_image") VALUES
	(5,'AssetHomesTrissur','Nellikunnu, Thrissur',14,6,'200000 Sq feet',NULL);
REPLACE INTO "tbl_companysite" ("site_id", "site_name", "site_address", "district_id", "builders_id", "totalarea", "site_image") VALUES
	(6,'AssetHomesKollam','Kadappakada, Kollam',7,6,'20000 sq feet',NULL);
/*!40000 ALTER TABLE "tbl_companysite" ENABLE KEYS;*/
UNLOCK TABLES;


#
# Table structure for table 'tbl_construction'
#

CREATE TABLE /*!32312 IF NOT EXISTS*/ "tbl_construction" (
  "construction_id" int(11) NOT NULL auto_increment,
  "constructiontype_id" int(11) default NULL,
  "construction_caption" varchar(100) default NULL,
  "builders_id" int(11) default NULL,
  "construction_address" varchar(100) default NULL,
  "construction_number" varchar(50) default NULL,
  "construction_detail" varchar(100) default NULL,
  "construction_image" varchar(50) default NULL,
  "construction_status" varchar(50) default '0',
  PRIMARY KEY  ("construction_id")
) AUTO_INCREMENT=18;



#
# Dumping data for table 'tbl_construction'
#

LOCK TABLES "tbl_construction" WRITE;
/*!40000 ALTER TABLE "tbl_construction" DISABLE KEYS;*/
REPLACE INTO "tbl_construction" ("construction_id", "constructiontype_id", "construction_caption", "builders_id", "construction_address", "construction_number", "construction_detail", "construction_image", "construction_status") VALUES
	(4,4,'ASSET RANGOLI',6,'Maradu, Ernakulam','E1/BA 159/16','2 BHK, 3 BHK','Img_1857.jpg','1');
REPLACE INTO "tbl_construction" ("construction_id", "constructiontype_id", "construction_caption", "builders_id", "construction_address", "construction_number", "construction_detail", "construction_image", "construction_status") VALUES
	(6,4,'TKM ASSET GRANDIOS SANFORD',6,'Kadappakada, Kollam','PW4/BA/70/15-16','2 BHK, 3 BHK, 4 BHK','Img_1832.jpg','0');
REPLACE INTO "tbl_construction" ("construction_id", "constructiontype_id", "construction_caption", "builders_id", "construction_address", "construction_number", "construction_detail", "construction_image", "construction_status") VALUES
	(7,4,'ASSET PRECIOUS',6,'Nellikunnu, Thrissur','DW4/BA/381/14-15','2 BHK, 3 BHK','Img_1918.jpg','0');
REPLACE INTO "tbl_construction" ("construction_id", "constructiontype_id", "construction_caption", "builders_id", "construction_address", "construction_number", "construction_detail", "construction_image", "construction_status") VALUES
	(8,4,'IKEBANA LUXURY APARTMENTS',5,'PANAMPILLY NAGAR, COCHIN','KRP-1/297/14/COC/KRP/780/14','3 BHK Apartments','Img_1568.jpg','0');
REPLACE INTO "tbl_construction" ("construction_id", "constructiontype_id", "construction_caption", "builders_id", "construction_address", "construction_number", "construction_detail", "construction_image", "construction_status") VALUES
	(9,2,'ORCHARD COUNTY',5,'TRIPUNITHURA, ERNAKULAM','BA-394/13-14','3 BKD LUXURIOUS VILLA','Img_1468.jpg','0');
REPLACE INTO "tbl_construction" ("construction_id", "constructiontype_id", "construction_caption", "builders_id", "construction_address", "construction_number", "construction_detail", "construction_image", "construction_status") VALUES
	(10,4,'DD TWITTER VALLEY',7,'Arasumoodu, Trivandrum','ZAE/BA/295/16',' 3 BHK Apartments','Img_1901.jpg','0');
REPLACE INTO "tbl_construction" ("construction_id", "constructiontype_id", "construction_caption", "builders_id", "construction_address", "construction_number", "construction_detail", "construction_image", "construction_status") VALUES
	(11,4,'DD DIAMOND DISTRICT',7,'Trivandrum','272/08-09','3 Bedroom Apartments','Img_1969.jpg','0');
REPLACE INTO "tbl_construction" ("construction_id", "constructiontype_id", "construction_caption", "builders_id", "construction_address", "construction_number", "construction_detail", "construction_image", "construction_status") VALUES
	(12,4,'DD GOLDEN GATE',7,'Kakkanad, Cochin','12/ERF35','1 & 3 Bedroom Apartments','Img_1372.jpg','0');
REPLACE INTO "tbl_construction" ("construction_id", "constructiontype_id", "construction_caption", "builders_id", "construction_address", "construction_number", "construction_detail", "construction_image", "construction_status") VALUES
	(13,4,'DD PLATINUM PLANET',7,'Kathrikadavu, Cochin','ED12//34DF','2 BDK Premium Apartments','Img_1781.jpg','0');
REPLACE INTO "tbl_construction" ("construction_id", "constructiontype_id", "construction_caption", "builders_id", "construction_address", "construction_number", "construction_detail", "construction_image", "construction_status") VALUES
	(14,2,'DD MISTY VALLEY VILLAS',7,'Kakkanad, Cochin','B.A 93/08.09','4 Bed Villa','Img_1301.jpg','0');
REPLACE INTO "tbl_construction" ("construction_id", "constructiontype_id", "construction_caption", "builders_id", "construction_address", "construction_number", "construction_detail", "construction_image", "construction_status") VALUES
	(15,2,'DD TUDOR VILLAS',7,'Vaduthala, Cochin','KPW1-BA/269/17-18','4 Bed Villas','Img_1799.jpg','0');
REPLACE INTO "tbl_construction" ("construction_id", "constructiontype_id", "construction_caption", "builders_id", "construction_address", "construction_number", "construction_detail", "construction_image", "construction_status") VALUES
	(16,4,'DD MAJESTIC MOUNT',7,'Kottayam,Kerala','KPW1-BA/28/17-18','3 Residential Apartments','Img_1110.jpg','0');
REPLACE INTO "tbl_construction" ("construction_id", "constructiontype_id", "construction_caption", "builders_id", "construction_address", "construction_number", "construction_detail", "construction_image", "construction_status") VALUES
	(17,4,'DD CITY GATE',7,'S H Mount, Kottayam','KPW1-BA/269/17-18','2 & 3 BHK Apartments.','Img_1898.jpg','0');
/*!40000 ALTER TABLE "tbl_construction" ENABLE KEYS;*/
UNLOCK TABLES;


#
# Table structure for table 'tbl_constructiondetails'
#

CREATE TABLE /*!32312 IF NOT EXISTS*/ "tbl_constructiondetails" (
  "constructiondetails_id" int(11) NOT NULL auto_increment,
  "construction_id" int(11) default NULL,
  "Description" varchar(1000) default NULL,
  "construction_amount" varchar(50) default NULL,
  "rent_amount" varchar(100) default NULL,
  "lease_amount" varchar(100) default NULL,
  "cd_status" varchar(50) default '0',
  PRIMARY KEY  ("constructiondetails_id")
) AUTO_INCREMENT=18;



#
# Dumping data for table 'tbl_constructiondetails'
#

LOCK TABLES "tbl_constructiondetails" WRITE;
/*!40000 ALTER TABLE "tbl_constructiondetails" DISABLE KEYS;*/
REPLACE INTO "tbl_constructiondetails" ("constructiondetails_id", "construction_id", "Description", "construction_amount", "rent_amount", "lease_amount", "cd_status") VALUES
	(1,3,'2 bedroom apartment',NULL,NULL,NULL,'2');
REPLACE INTO "tbl_constructiondetails" ("constructiondetails_id", "construction_id", "Description", "construction_amount", "rent_amount", "lease_amount", "cd_status") VALUES
	(2,1,'5 bedroom apartment',NULL,NULL,NULL,'2');
REPLACE INTO "tbl_constructiondetails" ("constructiondetails_id", "construction_id", "Description", "construction_amount", "rent_amount", "lease_amount", "cd_status") VALUES
	(3,4,'Flooring:High-quality vitrified tiles with vitrified skirting for Living, Dining and Bedrooms. Antiskid/matt tiles - ceramic/vitrified for Kitchen, Balcony and Toilets. Entrance lobby, Staircase & Common areas will be of granite/vitrified flooring.
Kitchen:Granite kitchen counter, single-bowl stainless steel sink with drain board. Provision for exhaust fan.
Toilet Fittings: White sanitary ware including European water closet and wash basin. Good quality chromium plated taps, mixer, and shower. Towel rods.','1 Cr','20000 per month','5 lakhs peryear','1');
REPLACE INTO "tbl_constructiondetails" ("constructiondetails_id", "construction_id", "Description", "construction_amount", "rent_amount", "lease_amount", "cd_status") VALUES
	(4,5,'Flooring:
High quality vitrified tiles with vitrified skirting for Living, Dining and Bedrooms.Antiskid/Matt tiles - Ceramic/Vitrified for Kitchen, Balcony and Toilets.
Entrance lobby, Staircase & Common areas will be of granite/Vitrified flooring.Granite kitchen counter, single-bowl stainless steel sink with drain board.
Toilet Fittings:
White sanitary ware including European water closet and washbasin. Good quality chromium-plated taps, mixer, and shower. Towel rods.','1 Cr','15000 per month','5 lakhs peryear','1');
REPLACE INTO "tbl_constructiondetails" ("constructiondetails_id", "construction_id", "Description", "construction_amount", "rent_amount", "lease_amount", "cd_status") VALUES
	(5,6,'Flooring:
High quality vitrified tiles for the entire apartment, with vitrified skirting.Entrance lobby, Staircase & Common areas will be of granite/Vitrified flooring.
Kitchen:Granite kitchen counter, single bowl stainless steel sink with drain board.Provision for exhaust fan
Toilet fittings:
White sanitary ware including European water closet and wash basin.Good quality chromium plated taps, mixer, and shower. Towel rods     ','2 Cr','15000 per month','10 lakhs peryear','1');
REPLACE INTO "tbl_constructiondetails" ("constructiondetails_id", "construction_id", "Description", "construction_amount", "rent_amount", "lease_amount", "cd_status") VALUES
	(6,7,'Flooring:
High quality vitrified tiles with vitrified skirting for Living, Dining and Bedrooms.
Antiskid/Matt tiles - Ceramic/Vitrified for Kitchen, Balcony and Toilets.
Entrance lobby, Staircase & Common areas will be of granite/Vitrified flooring.
Wall Claddings
Designed ceramic / glazed wall tile cladding in bathrooms up to false ceiling height.
Kitchen:
Granite kitchen counter, single-bowl stainless steel sink with drain board.
Toilet Fittings:
White sanitary ware including European water closet and washbasin. Good quality chromium-plated taps, mixer, and shower. Towel rods.
','1.5 Cr','10000 per month','7 lakhs peryear','1');
REPLACE INTO "tbl_constructiondetails" ("constructiondetails_id", "construction_id", "Description", "construction_amount", "rent_amount", "lease_amount", "cd_status") VALUES
	(7,8,'Door and furniture:Teak wood panelled and polished entrance door, Premium quality pre-hung internal doors, Premium quality hardware, UPVC balcony sliding doors , Premium powder coated aluminium windows.
Flooring:Premium (80*80cm) double charged vitrified flooring for apartment, Laminated wooden flooring for master bedroom, Round the clock security , Standard fire safety features on all floors, CCTV for common area surveillance, Intercom facility in apartment / common area.
kitchen:Adequate power points for home appliances, Stainless steel sink with drain board of Franke / equivalent , Granite kitchen counter top with branded tile dado, Points for water purifier / washing machine / dish washer.
   ','2 Cr','20000 per month','10 lakhs peryear','1');
REPLACE INTO "tbl_constructiondetails" ("constructiondetails_id", "construction_id", "Description", "construction_amount", "rent_amount", "lease_amount", "cd_status") VALUES
	(8,9,'Flooring:GF Living and dining with 120 x 80 cm slab of CERA or equivalent.Vitrified 80x80 cm flooring for rest of the villa of CERA or equivalent, Staircase with wooden steps.
Kitchen:Galaxy Black granite kitchen platform with tile dado, SS sink with one and a half bowl & drain board of Futura or equivalent. Independent gas supply piping for each villas with gas leakage detector, Provision for Water purifier and exhaust fan, Hydro pneumatic water supply, Individual septic tank with overflow soak pit.
All specifications conforming to Green Building Norms.     ','3 Cr     ','10000 per month','15 lakhs per year','1');
REPLACE INTO "tbl_constructiondetails" ("constructiondetails_id", "construction_id", "Description", "construction_amount", "rent_amount", "lease_amount", "cd_status") VALUES
	(9,10,'Flooring: Fully Vitrified tiles except toilet and balconies.Putty finished plastic emulsion painted walls in the entire apartment.Anti-skid bath room floor tiles with wall tiles up to ceiling. CP fittings Jaquar or equivalent and Sanitary Fittings Cera or equivalent.Fire retardant cables Finolex or equivalent, MCBs and ELCB Legrand or equivalent.Modular Switches Legrand or equivalent.Polished front door fitted with Godrej or equivalent lock, inside panelled doors and powder coated Aluminium windows with Glass & Grill. 32 Amps A/C point - 2 points for 3 BHK flat and 1 points for 2BHK flat additional 32 Amps A/C point will be charged16 Amps plug point - 5 points per 3 BHK flat and 4 points per 2 BHK flat, including Geyser point in all toilets.Additional Electrical points on request will be charged extra).Provision for Aqua Guard.Provision for Geyser and Exhaust Fan in all Toilets. ','3 Cr','20000 per month','15 lakhs per year','1');
REPLACE INTO "tbl_constructiondetails" ("constructiondetails_id", "construction_id", "Description", "construction_amount", "rent_amount", "lease_amount", "cd_status") VALUES
	(10,16,'Flooring: Fully Vitrified Tiles except toilets and balconies.
Putty finished plastic emulsion painted walls in the entire apartment.
Anti-skid bath room floor tiles with glazed wall tiles up to ceiling.
CP fittings - Jaquar or equivalent and Sanitary Fittings - Cera or equivalent
Fire retardant (FR) cables - Finolex or equivalent, MCBs and ELCB - Legrand or equivalent
Modular Switches - Legrand or equivalent
Polished front door fitted with Godrej or equivalent lock, inside Flush Doors and powder coated Aluminium Windows with Glass & Grill.
32 Amps A/c. point-3 points for 3 BHK flat and 2 points for 2BHK flat.
16 Amps plug point- 5 points per 3 BHK flat and 6 points per 2 BHK flat, including Geyser point in all toilets. (Additional electrical points on request will be charged extra).
Provision for Aqua Guard.
Provision for Geyser and Exhaust Fan in all Toilets.
','3 Cr','not for Rent','15 lakhs per year','1');
REPLACE INTO "tbl_constructiondetails" ("constructiondetails_id", "construction_id", "Description", "construction_amount", "rent_amount", "lease_amount", "cd_status") VALUES
	(11,11,'Flooring - Vitrified tiles in Drawing/dining hall and good quality ceramic tiles in other areas.
Putty finished with OBD painted walls in the entire apartment and putty finished ceiling in drawing & dining hall.
Anti-skid bathroom floor tiles with designer wall tiles up to ceiling.
Good quality CP fittings and white sanitary fittings.
Good quality fire retardant (FR) cables, MCBs and ELCB.
Polished front door fitted with Godrej or equivalent lock, inside paneled ready-made doors and powder coated aluminum windows with grill.
32 Amps A/C point - 2 Nos. per 3 BHK flat and one point for 2 BHK flat.
16 Amps plug point - 5 points per 3 BHK flat and 4 points per 2 BHK flat including Geyser point all toilets.
Provision for Aqua guard connection.
Provision for Geysers in all toilets.     ','4 Cr','30000','20 lakhs per year','1');
REPLACE INTO "tbl_constructiondetails" ("constructiondetails_id", "construction_id", "Description", "construction_amount", "rent_amount", "lease_amount", "cd_status") VALUES
	(12,12,'Flooring - vitrified tiles in Drawing/ dining hall and good quality ceramic tiles in other areas.
Putty finished with OBD painted walls in the entire apartment and putty finished ceiling in drawing & dining hall.
Antiskid bath room floor tiles with designer wall tiles up to ceiling.
Good quality CP fittings and white sanitary fittings.
Hard wood putty Painted front door fitted with Godrej or equivalent lock, inside paneled doors, windows with grill either putty painted hardwood or powder coated aluminum.
32 Amps A/C point - 2 points per 3 BHK flat and one point per 1 BHK flat.
16 Amps plug point - 5 points per 3 BHK flat and 3 points per 1 BHK flat.
Provision for Aqua guard point.
Provision for Geysers and Exhaust Fan in all toilets.
     ','3 Cr','25000 per month','15 lakhs per year','1');
REPLACE INTO "tbl_constructiondetails" ("constructiondetails_id", "construction_id", "Description", "construction_amount", "rent_amount", "lease_amount", "cd_status") VALUES
	(13,13,'Hard wood putty Painted windows with grills & putty painted doors
Flooring - Vitrified tiles in Drawing/Dining hall (upto Rs.50/- per sft.) and good quality ceramic tiles in other areas.
Putty finished with plastic emulsion painted walls in the entire apartment and putty finished ceiling in drawing & dining hall.
Designer bath room tiles upto ceiling
Good quality CP fittings
Light coloured sanitary fittings.
Legrand or equilent modular switches.
15 Amps -7/20 wire -2/3 points per flat.
15 Amps 3/20 wire -3/4 points per flat.    ','4 Cr','15890 per month','15 lakhs per year','1');
REPLACE INTO "tbl_constructiondetails" ("constructiondetails_id", "construction_id", "Description", "construction_amount", "rent_amount", "lease_amount", "cd_status") VALUES
	(14,14,' It is sometimes said that a home is where the heart is, DD Misty Valley Villas will steal yours. 19 exquisitely designed villas equipped with the top of the line amenities located in Kakkanad, near the information technology hubs - Smart City and Info Park and prominent educational institutions. Project completed.
    ','3 Cr','13000','15 lakhs per year','1');
REPLACE INTO "tbl_constructiondetails" ("constructiondetails_id", "construction_id", "Description", "construction_amount", "rent_amount", "lease_amount", "cd_status") VALUES
	(15,15,'Elegant and distinguished homes and just the right address to possess. Situated in the genteel suburb of Vaduthala, just 4 km from M.G. Road and Marine Drive, DD Tudor Villas is a community that consists of 3 and 4 bedroom villas designed in the distinctive Tudor style of architecture.
     ','3 Cr','20000','15 lakhs per year','1');
REPLACE INTO "tbl_constructiondetails" ("constructiondetails_id", "construction_id", "Description", "construction_amount", "rent_amount", "lease_amount", "cd_status") VALUES
	(16,16,'Flooring: Living, Dining, Kitchen Vitrified Tiles & Ceramic Tiles for Bedrooms, Toilets & Balconies
Putty finished plastic emulsion painted walls in the entire apartment
Anti-skid bathroom floor tiles with glazed wall tiles up to ceiling
Sanitary & CP Fittings- Cera/ Hindware
Fire retardant (FR) cables- Finolex or equivalent, MCBs and ELCB- Legrand or equivalent
Modular Switches- Legrand or equivalent
Polished front door fitted with Godrej or equivalent lock, inside paneled doors and powder coated aluminium windows with glass and grill
32 Amps AC point- 2 points for 2 & 3 BHK flats (Additional electrical points on request will be charged extra)
16 Amps plug point- 5 points per 2 & 3 BHK flats, including Geyser points in all toilets (Additional electrical points on request will be charged extra)
Provision for Aqua Guard
Provision for Geyser and Exhaust Fan in all toilets     ','4 Cr','20000 per month','20 lakhs per year','1');
REPLACE INTO "tbl_constructiondetails" ("constructiondetails_id", "construction_id", "Description", "construction_amount", "rent_amount", "lease_amount", "cd_status") VALUES
	(17,17,'Flooring: Fully Vitrified Tiles except toilets and balconies.
Putty finished plastic emulsion painted walls in the entire apartment.
Anti-skid bath room floor tiles with glazed wall tiles up to ceiling.
CP fittings - Jaquar or equivalent and Sanitary Fittings - Cera or equivalent
Fire retardant (FR) cables - Finolex or equivalent, MCBs and ELCB - Legrand or equivalent
Modular Switches - Legrand or equivalent
Polished front door fitted with Godrej or equivalent lock, inside Flush Doors and powder coated Aluminium Windows with Glass & Grill.
32 Amps A/c. point-3 points for 3 BHK flat and 2 points for 2BHK flat.
16 Amps plug point- 5 points per 3 BHK flat and 6 points per 2 BHK flat, including Geyser point in all toilets. (Additional electrical points on request will be charged extra).
Provision for Aqua Guard.
Provision for Geyser and Exhaust Fan in all Toilets.
     ','3.5 Cr','14000 per month','16 lakhs per year','1');
/*!40000 ALTER TABLE "tbl_constructiondetails" ENABLE KEYS;*/
UNLOCK TABLES;


#
# Table structure for table 'tbl_constructiontype'
#

CREATE TABLE /*!32312 IF NOT EXISTS*/ "tbl_constructiontype" (
  "constructiontype_id" int(11) NOT NULL auto_increment,
  "constructiontype_type" varchar(100) default NULL,
  PRIMARY KEY  ("constructiontype_id")
) AUTO_INCREMENT=5;



#
# Dumping data for table 'tbl_constructiontype'
#

LOCK TABLES "tbl_constructiontype" WRITE;
/*!40000 ALTER TABLE "tbl_constructiontype" DISABLE KEYS;*/
REPLACE INTO "tbl_constructiontype" ("constructiontype_id", "constructiontype_type") VALUES
	(1,'House');
REPLACE INTO "tbl_constructiontype" ("constructiontype_id", "constructiontype_type") VALUES
	(2,'Villa');
REPLACE INTO "tbl_constructiontype" ("constructiontype_id", "constructiontype_type") VALUES
	(3,'Flats');
REPLACE INTO "tbl_constructiontype" ("constructiontype_id", "constructiontype_type") VALUES
	(4,'Apartments');
/*!40000 ALTER TABLE "tbl_constructiontype" ENABLE KEYS;*/
UNLOCK TABLES;


#
# Table structure for table 'tbl_district'
#

CREATE TABLE /*!32312 IF NOT EXISTS*/ "tbl_district" (
  "district_id" int(11) NOT NULL auto_increment,
  "district_name" varchar(50) default NULL,
  PRIMARY KEY  ("district_id")
) AUTO_INCREMENT=16;



#
# Dumping data for table 'tbl_district'
#

LOCK TABLES "tbl_district" WRITE;
/*!40000 ALTER TABLE "tbl_district" DISABLE KEYS;*/
REPLACE INTO "tbl_district" ("district_id", "district_name") VALUES
	(1,'Alapuzha');
REPLACE INTO "tbl_district" ("district_id", "district_name") VALUES
	(3,'Ernakulam');
REPLACE INTO "tbl_district" ("district_id", "district_name") VALUES
	(4,'Idukki');
REPLACE INTO "tbl_district" ("district_id", "district_name") VALUES
	(5,'Kannur');
REPLACE INTO "tbl_district" ("district_id", "district_name") VALUES
	(6,'Kasargod');
REPLACE INTO "tbl_district" ("district_id", "district_name") VALUES
	(7,'Kollam');
REPLACE INTO "tbl_district" ("district_id", "district_name") VALUES
	(8,'Kottayam');
REPLACE INTO "tbl_district" ("district_id", "district_name") VALUES
	(9,'Kozhikod');
REPLACE INTO "tbl_district" ("district_id", "district_name") VALUES
	(10,'Malappuram');
REPLACE INTO "tbl_district" ("district_id", "district_name") VALUES
	(11,'Palakkad');
REPLACE INTO "tbl_district" ("district_id", "district_name") VALUES
	(12,'Pathanamthitta');
REPLACE INTO "tbl_district" ("district_id", "district_name") VALUES
	(13,'Thiruvananthapuram');
REPLACE INTO "tbl_district" ("district_id", "district_name") VALUES
	(14,'Thrissur');
REPLACE INTO "tbl_district" ("district_id", "district_name") VALUES
	(15,'Wayanad');
/*!40000 ALTER TABLE "tbl_district" ENABLE KEYS;*/
UNLOCK TABLES;


#
# Table structure for table 'tbl_leaseapplication'
#

CREATE TABLE /*!32312 IF NOT EXISTS*/ "tbl_leaseapplication" (
  "leaseapply_id" int(11) NOT NULL auto_increment,
  "leaseapply_date" date default NULL,
  "user_id" int(11) default NULL,
  "constructiondetails_id" int(11) default NULL,
  "leaseapply_status" varchar(50) default NULL,
  PRIMARY KEY  ("leaseapply_id")
);



#
# Dumping data for table 'tbl_leaseapplication'
#

# No data found.



#
# Table structure for table 'tbl_leaselist'
#

CREATE TABLE /*!32312 IF NOT EXISTS*/ "tbl_leaselist" (
  "leaselist_id" int(11) NOT NULL auto_increment,
  "constructiontype_id" int(11) default NULL,
  "user_id" int(11) default NULL,
  "leaserate" varchar(50) default NULL,
  "photo" varchar(50) default NULL,
  "totalarea" varchar(50) default NULL,
  "noofbedroom" varchar(50) default NULL,
  "noofbathroom" varchar(50) default NULL,
  "lease_description" varchar(500) default NULL,
  PRIMARY KEY  ("leaselist_id")
);



#
# Dumping data for table 'tbl_leaselist'
#

# No data found.



#
# Table structure for table 'tbl_login'
#

CREATE TABLE /*!32312 IF NOT EXISTS*/ "tbl_login" (
  "login_id" int(11) NOT NULL auto_increment,
  "login_username" varchar(50) default NULL,
  "login_password" varchar(50) default NULL,
  "login_usertype" varchar(100) default NULL,
  PRIMARY KEY  ("login_id")
) AUTO_INCREMENT=29;



#
# Dumping data for table 'tbl_login'
#

LOCK TABLES "tbl_login" WRITE;
/*!40000 ALTER TABLE "tbl_login" DISABLE KEYS;*/
REPLACE INTO "tbl_login" ("login_id", "login_username", "login_password", "login_usertype") VALUES
	(1,'assethomes','asset','Builder');
REPLACE INTO "tbl_login" ("login_id", "login_username", "login_password", "login_usertype") VALUES
	(3,'skyline','skyline','Builder');
REPLACE INTO "tbl_login" ("login_id", "login_username", "login_password", "login_usertype") VALUES
	(9,'mirrealtors','mir','Builder');
REPLACE INTO "tbl_login" ("login_id", "login_username", "login_password", "login_usertype") VALUES
	(10,'akhila','akhila','Builder');
REPLACE INTO "tbl_login" ("login_id", "login_username", "login_password", "login_usertype") VALUES
	(11,'joseph','jose','Technician');
REPLACE INTO "tbl_login" ("login_id", "login_username", "login_password", "login_usertype") VALUES
	(12,'joseph','jose','Technician');
REPLACE INTO "tbl_login" ("login_id", "login_username", "login_password", "login_usertype") VALUES
	(13,'joicy','joic','Technician');
REPLACE INTO "tbl_login" ("login_id", "login_username", "login_password", "login_usertype") VALUES
	(14,'admin','admin','Admin');
REPLACE INTO "tbl_login" ("login_id", "login_username", "login_password", "login_usertype") VALUES
	(15,'tech','technician','Technician');
REPLACE INTO "tbl_login" ("login_id", "login_username", "login_password", "login_usertype") VALUES
	(17,'anjaliks','anju','User');
REPLACE INTO "tbl_login" ("login_id", "login_username", "login_password", "login_usertype") VALUES
	(18,'neenajoy','neena','User');
REPLACE INTO "tbl_login" ("login_id", "login_username", "login_password", "login_usertype") VALUES
	(19,'abad','abadbuild','Builder');
REPLACE INTO "tbl_login" ("login_id", "login_username", "login_password", "login_usertype") VALUES
	(20,'manu','manu','Technician');
REPLACE INTO "tbl_login" ("login_id", "login_username", "login_password", "login_usertype") VALUES
	(21,'manikuttan','mani','Technician');
REPLACE INTO "tbl_login" ("login_id", "login_username", "login_password", "login_usertype") VALUES
	(22,'arunkumar','arun12','Technician');
REPLACE INTO "tbl_login" ("login_id", "login_username", "login_password", "login_usertype") VALUES
	(23,'Asset Homes','asset123','Builder');
REPLACE INTO "tbl_login" ("login_id", "login_username", "login_password", "login_usertype") VALUES
	(24,'desaihomes','desaihomes','Builder');
REPLACE INTO "tbl_login" ("login_id", "login_username", "login_password", "login_usertype") VALUES
	(28,'Sneha','sneha','User');
/*!40000 ALTER TABLE "tbl_login" ENABLE KEYS;*/
UNLOCK TABLES;


#
# Table structure for table 'tbl_postrequirements'
#

CREATE TABLE /*!32312 IF NOT EXISTS*/ "tbl_postrequirements" (
  "req_id" int(11) NOT NULL auto_increment,
  "user_id" int(10) unsigned default NULL,
  "place" varchar(50) default NULL,
  "no_of_bedrooms" int(10) unsigned default NULL,
  "area_of_selection" varchar(50) default NULL,
  "budget_min" int(11) default NULL,
  "budget_max" int(11) default NULL,
  "req_type" int(11) default NULL,
  "upload_plan" varchar(50) default NULL,
  PRIMARY KEY  ("req_id")
);



#
# Dumping data for table 'tbl_postrequirements'
#

# No data found.



#
# Table structure for table 'tbl_property'
#

CREATE TABLE /*!32312 IF NOT EXISTS*/ "tbl_property" (
  "property_id" int(11) NOT NULL auto_increment,
  "property_image" varchar(50) default NULL,
  "property_caption" varchar(50) default NULL,
  "constructiontype_id" int(11) default NULL,
  "property_placedetails" varchar(500) default NULL,
  "property_sqft" varchar(50) default NULL,
  "property_details" varchar(500) default NULL,
  "property_status" int(11) default '0',
  "user_id" int(11) default NULL,
  PRIMARY KEY  ("property_id")
) AUTO_INCREMENT=7;



#
# Dumping data for table 'tbl_property'
#

LOCK TABLES "tbl_property" WRITE;
/*!40000 ALTER TABLE "tbl_property" DISABLE KEYS;*/
REPLACE INTO "tbl_property" ("property_id", "property_image", "property_caption", "constructiontype_id", "property_placedetails", "property_sqft", "property_details", "property_status", "user_id") VALUES
	(1,'F:OnlineHomeimagesforsellingpropertyimage1.jpeg',NULL,2,'kaloor,Ernakulam','2800 Sq feet','Flooring:Marble, Gated Community:Yes, Parking:1 Covered, 1 Open, Water Source:Municipal corporation,Borewell/Tank, Power Backup:Partial',2,NULL);
REPLACE INTO "tbl_property" ("property_id", "property_image", "property_caption", "constructiontype_id", "property_placedetails", "property_sqft", "property_details", "property_status", "user_id") VALUES
	(2,'F:OnlineHomeimagesforsellingIA8B4003.JPG',NULL,1,'Pala,Kottayam','12000 Sq feet','qwetrdfdhsfvkjd hdhfguedfbv bruyfgfbeefaiey hbvbsfugbf nhjbgfbjgf',2,NULL);
REPLACE INTO "tbl_property" ("property_id", "property_image", "property_caption", "constructiontype_id", "property_placedetails", "property_sqft", "property_details", "property_status", "user_id") VALUES
	(3,'F:OnlineHomeimagesforsellingIA8B4003.JPG',NULL,1,'Cherthala,Alapuzha     ','5000 Sq feet','udshvfdhv hvdfbjhfu hvudfvdhfv hfuvdf',2,NULL);
REPLACE INTO "tbl_property" ("property_id", "property_image", "property_caption", "constructiontype_id", "property_placedetails", "property_sqft", "property_details", "property_status", "user_id") VALUES
	(4,'property_1672.jpeg',NULL,2,'Allapuzha,Kerala','2900 Sq','good surroundings and water supply.',2,NULL);
REPLACE INTO "tbl_property" ("property_id", "property_image", "property_caption", "constructiontype_id", "property_placedetails", "property_sqft", "property_details", "property_status", "user_id") VALUES
	(5,'property_1920.jpeg',NULL,2,'kaloor,Ernakulam','2800 Sq feet','4 bedroom and 4 bathroom.Flooring:Marble, Gated Community:Yes, Parking:1 Covered, 1 Open, Water Source:Municipal corporation,Borewell/Tank, Power Backup:Partial',1,8);
REPLACE INTO "tbl_property" ("property_id", "property_image", "property_caption", "constructiontype_id", "property_placedetails", "property_sqft", "property_details", "property_status", "user_id") VALUES
	(6,'property_1861.jpg','2 BDK House For Sale',1,'in Kottayam District.      ','2800 Sq feet','Flooring:
High quality vitrified tiles with vitrified skirting for Living, Dining and Bedrooms.Antiskid/Matt tiles - Ceramic/Vitrified for Kitchen, Balcony and Toilets.
Entrance lobby, Staircase & Common areas will be of granite/Vitrified flooring.Granite kitchen counter, single-bowl stainless steel sink with drain board.
Toilet Fittings:
White sanitary ware including European water closet and washbasin. Good quality chromium-plated taps, mixer, and shower. Towel rods.',1,6);
/*!40000 ALTER TABLE "tbl_property" ENABLE KEYS;*/
UNLOCK TABLES;


#
# Table structure for table 'tbl_propertybooking'
#

CREATE TABLE /*!32312 IF NOT EXISTS*/ "tbl_propertybooking" (
  "pbooking_id" int(11) NOT NULL auto_increment,
  "pbooking_date" date default NULL,
  "user_id" int(11) default NULL,
  "propertydetails_id" int(11) default NULL,
  "pbooking_status" varchar(50) default '0',
  PRIMARY KEY  ("pbooking_id")
);



#
# Dumping data for table 'tbl_propertybooking'
#

# No data found.



#
# Table structure for table 'tbl_propertydetails'
#

CREATE TABLE /*!32312 IF NOT EXISTS*/ "tbl_propertydetails" (
  "propertydetails_id" int(11) NOT NULL auto_increment,
  "property_id" int(11) default NULL,
  "propertydetails_description" varchar(1000) default NULL,
  "property_amount" int(11) default NULL,
  "property_rentamount" int(11) default NULL,
  "property_leaseamount" int(11) default NULL,
  "propertydetails_status" varchar(50) default '0',
  PRIMARY KEY  ("propertydetails_id")
);



#
# Dumping data for table 'tbl_propertydetails'
#

# No data found.



#
# Table structure for table 'tbl_propertylease'
#

CREATE TABLE /*!32312 IF NOT EXISTS*/ "tbl_propertylease" (
  "propertylease_id" int(11) NOT NULL auto_increment,
  "propertylease_date" date default NULL,
  "user_id" int(11) default NULL,
  "propertydetails_id" int(11) default NULL,
  "propertylease_status" varchar(50) default '0',
  PRIMARY KEY  ("propertylease_id")
);



#
# Dumping data for table 'tbl_propertylease'
#

# No data found.



#
# Table structure for table 'tbl_propertyrent'
#

CREATE TABLE /*!32312 IF NOT EXISTS*/ "tbl_propertyrent" (
  "propertyrent_id" int(11) NOT NULL auto_increment,
  "propertyrent_date" date default NULL,
  "user_id" int(11) default NULL,
  "propertydetails_id" int(11) default NULL,
  "propertyrent_status" varchar(50) default '0',
  PRIMARY KEY  ("propertyrent_id")
);



#
# Dumping data for table 'tbl_propertyrent'
#

# No data found.



#
# Table structure for table 'tbl_rating'
#

CREATE TABLE /*!32312 IF NOT EXISTS*/ "tbl_rating" (
  "rating_id" int(11) NOT NULL auto_increment,
  "rating_value" int(11) default NULL,
  "user_id" int(11) default NULL,
  "builders_id" int(11) default NULL,
  PRIMARY KEY  ("rating_id")
);



#
# Dumping data for table 'tbl_rating'
#

# No data found.



#
# Table structure for table 'tbl_rentapplication'
#

CREATE TABLE /*!32312 IF NOT EXISTS*/ "tbl_rentapplication" (
  "rentapplication_id" int(11) NOT NULL auto_increment,
  "user_id" int(11) default NULL,
  "constructiondetails_id" int(11) default NULL,
  "date" date default NULL,
  "status" varchar(50) default '0',
  PRIMARY KEY  ("rentapplication_id")
) AUTO_INCREMENT=3;



#
# Dumping data for table 'tbl_rentapplication'
#

LOCK TABLES "tbl_rentapplication" WRITE;
/*!40000 ALTER TABLE "tbl_rentapplication" DISABLE KEYS;*/
REPLACE INTO "tbl_rentapplication" ("rentapplication_id", "user_id", "constructiondetails_id", "date", "status") VALUES
	(1,8,6,'2018-03-21','0');
REPLACE INTO "tbl_rentapplication" ("rentapplication_id", "user_id", "constructiondetails_id", "date", "status") VALUES
	(2,8,6,'2018-03-21','2');
/*!40000 ALTER TABLE "tbl_rentapplication" ENABLE KEYS;*/
UNLOCK TABLES;


#
# Table structure for table 'tbl_rentlist'
#

CREATE TABLE /*!32312 IF NOT EXISTS*/ "tbl_rentlist" (
  "rentlist_id" int(11) NOT NULL auto_increment,
  "constructiontype_id" int(11) default NULL,
  "user_id" int(10) unsigned default NULL,
  "totalarea" varchar(50) default NULL,
  "noofbedroom" varchar(50) default NULL,
  "noofbath" varchar(50) default NULL,
  "rentamount" varchar(50) default NULL,
  "photo" varchar(50) default NULL,
  "description" varchar(500) default NULL,
  PRIMARY KEY  ("rentlist_id")
);



#
# Dumping data for table 'tbl_rentlist'
#

# No data found.



#
# Table structure for table 'tbl_site'
#

CREATE TABLE /*!32312 IF NOT EXISTS*/ "tbl_site" (
  "site_id" int(11) NOT NULL auto_increment,
  "site_name" varchar(100) default NULL,
  "site_address" varchar(500) default NULL,
  "site_totalarea" varchar(100) default NULL,
  "place_id" int(11) default NULL,
  "builders_id" int(11) default NULL,
  PRIMARY KEY  ("site_id")
);



#
# Dumping data for table 'tbl_site'
#

# No data found.



#
# Table structure for table 'tbl_technicians'
#

CREATE TABLE /*!32312 IF NOT EXISTS*/ "tbl_technicians" (
  "technician_id" int(11) NOT NULL auto_increment,
  "technician_name" varchar(50) default NULL,
  "technician_address" varchar(100) default NULL,
  "technician_contact" varchar(30) default NULL,
  "technician_email" varchar(50) default NULL,
  "technician_photo" varchar(100) default NULL,
  "techniciantype_id" int(11) default NULL,
  "technician_experience" varchar(50) default NULL,
  "technician_proof" varchar(50) default NULL,
  "district_id" int(10) default NULL,
  "technician_status" varchar(50) default '0',
  "login_id" int(11) default NULL,
  PRIMARY KEY  ("technician_id")
) AUTO_INCREMENT=8;



#
# Dumping data for table 'tbl_technicians'
#

LOCK TABLES "tbl_technicians" WRITE;
/*!40000 ALTER TABLE "tbl_technicians" DISABLE KEYS;*/
REPLACE INTO "tbl_technicians" ("technician_id", "technician_name", "technician_address", "technician_contact", "technician_email", "technician_photo", "techniciantype_id", "technician_experience", "technician_proof", "district_id", "technician_status", "login_id") VALUES
	(2,'P.D Joseph','Padaserry House,kannamaly P.O','9876754345','joseph@gmail.com','PHOTO_1548.png',3,'3 years','PROOF_1571.jpg',3,'1',12);
REPLACE INTO "tbl_technicians" ("technician_id", "technician_name", "technician_address", "technician_contact", "technician_email", "technician_photo", "techniciantype_id", "technician_experience", "technician_proof", "district_id", "technician_status", "login_id") VALUES
	(3,'Mary Joicy','Vaikom,Kottayam','9897656434','joicy@gmail.com','PHOTO_1442.png',1,'3 years','PROOF_1891.jpg',8,'2',13);
REPLACE INTO "tbl_technicians" ("technician_id", "technician_name", "technician_address", "technician_contact", "technician_email", "technician_photo", "techniciantype_id", "technician_experience", "technician_proof", "district_id", "technician_status", "login_id") VALUES
	(4,'tech','hello','9874563221','tech@gmail.com','PHOTO_1229.png',1,'5 years','PROOF_1587.jpg',4,'1',15);
REPLACE INTO "tbl_technicians" ("technician_id", "technician_name", "technician_address", "technician_contact", "technician_email", "technician_photo", "techniciantype_id", "technician_experience", "technician_proof", "district_id", "technician_status", "login_id") VALUES
	(5,'Manu George','kalliayath house,irrikkal p.o ','9987546326','manu@gmail.com','PHOTO_1033.png',2,'2 years','PROOF_1890.jpg',10,'1',20);
REPLACE INTO "tbl_technicians" ("technician_id", "technician_name", "technician_address", "technician_contact", "technician_email", "technician_photo", "techniciantype_id", "technician_experience", "technician_proof", "district_id", "technician_status", "login_id") VALUES
	(6,'Manikuttan P.R','Harinivas,Irranjakkulam','9888767543','manikuttan@gmail.com','PHOTO_1553.png',3,'4 years','PROOF_1590.jpg',12,'1',21);
REPLACE INTO "tbl_technicians" ("technician_id", "technician_name", "technician_address", "technician_contact", "technician_email", "technician_photo", "techniciantype_id", "technician_experience", "technician_proof", "district_id", "technician_status", "login_id") VALUES
	(7,'Arunkumar M.A','arun house','9898977878','arun12@gmail.com','PHOTO_1230.png',2,'12 years','PROOF_1544.jpg',14,'1',22);
/*!40000 ALTER TABLE "tbl_technicians" ENABLE KEYS;*/
UNLOCK TABLES;


#
# Table structure for table 'tbl_techniciantype'
#

CREATE TABLE /*!32312 IF NOT EXISTS*/ "tbl_techniciantype" (
  "techniciantype_id" int(11) NOT NULL auto_increment,
  "techniciantype_type" varchar(100) default NULL,
  PRIMARY KEY  ("techniciantype_id")
) AUTO_INCREMENT=4;



#
# Dumping data for table 'tbl_techniciantype'
#

LOCK TABLES "tbl_techniciantype" WRITE;
/*!40000 ALTER TABLE "tbl_techniciantype" DISABLE KEYS;*/
REPLACE INTO "tbl_techniciantype" ("techniciantype_id", "techniciantype_type") VALUES
	(1,'Plumber');
REPLACE INTO "tbl_techniciantype" ("techniciantype_id", "techniciantype_type") VALUES
	(2,'Carpender');
REPLACE INTO "tbl_techniciantype" ("techniciantype_id", "techniciantype_type") VALUES
	(3,'Electrician');
/*!40000 ALTER TABLE "tbl_techniciantype" ENABLE KEYS;*/
UNLOCK TABLES;


#
# Table structure for table 'tbl_userbooking'
#

CREATE TABLE /*!32312 IF NOT EXISTS*/ "tbl_userbooking" (
  "userbooking_id" int(11) NOT NULL auto_increment,
  "userbooking_date" date default NULL,
  "user_id" int(11) default NULL,
  "constructiondetails_id" int(10) default NULL,
  "status" int(3) default '0',
  PRIMARY KEY  ("userbooking_id")
) AUTO_INCREMENT=4;



#
# Dumping data for table 'tbl_userbooking'
#

LOCK TABLES "tbl_userbooking" WRITE;
/*!40000 ALTER TABLE "tbl_userbooking" DISABLE KEYS;*/
REPLACE INTO "tbl_userbooking" ("userbooking_id", "userbooking_date", "user_id", "constructiondetails_id", "status") VALUES
	(1,'2018-03-20',6,3,1);
REPLACE INTO "tbl_userbooking" ("userbooking_id", "userbooking_date", "user_id", "constructiondetails_id", "status") VALUES
	(2,'2018-03-21',6,5,1);
REPLACE INTO "tbl_userbooking" ("userbooking_id", "userbooking_date", "user_id", "constructiondetails_id", "status") VALUES
	(3,'2018-03-22',6,6,0);
/*!40000 ALTER TABLE "tbl_userbooking" ENABLE KEYS;*/
UNLOCK TABLES;


#
# Table structure for table 'tbl_workapplication'
#

CREATE TABLE /*!32312 IF NOT EXISTS*/ "tbl_workapplication" (
  "workapplication_id" int(11) NOT NULL auto_increment,
  "workapplication_date" date default NULL,
  "workpost_id" int(11) default NULL,
  "user_id" int(10) unsigned default NULL,
  "technician_id" int(11) default NULL,
  "workapplication_budget" varchar(100) default NULL,
  "status" varchar(50) default NULL,
  PRIMARY KEY  ("workapplication_id")
);



#
# Dumping data for table 'tbl_workapplication'
#

# No data found.



#
# Table structure for table 'tbl_workpost'
#

CREATE TABLE /*!32312 IF NOT EXISTS*/ "tbl_workpost" (
  "workpost_id" int(11) NOT NULL auto_increment,
  "workpost_date" varchar(50) default NULL,
  "technician_id" int(11) default NULL,
  "work_details" varchar(100) default NULL,
  "work_budget" varchar(50) default NULL,
  "work_image" varchar(50) default NULL,
  PRIMARY KEY  ("workpost_id")
) AUTO_INCREMENT=2;



#
# Dumping data for table 'tbl_workpost'
#

LOCK TABLES "tbl_workpost" WRITE;
/*!40000 ALTER TABLE "tbl_workpost" DISABLE KEYS;*/
REPLACE INTO "tbl_workpost" ("workpost_id", "workpost_date", "technician_id", "work_details", "work_budget", "work_image") VALUES
	(1,'20-03-2018',7,'Carpendery Work for Stairs','30000','img_2015.jpg');
/*!40000 ALTER TABLE "tbl_workpost" ENABLE KEYS;*/
UNLOCK TABLES;


#
# Table structure for table 'tb_user'
#

CREATE TABLE /*!32312 IF NOT EXISTS*/ "tb_user" (
  "user_id" int(11) NOT NULL auto_increment,
  "user_name" varchar(100) default NULL,
  "user_address" varchar(100) default NULL,
  "user_contact" varchar(50) default NULL,
  "user_gender" varchar(10) default NULL,
  "user_dob" varchar(50) default NULL,
  "user_emailid" varchar(50) default NULL,
  "user_photo" varchar(50) default NULL,
  "user_proof" varchar(50) default NULL,
  "district_id" int(50) default NULL,
  "login_id" int(11) default NULL,
  PRIMARY KEY  ("user_id")
) AUTO_INCREMENT=9;



#
# Dumping data for table 'tb_user'
#

LOCK TABLES "tb_user" WRITE;
/*!40000 ALTER TABLE "tb_user" DISABLE KEYS;*/
REPLACE INTO "tb_user" ("user_id", "user_name", "user_address", "user_contact", "user_gender", "user_dob", "user_emailid", "user_photo", "user_proof", "district_id", "login_id") VALUES
	(2,'Anjali','Love Shore','9874564345','Female','8th january','anjaliks@gmail.com','i am anjali',NULL,3,15);
REPLACE INTO "tb_user" ("user_id", "user_name", "user_address", "user_contact", "user_gender", "user_dob", "user_emailid", "user_photo", "user_proof", "district_id", "login_id") VALUES
	(3,'Mary Joicy','Vaikom','9874564347','Female','22th september','mary@gmail.com','proofjoicy.jpg',NULL,3,16);
REPLACE INTO "tb_user" ("user_id", "user_name", "user_address", "user_contact", "user_gender", "user_dob", "user_emailid", "user_photo", "user_proof", "district_id", "login_id") VALUES
	(5,'Anjali K S','Anju House,Kaduthuruthi ','9786534256','Female','8 January','anjali@gmail.com','PHOTO_1540.png',NULL,8,17);
REPLACE INTO "tb_user" ("user_id", "user_name", "user_address", "user_contact", "user_gender", "user_dob", "user_emailid", "user_photo", "user_proof", "district_id", "login_id") VALUES
	(6,'Neena Joy','Mundakkal House','9867534235','Female','22 May','neena@gmail.com','PHOTO_2054.jpg',NULL,8,18);
REPLACE INTO "tb_user" ("user_id", "user_name", "user_address", "user_contact", "user_gender", "user_dob", "user_emailid", "user_photo", "user_proof", "district_id", "login_id") VALUES
	(8,'Sneha Xavier','Kanjiraparmbil House,A.k. Xavier Road,Kochi-5    ','96333497550','Female','10-04-1994','sneha@gmail.com','PHOTO_1443.jpg','Proof_1103.jpg',3,28);
/*!40000 ALTER TABLE "tb_user" ENABLE KEYS;*/
UNLOCK TABLES;
/*!40101 SET SQL_MODE=@OLD_SQL_MODE;*/
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;*/
