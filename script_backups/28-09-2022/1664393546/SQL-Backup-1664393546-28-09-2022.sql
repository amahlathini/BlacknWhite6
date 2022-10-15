-- phpMyAdmin SQL Dump
-- http://www.phpmyadmin.net
--
-- Host Connection Info: Localhost via UNIX socket
-- Generation Time: September 28, 2022 at 19:32 PM ( UTC )
-- Server version: 10.3.36-MariaDB-log-cll-lve
-- PHP Version: 7.2.34
--

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;


-- ---------------------------------------------------------
--
-- Table structure for table : `activities`
--
-- ---------------------------------------------------------

CREATE TABLE `activities` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL DEFAULT 0,
  `track_id` int(11) NOT NULL DEFAULT 0,
  `product_id` int(11) NOT NULL DEFAULT 0,
  `event_id` int(11) NOT NULL DEFAULT 0,
  `type` varchar(21) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `time` int(11) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`),
  KEY `user_id` (`user_id`),
  KEY `track_id` (`track_id`),
  KEY `time` (`time`),
  KEY `product_id` (`product_id`),
  KEY `event_id` (`event_id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `activities`
--

INSERT INTO activities VALUES
("1","1","1","0","0","uploaded_track","1658165464"),
("9","8","1","0","0","commented_track","1661288503");

-- ---------------------------------------------------------
--
-- Table structure for table : `address`
--
-- ---------------------------------------------------------

CREATE TABLE `address` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL DEFAULT 0,
  `name` varchar(100) CHARACTER SET utf8 NOT NULL DEFAULT '',
  `phone` varchar(50) CHARACTER SET utf8 NOT NULL DEFAULT '',
  `country` varchar(100) CHARACTER SET utf8 NOT NULL DEFAULT '',
  `city` varchar(100) CHARACTER SET utf8 NOT NULL DEFAULT '',
  `zip` varchar(20) CHARACTER SET utf8 NOT NULL DEFAULT '',
  `address` text CHARACTER SET utf8 DEFAULT NULL,
  `time` int(11) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`),
  KEY `user_id` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- ---------------------------------------------------------
--
-- Table structure for table : `admin_invitations`
--
-- ---------------------------------------------------------

CREATE TABLE `admin_invitations` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `code` varchar(300) NOT NULL DEFAULT '0',
  `posted` varchar(50) NOT NULL DEFAULT '0',
  `status` varchar(50) CHARACTER SET utf8mb4 DEFAULT 'Pending',
  PRIMARY KEY (`id`),
  KEY `code` (`code`(255))
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ---------------------------------------------------------
--
-- Table structure for table : `ads_transactions`
--
-- ---------------------------------------------------------

CREATE TABLE `ads_transactions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `ad_id` int(11) NOT NULL DEFAULT 0,
  `track_owner` int(11) NOT NULL DEFAULT 0,
  `amount` varchar(11) NOT NULL DEFAULT '0',
  `type` varchar(21) NOT NULL DEFAULT '',
  `time` varchar(50) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  KEY `ad_id` (`ad_id`),
  KEY `track_owner` (`track_owner`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ---------------------------------------------------------
--
-- Table structure for table : `albums`
--
-- ---------------------------------------------------------

CREATE TABLE `albums` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `album_id` varchar(16) NOT NULL DEFAULT '',
  `user_id` int(11) NOT NULL DEFAULT 0,
  `title` varchar(100) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `description` text CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `category_id` int(11) NOT NULL DEFAULT 0,
  `thumbnail` varchar(200) NOT NULL DEFAULT '',
  `time` int(11) NOT NULL DEFAULT 0,
  `registered` varchar(15) NOT NULL DEFAULT '00/0000',
  `price` float NOT NULL DEFAULT 0,
  `purchases` int(11) unsigned DEFAULT 0,
  PRIMARY KEY (`id`),
  UNIQUE KEY `album_id` (`album_id`),
  KEY `user_id` (`user_id`),
  KEY `title` (`title`),
  KEY `price` (`price`),
  KEY `time` (`time`),
  KEY `category_id` (`category_id`),
  KEY `registered` (`registered`),
  KEY `purchases` (`purchases`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ---------------------------------------------------------
--
-- Table structure for table : `announcement`
--
-- ---------------------------------------------------------

CREATE TABLE `announcement` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `text` text DEFAULT NULL,
  `time` int(32) NOT NULL DEFAULT 0,
  `active` enum('0','1') NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`),
  KEY `active` (`active`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ---------------------------------------------------------
--
-- Table structure for table : `announcement_views`
--
-- ---------------------------------------------------------

CREATE TABLE `announcement_views` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL DEFAULT 0,
  `announcement_id` int(11) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`),
  KEY `user_id` (`user_id`),
  KEY `announcement_id` (`announcement_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ---------------------------------------------------------
--
-- Table structure for table : `apps_sessions`
--
-- ---------------------------------------------------------

CREATE TABLE `apps_sessions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL DEFAULT 0,
  `session_id` varchar(120) NOT NULL DEFAULT '',
  `platform` varchar(32) NOT NULL DEFAULT '',
  `platform_details` text DEFAULT NULL,
  `time` int(11) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`),
  UNIQUE KEY `session_id` (`session_id`),
  KEY `user_id` (`user_id`),
  KEY `platform` (`platform`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `apps_sessions`
--

INSERT INTO apps_sessions VALUES
("1","1","53cf10bf067db7d276840fe5006b14f1f682e94716581640601b80e3c38df2d01f452c9260c6a273fd","web","a:6:{s:9:\"userAgent\";s:80:\"Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101 Firefox/102.0\";s:4:\"name\";s:15:\"Mozilla Firefox\";s:7:\"version\";s:5:\"102.0\";s:8:\"platform\";s:7:\"windows\";s:7:\"pattern\";s:67:\"#(?<browser>Version|Firefox|other)[/ ]+(?<version>[0-9.|a-zA-Z.]*)#\";s:10:\"ip_address\";s:14:\"163.116.180.51\";}","1664388669"),
("3","2","79304c8b9292b921ff93f2516f77195e619bac4e1658166978a043c5af55ecc727a3ffa362585fbba5","web","a:6:{s:9:\"userAgent\";s:80:\"Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101 Firefox/102.0\";s:4:\"name\";s:15:\"Mozilla Firefox\";s:7:\"version\";s:5:\"102.0\";s:8:\"platform\";s:7:\"windows\";s:7:\"pattern\";s:67:\"#(?<browser>Version|Firefox|other)[/ ]+(?<version>[0-9.|a-zA-Z.]*)#\";s:10:\"ip_address\";s:14:\"163.116.180.51\";}","1658167069"),
("8","2","47e2af96efa982163fbfdd040f08b5b52c799ea7166299895127132855a3dcbc286bdb1a652f53ffdb","web","a:6:{s:9:\"userAgent\";s:80:\"Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:104.0) Gecko/20100101 Firefox/104.0\";s:4:\"name\";s:15:\"Mozilla Firefox\";s:7:\"version\";s:5:\"104.0\";s:8:\"platform\";s:7:\"windows\";s:7:\"pattern\";s:67:\"#(?<browser>Version|Firefox|other)[/ ]+(?<version>[0-9.|a-zA-Z.]*)#\";s:10:\"ip_address\";s:15:\"163.116.164.115\";}","1663009285"),
("9","1","77d0a3d41613d0d7e4ea93fd9e19ad627569811e16643806871b3bc018ca4f0c34b2c44c7408258ef9","web","a:6:{s:9:\"userAgent\";s:111:\"Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/105.0.0.0 Safari/537.36\";s:4:\"name\";s:13:\"Google Chrome\";s:7:\"version\";s:9:\"105.0.0.0\";s:8:\"platform\";s:7:\"windows\";s:7:\"pattern\";s:66:\"#(?<browser>Version|Chrome|other)[/ ]+(?<version>[0-9.|a-zA-Z.]*)#\";s:10:\"ip_address\";s:14:\"163.116.180.51\";}","1664380688");

-- ---------------------------------------------------------
--
-- Table structure for table : `artist_requests`
--
-- ---------------------------------------------------------

CREATE TABLE `artist_requests` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `website` varchar(100) NOT NULL DEFAULT '',
  `details` text CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `category_id` int(11) NOT NULL DEFAULT 0,
  `photo` varchar(150) NOT NULL DEFAULT '',
  `passport` varchar(150) NOT NULL DEFAULT '',
  `time` int(11) NOT NULL DEFAULT 0,
  `user_id` int(11) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`),
  KEY `user_id` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ---------------------------------------------------------
--
-- Table structure for table : `artists_tags`
--
-- ---------------------------------------------------------

CREATE TABLE `artists_tags` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `artist_id` int(11) NOT NULL DEFAULT 0,
  `user_id` int(11) NOT NULL DEFAULT 0,
  `track_id` int(11) NOT NULL DEFAULT 0,
  `time` int(11) NOT NULL DEFAULT 0,
  `approved` int(11) NOT NULL DEFAULT 0,
  `seen` int(11) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`),
  KEY `artist_id` (`artist_id`),
  KEY `user_id` (`user_id`),
  KEY `track_id` (`track_id`),
  KEY `approved` (`approved`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `artists_tags`
--

INSERT INTO artists_tags VALUES
("1","1","8","2","1661288247","0","1661366606");

-- ---------------------------------------------------------
--
-- Table structure for table : `bad_login`
--
-- ---------------------------------------------------------

CREATE TABLE `bad_login` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `ip` varchar(100) NOT NULL DEFAULT '',
  `time` int(50) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`),
  KEY `ip` (`ip`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ---------------------------------------------------------
--
-- Table structure for table : `bank_receipts`
--
-- ---------------------------------------------------------

CREATE TABLE `bank_receipts` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(11) unsigned NOT NULL DEFAULT 0,
  `description` tinytext DEFAULT NULL,
  `price` varchar(50) NOT NULL DEFAULT '0',
  `mode` varchar(50) NOT NULL DEFAULT '',
  `track_id` varchar(50) CHARACTER SET utf8mb4 DEFAULT '',
  `approved` int(11) unsigned NOT NULL DEFAULT 0,
  `receipt_file` varchar(150) NOT NULL DEFAULT '',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `approved_at` int(11) unsigned NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ---------------------------------------------------------
--
-- Table structure for table : `banned_ip`
--
-- ---------------------------------------------------------

CREATE TABLE `banned_ip` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `ip_address` varchar(32) NOT NULL DEFAULT '',
  `time` int(11) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`),
  KEY `ip_address` (`ip_address`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ---------------------------------------------------------
--
-- Table structure for table : `blocks`
--
-- ---------------------------------------------------------

CREATE TABLE `blocks` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL DEFAULT 0,
  `blocked_id` int(11) NOT NULL DEFAULT 0,
  `time` int(11) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`),
  KEY `user_id` (`user_id`),
  KEY `blocked_id` (`blocked_id`),
  KEY `time` (`time`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ---------------------------------------------------------
--
-- Table structure for table : `blog`
--
-- ---------------------------------------------------------

CREATE TABLE `blog` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(120) NOT NULL DEFAULT '',
  `content` text DEFAULT NULL,
  `description` text DEFAULT NULL,
  `posted` varchar(300) DEFAULT '0',
  `category` int(255) DEFAULT 0,
  `thumbnail` varchar(100) DEFAULT 'upload/photos/d-blog.jpg',
  `view` int(11) DEFAULT 0,
  `shared` int(11) DEFAULT 0,
  `tags` varchar(300) DEFAULT '',
  `created_at` int(11) NOT NULL DEFAULT 0,
  `created_by` int(11) unsigned NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`),
  KEY `title` (`title`),
  KEY `category` (`category`),
  KEY `tags` (`tags`(255)),
  KEY `posted` (`posted`),
  KEY `created_by` (`created_by`),
  KEY `created_at` (`created_at`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ---------------------------------------------------------
--
-- Table structure for table : `blog_comments`
--
-- ---------------------------------------------------------

CREATE TABLE `blog_comments` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `article_id` int(11) NOT NULL DEFAULT 0,
  `user_id` int(11) NOT NULL DEFAULT 0,
  `value` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `time` int(11) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`),
  KEY `track_id` (`article_id`),
  KEY `user_id` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- ---------------------------------------------------------
--
-- Table structure for table : `blog_likes`
--
-- ---------------------------------------------------------

CREATE TABLE `blog_likes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `article_id` int(11) NOT NULL DEFAULT 0,
  `user_id` int(11) NOT NULL DEFAULT 0,
  `comment_id` int(11) unsigned NOT NULL DEFAULT 0,
  `time` int(11) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`),
  KEY `article_id` (`article_id`),
  KEY `user_id` (`user_id`),
  KEY `time` (`time`),
  KEY `comment_id` (`comment_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- ---------------------------------------------------------
--
-- Table structure for table : `card`
--
-- ---------------------------------------------------------

CREATE TABLE `card` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL DEFAULT 0,
  `product_id` int(11) NOT NULL DEFAULT 0,
  `units` int(11) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`),
  KEY `user_id` (`user_id`),
  KEY `product_id` (`product_id`),
  KEY `units` (`units`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- ---------------------------------------------------------
--
-- Table structure for table : `categories`
--
-- ---------------------------------------------------------

CREATE TABLE `categories` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `cateogry_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `tracks` int(11) NOT NULL DEFAULT 0,
  `color` varchar(20) NOT NULL DEFAULT '#333',
  `background_thumb` varchar(120) NOT NULL DEFAULT '',
  `time` int(11) DEFAULT 0,
  PRIMARY KEY (`id`),
  KEY `cateogry_name` (`cateogry_name`),
  KEY `tracks` (`tracks`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `categories`
--

INSERT INTO categories VALUES
("1","Other","0","#000000","upload/photos/2019/04/FaS2oOegTOBm5OpFJiCK_17_6ad5d4edf1fb542961a2a64a8d0768e7_image.jpg","0");

-- ---------------------------------------------------------
--
-- Table structure for table : `comment_replies`
--
-- ---------------------------------------------------------

CREATE TABLE `comment_replies` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `comment_id` int(11) NOT NULL DEFAULT 0,
  `user_id` int(11) NOT NULL DEFAULT 0,
  `value` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `time` int(11) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`),
  KEY `comment_id` (`comment_id`),
  KEY `user_id` (`user_id`),
  KEY `time` (`time`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ---------------------------------------------------------
--
-- Table structure for table : `comments`
--
-- ---------------------------------------------------------

CREATE TABLE `comments` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `track_id` int(11) NOT NULL DEFAULT 0,
  `user_id` int(11) NOT NULL DEFAULT 0,
  `value` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `songseconds` float NOT NULL DEFAULT 0,
  `songpercentage` float NOT NULL DEFAULT 0,
  `time` int(11) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`),
  KEY `track_id` (`track_id`),
  KEY `user_id` (`user_id`),
  KEY `time` (`time`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `comments`
--

INSERT INTO comments VALUES
("1","1","8","dope","0","0","1661288491"),
("2","1","8","dope??","0","0","1661288503");

-- ---------------------------------------------------------
--
-- Table structure for table : `config`
--
-- ---------------------------------------------------------

CREATE TABLE `config` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL DEFAULT '',
  `value` mediumtext CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_name` (`name`),
  KEY `name` (`name`),
  KEY `value` (`value`(255))
) ENGINE=InnoDB AUTO_INCREMENT=346 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `config`
--

INSERT INTO config VALUES
("1","theme","default"),
("2","censored_words",""),
("3","title","BlacknWhite6"),
("4","name","BlacknWhite6"),
("5","keyword","blacknwhite6, music, mzansi, africa, music,south africa, local, black, white, six"),
("6","email","info@blacknwhite6.com"),
("7","description",""),
("8","validation","on"),
("9","recaptcha","off"),
("10","recaptcha_key",""),
("11","language","english"),
("12","google_app_ID",""),
("13","google_app_key",""),
("14","facebook_app_ID",""),
("15","facebook_app_key",""),
("16","twitter_app_ID",""),
("17","twitter_app_key",""),
("21","smtp_or_mail","mail"),
("22","smtp_host",""),
("23","smtp_username",""),
("24","smtp_password",""),
("25","smtp_encryption","ssl"),
("26","smtp_port",""),
("27","delete_account","on"),
("36","last_admin_collection","1664391374"),
("37","user_statics","[{\"month\":\"January\",\"new_users\":0},{\"month\":\"February\",\"new_users\":0},{\"month\":\"March\",\"new_users\":0},{\"month\":\"April\",\"new_users\":0},{\"month\":\"May\",\"new_users\":0},{\"month\":\"June\",\"new_users\":0},{\"month\":\"July\",\"new_users\":7},{\"month\":\"August\",\"new_users\":2},{\"month\":\"September\",\"new_users\":1},{\"month\":\"October\",\"new_users\":0},{\"month\":\"November\",\"new_users\":0},{\"month\":\"December\",\"new_users\":0}]"),
("38","audio_statics","[{&quot;month&quot;:&quot;January&quot;,&quot;new_videos&quot;:0},{&quot;month&quot;:&quot;February&quot;,&quot;new_videos&quot;:0},{&quot;month&quot;:&quot;March&quot;,&quot;new_videos&quot;:0},{&quot;month&quot;:&quot;April&quot;,&quot;new_videos&quot;:0},{&quot;month&quot;:&quot;May&quot;,&quot;new_videos&quot;:0},{&quot;month&quot;:&quot;June&quot;,&quot;new_videos&quot;:0},{&quot;month&quot;:&quot;July&quot;,&quot;new_videos&quot;:15},{&quot;month&quot;:&quot;August&quot;,&quot;new_videos&quot;:18},{&quot;month&quot;:&quot;September&quot;,&quot;new_videos&quot;:0},{&quot;month&quot;:&quot;October&quot;,&quot;new_videos&quot;:0},{&quot;month&quot;:&quot;November&quot;,&quot;new_videos&quot;:0},{&quot;month&quot;:&quot;December&quot;,&quot;new_videos&quot;:0}]"),
("45","user_registration","on"),
("46","verification_badge","on"),
("49","fb_login","off"),
("50","tw_login","off"),
("51","plus_login","off"),
("52","wowonder_app_ID",""),
("53","wowonder_app_key",""),
("54","wowonder_domain_uri",""),
("56","wowonder_login","off"),
("57","wowonder_img",""),
("58","google",""),
("59","last_created_sitemap","22-03-2019"),
("60","is_ok","1"),
("63","go_pro","on"),
("64","paypal_id",""),
("65","paypal_secret",""),
("66","paypal_mode","sandbox"),
("67","last_backup","22-03-2019"),
("68","user_ads","on"),
("70","max_upload","1000000000"),
("71","s3_upload","off"),
("72","s3_bucket_name",""),
("73","amazone_s3_key",""),
("74","amazone_s3_s_key",""),
("75","region","us-east-1"),
("81","apps_api_key","25eb689c981de8d0d551ef25562bafd7b3bd86d2"),
("82","ffmpeg_system","off"),
("83","ffmpeg_binary_file","./ffmpeg/ffmpeg"),
("84","user_max_upload","1000000000"),
("86","convert_speed","faster"),
("87","night_mode","night"),
("90","ftp_host","localhost"),
("91","ftp_port","21"),
("92","ftp_username",""),
("93","ftp_password",""),
("94","ftp_upload","off"),
("95","ftp_endpoint","storage.wowonder.com"),
("96","ftp_path","./"),
("111","currency","ZAR"),
("112","commission","100"),
("113","pro_upload_limit","50"),
("114","pro_price","170"),
("115","server_key",""),
("116","facebook_url",""),
("117","twitter_url",""),
("118","google_url",""),
("119","currency_symbol","$"),
("120","maintenance_mode","off"),
("121","auto_friend_users","admin"),
("122","waves_color","#ffffff"),
("123","total_songs","1"),
("124","total_albums","0"),
("125","total_plays","27"),
("126","total_sales","22.99"),
("127","total_users","10"),
("128","total_artists","1"),
("129","total_playlists","0"),
("130","total_unactive_users","2"),
("132","songs_statics","[{\"month\":\"January\",\"new_songs\":0},{\"month\":\"February\",\"new_songs\":0},{\"month\":\"March\",\"new_songs\":0},{\"month\":\"April\",\"new_songs\":0},{\"month\":\"May\",\"new_songs\":0},{\"month\":\"June\",\"new_songs\":0},{\"month\":\"July\",\"new_songs\":1},{\"month\":\"August\",\"new_songs\":0},{\"month\":\"September\",\"new_songs\":0},{\"month\":\"October\",\"new_songs\":0},{\"month\":\"November\",\"new_songs\":0},{\"month\":\"December\",\"new_songs\":0}]"),
("133","version","1.4.6"),
("134","artist_sell","on"),
("135","stripe_version",""),
("136","stripe_secret",""),
("137","bank_payment","off"),
("138","bank_transfer_note","In order to confirm the bank transfer, you will need to upload a receipt or take a screenshot of your transfer within 1 day from your payment date. If a bank transfer is made but no receipt is uploaded within this period, your order will be cancelled. We will verify and confirm your receipt within 3 working days from the date you upload it."),
("139","who_can_download","pro"),
("140","stripe_currency","USD"),
("141","paypal_currency","USD"),
("142","push","0"),
("143","android_push_native","0"),
("144","ios_push_native","0"),
("145","android_m_push_id",""),
("146","android_m_push_key","");

--
-- Dumping data for table `config`
--

INSERT INTO config VALUES
("147","ios_m_push_id",""),
("148","ios_m_push_key",""),
("149","displaymode","night"),
("150","bank_description","<div class=\"dt_settings_header bg_gradient\">\n    <div class=\"bank_info_innr\">\n        <h4 class=\"bank_name\">Garanti Bank</h4>\n        <div class=\"row\">\n            <div class=\"col-md-12\">\n                <div class=\"bank_account\">\n                    <p>4796824372433055</p>\n                    <span class=\"help-block\">Account number / IBAN</span>\n                </div>\n            </div>\n            <div class=\"col-md-12\">\n                <div class=\"bank_account_holder\">\n                    <p>Antoian Kordiyal</p>\n                    <span class=\"help-block\">Account name</span>\n                </div>\n            </div>\n            <div class=\"col-md-6\">\n                <div class=\"bank_account_code\">\n                    <p>TGBATRISXXX</p>\n                    <span class=\"help-block\">Routing code</span>\n                </div>\n            </div>\n            <div class=\"col-md-6\">\n                <div class=\"bank_account_country\">\n                    <p>United States</p>\n                    <span class=\"help-block\">Country</span>\n                </div>\n            </div>\n        </div>\n    </div>\n</div>"),
("151","stripe_payment","off"),
("152","paypal_payment","off"),
("153","multiple_upload","on"),
("154","usr_v_mon","on"),
("155","stripe_id",""),
("156","ad_v_price","0.1"),
("157","pub_price","0.02"),
("158","ad_c_price","0.5"),
("159","sound_cloud_client_id",""),
("160","soundcloud_login","off"),
("161","sound_cloud_client_secret",""),
("162","emailNotification","off"),
("163","login_auth","0"),
("164","two_factor","0"),
("165","two_factor_type","email"),
("166","sms_twilio_username",""),
("167","sms_twilio_password",""),
("168","sms_t_phone_number",""),
("169","sms_phone_number",""),
("170","rapidapi_key",""),
("171","soundcloud_go","off"),
("172","soundcloud_import","off"),
("173","radio_station_import","off"),
("174","affiliate_system","0"),
("175","affiliate_type","0"),
("176","amount_ref","0.10"),
("177","amount_percent_ref","0"),
("178","discover_land","0"),
("179","itunes_import","off"),
("180","itunes_affiliate","admin"),
("181","itunes_partner_token",""),
("182","deezer_import","off"),
("183","audio_ads","on"),
("184","who_audio_ads","users"),
("185","who_can_upload","artist"),
("186","android_n_push_id",""),
("187","android_n_push_key",""),
("188","ios_n_push_id",""),
("189","ios_n_push_key",""),
("190","web_push_id",""),
("191","web_push_key",""),
("192","allow_user_create_blog","off"),
("193","point_system","off"),
("194","point_system_comment_cost","10"),
("195","point_system_upload_cost","30"),
("196","point_system_replay_comment_cost","40"),
("197","point_system_like_track_cost","45"),
("198","point_system_dislike_track_cost","50"),
("199","point_system_like_comment_cost","55"),
("200","point_system_repost_cost","60"),
("201","point_system_track_download_cost","65"),
("202","point_system_like_blog_comment_cost","70"),
("203","point_system_unlike_comment_cost","55"),
("204","point_system_unlike_blog_comment_cost","70"),
("205","point_system_import_cost","80"),
("206","point_system_purchase_track_cost","81"),
("207","point_system_go_pro_cost","82"),
("208","point_system_review_track_cost","83"),
("209","point_system_report_track_cost","84"),
("210","point_system_report_comment_cost","85"),
("211","point_system_add_to_playlist_cost","86"),
("212","point_system_create_new_playlist_cost","87"),
("213","point_system_update_profile_picture_cost","5"),
("214","point_system_update_profile_cover_cost","10"),
("215","point_system_points_to_dollar","0.001"),
("216","prevent_system","1"),
("217","bad_login_limit","4"),
("218","lock_time","10"),
("219","fame_system","1"),
("220","views_count","100000"),
("221","donate_system","1"),
("222","tag_artist_system","1"),
("223","maxCharacters","640"),
("224","cashfree_payment","off"),
("225","cashfree_mode","sandbox"),
("226","cashfree_client_key",""),
("227","cashfree_secret_key",""),
("228","paystack_payment","on"),
("229","paystack_secret_key","sk_test_a192f95b2b428a6e20c47c4e27f613d62015745c"),
("230","razorpay_payment","off"),
("231","razorpay_key_id",""),
("232","razorpay_key_secret",""),
("233","paysera_payment","off"),
("234","paysera_mode","1"),
("235","paysera_project_id",""),
("236","paysera_sign_password",""),
("237","checkout_payment","off"),
("238","checkout_mode","sandbox"),
("239","checkout_currency","ZAR"),
("240","checkout_seller_id",""),
("241","checkout_publishable_key",""),
("242","checkout_private_key",""),
("243","iyzipay_payment","off"),
("244","iyzipay_mode","1"),
("245","iyzipay_key",""),
("246","iyzipay_secret_key","");

--
-- Dumping data for table `config`
--

INSERT INTO config VALUES
("247","iyzipay_buyer_id",""),
("248","iyzipay_buyer_name",""),
("249","iyzipay_buyer_surname",""),
("250","iyzipay_buyer_gsm_number",""),
("251","iyzipay_buyer_email",""),
("252","iyzipay_identity_number",""),
("253","iyzipay_address",""),
("254","iyzipay_city",""),
("255","iyzipay_country",""),
("256","iyzipay_zip",""),
("257","payu_payment","off"),
("258","payu_mode","1"),
("259","payu_merchant_id",""),
("260","payu_secret_key",""),
("261","payu_buyer_name",""),
("262","payu_buyer_surname",""),
("263","payu_buyer_gsm_number",""),
("264","payu_buyer_email",""),
("265","securionpay_payment","off"),
("266","securionpay_public_key",""),
("267","securionpay_secret_key",""),
("268","authorize_payment","off"),
("269","authorize_test_mode","SANDBOX"),
("270","authorize_login_id",""),
("271","authorize_transaction_key",""),
("272","invite_links_system","0"),
("273","user_links_limit","10"),
("274","expire_user_links","month"),
("275","event_system","0"),
("276","channel_trailer","on"),
("277","channel_trailer_upload","artist"),
("278","story_system","off"),
("279","story_price","0"),
("280","store_system","on"),
("281","store_review_system","off"),
("282","store_commission","0"),
("283","linkedin_login","off"),
("284","vkontakte_login","off"),
("285","instagram_login","off"),
("286","qq_login","off"),
("287","wechat_login","off"),
("288","discord_login","off"),
("289","mailru_login","off"),
("290","linkedinAppId",""),
("291","linkedinAppKey",""),
("292","VkontakteAppId",""),
("293","VkontakteAppKey",""),
("294","instagramAppId",""),
("295","instagramAppkey",""),
("296","qqAppId",""),
("297","qqAppkey",""),
("298","WeChatAppId",""),
("299","WeChatAppkey",""),
("300","DiscordAppId",""),
("301","DiscordAppkey",""),
("302","MailruAppId",""),
("303","MailruAppkey",""),
("304","event_commission","0"),
("305","youtube_import","off"),
("306","youtube_video","off"),
("307","youtube_key",""),
("308","spaces","off"),
("309","space_name",""),
("310","spaces_key",""),
("311","spaces_secret",""),
("312","space_region","nyc3"),
("313","size_issue",""),
("314","seo","{\"ads\":{\"title\":\"{LANG_KEY Advertising} - {SITE_TITLE}\",\"meta_keywords\":\"{SITE_KEYWORDS}\",\"meta_description\":\"{SITE_DESC}\"},\"albums\":{\"title\":\"{LANG_KEY Albums} - {SITE_TITLE}\",\"meta_keywords\":\"{SITE_KEYWORDS}\",\"meta_description\":\"{SITE_DESC}\"},\"become\":{\"title\":\"{LANG_KEY Become an artist} - {SITE_TITLE}\",\"meta_keywords\":\"{SITE_KEYWORDS}\",\"meta_description\":\"{SITE_DESC}\"},\"blogs\":{\"title\":\"{LANG_KEY Blogs} - {SITE_TITLE}\",\"meta_keywords\":\"{SITE_KEYWORDS}\",\"meta_description\":\"{SITE_DESC}\"},\"checkout\":{\"title\":\"{LANG_KEY Checkout} - {SITE_TITLE}\",\"meta_keywords\":\"{SITE_KEYWORDS}\",\"meta_description\":\"{SITE_DESC}\"},\"contact\":{\"title\":\"{LANG_KEY Contact} - {SITE_TITLE}\",\"meta_keywords\":\"{SITE_KEYWORDS}\",\"meta_description\":\"{SITE_DESC}\"},\"create-ads\":{\"title\":\"{LANG_KEY Create Advertising} - {SITE_TITLE}\",\"meta_keywords\":\"{SITE_KEYWORDS}\",\"meta_description\":\"{SITE_DESC}\"},\"create-article\":{\"title\":\"{LANG_KEY Create New Article} - {SITE_TITLE}\",\"meta_keywords\":\"{SITE_KEYWORDS}\",\"meta_description\":\"{SITE_DESC}\"},\"create-event\":{\"title\":\"{LANG_KEY Create Event} - {SITE_TITLE}\",\"meta_keywords\":\"{SITE_KEYWORDS}\",\"meta_description\":\"{SITE_DESC}\"},\"create-product\":{\"title\":\"{LANG_KEY Create Product} - {SITE_TITLE}\",\"meta_keywords\":\"{SITE_KEYWORDS}\",\"meta_description\":\"{SITE_DESC}\"},\"create_story\":{\"title\":\"{LANG_KEY Create Story} - {SITE_TITLE}\",\"meta_keywords\":\"{SITE_KEYWORDS}\",\"meta_description\":\"{SITE_DESC}\"},\"customer_orders\":{\"title\":\"{LANG_KEY My Orders} - {SITE_TITLE}\",\"meta_keywords\":\"{SITE_KEYWORDS}\",\"meta_description\":\"{SITE_DESC}\"},\"dashboard\":{\"title\":\"{LANG_KEY Dashboard} - {SITE_TITLE}\",\"meta_keywords\":\"{SITE_KEYWORDS}\",\"meta_description\":\"{SITE_DESC}\"},\"discover\":{\"title\":\"{LANG_KEY Discover} - {SITE_TITLE}\",\"meta_keywords\":\"{SITE_KEYWORDS}\",\"meta_description\":\"{SITE_DESC}\"},\"events\":{\"title\":\"{LANG_KEY Events} - {SITE_TITLE}\",\"meta_keywords\":\"{SITE_KEYWORDS}\",\"meta_description\":\"{SITE_DESC}\"},\"fame\":{\"title\":\"{LANG_KEY Hall of fame} - {SITE_TITLE}\",\"meta_keywords\":\"{SITE_KEYWORDS}\",\"meta_description\":\"{SITE_DESC}\"},\"favourites\":{\"title\":\"{LANG_KEY Favourites} - {SITE_TITLE}\",\"meta_keywords\":\"{SITE_KEYWORDS}\",\"meta_description\":\"{SITE_DESC}\"},\"feed\":{\"title\":\"{LANG_KEY Feed} - {SITE_TITLE}\",\"meta_keywords\":\"{SITE_KEYWORDS}\",\"meta_description\":\"{SITE_DESC}\"},\"forgot-password\":{\"title\":\"Forgot Password - {SITE_TITLE}\",\"meta_keywords\":\"{SITE_KEYWORDS}\",\"meta_description\":\"{SITE_DESC}\"},\"genres\":{\"title\":\"{LANG_KEY Genres} - {SITE_TITLE}\",\"meta_keywords\":\"{SITE_KEYWORDS}\",\"meta_description\":\"{SITE_DESC}\"},\"go-pro\":{\"title\":\"{LANG_KEY Go Pro!} - {SITE_TITLE}\",\"meta_keywords\":\"{SITE_KEYWORDS}\",\"meta_description\":\"{SITE_DESC}\"},\"home\":{\"title\":\"{LANG_KEY Home} - {SITE_TITLE}\",\"meta_keywords\":\"{SITE_KEYWORDS}\",\"meta_description\":\"{SITE_DESC}\"},\"import\":{\"title\":\"{LANG_KEY Import} - {SITE_TITLE}\",\"meta_keywords\":\"{SITE_KEYWORDS}\",\"meta_description\":\"{SITE_DESC}\"},\"maintenance\":{\"title\":\"{LANG_KEY Maintenance} - {SITE_TITLE}\",\"meta_keywords\":\"{SITE_KEYWORDS}\",\"meta_description\":\"{SITE_DESC}\"},\"manage_events\":{\"title\":\"{LANG_KEY Manage Events} - {SITE_TITLE}\",\"meta_keywords\":\"{SITE_KEYWORDS}\",\"meta_description\":\"{SITE_DESC}\"},\"manage_products\":{\"title\":\"{LANG_KEY Manage Products} - {SITE_TITLE}\",\"meta_keywords\":\"{SITE_KEYWORDS}\",\"meta_description\":\"{SITE_DESC}\"},\"messages\":{\"title\":\"{LANG_KEY Messages} - {SITE_TITLE}\",\"meta_keywords\":\"{SITE_KEYWORDS}\",\"meta_description\":\"{SITE_DESC}\"},\"my_playlists\":{\"title\":\"{LANG_KEY Playlists} - {SITE_TITLE}\",\"meta_keywords\":\"{SITE_KEYWORDS}\",\"meta_description\":\"{SITE_DESC}\"},\"new_music\":{\"title\":\"{LANG_KEY New Music} - {SITE_TITLE}\",\"meta_keywords\":\"{SITE_KEYWORDS}\",\"meta_description\":\"{SITE_DESC}\"},\"not-found\":{\"title\":\"404\",\"meta_keywords\":\"{SITE_KEYWORDS} - {SITE_TITLE}\",\"meta_description\":\"{SITE_DESC}\"},\"orders\":{\"title\":\"{LANG_KEY Orders} - {SITE_TITLE}\",\"meta_keywords\":\"{SITE_KEYWORDS}\",\"meta_description\":\"{SITE_DESC}\"},\"payment-error\":{\"title\":\"{LANG_KEY Payment Error} - {SITE_TITLE}\",\"meta_keywords\":\"{SITE_KEYWORDS}\",\"meta_description\":\"{SITE_DESC}\"},\"playlists\":{\"title\":\"{LANG_KEY Playlists} - {SITE_TITLE}\",\"meta_keywords\":\"{SITE_KEYWORDS}\",\"meta_description\":\"{SITE_DESC}\"},\"point-system\":{\"title\":\"{LANG_KEY Points System} - {SITE_TITLE}\",\"meta_keywords\":\"{SITE_KEYWORDS}\",\"meta_description\":\"{SITE_DESC}\"},\"purchased\":{\"title\":\"{LANG_KEY Purchased Songs} - {SITE_TITLE}\",\"meta_keywords\":\"{SITE_KEYWORDS}\",\"meta_description\":\"{SITE_DESC}\"},\"recently_played\":{\"title\":\"{LANG_KEY Recently Played} - {SITE_TITLE}\",\"meta_keywords\":\"{SITE_KEYWORDS}\",\"meta_description\":\"{SITE_DESC}\"},\"reset-password\":{\"title\":\"Reset Password - {SITE_TITLE}\",\"meta_keywords\":\"{SITE_KEYWORDS}\",\"meta_description\":\"{SITE_DESC}\"},\"search\":{\"title\":\"{LANG_KEY Search} - {SITE_TITLE}\",\"meta_keywords\":\"{SITE_KEYWORDS}\",\"meta_description\":\"{SITE_DESC}\"},\"settings\":{\"title\":\"{LANG_KEY Settings} - {SITE_TITLE}\",\"meta_keywords\":\"{SITE_KEYWORDS}\",\"meta_description\":\"{SITE_DESC}\"},\"spotlight\":{\"title\":\"{LANG_KEY Spotlight} - {SITE_TITLE}\",\"meta_keywords\":\"{SITE_KEYWORDS}\",\"meta_description\":\"{SITE_DESC}\"},\"stations\":{\"title\":\"{LANG_KEY Stations} - {SITE_TITLE}\",\"meta_keywords\":\"{SITE_KEYWORDS}\",\"meta_description\":\"{SITE_DESC}\"},\"store\":{\"title\":\"{LANG_KEY Store} - {SITE_TITLE}\",\"meta_keywords\":\"{SITE_KEYWORDS}\",\"meta_description\":\"{SITE_DESC}\"},\"top-genres\":{\"title\":\"{LANG_KEY Top Music} - {SITE_TITLE}\",\"meta_keywords\":\"{SITE_KEYWORDS}\",\"meta_description\":\"{SITE_DESC}\"},\"top_music\":{\"title\":\"{LANG_KEY Top Music} - {SITE_TITLE}\",\"meta_keywords\":\"{SITE_KEYWORDS}\",\"meta_description\":\"{SITE_DESC}\"},\"top_music_album\":{\"title\":\"{LANG_KEY Top Albums} - {SITE_TITLE}\",\"meta_keywords\":\"{SITE_KEYWORDS}\",\"meta_description\":\"{SITE_DESC}\"},\"upgraded\":{\"title\":\"{LANG_KEY You are a pro!} - {SITE_TITLE}\",\"meta_keywords\":\"{SITE_KEYWORDS}\",\"meta_description\":\"{SITE_DESC}\"},\"upload-album\":{\"title\":\"{LANG_KEY Upload} - {SITE_TITLE}\",\"meta_keywords\":\"{SITE_KEYWORDS}\",\"meta_description\":\"{SITE_DESC}\"},\"upload-song\":{\"title\":\"{LANG_KEY Upload} - {SITE_TITLE}\",\"meta_keywords\":\"{SITE_KEYWORDS}\",\"meta_description\":\"{SITE_DESC}\"}}"),
("315","points_to","off"),
("316","point_system_listen_to_song_cost","12"),
("317","currency_array","a:2:{i:0;s:3:\"USD\";i:10;s:3:\"ZAR\";}"),
("318","currency_symbol_array","a:2:{s:3:\"USD\";s:1:\"$\";s:3:\"ZAR\";s:1:\"R\";}"),
("319","google_refreshToken",""),
("320","google_ClientId",""),
("321","google_ClientSecret",""),
("322","google_drive","off"),
("323","fortumo_payment","off"),
("324","fortumo_service_id",""),
("325","aamarpay_payment","off"),
("326","aamarpay_mode","sandbox"),
("327","aamarpay_store_id",""),
("328","aamarpay_signature_key",""),
("329","ngenius_payment","off"),
("330","ngenius_mode","sandbox"),
("331","ngenius_api_key",""),
("332","ngenius_outlet_id",""),
("333","coinbase_payment","off"),
("334","coinbase_key",""),
("335","coinpayments","off"),
("336","coinpayments_secret",""),
("337","coinpayments_public_key",""),
("338","coinpayments_coin",""),
("339","coinpayments_coins",""),
("340","password_complexity_system","1"),
("341","remember_device","1"),
("342","auto_username","0"),
("343","yoomoney_payment","off"),
("344","yoomoney_wallet_id",""),
("345","yoomoney_notifications_secret","");

-- ---------------------------------------------------------
--
-- Table structure for table : `conversations`
--
-- ---------------------------------------------------------

CREATE TABLE `conversations` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_one` int(11) NOT NULL DEFAULT 0,
  `user_two` int(11) NOT NULL DEFAULT 0,
  `time` int(11) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`),
  KEY `user_one` (`user_one`),
  KEY `user_two` (`user_two`),
  KEY `time` (`time`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- ---------------------------------------------------------
--
-- Table structure for table : `copyrights`
--
-- ---------------------------------------------------------

CREATE TABLE `copyrights` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `track_id` int(11) NOT NULL DEFAULT 0,
  `user_id` int(11) NOT NULL DEFAULT 0,
  `description` text CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `time` int(11) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`),
  KEY `track_id` (`track_id`),
  KEY `user_id` (`user_id`),
  KEY `time` (`time`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ---------------------------------------------------------
--
-- Table structure for table : `custompages`
--
-- ---------------------------------------------------------

CREATE TABLE `custompages` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `page_name` varchar(50) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `page_title` varchar(200) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `page_content` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `page_type` int(11) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ---------------------------------------------------------
--
-- Table structure for table : `dislikes`
--
-- ---------------------------------------------------------

CREATE TABLE `dislikes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `track_id` int(11) NOT NULL DEFAULT 0,
  `user_id` int(11) NOT NULL DEFAULT 0,
  `comment_id` int(11) unsigned NOT NULL DEFAULT 0,
  `time` int(11) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`),
  KEY `track_id` (`track_id`),
  KEY `user_id` (`user_id`),
  KEY `time` (`time`),
  KEY `comment_id` (`comment_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

-- ---------------------------------------------------------
--
-- Table structure for table : `downloads`
--
-- ---------------------------------------------------------

CREATE TABLE `downloads` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL DEFAULT 0,
  `fingerprint` varchar(120) NOT NULL DEFAULT '',
  `track_id` int(11) NOT NULL DEFAULT 0,
  `time` int(11) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`,`user_id`),
  KEY `track_id` (`track_id`),
  KEY `fingerprint` (`fingerprint`),
  KEY `time` (`time`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ---------------------------------------------------------
--
-- Table structure for table : `events`
--
-- ---------------------------------------------------------

CREATE TABLE `events` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `hash_id` varchar(100) CHARACTER SET utf8 NOT NULL DEFAULT '',
  `user_id` int(11) NOT NULL DEFAULT 0,
  `name` varchar(150) CHARACTER SET utf8 NOT NULL DEFAULT '',
  `desc` text CHARACTER SET utf8 DEFAULT NULL,
  `start_date` date DEFAULT NULL,
  `start_time` time DEFAULT NULL,
  `end_date` date DEFAULT NULL,
  `end_time` time DEFAULT NULL,
  `timezone` varchar(100) CHARACTER SET utf8 NOT NULL DEFAULT '',
  `online_url` text CHARACTER SET utf8 DEFAULT NULL,
  `real_address` text CHARACTER SET utf8 DEFAULT NULL,
  `available_tickets` int(11) NOT NULL DEFAULT 0,
  `ticket_price` float NOT NULL DEFAULT 0,
  `image` text CHARACTER SET utf8 DEFAULT NULL,
  `video` text CHARACTER SET utf8 DEFAULT NULL,
  `240p` int(11) NOT NULL DEFAULT 0,
  `360p` int(11) NOT NULL DEFAULT 0,
  `480p` int(11) NOT NULL DEFAULT 0,
  `720p` int(11) NOT NULL DEFAULT 0,
  `1080p` int(11) NOT NULL DEFAULT 0,
  `2048p` int(11) NOT NULL DEFAULT 0,
  `4096p` int(11) NOT NULL DEFAULT 0,
  `time` int(11) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`),
  KEY `start_date` (`start_date`),
  KEY `start_time` (`start_time`),
  KEY `end_date` (`end_date`),
  KEY `end_time` (`end_time`),
  KEY `timezone` (`timezone`),
  KEY `available_tickets` (`available_tickets`),
  KEY `ticket_price` (`ticket_price`),
  KEY `time` (`time`),
  KEY `user_id` (`user_id`),
  KEY `hash_id` (`hash_id`),
  KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- ---------------------------------------------------------
--
-- Table structure for table : `events_joined`
--
-- ---------------------------------------------------------

CREATE TABLE `events_joined` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `event_id` int(11) NOT NULL DEFAULT 0,
  `user_id` int(11) NOT NULL DEFAULT 0,
  `time` int(11) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`),
  KEY `event_id` (`event_id`),
  KEY `user_id` (`user_id`),
  KEY `time` (`time`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- ---------------------------------------------------------
--
-- Table structure for table : `events_tickets`
--
-- ---------------------------------------------------------

CREATE TABLE `events_tickets` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL DEFAULT 0,
  `event_id` int(11) NOT NULL DEFAULT 0,
  `price` float NOT NULL DEFAULT 0,
  `commission` float NOT NULL DEFAULT 0,
  `final_price` float NOT NULL DEFAULT 0,
  `event_owner_id` int(11) NOT NULL DEFAULT 0,
  `time` int(11) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`),
  KEY `user_id` (`user_id`),
  KEY `event_id` (`event_id`),
  KEY `price` (`price`),
  KEY `commission` (`commission`),
  KEY `final_price` (`final_price`),
  KEY `event_owner_id` (`event_owner_id`),
  KEY `time` (`time`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- ---------------------------------------------------------
--
-- Table structure for table : `faqs`
--
-- ---------------------------------------------------------

CREATE TABLE `faqs` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `question` varchar(200) CHARACTER SET utf8 NOT NULL DEFAULT '',
  `answer` text CHARACTER SET utf8 DEFAULT NULL,
  `time` int(11) DEFAULT 0,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ---------------------------------------------------------
--
-- Table structure for table : `favorites`
--
-- ---------------------------------------------------------

CREATE TABLE `favorites` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL DEFAULT 0,
  `track_id` int(11) NOT NULL DEFAULT 0,
  `time` int(11) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`),
  KEY `user_id` (`user_id`),
  KEY `track_id` (`track_id`),
  KEY `time` (`time`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ---------------------------------------------------------
--
-- Table structure for table : `followers`
--
-- ---------------------------------------------------------

CREATE TABLE `followers` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `follower_id` int(11) NOT NULL DEFAULT 0,
  `following_id` int(11) NOT NULL DEFAULT 0,
  `artist_id` int(11) NOT NULL DEFAULT 0,
  `time` int(11) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`),
  KEY `follower_id` (`follower_id`),
  KEY `following_id` (`following_id`),
  KEY `artist_id` (`artist_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `followers`
--

INSERT INTO followers VALUES
("1","8","1","0","1660146832");

-- ---------------------------------------------------------
--
-- Table structure for table : `html_emails`
--
-- ---------------------------------------------------------

CREATE TABLE `html_emails` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) CHARACTER SET utf8 NOT NULL DEFAULT '',
  `value` text CHARACTER SET utf8 DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `name` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `html_emails`
--

INSERT INTO html_emails VALUES
("1","notification","Hello {{uname}},\n<br><br>\nNew notification from <a href=\"{{notify_link}}\">{{username}}{{c}}</a>:\n<br>\n{{full_name}} {{contents}}\n<a href=\"{{user_link}}\">{{username}}{{c}}</a>\n<br><br>\n{{site_name}} Team."),
("2","confirm","Hello {{USERNAME}},\n<br><br>\nPlease confirm your email address by clicking the link below:\n<br>\n<a href=\"{{CODE_URL}}\">Confirm email address</a>\n<br><br>\n{{SITE_NAME}} Team."),
("3","reset","Hello {{username}},\n<br><br>\nTo reset your password, please click the link below:\n<br>\n<a href=\"{{code_url}}\">Reset my password</a>\n<br><br>\n{{site_name}} Team."),
("4","unusual_login","Hi {{username}},<br><br>\n\nPlease verify that it\'s you<br><br>\n\nYour sign in attempt seems a little different than usual. This could be because you are signing in from a different device or a different location.<br><br>\n\nIf you are attempting to sign-in, please use the following code to confirm your identity:<br><br>\n\n{{code}}<br><br>\n\nHere are the details of the sign-in attempt:<br>\nDate: {{date}}<br>\nAccount: {{email}}<br>\nLocation: {{countryCode}}<br>\nIP Address: {{ip_address}}<br>\nCity: {{city}}<br><br>\n\nIf this wasn\'t you, please reset your password.<br><br>\n\nYours securely,<br>\nTeam {{site_name}}");

-- ---------------------------------------------------------
--
-- Table structure for table : `invitation_links`
--
-- ---------------------------------------------------------

CREATE TABLE `invitation_links` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL DEFAULT 0,
  `invited_id` int(11) NOT NULL DEFAULT 0,
  `code` varchar(300) CHARACTER SET utf8 NOT NULL DEFAULT '',
  `time` int(50) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`),
  KEY `user_id` (`user_id`),
  KEY `invited_id` (`invited_id`),
  KEY `code` (`code`),
  KEY `time` (`time`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- ---------------------------------------------------------
--
-- Table structure for table : `langs`
--
-- ---------------------------------------------------------

CREATE TABLE `langs` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `ref` varchar(250) DEFAULT '',
  `options` varchar(120) DEFAULT '',
  `lang_key` varchar(500) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `english` text DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_name` (`lang_key`),
  KEY `lang_key` (`lang_key`(255)),
  KEY `ref` (`ref`)
) ENGINE=InnoDB AUTO_INCREMENT=1196 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `langs`
--

INSERT INTO langs VALUES
("1","","","signup","Signup"),
("2","","","get_access_to_your_music__playlists_and_account","Get access to your music, playlists and account"),
("3","","","full_name","Full Name"),
("4","","","username","Username"),
("5","","","email_address","Email address"),
("6","","","password","Password"),
("7","","","confirm_password","Confirm Password"),
("8","","","already_have_an_account_","Already have an account?"),
("9","","","login","Login"),
("10","","","by_signing_up__you_agree_to_our","By signing up, you agree to our"),
("11","","","terms","Terms"),
("12","","","and","and"),
("13","","","privacy_policy","Privacy Policy"),
("14","","","please_wait..","Please wait.."),
("15","","","search_for_songs__artists__playlists_and_more","Search for songs, artists, playlists and more.."),
("16","","","trending_now","Trending Now"),
("17","","","advanced_search","Advanced Search"),
("18","","","feed","Feed"),
("19","","","upload","Upload"),
("20","","","dashboard","Dashboard"),
("21","","","settings","Settings"),
("22","","","recently_played","Recently Played"),
("23","","","my_playlists","My Playlists"),
("24","","","favourites","Favourites"),
("25","","","logout","Logout"),
("26","","","register","Register"),
("27","","","forgot_your_password_","Forgot your password?"),
("28","","","don_t_have_an_account_","Don&#039;t have an account?"),
("29","","","sign_up","Sign Up"),
("30","","","or","OR"),
("31","","","login_with_facebook","Login with Facebook"),
("32","","","login_with_twitter","Login with Twitter"),
("33","","","login_with_google","Login with Google"),
("34","","","login_with_vk","Login with VK"),
("35","","","this_e-mail_is_already_taken","This e-mail is already taken"),
("36","","","incorrect_username_or_password","Incorrect username or password"),
("37","","","registration_successful__we_have_sent_you_an_email__please_check_your_inbox_spam_to_verify_your_account.","Registration successful! We have sent you an email, Please check your inbox/spam to verify your account."),
("38","","","this_username_is_already_taken","This username is already taken"),
("39","","","your_account_is_not_activated_yet__please_check_your_inbox_for_the_activation_link","Your account is not activated yet, please check your inbox for the activation link"),
("40","","","enter_your_email_to_get_password_reset_link.","Enter your email to get password reset link."),
("41","","","send_link","Send Link"),
("42","","","this_e-mail_not_found","This E-mail not found"),
("43","","","this_e-mail_is_not_found","This e-mail is not found"),
("44","","","reset_password","Reset Password"),
("45","","","error_found_while_sending_the_reset_link__please_try_again_later.","Error found while sending the reset link, please try again later."),
("46","","","please_check_your_inbox___spam_folder_for_the_reset_email.","Please check your inbox / spam folder for the reset email."),
("47","","","please_check_your_details","Please check your details"),
("48","","","reset_your_password","Reset your password"),
("49","","","enter_new_password_to_proceed.","Enter new password to proceed."),
("50","","","new_password","New Password"),
("51","","","reset","Reset"),
("52","","","passwords_don_t_match","Passwords don&#039;t match"),
("58","","","about_us","About Us"),
("59","","","contact","Contact"),
("60","","","copyright_____date___name_.","Copyright © |DATE| |NAME|."),
("61","","","contact_us","Contact Us"),
("62","","","let_us_help_you.","Let us help you."),
("63","","","write_here_your_message","Write here your message"),
("64","","","send","Send"),
("65","","","e-mail_sent_successfully","E-mail sent successfully"),
("66","","","followers","Followers"),
("67","","","following","Following"),
("68","","","all","All"),
("69","","","songs","Songs"),
("70","","","albums","Albums"),
("71","","","playlists","Playlists"),
("72","","","follow","Follow"),
("73","","","edit_profile","Edit Profile"),
("74","","","confirm_your_account","Confirm your account"),
("75","","","general_settings","General Settings"),
("76","","","email","Email"),
("77","","","country","Country"),
("78","","","age","Age"),
("79","","","gender","Gender"),
("80","","","save","Save"),
("81","","","delete_account","Delete Account"),
("82","","","are_you_sure_you_want_to_delete_your_account__all_content_including_published_songs__will_be_permanetly_removed_","Are you sure you want to delete your account? All content including published songs, will be permanetly removed!"),
("83","","","current_password","Current Password"),
("84","","","delete","Delete"),
("85","","","change_password","Change Password"),
("86","","","repeat_new_password","Repeat New Password"),
("87","","","change","Change"),
("88","","","profile_settings","Profile Settings"),
("89","","","about_me","About Me"),
("90","","","facebook_username","Facebook Username"),
("91","","","website","Website"),
("94","","","male","Male"),
("95","","","female","Female"),
("96","","","settings_successfully_updated_","Settings successfully updated!"),
("97","","","no_notifications_found","No notifications found"),
("98","","","year","year"),
("99","","","month","month"),
("100","","","day","day"),
("101","","","hour","hour"),
("102","","","minute","minute"),
("103","","","second","second"),
("104","","","years","years"),
("105","","","months","months"),
("106","","","days","days"),
("107","","","hours","hours");

--
-- Dumping data for table `langs`
--

INSERT INTO langs VALUES
("108","","","minutes","minutes"),
("109","","","seconds","seconds"),
("110","","","ago","ago"),
("111","","","started_following_you.","started following you."),
("112","","","profile_successfully_updated_","Profile successfully updated!"),
("113","","","invalid_website_url__format_allowed__http_s_____.___","Invalid website url, format allowed: http(s)://*.*/*"),
("114","","","invalid_facebook_username__urls_are_not_allowed","Invalid facebook username, urls are not allowed"),
("115","","","new_password_is_too_short","New password is too short"),
("116","","","your_current_password_is_invalid","Your current password is invalid"),
("117","","","your_password_was_successfully_updated_","Your password was successfully updated!"),
("118","","","your_account_was_successfully_deleted__please_wait..","Your account was successfully deleted, please wait.."),
("119","","","select_files_to_upload","Select files to upload"),
("120","","","or_drag___drop_files_here","or drag &amp; drop files here"),
("121","","","title","Title"),
("122","","","your_song_title__2_-_55_characters","Your song title, 2 - 55 characters"),
("123","","","description","Description"),
("124","","","tags","Tags"),
("125","","","add_tags_to_describe_more_about_your_track","Add tags to describe more about your track"),
("126","","","genre","Genre"),
("127","","","availability","Availability"),
("128","","","public","Public"),
("129","","","private","Private"),
("130","","","age_restriction","Age Restriction"),
("131","","","all_ages_can_listen_this_song","All ages can listen this song"),
("132","","","only__18","Only +18"),
("133","","","price","Price"),
("134","","","publish","Publish"),
("135","","","audio_file_not_found__please_refresh_the_page_and_try_again.","Audio file not found, please refresh the page and try again."),
("136","","","something_went_wrong_please_try_again_later_","Something went wrong Please try again later!"),
("138","","","please_wait__your_track_is_being_coverted_to_mp3_audio_file._this_might_take_a_few_minutes.","Please wait, your track is being coverted to mp3 audio file. This might take a few minutes."),
("139","","","invalid_file_format__only_mp3_is_allowed","Invalid file format, only mp3 is allowed"),
("140","","","invalid_file_format__only_jpg__jpeg__png_are_allowed","Invalid file format, only jpg, jpeg, png are allowed"),
("141","","","error_found_while_uploading_your_image__please_try_again_later.","Error found while uploading your image, please try again later."),
("142","","","error_found_while_uploading_your_track__please_try_again_later.","Error found while uploading your track, please try again later."),
("143","","","invalid_file_format__only_mp3__ogg__wav__and_mpeg_is_allowed","Invalid file format, only mp3, ogg, wav, and mpeg is allowed"),
("144","","","sorry__page_not_found_","Sorry, page not found!"),
("145","","","the_page_you_are_looking_for_could_not_be_found._please_check_the_link_you_followed_to_get_here_and_try_again.","The page you are looking for could not be found. Please check the link you followed to get here and try again."),
("146","","","home","Home"),
("147","","","become_an_artist","Become an artist"),
("148","","","info","Info"),
("149","","","located_in","Located in"),
("150","","","bio","Bio"),
("151","","","social_links","Social Links"),
("152","","","__user_gender","{{USER gender}}"),
("153","","","release_date","Release date"),
("154","","","uploaded_new_song","Uploaded new song"),
("155","","","report","Report"),
("156","","","delete_track","Delete Track"),
("157","","","edit_info","Edit Info"),
("158","","","pin","Pin"),
("159","","","no_tracks_found","No tracks found"),
("160","","","load_more","Load More"),
("161","","","no_more_tracks_found","No more tracks found"),
("162","","","like","Like"),
("163","","","share","Share"),
("164","","","more","More"),
("165","","","add_to_playlist","Add to Playlist"),
("166","","","add_to_queue","Add to Queue"),
("167","","","edit","Edit"),
("168","","","download","Download"),
("169","","","purchase","Purchase"),
("170","","","save_track","Save Track"),
("171","","","the_new_track_details_are_updated__please_wait..","The new track details are updated, please wait.."),
("172","","","liked_your_song.","liked your song."),
("173","","","liked","Liked"),
("174","","","write_a_comment_and_press_enter","Write a comment and press enter"),
("175","","","delete_your_track","Delete your track"),
("176","","","are_you_sure_you_want_to_delete_this_track_","Are you sure you want to delete this track?"),
("177","","","cancel","Cancel"),
("178","","","share_this_song","Share this Song"),
("179","","","close","Close"),
("180","","","tracks","Tracks"),
("181","","","recently_played_music","Recently Played Music"),
("182","","","no_tracks_found__try_to_listen_more____","No tracks found, try to listen more? ;)"),
("183","","","repeat","Repeat"),
("184","","","shuffle","Shuffle"),
("185","","","queue","Queue"),
("186","","","clear","Clear"),
("187","","","just_now","Just now"),
("188","","","no_comments_found","No comments found"),
("189","","","delete_comment","Delete comment"),
("190","","","are_you_sure_you_want_to_delete_this_comment_","Are you sure you want to delete this comment?"),
("191","","","report_comment","Report Comment"),
("192","","","no_more_comments_found","No more comments found"),
("213","","","cateogry_1","Other"),
("215","","","in","in"),
("216","","","other","Other"),
("217","","","more_tracks","More Tracks"),
("218","","","purchase_track","Purchase track"),
("219","","","error_found_while_creating_the_payment__please_try_again_later.","Error found while creating the payment, please try again later."),
("220","","","purchase_required","Purchase Required"),
("221","","","to_continue_listening_to_this_track__you_need_to_purchase_the_song.","To continue listening to this track, you need to purchase the song."),
("222","","","purchased","Purchased"),
("223","","","no_purchased_tracks_found","No purchased tracks found"),
("224","","","purchased_songs","Purchased Songs"),
("225","","","my_purchases","My Purchases"),
("226","","","purchased_on","Purchased on"),
("227","","","purchased_your_song.","purchased your song."),
("229","","","go_pro_to_download","Go PRO To Download"),
("230","","","generating_waves..","Generating waves..");

--
-- Dumping data for table `langs`
--

INSERT INTO langs VALUES
("231","","","name","Name"),
("232","","","your_full_name_as_showing_on_your_id","Your full name as showing on your ID"),
("233","","","upload_documents","Upload documents"),
("234","","","please_upload_a_photo_with_your_passport___id___your_distinct_photo.","Please upload a photo with your passport / ID &amp; your distinct photo."),
("235","","","your_personal_photo","Your Personal Photo"),
("236","","","passport___id_card","Passport / ID card"),
("237","","","additional_details","Additional details"),
("238","","","we_will_review_your_request_within_24_hours__you_ll_be_informed_shourtly.","We will review your request within 24 hours, you&#039;ll be informed shourtly."),
("240","","","additional_details_about_your_self__optinal_","Additional details about your self (Optinal)"),
("241","","","website__optional_","Website (Optional)"),
("242","","","thank_you._your_request_has_been_sent__we_will_get_back_to_you_shourtly.","Thank you. Your request has been sent, we will get back to you shourtly."),
("243","","","error_found_while_processing_your_request__please_try_again_later.","Error found while processing your request, please try again later."),
("244","","","your_request_has_been_already_sent__we_will_get_back_to_you_shourtly.","Your request has been already sent, we will get back to you shourtly."),
("245","","","get_verified__upload_more_songs__get_more_space__sell_your_songs__get_a_special_looking_profile_and_get_famous_on_our_platform_","Get verified, upload more songs, get more space, sell your songs, get a special looking profile and get famous on our platform!"),
("246","","","play_all","Play All"),
("247","","","latest_songs","Latest Songs"),
("248","","","special_songs","Special Songs"),
("249","","","top_songs","Top Songs"),
("250","","","similar_artists","Similar Artists"),
("251","","","artists","artists"),
("252","","","artist","artist"),
("253","","","store","Store"),
("254","","","congratulations__your_request_to_become_an_artist_was_approved.","Congratulations! Your request to become an artist was approved."),
("255","","","sadly__your_request_to_become_an_artist_was_declined.","Sadly, Your request to become an artist was declined."),
("256","","","activities","Activities"),
("259","","","re_post","Re Post"),
("260","","","the_song_was_successfully_shared_on_your_timeline.","The song was successfully shared on your timeline."),
("261","","","no_activties_found","No activties found"),
("272","","","delete_post","Delete Post"),
("273","","","no_more_activities_found","No more activities found"),
("274","","","weekly_top_tracks","Weekly Top Tracks"),
("275","","","delete_your_post","Delete your post"),
("276","","","are_you_sure_you_want_to_delete_this_post_","Are you sure you want to delete this post?"),
("277","","","uploaded_a_new_song.","Uploaded a new song."),
("278","","","artists_to_follow","Artists to Follow"),
("279","","","likes","Likes"),
("280","","","plays","Plays"),
("281","","","no_favourite_tracks_found","No favourite tracks found"),
("282","","","my_favourites","My Favourites"),
("283","","","you_currently_have__c__favourite_songs","You currently have |c| favourite songs"),
("285","","","you_currently_have__c__playlists.","You currently have |c| playlists."),
("286","","","create","Create"),
("287","","","create_playlist","Create Playlist"),
("288","","","playlist_name","Playlist name"),
("289","","","error_found_while_uploading_the_playlist_avatar__please_try_again_later.","Error found while uploading the playlist avatar, Please try again later."),
("291","","","edit_playlist","Edit Playlist"),
("292","","","delete_playlist","Delete Playlist"),
("293","","","delete_your_playlist","Delete your playlist"),
("294","","","are_you_sure_you_want_to_delete_this_playlist_","Are you sure you want to delete this playlist?"),
("295","","","share_this_playlist","Share this Playlist"),
("296","","","play","Play"),
("297","","","no_songs_on_this_playlist.","No songs on this playlist."),
("298","","","no_songs_on_this_playlist_yet.","No songs on this playlist yet."),
("299","","","select_playlists","Select playlists"),
("300","","","add","Add"),
("301","","","please_select_which_playlist_you_want_to_add_this_song_to.","Please select which playlist you want to add this song to."),
("302","","","no_playlists_found","No playlists found"),
("303","","","new","New"),
("304","","","no_more_playlists_found","No more playlists found"),
("305","","","discover","Discover"),
("306","","","show_all","Show All"),
("307","","","new_releases","New Releases"),
("308","","","most_popular_this_week","Most Popular This Week"),
("309","","","most_recommended","Most Recommended"),
("310","","","recommended","Recommended"),
("311","","","new_music","New Music"),
("312","","","best_new_releases","Best New Releases"),
("313","","","latest_music","Latest Music"),
("315","","","top_music","Top Music"),
("316","","","see_all","See All"),
("317","","","top_albums","Top Albums"),
("318","","","top","Top"),
("319","","","top_50","Top 50"),
("320","","","browse_music","Browse Music"),
("321","","","genres","Genres"),
("322","","","your_music","Your Music"),
("323","","","latest_songs_in","Latest Songs In"),
("324","","","age_restricted_track","Age restricted track"),
("325","","","this_track_is_age_restricted_for_viewers_under__18","This track is age restricted for viewers under +18"),
("326","","","create_an_account_or_login_to_confirm_your_age.","Create an account or login to confirm your age."),
("327","","","this_track_is_age_restricted_for_viewers_under_18","This track is age restricted for viewers under 18"),
("328","","","upgrade_to_pro","Upgrade To PRO"),
("329","","","go_pro_","Go Pro!"),
("330","","","discover_more_features_with_our_premium_package_","Discover more features with our Premium package!"),
("331","","","free_plan","Free Plan"),
("332","","","upload_songs_up_to","Upload songs up to"),
("333","","","pro_badge","Pro badge"),
("334","","","download_songs","Download songs"),
("335","","","turn_off_comments_download","Turn off comments/download"),
("336","","","current_plan","Current Plan"),
("337","","","pro_plan","Pro Plan"),
("338","","","per_month","per month"),
("339","","","p_month","p/month"),
("340","","","monthly","monthly"),
("341","","","upload_unlimited_songs","Upload unlimited songs"),
("342","","","upgrade","Upgrade"),
("343","","","secured_payment_transaction","Secured payment transaction"),
("344","","","redirecting..","Redirecting.."),
("345","","","oops__an_error_found.","Oops, an error found."),
("346","","","you_are_a_pro_","You are a pro!");

--
-- Dumping data for table `langs`
--

INSERT INTO langs VALUES
("347","","","unexpected_error_found_while_processing_your_payment__please_try_again_later.","Unexpected error found while processing your payment, please try again later."),
("348","","","payment_error","Payment Error"),
("353","","","you_have_reached_your_upload_limit___link__to_upload_unlimited_songs.","You have reached your upload limit, |link| to upload unlimited songs."),
("354","","","get_verified__sell_your_songs__get_a_special_looking_profile_and_get_famous_on_our_platform_","Get verified, sell your songs, get a special looking profile and get famous on our platform!"),
("355","","","pro_memeber","PRO Member"),
("356","","","manage_my_songs","Manage My Songs"),
("357","","","published","Published"),
("358","","","total_songs","Total Songs"),
("359","","","total_plays","Total Plays"),
("360","","","total_downloads","Total Downloads"),
("361","","","total_sales","Total Sales"),
("362","","","total_sales_this_month","Total Sales This Month"),
("363","","","total_sales_this_today","Total Sales This Today"),
("364","","","total_sales_today","Total Sales Today"),
("365","","","downloads","Downloads"),
("366","","","sales","Sales"),
("367","","","most_played_songs","Most played songs"),
("368","","","no_songs_found","No songs found"),
("369","","","most_commented_songs","Most commented songs"),
("370","","","most_liked_songs","Most liked songs"),
("371","","","most_downloaded_songs","Most downloaded songs"),
("372","","","recent_sales","Recent sales"),
("373","","","no_sales_found","No sales found"),
("374","","","listened_by","Listened by"),
("375","","","recently_listened_by","Recently Listened by"),
("376","","","songs_i_liked","Songs I Liked"),
("377","","","block","Block"),
("378","","","are_you_sure_you_want_to_block_this_user","Are you sure you want to block this user"),
("379","","","unblock","Unblock"),
("380","","","blocked_users","Blocked Users"),
("381","","","no_blocked_users_found","No blocked users found"),
("382","","","album_title","Album Title"),
("383","","","your_album_title__2_-_55_characters","Your album title, 2 - 55 characters"),
("384","","","album_description","Album Description"),
("385","","","album_price","Album Price"),
("386","","","add_song","Add Song"),
("387","","","successfully_uploaded","Successfully uploaded"),
("388","","","album_thumbnail_is_required.","Album thumbnail is required."),
("389","","","your_album_was_successfully_created__please_wait..","Your album was successfully created, please wait.."),
("390","","","album_title_is_required.","Album title is required."),
("391","","","album_description_is_required.","Album description is required."),
("392","","","are_you_sure_you_want_to_delete_this_song_","Are you sure you want to delete this song?"),
("393","","","top_50_albums","Top 50 Albums"),
("394","","","no_songs_on_this_album_yet.","No songs on this album yet."),
("395","","","you_may_also_like","You may also like"),
("396","","","your_album_was_successfully_updated__please_wait..","Your album was successfully updated, please wait.."),
("397","","","in_album_","in album:"),
("398","","","delete_your_album","Delete your album"),
("399","","","are_you_sure_you_want_to_delete_this_album_","Are you sure you want to delete this album?"),
("400","","","yes__but_keep_the_songs","Yes, But Keep The Songs"),
("401","","","yes__delete_everything","Yes, Delete Everything"),
("402","","","my_songs","My Songs"),
("403","","","my_albums","My Albums"),
("404","","","create_copyright_dmca_take_down_notice","Create copyright DMCA take down notice"),
("405","","","report_coopyright","Report Copyright"),
("406","","","report_copyright","Report Copyright"),
("407","","","create_dmca_take_down_notice","Create DMCA take down notice"),
("408","","","i_have_a_good_faith_belief_that_use_of_the_copyrighted_work_described_above_is_not_authorized_by_the_copyright_owner__its_agent_or_the_law","I have a good faith belief that use of the copyrighted work described above is not authorized by the copyright owner, its agent or the law"),
("409","","","i_confirm_that_i_am_the_copyright_owner_or_am_authorised_to_act_on_behalf_of_the_owner_of_an_exclusive_right_that_is_allegedly_infringed.","I confirm that I am the copyright owner or am authorised to act on behalf of the owner of an exclusive right that is allegedly infringed."),
("410","","","submit","Submit"),
("411","","","please_describe_your_request_carefully_and_as_much_as_you_can__note_that_false_dmca_requests_can_lead_to_account_termination.","Please describe your request carefully and as much as you can, note that false DMCA requests can lead to account termination."),
("412","","","please_describe_your_request.","Please describe your request."),
("413","","","please_select_the_checkboxs_below_if_you_own_the_copyright.","Please select the checkboxs below if you own the copyright."),
("414","","","spotlight","Spotlight"),
("415","","","no_spotlight_tracks_found","No spotlight tracks found"),
("416","","","spotlight_your_songs","Spotlight your songs"),
("417","","","spotlight_your_songs__feature_","Spotlight your songs (feature)"),
("418","","","spotlight_your_songs__featured_","Spotlight your songs (featured)"),
("419","","","embed","Embed"),
("420","","","browse","Browse"),
("421","","","no_songs_found_on_this_store.","No songs found on this store."),
("422","","","top_seller","Top Seller"),
("423","","","no_more_followers_found","No more followers found"),
("424","","","no_followers_found","No followers found"),
("425","","","no_more_following_found","No more following found"),
("426","","","no_following_found","No following found"),
("427","","","is_pro_user","Is Pro user"),
("428","","","verified","Verified"),
("429","","","pro_user","Pro user"),
("430","","","normal_user","Normal user"),
("431","","","unverified","Unverified"),
("432","","","featured","Featured"),
("433","","","yes","Yes"),
("434","","","no","No"),
("435","","","like_comment","Like Comment"),
("436","","","liked_your_comment.","liked your comment."),
("437","","","unlike_comment","UnLike Comment"),
("438","","","report_comment.","Report comment."),
("439","","","please_describe_whey_you_want_to_report_this_comment.","Please describe whey you want to report this comment."),
("440","","","unreport_comment","UnReport Comment"),
("441","","","the_comment_report_was_successfully_deleted.","The comment report was successfully deleted."),
("442","","","unreport","Un Report"),
("443","","","the_track_report_was_successfully_deleted.","The track report was successfully deleted."),
("444","","","track_comment.","Track comment."),
("445","","","please_describe_whey_you_want_to_report_this_track.","Please describe whey you want to report this track."),
("446","","","report_track.","Report track."),
("447","","","results_for_","results for:"),
("448","","","what_are_looking_for__","What are looking for ?"),
("449","","","no_more_artists_found","No more artists found"),
("450","","","no_more_albums_found","No more albums found");

--
-- Dumping data for table `langs`
--

INSERT INTO langs VALUES
("452","","","please_wait","please_wait"),
("454","","","admin_panel","Admin Panel"),
("455","","","no_messages_found_channel","no messages found channel"),
("456","","","search","search"),
("457","","","write_message","Write message"),
("458","","","are_you_sure_you_want_delete_chat","Are you sure you want delete chat"),
("459","","","messages","messages"),
("460","","","no_messages_were_found__please_choose_a_channel_to_chat.","No messages were found, please choose a channel to chat."),
("461","","","no_messages_were_found__say_hi_","No messages were found, say Hi!"),
("462","","","load_more_messages","Load more messages"),
("463","","","message","message"),
("464","","","no_match_found","No match found"),
("465","","","buy","Buy"),
("466","","","you_have_bought_this_album.","You have bought this album."),
("467","","","price_range","Price range"),
("468","","","you_have_bought_this_track.","You have bought this track."),
("469","","","no_more_albums","No more albums"),
("470","","","no_more_songs","No more songs"),
("471","","","no_results_found","No results found"),
("472","","","no_albums_found","No albums found"),
("473","","","send_as_message","Send as message"),
("474","","","add_a_maximum_of_10_friends_and_send_them_this_track","Add a maximum of 10 friends and send them this track"),
("475","","","get_started","Get Started"),
("476","","","message_sent_successfully","Message sent successfully"),
("477","","","password_is_too_short","Password is too short"),
("478","","","username_length_must_be_between_5___32","Username length must be between 5 / 32"),
("479","","","invalid_username_characters","Invalid username characters"),
("480","","","this_e-mail_is_invalid","This e-mail is invalid"),
("481","","","you_ain_t_logged_in_","You ain&#039;t logged in!"),
("482","","","invalid_user_id","Invalid user ID"),
("483","","","no_new_releases_found","No new releases found"),
("484","","","light_mode","Light mode"),
("485","","","____date___name_","© |DATE| |NAME|"),
("486","","","chat","Chat"),
("487","","","from_now","from now"),
("488","","","any_moment_now","any moment now"),
("489","","","about_a_minute_ago","about a minute ago"),
("490","","","_d_minutes_ago","%d minutes ago"),
("491","","","about_an_hour_ago","about an hour ago"),
("492","","","_d_hours_ago","%d hours ago"),
("493","","","a_day_ago","a day ago"),
("494","","","_d_days_ago","%d days ago"),
("495","","","about_a_month_ago","about a month ago"),
("496","","","_d_months_ago","%d months ago"),
("497","","","about_a_year_ago","about a year ago"),
("498","","","_d_years_ago","%d years ago"),
("504","","","no_data_to_show","No data to show"),
("505","","","listen_to_songs","Listen to Songs"),
("506","","","discover__stream__and_share_a_constantly_expanding_mix_of_music_from_emerging_and_major_artists_around_the_world.","Discover, stream, and share a constantly expanding mix of music from emerging and major artists around the world."),
("507","","","signup_now","Signup Now"),
("508","","","explore","Explore"),
("509","","","listen_music_everywhere__anytime","Listen Music Everywhere, Anytime"),
("510","","","lorem_ipsum_dolor_sit_amet__consectetur_adipiscing_elit__sed_do_eiusmod_tempor_incididunt_ut_labore_et_dolore_magna_aliqua.","Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua."),
("511","","","create_playlists_with_any_song__on-the-go","Create Playlists with any song, On-The-Go"),
("512","","","top_trending_artists","Top Trending Artists"),
("513","","","calling_all_creators","Calling all creators"),
("514","","","get_on__0__to_connect_with_fans__share_your_sounds__and_grow_your_audience.","Get on {0} to connect with fans, share your sounds, and grow your audience."),
("515","","","upload_songs","Upload Songs"),
("516","","","check_stats","Check Stats"),
("517","","","ready_to_rock_your_world.","Ready to rock your world."),
("518","","","search_for_artists__tracks","Search for artists, tracks"),
("520","","","day_mode","Day mode"),
("521","","","night_mode","Night mode"),
("522","","","interest","Interest"),
("523","","","select_your_music_preference","Select your music preference"),
("524","","","choose_below_to_start","Choose below to start"),
("525","","","next","Next"),
("526","","","you_have_to_choose_your_favorites_genres_below","You have to choose your favorites genres below"),
("527","","","maintenance","Maintenance"),
("528","","","website_maintenance_mode_is_active__login_for_user_is_forbidden","Website maintenance mode is active, Login for user is forbidden"),
("529","","","website_maintenance_mode_is_active","Website maintenance mode is active"),
("530","","","we___ll_be_back_soon_","We’ll be back soon!"),
("531","","","sorry_for_the_inconvenience_but_we_rsquo_re_performing_some_maintenance_at_the_moment._if_you_need_help_you_can_always","Sorry for the inconvenience but we&amp;rsquo;re performing some maintenance at the moment. If you need help you can always"),
("532","","","otherwise_we_rsquo_ll_be_back_online_shortly_","otherwise we&amp;rsquo;ll be back online shortly!"),
("533","","","sorry_for_the_inconvenience_but_we_performing_some_maintenance_at_the_moment._if_you_need_help_you_can_always","Sorry for the inconvenience but we performing some maintenance at the moment. If you need help you can always"),
("534","","","otherwise_we_will_be_back_online_shortly_","otherwise we will be back online shortly!"),
("535","","","views","views"),
("536","","","hide","hide"),
("538","","","your_selection_saved_successfully.","Your selection has been updated successfully."),
("539","","","please_wait...","Please wait..."),
("540","","","liked__auser__song_","liked |auser| song,"),
("541","","","shared__auser__song_","shared |auser| song,"),
("542","","","commented_on__auser__song_","commented on |auser| song,"),
("543","","","uploaded_a_new_song_","Uploaded a new song,"),
("544","","","comments","comments"),
("545","","","upload_single_song","Upload single song"),
("546","","","upload_an_album","Upload an album"),
("547","","","thanks_for_your_submission__we_will_review_your_request_shortly.","Thanks for your submission, we will review your request shortly."),
("548","","","user_type","User Type"),
("549","","","years_old","years old"),
("550","","","login_with_wowonder","Login with WoWonder"),
("551","","","balance","Balance"),
("552","","","available_balance","Available balance"),
("553","","","withdrawals","Withdrawals"),
("554","","","paypal_e-mail","PayPal E-mail"),
("555","","","amount","Amount"),
("556","","","min","Min"),
("557","","","submit_withdrawal_request","Submit withdrawal request"),
("558","","","status","Status"),
("559","","","your_withdrawal_request_has_been_successfully_sent_","Your withdrawal request has been successfully sent!");

--
-- Dumping data for table `langs`
--

INSERT INTO langs VALUES
("560","","","requested_on","Requested on"),
("561","","","accepted","Completed"),
("562","","","rejected","Rejected"),
("563","","","pending","Pending"),
("564","","","the_amount_exceeded_your_current_balance.","The amount exceeded your current balance."),
("565","","","minimum_amount_required_is_50.","Minimum amount required is 50."),
("566","","","second_lorem_ipsum_dolor_sit_amet__consectetur_adipiscing_elit__sed_do_eiusmod_tempor_incididunt_ut_labore_et_dolore_magna_aliqua__2","Second Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua, 2"),
("567","","","you_can_not_submit_withdrawal_request_until_the_previous_requests_has_been_approved___rejected","You can not submit withdrawal request until the previous requests has been approved / rejected"),
("568","","","get_verified__get_a_special_looking_profile_and_get_famous_on_our_platform_","Get verified, get a special looking profile and get famous on our platform!"),
("569","","","purchases","Purchases"),
("570","","","select_payment_method.","Select a payment method"),
("571","","","choose_a_payment_method.","Choose a payment method"),
("572","","","track_purchase","Purchase Track "),
("573","","","credit_card","Credit Card"),
("574","","","bank_transfer","Bank Transfer"),
("575","","","note","Note"),
("576","","","please_transfer_the_amount_of","Please transfer the amount of"),
("577","","","to_this_bank_account_to_buy","to this bank account to buy"),
("578","","","upload_receipt","Upload Receipt"),
("579","","","confirm","Confirm"),
("580","","","your_receipt_uploaded_successfully.","Your receipt  has been uploaded successfully."),
("581","","","we_approved_your_bank_transfer_of__d_","We approved your bank transfer of %d!"),
("582","","","we_have_rejected_your_bank_transfer__please_contact_us_for_more_details.","We have rejected your bank transfer, please contact us for more details."),
("583","","","dislike","Dislike"),
("584","","","disliked","Disliked"),
("585","","","paypal","PayPal"),
("586","","","read_more","Read more"),
("587","","","read_less","Read less"),
("588","","","this_username_is_disallowed","This username is not allowed"),
("589","","","disliked__auser__song_","disliked |auser| song,"),
("590","","","statistics","Statistics"),
("591","","","total_views","Total Views"),
("592","","","total_likes","Total Likes"),
("593","","","total_dislikes","Total Dislikes"),
("594","","","today","Today"),
("595","","","this_week","This week"),
("596","","","this_month","This month"),
("597","","","dislikes","dislikes"),
("598","","","allow_downloads","Allow downloads"),
("599","","","display_embed_code","Display embed code"),
("600","","","lyrics","Lyrics"),
("601","","","show_more","Show more"),
("602","","","show_less","Show less"),
("603","","","no_payment_method_available.","No payment method available."),
("604","","","upload_multiple_songs","Upload songs"),
("605","","","add_multiple_songs","Add Songs"),
("606","","","no_users_found","No users found"),
("607","","","show_only_in_track_page","Show only in track page"),
("608","","","show_on_all_pages","Show on all pages"),
("609","","","edit_spotlight","Edit Spotlight"),
("610","","","blog","Blog"),
("611","blog_categories","","1309","Comedy"),
("612","blog_categories","","1310","Cars and Vehicles"),
("613","blog_categories","","1311","Economics and Trade"),
("614","blog_categories","","1312","Education"),
("615","blog_categories","","1313","Entertainment"),
("616","blog_categories","","1314","Movies & Animation"),
("617","blog_categories","","1315","Gaming"),
("618","blog_categories","","1316","History and Facts"),
("619","blog_categories","","1317","Live Style"),
("620","blog_categories","","1318","Natural"),
("621","blog_categories","","1319","News and Politics"),
("622","blog_categories","","1320","People and Nations"),
("623","blog_categories","","1321","Pets and Animals"),
("624","blog_categories","","1322","Places and Regions"),
("625","blog_categories","","1323","Science and Technology"),
("626","blog_categories","","1324","Sport"),
("627","blog_categories","","1325","Travel and Events"),
("628","blog_categories","","1326","Other"),
("630","","","categories","Categories"),
("631","","","no_more_articles_to_show.","No more articles to show."),
("632","","","article","Article"),
("633","","","share_to","Share to"),
("634","","","blogs","Blogs"),
("635","","","no_more_articles","No more articles to show"),
("636","","","no_more_article_found","No more articles found"),
("637","","","delete_song","Delete Song"),
("638","","","delete_this_song_from_playlist","Remove from playlist"),
("639","","","please_enter_song_description","Please enter the song description"),
("640","","","please_enter_song_tags","Please enter song\'s tags"),
("641","","","please_upload_song_thumbnail","Please upload song thumbnail"),
("642","","","you_have_reached_your_upload_limit__upgrade_to_upload_unlimited_songs.","You have reached your upload limit, upgrade to upload unlimited songs."),
("643","","","advertising","Advertising"),
("644","","","wallet","Wallet"),
("645","","","create_ad","New Campaign"),
("646","","","category","Category"),
("647","","","results","Results"),
("648","","","spent","Spent"),
("649","","","action","Action"),
("650","","","2checkout","2Checkout"),
("651","","","address","Address"),
("652","","","city","City"),
("653","","","state","State"),
("654","","","zip","Zip"),
("655","","","phone_number","Phone number"),
("656","","","card_number","Card Number"),
("657","","","pay","Pay"),
("658","","","replenish","Replenish"),
("659","","","please_check_the_details","Please check the details"),
("660","","","confirmation","Confirmation");

--
-- Dumping data for table `langs`
--

INSERT INTO langs VALUES
("661","","","are_you_sure_you_want_to_delete_this_ad_","Are you sure you want to delete this campaign?"),
("662","","","deleted","deleted"),
("663","","","please_check_details","please_check_details"),
("664","","","confirming_your_payment__please_wait..","Confirming your payment, please wait.."),
("665","","","payment_declined__please_try_again_later.","Payment declined, please try again later."),
("666","","","my_balance","My Balance"),
("667","","","replenish_my_balance","Replenish My Balance"),
("668","","","browse_to_upload","Browse To Upload"),
("669","","","create_advertising","New campaign "),
("670","","","create_new_ad","Create new campaign"),
("671","","","your_current_wallet_balance_is__0__please_top_up_your_wallet_to_continue.","Your current wallet balance is 0, please top up your wallet to continue."),
("672","","","top_up","Top Up"),
("673","","","url","URL"),
("674","","","select_media","Select Media"),
("675","","","target_audience","Target Audience"),
("676","","","placement","Placement"),
("677","","","pricing","Pricing"),
("678","","","pay_per_click","Pay Per Click"),
("679","","","pay_per_impression","Pay Per Impression"),
("680","","","spending_limit_per_day","Spending limit per day"),
("681","","","media_file_is_invalid._please_select_a_valid_image","Media file is invalid. Please select a valid image"),
("682","","","error_","Error!"),
("683","","","file_is_too_big__max_upload_size_is","File is too big, Max upload size is"),
("684","","","media_file_is_invalid._please_select_a_valid_image___video","Media file is invalid. Please select a valid image / video"),
("685","","","your_ad_has_been_published_successfully","Your campaign has been published successfully."),
("686","","","the_url_is_invalid._please_enter_a_valid_url","The URL is invalid. Please enter a valid URL."),
("687","","","ad_title_must_be_between_5_100","Campaign title must be between 5/100."),
("688","","","edit_ad","Edit campaign"),
("689","","","your_changes_to_the_ad_were_successfully_saved","Your changes to the campaign were successfully saved."),
("690","","","name_must_be_between_5_32","Name must be between 5/32"),
("691","","","clicks","Clicks"),
("692","","","ads_analytics","Campaign analytics"),
("693","","","this_year","This year"),
("694","","","view_report","View report"),
("695","","","ad_analytics","Campaign analytics"),
("696","","","sponsor_ads","SPONSOR"),
("697","","","by","By"),
("698","","","import","Import"),
("699","","","import_from_soundcloud.","Import From SoundCloud."),
("700","","","enter_the_soundcloud_track_link_and_click_the_button_below.","Paste your SoundCloud URL above."),
("701","","","error_found_while_importing_your_track__please_try_again_later.","Error found while importing your track, please try again later."),
("702","","","please_enter_valid_soundcloud_track_url.","Please enter a valid SoundCloud track URL."),
("703","","","please_enter_soundcloud_track_link_to_import.","Please enter SoundCloud track link to import."),
("704","","","error_found_while_importing_your_track__please_check_soundcloud_client_id.","Error found while importing your track, please check SoundCloud client ID."),
("705","","","dmca","DMCA"),
("706","","","login_with_soundcloud","Login with SoundCloud"),
("707","","","dcma","DCMA"),
("708","","","move_to_album","Move to an album"),
("709","","","select_albums","Select albums"),
("710","","","please_select_which_album_you_want_to_add_this_song_to.","Please select which album you want to add this song to."),
("711","","","review_track","Review Track"),
("712","","","review","Review"),
("713","","","review_track.","Review track."),
("714","","","please_enter_your_review.","Please enter your review."),
("715","","","thanks_for_your_submission.","Thanks for your submission."),
("716","","","reviews","Reviews"),
("717","","","no_reviews_on_this_track_yet.","No reviews on this track yet."),
("718","","","upload_new_track.","uploaded a new track."),
("719","","","notification","Notification"),
("720","","","notification_settings","Notification Settings"),
("721","","","someone_followed_me","Someone followed me"),
("722","","","someone_liked_one_of_my_tracks","Someone liked one of my tracks"),
("723","","","someone_liked_one_of_my_comments","Someone liked one of my comments"),
("724","","","approve_disapprove_artist_request","Approve/Disapprove artist request(s)"),
("725","","","approve_disapprove_bank_payment_request","Approve/Disapprove bank payment request(s)"),
("726","","","one_of_my_following_upload_new_track","One of my following artists uploaded a new track"),
("727","","","one_of_my_following_users_upload_new_track","One of my following artists uploaded a new track"),
("728","","","notify_me_when","Notify me when"),
("729","","","new_notification","New notification"),
("730","","","you_can_not_import_this_track_because_this_track_is_imported_before.","This track is already imported, please choose another track."),
("731","","","manage_sessions","Manage Sessions"),
("732","","","ip_address","IP Address"),
("733","","","platform","Platform"),
("734","","","browser","Browser"),
("735","","","last_seen","Last Seen"),
("736","","","actions","Actions"),
("737","","","session_expired","Session Expired"),
("738","","","your_session_has_been_expired__please_login_again.","Your Session has been expired, please login again."),
("739","","","two-factor_authentication","Two-factor authentication"),
("740","","","phone","Phone"),
("741","","","enable","Enable"),
("742","","","disable","Disable"),
("743","","","turn_on_2-step_login_to_level-up_your_account_s_security__once_turned_on__you_ll_use_both_your_password_and_a_6-digit_security_code_sent_to_your_phone_or_email_to_log_in.","Turn on 2-step login to level-up your account\'s security, Once turned on, you\'ll use both your password and a 6-digit security code sent to your phone or email to log in."),
("744","","","a_confirmation_email_has_been_sent.","A confirmation email has been sent."),
("745","","","we_have_sent_an_email_that_contains_the_confirmation_code_to_enable_two-factor_authentication.","We have sent an email that contains the confirmation code to enable Two-factor authentication."),
("746","","","confirmation_code","Confirmation code"),
("747","","","a_confirmation_message_and_email_were_sent.","A confirmation message and email were sent."),
("748","","","we_have_sent_a_message_and_an_email_that_contain_the_confirmation_code_to_enable_two-factor_authentication","We have sent a message and an email that contain the confirmation code to enable two-factor authentication"),
("749","","","a_confirmation_message_was_sent.","A confirmation message was sent."),
("750","","","we_have_sent_a_message_that_contains_the_confirmation_code_to_enable_two-factor_authentication.","We have sent a message that contains the confirmation code to enable Two-factor authentication."),
("751","","","we_have_sent_you_an_email_with_the_confirmation_code.","We have sent you an email with the confirmation code."),
("752","","","wrong_confirmation_code.","Wrong confirmation code."),
("753","","","your_e-mail_has_been_successfully_verified.","Your E-mail has been successfully verified."),
("754","","","unusual_login","Unusual login"),
("755","","","we_have_sent_you_the_confirmation_code_to_your_email_address.","We have sent you the confirmation code to your email address."),
("756","","","to_log_in__you_need_to_verify_your_identity.","To log in, you need to verify your identity."),
("757","","","welcome...","Welcome Back!"),
("758","","","stations","Stations"),
("759","","","no_stations_found","No stations found"),
("760","","","add_station","Add Station");

--
-- Dumping data for table `langs`
--

INSERT INTO langs VALUES
("761","","","search_for_stations","Search for stations"),
("762","","","station_search.","Station Search."),
("763","","","please_enter_more_than_3_characters.","Please enter more than 3 characters."),
("764","","","error_found_while_search_stations__please_try_again_later.","Error found while search stations, please try again later."),
("765","","","you_already_add_this_station.","You already add this station."),
("766","","","delete_station","Delete Station"),
("767","","","no_more_stations_found","No more stations found"),
("768","","","the_track_has_been_moved_to_this_album_successfully.","The track has been moved to following album."),
("769","","","someone_liked_disliked_one_of_my_tracks","Someone liked/disliked one of my tracks"),
("770","","","disliked_your_song.","disliked your song."),
("771","","","reviewed_your_song.","reviewed your song."),
("772","","","someone_reviewed_one_of_my_tracks","Someone reviewed one of my tracks"),
("773","","","you_can_not_import_this_track_because_this_track_is_one_of_soundcloud_go__tracks.","You can not import this track because this track is one of SoundCloud Go+ tracks."),
("774","","","remove_song","Remove Song"),
("775","","","invalid_file_format__only_mp3__ogg__opus__oga__wav__and_mpeg_is_allowed","Invalid file format, only mp3, ogg, opus, oga, wav, and mpeg is allowed"),
("778","","","my_affiliates","My Affiliates"),
("779","","","your_affiliate_link","Your affiliate link"),
("780","","","import_from","Import From"),
("781","","","paste_your_url_above.","Paste your URL above."),
("782","","","please_enter_a_valid_link_to_import.","Please enter a valid link to import."),
("783","","","import_sounds","Import Music"),
("784","","","link_must_be_like_ex__https___music.apple.com_us_album_wolves_1445055015_i_1445055017","Link must be like EX: https://music.apple.com/us/album/wolves/1445055015?i=1445055017"),
("785","","","itunes_partner_token","Itunes Partner Token"),
("786","","","listen_in_deezer","Listen in Deezer"),
("787","","","type","Type"),
("788","","","banners_ads","Banners Ads"),
("789","","","audio_ads","Audio Ads"),
("790","","","select_audio","Select Audio"),
("791","","","error_500_internal_server_error_","Error 500 internal server error!"),
("792","","","no_songs_found__add_new_songs.","No songs found, add new songs."),
("793","","","add_upload_folder","Add Upload Folder"),
("794","","","upload_folder","Upload Folder"),
("795","","","playlist_single","Playlist"),
("796","","","drop_your_files","Drop your files to upload"),
("797","","","invite_new_users","Invite new Users."),
("798","","","get_credits","Get Credits."),
("799","","","to_skip_ad","to Skip Ad"),
("800","","","campaign_deleted_succ","Campaign deleted successfully."),
("801","","","earn_up","Earn up to {{PRICE}} for each user your refer to us!"),
("802","","","buy_album","Buy Album"),
("804","","","mentioned_you_on_a_comment.","mentioned you on a comment."),
("805","","","one_of_my_follower_mention_me_in_comment","One of my followers mentioned me in a comment"),
("806","","","one_of_my_follower_mention_me_in_comment_replay","One of my followers mentioned me in a comment\'s reply"),
("807","","","replay_comment","Reply to comment"),
("808","","","replayed_on__auser__comment_","replied on |auser| comment,"),
("810","","","point_system","Points System"),
("811","","","points_on_comment.","Points by posting a comment."),
("812","","","points_on_upload_new_song.","Points by uploading a song."),
("813","","","points_on_replay_to_comment.","Points by replying to a comment."),
("814","","","points_on_like_some_one_track.","Points by liking a track."),
("815","","","points_on_dislike_some_one_track.","Points on disliking a track."),
("816","","","points_on_like_some_one_comment.","Points on liking a comment."),
("817","","","points_on_create_new_playlist.","Points on creating new playlist."),
("818","","","points_on_re-post_track.","Points on re-posting a track."),
("819","","","points_on_download_track.","Points on downloading a track."),
("820","","","points_on_like_blog_comment.","Points on liking a blog\'s comment."),
("821","","","points_on_dislike_comment.","Points on disliking a comment."),
("822","","","points_on_dislike_blog_comment.","Points on disliking a blog\'s comment."),
("823","","","points_on_import_track.","Points by importing a song."),
("824","","","points_on_user_update_his_profile_picture.","Points by updating your profile picture."),
("825","","","points_on_purchase_track.","Points on purchasing a track."),
("826","","","points_on_user_go_pro.","Points by purchasing a PRO package."),
("827","","","points_on_review_some_one_track.","Points by reviewing a track."),
("828","","","points_on_report_some_one_track.","Points on reporting a track."),
("829","","","points_on_report_comment.","Points on reporting a comment."),
("830","","","points_on_add_to_playlist.","Points on adding track to a playlist."),
("831","","","points_on_user_update_his_profile_cover.","Points on updating your profile cover."),
("832","","","create_new_article","Create new article"),
("833","","","create_blog_bost","Create blog post"),
("834","","","create_article_html","HTML data"),
("835","","","upload_file","Upload a file"),
("836","","","upload_photo","Upload Photo"),
("837","","","success","Success"),
("838","","","article_saved_successfully","Your article has been submitted successfully."),
("839","","","warning","Warning"),
("840","","","stream_url_not_found.","Stream URL has not been found."),
("841","","","you_can_earn_points_and_transfer_them_to_your_wallet_by_doing_the_activities_below.","You can earn points and transfer them to your wallet by doing the activities below."),
("842","","","login_or_register_to_start_earning_points_","Login or Register to start earning points!"),
("843","","","point","Point"),
("844","","","_your_address_has_been_added_successfully_","Your address has been added successfully!"),
("845","","","_your_address_has_been_edited_successfully_","Your address has been edited successfully!"),
("846","","","_name_must_be_between_5_32_","Name must be between 5/32"),
("847","","","_the_url_is_invalid._please_enter_a_valid_url_","The URL is invalid, Please enter a valid URL."),
("848","","","_media_file_is_invalid._please_select_a_valid_image___video_","Media file is invalid, Please select a valid image / video."),
("849","","","_media_file_is_invalid._please_select_a_valid_image_","Media file is invalid, Please select a valid image."),
("850","","","_media_file_is_invalid._please_select_a_valid_audio_","Media file is invalid, Please select a valid audio file."),
("851","","","_too_many_login_attempts_please_try_again_later_","Too many login attempts, please try again later."),
("852","","","_url_can_not_be_empty_","URL can not be empty."),
("853","","","_address_can_not_be_empty_","Address can not be empty."),
("854","","","_tickets_available_and_ticket_price_can_not_be_empty_","Tickets availability and Price can\'t be empty."),
("855","","","_event_cover_can_not_be_empty_","Event Cover is required."),
("856","","","_event_video_can_not_be_empty_","Event Video is required."),
("857","","","_your_event_has_been_published_successfully_","Your event has been published successfully!"),
("858","","","_your_event_has_been_updated_successfully_","Your event has been updated successfully!"),
("859","","","_payment_successfully_done_","Payment successfully, Thank you!"),
("860","","","_please_select_a_song_","Please select a song."),
("861","","","_please_select_a_valid_image_","Please select a valid image."),
("862","","","_your_product_has_been_published_successfully_","Your product has been published successfully!"),
("863","","","_your_product_is_under_review_","Your product is submitted and will be reviewed soon."),
("864","","","_your_product_has_been_edited_successfully_","Your product has been edited successfully!");

--
-- Dumping data for table `langs`
--

INSERT INTO langs VALUES
("865","","","_some_products_don_t_have_enough_of_units_","Some of your products don\'t have enough units."),
("866","","","_you_don_t_have_enough_wallet_","You don\'t have enough balance in your wallet."),
("867","","","_please_top_up_your_wallet_","Please top up your wallet"),
("868","","","_your_order_has_been_placed_successfully_","Your order has been placed!"),
("869","","","_tracking_info_has_been_saved_successfully_","Tracking info has been saved."),
("870","","","_review_has_been_sent_successfully_","Review has been sent."),
("871","","","_your_request_is_under_review_","Your request is under review."),
("872","","","_your_story_has_been_published_successfully_","Your story has been published successfully!"),
("873","","","_your_story_has_been_uploaded_successfully_to_publish_it_please_pay_","Your story has been uploaded, please pay to continue."),
("874","","","_story_not_found_or_its_active_","Story not found or not active."),
("875","","","_you_don_t_have_enough_money_please_top_up_your_wallet_","You don\'t have enough balance in your wallet, please top up your wallet."),
("876","","","login_with_linkedin","Login with LinkedIn"),
("877","","","login_with_vkontakte","Login with Vkontakte"),
("878","","","login_with_instagram","Login with Instagram"),
("879","","","login_with_qq","Login with QQ"),
("880","","","login_with_wechat","Login with WeChat"),
("881","","","login_with_discord","Login with Discord"),
("882","","","login_with_mailru","Login with Mailru"),
("883","","","no_items_found","No items found."),
("884","","","you_don_t_have_enough_wallet","You don\'t have enough balance in your wallet."),
("885","","","please_top_up_your_wallet","Please top up your wallet."),
("886","","","total","Total"),
("887","","","add_new_address","Add New Address"),
("888","","","create_new_event","Create New Event"),
("889","","","manage_events","Manage Events"),
("890","","","browse_events","Browse Events"),
("891","","","joined_events","Joined Events"),
("892","","","view_purchased_tickets","View Purchased Tickets"),
("893","","","event_name","Event Name"),
("894","","","event_location","Event location"),
("895","","","online","Online"),
("896","","","real_location","Real Location"),
("897","","","event_start_date","Event Start Date"),
("898","","","event_start_time","Event Start Time"),
("899","","","event_end_date","Event End Date"),
("900","","","event_end_time","Event End Time"),
("901","","","timezone","Timezone"),
("902","","","sell_tickets","Sell Tickets"),
("903","","","tickets_available_total_tickets_available_for_this_event_","Tickets available (Total tickets available for this event)"),
("904","","","ticket_price","Ticket Price"),
("905","","","event_description","Event Description"),
("906","","","event_cover","Event Cover"),
("907","","","event_video_trailer","Event Video/Trailer"),
("908","","","create_product","Create Product"),
("909","","","manage_products","Manage Products"),
("910","","","total_item_units","Total Item Units"),
("911","","","related_to_song","Related to song"),
("912","","","images","Images"),
("913","","","who_can_see","Who can see"),
("914","","","show_to_my_followers_only","Show To My Followers"),
("915","","","show_to_all_users","Show To All Users (Promotion)"),
("916","","","story_image","Story Image"),
("917","","","upload_song","Upload Song"),
("918","","","shipped","Shipped"),
("919","","","delivered","Delivered"),
("920","","","payments","Payments"),
("921","","","subtotal","Subtotal"),
("922","","","refund_money","Refund Money"),
("923","","","tracking_details","Tracking Details"),
("924","","","site_url","Site Url"),
("925","","","tracking_number","Tracking Number"),
("926","","","delivery_address","Delivery Address"),
("927","","","no_orders_found","No orders found"),
("928","","","products","Products"),
("929","","","view_details","View Details"),
("930","","","stories","Stories"),
("931","","","joined","Joined"),
("932","","","join","Join"),
("933","","","buy_a_ticket","Buy a ticket"),
("934","","","view_trailer","View Trailer"),
("935","","","edit_event","Edit Event"),
("936","","","start_date","Start date"),
("937","","","end_date","End date"),
("938","","","available_tickets","Available Tickets"),
("939","","","joined_people","Joined people"),
("940","","","location","Location"),
("941","","","total_events","Total Events"),
("942","","","total_joined_users","Total Joined Users"),
("943","","","total_available_tickets","Total Available Tickets"),
("944","","","most_joined_events","Most joined events"),
("945","","","most_sold_events","Most sold events"),
("946","","","no_more_events_found","No more events found"),
("947","","","no_more_tickets_found","No more tickets found"),
("948","","","no_more_products_found","No more products found"),
("949","","","no_more_reviews_found","No more reviews found"),
("950","","","payment_successfully_done","payment successfully done"),
("951","","","are_you_sure_you_want_to_pay_to_buy_song_","Are you sure you want to pay to buy this song?"),
("952","","","are_you_sure_you_want_to_pay_to_buy_album_","Are you sure you want to pay to buy this album?"),
("953","","","are_you_sure_you_want_to_pay_to_upgrade_to_pro_","Are you sure you want to upgrade to PRO?"),
("954","","","you_don_t_have_enough_money_please_top_up_your_wallet","You dont have enough money please top up your wallet"),
("955","","","interested","Interested"),
("956","","","no_more_views","No More Views"),
("957","","","are_you_sure_you_want_to_delete_your_story_","Are you sure you want to delete your story?"),
("958","","","please_add_a_new_address","Please add a new address"),
("959","","","please_select_address","Please select address"),
("960","","","refund","Refund"),
("961","","","create_event","Create Event"),
("962","","","checkout","Checkout"),
("963","","","store_orders","Store Orders"),
("964","","","my_orders","My Orders");

--
-- Dumping data for table `langs`
--

INSERT INTO langs VALUES
("965","","","no_request_found","No request found"),
("966","","","delete_event","Delete Event"),
("967","","","cashfree","Cashfree"),
("968","","","paystack","Paystack"),
("969","","","razorpay","Razorpay"),
("970","","","paysera","Paysera"),
("971","","","iyzipay","Iyzipay"),
("972","","","payu","Payu"),
("973","","","securionpay","Securionpay"),
("974","","","authorize","Authorize"),
("975","","","placed","Placed"),
("976","","","canceled","Canceled"),
("977","","","packed","Packed"),
("978","","","commission","Commission"),
("979","","","final_price","Final Price"),
("980","","","link","Link"),
("981","","","site_commission","Site Commission"),
("982","","","currently_unavailable.","Currently unavailable."),
("983","","","write_review","Write Review"),
("984","","","photos","Photos"),
("985","","","verified_purchase","Verified Purchase"),
("986","","","events","Events"),
("987","","","my_addresses","My Addresses"),
("988","","","add_new","Add New"),
("989","","","edit_address","Edit Address"),
("990","","","postcode___zip","Postcode / Zip"),
("991","","","invitation_links","Invitation Links"),
("992","","","available_links","Available Links"),
("993","","","generated_links","Generated Links"),
("994","","","used_links","Used Links"),
("995","","","generate_link","Generate Link"),
("996","","","invited_user","Invited User"),
("997","","","date","Date"),
("998","","","copy","Copy"),
("999","","","copied","Copied"),
("1000","","","available_wallet","Available wallet"),
("1001","","","top_up_wallet","Top up wallet"),
("1002","","","hall_of_fame","Hall of fame"),
("1003","","","analytics","Analytics"),
("1004","","","more_info","More Info"),
("1005","","","listen_in_youtube","Listen in Youtube"),
("1006","","","tagged_artists","Tagged Artists"),
("1007","","","donate","Donate"),
("1008","","","s_other","Other"),
("1009","","","s_clothes","Clothes"),
("1010","","","s_electronic","Electronic"),
("1011","","","remove_from_cart","Remove From Cart"),
("1012","","","add_to_cart","Add To Cart"),
("1013","","","your_cart_is_empty.","Your cart is empty."),
("1014","","","delete_your_address","Delete your address"),
("1015","","","are_you_sure_you_want_to_delete_this_address_","Are you sure you want to delete this address?"),
("1016","","","payment_alert","Payment Alert"),
("1017","","","are_you_sure_you_want_to_pay_","Are you sure you want to pay?"),
("1018","","","delete_your_product","Delete your product"),
("1019","","","are_you_sure_you_want_to_delete_this_product_","Are you sure you want to delete this product?"),
("1020","","","pay_for_story","Pay for story"),
("1021","","","are_you_sure_you_want_to_pay_for_create_story_","Are you sure you want to pay for create story?"),
("1022","","","pay_from_wallet","Pay from wallet"),
("1023","","","are_you_sure_you_want_to_buy_a_ticket_","Are you sure you want to buy a ticket?"),
("1024","","","leave_event","Leave event"),
("1025","","","are_you_sure_you_want_to_leave_this_event_","Are you sure you want to leave this event?"),
("1026","","","leave","Leave"),
("1027","","","delete_your_event","Delete your event"),
("1028","","","are_you_sure_you_want_to_delete_this_event_","Are you sure you want to delete this event?"),
("1029","","","get_verified___sell_your_songs___sell_products___create_events_and_sell_tickets___get_a_special_looking_profile_and_get_famous_on_our_platform_","Get verified, sell your songs, Sell products, Create events and sell tickets, get a special looking profile and get famous on our platform!"),
("1030","","","get_verified___sell_your_songs___create_events_and_sell_tickets___get_a_special_looking_profile_and_get_famous_on_our_platform_","Get verified, sell your songs, Create events and sell tickets, get a special looking profile and get famous on our platform!"),
("1031","","","get_verified___sell_your_songs___sell_products___get_a_special_looking_profile_and_get_famous_on_our_platform_","Get verified, sell your songs, sell products, get a special looking profile and get famous on our platform!"),
("1032","","","get_verified___sell_your_songs___get_a_special_looking_profile_and_get_famous_on_our_platform_","Get verified, sell your songs, get a special looking profile and get famous on our platform!"),
("1033","","","no_events_found","No events found"),
("1034","","","event","Event"),
("1035","","","product","Product"),
("1036","","","donate_button","Donate Button"),
("1037","","","my_information","My Information"),
("1038","","","please_choose_which_information_you_would_like_to_download","Please choose which information you would like to download."),
("1039","","","generate_file","Generate file"),
("1040","","","your_event_has_been_published_successfully","Your event has been published successfully"),
("1041","","","no_tickets_found","No tickets found"),
("1042","","","purchased_tickets","Purchased Tickets"),
("1043","","","your_event_has_been_updated_successfully","Your event has been updated successfully"),
("1044","","","your_product_is_under_review","Your product is under review"),
("1045","","","your_product_has_been_published_successfully","Your product has been published successfully"),
("1046","","","edit_product","Edit Product"),
("1047","","","your_product_has_been_edited_successfully","Your product has been edited successfully"),
("1048","","","guest","Guest"),
("1049","","","ticket","Ticket"),
("1050","","","events_analytics","Events Analytics"),
("1051","","","id","ID"),
("1052","","","tag_artists","Tag Artists"),
("1053","","","tag_other_artists_to_show_they_performed_together","Tag other artists to show they performed together"),
("1054","","","download_ticket","Download Ticket"),
("1055","","","your_order_has_been_placed_successfully","Your order has been placed successfully"),
("1056","","","order","Order"),
("1057","","","sale_invoice","Sale invoice"),
("1058","","","seller_name","Seller Name"),
("1059","","","seller_email","Seller Email"),
("1060","","","invoice_to","Invoice To"),
("1061","","","payment_details","Payment Details"),
("1062","","","total_due","Total Due"),
("1063","","","bank_name","Bank name"),
("1064","","","item","Item");

--
-- Dumping data for table `langs`
--

INSERT INTO langs VALUES
("1065","","","download_invoice","Download Invoice"),
("1066","","","details","Details"),
("1067","","","no_products_found","No products found"),
("1068","","","no_reviews_found","No reviews found"),
("1069","","","you_are_about_to_purchase_the_items__do_you_want_to_proceed_","You are about to purchase the items, do you want to proceed?"),
("1070","","","request_a_refund","Request a Refund"),
("1071","","","new_orders_has_been_placed","New orders has been placed."),
("1072","","","order_status_has_been_changed","Your order status has been updated."),
("1073","","","your_refund_request_has_been_declined","Your refund request has been declined."),
("1074","","","your_refund_request_has_been_approved_your_money_added_to_your_wallet","Your refund request has been approved, balance re-added to your wallet."),
("1075","","","added_tracking_info","updated the order with tracking information."),
("1076","","","your_product_has_been_approved","Your product has been approved."),
("1077","","","joined_your_event","joined your event"),
("1078","","","bought_a_ticket","bought a ticket, you got a new sale!"),
("1079","","","orders","Orders"),
("1080","","","you_are_not_purchased","You didn\'t purchase this item."),
("1081","","","order_not_found","Order not found"),
("1082","","","if_the_order_status_wasn_t_set_to_delivered_within_60_days_from_the_order_date__it_will_be_automatically_be_sent_to__delivered_.","If the order status wasn\'t set to delivered within 60 days from the order date, it will be automatically be set to Delivered."),
("1083","","","if_the_order_wasn_t_actually_delivered__the_buyer_can_request_a_refund.","If the order wasnt actually delivered, the buyer can request a refund."),
("1084","","","your_request_is_under_review","Your request is under review."),
("1085","","","request","Request"),
("1086","","","please_explain_the_reason","Please explain the reason"),
("1087","","","top_products","Top Products"),
("1088","","","best_selling_songs___products_this_week","Best Selling Songs &amp; Products This Week"),
("1089","","","best_selling_songs___albums_this_week","Best Selling Songs &amp; Albums This Week"),
("1090","","","accepted_","Accepted"),
("1091","","","please_wait__this_may_take_few_minutes.","Please wait, this may take few minutes."),
("1092","","","instead_of_uploading_a_song__you_can_easily_import_songs_using","Instead of uploading a song, you can easily import songs using"),
("1093","","","imported_a_new_song_","Imported a new song,"),
("1094","","","review_has_been_sent_successfully","Review has been sent successfully!"),
("1095","","","created_new_product_","created new product,"),
("1096","","","created_new_event_","created new event,"),
("1097","","","joined_new_event_","joined new event,"),
("1098","","","purchased_a_ticket_","purchased a ticket,"),
("1099","","","my_store","My Store"),
("1100","","","store_analytics","Store Analytics"),
("1101","","","total_products","Total Products"),
("1102","","","total_earned","Total Earned"),
("1103","","","total_commission","Total Commission"),
("1104","","","total_sub_earned","Total Sub Earned"),
("1105","","","most_sold_products","Most sold products"),
("1106","","","event_name_can_not_be_empty","Event name can not be empty"),
("1107","","","event_description_can_not_be_empty","Event description can not be empty"),
("1108","","","start_date_can_not_be_empty","Start date can not be empty"),
("1109","","","create_story","Create Story"),
("1110","","","product_related_song_can_not_be_empty","Product related song can not be empty"),
("1111","","","product_info","Product Info"),
("1112","","","event_info","event Info"),
("1113","","","you_are_not_the_owner","You are not the owner"),
("1114","","","event_not_found","Event not found"),
("1115","","","this_event_is_free","This event is free"),
("1116","","","there_is_no_available_tickets","There is no available tickets"),
("1117","","","card_is_empty","Card is empty"),
("1118","","","address_can_not_be_empty","Address can not be empty"),
("1119","","","id_can_not_be_empty","id can not be empty"),
("1120","","","event_location_can_not_be_empty","Event location can not be empty"),
("1121","","","start_time_can_not_be_empty","Start time can not be empty"),
("1122","","","end_date_can_not_be_empty","End Date can not be empty"),
("1123","","","end_time_can_not_be_empty","End time can not be empty"),
("1124","","","timezone_can_not_be_empty","Timezone can not be empty"),
("1125","","","event_image_can_not_be_empty","Event image can not be empty"),
("1126","","","product_title_can_not_be_empty","Product title can not be empty"),
("1127","","","product_description_can_not_be_empty","Product description can not be empty"),
("1128","","","product_tags_can_not_be_empty","Product tags can not be empty"),
("1129","","","product_price_can_not_be_empty","Product price can not be empty"),
("1130","","","product_units_can_not_be_empty","Product units can not be empty"),
("1131","","","product_category_can_not_be_empty","Product category can not be empty"),
("1132","","","product_image_can_not_be_empty","Product image can not be empty"),
("1133","","","product_not_found","Product not found"),
("1134","","","address_not_found","Address not found"),
("1135","","","tracking_url_can_not_be_empty","Tracking url can not be empty"),
("1136","","","tracking_number_can_not_be_empty","Tracking number can not be empty"),
("1137","","","please_enter_a_valid_url","Please enter a valid url"),
("1138","","","rating_can_not_be_empty","rating can not be empty"),
("1139","","","review_can_not_be_empty","review can not be empty"),
("1140","","","please_who_can_see_the_story","Please who can see the story"),
("1141","","","please_select_a_story_image","Please select a story image"),
("1142","","","please_select_a_story_song","Please select a story song"),
("1143","","","story_not_found_or_its_not_active","Story not found or its not active"),
("1144","","","get_verified","Get verified"),
("1145","","","sell_your_songs","sell your songs"),
("1146","","","sell_products","sell products"),
("1147","","","create_events_and_sell_tickets","Create events and sell tickets"),
("1148","","","upload_more_songs","upload more songs"),
("1149","","","get_more_space","get more space"),
("1150","","","get_a_special_looking_profile_and_get_famous_on_our_platform_","get a special looking profile and get famous on our platform!"),
("1151","","","ticket_was_purchased_in_sitename__date","Ticket was purchased in {SITENAME}, {DATE}"),
("1152","","","created_new_product","Created new product"),
("1153","","","track","Track"),
("1154","","","event_ticket","Event Ticket"),
("1155","","","for","For"),
("1156","","","event_starts","Event Starts"),
("1157","","","event_ends","Event Ends"),
("1158","","","video_duration_must_be_less_than_or_equal_10_seconds","Video duration must be less than or equal 10 seconds"),
("1159","","","purchased_by","Purchased By"),
("1160","","","event_address","Event Address"),
("1161","","","no_more_orders_found","No more orders found"),
("1162","","","login_to_purchase","Login To Purchase"),
("1163","","","your_video_will_be_converted_to_mp3_soon__you_ll_get_notified_once_imported","Your video will be converted to mp3 soon, youll get notified once imported"),
("1164","","","your_song_is_ready_to_view","your song is ready to view");

--
-- Dumping data for table `langs`
--

INSERT INTO langs VALUES
("1165","","","points","Points"),
("1166","","","points_on_listening_to_a_song.","Points on listening to a song."),
("1167","","","your_earned_points_will_automatically_go_to","Your earned points will automatically go to"),
("1168","","","earn_points","Earn Points"),
("1169","","","playlist_not_found","Playlist not found"),
("1170","","","total_songs_sales","Total Songs Sold"),
("1171","","","total_tickets_sales","Total Tickets Sales"),
("1172","","","total_products_sales","Total Products Sold"),
("1173","","","faqs","Faqs"),
("1174","","","yoomoney","Yoomoney"),
("1175","","","empty_amount","Amount can not be empty"),
("1176","","","fortumo","Fortumo"),
("1177","","","aamarpay","Aamarpay"),
("1178","","","ngenius","Ngenius"),
("1179","","","coinbase","Coinbase"),
("1180","","","coinpayments","Coinpayments"),
("1181","","","coinpayments_approved","Your payment using CoinPayments has been approved"),
("1182","","","coinpayments_canceled","Your payment using CoinPayments has been canceled"),
("1183","","","remember_device","Remember this device"),
("1184","","","least_characters","Must be at least 6 characters long."),
("1185","","","contain_lowercase","Must contain a lowercase letter."),
("1186","","","contain_uppercase","Must contain an uppercase letter."),
("1187","","","number_special","Must contain a number or special character."),
("1188","","","complexity_requirements","The password supplied does not meet the minimum complexity requirements"),
("1189","","","first_name","First Name"),
("1190","","","last_name","Last Name"),
("1191","","","first_name_last_name_empty","Your First Name and Last Name can not be empty."),
("1192","","","terms_of_use_page","&lt;h4&gt;1- Write your Terms Of Use here.&lt;/h4&gt; <br>&lt;p&gt; &lt;/p&gt; <br>&lt;p&gt;Lorem ipsum dolor sit amet, consectetur adisdpisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis sdnostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.&lt;/p&gt; <br>&lt;p&gt; &lt;/p&gt; <br>&lt;h4&gt;2- Random title&lt;/h4&gt; <br>&lt;p&gt; &lt;/p&gt; <br>&lt;p&gt;Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.&lt;/p&gt;"),
("1193","","","about_page","<h1 style=\"text-align: center;\"><strong>Background</strong></h1>\n<p style=\"text-align: center;\">South Africa has a lot of talents and one that stands out is music. With that being said a lot of South African artists, if they are lucky enough do get mainstream media coverage and exposure but in return for that most are being exploited. THESE CREATIVE work hard to earn a living but are not aware of barriers that are set. Most commercial digital stores and streaming platforms cater for artists with a much wider audience and these creative are left out because they have rich a certain threshold to even make a living worth a month\'s expenses. The notion that artists need record labels to make a living lives a lot of artists who will not or do not want to get signed in a tragic position and these CREATIVES are not able to make ends meet. As a music lover this also affects the listening experience because artists do not creative music anymore rather than just creating pieces that will hopefully get that media coverage and in 9 out of 10 times it is derogatory music.</p>\n<h1 style=\"text-align: center;\"><strong>Purpose</strong></h1>\n<p style=\"text-align: center;\"><em><strong>Creating a safe environment where artists can sell their music and get 100% of their royalties</strong></em></p>\n<ul>\n<li>The platform will be resamble a traditional and physical way of selling music. \'Instead of users(listeners) paying for using the platform this will be for them and the artists will pay a subscription fee to use the platform. (This design inspired by the exchange that happens in real life where artists are responsible for maintaining and attaining an environment in which they sell their product and customers just walk in and only pay for what they need rather than having paid membership for the store)</li>\n</ul>\n<ul>\n<li>This product will only empower an individual artists rather than a record label so it will cater for independent artist and artists who are in control of their digital sales(if signed to any label). No other body should upload content on behalf of another.</li>\n</ul>\n<ul>\n<li>This music(when bought)can only be played for personal.</li>\n</ul>\n<ul>\n<li>ONLY ORIGINAL MUSIC SOUND BE UPLOADED ON THE PLATFORM. \'Artists to upload their own music on the platform.</li>\n</ul>\n<ul>\n<li>The platform will use external payment channels( such as PayPal) to ensure that transaction between user and artists is protected .</li>\n</ul>\n<ul>\n<li>The platform will allow CREATIVES to make money from download (and only play 30% of the audio before being purchased ). It will also allow CREATIVES to upload free audios available for streaming. This platform should empower and inspire individual artists to take control of their music and OWN IT .</li>\n<li>To bridge the gap between creating and making profit from it.</li>\n<li>To ensure that the platform meets all legal requirements to be able to function and be protected.</li>\n</ul>\n<ul>\n<li>To ensure that the artist\'s work is protected.</li>\n</ul>\n<ul>\n<li>Meeting legal requirements for running this platform.</li>\n</ul>\n<ul>\n<li>Creating a legal and secure environment where CREATIVES could sell their music.</li>\n<li>Assuring that users are respected and our platform follows necessary law.</li>\n<li>Protecting users and CREATIVES privacy legally and how it is used and processed.</li>\n<li>Protecting the platform from forms of legal sabotage. (From third parties , CREATIVES and users)</li>\n</ul>\n<ul>\n<li>CREATING AN ENVIRONMENT WHEREBY THE USERS AND THE ARTISTS ARE PLEASANT WITH THE SERVICE .</li>\n</ul>"),
("1194","","","privacy_policy_page","&lt;h4&gt;1- Write your Privacy Policy here.&lt;/h4&gt; <br>&lt;p&gt; &lt;/p&gt; <br>&lt;p&gt;Lorem ipsum dolor sit amet, consectetur adisdpisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis sdnostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.&lt;/p&gt; <br>&lt;p&gt;&lt;br /&gt; &lt;br /&gt; &lt;/p&gt; <br>&lt;h4&gt;2- Random title&lt;/h4&gt; <br>&lt;p&gt; &lt;/p&gt; <br>&lt;p&gt;Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.&lt;/p&gt;"),
("1195","","","dmca_terms_page","&lt;h4&gt;1- Write your DMCA Notice.&lt;/h4&gt; <br>&lt;p&gt; &lt;/p&gt; <br>&lt;p&gt;Lorem ipsum dolor sit amet, consectetur adisdpisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis sdnostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.&lt;/p&gt; <br>&lt;p&gt;&lt;br /&gt; &lt;br /&gt; &lt;/p&gt; <br>&lt;h4&gt;2- Random title&lt;/h4&gt; <br>&lt;p&gt; &lt;/p&gt; <br>&lt;p&gt;Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.&lt;/p&gt;");

-- ---------------------------------------------------------
--
-- Table structure for table : `likes`
--
-- ---------------------------------------------------------

CREATE TABLE `likes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `track_id` int(11) NOT NULL DEFAULT 0,
  `user_id` int(11) NOT NULL DEFAULT 0,
  `comment_id` int(11) unsigned NOT NULL DEFAULT 0,
  `time` int(11) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`),
  KEY `track_id` (`track_id`),
  KEY `user_id` (`user_id`),
  KEY `time` (`time`),
  KEY `comment_id` (`comment_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

-- ---------------------------------------------------------
--
-- Table structure for table : `media`
--
-- ---------------------------------------------------------

CREATE TABLE `media` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `product_id` int(11) NOT NULL DEFAULT 0,
  `review_id` int(11) NOT NULL DEFAULT 0,
  `image` text CHARACTER SET utf8 DEFAULT NULL,
  `time` int(11) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`),
  KEY `product_id` (`product_id`),
  KEY `review_id` (`review_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- ---------------------------------------------------------
--
-- Table structure for table : `messages`
--
-- ---------------------------------------------------------

CREATE TABLE `messages` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `from_id` int(11) NOT NULL DEFAULT 0,
  `to_id` int(11) NOT NULL DEFAULT 0,
  `text` text DEFAULT NULL,
  `seen` int(11) NOT NULL DEFAULT 0,
  `time` int(11) NOT NULL DEFAULT 0,
  `from_deleted` int(11) NOT NULL DEFAULT 0,
  `to_deleted` int(11) NOT NULL DEFAULT 0,
  `sent_push` int(11) unsigned NOT NULL DEFAULT 0,
  `notification_id` varchar(50) NOT NULL DEFAULT '',
  `type_two` varchar(32) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  KEY `from_id` (`from_id`),
  KEY `to_id` (`to_id`),
  KEY `seen` (`seen`),
  KEY `time` (`time`),
  KEY `from_deleted` (`from_deleted`),
  KEY `to_deleted` (`to_deleted`),
  KEY `notification_id` (`notification_id`),
  KEY `type_two` (`type_two`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- ---------------------------------------------------------
--
-- Table structure for table : `notifications`
--
-- ---------------------------------------------------------

CREATE TABLE `notifications` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `notifier_id` int(11) NOT NULL DEFAULT 0,
  `recipient_id` int(11) NOT NULL DEFAULT 0,
  `track_id` int(11) NOT NULL DEFAULT 0,
  `comment_id` int(11) unsigned NOT NULL DEFAULT 0,
  `type` varchar(50) NOT NULL DEFAULT '',
  `text` text DEFAULT NULL,
  `url` varchar(3000) NOT NULL DEFAULT '',
  `seen` varchar(50) NOT NULL DEFAULT '0',
  `sent_push` int(11) unsigned DEFAULT 0,
  `admin` int(11) NOT NULL DEFAULT 0,
  `time` varchar(50) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `recipient_id` (`recipient_id`),
  KEY `type` (`type`),
  KEY `seen` (`seen`),
  KEY `notifier_id` (`notifier_id`),
  KEY `time` (`time`),
  KEY `music_id` (`track_id`),
  KEY `admin` (`admin`),
  KEY `comment_id` (`comment_id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `notifications`
--

INSERT INTO notifications VALUES
("4","8","1","0","0","follow_user","","","1664376919","0","0","1660146832"),
("5","0","0","0","0","with","","","1664374306","0","1","1664374025");

-- ---------------------------------------------------------
--
-- Table structure for table : `orders`
--
-- ---------------------------------------------------------

CREATE TABLE `orders` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `hash_id` varchar(120) DEFAULT '0',
  `user_id` int(11) NOT NULL DEFAULT 0,
  `product_owner_id` int(11) NOT NULL DEFAULT 0,
  `product_id` int(11) NOT NULL DEFAULT 0,
  `address_id` int(11) NOT NULL DEFAULT 0,
  `price` float NOT NULL DEFAULT 0,
  `commission` float NOT NULL DEFAULT 0,
  `final_price` float NOT NULL DEFAULT 0,
  `units` int(11) NOT NULL DEFAULT 0,
  `tracking_url` text CHARACTER SET utf8 DEFAULT NULL,
  `tracking_id` varchar(50) CHARACTER SET utf8 NOT NULL DEFAULT '',
  `status` varchar(30) NOT NULL DEFAULT 'placed',
  `time` int(11) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`),
  KEY `user_id` (`user_id`),
  KEY `product_owner_id` (`product_owner_id`),
  KEY `product_id` (`product_id`),
  KEY `final_price` (`final_price`),
  KEY `status` (`status`),
  KEY `time` (`time`),
  KEY `hash_id` (`hash_id`),
  KEY `units` (`units`),
  KEY `address_id` (`address_id`),
  KEY `price` (`price`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- ---------------------------------------------------------
--
-- Table structure for table : `payments`
--
-- ---------------------------------------------------------

CREATE TABLE `payments` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL DEFAULT 0,
  `amount` float NOT NULL DEFAULT 0,
  `type` varchar(15) NOT NULL DEFAULT '',
  `date` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `pro_plan` varchar(100) DEFAULT '',
  `info` varchar(100) DEFAULT '0',
  `via` varchar(100) DEFAULT '',
  PRIMARY KEY (`id`),
  KEY `user_id` (`user_id`),
  KEY `amount` (`amount`),
  KEY `date` (`date`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `payments`
--

INSERT INTO payments VALUES
("1","2","50","WALLET","2022-07-18 13:42:22","0","Replenish My Balance","paystack"),
("2","2","1.5","TRACK","2022-07-18 13:43:02","0","H1RYrVAxOqAzLVM","wallet"),
("3","4","20","WALLET","2022-07-25 13:39:21","0","Replenish My Balance","paystack"),
("4","4","1.5","TRACK","2022-07-25 13:40:21","0","H1RYrVAxOqAzLVM","wallet"),
("5","9","30","WALLET","2022-08-24 15:44:51","0","Replenish My Balance","paystack"),
("6","1","19.99","TRACK","2022-09-12 12:12:19","0","H1RYrVAxOqAzLVM","wallet");

-- ---------------------------------------------------------
--
-- Table structure for table : `playlist_songs`
--
-- ---------------------------------------------------------

CREATE TABLE `playlist_songs` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `playlist_id` int(11) NOT NULL DEFAULT 0,
  `track_id` int(11) NOT NULL DEFAULT 0,
  `user_id` int(11) NOT NULL DEFAULT 0,
  `time` int(11) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`),
  KEY `playlist_id` (`playlist_id`),
  KEY `song_id` (`track_id`),
  KEY `user_id` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ---------------------------------------------------------
--
-- Table structure for table : `playlists`
--
-- ---------------------------------------------------------

CREATE TABLE `playlists` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(150) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `user_id` int(11) NOT NULL DEFAULT 0,
  `privacy` int(11) NOT NULL DEFAULT 0,
  `thumbnail` varchar(120) NOT NULL,
  `uid` varchar(12) NOT NULL DEFAULT '0',
  `time` int(11) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`),
  UNIQUE KEY `uid` (`uid`),
  KEY `user_id` (`user_id`),
  KEY `privacy` (`privacy`),
  KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ---------------------------------------------------------
--
-- Table structure for table : `point_system`
--
-- ---------------------------------------------------------

CREATE TABLE `point_system` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(11) unsigned NOT NULL DEFAULT 0,
  `action` varchar(150) NOT NULL DEFAULT '',
  `reword` int(10) unsigned NOT NULL DEFAULT 0,
  `is_add` int(10) unsigned NOT NULL DEFAULT 1,
  `obj` text DEFAULT NULL,
  `audio_id` varchar(22) NOT NULL DEFAULT '',
  `time` int(11) unsigned NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`),
  KEY `audio_id` (`audio_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `point_system`
--

INSERT INTO point_system VALUES
("1","1","upload","30","1","a:20:{s:8:\"audio_id\";s:15:\"H1RYrVAxOqAzLVM\";s:7:\"user_id\";i:1;s:5:\"title\";s:18:\"Liyangishonela.mp3\";s:11:\"description\";s:12:\"Testing Song\";s:6:\"lyrics\";s:0:\"\";s:4:\"tags\";s:4:\"test\";s:8:\"duration\";s:4:\"7:30\";s:14:\"audio_location\";s:87:\"upload/audio/2022/07/HL4kDs7kJuYNpQifNFPN_18_315e6a4fffb23eefc9512ecb6b5a2c7d_audio.mp3\";s:11:\"category_id\";s:1:\"1\";s:9:\"thumbnail\";s:88:\"upload/photos/2022/07/CBSzyiQiOXREMp9ErVzJ_18_2bd2111f188384b8bc34465adef4c53a_image.png\";s:4:\"time\";i:1658165464;s:10:\"registered\";s:6:\"2022/7\";s:4:\"size\";i:7206386;s:12:\"availability\";i:0;s:15:\"age_restriction\";i:0;s:5:\"price\";s:4:\"2.99\";s:9:\"spotlight\";i:1;s:6:\"ffmpeg\";i:0;s:15:\"allow_downloads\";s:1:\"1\";s:13:\"display_embed\";s:1:\"1\";}","H1RYrVAxOqAzLVM","1658165464"),
("2","2","listen_to_song","12","1","a:2:{s:13:\"track_user_id\";i:1;s:8:\"audio_id\";s:15:\"H1RYrVAxOqAzLVM\";}","H1RYrVAxOqAzLVM","1658166002"),
("3","2","purchase_track","81","1","a:2:{s:8:\"track_id\";i:1;s:8:\"audio_id\";i:1;}","1","1658166182"),
("4","2","update_profile_picture","5","1","a:1:{s:3:\"uid\";i:2;}","","1658166265");

-- ---------------------------------------------------------
--
-- Table structure for table : `products`
--
-- ---------------------------------------------------------

CREATE TABLE `products` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `hash_id` varchar(100) CHARACTER SET utf8 NOT NULL DEFAULT '',
  `user_id` int(11) NOT NULL DEFAULT 0,
  `title` varchar(200) CHARACTER SET utf8 NOT NULL DEFAULT '',
  `desc` text CHARACTER SET utf8 DEFAULT NULL,
  `tags` text CHARACTER SET utf8 DEFAULT NULL,
  `price` float NOT NULL DEFAULT 0,
  `related_song` int(11) NOT NULL DEFAULT 0,
  `cat_id` int(11) NOT NULL DEFAULT 0,
  `units` int(11) DEFAULT 0,
  `active` int(11) NOT NULL DEFAULT 0,
  `time` int(11) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`),
  KEY `user_id` (`user_id`),
  KEY `price` (`price`),
  KEY `related_song` (`related_song`),
  KEY `active` (`active`),
  KEY `units` (`units`),
  KEY `hash_id` (`hash_id`),
  KEY `cat_id` (`cat_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- ---------------------------------------------------------
--
-- Table structure for table : `products_category`
--
-- ---------------------------------------------------------

CREATE TABLE `products_category` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `lang_key` varchar(50) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `lang_key` (`lang_key`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `products_category`
--

INSERT INTO products_category VALUES
("2","s_clothes"),
("3","s_electronic"),
("1","s_other");

-- ---------------------------------------------------------
--
-- Table structure for table : `profile_fields`
--
-- ---------------------------------------------------------

CREATE TABLE `profile_fields` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `description` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `type` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `length` int(11) NOT NULL DEFAULT 0,
  `placement` varchar(32) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'profile',
  `registration_page` int(11) NOT NULL DEFAULT 0,
  `profile_page` int(11) NOT NULL DEFAULT 0,
  `select_type` varchar(32) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'none',
  `active` enum('0','1') COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `registration_page` (`registration_page`),
  KEY `active` (`active`),
  KEY `profile_page` (`profile_page`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ---------------------------------------------------------
--
-- Table structure for table : `purchases`
--
-- ---------------------------------------------------------

CREATE TABLE `purchases` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL DEFAULT 0,
  `event_id` int(11) NOT NULL DEFAULT 0,
  `order_hash_id` varchar(120) CHARACTER SET utf8 DEFAULT '',
  `track_id` int(11) NOT NULL DEFAULT 0,
  `track_owner_id` int(11) NOT NULL DEFAULT 0,
  `title` varchar(500) CHARACTER SET utf8 DEFAULT '',
  `final_price` float NOT NULL DEFAULT 0,
  `commission` float NOT NULL DEFAULT 0,
  `price` float NOT NULL DEFAULT 0,
  `timestamp` timestamp NOT NULL DEFAULT current_timestamp(),
  `time` int(11) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`),
  KEY `user_id` (`user_id`),
  KEY `track_id` (`track_id`),
  KEY `timestamp` (`timestamp`),
  KEY `time` (`time`),
  KEY `track_owner_id` (`track_owner_id`),
  KEY `final_price` (`final_price`),
  KEY `event_id` (`event_id`),
  KEY `order_hash_id` (`order_hash_id`),
  KEY `title` (`title`),
  KEY `price` (`price`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `purchases`
--

INSERT INTO purchases VALUES
("1","2","0","","1","1","Liyangishonela.mp3","1.5","50","2.99","2022-07-18 13:43:02","1658166182"),
("2","4","0","","1","1","Liyangishonela.mp3","1.5","50","2.99","2022-07-25 13:40:21","1658770821"),
("3","1","0","","1","1","Liyangishonela.mp3","19.99","100","19.99","2022-09-12 12:12:19","1662999139");

-- ---------------------------------------------------------
--
-- Table structure for table : `refund`
--
-- ---------------------------------------------------------

CREATE TABLE `refund` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL DEFAULT 0,
  `order_hash_id` varchar(100) CHARACTER SET utf8 NOT NULL DEFAULT '',
  `message` text CHARACTER SET utf8 DEFAULT NULL,
  `time` int(11) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`),
  KEY `user_id` (`user_id`),
  KEY `order_hash_id` (`order_hash_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- ---------------------------------------------------------
--
-- Table structure for table : `reports`
--
-- ---------------------------------------------------------

CREATE TABLE `reports` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `track_id` int(11) NOT NULL DEFAULT 0,
  `comment_id` int(11) NOT NULL DEFAULT 0,
  `user_id` int(11) NOT NULL DEFAULT 0,
  `description` text CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `time` int(11) NOT NULL DEFAULT 0,
  `seen` int(11) unsigned DEFAULT 0,
  `ignored` int(11) unsigned DEFAULT 0,
  `mode` varchar(11) CHARACTER SET utf8mb4 DEFAULT 'track',
  PRIMARY KEY (`id`),
  KEY `track_id` (`track_id`),
  KEY `comment_id` (`comment_id`),
  KEY `user_id` (`user_id`),
  KEY `time` (`time`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ---------------------------------------------------------
--
-- Table structure for table : `review`
--
-- ---------------------------------------------------------

CREATE TABLE `review` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL DEFAULT 0,
  `product_id` int(11) NOT NULL DEFAULT 0,
  `review` text CHARACTER SET utf8 DEFAULT NULL,
  `star` int(11) NOT NULL DEFAULT 1,
  `time` int(11) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`),
  KEY `user_id` (`user_id`),
  KEY `product_id` (`product_id`),
  KEY `star` (`star`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- ---------------------------------------------------------
--
-- Table structure for table : `reviews`
--
-- ---------------------------------------------------------

CREATE TABLE `reviews` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `track_id` int(11) NOT NULL DEFAULT 0,
  `user_id` int(11) NOT NULL DEFAULT 0,
  `description` text CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `rate` int(11) unsigned NOT NULL DEFAULT 0,
  `time` int(11) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`),
  KEY `track_id` (`track_id`),
  KEY `user_id` (`user_id`),
  KEY `rate` (`rate`),
  KEY `time` (`time`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ---------------------------------------------------------
--
-- Table structure for table : `searches`
--
-- ---------------------------------------------------------

CREATE TABLE `searches` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `keyword` varchar(250) NOT NULL DEFAULT '',
  `hits` int(11) unsigned NOT NULL DEFAULT 0,
  `created_at` int(11) unsigned NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `searches`
--

INSERT INTO searches VALUES
("1","liya","106","1658166300"),
("2","Langa","105","1658771229"),
("3","test","98","1659574876"),
("4","Zandile","77","1660146200");

-- ---------------------------------------------------------
--
-- Table structure for table : `sessions`
--
-- ---------------------------------------------------------

CREATE TABLE `sessions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `session_id` varchar(100) NOT NULL DEFAULT '',
  `user_id` int(11) NOT NULL DEFAULT 0,
  `platform` varchar(30) NOT NULL DEFAULT 'web',
  `time` int(11) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`),
  KEY `session_id` (`session_id`),
  KEY `user_id` (`user_id`),
  KEY `platform` (`platform`),
  KEY `time` (`time`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `sessions`
--

INSERT INTO sessions VALUES
("1","53cf10bf067db7d276840fe5006b14f1f682e94716581640601b80e3c38df2d01f452c9260c6a273fd","1","web","1658164060"),
("3","79304c8b9292b921ff93f2516f77195e619bac4e1658166978a043c5af55ecc727a3ffa362585fbba5","2","web","1658166978"),
("4","e34427ba95c4211eb302b8e2818c49641cf7337c1658770640759ab7b325054956a5e989910faf9f8f","4","web","1658770640"),
("5","974ca6e7b3870509235bd9de3bff69d759c786821659113166400b380eff03b1227d46b61fe01109ed","5","web","1659113166"),
("6","4d2652deafad1553c1e74341cb91aa5fc8751c72165916916188c2d8977c3895bea860d107e9a98676","7","web","1659169161"),
("7","9e151cf883c51a431e094f303104fe6e1a9dd0e0166014628321b9b4d69ae93aac17f403f71f8193d5","8","web","1660146283"),
("12","e702fed94d6b867b7dcf47b3836029e73ca399e616613701252702f733aa84ce654c78011b457c1269","9","web","1661370125"),
("13","47e2af96efa982163fbfdd040f08b5b52c799ea7166299895127132855a3dcbc286bdb1a652f53ffdb","2","web","1662998951"),
("14","77d0a3d41613d0d7e4ea93fd9e19ad627569811e16643806871b3bc018ca4f0c34b2c44c7408258ef9","1","web","1664380687"),
("15","2e01f03894c873d226caedde30260f8dec544a4716643840001c4e3aaecf8400fe376168aba16f7656","10","web","1664384000");

-- ---------------------------------------------------------
--
-- Table structure for table : `site_ads`
--
-- ---------------------------------------------------------

CREATE TABLE `site_ads` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `placement` varchar(50) NOT NULL DEFAULT '',
  `code` text DEFAULT NULL,
  `active` int(11) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`),
  KEY `placement` (`placement`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `site_ads`
--

INSERT INTO site_ads VALUES
("1","header","","0"),
("2","footer","","0"),
("3","side_bar","","0");

-- ---------------------------------------------------------
--
-- Table structure for table : `song_price`
--
-- ---------------------------------------------------------

CREATE TABLE `song_price` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `price` decimal(20,2) unsigned NOT NULL DEFAULT 0.00,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `song_price`
--

INSERT INTO song_price VALUES
("1","1.99"),
("2","2.99"),
("3","4.99"),
("4","9.99"),
("5","19.99");

-- ---------------------------------------------------------
--
-- Table structure for table : `songs`
--
-- ---------------------------------------------------------

CREATE TABLE `songs` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL DEFAULT 0,
  `audio_id` varchar(20) NOT NULL DEFAULT '',
  `title` varchar(150) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `description` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `tags` text CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `thumbnail` varchar(150) NOT NULL DEFAULT 'default',
  `availability` int(11) NOT NULL DEFAULT 0,
  `age_restriction` int(11) NOT NULL DEFAULT 0,
  `time` int(11) NOT NULL DEFAULT 0,
  `views` int(11) NOT NULL DEFAULT 0,
  `artist_id` int(11) NOT NULL DEFAULT 0,
  `album_id` int(11) NOT NULL DEFAULT 0,
  `price` float NOT NULL DEFAULT 0,
  `duration` varchar(12) NOT NULL DEFAULT '',
  `demo_duration` varchar(10) NOT NULL DEFAULT '0:0',
  `audio_location` varchar(120) NOT NULL DEFAULT '',
  `demo_track` varchar(200) NOT NULL DEFAULT '',
  `category_id` int(11) NOT NULL DEFAULT 0,
  `registered` varchar(12) NOT NULL DEFAULT '0000/00',
  `size` int(11) NOT NULL DEFAULT 0,
  `dark_wave` varchar(120) NOT NULL DEFAULT '',
  `light_wave` varchar(120) NOT NULL DEFAULT '',
  `shares` int(11) NOT NULL DEFAULT 0,
  `spotlight` int(11) NOT NULL DEFAULT 0,
  `ffmpeg` int(11) unsigned NOT NULL DEFAULT 1,
  `lyrics` text CHARACTER SET utf8mb4 DEFAULT NULL,
  `allow_downloads` int(11) unsigned NOT NULL DEFAULT 1,
  `display_embed` int(11) unsigned NOT NULL DEFAULT 1,
  `sort_order` int(11) unsigned DEFAULT 0,
  `src` varchar(50) CHARACTER SET utf8mb4 DEFAULT '',
  `itunes_token` varchar(150) CHARACTER SET utf8 NOT NULL DEFAULT '',
  `itunes_affiliate_url` varchar(300) CHARACTER SET utf8 NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  KEY `user_id` (`user_id`),
  KEY `title` (`title`),
  KEY `views` (`views`),
  KEY `artist_id` (`artist_id`),
  KEY `album_id` (`album_id`),
  KEY `price` (`price`),
  KEY `audio_id` (`audio_id`),
  KEY `registered` (`registered`),
  KEY `spotlight` (`spotlight`),
  KEY `category_id` (`category_id`),
  KEY `ffmpeg` (`ffmpeg`),
  KEY `age_restriction` (`age_restriction`),
  KEY `time` (`time`),
  KEY `itunes_token` (`itunes_token`),
  KEY `availability` (`availability`),
  FULLTEXT KEY `description` (`description`),
  FULLTEXT KEY `tags` (`tags`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `songs`
--

INSERT INTO songs VALUES
("1","1","H1RYrVAxOqAzLVM","Liyangishonela.mp3","Testing Song","test","upload/photos/2022/07/CBSzyiQiOXREMp9ErVzJ_18_2bd2111f188384b8bc34465adef4c53a_image.png","0","0","1658165464","0","0","0","19.99","7:30","0:0","upload/audio/2022/07/HL4kDs7kJuYNpQifNFPN_18_315e6a4fffb23eefc9512ecb6b5a2c7d_audio.mp3","","1","2022/7","7206386","upload/waves/2022/07/kdi68dfn38lLnhhPommrfrXcjRlwnABCrnn7CJzl_dark.png","upload/waves/2022/07/JfvpVb82k3M9SHEYBlnGiAgzRdFzrRYWIb4TaDAu_light.png","2","1","0","","1","1","0","","","");

-- ---------------------------------------------------------
--
-- Table structure for table : `story`
--
-- ---------------------------------------------------------

CREATE TABLE `story` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL DEFAULT 0,
  `image` text CHARACTER SET utf8 DEFAULT NULL,
  `audio` text CHARACTER SET utf8 DEFAULT NULL,
  `paid` int(11) NOT NULL DEFAULT 0,
  `url` text CHARACTER SET utf8 DEFAULT NULL,
  `active` int(11) NOT NULL DEFAULT 0,
  `time` int(11) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`),
  KEY `user_id` (`user_id`),
  KEY `paid` (`paid`),
  KEY `time` (`time`),
  KEY `active` (`active`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- ---------------------------------------------------------
--
-- Table structure for table : `story_seen`
--
-- ---------------------------------------------------------

CREATE TABLE `story_seen` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL DEFAULT 0,
  `fingerPrint` varchar(120) CHARACTER SET utf8 DEFAULT '0',
  `story_owner_id` int(11) NOT NULL DEFAULT 0,
  `story_id` int(11) NOT NULL DEFAULT 0,
  `paid` int(11) NOT NULL DEFAULT 0,
  `time` int(11) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`),
  KEY `user_id` (`user_id`),
  KEY `story_id` (`story_id`),
  KEY `paid` (`paid`),
  KEY `time` (`time`),
  KEY `story_owner_id` (`story_owner_id`),
  KEY `fingerPrint` (`fingerPrint`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- ---------------------------------------------------------
--
-- Table structure for table : `terms`
--
-- ---------------------------------------------------------

CREATE TABLE `terms` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `type` varchar(100) CHARACTER SET utf8mb4 NOT NULL DEFAULT '',
  `content` longtext CHARACTER SET utf8mb4 DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `type` (`type`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `terms`
--

INSERT INTO terms VALUES
("1","terms","&lt;h4&gt;1- Write your Terms Of Use here.&lt;/h4&gt; &lt;br&gt;                &lt;p&gt;Lorem ipsum dolor sit amet, consectetur adisdpisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis sdnostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse          cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.&lt;/p&gt; &lt;br&gt;    &lt;h4&gt;2- Random title&lt;/h4&gt; &lt;br&gt;                &lt;p&gt;Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.&lt;/p&gt;"),
("2","about","&lt;h4&gt;1- Write your About us here.&lt;/h4&gt; &lt;br&gt;                &lt;p&gt;Lorem ipsum dolor sit amet, consectetur adisdpisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis sdnostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse          cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.&lt;/p&gt; &lt;br&gt;                &lt;br&gt; &lt;br&gt;                &lt;h4&gt;2- Random title&lt;/h4&gt; &lt;br&gt;                &lt;p&gt;Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.&lt;/p&gt;"),
("3","privacy","&lt;h4&gt;1- Write your Privacy Policy here.&lt;/h4&gt; &lt;br&gt;                &lt;p&gt;Lorem ipsum dolor sit amet, consectetur adisdpisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis sdnostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse          cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.&lt;/p&gt; &lt;br&gt;                &lt;br&gt; &lt;br&gt;                &lt;h4&gt;2- Random title&lt;/h4&gt; &lt;br&gt;                &lt;p&gt;Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.&lt;/p&gt;"),
("4","dmca","&lt;h4&gt;1- Write your DMCA Notice.&lt;/h4&gt; &lt;br&gt;                &lt;p&gt;Lorem ipsum dolor sit amet, consectetur adisdpisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis sdnostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse          cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.&lt;/p&gt; &lt;br&gt;                &lt;br&gt; &lt;br&gt;                &lt;h4&gt;2- Random title&lt;/h4&gt; &lt;br&gt;                &lt;p&gt;Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.&lt;/p&gt;");

-- ---------------------------------------------------------
--
-- Table structure for table : `user_ads`
--
-- ---------------------------------------------------------

CREATE TABLE `user_ads` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(500) NOT NULL DEFAULT '',
  `results` int(11) NOT NULL DEFAULT 0,
  `spent` varchar(20) NOT NULL DEFAULT '0',
  `status` int(1) NOT NULL DEFAULT 1,
  `audience` text DEFAULT NULL,
  `category` varchar(50) NOT NULL DEFAULT '',
  `media` varchar(1000) NOT NULL DEFAULT '',
  `audio_media` varchar(1000) NOT NULL DEFAULT '',
  `url` varchar(3000) NOT NULL DEFAULT '',
  `user_id` int(11) NOT NULL DEFAULT 0,
  `placement` varchar(50) NOT NULL DEFAULT '',
  `posted` varchar(50) NOT NULL DEFAULT '0',
  `headline` varchar(1000) NOT NULL DEFAULT '',
  `description` varchar(1000) NOT NULL DEFAULT '',
  `location` varchar(1000) NOT NULL DEFAULT '',
  `type` varchar(50) NOT NULL DEFAULT '',
  `day_limit` varchar(11) NOT NULL DEFAULT '0',
  `day` varchar(50) NOT NULL DEFAULT '',
  `day_spend` varchar(11) NOT NULL DEFAULT '0',
  `ad_type` varchar(50) NOT NULL DEFAULT 'image',
  PRIMARY KEY (`id`),
  KEY `type` (`type`),
  KEY `location` (`location`(255)),
  KEY `placement` (`placement`),
  KEY `user_id` (`user_id`),
  KEY `category` (`category`),
  KEY `status` (`status`),
  KEY `day_limit` (`day_limit`),
  KEY `ad_type` (`ad_type`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ---------------------------------------------------------
--
-- Table structure for table : `user_fields`
--
-- ---------------------------------------------------------

CREATE TABLE `user_fields` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`),
  KEY `user_id` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ---------------------------------------------------------
--
-- Table structure for table : `user_interest`
--
-- ---------------------------------------------------------

CREATE TABLE `user_interest` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) unsigned NOT NULL DEFAULT 0,
  `category_id` int(11) unsigned NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`),
  KEY `user_id` (`user_id`),
  KEY `category_id` (`category_id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `user_interest`
--

INSERT INTO user_interest VALUES
("1","1","1"),
("2","2","1"),
("3","4","1"),
("4","5","1"),
("5","7","1"),
("6","8","1"),
("7","9","1"),
("8","10","1");

-- ---------------------------------------------------------
--
-- Table structure for table : `users`
--
-- ---------------------------------------------------------

CREATE TABLE `users` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(32) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `email` varchar(50) CHARACTER SET latin1 NOT NULL DEFAULT '',
  `ip_address` varchar(150) CHARACTER SET utf8 NOT NULL DEFAULT '',
  `password` varchar(150) CHARACTER SET latin1 NOT NULL DEFAULT '',
  `name` varchar(50) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `gender` varchar(10) CHARACTER SET latin1 NOT NULL DEFAULT 'male',
  `email_code` varchar(50) CHARACTER SET latin1 NOT NULL DEFAULT '',
  `language` varchar(22) CHARACTER SET latin1 NOT NULL DEFAULT 'english',
  `avatar` varchar(100) CHARACTER SET latin1 NOT NULL DEFAULT 'upload/photos/d-avatar.jpg',
  `cover` varchar(100) CHARACTER SET latin1 NOT NULL DEFAULT 'upload/photos/d-cover.jpg',
  `src` varchar(22) CHARACTER SET latin1 NOT NULL DEFAULT '',
  `country_id` int(11) NOT NULL DEFAULT 0,
  `age` int(11) NOT NULL DEFAULT 0,
  `about` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `google` varchar(50) CHARACTER SET latin1 NOT NULL DEFAULT '',
  `facebook` varchar(50) CHARACTER SET latin1 NOT NULL DEFAULT '',
  `twitter` varchar(50) CHARACTER SET latin1 NOT NULL DEFAULT '',
  `instagram` varchar(100) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `active` int(11) NOT NULL DEFAULT 0,
  `admin` int(11) NOT NULL DEFAULT 0,
  `verified` int(11) NOT NULL DEFAULT 0,
  `last_active` int(11) NOT NULL DEFAULT 0,
  `registered` varchar(40) CHARACTER SET latin1 NOT NULL DEFAULT '0000/00',
  `uploads` float NOT NULL DEFAULT 0,
  `wallet` varchar(200) CHARACTER SET utf8 NOT NULL DEFAULT '0',
  `balance` float unsigned NOT NULL DEFAULT 0,
  `website` varchar(100) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `artist` int(11) NOT NULL DEFAULT 0,
  `is_pro` int(11) NOT NULL DEFAULT 0,
  `pro_time` int(11) NOT NULL DEFAULT 0,
  `last_follow_id` int(11) unsigned NOT NULL DEFAULT 0,
  `ios_device_id` varchar(100) CHARACTER SET utf8mb4 NOT NULL DEFAULT '',
  `android_device_id` varchar(100) CHARACTER SET utf8mb4 NOT NULL DEFAULT '',
  `web_device_id` varchar(100) CHARACTER SET utf8mb4 NOT NULL DEFAULT '',
  `email_on_follow_user` int(11) unsigned DEFAULT 1,
  `email_on_liked_track` int(11) unsigned DEFAULT 1,
  `email_on_liked_comment` int(11) unsigned DEFAULT 1,
  `email_on_artist_status_changed` int(11) unsigned DEFAULT 1,
  `email_on_receipt_status_changed` int(11) unsigned DEFAULT 1,
  `email_on_new_track` int(11) unsigned DEFAULT 1,
  `email_on_reviewed_track` int(11) unsigned DEFAULT 1,
  `two_factor` int(11) unsigned NOT NULL DEFAULT 0,
  `new_email` varchar(255) CHARACTER SET utf8mb4 NOT NULL DEFAULT '',
  `two_factor_verified` int(11) unsigned NOT NULL DEFAULT 0,
  `new_phone` varchar(32) CHARACTER SET utf8mb4 NOT NULL DEFAULT '',
  `phone_number` varchar(32) CHARACTER SET utf8mb4 NOT NULL DEFAULT '',
  `last_login_data` text CHARACTER SET utf8mb4 DEFAULT NULL,
  `referrer` int(11) NOT NULL DEFAULT 0,
  `ref_user_id` int(11) NOT NULL DEFAULT 0,
  `upload_import` int(11) unsigned DEFAULT 1,
  `paypal_email` varchar(100) CHARACTER SET utf8 NOT NULL DEFAULT '',
  `info_file` text CHARACTER SET utf8 DEFAULT NULL,
  `email_on_comment_replay_mention` int(11) unsigned NOT NULL DEFAULT 0,
  `email_on_comment_mention` int(11) unsigned NOT NULL DEFAULT 0,
  `time_code_sent` int(11) NOT NULL DEFAULT 0,
  `time` int(20) NOT NULL DEFAULT 0,
  `paystack_ref` varchar(50) CHARACTER SET utf8 NOT NULL DEFAULT '',
  `ConversationId` int(20) NOT NULL DEFAULT 0,
  `securionpay_key` int(30) NOT NULL DEFAULT 0,
  `cashfree_key` int(30) NOT NULL DEFAULT 0,
  `yoomoney_hash` varchar(50) CHARACTER SET utf8 NOT NULL DEFAULT '',
  `fortumo_hash` text CHARACTER SET utf8 DEFAULT NULL,
  `aamarpay_tran_id` varchar(50) CHARACTER SET utf8 NOT NULL DEFAULT '',
  `ngenius_ref` varchar(50) CHARACTER SET utf8 NOT NULL DEFAULT '',
  `coinbase_hash` varchar(20) CHARACTER SET utf8 NOT NULL DEFAULT '',
  `coinbase_code` varchar(20) CHARACTER SET utf8 NOT NULL DEFAULT '',
  `coinpayments_txn_id` varchar(100) CHARACTER SET utf8 NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  KEY `username` (`username`),
  KEY `email` (`email`),
  KEY `password` (`password`),
  KEY `last_active` (`last_active`),
  KEY `admin` (`admin`),
  KEY `active` (`active`),
  KEY `registered` (`registered`),
  KEY `wallet` (`wallet`),
  KEY `balance` (`balance`),
  KEY `pro_time` (`pro_time`),
  KEY `country_id` (`country_id`),
  KEY `verified` (`verified`),
  KEY `artist` (`artist`),
  KEY `is_pro` (`is_pro`),
  KEY `time` (`time`),
  KEY `time_code_sent` (`time_code_sent`),
  KEY `paystack_ref` (`paystack_ref`),
  KEY `ConversationId` (`ConversationId`),
  KEY `securionpay_key` (`securionpay_key`),
  KEY `cashfree_key` (`cashfree_key`),
  KEY `yoomoney_hash` (`yoomoney_hash`),
  KEY `aamarpay_tran_id` (`aamarpay_tran_id`),
  KEY `ngenius_ref` (`ngenius_ref`),
  KEY `coinbase_hash` (`coinbase_hash`),
  KEY `coinbase_code` (`coinbase_code`),
  KEY `coinpayments_txn_id` (`coinpayments_txn_id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci ROW_FORMAT=DYNAMIC;

--
-- Dumping data for table `users`
--

INSERT INTO users VALUES
("1","blacknwhite6admin","info@blacknwhite6.com","","$2y$10$UF5qH6eimS2L9oUWUhGsA.5i3MA0G4FBAeOygA2PmbakVG3a8xba.","","male","","english","upload/photos/2022/09/6GuOxhte775TZKhkcvqa_28_dc19ac02b8424adbf48f8f5b556d5417_image.png","upload/photos/d-cover.jpg","","0","0","","","","","","1","1","1","1658164016","2022/7","0","80.01","0","","1","0","0","0","","","","1","1","1","1","1","1","1","0","","0","","","","0","0","1","","","0","0","0","0","","0","0","0","","","","","","",""),
("2","amahlathini","ayabulelamahlathini@gmail.com","163.116.180.51","$2y$10$vObVCuzB4mkPvdbrHvi8x.37atNUFE9pHOA0UAh7M.4XmT54eK4Om","Ayabulela","male","7f46bb91013dda8185657bc86235fbad55638924","english","upload/photos/2022/07/KpkAaK4uvBXdVYbGbfVk_18_c78e01b1abd0c18488399933d9589e4e_image.png","upload/photos/d-cover.jpg","","0","0","","","","","","1","0","0","1658165997","2022/7","0","47.108000000000004","0","","0","0","0","0","","","","1","1","1","1","1","1","1","0","","0","","","","0","0","1","","","0","0","0","1658165997","","0","0","0","","","","","","",""),
("3","Tester","gg@gg.gg","163.116.180.49","$2y$10$Z1AwVuLqpaEOQ72jcDkglO6./KzVtqNgE5pysZ/J6eIWJM98NrRvG","King","male","019ef1c5925d7fba81132f5af8ad12f278977b71","english","upload/photos/d-avatar.jpg","upload/photos/d-cover.jpg","","0","0","","","","","","0","0","0","1658770522","2022/7","0","0","0","","0","0","0","0","","","","1","1","1","1","1","1","1","0","","0","","","","0","0","1","","","0","0","0","1658770522","","0","0","0","","","","","","",""),
("4","testing","forappsmahlathini@gmail.com","163.116.180.49","$2y$10$BFG6M7GjRHMkLgWm74T6A.h3jjdL/IbBn2Fy2KHJ2VxXeOwwxSHD2","King Tester","male","f1bc965c623b8bc4cf3cb6d01af32312ff75f524","english","upload/photos/d-avatar.jpg","upload/photos/d-cover.jpg","","0","0","","","","","","1","0","0","1658770562","2022/7","0","17.009999999999998","0","","0","0","0","0","","","","1","1","1","1","1","1","1","0","","0","","","","0","0","1","","","0","0","0","1658770562","","0","0","0","","","","","","",""),
("5","Sikhona","sikhoyaso@gmail.com","197.229.6.152","$2y$10$OE9BT1DS/XaUHiRwz7In7eOw8S9UfMId/ZHOXWTi.NB8zux2/6mcm","Sikho Yaso","male","96a30710e97e6464c5c2f3827034f63c118bb43f","english","upload/photos/d-avatar.jpg","upload/photos/d-cover.jpg","","0","0","","","","","","1","0","0","1659113136","2022/7","0","0","0","","0","0","0","0","","","","1","1","1","1","1","1","1","0","","0","","","","0","0","1","","","0","0","0","1659113136","","0","0","0","","","","","","",""),
("6","Madikizela","madikizeladineo@gmail.com","155.238.5.1","$2y$10$jx6c9X7Wd7WkjKK2I2BPwe7WGq3EfEmujvCgnZSbWieh18oI2iDCm","Dineo","male","cfdff16a7360abc43ca561e8c176332abf0745d6","english","upload/photos/d-avatar.jpg","upload/photos/d-cover.jpg","","0","0","","","","","","0","0","0","1659131893","2022/7","0","0","0","","0","0","0","0","","","","1","1","1","1","1","1","1","0","","0","","","","0","0","1","","","0","0","0","1659131893","","0","0","0","","","","","","",""),
("7","Reitz","kingzaidi2212@gmail.com","154.117.137.106","$2y$10$cbH7fRDr0I3m1Maj56j/KevenXieIlvf7a7rpmw3VLuKi0pBO89pK","Reitumetse","male","ba034b243416a4101cf819aca47466fdb03597bc","english","upload/photos/d-avatar.jpg","upload/photos/d-cover.jpg","","0","0","","","","","","1","0","0","1659169144","2022/7","0","0","0","","0","0","0","0","","","","1","1","1","1","1","1","1","0","","0","","","","0","0","1","","","0","0","0","1659169144","","0","0","0","","","","","","",""),
("8","Somhaya","murayimay6@gmail.com","155.238.5.1","$2y$10$pvT/8K6gHo4cxOK//9Z8mOylczw4rhWZqSuFoiRfiZAfC7Ai3L5ie","MUSA6","male","f12854c6e6c6402b43b425e6d234197ebf18da04","english","upload/photos/2022/08/yUX8y9J5LbF17Sutyvmo_10_973ecd1b084c2ec690eedee3b026a545_image.jpg","upload/photos/2022/08/cg8c4pW4DwDZSe5G3Ff5_10_05392a2fd808ff439515a5a63cff1778_image.jpg","","197","23","Love.","","","","","1","0","0","1660146249","2022/8","0","0.00","0","","0","0","0","0","","","","1","1","1","1","1","1","1","0","","0","","","","0","0","1","","","1","1","0","1660146249","","0","0","0","","","","","","",""),
("9","musag","75xyz903@gmail.com","163.116.180.49","$2y$10$lnx8JGdEJpfIe4VIvRH61eeCJ.TFH2qjnGtADvbRGaXPFWpqeu51W","Musa G","male","4746b6613b7117c2a069230d60c2ccac94efb7ee","english","upload/photos/d-avatar.jpg","upload/photos/d-cover.jpg","","0","0","","","","","","1","0","0","1661369883","2022/8","0","30","0","","0","0","0","0","","","","1","1","1","1","1","1","1","0","","0","","","","0","0","1","","","0","0","0","1661369883","","0","0","0","","","","","","",""),
("10","musicadmin","musicadmin@blacknwhite6.com","163.116.180.51","$2y$10$WOER4Po/wknp2XR2.QPQEebp4Zj3sq3Ob3MSQJIL2Khxh9fSWGQxa","Music","male","be9bfa11a26e72476f972d1d22934461fb9215bc","english","upload/photos/d-avatar.jpg","upload/photos/d-cover.jpg","","0","0","","","","","","1","1","1","1664383955","2022/9","0","0","0","","0","0","0","0","","","","1","1","1","1","1","1","1","0","","0","","","","0","0","1","","","0","0","0","1664383955","","0","0","0","","","","","","","");

-- ---------------------------------------------------------
--
-- Table structure for table : `views`
--
-- ---------------------------------------------------------

CREATE TABLE `views` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `track_id` int(11) NOT NULL DEFAULT 0,
  `album_id` int(11) NOT NULL DEFAULT 0,
  `fingerprint` varchar(50) NOT NULL DEFAULT '',
  `user_id` int(11) NOT NULL DEFAULT 0,
  `time` int(11) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`),
  KEY `track_id` (`track_id`),
  KEY `fingerprint` (`fingerprint`),
  KEY `user_id` (`user_id`),
  KEY `album_id` (`album_id`)
) ENGINE=InnoDB AUTO_INCREMENT=44 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `views`
--

INSERT INTO views VALUES
("1","1","0","d7b4981845931f9c4064b73261c5f131b87f152e","0","1658165745"),
("2","1","0","5f883fc2b0613b8d6b2f665f74c0e5052a63f190","1","1658673710"),
("3","1","0","91cabc49c483c34b4605243619211956690a2c1b","0","1658165916"),
("5","1","0","e808dc5d168fe49424c9266d9997ac9c0a708eab","0","1658770802"),
("7","1","0","ae67bf5b1a680a3f4ca645df16a5d986639cae15","0","1658771096"),
("8","1","0","865c43091ef9b79a330161b9f21ab0bea6f20eb5","0","1658771105"),
("9","1","0","d48caa1979681dfcf723427c7629f642c3b58359","0","1658771106"),
("10","1","0","cf768bc33f60db677ce6a6eb29cee6b1a9ffe96f","0","1658774075"),
("11","1","0","1a6215903a67c617d4c7c9c1de24a2097601d042","0","1658774207"),
("12","1","0","21b91b441b6363fc41111066512c8b06a91b5b89","0","1658774458"),
("13","1","0","13c39d6a2cd6a110d21a063a3b176de0359c6805","0","1658811776"),
("14","1","0","bb1bfb45dcb45b3fcb6e4458b14fdcad7cb1cf20","0","1658811779"),
("15","1","0","3a8cec4a1d9ee02a6049068f0fed536b800fcfbc","0","1658820096"),
("16","1","0","68afdb242fb33680dc244dd36147851a468d95d1","0","1659077271"),
("17","1","0","87fcf08670090cd4f9a8786824672446f6309c41","0","1659077273"),
("18","1","0","d68feacccf02371f7a59677eecaded871f6256c5","0","1659077292"),
("19","1","0","8baa199d8e9a35aa87bbb1ae08aecec1b099971c","0","1659077297"),
("21","1","0","93a18970537b793c05eb2a4ff2a97e2ae4c7e5ce","7","1659169241"),
("22","1","0","3381ee019369dd2059f3b0fd4a29506d361ec04f","0","1659177305"),
("23","1","0","4e3b7baba71855f675cd9c479cbb0b4f60becec3","0","1659177307"),
("36","1","0","dff58833e15d415618741c3af004bf00abff2fca","8","1661369748"),
("38","1","0","f436588b82bcaf0e5c72c1b9b5908d6e33b1b918","2","1661369782"),
("39","1","0","d80b75f890bf4a25381a67c5d92f84eb1decb392","0","1663432365"),
("40","1","0","9c4dc8cb0a163f7a7c69f6be998779f264c6125d","0","1663432367"),
("41","1","0","fa675666e1bbe7ea1e31c9f7228d7b36ab2a42d4","0","1663691020"),
("42","1","0","87a7fee9858e387c757d6161b9d2239f75520a36","0","1663691023"),
("43","1","0","3cbfca145158f1750f830a580a9f7e1834e7c5ce","0","1664382866");

-- ---------------------------------------------------------
--
-- Table structure for table : `withdrawal_requests`
--
-- ---------------------------------------------------------

CREATE TABLE `withdrawal_requests` (
  `id` int(20) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL DEFAULT 0,
  `email` varchar(200) NOT NULL DEFAULT '',
  `amount` varchar(100) NOT NULL DEFAULT '0',
  `currency` varchar(20) NOT NULL DEFAULT '',
  `requested` varchar(100) NOT NULL DEFAULT '',
  `status` int(5) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `withdrawal_requests`
--

INSERT INTO withdrawal_requests VALUES
("1","1","info@blacknwhite6.com","2.98","ZAR","1664374025","1");

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;