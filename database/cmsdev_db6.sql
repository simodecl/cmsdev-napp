-- phpMyAdmin SQL Dump
-- version 4.0.10.19
-- https://www.phpmyadmin.net
--
-- Machine: localhost
-- Genereertijd: 07 jan 2019 om 18:45
-- Serverversie: 10.0.36-MariaDB-cll-lve
-- PHP-versie: 5.6.38

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Databank: `cmsdev_db6`
--

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `wp_bp_activity`
--

CREATE TABLE IF NOT EXISTS `wp_bp_activity` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) NOT NULL,
  `component` varchar(75) COLLATE utf8mb4_unicode_ci NOT NULL,
  `type` varchar(75) COLLATE utf8mb4_unicode_ci NOT NULL,
  `action` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `content` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `primary_link` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `item_id` bigint(20) NOT NULL,
  `secondary_item_id` bigint(20) DEFAULT NULL,
  `date_recorded` datetime NOT NULL,
  `hide_sitewide` tinyint(1) DEFAULT '0',
  `mptt_left` int(11) NOT NULL DEFAULT '0',
  `mptt_right` int(11) NOT NULL DEFAULT '0',
  `is_spam` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `date_recorded` (`date_recorded`),
  KEY `user_id` (`user_id`),
  KEY `item_id` (`item_id`),
  KEY `secondary_item_id` (`secondary_item_id`),
  KEY `component` (`component`),
  KEY `type` (`type`),
  KEY `mptt_left` (`mptt_left`),
  KEY `mptt_right` (`mptt_right`),
  KEY `hide_sitewide` (`hide_sitewide`),
  KEY `is_spam` (`is_spam`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `wp_bp_activity_meta`
--

CREATE TABLE IF NOT EXISTS `wp_bp_activity_meta` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `activity_id` bigint(20) NOT NULL,
  `meta_key` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `meta_value` longtext COLLATE utf8mb4_unicode_ci,
  PRIMARY KEY (`id`),
  KEY `activity_id` (`activity_id`),
  KEY `meta_key` (`meta_key`(191))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `wp_bp_notifications`
--

CREATE TABLE IF NOT EXISTS `wp_bp_notifications` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) NOT NULL,
  `item_id` bigint(20) NOT NULL,
  `secondary_item_id` bigint(20) DEFAULT NULL,
  `component_name` varchar(75) COLLATE utf8mb4_unicode_ci NOT NULL,
  `component_action` varchar(75) COLLATE utf8mb4_unicode_ci NOT NULL,
  `date_notified` datetime NOT NULL,
  `is_new` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `item_id` (`item_id`),
  KEY `secondary_item_id` (`secondary_item_id`),
  KEY `user_id` (`user_id`),
  KEY `is_new` (`is_new`),
  KEY `component_name` (`component_name`),
  KEY `component_action` (`component_action`),
  KEY `useritem` (`user_id`,`is_new`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `wp_bp_notifications_meta`
--

CREATE TABLE IF NOT EXISTS `wp_bp_notifications_meta` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `notification_id` bigint(20) NOT NULL,
  `meta_key` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `meta_value` longtext COLLATE utf8mb4_unicode_ci,
  PRIMARY KEY (`id`),
  KEY `notification_id` (`notification_id`),
  KEY `meta_key` (`meta_key`(191))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `wp_bp_xprofile_data`
--

CREATE TABLE IF NOT EXISTS `wp_bp_xprofile_data` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `field_id` bigint(20) unsigned NOT NULL,
  `user_id` bigint(20) unsigned NOT NULL,
  `value` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `last_updated` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `field_id` (`field_id`),
  KEY `user_id` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `wp_bp_xprofile_fields`
--

CREATE TABLE IF NOT EXISTS `wp_bp_xprofile_fields` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `group_id` bigint(20) unsigned NOT NULL,
  `parent_id` bigint(20) unsigned NOT NULL,
  `type` varchar(150) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(150) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `is_required` tinyint(1) NOT NULL DEFAULT '0',
  `is_default_option` tinyint(1) NOT NULL DEFAULT '0',
  `field_order` bigint(20) NOT NULL DEFAULT '0',
  `option_order` bigint(20) NOT NULL DEFAULT '0',
  `order_by` varchar(15) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `can_delete` tinyint(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`),
  KEY `group_id` (`group_id`),
  KEY `parent_id` (`parent_id`),
  KEY `field_order` (`field_order`),
  KEY `can_delete` (`can_delete`),
  KEY `is_required` (`is_required`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci AUTO_INCREMENT=2 ;

--
-- Gegevens worden uitgevoerd voor tabel `wp_bp_xprofile_fields`
--

INSERT INTO `wp_bp_xprofile_fields` (`id`, `group_id`, `parent_id`, `type`, `name`, `description`, `is_required`, `is_default_option`, `field_order`, `option_order`, `order_by`, `can_delete`) VALUES
(1, 1, 0, 'textbox', 'Name', '', 1, 0, 0, 0, '', 0);

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `wp_bp_xprofile_groups`
--

CREATE TABLE IF NOT EXISTS `wp_bp_xprofile_groups` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(150) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` mediumtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `group_order` bigint(20) NOT NULL DEFAULT '0',
  `can_delete` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `can_delete` (`can_delete`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci AUTO_INCREMENT=2 ;

--
-- Gegevens worden uitgevoerd voor tabel `wp_bp_xprofile_groups`
--

INSERT INTO `wp_bp_xprofile_groups` (`id`, `name`, `description`, `group_order`, `can_delete`) VALUES
(1, 'Base', '', 0, 0);

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `wp_bp_xprofile_meta`
--

CREATE TABLE IF NOT EXISTS `wp_bp_xprofile_meta` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `object_id` bigint(20) NOT NULL,
  `object_type` varchar(150) COLLATE utf8mb4_unicode_ci NOT NULL,
  `meta_key` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `meta_value` longtext COLLATE utf8mb4_unicode_ci,
  PRIMARY KEY (`id`),
  KEY `object_id` (`object_id`),
  KEY `meta_key` (`meta_key`(191))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `wp_commentmeta`
--

CREATE TABLE IF NOT EXISTS `wp_commentmeta` (
  `meta_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `comment_id` bigint(20) unsigned NOT NULL DEFAULT '0',
  `meta_key` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `meta_value` longtext COLLATE utf8mb4_unicode_ci,
  PRIMARY KEY (`meta_id`),
  KEY `comment_id` (`comment_id`),
  KEY `meta_key` (`meta_key`(191))
) ENGINE=InnoDB  DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci AUTO_INCREMENT=23 ;

--
-- Gegevens worden uitgevoerd voor tabel `wp_commentmeta`
--

INSERT INTO `wp_commentmeta` (`meta_id`, `comment_id`, `meta_key`, `meta_value`) VALUES
(21, 6, '_wp_trash_meta_status', '1'),
(22, 6, '_wp_trash_meta_time', '1545832484');

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `wp_comments`
--

CREATE TABLE IF NOT EXISTS `wp_comments` (
  `comment_ID` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `comment_post_ID` bigint(20) unsigned NOT NULL DEFAULT '0',
  `comment_author` tinytext COLLATE utf8mb4_unicode_ci NOT NULL,
  `comment_author_email` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `comment_author_url` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `comment_author_IP` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `comment_date` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `comment_date_gmt` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `comment_content` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `comment_karma` int(11) NOT NULL DEFAULT '0',
  `comment_approved` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '1',
  `comment_agent` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `comment_type` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `comment_parent` bigint(20) unsigned NOT NULL DEFAULT '0',
  `user_id` bigint(20) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`comment_ID`),
  KEY `comment_post_ID` (`comment_post_ID`),
  KEY `comment_approved_date_gmt` (`comment_approved`,`comment_date_gmt`),
  KEY `comment_date_gmt` (`comment_date_gmt`),
  KEY `comment_parent` (`comment_parent`),
  KEY `comment_author_email` (`comment_author_email`(10))
) ENGINE=InnoDB  DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci AUTO_INCREMENT=21 ;

--
-- Gegevens worden uitgevoerd voor tabel `wp_comments`
--

INSERT INTO `wp_comments` (`comment_ID`, `comment_post_ID`, `comment_author`, `comment_author_email`, `comment_author_url`, `comment_author_IP`, `comment_date`, `comment_date_gmt`, `comment_content`, `comment_karma`, `comment_approved`, `comment_agent`, `comment_type`, `comment_parent`, `user_id`) VALUES
(6, 50, 'Simon Decloedt', 'simodecl@student.arteveldehs.be', '', '178.117.98.141', '2018-12-24 10:07:59', '2018-12-24 10:07:59', 'Test comment', 0, 'trash', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/71.0.3578.98 Safari/537.36', '', 0, 1),
(7, 50, 'Simon Decloedt', 'simodecl@student.arteveldehs.be', '', '178.117.98.141', '2018-12-24 12:27:54', '2018-12-24 12:27:54', 'First comment!', 0, '1', 'PostmanRuntime/7.4.0', '', 0, 1),
(8, 50, 'Simon Decloedt', 'simodecl@student.arteveldehs.be', '', '178.117.98.141', '2018-12-24 13:35:02', '2018-12-24 13:35:02', 'Reactie op First comment!', 0, '1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/71.0.3578.98 Safari/537.36', '', 7, 1),
(9, 50, 'Simon Decloedt', 'simodecl@student.arteveldehs.be', '', '178.117.98.141', '2018-12-24 14:08:23', '2018-12-24 14:08:23', 'Another comment', 0, '1', 'PostmanRuntime/7.4.0', '', 0, 1),
(10, 50, 'Simon Decloedt', 'simodecl@student.arteveldehs.be', '', '178.117.98.141', '2018-12-24 15:52:00', '2018-12-24 15:52:00', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.', 0, '1', 'PostmanRuntime/7.4.0', '', 0, 1),
(11, 50, 'Simon Decloedt', 'simodecl@student.arteveldehs.be', '', '178.117.98.141', '2018-12-25 13:40:49', '2018-12-25 13:40:49', 'Angular comment', 0, '1', 'Mozilla/5.0 (Linux; Android 6.0; Nexus 5 Build/MRA58N) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/71.0.3578.98 Mobile Safari/537.36', '', 0, 1),
(18, 50, 'Simon Decloedt', 'simodecl@student.arteveldehs.be', '', '178.117.98.141', '2019-01-04 20:21:08', '2019-01-04 20:21:08', 'cordova comment', 0, '1', 'Mozilla/5.0 (Linux; Android 7.0; ZTE BLADE V0800 Build/NRD90M; wv) AppleWebKit/537.36 (KHTML, like Gecko) Version/4.0 Chrome/71.0.3578.99 Mobile Safari/537.36', '', 0, 1),
(19, 50, 'Simon Decloedt', 'simodecl@student.arteveldehs.be', '', '178.118.48.31', '2019-01-04 22:17:52', '2019-01-04 22:17:52', 'Thank you Kanye, very cool!', 0, '1', 'Mozilla/5.0 (Linux; Android 9; Mi A1 Build/PKQ1.180917.001; wv) AppleWebKit/537.36 (KHTML, like Gecko) Version/4.0 Chrome/71.0.3578.99 Mobile Safari/537.36', '', 0, 1),
(20, 83, 'Manaus Transez', 'manatran@test.com', '', '178.117.98.141', '2019-01-06 15:30:25', '2019-01-06 15:30:25', 'Tof!', 0, '1', 'Mozilla/5.0 (Linux; Android 5.0; SM-G900P Build/LRX21T) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/71.0.3578.98 Mobile Safari/537.36', '', 0, 29);

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `wp_links`
--

CREATE TABLE IF NOT EXISTS `wp_links` (
  `link_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `link_url` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `link_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `link_image` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `link_target` varchar(25) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `link_description` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `link_visible` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'Y',
  `link_owner` bigint(20) unsigned NOT NULL DEFAULT '1',
  `link_rating` int(11) NOT NULL DEFAULT '0',
  `link_updated` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `link_rel` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `link_notes` mediumtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `link_rss` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  PRIMARY KEY (`link_id`),
  KEY `link_visible` (`link_visible`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `wp_options`
--

CREATE TABLE IF NOT EXISTS `wp_options` (
  `option_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `option_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `option_value` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `autoload` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'yes',
  PRIMARY KEY (`option_id`),
  UNIQUE KEY `option_name` (`option_name`),
  KEY `anta_autoload` (`autoload`) USING BTREE
) ENGINE=InnoDB  DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci AUTO_INCREMENT=1528 ;

--
-- Gegevens worden uitgevoerd voor tabel `wp_options`
--

INSERT INTO `wp_options` (`option_id`, `option_name`, `option_value`, `autoload`) VALUES
(1, 'siteurl', 'https://simodecl.cmsdevelopment.be', 'yes'),
(2, 'home', 'https://simodecl.cmsdevelopment.be', 'yes'),
(3, 'blogname', 'simodecl', 'yes'),
(4, 'blogdescription', 'En nog een WordPress website', 'yes'),
(5, 'users_can_register', '0', 'yes'),
(6, 'admin_email', 'simodecl@student.arteveldehs.be', 'yes'),
(7, 'start_of_week', '1', 'yes'),
(8, 'use_balanceTags', '0', 'yes'),
(9, 'use_smilies', '1', 'yes'),
(10, 'require_name_email', '', 'yes'),
(11, 'comments_notify', '1', 'yes'),
(12, 'posts_per_rss', '10', 'yes'),
(13, 'rss_use_excerpt', '0', 'yes'),
(14, 'mailserver_url', 'mail.example.com', 'yes'),
(15, 'mailserver_login', 'login@example.com', 'yes'),
(16, 'mailserver_pass', 'password', 'yes'),
(17, 'mailserver_port', '110', 'yes'),
(18, 'default_category', '1', 'yes'),
(19, 'default_comment_status', 'open', 'yes'),
(20, 'default_ping_status', 'open', 'yes'),
(21, 'default_pingback_flag', '1', 'yes'),
(22, 'posts_per_page', '10', 'yes'),
(23, 'date_format', 'j F Y', 'yes'),
(24, 'time_format', 'g:i a', 'yes'),
(25, 'links_updated_date_format', 'j F Y H:i', 'yes'),
(26, 'comment_moderation', '', 'yes'),
(27, 'moderation_notify', '1', 'yes'),
(28, 'permalink_structure', '/%year%/%monthnum%/%day%/%postname%/', 'yes'),
(29, 'rewrite_rules', 'a:141:{s:11:"^wp-json/?$";s:22:"index.php?rest_route=/";s:14:"^wp-json/(.*)?";s:33:"index.php?rest_route=/$matches[1]";s:21:"^index.php/wp-json/?$";s:22:"index.php?rest_route=/";s:24:"^index.php/wp-json/(.*)?";s:33:"index.php?rest_route=/$matches[1]";s:9:"selfie/?$";s:26:"index.php?post_type=selfie";s:39:"selfie/feed/(feed|rdf|rss|rss2|atom)/?$";s:43:"index.php?post_type=selfie&feed=$matches[1]";s:34:"selfie/(feed|rdf|rss|rss2|atom)/?$";s:43:"index.php?post_type=selfie&feed=$matches[1]";s:26:"selfie/page/([0-9]{1,})/?$";s:44:"index.php?post_type=selfie&paged=$matches[1]";s:16:"sleeptracking/?$";s:33:"index.php?post_type=sleeptracking";s:46:"sleeptracking/feed/(feed|rdf|rss|rss2|atom)/?$";s:50:"index.php?post_type=sleeptracking&feed=$matches[1]";s:41:"sleeptracking/(feed|rdf|rss|rss2|atom)/?$";s:50:"index.php?post_type=sleeptracking&feed=$matches[1]";s:33:"sleeptracking/page/([0-9]{1,})/?$";s:51:"index.php?post_type=sleeptracking&paged=$matches[1]";s:47:"category/(.+?)/feed/(feed|rdf|rss|rss2|atom)/?$";s:52:"index.php?category_name=$matches[1]&feed=$matches[2]";s:42:"category/(.+?)/(feed|rdf|rss|rss2|atom)/?$";s:52:"index.php?category_name=$matches[1]&feed=$matches[2]";s:23:"category/(.+?)/embed/?$";s:46:"index.php?category_name=$matches[1]&embed=true";s:35:"category/(.+?)/page/?([0-9]{1,})/?$";s:53:"index.php?category_name=$matches[1]&paged=$matches[2]";s:17:"category/(.+?)/?$";s:35:"index.php?category_name=$matches[1]";s:44:"tag/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$";s:42:"index.php?tag=$matches[1]&feed=$matches[2]";s:39:"tag/([^/]+)/(feed|rdf|rss|rss2|atom)/?$";s:42:"index.php?tag=$matches[1]&feed=$matches[2]";s:20:"tag/([^/]+)/embed/?$";s:36:"index.php?tag=$matches[1]&embed=true";s:32:"tag/([^/]+)/page/?([0-9]{1,})/?$";s:43:"index.php?tag=$matches[1]&paged=$matches[2]";s:14:"tag/([^/]+)/?$";s:25:"index.php?tag=$matches[1]";s:45:"type/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$";s:50:"index.php?post_format=$matches[1]&feed=$matches[2]";s:40:"type/([^/]+)/(feed|rdf|rss|rss2|atom)/?$";s:50:"index.php?post_format=$matches[1]&feed=$matches[2]";s:21:"type/([^/]+)/embed/?$";s:44:"index.php?post_format=$matches[1]&embed=true";s:33:"type/([^/]+)/page/?([0-9]{1,})/?$";s:51:"index.php?post_format=$matches[1]&paged=$matches[2]";s:15:"type/([^/]+)/?$";s:33:"index.php?post_format=$matches[1]";s:34:"selfie/[^/]+/attachment/([^/]+)/?$";s:32:"index.php?attachment=$matches[1]";s:44:"selfie/[^/]+/attachment/([^/]+)/trackback/?$";s:37:"index.php?attachment=$matches[1]&tb=1";s:64:"selfie/[^/]+/attachment/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$";s:49:"index.php?attachment=$matches[1]&feed=$matches[2]";s:59:"selfie/[^/]+/attachment/([^/]+)/(feed|rdf|rss|rss2|atom)/?$";s:49:"index.php?attachment=$matches[1]&feed=$matches[2]";s:59:"selfie/[^/]+/attachment/([^/]+)/comment-page-([0-9]{1,})/?$";s:50:"index.php?attachment=$matches[1]&cpage=$matches[2]";s:40:"selfie/[^/]+/attachment/([^/]+)/embed/?$";s:43:"index.php?attachment=$matches[1]&embed=true";s:23:"selfie/([^/]+)/embed/?$";s:39:"index.php?selfie=$matches[1]&embed=true";s:27:"selfie/([^/]+)/trackback/?$";s:33:"index.php?selfie=$matches[1]&tb=1";s:47:"selfie/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$";s:45:"index.php?selfie=$matches[1]&feed=$matches[2]";s:42:"selfie/([^/]+)/(feed|rdf|rss|rss2|atom)/?$";s:45:"index.php?selfie=$matches[1]&feed=$matches[2]";s:35:"selfie/([^/]+)/page/?([0-9]{1,})/?$";s:46:"index.php?selfie=$matches[1]&paged=$matches[2]";s:42:"selfie/([^/]+)/comment-page-([0-9]{1,})/?$";s:46:"index.php?selfie=$matches[1]&cpage=$matches[2]";s:31:"selfie/([^/]+)(?:/([0-9]+))?/?$";s:45:"index.php?selfie=$matches[1]&page=$matches[2]";s:23:"selfie/[^/]+/([^/]+)/?$";s:32:"index.php?attachment=$matches[1]";s:33:"selfie/[^/]+/([^/]+)/trackback/?$";s:37:"index.php?attachment=$matches[1]&tb=1";s:53:"selfie/[^/]+/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$";s:49:"index.php?attachment=$matches[1]&feed=$matches[2]";s:48:"selfie/[^/]+/([^/]+)/(feed|rdf|rss|rss2|atom)/?$";s:49:"index.php?attachment=$matches[1]&feed=$matches[2]";s:48:"selfie/[^/]+/([^/]+)/comment-page-([0-9]{1,})/?$";s:50:"index.php?attachment=$matches[1]&cpage=$matches[2]";s:29:"selfie/[^/]+/([^/]+)/embed/?$";s:43:"index.php?attachment=$matches[1]&embed=true";s:41:"sleeptracking/[^/]+/attachment/([^/]+)/?$";s:32:"index.php?attachment=$matches[1]";s:51:"sleeptracking/[^/]+/attachment/([^/]+)/trackback/?$";s:37:"index.php?attachment=$matches[1]&tb=1";s:71:"sleeptracking/[^/]+/attachment/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$";s:49:"index.php?attachment=$matches[1]&feed=$matches[2]";s:66:"sleeptracking/[^/]+/attachment/([^/]+)/(feed|rdf|rss|rss2|atom)/?$";s:49:"index.php?attachment=$matches[1]&feed=$matches[2]";s:66:"sleeptracking/[^/]+/attachment/([^/]+)/comment-page-([0-9]{1,})/?$";s:50:"index.php?attachment=$matches[1]&cpage=$matches[2]";s:47:"sleeptracking/[^/]+/attachment/([^/]+)/embed/?$";s:43:"index.php?attachment=$matches[1]&embed=true";s:30:"sleeptracking/([^/]+)/embed/?$";s:46:"index.php?sleeptracking=$matches[1]&embed=true";s:34:"sleeptracking/([^/]+)/trackback/?$";s:40:"index.php?sleeptracking=$matches[1]&tb=1";s:54:"sleeptracking/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$";s:52:"index.php?sleeptracking=$matches[1]&feed=$matches[2]";s:49:"sleeptracking/([^/]+)/(feed|rdf|rss|rss2|atom)/?$";s:52:"index.php?sleeptracking=$matches[1]&feed=$matches[2]";s:42:"sleeptracking/([^/]+)/page/?([0-9]{1,})/?$";s:53:"index.php?sleeptracking=$matches[1]&paged=$matches[2]";s:49:"sleeptracking/([^/]+)/comment-page-([0-9]{1,})/?$";s:53:"index.php?sleeptracking=$matches[1]&cpage=$matches[2]";s:38:"sleeptracking/([^/]+)(?:/([0-9]+))?/?$";s:52:"index.php?sleeptracking=$matches[1]&page=$matches[2]";s:30:"sleeptracking/[^/]+/([^/]+)/?$";s:32:"index.php?attachment=$matches[1]";s:40:"sleeptracking/[^/]+/([^/]+)/trackback/?$";s:37:"index.php?attachment=$matches[1]&tb=1";s:60:"sleeptracking/[^/]+/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$";s:49:"index.php?attachment=$matches[1]&feed=$matches[2]";s:55:"sleeptracking/[^/]+/([^/]+)/(feed|rdf|rss|rss2|atom)/?$";s:49:"index.php?attachment=$matches[1]&feed=$matches[2]";s:55:"sleeptracking/[^/]+/([^/]+)/comment-page-([0-9]{1,})/?$";s:50:"index.php?attachment=$matches[1]&cpage=$matches[2]";s:36:"sleeptracking/[^/]+/([^/]+)/embed/?$";s:43:"index.php?attachment=$matches[1]&embed=true";s:48:"hashtag/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$";s:46:"index.php?hashtag=$matches[1]&feed=$matches[2]";s:43:"hashtag/([^/]+)/(feed|rdf|rss|rss2|atom)/?$";s:46:"index.php?hashtag=$matches[1]&feed=$matches[2]";s:24:"hashtag/([^/]+)/embed/?$";s:40:"index.php?hashtag=$matches[1]&embed=true";s:36:"hashtag/([^/]+)/page/?([0-9]{1,})/?$";s:47:"index.php?hashtag=$matches[1]&paged=$matches[2]";s:18:"hashtag/([^/]+)/?$";s:29:"index.php?hashtag=$matches[1]";s:12:"robots\\.txt$";s:18:"index.php?robots=1";s:48:".*wp-(atom|rdf|rss|rss2|feed|commentsrss2)\\.php$";s:18:"index.php?feed=old";s:20:".*wp-app\\.php(/.*)?$";s:19:"index.php?error=403";s:18:".*wp-register.php$";s:23:"index.php?register=true";s:32:"feed/(feed|rdf|rss|rss2|atom)/?$";s:27:"index.php?&feed=$matches[1]";s:27:"(feed|rdf|rss|rss2|atom)/?$";s:27:"index.php?&feed=$matches[1]";s:8:"embed/?$";s:21:"index.php?&embed=true";s:20:"page/?([0-9]{1,})/?$";s:28:"index.php?&paged=$matches[1]";s:41:"comments/feed/(feed|rdf|rss|rss2|atom)/?$";s:42:"index.php?&feed=$matches[1]&withcomments=1";s:36:"comments/(feed|rdf|rss|rss2|atom)/?$";s:42:"index.php?&feed=$matches[1]&withcomments=1";s:17:"comments/embed/?$";s:21:"index.php?&embed=true";s:44:"search/(.+)/feed/(feed|rdf|rss|rss2|atom)/?$";s:40:"index.php?s=$matches[1]&feed=$matches[2]";s:39:"search/(.+)/(feed|rdf|rss|rss2|atom)/?$";s:40:"index.php?s=$matches[1]&feed=$matches[2]";s:20:"search/(.+)/embed/?$";s:34:"index.php?s=$matches[1]&embed=true";s:32:"search/(.+)/page/?([0-9]{1,})/?$";s:41:"index.php?s=$matches[1]&paged=$matches[2]";s:14:"search/(.+)/?$";s:23:"index.php?s=$matches[1]";s:47:"author/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$";s:50:"index.php?author_name=$matches[1]&feed=$matches[2]";s:42:"author/([^/]+)/(feed|rdf|rss|rss2|atom)/?$";s:50:"index.php?author_name=$matches[1]&feed=$matches[2]";s:23:"author/([^/]+)/embed/?$";s:44:"index.php?author_name=$matches[1]&embed=true";s:35:"author/([^/]+)/page/?([0-9]{1,})/?$";s:51:"index.php?author_name=$matches[1]&paged=$matches[2]";s:17:"author/([^/]+)/?$";s:33:"index.php?author_name=$matches[1]";s:69:"([0-9]{4})/([0-9]{1,2})/([0-9]{1,2})/feed/(feed|rdf|rss|rss2|atom)/?$";s:80:"index.php?year=$matches[1]&monthnum=$matches[2]&day=$matches[3]&feed=$matches[4]";s:64:"([0-9]{4})/([0-9]{1,2})/([0-9]{1,2})/(feed|rdf|rss|rss2|atom)/?$";s:80:"index.php?year=$matches[1]&monthnum=$matches[2]&day=$matches[3]&feed=$matches[4]";s:45:"([0-9]{4})/([0-9]{1,2})/([0-9]{1,2})/embed/?$";s:74:"index.php?year=$matches[1]&monthnum=$matches[2]&day=$matches[3]&embed=true";s:57:"([0-9]{4})/([0-9]{1,2})/([0-9]{1,2})/page/?([0-9]{1,})/?$";s:81:"index.php?year=$matches[1]&monthnum=$matches[2]&day=$matches[3]&paged=$matches[4]";s:39:"([0-9]{4})/([0-9]{1,2})/([0-9]{1,2})/?$";s:63:"index.php?year=$matches[1]&monthnum=$matches[2]&day=$matches[3]";s:56:"([0-9]{4})/([0-9]{1,2})/feed/(feed|rdf|rss|rss2|atom)/?$";s:64:"index.php?year=$matches[1]&monthnum=$matches[2]&feed=$matches[3]";s:51:"([0-9]{4})/([0-9]{1,2})/(feed|rdf|rss|rss2|atom)/?$";s:64:"index.php?year=$matches[1]&monthnum=$matches[2]&feed=$matches[3]";s:32:"([0-9]{4})/([0-9]{1,2})/embed/?$";s:58:"index.php?year=$matches[1]&monthnum=$matches[2]&embed=true";s:44:"([0-9]{4})/([0-9]{1,2})/page/?([0-9]{1,})/?$";s:65:"index.php?year=$matches[1]&monthnum=$matches[2]&paged=$matches[3]";s:26:"([0-9]{4})/([0-9]{1,2})/?$";s:47:"index.php?year=$matches[1]&monthnum=$matches[2]";s:43:"([0-9]{4})/feed/(feed|rdf|rss|rss2|atom)/?$";s:43:"index.php?year=$matches[1]&feed=$matches[2]";s:38:"([0-9]{4})/(feed|rdf|rss|rss2|atom)/?$";s:43:"index.php?year=$matches[1]&feed=$matches[2]";s:19:"([0-9]{4})/embed/?$";s:37:"index.php?year=$matches[1]&embed=true";s:31:"([0-9]{4})/page/?([0-9]{1,})/?$";s:44:"index.php?year=$matches[1]&paged=$matches[2]";s:13:"([0-9]{4})/?$";s:26:"index.php?year=$matches[1]";s:58:"[0-9]{4}/[0-9]{1,2}/[0-9]{1,2}/[^/]+/attachment/([^/]+)/?$";s:32:"index.php?attachment=$matches[1]";s:68:"[0-9]{4}/[0-9]{1,2}/[0-9]{1,2}/[^/]+/attachment/([^/]+)/trackback/?$";s:37:"index.php?attachment=$matches[1]&tb=1";s:88:"[0-9]{4}/[0-9]{1,2}/[0-9]{1,2}/[^/]+/attachment/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$";s:49:"index.php?attachment=$matches[1]&feed=$matches[2]";s:83:"[0-9]{4}/[0-9]{1,2}/[0-9]{1,2}/[^/]+/attachment/([^/]+)/(feed|rdf|rss|rss2|atom)/?$";s:49:"index.php?attachment=$matches[1]&feed=$matches[2]";s:83:"[0-9]{4}/[0-9]{1,2}/[0-9]{1,2}/[^/]+/attachment/([^/]+)/comment-page-([0-9]{1,})/?$";s:50:"index.php?attachment=$matches[1]&cpage=$matches[2]";s:64:"[0-9]{4}/[0-9]{1,2}/[0-9]{1,2}/[^/]+/attachment/([^/]+)/embed/?$";s:43:"index.php?attachment=$matches[1]&embed=true";s:53:"([0-9]{4})/([0-9]{1,2})/([0-9]{1,2})/([^/]+)/embed/?$";s:91:"index.php?year=$matches[1]&monthnum=$matches[2]&day=$matches[3]&name=$matches[4]&embed=true";s:57:"([0-9]{4})/([0-9]{1,2})/([0-9]{1,2})/([^/]+)/trackback/?$";s:85:"index.php?year=$matches[1]&monthnum=$matches[2]&day=$matches[3]&name=$matches[4]&tb=1";s:77:"([0-9]{4})/([0-9]{1,2})/([0-9]{1,2})/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$";s:97:"index.php?year=$matches[1]&monthnum=$matches[2]&day=$matches[3]&name=$matches[4]&feed=$matches[5]";s:72:"([0-9]{4})/([0-9]{1,2})/([0-9]{1,2})/([^/]+)/(feed|rdf|rss|rss2|atom)/?$";s:97:"index.php?year=$matches[1]&monthnum=$matches[2]&day=$matches[3]&name=$matches[4]&feed=$matches[5]";s:65:"([0-9]{4})/([0-9]{1,2})/([0-9]{1,2})/([^/]+)/page/?([0-9]{1,})/?$";s:98:"index.php?year=$matches[1]&monthnum=$matches[2]&day=$matches[3]&name=$matches[4]&paged=$matches[5]";s:72:"([0-9]{4})/([0-9]{1,2})/([0-9]{1,2})/([^/]+)/comment-page-([0-9]{1,})/?$";s:98:"index.php?year=$matches[1]&monthnum=$matches[2]&day=$matches[3]&name=$matches[4]&cpage=$matches[5]";s:61:"([0-9]{4})/([0-9]{1,2})/([0-9]{1,2})/([^/]+)(?:/([0-9]+))?/?$";s:97:"index.php?year=$matches[1]&monthnum=$matches[2]&day=$matches[3]&name=$matches[4]&page=$matches[5]";s:47:"[0-9]{4}/[0-9]{1,2}/[0-9]{1,2}/[^/]+/([^/]+)/?$";s:32:"index.php?attachment=$matches[1]";s:57:"[0-9]{4}/[0-9]{1,2}/[0-9]{1,2}/[^/]+/([^/]+)/trackback/?$";s:37:"index.php?attachment=$matches[1]&tb=1";s:77:"[0-9]{4}/[0-9]{1,2}/[0-9]{1,2}/[^/]+/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$";s:49:"index.php?attachment=$matches[1]&feed=$matches[2]";s:72:"[0-9]{4}/[0-9]{1,2}/[0-9]{1,2}/[^/]+/([^/]+)/(feed|rdf|rss|rss2|atom)/?$";s:49:"index.php?attachment=$matches[1]&feed=$matches[2]";s:72:"[0-9]{4}/[0-9]{1,2}/[0-9]{1,2}/[^/]+/([^/]+)/comment-page-([0-9]{1,})/?$";s:50:"index.php?attachment=$matches[1]&cpage=$matches[2]";s:53:"[0-9]{4}/[0-9]{1,2}/[0-9]{1,2}/[^/]+/([^/]+)/embed/?$";s:43:"index.php?attachment=$matches[1]&embed=true";s:64:"([0-9]{4})/([0-9]{1,2})/([0-9]{1,2})/comment-page-([0-9]{1,})/?$";s:81:"index.php?year=$matches[1]&monthnum=$matches[2]&day=$matches[3]&cpage=$matches[4]";s:51:"([0-9]{4})/([0-9]{1,2})/comment-page-([0-9]{1,})/?$";s:65:"index.php?year=$matches[1]&monthnum=$matches[2]&cpage=$matches[3]";s:38:"([0-9]{4})/comment-page-([0-9]{1,})/?$";s:44:"index.php?year=$matches[1]&cpage=$matches[2]";s:27:".?.+?/attachment/([^/]+)/?$";s:32:"index.php?attachment=$matches[1]";s:37:".?.+?/attachment/([^/]+)/trackback/?$";s:37:"index.php?attachment=$matches[1]&tb=1";s:57:".?.+?/attachment/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$";s:49:"index.php?attachment=$matches[1]&feed=$matches[2]";s:52:".?.+?/attachment/([^/]+)/(feed|rdf|rss|rss2|atom)/?$";s:49:"index.php?attachment=$matches[1]&feed=$matches[2]";s:52:".?.+?/attachment/([^/]+)/comment-page-([0-9]{1,})/?$";s:50:"index.php?attachment=$matches[1]&cpage=$matches[2]";s:33:".?.+?/attachment/([^/]+)/embed/?$";s:43:"index.php?attachment=$matches[1]&embed=true";s:16:"(.?.+?)/embed/?$";s:41:"index.php?pagename=$matches[1]&embed=true";s:20:"(.?.+?)/trackback/?$";s:35:"index.php?pagename=$matches[1]&tb=1";s:40:"(.?.+?)/feed/(feed|rdf|rss|rss2|atom)/?$";s:47:"index.php?pagename=$matches[1]&feed=$matches[2]";s:35:"(.?.+?)/(feed|rdf|rss|rss2|atom)/?$";s:47:"index.php?pagename=$matches[1]&feed=$matches[2]";s:28:"(.?.+?)/page/?([0-9]{1,})/?$";s:48:"index.php?pagename=$matches[1]&paged=$matches[2]";s:35:"(.?.+?)/comment-page-([0-9]{1,})/?$";s:48:"index.php?pagename=$matches[1]&cpage=$matches[2]";s:24:"(.?.+?)(?:/([0-9]+))?/?$";s:47:"index.php?pagename=$matches[1]&page=$matches[2]";}', 'yes'),
(30, 'hack_file', '0', 'yes'),
(31, 'blog_charset', 'UTF-8', 'yes'),
(32, 'moderation_keys', '', 'no'),
(33, 'active_plugins', 'a:7:{i:0;s:41:"acf-to-rest-api/class-acf-to-rest-api.php";i:1;s:30:"advanced-custom-fields/acf.php";i:4;s:41:"functions-simodecl/functions-simodecl.php";i:5;s:47:"jwt-authentication-for-wp-rest-api/jwt-auth.php";i:6;s:21:"napp-cpt/napp-cpt.php";i:7;s:37:"user-role-editor/user-role-editor.php";i:8;s:29:"wp-rest-user/wp-rest-user.php";}', 'yes'),
(34, 'category_base', '', 'yes'),
(35, 'ping_sites', 'http://rpc.pingomatic.com/', 'yes'),
(36, 'comment_max_links', '2', 'yes'),
(37, 'gmt_offset', '0', 'yes'),
(38, 'default_email_category', '1', 'yes'),
(39, 'recently_edited', 'a:5:{i:0;s:128:"/home/cmsdev/domains/cmsdevelopment.be/public_html/simodecl/wp-content/plugins/wp-rest-user/public/class-wp-rest-user-public.php";i:2;s:108:"/home/cmsdev/domains/cmsdevelopment.be/public_html/simodecl/wp-content/plugins/wp-rest-user/wp-rest-user.php";i:3;s:120:"/home/cmsdev/domains/cmsdevelopment.be/public_html/simodecl/wp-content/plugins/acf-to-rest-api/class-acf-to-rest-api.php";i:4;s:146:"/home/cmsdev/domains/cmsdevelopment.be/public_html/simodecl/wp-content/plugins/jwt-authentication-for-wp-rest-api/public/class-jwt-auth-public.php";i:5;s:126:"/home/cmsdev/domains/cmsdevelopment.be/public_html/simodecl/wp-content/plugins/jwt-authentication-for-wp-rest-api/jwt-auth.php";}', 'no'),
(40, 'template', 'spicepress', 'yes'),
(41, 'stylesheet', 'content', 'yes'),
(42, 'comment_whitelist', '', 'yes'),
(43, 'blacklist_keys', '', 'no'),
(44, 'comment_registration', '1', 'yes'),
(45, 'html_type', 'text/html', 'yes'),
(46, 'use_trackback', '0', 'yes'),
(47, 'default_role', 'mobile', 'yes'),
(48, 'db_version', '38590', 'yes'),
(49, 'uploads_use_yearmonth_folders', '1', 'yes'),
(50, 'upload_path', '', 'yes'),
(51, 'blog_public', '1', 'yes'),
(52, 'default_link_category', '2', 'yes'),
(53, 'show_on_front', 'posts', 'yes'),
(54, 'tag_base', '', 'yes'),
(55, 'show_avatars', '1', 'yes'),
(56, 'avatar_rating', 'G', 'yes'),
(57, 'upload_url_path', '', 'yes'),
(58, 'thumbnail_size_w', '150', 'yes'),
(59, 'thumbnail_size_h', '150', 'yes'),
(60, 'thumbnail_crop', '1', 'yes'),
(61, 'medium_size_w', '300', 'yes'),
(62, 'medium_size_h', '300', 'yes'),
(63, 'avatar_default', 'mystery', 'yes'),
(64, 'large_size_w', '1024', 'yes'),
(65, 'large_size_h', '1024', 'yes'),
(66, 'image_default_link_type', 'none', 'yes'),
(67, 'image_default_size', '', 'yes'),
(68, 'image_default_align', '', 'yes'),
(69, 'close_comments_for_old_posts', '', 'yes'),
(70, 'close_comments_days_old', '14', 'yes'),
(71, 'thread_comments', '1', 'yes'),
(72, 'thread_comments_depth', '2', 'yes'),
(73, 'page_comments', '', 'yes'),
(74, 'comments_per_page', '50', 'yes'),
(75, 'default_comments_page', 'newest', 'yes'),
(76, 'comment_order', 'asc', 'yes'),
(77, 'sticky_posts', 'a:0:{}', 'yes'),
(78, 'widget_categories', 'a:2:{i:2;a:4:{s:5:"title";s:0:"";s:5:"count";i:0;s:12:"hierarchical";i:0;s:8:"dropdown";i:0;}s:12:"_multiwidget";i:1;}', 'yes'),
(79, 'widget_text', 'a:0:{}', 'yes'),
(80, 'widget_rss', 'a:0:{}', 'yes'),
(81, 'uninstall_plugins', 'a:1:{s:43:"my-custom-functions/my-custom-functions.php";s:26:"spacexchimp_p001_uninstall";}', 'no'),
(82, 'timezone_string', '', 'yes'),
(83, 'page_for_posts', '0', 'yes'),
(84, 'page_on_front', '0', 'yes'),
(85, 'default_post_format', '0', 'yes'),
(86, 'link_manager_enabled', '0', 'yes'),
(87, 'finished_splitting_shared_terms', '1', 'yes'),
(88, 'site_icon', '0', 'yes'),
(89, 'medium_large_size_w', '768', 'yes'),
(90, 'medium_large_size_h', '0', 'yes'),
(91, 'wp_page_for_privacy_policy', '3', 'yes'),
(92, 'show_comments_cookies_opt_in', '1', 'yes'),
(93, 'initial_db_version', '38590', 'yes'),
(94, 'wp_user_roles', 'a:6:{s:13:"administrator";a:2:{s:4:"name";s:13:"Administrator";s:12:"capabilities";a:68:{s:13:"switch_themes";b:1;s:11:"edit_themes";b:1;s:16:"activate_plugins";b:1;s:12:"edit_plugins";b:1;s:10:"edit_users";b:1;s:10:"edit_files";b:1;s:14:"manage_options";b:1;s:17:"moderate_comments";b:1;s:17:"manage_categories";b:1;s:12:"manage_links";b:1;s:12:"upload_files";b:1;s:6:"import";b:1;s:15:"unfiltered_html";b:1;s:10:"edit_posts";b:1;s:17:"edit_others_posts";b:1;s:20:"edit_published_posts";b:1;s:13:"publish_posts";b:1;s:10:"edit_pages";b:1;s:4:"read";b:1;s:8:"level_10";b:1;s:7:"level_9";b:1;s:7:"level_8";b:1;s:7:"level_7";b:1;s:7:"level_6";b:1;s:7:"level_5";b:1;s:7:"level_4";b:1;s:7:"level_3";b:1;s:7:"level_2";b:1;s:7:"level_1";b:1;s:7:"level_0";b:1;s:17:"edit_others_pages";b:1;s:20:"edit_published_pages";b:1;s:13:"publish_pages";b:1;s:12:"delete_pages";b:1;s:19:"delete_others_pages";b:1;s:22:"delete_published_pages";b:1;s:12:"delete_posts";b:1;s:19:"delete_others_posts";b:1;s:22:"delete_published_posts";b:1;s:20:"delete_private_posts";b:1;s:18:"edit_private_posts";b:1;s:18:"read_private_posts";b:1;s:20:"delete_private_pages";b:1;s:18:"edit_private_pages";b:1;s:18:"read_private_pages";b:1;s:12:"delete_users";b:1;s:12:"create_users";b:1;s:17:"unfiltered_upload";b:1;s:14:"edit_dashboard";b:1;s:14:"update_plugins";b:1;s:14:"delete_plugins";b:1;s:15:"install_plugins";b:1;s:13:"update_themes";b:1;s:14:"install_themes";b:1;s:11:"update_core";b:1;s:10:"list_users";b:1;s:12:"remove_users";b:1;s:13:"promote_users";b:1;s:18:"edit_theme_options";b:1;s:13:"delete_themes";b:1;s:6:"export";b:1;s:14:"ure_edit_roles";b:1;s:16:"ure_create_roles";b:1;s:16:"ure_delete_roles";b:1;s:23:"ure_create_capabilities";b:1;s:23:"ure_delete_capabilities";b:1;s:18:"ure_manage_options";b:1;s:15:"ure_reset_roles";b:1;}}s:6:"author";a:2:{s:4:"name";s:6:"Author";s:12:"capabilities";a:11:{s:12:"delete_posts";b:1;s:22:"delete_published_posts";b:1;s:10:"edit_posts";b:1;s:20:"edit_published_posts";b:1;s:7:"level_0";b:1;s:7:"level_1";b:1;s:7:"level_2";b:1;s:10:"list_users";b:1;s:13:"publish_posts";b:1;s:4:"read";b:1;s:12:"upload_files";b:1;}}s:11:"contributor";a:2:{s:4:"name";s:11:"Contributor";s:12:"capabilities";a:5:{s:10:"edit_posts";b:1;s:4:"read";b:1;s:7:"level_1";b:1;s:7:"level_0";b:1;s:12:"delete_posts";b:1;}}s:6:"editor";a:2:{s:4:"name";s:6:"Editor";s:12:"capabilities";a:34:{s:17:"moderate_comments";b:1;s:17:"manage_categories";b:1;s:12:"manage_links";b:1;s:12:"upload_files";b:1;s:15:"unfiltered_html";b:1;s:10:"edit_posts";b:1;s:17:"edit_others_posts";b:1;s:20:"edit_published_posts";b:1;s:13:"publish_posts";b:1;s:10:"edit_pages";b:1;s:4:"read";b:1;s:7:"level_7";b:1;s:7:"level_6";b:1;s:7:"level_5";b:1;s:7:"level_4";b:1;s:7:"level_3";b:1;s:7:"level_2";b:1;s:7:"level_1";b:1;s:7:"level_0";b:1;s:17:"edit_others_pages";b:1;s:20:"edit_published_pages";b:1;s:13:"publish_pages";b:1;s:12:"delete_pages";b:1;s:19:"delete_others_pages";b:1;s:22:"delete_published_pages";b:1;s:12:"delete_posts";b:1;s:19:"delete_others_posts";b:1;s:22:"delete_published_posts";b:1;s:20:"delete_private_posts";b:1;s:18:"edit_private_posts";b:1;s:18:"read_private_posts";b:1;s:20:"delete_private_pages";b:1;s:18:"edit_private_pages";b:1;s:18:"read_private_pages";b:1;}}s:6:"mobile";a:2:{s:4:"name";s:6:"Mobile";s:12:"capabilities";a:35:{s:19:"delete_others_pages";b:1;s:19:"delete_others_posts";b:1;s:12:"delete_pages";b:1;s:12:"delete_posts";b:1;s:20:"delete_private_pages";b:1;s:20:"delete_private_posts";b:1;s:22:"delete_published_pages";b:1;s:22:"delete_published_posts";b:1;s:17:"edit_others_pages";b:1;s:17:"edit_others_posts";b:1;s:10:"edit_pages";b:1;s:10:"edit_posts";b:1;s:18:"edit_private_pages";b:1;s:18:"edit_private_posts";b:1;s:20:"edit_published_pages";b:1;s:20:"edit_published_posts";b:1;s:7:"level_0";b:1;s:7:"level_1";b:1;s:7:"level_2";b:1;s:7:"level_3";b:1;s:7:"level_4";b:1;s:7:"level_5";b:1;s:7:"level_6";b:1;s:7:"level_7";b:1;s:10:"list_users";b:1;s:17:"manage_categories";b:1;s:12:"manage_links";b:1;s:17:"moderate_comments";b:1;s:13:"publish_pages";b:1;s:13:"publish_posts";b:1;s:4:"read";b:1;s:18:"read_private_pages";b:1;s:18:"read_private_posts";b:1;s:15:"unfiltered_html";b:1;s:12:"upload_files";b:1;}}s:10:"subscriber";a:2:{s:4:"name";s:10:"Subscriber";s:12:"capabilities";a:2:{s:4:"read";b:1;s:7:"level_0";b:1;}}}', 'yes'),
(95, 'fresh_site', '0', 'yes'),
(96, 'WPLANG', 'nl_BE', 'yes'),
(97, 'widget_search', 'a:2:{i:2;a:1:{s:5:"title";s:0:"";}s:12:"_multiwidget";i:1;}', 'yes'),
(98, 'widget_recent-posts', 'a:2:{i:2;a:2:{s:5:"title";s:0:"";s:6:"number";i:5;}s:12:"_multiwidget";i:1;}', 'yes'),
(99, 'widget_recent-comments', 'a:2:{i:2;a:2:{s:5:"title";s:0:"";s:6:"number";i:5;}s:12:"_multiwidget";i:1;}', 'yes'),
(100, 'widget_archives', 'a:2:{i:2;a:3:{s:5:"title";s:0:"";s:5:"count";i:0;s:8:"dropdown";i:0;}s:12:"_multiwidget";i:1;}', 'yes'),
(101, 'widget_meta', 'a:2:{i:2;a:1:{s:5:"title";s:0:"";}s:12:"_multiwidget";i:1;}', 'yes'),
(102, 'sidebars_widgets', 'a:8:{s:19:"wp_inactive_widgets";a:0:{}s:15:"sidebar_primary";a:6:{i:0;s:8:"search-2";i:1;s:14:"recent-posts-2";i:2;s:17:"recent-comments-2";i:3;s:10:"archives-2";i:4;s:12:"categories-2";i:5;s:6:"meta-2";}s:23:"footer_widget_area_left";a:0:{}s:25:"footer_widget_area_center";a:0:{}s:24:"footer_widget_area_right";a:0:{}s:11:"woocommerce";a:0:{}s:24:"wdl_contact_page_sidebar";a:0:{}s:13:"array_version";i:3;}', 'yes'),
(103, 'widget_pages', 'a:1:{s:12:"_multiwidget";i:1;}', 'yes'),
(104, 'widget_calendar', 'a:1:{s:12:"_multiwidget";i:1;}', 'yes'),
(105, 'widget_media_audio', 'a:1:{s:12:"_multiwidget";i:1;}', 'yes'),
(106, 'widget_media_image', 'a:1:{s:12:"_multiwidget";i:1;}', 'yes'),
(107, 'widget_media_gallery', 'a:1:{s:12:"_multiwidget";i:1;}', 'yes'),
(108, 'widget_media_video', 'a:1:{s:12:"_multiwidget";i:1;}', 'yes'),
(109, 'widget_tag_cloud', 'a:1:{s:12:"_multiwidget";i:1;}', 'yes'),
(110, 'widget_nav_menu', 'a:1:{s:12:"_multiwidget";i:1;}', 'yes'),
(111, 'widget_custom_html', 'a:1:{s:12:"_multiwidget";i:1;}', 'yes'),
(112, 'cron', 'a:5:{i:1546850439;a:1:{s:34:"wp_privacy_delete_old_export_files";a:1:{s:32:"40cd750bba9870f18aada2478b24840a";a:3:{s:8:"schedule";s:6:"hourly";s:4:"args";a:0:{}s:8:"interval";i:3600;}}}i:1546875639;a:3:{s:16:"wp_version_check";a:1:{s:32:"40cd750bba9870f18aada2478b24840a";a:3:{s:8:"schedule";s:10:"twicedaily";s:4:"args";a:0:{}s:8:"interval";i:43200;}}s:17:"wp_update_plugins";a:1:{s:32:"40cd750bba9870f18aada2478b24840a";a:3:{s:8:"schedule";s:10:"twicedaily";s:4:"args";a:0:{}s:8:"interval";i:43200;}}s:16:"wp_update_themes";a:1:{s:32:"40cd750bba9870f18aada2478b24840a";a:3:{s:8:"schedule";s:10:"twicedaily";s:4:"args";a:0:{}s:8:"interval";i:43200;}}}i:1546875647;a:2:{s:19:"wp_scheduled_delete";a:1:{s:32:"40cd750bba9870f18aada2478b24840a";a:3:{s:8:"schedule";s:5:"daily";s:4:"args";a:0:{}s:8:"interval";i:86400;}}s:25:"delete_expired_transients";a:1:{s:32:"40cd750bba9870f18aada2478b24840a";a:3:{s:8:"schedule";s:5:"daily";s:4:"args";a:0:{}s:8:"interval";i:86400;}}}i:1546890720;a:1:{s:30:"wp_scheduled_auto_draft_delete";a:1:{s:32:"40cd750bba9870f18aada2478b24840a";a:3:{s:8:"schedule";s:5:"daily";s:4:"args";a:0:{}s:8:"interval";i:86400;}}}s:7:"version";i:2;}', 'yes'),
(125, 'can_compress_scripts', '0', 'no'),
(140, 'recently_activated', 'a:0:{}', 'yes'),
(148, 'theme_mods_twentyseventeen', 'a:1:{s:16:"sidebars_widgets";a:2:{s:4:"time";i:1542214208;s:4:"data";a:4:{s:19:"wp_inactive_widgets";a:0:{}s:9:"sidebar-1";a:6:{i:0;s:8:"search-2";i:1;s:14:"recent-posts-2";i:2;s:17:"recent-comments-2";i:3;s:10:"archives-2";i:4;s:12:"categories-2";i:5;s:6:"meta-2";}s:9:"sidebar-2";a:0:{}s:9:"sidebar-3";a:0:{}}}}', 'yes'),
(149, 'current_theme', 'Content', 'yes'),
(150, 'theme_mods_content', 'a:3:{i:0;b:0;s:18:"nav_menu_locations";a:0:{}s:18:"custom_css_post_id";i:-1;}', 'yes'),
(151, 'theme_switched', '', 'yes'),
(211, 'user_role_editor', 'a:2:{s:11:"ure_version";s:4:"4.47";s:19:"other_default_roles";a:1:{i:0;s:6:"mobile";}}', 'yes'),
(212, 'wp_backup_user_roles', 'a:5:{s:13:"administrator";a:2:{s:4:"name";s:13:"Administrator";s:12:"capabilities";a:61:{s:13:"switch_themes";b:1;s:11:"edit_themes";b:1;s:16:"activate_plugins";b:1;s:12:"edit_plugins";b:1;s:10:"edit_users";b:1;s:10:"edit_files";b:1;s:14:"manage_options";b:1;s:17:"moderate_comments";b:1;s:17:"manage_categories";b:1;s:12:"manage_links";b:1;s:12:"upload_files";b:1;s:6:"import";b:1;s:15:"unfiltered_html";b:1;s:10:"edit_posts";b:1;s:17:"edit_others_posts";b:1;s:20:"edit_published_posts";b:1;s:13:"publish_posts";b:1;s:10:"edit_pages";b:1;s:4:"read";b:1;s:8:"level_10";b:1;s:7:"level_9";b:1;s:7:"level_8";b:1;s:7:"level_7";b:1;s:7:"level_6";b:1;s:7:"level_5";b:1;s:7:"level_4";b:1;s:7:"level_3";b:1;s:7:"level_2";b:1;s:7:"level_1";b:1;s:7:"level_0";b:1;s:17:"edit_others_pages";b:1;s:20:"edit_published_pages";b:1;s:13:"publish_pages";b:1;s:12:"delete_pages";b:1;s:19:"delete_others_pages";b:1;s:22:"delete_published_pages";b:1;s:12:"delete_posts";b:1;s:19:"delete_others_posts";b:1;s:22:"delete_published_posts";b:1;s:20:"delete_private_posts";b:1;s:18:"edit_private_posts";b:1;s:18:"read_private_posts";b:1;s:20:"delete_private_pages";b:1;s:18:"edit_private_pages";b:1;s:18:"read_private_pages";b:1;s:12:"delete_users";b:1;s:12:"create_users";b:1;s:17:"unfiltered_upload";b:1;s:14:"edit_dashboard";b:1;s:14:"update_plugins";b:1;s:14:"delete_plugins";b:1;s:15:"install_plugins";b:1;s:13:"update_themes";b:1;s:14:"install_themes";b:1;s:11:"update_core";b:1;s:10:"list_users";b:1;s:12:"remove_users";b:1;s:13:"promote_users";b:1;s:18:"edit_theme_options";b:1;s:13:"delete_themes";b:1;s:6:"export";b:1;}}s:6:"editor";a:2:{s:4:"name";s:6:"Editor";s:12:"capabilities";a:34:{s:17:"moderate_comments";b:1;s:17:"manage_categories";b:1;s:12:"manage_links";b:1;s:12:"upload_files";b:1;s:15:"unfiltered_html";b:1;s:10:"edit_posts";b:1;s:17:"edit_others_posts";b:1;s:20:"edit_published_posts";b:1;s:13:"publish_posts";b:1;s:10:"edit_pages";b:1;s:4:"read";b:1;s:7:"level_7";b:1;s:7:"level_6";b:1;s:7:"level_5";b:1;s:7:"level_4";b:1;s:7:"level_3";b:1;s:7:"level_2";b:1;s:7:"level_1";b:1;s:7:"level_0";b:1;s:17:"edit_others_pages";b:1;s:20:"edit_published_pages";b:1;s:13:"publish_pages";b:1;s:12:"delete_pages";b:1;s:19:"delete_others_pages";b:1;s:22:"delete_published_pages";b:1;s:12:"delete_posts";b:1;s:19:"delete_others_posts";b:1;s:22:"delete_published_posts";b:1;s:20:"delete_private_posts";b:1;s:18:"edit_private_posts";b:1;s:18:"read_private_posts";b:1;s:20:"delete_private_pages";b:1;s:18:"edit_private_pages";b:1;s:18:"read_private_pages";b:1;}}s:6:"author";a:2:{s:4:"name";s:6:"Author";s:12:"capabilities";a:10:{s:12:"upload_files";b:1;s:10:"edit_posts";b:1;s:20:"edit_published_posts";b:1;s:13:"publish_posts";b:1;s:4:"read";b:1;s:7:"level_2";b:1;s:7:"level_1";b:1;s:7:"level_0";b:1;s:12:"delete_posts";b:1;s:22:"delete_published_posts";b:1;}}s:11:"contributor";a:2:{s:4:"name";s:11:"Contributor";s:12:"capabilities";a:5:{s:10:"edit_posts";b:1;s:4:"read";b:1;s:7:"level_1";b:1;s:7:"level_0";b:1;s:12:"delete_posts";b:1;}}s:10:"subscriber";a:2:{s:4:"name";s:10:"Subscriber";s:12:"capabilities";a:2:{s:4:"read";b:1;s:7:"level_0";b:1;}}}', 'no'),
(213, 'ure_tasks_queue', 'a:0:{}', 'yes'),
(218, 'ure_role_additional_options_values', 'a:2:{s:6:"mobile";a:0:{}s:6:"author";a:0:{}}', 'yes'),
(305, 'widget_akismet_widget', 'a:1:{s:12:"_multiwidget";i:1;}', 'yes'),
(306, 'acf_version', '5.7.9', 'yes'),
(340, 'cptui_new_install', 'false', 'yes'),
(341, 'cptui_post_types', 'a:0:{}', 'yes'),
(381, 'spacexchimp_p001_service_info', 'a:4:{s:7:"upgrade";s:4:"0001";s:7:"version";s:4:"4.31";s:11:"old_version";s:1:"0";s:15:"activation_date";i:1542733699;}', 'yes'),
(679, 'category_children', 'a:0:{}', 'yes'),
(903, 'cptui_taxonomies', 'a:0:{}', 'yes'),
(971, '_site_transient_update_core', 'O:8:"stdClass":4:{s:7:"updates";a:2:{i:0;O:8:"stdClass":10:{s:8:"response";s:7:"upgrade";s:8:"download";s:59:"https://downloads.wordpress.org/release/wordpress-5.0.2.zip";s:6:"locale";s:5:"en_US";s:8:"packages";O:8:"stdClass":5:{s:4:"full";s:59:"https://downloads.wordpress.org/release/wordpress-5.0.2.zip";s:10:"no_content";s:70:"https://downloads.wordpress.org/release/wordpress-5.0.2-no-content.zip";s:11:"new_bundled";s:71:"https://downloads.wordpress.org/release/wordpress-5.0.2-new-bundled.zip";s:7:"partial";b:0;s:8:"rollback";b:0;}s:7:"current";s:5:"5.0.2";s:7:"version";s:5:"5.0.2";s:11:"php_version";s:5:"5.2.4";s:13:"mysql_version";s:3:"5.0";s:11:"new_bundled";s:3:"5.0";s:15:"partial_version";s:0:"";}i:1;O:8:"stdClass":11:{s:8:"response";s:10:"autoupdate";s:8:"download";s:59:"https://downloads.wordpress.org/release/wordpress-5.0.2.zip";s:6:"locale";s:5:"en_US";s:8:"packages";O:8:"stdClass":5:{s:4:"full";s:59:"https://downloads.wordpress.org/release/wordpress-5.0.2.zip";s:10:"no_content";s:70:"https://downloads.wordpress.org/release/wordpress-5.0.2-no-content.zip";s:11:"new_bundled";s:71:"https://downloads.wordpress.org/release/wordpress-5.0.2-new-bundled.zip";s:7:"partial";b:0;s:8:"rollback";b:0;}s:7:"current";s:5:"5.0.2";s:7:"version";s:5:"5.0.2";s:11:"php_version";s:5:"5.2.4";s:13:"mysql_version";s:3:"5.0";s:11:"new_bundled";s:3:"5.0";s:15:"partial_version";s:0:"";s:9:"new_files";s:1:"1";}}s:12:"last_checked";i:1546841768;s:15:"version_checked";s:5:"4.9.9";s:12:"translations";a:0:{}}', 'no'),
(974, 'auto_core_update_notified', 'a:4:{s:4:"type";s:7:"success";s:5:"email";s:31:"simodecl@student.arteveldehs.be";s:7:"version";s:5:"4.9.9";s:9:"timestamp";i:1544707150;}', 'no'),
(1004, 'bp-deactivated-components', 'a:0:{}', 'yes'),
(1005, 'bp-xprofile-base-group-name', 'Base', 'yes'),
(1006, 'bp-xprofile-fullname-field-name', 'Name', 'yes'),
(1007, 'bp-blogs-first-install', '', 'yes'),
(1008, 'bp-disable-profile-sync', '', 'yes'),
(1009, 'hide-loggedout-adminbar', '', 'yes'),
(1010, 'bp-disable-avatar-uploads', '', 'yes'),
(1011, 'bp-disable-cover-image-uploads', '', 'yes'),
(1012, 'bp-disable-group-avatar-uploads', '', 'yes'),
(1013, 'bp-disable-group-cover-image-uploads', '', 'yes'),
(1014, 'bp-disable-account-deletion', '', 'yes'),
(1015, 'bp-disable-blogforum-comments', '1', 'yes'),
(1016, '_bp_theme_package_id', 'nouveau', 'yes'),
(1017, 'bp-emails-unsubscribe-salt', 'OVMpXXQ+OD95LmN6a2hGWlBZe2hkbkkxVj0reFItIH1iYzVCcmJMNGNQemZxNUZ8Qz5RM0w8RXhrQFBWd1p3Sw==', 'yes'),
(1018, 'bp_restrict_group_creation', '', 'yes'),
(1019, '_bp_enable_akismet', '1', 'yes'),
(1020, '_bp_enable_heartbeat_refresh', '1', 'yes'),
(1021, '_bp_force_buddybar', '', 'yes'),
(1022, '_bp_retain_bp_default', '', 'yes'),
(1023, '_bp_ignore_deprecated_code', '1', 'yes'),
(1024, 'widget_bp_core_login_widget', '', 'yes'),
(1025, 'widget_bp_core_members_widget', '', 'yes'),
(1026, 'widget_bp_core_whos_online_widget', '', 'yes'),
(1027, 'widget_bp_core_recently_active_widget', '', 'yes'),
(1028, 'widget_bp_groups_widget', '', 'yes'),
(1029, 'widget_bp_messages_sitewide_notices_widget', '', 'yes'),
(1034, 'widget_bp_nouveau_sidebar_object_nav_widget', 'a:1:{s:12:"_multiwidget";i:1;}', 'yes'),
(1035, 'bp-active-components', 'a:5:{s:8:"activity";i:1;s:7:"members";i:1;s:8:"settings";i:1;s:8:"xprofile";i:1;s:13:"notifications";i:1;}', 'yes'),
(1036, 'bp-pages', 'a:2:{s:8:"activity";i:52;s:7:"members";i:53;}', 'yes'),
(1037, '_bp_db_version', '11105', 'yes'),
(1038, 'widget_bp_latest_activities', 'a:1:{s:12:"_multiwidget";i:1;}', 'yes'),
(1122, '_site_transient_update_themes', 'O:8:"stdClass":4:{s:12:"last_checked";i:1546841770;s:7:"checked";a:3:{s:7:"content";s:5:"1.7.1";s:8:"simodecl";s:5:"1.0.0";s:10:"spicepress";s:5:"1.5.4";}s:8:"response";a:0:{}s:12:"translations";a:0:{}}', 'no'),
(1441, '_site_transient_timeout_browser_66a3633f27b37a924a68b6a63dccb641', '1547237999', 'no'),
(1442, '_site_transient_browser_66a3633f27b37a924a68b6a63dccb641', 'a:10:{s:4:"name";s:6:"Chrome";s:7:"version";s:12:"71.0.3578.98";s:8:"platform";s:7:"Android";s:10:"update_url";s:0:"";s:7:"img_src";s:0:"";s:11:"img_src_ssl";s:0:"";s:15:"current_version";s:0:"";s:7:"upgrade";b:0;s:8:"insecure";b:0;s:6:"mobile";b:1;}', 'no'),
(1500, '_site_transient_timeout_browser_0ac1f9240df96b3586c220faef490724', '1547390152', 'no'),
(1501, '_site_transient_browser_0ac1f9240df96b3586c220faef490724', 'a:10:{s:4:"name";s:6:"Chrome";s:7:"version";s:12:"71.0.3578.98";s:8:"platform";s:7:"Windows";s:10:"update_url";s:29:"https://www.google.com/chrome";s:7:"img_src";s:43:"http://s.w.org/images/browsers/chrome.png?1";s:11:"img_src_ssl";s:44:"https://s.w.org/images/browsers/chrome.png?1";s:15:"current_version";s:2:"18";s:7:"upgrade";b:0;s:8:"insecure";b:0;s:6:"mobile";b:0;}', 'no'),
(1502, '_site_transient_timeout_community-events-b66523ae62487e6a1bcfcedb9a1707dd', '1546828554', 'no'),
(1503, '_site_transient_community-events-b66523ae62487e6a1bcfcedb9a1707dd', 'a:2:{s:8:"location";a:1:{s:2:"ip";s:12:"178.117.98.0";}s:6:"events";a:5:{i:0;a:7:{s:4:"type";s:6:"meetup";s:5:"title";s:13:"WPinLille #27";s:3:"url";s:50:"https://www.meetup.com/WPinLille/events/256836737/";s:6:"meetup";s:9:"WPinLille";s:10:"meetup_url";s:33:"https://www.meetup.com/WPinLille/";s:4:"date";s:19:"2019-02-06 19:00:00";s:8:"location";a:4:{s:8:"location";s:13:"Lille, France";s:7:"country";s:2:"fr";s:8:"latitude";d:50.636425000000002683009370230138301849365234375;s:9:"longitude";d:3.0608360000000001122089088312350213527679443359375;}}i:1;a:7:{s:4:"type";s:8:"wordcamp";s:5:"title";s:19:"WordCamp Osnabrück";s:3:"url";s:37:"https://2019.osnabrueck.wordcamp.org/";s:6:"meetup";N;s:10:"meetup_url";N;s:4:"date";s:19:"2019-03-23 00:00:00";s:8:"location";a:4:{s:8:"location";s:19:"Osnabrück, Germany";s:7:"country";s:2:"DE";s:8:"latitude";d:52.27150999999999925194060779176652431488037109375;s:9:"longitude";d:8.0416000000000007474909580196253955364227294921875;}}i:2;a:7:{s:4:"type";s:8:"wordcamp";s:5:"title";s:15:"WordCamp London";s:3:"url";s:32:"https://2019.london.wordcamp.org";s:6:"meetup";N;s:10:"meetup_url";N;s:4:"date";s:19:"2019-04-06 00:00:00";s:8:"location";a:4:{s:8:"location";s:6:"London";s:7:"country";s:2:"GB";s:8:"latitude";d:51.55161739999999781502992846071720123291015625;s:9:"longitude";d:-0.11071459999999999634923142366460524499416351318359375;}}i:3;a:7:{s:4:"type";s:8:"wordcamp";s:5:"title";s:14:"WordCamp Paris";s:3:"url";s:32:"https://2019.paris.wordcamp.org/";s:6:"meetup";N;s:10:"meetup_url";N;s:4:"date";s:19:"2019-04-24 00:00:00";s:8:"location";a:4:{s:8:"location";s:5:"Paris";s:7:"country";s:2:"FR";s:8:"latitude";d:48.883581800000001749140210449695587158203125;s:9:"longitude";d:2.30957439999999980528855303418822586536407470703125;}}i:4;a:7:{s:4:"type";s:8:"wordcamp";s:5:"title";s:16:"WordCamp Bristol";s:3:"url";s:34:"https://2019.bristol.wordcamp.org/";s:6:"meetup";N;s:10:"meetup_url";N;s:4:"date";s:19:"2019-05-17 00:00:00";s:8:"location";a:4:{s:8:"location";s:7:"Bristol";s:7:"country";s:2:"GB";s:8:"latitude";d:51.4584171999999995250618667341768741607666015625;s:9:"longitude";d:-2.60297920000000004847606760449707508087158203125;}}}}', 'no'),
(1504, '_transient_timeout_feed_8e64dca91181d71a34f358f23e985a77', '1546828555', 'no'),
(1505, '_transient_feed_8e64dca91181d71a34f358f23e985a77', 'a:4:{s:5:"child";a:1:{s:0:"";a:1:{s:3:"rss";a:1:{i:0;a:6:{s:4:"data";s:3:"\n\n\n";s:7:"attribs";a:1:{s:0:"";a:1:{s:7:"version";s:3:"2.0";}}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";s:5:"child";a:1:{s:0:"";a:1:{s:7:"channel";a:1:{i:0;a:6:{s:4:"data";s:22:"\n	\n	\n	\n	\n	\n	\n	\n	\n	\n	\n	";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";s:5:"child";a:3:{s:0:"";a:7:{s:5:"title";a:1:{i:0;a:5:{s:4:"data";s:27:"Blog | Nederlands (België)";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"link";a:1:{i:0;a:5:{s:4:"data";s:27:"https://nl-be.wordpress.org";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:11:"description";a:1:{i:0;a:5:{s:4:"data";s:0:"";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:13:"lastBuildDate";a:1:{i:0;a:5:{s:4:"data";s:31:"Wed, 19 Dec 2018 10:48:06 +0000";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:8:"language";a:1:{i:0;a:5:{s:4:"data";s:5:"nl-BE";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:9:"generator";a:1:{i:0;a:5:{s:4:"data";s:42:"https://wordpress.org/?v=5.0.3-alpha-44387";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"item";a:1:{i:0;a:6:{s:4:"data";s:42:"\n		\n		\n		\n		\n		\n				\n\n		\n		\n				\n			\n		\n		";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";s:5:"child";a:5:{s:0:"";a:7:{s:5:"title";a:1:{i:0;a:5:{s:4:"data";s:48:"Introductie: Hoe kan je bijdragen aan WordPress?";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"link";a:1:{i:0;a:5:{s:4:"data";s:86:"https://nl-be.wordpress.org/2018/12/19/introductie-hoe-kan-je-bijdragen-aan-wordpress/";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:8:"comments";a:1:{i:0;a:5:{s:4:"data";s:94:"https://nl-be.wordpress.org/2018/12/19/introductie-hoe-kan-je-bijdragen-aan-wordpress/#respond";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:7:"pubDate";a:1:{i:0;a:5:{s:4:"data";s:31:"Wed, 19 Dec 2018 10:47:57 +0000";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:8:"category";a:1:{i:0;a:5:{s:4:"data";s:9:"WordPress";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"guid";a:1:{i:0;a:5:{s:4:"data";s:34:"https://nl-be.wordpress.org/?p=396";s:7:"attribs";a:1:{s:0:"";a:1:{s:11:"isPermaLink";s:5:"false";}}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:11:"description";a:1:{i:0;a:5:{s:4:"data";s:375:"Zonder de bijdrage van duizenden vrijwilligers zou WordPress nooit geworden zijn wat het nu is: ‘s werelds meest gebruikte beheersysteem voor websites.Bijdragen aan WordPress is makkelijker dan je denkt. In dit artikel lees je wat je kan doen en waar je kan starten. Verschillende overkoepelende teams﻿ Op make.wordpress.org vind je een overzicht van alle teams [&#8230;]";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:32:"http://purl.org/dc/elements/1.1/";a:1:{s:7:"creator";a:1:{i:0;a:5:{s:4:"data";s:11:"Dave Loodts";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:40:"http://purl.org/rss/1.0/modules/content/";a:1:{s:7:"encoded";a:1:{i:0;a:5:{s:4:"data";s:4036:"\n<p>Zonder de bijdrage van duizenden vrijwilligers zou WordPress nooit geworden zijn wat het nu is: ‘s werelds meest gebruikte beheersysteem voor websites.<br>Bijdragen aan WordPress is makkelijker dan je denkt.</p>\n\n\n\n<p>In dit artikel lees je wat je kan doen en waar je kan starten.<br></p>\n\n\n\n<h4><strong>Verschillende overkoepelende teams﻿</strong></h4>\n\n\n\n<p>Op <a href="https://make.wordpress.org/">make.wordpress.org</a> vind je een overzicht van alle teams die aan WordPress bijdragen.<br>Het bekendste team is ‘Core’: zij werken aan de software. Maar er bestaan ook teams waarbij je helemaal geen programmeerkennis moet hebben om bij te dragen: bv documentatie, vertalingen, WordPress.tv, enz.<br>Iedereen kan dus meewerken aan WordPress.<br></p>\n\n\n\n<p>De communicatie per team gebeurd momenteel via 2 kanalen:<br>&#8211; via wordpress.org: elk team heeft zijn eigen subsite (bv documentatie: <a href="https://make.wordpress.org/docs/">https://make.wordpress.org/docs/</a>)<br>&#8211; Via Slack: elk team heeft zijn eigen chatkanaal. Via Slack gebeurt de meeste interactie en ontvang je meestal het snelste antwoord op al jouw vragen betreffende ‘bijdragen aan WordPress’.<br>Meer info over WordPress op Slack. (<a href="https://wpbelgium.be/slack/">https://wpbelgium.be/slack/</a>)</p>\n\n\n\n<p><br>De meeste teams hebben ook een wekelijkse meeting via Slack.<br>Deze meetings zijn voor iedereen toegankelijk en vrijblijvend. <br>Sluit je zeker eens aan bij een bepaalde meeting om mee te kijken en/of te participeren.</p>\n\n\n\n<h4><strong>Waarom zou je bijdragen aan WordPress?</strong></h4>\n\n\n\n<p>Bijdragen aan WordPress levert jou nieuwe kennis op én je helpt meteen anderen. Je leert ook nieuwe mensen kennen en maakt deel uit de WordPress Community.<br></p>\n\n\n\n<h4><strong>Hoeveel kan ik bijdragen aan WordPress?</strong></h4>\n\n\n\n<p>Dat beslis je volledig zelf.<br>Binnen WordPress bestaat het concept: Five for the future.<br>Dit concept bepaalt dat het geweldig zou zijn als iedereen 5% van z’n tijd doneert aan WordPress. Per persoon komt dit bijvoorbeeld neer op 2 uurtjes per week.<br>Elke bijdrage aan WordPress is fantastisch, hoe groot of klein ook.<br>Voel je niet verplicht maar weet dat zelfs 1 uurtje per week een grote impact kan hebben op langere termijn.<br></p>\n\n\n\n<p><strong>Engels als voertaal, maar ook lokale Nederlandstalige teams!</strong></p>\n\n\n\n<p>In de overkoepelende teams wordt hoofdzakelijk ‘Engels’ gesproken.<br>Maar er bestaan ook lokale Nederlandstalige teams die op zoek zijn naar hulp.<br><br><strong>Vertalingen</strong></p>\n\n\n\n<p>WordPress is vertaald naar Nederlands (België) en Nederlands.<br>Respectievelijk: nl_be en nl.<br>Beide teams zijn steeds op zoek naar vrijwilligers om WordPress, plugins en themes te vertalen van Engels naar Nederlands.<br>NL-BE: <a href="https://translate.wordpress.org/locale/nl-be">https://translate.wordpress.org/locale/nl-be</a></p>\n\n\n\n<p>NL: <a href="https://translate.wordpress.org/locale/nl">https://translate.wordpress.org/locale/nl</a><br></p>\n\n\n\n<p><strong>Community</strong></p>\n\n\n\n<p>Via dit team kan je bijdragen aan WordCamps en Meetups.<br>Meetups zijn avond-bijeenkomsten waarbij WordPress enthousiastelingen samenkomen én babbelen/bijleren over WordPress.<br></p>\n\n\n\n<p>WordCamps zijn conferenties over WordPress. <br>De meeste WordCamps hebben een aparte Contributor Day waarbij elk bijdrage-team vertegenwoordigd is. </p>\n\n\n\n<p></p>\n\n\n\n<h3><strong>Waar te starten met bijdragen?</strong></h3>\n\n\n\n<p>Aarzel nooit om vragen te stellen! Dat is belangrijk om te weten.<br>Je zal zien: de WordPress Community is een fijne bende mensen die elkaar willen helpen.<br>Als je niet weet waar te starten met bijdragen; contacteer de Belgische WordPress Community op Slack:  <a href="https://wpbelgium.be/slack">https://wpbelgium.be/slack</a>.<br></p>\n\n\n\n<p>Bedankt voor jouw interesse om WordPress beter te maken.<br>We hopen dat je goesting hebt gekregen om bij te dragen.</p>\n\n\n\n<p>Alleszins, je bent van harte welkom!<br></p>\n";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:36:"http://wellformedweb.org/CommentAPI/";a:1:{s:10:"commentRss";a:1:{i:0;a:5:{s:4:"data";s:91:"https://nl-be.wordpress.org/2018/12/19/introductie-hoe-kan-je-bijdragen-aan-wordpress/feed/";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:38:"http://purl.org/rss/1.0/modules/slash/";a:1:{s:8:"comments";a:1:{i:0;a:5:{s:4:"data";s:1:"0";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}}}}}s:27:"http://www.w3.org/2005/Atom";a:1:{s:4:"link";a:1:{i:0;a:5:{s:4:"data";s:0:"";s:7:"attribs";a:1:{s:0:"";a:3:{s:4:"href";s:38:"https://nl-be.wordpress.org/news/feed/";s:3:"rel";s:4:"self";s:4:"type";s:19:"application/rss+xml";}}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:44:"http://purl.org/rss/1.0/modules/syndication/";a:2:{s:12:"updatePeriod";a:1:{i:0;a:5:{s:4:"data";s:6:"hourly";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:15:"updateFrequency";a:1:{i:0;a:5:{s:4:"data";s:1:"1";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}}}}}}}}}}s:4:"type";i:128;s:7:"headers";O:42:"Requests_Utility_CaseInsensitiveDictionary":1:{s:7:"\0*\0data";a:8:{s:6:"server";s:5:"nginx";s:4:"date";s:29:"Sun, 06 Jan 2019 14:35:55 GMT";s:12:"content-type";s:34:"application/rss+xml; charset=UTF-8";s:6:"x-olaf";s:3:"⛄";s:13:"last-modified";s:29:"Sun, 06 Jan 2019 14:27:36 GMT";s:4:"link";s:64:"<https://nl-be.wordpress.org/wp-json/>; rel="https://api.w.org/"";s:15:"x-frame-options";s:10:"SAMEORIGIN";s:4:"x-nc";s:9:"HIT ord 1";}}s:5:"build";s:14:"20180926095457";}', 'no'),
(1506, '_transient_timeout_feed_mod_8e64dca91181d71a34f358f23e985a77', '1546828555', 'no'),
(1507, '_transient_feed_mod_8e64dca91181d71a34f358f23e985a77', '1546785355', 'no'),
(1508, '_transient_timeout_feed_1c269280ae232c07e3cfc7cb1c339538', '1546828555', 'no');
INSERT INTO `wp_options` (`option_id`, `option_name`, `option_value`, `autoload`) VALUES
(1509, '_transient_feed_1c269280ae232c07e3cfc7cb1c339538', 'a:4:{s:5:"child";a:1:{s:0:"";a:1:{s:3:"rss";a:1:{i:0;a:6:{s:4:"data";s:3:"\n\n\n";s:7:"attribs";a:1:{s:0:"";a:1:{s:7:"version";s:3:"2.0";}}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";s:5:"child";a:1:{s:0:"";a:1:{s:7:"channel";a:1:{i:0;a:6:{s:4:"data";s:22:"\n	\n	\n	\n	\n	\n	\n	\n	\n	\n	\n	";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";s:5:"child";a:3:{s:0:"";a:7:{s:5:"title";a:1:{i:0;a:5:{s:4:"data";s:20:"Nederlands (België)";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"link";a:1:{i:0;a:5:{s:4:"data";s:27:"https://nl-be.wordpress.org";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:11:"description";a:1:{i:0;a:5:{s:4:"data";s:0:"";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:13:"lastBuildDate";a:1:{i:0;a:5:{s:4:"data";s:31:"Wed, 19 Dec 2018 10:48:06 +0000";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:8:"language";a:1:{i:0;a:5:{s:4:"data";s:5:"nl-BE";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:9:"generator";a:1:{i:0;a:5:{s:4:"data";s:42:"https://wordpress.org/?v=5.0.3-alpha-44387";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"item";a:1:{i:0;a:6:{s:4:"data";s:42:"\n		\n		\n		\n		\n		\n				\n\n		\n		\n				\n			\n		\n		";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";s:5:"child";a:5:{s:0:"";a:7:{s:5:"title";a:1:{i:0;a:5:{s:4:"data";s:48:"Introductie: Hoe kan je bijdragen aan WordPress?";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"link";a:1:{i:0;a:5:{s:4:"data";s:86:"https://nl-be.wordpress.org/2018/12/19/introductie-hoe-kan-je-bijdragen-aan-wordpress/";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:8:"comments";a:1:{i:0;a:5:{s:4:"data";s:94:"https://nl-be.wordpress.org/2018/12/19/introductie-hoe-kan-je-bijdragen-aan-wordpress/#respond";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:7:"pubDate";a:1:{i:0;a:5:{s:4:"data";s:31:"Wed, 19 Dec 2018 10:47:57 +0000";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:8:"category";a:1:{i:0;a:5:{s:4:"data";s:9:"WordPress";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"guid";a:1:{i:0;a:5:{s:4:"data";s:34:"https://nl-be.wordpress.org/?p=396";s:7:"attribs";a:1:{s:0:"";a:1:{s:11:"isPermaLink";s:5:"false";}}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:11:"description";a:1:{i:0;a:5:{s:4:"data";s:375:"Zonder de bijdrage van duizenden vrijwilligers zou WordPress nooit geworden zijn wat het nu is: ‘s werelds meest gebruikte beheersysteem voor websites.Bijdragen aan WordPress is makkelijker dan je denkt. In dit artikel lees je wat je kan doen en waar je kan starten. Verschillende overkoepelende teams﻿ Op make.wordpress.org vind je een overzicht van alle teams [&#8230;]";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:32:"http://purl.org/dc/elements/1.1/";a:1:{s:7:"creator";a:1:{i:0;a:5:{s:4:"data";s:11:"Dave Loodts";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:40:"http://purl.org/rss/1.0/modules/content/";a:1:{s:7:"encoded";a:1:{i:0;a:5:{s:4:"data";s:4036:"\n<p>Zonder de bijdrage van duizenden vrijwilligers zou WordPress nooit geworden zijn wat het nu is: ‘s werelds meest gebruikte beheersysteem voor websites.<br>Bijdragen aan WordPress is makkelijker dan je denkt.</p>\n\n\n\n<p>In dit artikel lees je wat je kan doen en waar je kan starten.<br></p>\n\n\n\n<h4><strong>Verschillende overkoepelende teams﻿</strong></h4>\n\n\n\n<p>Op <a href="https://make.wordpress.org/">make.wordpress.org</a> vind je een overzicht van alle teams die aan WordPress bijdragen.<br>Het bekendste team is ‘Core’: zij werken aan de software. Maar er bestaan ook teams waarbij je helemaal geen programmeerkennis moet hebben om bij te dragen: bv documentatie, vertalingen, WordPress.tv, enz.<br>Iedereen kan dus meewerken aan WordPress.<br></p>\n\n\n\n<p>De communicatie per team gebeurd momenteel via 2 kanalen:<br>&#8211; via wordpress.org: elk team heeft zijn eigen subsite (bv documentatie: <a href="https://make.wordpress.org/docs/">https://make.wordpress.org/docs/</a>)<br>&#8211; Via Slack: elk team heeft zijn eigen chatkanaal. Via Slack gebeurt de meeste interactie en ontvang je meestal het snelste antwoord op al jouw vragen betreffende ‘bijdragen aan WordPress’.<br>Meer info over WordPress op Slack. (<a href="https://wpbelgium.be/slack/">https://wpbelgium.be/slack/</a>)</p>\n\n\n\n<p><br>De meeste teams hebben ook een wekelijkse meeting via Slack.<br>Deze meetings zijn voor iedereen toegankelijk en vrijblijvend. <br>Sluit je zeker eens aan bij een bepaalde meeting om mee te kijken en/of te participeren.</p>\n\n\n\n<h4><strong>Waarom zou je bijdragen aan WordPress?</strong></h4>\n\n\n\n<p>Bijdragen aan WordPress levert jou nieuwe kennis op én je helpt meteen anderen. Je leert ook nieuwe mensen kennen en maakt deel uit de WordPress Community.<br></p>\n\n\n\n<h4><strong>Hoeveel kan ik bijdragen aan WordPress?</strong></h4>\n\n\n\n<p>Dat beslis je volledig zelf.<br>Binnen WordPress bestaat het concept: Five for the future.<br>Dit concept bepaalt dat het geweldig zou zijn als iedereen 5% van z’n tijd doneert aan WordPress. Per persoon komt dit bijvoorbeeld neer op 2 uurtjes per week.<br>Elke bijdrage aan WordPress is fantastisch, hoe groot of klein ook.<br>Voel je niet verplicht maar weet dat zelfs 1 uurtje per week een grote impact kan hebben op langere termijn.<br></p>\n\n\n\n<p><strong>Engels als voertaal, maar ook lokale Nederlandstalige teams!</strong></p>\n\n\n\n<p>In de overkoepelende teams wordt hoofdzakelijk ‘Engels’ gesproken.<br>Maar er bestaan ook lokale Nederlandstalige teams die op zoek zijn naar hulp.<br><br><strong>Vertalingen</strong></p>\n\n\n\n<p>WordPress is vertaald naar Nederlands (België) en Nederlands.<br>Respectievelijk: nl_be en nl.<br>Beide teams zijn steeds op zoek naar vrijwilligers om WordPress, plugins en themes te vertalen van Engels naar Nederlands.<br>NL-BE: <a href="https://translate.wordpress.org/locale/nl-be">https://translate.wordpress.org/locale/nl-be</a></p>\n\n\n\n<p>NL: <a href="https://translate.wordpress.org/locale/nl">https://translate.wordpress.org/locale/nl</a><br></p>\n\n\n\n<p><strong>Community</strong></p>\n\n\n\n<p>Via dit team kan je bijdragen aan WordCamps en Meetups.<br>Meetups zijn avond-bijeenkomsten waarbij WordPress enthousiastelingen samenkomen én babbelen/bijleren over WordPress.<br></p>\n\n\n\n<p>WordCamps zijn conferenties over WordPress. <br>De meeste WordCamps hebben een aparte Contributor Day waarbij elk bijdrage-team vertegenwoordigd is. </p>\n\n\n\n<p></p>\n\n\n\n<h3><strong>Waar te starten met bijdragen?</strong></h3>\n\n\n\n<p>Aarzel nooit om vragen te stellen! Dat is belangrijk om te weten.<br>Je zal zien: de WordPress Community is een fijne bende mensen die elkaar willen helpen.<br>Als je niet weet waar te starten met bijdragen; contacteer de Belgische WordPress Community op Slack:  <a href="https://wpbelgium.be/slack">https://wpbelgium.be/slack</a>.<br></p>\n\n\n\n<p>Bedankt voor jouw interesse om WordPress beter te maken.<br>We hopen dat je goesting hebt gekregen om bij te dragen.</p>\n\n\n\n<p>Alleszins, je bent van harte welkom!<br></p>\n";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:36:"http://wellformedweb.org/CommentAPI/";a:1:{s:10:"commentRss";a:1:{i:0;a:5:{s:4:"data";s:91:"https://nl-be.wordpress.org/2018/12/19/introductie-hoe-kan-je-bijdragen-aan-wordpress/feed/";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:38:"http://purl.org/rss/1.0/modules/slash/";a:1:{s:8:"comments";a:1:{i:0;a:5:{s:4:"data";s:1:"0";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}}}}}s:27:"http://www.w3.org/2005/Atom";a:1:{s:4:"link";a:1:{i:0;a:5:{s:4:"data";s:0:"";s:7:"attribs";a:1:{s:0:"";a:3:{s:4:"href";s:33:"https://nl-be.wordpress.org/feed/";s:3:"rel";s:4:"self";s:4:"type";s:19:"application/rss+xml";}}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:44:"http://purl.org/rss/1.0/modules/syndication/";a:2:{s:12:"updatePeriod";a:1:{i:0;a:5:{s:4:"data";s:6:"hourly";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:15:"updateFrequency";a:1:{i:0;a:5:{s:4:"data";s:1:"1";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}}}}}}}}}}s:4:"type";i:128;s:7:"headers";O:42:"Requests_Utility_CaseInsensitiveDictionary":1:{s:7:"\0*\0data";a:8:{s:6:"server";s:5:"nginx";s:4:"date";s:29:"Sun, 06 Jan 2019 14:35:55 GMT";s:12:"content-type";s:34:"application/rss+xml; charset=UTF-8";s:6:"x-olaf";s:3:"⛄";s:13:"last-modified";s:29:"Wed, 19 Dec 2018 10:48:06 GMT";s:4:"link";s:64:"<https://nl-be.wordpress.org/wp-json/>; rel="https://api.w.org/"";s:15:"x-frame-options";s:10:"SAMEORIGIN";s:4:"x-nc";s:9:"HIT ord 1";}}s:5:"build";s:14:"20180926095457";}', 'no'),
(1510, '_transient_timeout_feed_mod_1c269280ae232c07e3cfc7cb1c339538', '1546828555', 'no'),
(1511, '_transient_feed_mod_1c269280ae232c07e3cfc7cb1c339538', '1546785355', 'no'),
(1512, '_transient_timeout_dash_v2_229b2bb9b15d070ed7f17b4a26d0ca24', '1546828555', 'no'),
(1513, '_transient_dash_v2_229b2bb9b15d070ed7f17b4a26d0ca24', '<div class="rss-widget"><ul><li><a class=''rsswidget'' href=''https://nl-be.wordpress.org/2018/12/19/introductie-hoe-kan-je-bijdragen-aan-wordpress/''>Introductie: Hoe kan je bijdragen aan WordPress?</a></li></ul></div><div class="rss-widget"><ul><li><a class=''rsswidget'' href=''https://nl-be.wordpress.org/2018/12/19/introductie-hoe-kan-je-bijdragen-aan-wordpress/''>Introductie: Hoe kan je bijdragen aan WordPress?</a></li></ul></div>', 'no'),
(1524, '_site_transient_timeout_theme_roots', '1546843570', 'no'),
(1525, '_site_transient_theme_roots', 'a:3:{s:7:"content";s:7:"/themes";s:8:"simodecl";s:7:"/themes";s:10:"spicepress";s:7:"/themes";}', 'no'),
(1526, '_site_transient_update_plugins', 'O:8:"stdClass":5:{s:12:"last_checked";i:1546841771;s:7:"checked";a:10:{s:41:"acf-to-rest-api/class-acf-to-rest-api.php";s:5:"3.1.0";s:30:"advanced-custom-fields/acf.php";s:5:"5.7.9";s:19:"akismet/akismet.php";s:3:"4.1";s:36:"contact-form-7/wp-contact-form-7.php";s:5:"5.1.1";s:41:"functions-simodecl/functions-simodecl.php";s:5:"1.0.0";s:9:"hello.php";s:3:"1.7";s:47:"jwt-authentication-for-wp-rest-api/jwt-auth.php";s:5:"1.2.5";s:21:"napp-cpt/napp-cpt.php";s:5:"1.0.0";s:37:"user-role-editor/user-role-editor.php";s:4:"4.47";s:29:"wp-rest-user/wp-rest-user.php";s:5:"1.3.3";}s:8:"response";a:1:{s:37:"user-role-editor/user-role-editor.php";O:8:"stdClass":12:{s:2:"id";s:30:"w.org/plugins/user-role-editor";s:4:"slug";s:16:"user-role-editor";s:6:"plugin";s:37:"user-role-editor/user-role-editor.php";s:11:"new_version";s:4:"4.48";s:3:"url";s:47:"https://wordpress.org/plugins/user-role-editor/";s:7:"package";s:64:"https://downloads.wordpress.org/plugin/user-role-editor.4.48.zip";s:5:"icons";a:2:{s:2:"2x";s:69:"https://ps.w.org/user-role-editor/assets/icon-256x256.jpg?rev=1020390";s:2:"1x";s:69:"https://ps.w.org/user-role-editor/assets/icon-128x128.jpg?rev=1020390";}s:7:"banners";a:1:{s:2:"1x";s:71:"https://ps.w.org/user-role-editor/assets/banner-772x250.png?rev=1263116";}s:11:"banners_rtl";a:0:{}s:6:"tested";s:5:"5.0.2";s:12:"requires_php";b:0;s:13:"compatibility";O:8:"stdClass":0:{}}}s:12:"translations";a:0:{}s:9:"no_update";a:7:{s:41:"acf-to-rest-api/class-acf-to-rest-api.php";O:8:"stdClass":9:{s:2:"id";s:29:"w.org/plugins/acf-to-rest-api";s:4:"slug";s:15:"acf-to-rest-api";s:6:"plugin";s:41:"acf-to-rest-api/class-acf-to-rest-api.php";s:11:"new_version";s:5:"3.1.0";s:3:"url";s:46:"https://wordpress.org/plugins/acf-to-rest-api/";s:7:"package";s:64:"https://downloads.wordpress.org/plugin/acf-to-rest-api.3.1.0.zip";s:5:"icons";a:2:{s:2:"2x";s:68:"https://ps.w.org/acf-to-rest-api/assets/icon-256x256.jpg?rev=1752896";s:2:"1x";s:68:"https://ps.w.org/acf-to-rest-api/assets/icon-128x128.jpg?rev=1752896";}s:7:"banners";a:2:{s:2:"2x";s:71:"https://ps.w.org/acf-to-rest-api/assets/banner-1544x500.jpg?rev=1752896";s:2:"1x";s:70:"https://ps.w.org/acf-to-rest-api/assets/banner-772x250.jpg?rev=1752896";}s:11:"banners_rtl";a:0:{}}s:30:"advanced-custom-fields/acf.php";O:8:"stdClass":9:{s:2:"id";s:36:"w.org/plugins/advanced-custom-fields";s:4:"slug";s:22:"advanced-custom-fields";s:6:"plugin";s:30:"advanced-custom-fields/acf.php";s:11:"new_version";s:5:"5.7.9";s:3:"url";s:53:"https://wordpress.org/plugins/advanced-custom-fields/";s:7:"package";s:71:"https://downloads.wordpress.org/plugin/advanced-custom-fields.5.7.9.zip";s:5:"icons";a:2:{s:2:"2x";s:75:"https://ps.w.org/advanced-custom-fields/assets/icon-256x256.png?rev=1082746";s:2:"1x";s:75:"https://ps.w.org/advanced-custom-fields/assets/icon-128x128.png?rev=1082746";}s:7:"banners";a:2:{s:2:"2x";s:78:"https://ps.w.org/advanced-custom-fields/assets/banner-1544x500.jpg?rev=1729099";s:2:"1x";s:77:"https://ps.w.org/advanced-custom-fields/assets/banner-772x250.jpg?rev=1729102";}s:11:"banners_rtl";a:0:{}}s:19:"akismet/akismet.php";O:8:"stdClass":9:{s:2:"id";s:21:"w.org/plugins/akismet";s:4:"slug";s:7:"akismet";s:6:"plugin";s:19:"akismet/akismet.php";s:11:"new_version";s:3:"4.1";s:3:"url";s:38:"https://wordpress.org/plugins/akismet/";s:7:"package";s:54:"https://downloads.wordpress.org/plugin/akismet.4.1.zip";s:5:"icons";a:2:{s:2:"2x";s:59:"https://ps.w.org/akismet/assets/icon-256x256.png?rev=969272";s:2:"1x";s:59:"https://ps.w.org/akismet/assets/icon-128x128.png?rev=969272";}s:7:"banners";a:1:{s:2:"1x";s:61:"https://ps.w.org/akismet/assets/banner-772x250.jpg?rev=479904";}s:11:"banners_rtl";a:0:{}}s:36:"contact-form-7/wp-contact-form-7.php";O:8:"stdClass":9:{s:2:"id";s:28:"w.org/plugins/contact-form-7";s:4:"slug";s:14:"contact-form-7";s:6:"plugin";s:36:"contact-form-7/wp-contact-form-7.php";s:11:"new_version";s:5:"5.1.1";s:3:"url";s:45:"https://wordpress.org/plugins/contact-form-7/";s:7:"package";s:63:"https://downloads.wordpress.org/plugin/contact-form-7.5.1.1.zip";s:5:"icons";a:2:{s:2:"2x";s:66:"https://ps.w.org/contact-form-7/assets/icon-256x256.png?rev=984007";s:2:"1x";s:66:"https://ps.w.org/contact-form-7/assets/icon-128x128.png?rev=984007";}s:7:"banners";a:2:{s:2:"2x";s:69:"https://ps.w.org/contact-form-7/assets/banner-1544x500.png?rev=860901";s:2:"1x";s:68:"https://ps.w.org/contact-form-7/assets/banner-772x250.png?rev=880427";}s:11:"banners_rtl";a:0:{}}s:9:"hello.php";O:8:"stdClass":9:{s:2:"id";s:25:"w.org/plugins/hello-dolly";s:4:"slug";s:11:"hello-dolly";s:6:"plugin";s:9:"hello.php";s:11:"new_version";s:3:"1.6";s:3:"url";s:42:"https://wordpress.org/plugins/hello-dolly/";s:7:"package";s:58:"https://downloads.wordpress.org/plugin/hello-dolly.1.6.zip";s:5:"icons";a:2:{s:2:"2x";s:63:"https://ps.w.org/hello-dolly/assets/icon-256x256.jpg?rev=969907";s:2:"1x";s:63:"https://ps.w.org/hello-dolly/assets/icon-128x128.jpg?rev=969907";}s:7:"banners";a:1:{s:2:"1x";s:65:"https://ps.w.org/hello-dolly/assets/banner-772x250.png?rev=478342";}s:11:"banners_rtl";a:0:{}}s:47:"jwt-authentication-for-wp-rest-api/jwt-auth.php";O:8:"stdClass":9:{s:2:"id";s:48:"w.org/plugins/jwt-authentication-for-wp-rest-api";s:4:"slug";s:34:"jwt-authentication-for-wp-rest-api";s:6:"plugin";s:47:"jwt-authentication-for-wp-rest-api/jwt-auth.php";s:11:"new_version";s:5:"1.2.5";s:3:"url";s:65:"https://wordpress.org/plugins/jwt-authentication-for-wp-rest-api/";s:7:"package";s:83:"https://downloads.wordpress.org/plugin/jwt-authentication-for-wp-rest-api.1.2.5.zip";s:5:"icons";a:2:{s:2:"1x";s:79:"https://ps.w.org/jwt-authentication-for-wp-rest-api/assets/icon.svg?rev=1238484";s:3:"svg";s:79:"https://ps.w.org/jwt-authentication-for-wp-rest-api/assets/icon.svg?rev=1238484";}s:7:"banners";a:1:{s:2:"1x";s:89:"https://ps.w.org/jwt-authentication-for-wp-rest-api/assets/banner-772x250.jpg?rev=1238480";}s:11:"banners_rtl";a:0:{}}s:29:"wp-rest-user/wp-rest-user.php";O:8:"stdClass":9:{s:2:"id";s:26:"w.org/plugins/wp-rest-user";s:4:"slug";s:12:"wp-rest-user";s:6:"plugin";s:29:"wp-rest-user/wp-rest-user.php";s:11:"new_version";s:5:"1.3.3";s:3:"url";s:43:"https://wordpress.org/plugins/wp-rest-user/";s:7:"package";s:55:"https://downloads.wordpress.org/plugin/wp-rest-user.zip";s:5:"icons";a:2:{s:2:"2x";s:65:"https://ps.w.org/wp-rest-user/assets/icon-256x256.png?rev=1866223";s:2:"1x";s:65:"https://ps.w.org/wp-rest-user/assets/icon-128x128.png?rev=1866223";}s:7:"banners";a:0:{}s:11:"banners_rtl";a:0:{}}}}', 'no');

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `wp_postmeta`
--

CREATE TABLE IF NOT EXISTS `wp_postmeta` (
  `meta_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `post_id` bigint(20) unsigned NOT NULL DEFAULT '0',
  `meta_key` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `meta_value` longtext COLLATE utf8mb4_unicode_ci,
  PRIMARY KEY (`meta_id`),
  KEY `post_id` (`post_id`),
  KEY `meta_key` (`meta_key`(191))
) ENGINE=InnoDB  DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci AUTO_INCREMENT=457 ;

--
-- Gegevens worden uitgevoerd voor tabel `wp_postmeta`
--

INSERT INTO `wp_postmeta` (`meta_id`, `post_id`, `meta_key`, `meta_value`) VALUES
(1, 2, '_wp_page_template', 'default'),
(2, 3, '_wp_page_template', 'default'),
(18, 14, '_edit_lock', '1546791382:1'),
(19, 14, '_edit_last', '1'),
(20, 17, '_edit_lock', '1545406604:1'),
(21, 17, '_edit_last', '1'),
(28, 19, 'test', 'testy'),
(29, 19, '_test', 'field_5bfbcf2ae9eaf'),
(56, 25, '_wp_attached_file', '2018/11/profielfotofacebook.jpg'),
(57, 25, '_wp_attachment_metadata', 'a:5:{s:5:"width";i:960;s:6:"height";i:960;s:4:"file";s:31:"2018/11/profielfotofacebook.jpg";s:5:"sizes";a:3:{s:9:"thumbnail";a:4:{s:4:"file";s:31:"profielfotofacebook-150x150.jpg";s:5:"width";i:150;s:6:"height";i:150;s:9:"mime-type";s:10:"image/jpeg";}s:6:"medium";a:4:{s:4:"file";s:31:"profielfotofacebook-300x300.jpg";s:5:"width";i:300;s:6:"height";i:300;s:9:"mime-type";s:10:"image/jpeg";}s:12:"medium_large";a:4:{s:4:"file";s:31:"profielfotofacebook-768x768.jpg";s:5:"width";i:768;s:6:"height";i:768;s:9:"mime-type";s:10:"image/jpeg";}}s:10:"image_meta";a:12:{s:8:"aperture";s:1:"0";s:6:"credit";s:0:"";s:6:"camera";s:0:"";s:7:"caption";s:0:"";s:17:"created_timestamp";s:1:"0";s:9:"copyright";s:0:"";s:12:"focal_length";s:1:"0";s:3:"iso";s:1:"0";s:13:"shutter_speed";s:1:"0";s:5:"title";s:0:"";s:11:"orientation";s:1:"0";s:8:"keywords";a:0:{}}}'),
(58, 26, '_wp_attached_file', '2018/11/MaN.png'),
(59, 26, '_wp_attachment_metadata', 'a:5:{s:5:"width";i:104;s:6:"height";i:128;s:4:"file";s:15:"2018/11/MaN.png";s:5:"sizes";a:0:{}s:10:"image_meta";a:12:{s:8:"aperture";s:1:"0";s:6:"credit";s:0:"";s:6:"camera";s:0:"";s:7:"caption";s:0:"";s:17:"created_timestamp";s:1:"0";s:9:"copyright";s:0:"";s:12:"focal_length";s:1:"0";s:3:"iso";s:1:"0";s:13:"shutter_speed";s:1:"0";s:5:"title";s:0:"";s:11:"orientation";s:1:"0";s:8:"keywords";a:0:{}}}'),
(60, 27, '_wp_attached_file', '2018/11/kanye-west.png'),
(61, 27, '_wp_attachment_metadata', 'a:5:{s:5:"width";i:807;s:6:"height";i:481;s:4:"file";s:22:"2018/11/kanye-west.png";s:5:"sizes";a:3:{s:9:"thumbnail";a:4:{s:4:"file";s:22:"kanye-west-150x150.png";s:5:"width";i:150;s:6:"height";i:150;s:9:"mime-type";s:9:"image/png";}s:6:"medium";a:4:{s:4:"file";s:22:"kanye-west-300x179.png";s:5:"width";i:300;s:6:"height";i:179;s:9:"mime-type";s:9:"image/png";}s:12:"medium_large";a:4:{s:4:"file";s:22:"kanye-west-768x458.png";s:5:"width";i:768;s:6:"height";i:458;s:9:"mime-type";s:9:"image/png";}}s:10:"image_meta";a:12:{s:8:"aperture";s:1:"0";s:6:"credit";s:0:"";s:6:"camera";s:0:"";s:7:"caption";s:0:"";s:17:"created_timestamp";s:1:"0";s:9:"copyright";s:0:"";s:12:"focal_length";s:1:"0";s:3:"iso";s:1:"0";s:13:"shutter_speed";s:1:"0";s:5:"title";s:0:"";s:11:"orientation";s:1:"0";s:8:"keywords";a:0:{}}}'),
(68, 28, '_wp_attached_file', '2018/11/KKomrade.png'),
(69, 28, '_wp_attachment_metadata', 'a:5:{s:5:"width";i:300;s:6:"height";i:300;s:4:"file";s:20:"2018/11/KKomrade.png";s:5:"sizes";a:1:{s:9:"thumbnail";a:4:{s:4:"file";s:20:"KKomrade-150x150.png";s:5:"width";i:150;s:6:"height";i:150;s:9:"mime-type";s:9:"image/png";}}s:10:"image_meta";a:12:{s:8:"aperture";s:1:"0";s:6:"credit";s:0:"";s:6:"camera";s:0:"";s:7:"caption";s:0:"";s:17:"created_timestamp";s:1:"0";s:9:"copyright";s:0:"";s:12:"focal_length";s:1:"0";s:3:"iso";s:1:"0";s:13:"shutter_speed";s:1:"0";s:5:"title";s:0:"";s:11:"orientation";s:1:"0";s:8:"keywords";a:0:{}}}'),
(72, 33, '_wp_attached_file', '2018/11/desert.jpg'),
(73, 33, '_wp_attachment_metadata', 'a:5:{s:5:"width";i:3840;s:6:"height";i:2160;s:4:"file";s:18:"2018/11/desert.jpg";s:5:"sizes";a:4:{s:9:"thumbnail";a:4:{s:4:"file";s:18:"desert-150x150.jpg";s:5:"width";i:150;s:6:"height";i:150;s:9:"mime-type";s:10:"image/jpeg";}s:6:"medium";a:4:{s:4:"file";s:18:"desert-300x169.jpg";s:5:"width";i:300;s:6:"height";i:169;s:9:"mime-type";s:10:"image/jpeg";}s:12:"medium_large";a:4:{s:4:"file";s:18:"desert-768x432.jpg";s:5:"width";i:768;s:6:"height";i:432;s:9:"mime-type";s:10:"image/jpeg";}s:5:"large";a:4:{s:4:"file";s:19:"desert-1024x576.jpg";s:5:"width";i:1024;s:6:"height";i:576;s:9:"mime-type";s:10:"image/jpeg";}}s:10:"image_meta";a:12:{s:8:"aperture";s:1:"0";s:6:"credit";s:0:"";s:6:"camera";s:0:"";s:7:"caption";s:0:"";s:17:"created_timestamp";s:1:"0";s:9:"copyright";s:0:"";s:12:"focal_length";s:1:"0";s:3:"iso";s:1:"0";s:13:"shutter_speed";s:1:"0";s:5:"title";s:0:"";s:11:"orientation";s:1:"1";s:8:"keywords";a:0:{}}}'),
(78, 37, '_wp_attached_file', '2018/12/placeholder.jpg'),
(79, 37, '_wp_attachment_metadata', 'a:5:{s:5:"width";i:500;s:6:"height";i:500;s:4:"file";s:23:"2018/12/placeholder.jpg";s:5:"sizes";a:2:{s:9:"thumbnail";a:4:{s:4:"file";s:23:"placeholder-150x150.jpg";s:5:"width";i:150;s:6:"height";i:150;s:9:"mime-type";s:10:"image/jpeg";}s:6:"medium";a:4:{s:4:"file";s:23:"placeholder-300x300.jpg";s:5:"width";i:300;s:6:"height";i:300;s:9:"mime-type";s:10:"image/jpeg";}}s:10:"image_meta";a:12:{s:8:"aperture";s:1:"0";s:6:"credit";s:0:"";s:6:"camera";s:0:"";s:7:"caption";s:0:"";s:17:"created_timestamp";s:1:"0";s:9:"copyright";s:0:"";s:12:"focal_length";s:1:"0";s:3:"iso";s:1:"0";s:13:"shutter_speed";s:1:"0";s:5:"title";s:0:"";s:11:"orientation";s:1:"0";s:8:"keywords";a:0:{}}}'),
(80, 38, 'test', 'Arty'),
(81, 38, '_test', 'field_5bfbcf2ae9eaf'),
(84, 42, '_wp_attached_file', '2018/12/dp-zalm-met-gebakken-patatjes.jpg'),
(85, 42, '_wp_attachment_metadata', 'a:5:{s:5:"width";i:800;s:6:"height";i:1200;s:4:"file";s:41:"2018/12/dp-zalm-met-gebakken-patatjes.jpg";s:5:"sizes";a:4:{s:9:"thumbnail";a:4:{s:4:"file";s:41:"dp-zalm-met-gebakken-patatjes-150x150.jpg";s:5:"width";i:150;s:6:"height";i:150;s:9:"mime-type";s:10:"image/jpeg";}s:6:"medium";a:4:{s:4:"file";s:41:"dp-zalm-met-gebakken-patatjes-200x300.jpg";s:5:"width";i:200;s:6:"height";i:300;s:9:"mime-type";s:10:"image/jpeg";}s:12:"medium_large";a:4:{s:4:"file";s:42:"dp-zalm-met-gebakken-patatjes-768x1152.jpg";s:5:"width";i:768;s:6:"height";i:1152;s:9:"mime-type";s:10:"image/jpeg";}s:5:"large";a:4:{s:4:"file";s:42:"dp-zalm-met-gebakken-patatjes-683x1024.jpg";s:5:"width";i:683;s:6:"height";i:1024;s:9:"mime-type";s:10:"image/jpeg";}}s:10:"image_meta";a:12:{s:8:"aperture";s:1:"0";s:6:"credit";s:0:"";s:6:"camera";s:0:"";s:7:"caption";s:0:"";s:17:"created_timestamp";s:1:"0";s:9:"copyright";s:0:"";s:12:"focal_length";s:1:"0";s:3:"iso";s:1:"0";s:13:"shutter_speed";s:1:"0";s:5:"title";s:0:"";s:11:"orientation";s:1:"0";s:8:"keywords";a:0:{}}}'),
(91, 49, '_edit_lock', '1545654406:1'),
(92, 49, '_edit_last', '1'),
(93, 49, '_thumbnail_id', '27'),
(94, 50, '_edit_lock', '1545770291:1'),
(95, 51, '_wp_attached_file', '2018/12/kanye-west-1.jpg'),
(96, 51, '_wp_attachment_metadata', 'a:5:{s:5:"width";i:2000;s:6:"height";i:1335;s:4:"file";s:24:"2018/12/kanye-west-1.jpg";s:5:"sizes";a:4:{s:9:"thumbnail";a:4:{s:4:"file";s:24:"kanye-west-1-150x150.jpg";s:5:"width";i:150;s:6:"height";i:150;s:9:"mime-type";s:10:"image/jpeg";}s:6:"medium";a:4:{s:4:"file";s:24:"kanye-west-1-300x200.jpg";s:5:"width";i:300;s:6:"height";i:200;s:9:"mime-type";s:10:"image/jpeg";}s:12:"medium_large";a:4:{s:4:"file";s:24:"kanye-west-1-768x513.jpg";s:5:"width";i:768;s:6:"height";i:513;s:9:"mime-type";s:10:"image/jpeg";}s:5:"large";a:4:{s:4:"file";s:25:"kanye-west-1-1024x684.jpg";s:5:"width";i:1024;s:6:"height";i:684;s:9:"mime-type";s:10:"image/jpeg";}}s:10:"image_meta";a:12:{s:8:"aperture";s:1:"0";s:6:"credit";s:14:"Scott Dudelson";s:6:"camera";s:0:"";s:7:"caption";s:184:"ANAHEIM, CA - JUNE 03:  Rapper Kanye West performs onstage at the Power 106 Powerhouse show at Honda Center on June 3, 2016 in Anaheim, California.  (Photo by Scott Dudelson/FilmMagic)";s:17:"created_timestamp";s:1:"0";s:9:"copyright";s:19:"2016 Scott Dudelson";s:12:"focal_length";s:1:"0";s:3:"iso";s:1:"0";s:13:"shutter_speed";s:1:"0";s:5:"title";s:8:"90926096";s:11:"orientation";s:1:"1";s:8:"keywords";a:0:{}}}'),
(97, 50, '_edit_last', '1'),
(98, 50, '_thumbnail_id', '51'),
(99, 70, '_edit_lock', '1546599654:1'),
(100, 70, '_edit_last', '1'),
(102, 17, '_wp_trash_meta_status', 'publish'),
(103, 17, '_wp_trash_meta_time', '1545406759'),
(104, 17, '_wp_desired_post_slug', 'group_5bfbcf25b8999'),
(105, 18, '_wp_trash_meta_status', 'publish'),
(106, 18, '_wp_trash_meta_time', '1545406759'),
(107, 18, '_wp_desired_post_slug', 'field_5bfbcf2ae9eaf'),
(108, 77, '_edit_lock', '1545660215:1'),
(109, 77, '_edit_last', '1'),
(116, 50, 'likes', 'a:2:{i:0;i:1;i:1;i:29;}'),
(117, 50, '_likes', 'field_5c1d092dca022'),
(118, 49, 'likes', ''),
(119, 49, '_likes', 'field_5c1d092dca022'),
(120, 38, '_edit_lock', '1545654260:1'),
(121, 50, 'avatar', ''),
(122, 50, '_avatar', 'field_5bfbb409ee5e1'),
(123, 50, 'school', ''),
(124, 50, '_school', 'field_5bfbc0fe8c5db'),
(125, 50, 'goaldate', ''),
(126, 50, '_goaldate', 'field_5bfd3a84c97be'),
(127, 50, 'goalamount', ''),
(128, 50, '_goalamount', 'field_5bfd3aa9c97bf'),
(129, 50, 'sleeptype', ''),
(130, 50, '_sleeptype', 'field_5c0429eeb7a68'),
(131, 50, 'following', ''),
(132, 50, '_following', 'field_5c042a29b58ce'),
(133, 49, 'avatar', ''),
(134, 49, '_avatar', 'field_5bfbb409ee5e1'),
(135, 49, 'school', ''),
(136, 49, '_school', 'field_5bfbc0fe8c5db'),
(137, 49, 'goaldate', ''),
(138, 49, '_goaldate', 'field_5bfd3a84c97be'),
(139, 49, 'goalamount', ''),
(140, 49, '_goalamount', 'field_5bfd3aa9c97bf'),
(141, 49, 'sleeptype', ''),
(142, 49, '_sleeptype', 'field_5c0429eeb7a68'),
(143, 49, 'following', ''),
(144, 49, '_following', 'field_5c042a29b58ce'),
(154, 82, '_wp_attached_file', '2018/12/cat_face_glasses_thick_65455_3840x2400.jpg'),
(155, 82, '_wp_attachment_metadata', 'a:5:{s:5:"width";i:3840;s:6:"height";i:2400;s:4:"file";s:50:"2018/12/cat_face_glasses_thick_65455_3840x2400.jpg";s:5:"sizes";a:4:{s:9:"thumbnail";a:4:{s:4:"file";s:50:"cat_face_glasses_thick_65455_3840x2400-150x150.jpg";s:5:"width";i:150;s:6:"height";i:150;s:9:"mime-type";s:10:"image/jpeg";}s:6:"medium";a:4:{s:4:"file";s:50:"cat_face_glasses_thick_65455_3840x2400-300x188.jpg";s:5:"width";i:300;s:6:"height";i:188;s:9:"mime-type";s:10:"image/jpeg";}s:12:"medium_large";a:4:{s:4:"file";s:50:"cat_face_glasses_thick_65455_3840x2400-768x480.jpg";s:5:"width";i:768;s:6:"height";i:480;s:9:"mime-type";s:10:"image/jpeg";}s:5:"large";a:4:{s:4:"file";s:51:"cat_face_glasses_thick_65455_3840x2400-1024x640.jpg";s:5:"width";i:1024;s:6:"height";i:640;s:9:"mime-type";s:10:"image/jpeg";}}s:10:"image_meta";a:12:{s:8:"aperture";s:1:"0";s:6:"credit";s:0:"";s:6:"camera";s:0:"";s:7:"caption";s:0:"";s:17:"created_timestamp";s:1:"0";s:9:"copyright";s:0:"";s:12:"focal_length";s:1:"0";s:3:"iso";s:1:"0";s:13:"shutter_speed";s:1:"0";s:5:"title";s:0:"";s:11:"orientation";s:1:"0";s:8:"keywords";a:0:{}}}'),
(156, 83, '_edit_lock', '1546639836:1'),
(157, 83, '_edit_last', '1'),
(158, 83, 'likes', 'a:2:{i:0;i:1;i:1;i:29;}'),
(159, 83, '_likes', 'field_5c1d092dca022'),
(160, 83, '_thumbnail_id', '82'),
(181, 95, '_edit_lock', '1546094672:1'),
(182, 95, '_edit_last', '1'),
(184, 101, '_edit_lock', '1546094717:1'),
(185, 101, '_edit_last', '1'),
(186, 101, 'type', 'Text'),
(187, 101, '_type', 'field_5c2787760a6fb'),
(188, 101, 'text', 'Lever overdag voldoende inspanningen'),
(189, 101, '_text', 'field_5c2787b30a6fc'),
(190, 102, '_edit_last', '1'),
(191, 102, 'type', 'Text'),
(192, 102, '_type', 'field_5c2787760a6fb'),
(193, 102, 'text', 'Stel je lichaam overdag voldoende bloot aan licht, en slaap in totale duisternis'),
(194, 102, '_text', 'field_5c2787b30a6fc'),
(195, 102, '_edit_lock', '1546094732:1'),
(196, 103, '_edit_lock', '1546094754:1'),
(197, 103, '_edit_last', '1'),
(198, 103, 'type', 'Text'),
(199, 103, '_type', 'field_5c2787760a6fb'),
(200, 103, 'text', 'Luister naar je lichaam als je je moe voelt en blijf niet te lang in je bed liggen als je de slaap niet kunt vatten'),
(201, 103, '_text', 'field_5c2787b30a6fc'),
(202, 104, '_edit_lock', '1546094861:1'),
(203, 104, '_edit_last', '1'),
(204, 104, 'type', 'Text'),
(205, 104, '_type', 'field_5c2787760a6fb'),
(206, 104, 'text', 'Vermijd tabak, alcohol, thee, koffie en andere energiedranken voor het slapengaan'),
(207, 104, '_text', 'field_5c2787b30a6fc'),
(208, 105, '_wp_attached_file', '2018/12/10-sleep-pic2.jpg'),
(209, 105, '_wp_attachment_metadata', 'a:5:{s:5:"width";i:780;s:6:"height";i:780;s:4:"file";s:25:"2018/12/10-sleep-pic2.jpg";s:5:"sizes";a:3:{s:9:"thumbnail";a:4:{s:4:"file";s:25:"10-sleep-pic2-150x150.jpg";s:5:"width";i:150;s:6:"height";i:150;s:9:"mime-type";s:10:"image/jpeg";}s:6:"medium";a:4:{s:4:"file";s:25:"10-sleep-pic2-300x300.jpg";s:5:"width";i:300;s:6:"height";i:300;s:9:"mime-type";s:10:"image/jpeg";}s:12:"medium_large";a:4:{s:4:"file";s:25:"10-sleep-pic2-768x768.jpg";s:5:"width";i:768;s:6:"height";i:768;s:9:"mime-type";s:10:"image/jpeg";}}s:10:"image_meta";a:12:{s:8:"aperture";s:3:"2.8";s:6:"credit";s:0:"";s:6:"camera";s:24:"Canon PowerShot SD770 IS";s:7:"caption";s:0:"";s:17:"created_timestamp";s:10:"1348469380";s:9:"copyright";s:0:"";s:12:"focal_length";s:3:"6.2";s:3:"iso";s:3:"200";s:13:"shutter_speed";s:17:"0.076923076923077";s:5:"title";s:0:"";s:11:"orientation";s:1:"1";s:8:"keywords";a:0:{}}}'),
(210, 106, '_wp_attached_file', '2018/12/anxiety-1024x900.jpg'),
(211, 106, '_wp_attachment_metadata', 'a:5:{s:5:"width";i:1024;s:6:"height";i:900;s:4:"file";s:28:"2018/12/anxiety-1024x900.jpg";s:5:"sizes";a:4:{s:9:"thumbnail";a:4:{s:4:"file";s:28:"anxiety-1024x900-150x150.jpg";s:5:"width";i:150;s:6:"height";i:150;s:9:"mime-type";s:10:"image/jpeg";}s:6:"medium";a:4:{s:4:"file";s:28:"anxiety-1024x900-300x264.jpg";s:5:"width";i:300;s:6:"height";i:264;s:9:"mime-type";s:10:"image/jpeg";}s:12:"medium_large";a:4:{s:4:"file";s:28:"anxiety-1024x900-768x675.jpg";s:5:"width";i:768;s:6:"height";i:675;s:9:"mime-type";s:10:"image/jpeg";}s:5:"large";a:4:{s:4:"file";s:29:"anxiety-1024x900-1024x900.jpg";s:5:"width";i:1024;s:6:"height";i:900;s:9:"mime-type";s:10:"image/jpeg";}}s:10:"image_meta";a:12:{s:8:"aperture";s:1:"0";s:6:"credit";s:0:"";s:6:"camera";s:0:"";s:7:"caption";s:0:"";s:17:"created_timestamp";s:1:"0";s:9:"copyright";s:0:"";s:12:"focal_length";s:1:"0";s:3:"iso";s:1:"0";s:13:"shutter_speed";s:1:"0";s:5:"title";s:0:"";s:11:"orientation";s:1:"0";s:8:"keywords";a:0:{}}}'),
(212, 107, '_edit_lock', '1546094932:1'),
(213, 107, '_edit_last', '1'),
(214, 107, 'type', 'Image'),
(215, 107, '_type', 'field_5c2787760a6fb'),
(216, 107, 'image', '106'),
(217, 107, '_image', 'field_5c2787fd0a6fd'),
(218, 108, '_edit_lock', '1546095685:1'),
(219, 108, '_edit_last', '1'),
(220, 108, 'type', 'Text'),
(221, 108, '_type', 'field_5c2787760a6fb'),
(222, 108, 'text', 'Denk eraan te ontspannen voor het slapengaan en neem je stress niet mee naar bed'),
(223, 108, '_text', 'field_5c2787b30a6fc'),
(224, 109, '_edit_lock', '1546095678:1'),
(225, 109, '_edit_last', '1'),
(226, 109, 'type', 'Video'),
(227, 109, '_type', 'field_5c2787760a6fb'),
(228, 109, 'video', 'https://www.youtube.com/embed/hm1cLjtsqoY'),
(229, 109, '_video', 'field_5c2788380a6fe'),
(230, 110, '_edit_last', '1'),
(231, 110, 'type', 'Text'),
(232, 110, '_type', 'field_5c2787760a6fb'),
(233, 110, 'text', 'Zorg dat je slaapkamertemperatuur zo''n 18 °C bedraagt en verlucht je kamer geregeld'),
(234, 110, '_text', 'field_5c2787b30a6fc'),
(235, 110, '_edit_lock', '1546096022:1'),
(236, 111, '_edit_last', '1'),
(237, 111, 'type', 'Text'),
(238, 111, '_type', 'field_5c2787760a6fb'),
(239, 111, 'text', 'Ga niet met een lege of overvolle maag slapen'),
(240, 111, '_text', 'field_5c2787b30a6fc'),
(241, 111, '_edit_lock', '1546097344:1'),
(242, 112, '_edit_lock', '1546120961:1'),
(243, 112, '_edit_last', '1'),
(244, 112, 'type', 'Image'),
(245, 112, '_type', 'field_5c2787760a6fb'),
(246, 112, 'image', '105'),
(247, 112, '_image', 'field_5c2787fd0a6fd'),
(248, 113, '_edit_lock', '1546599507:1'),
(249, 113, '_edit_last', '1'),
(250, 113, 'sleep_start', '2018-12-27 01:00:00'),
(251, 113, '_sleep_start', 'field_5c1cd74be4878'),
(252, 113, 'sleep_end', '2018-12-27 10:00:00'),
(253, 113, '_sleep_end', 'field_5c1cd773e4879'),
(254, 113, 'sleep_deep', '2.5'),
(255, 113, '_sleep_deep', 'field_5c1cd788e487a'),
(256, 113, 'sleep_rest', '4'),
(257, 113, '_sleep_rest', 'field_5c1cd89fe487b'),
(296, 121, 'sleep_start', '12/27/2018 11:30 pm'),
(297, 121, '_sleep_start', 'field_5c1cd74be4878'),
(298, 121, 'sleep_end', '12/28/2018 8:30 am'),
(299, 121, '_sleep_end', 'field_5c1cd773e4879'),
(300, 121, 'sleep_deep', '3'),
(301, 121, '_sleep_deep', 'field_5c1cd788e487a'),
(302, 121, 'sleep_rest', '3'),
(303, 121, '_sleep_rest', 'field_5c1cd89fe487b'),
(319, 122, '_wp_attached_file', '2019/01/Morning-Person.jpg'),
(320, 122, '_wp_attachment_metadata', 'a:5:{s:5:"width";i:1280;s:6:"height";i:720;s:4:"file";s:26:"2019/01/Morning-Person.jpg";s:5:"sizes";a:4:{s:9:"thumbnail";a:4:{s:4:"file";s:26:"Morning-Person-150x150.jpg";s:5:"width";i:150;s:6:"height";i:150;s:9:"mime-type";s:10:"image/jpeg";}s:6:"medium";a:4:{s:4:"file";s:26:"Morning-Person-300x169.jpg";s:5:"width";i:300;s:6:"height";i:169;s:9:"mime-type";s:10:"image/jpeg";}s:12:"medium_large";a:4:{s:4:"file";s:26:"Morning-Person-768x432.jpg";s:5:"width";i:768;s:6:"height";i:432;s:9:"mime-type";s:10:"image/jpeg";}s:5:"large";a:4:{s:4:"file";s:27:"Morning-Person-1024x576.jpg";s:5:"width";i:1024;s:6:"height";i:576;s:9:"mime-type";s:10:"image/jpeg";}}s:10:"image_meta";a:12:{s:8:"aperture";s:1:"0";s:6:"credit";s:0:"";s:6:"camera";s:0:"";s:7:"caption";s:0:"";s:17:"created_timestamp";s:1:"0";s:9:"copyright";s:0:"";s:12:"focal_length";s:1:"0";s:3:"iso";s:1:"0";s:13:"shutter_speed";s:1:"0";s:5:"title";s:0:"";s:11:"orientation";s:1:"0";s:8:"keywords";a:0:{}}}'),
(321, 123, '_wp_attached_file', '2019/01/Sleep-Lover.jpg'),
(322, 123, '_wp_attachment_metadata', 'a:5:{s:5:"width";i:225;s:6:"height";i:225;s:4:"file";s:23:"2019/01/Sleep-Lover.jpg";s:5:"sizes";a:1:{s:9:"thumbnail";a:4:{s:4:"file";s:23:"Sleep-Lover-150x150.jpg";s:5:"width";i:150;s:6:"height";i:150;s:9:"mime-type";s:10:"image/jpeg";}}s:10:"image_meta";a:12:{s:8:"aperture";s:1:"0";s:6:"credit";s:0:"";s:6:"camera";s:0:"";s:7:"caption";s:0:"";s:17:"created_timestamp";s:1:"0";s:9:"copyright";s:0:"";s:12:"focal_length";s:1:"0";s:3:"iso";s:1:"0";s:13:"shutter_speed";s:1:"0";s:5:"title";s:0:"";s:11:"orientation";s:1:"0";s:8:"keywords";a:0:{}}}'),
(323, 124, '_wp_attached_file', '2019/01/Restless-Bat.jpg'),
(324, 124, '_wp_attachment_metadata', 'a:5:{s:5:"width";i:600;s:6:"height";i:427;s:4:"file";s:24:"2019/01/Restless-Bat.jpg";s:5:"sizes";a:2:{s:9:"thumbnail";a:4:{s:4:"file";s:24:"Restless-Bat-150x150.jpg";s:5:"width";i:150;s:6:"height";i:150;s:9:"mime-type";s:10:"image/jpeg";}s:6:"medium";a:4:{s:4:"file";s:24:"Restless-Bat-300x214.jpg";s:5:"width";i:300;s:6:"height";i:214;s:9:"mime-type";s:10:"image/jpeg";}}s:10:"image_meta";a:12:{s:8:"aperture";s:1:"0";s:6:"credit";s:0:"";s:6:"camera";s:0:"";s:7:"caption";s:0:"";s:17:"created_timestamp";s:1:"0";s:9:"copyright";s:0:"";s:12:"focal_length";s:1:"0";s:3:"iso";s:1:"0";s:13:"shutter_speed";s:1:"0";s:5:"title";s:0:"";s:11:"orientation";s:1:"0";s:8:"keywords";a:0:{}}}'),
(325, 124, '_edit_lock', '1546456483:1'),
(326, 125, '_wp_attached_file', '2019/01/Screen-Addict.png'),
(327, 125, '_wp_attachment_metadata', 'a:5:{s:5:"width";i:694;s:6:"height";i:300;s:4:"file";s:25:"2019/01/Screen-Addict.png";s:5:"sizes";a:2:{s:9:"thumbnail";a:4:{s:4:"file";s:25:"Screen-Addict-150x150.png";s:5:"width";i:150;s:6:"height";i:150;s:9:"mime-type";s:9:"image/png";}s:6:"medium";a:4:{s:4:"file";s:25:"Screen-Addict-300x130.png";s:5:"width";i:300;s:6:"height";i:130;s:9:"mime-type";s:9:"image/png";}}s:10:"image_meta";a:12:{s:8:"aperture";s:1:"0";s:6:"credit";s:0:"";s:6:"camera";s:0:"";s:7:"caption";s:0:"";s:17:"created_timestamp";s:1:"0";s:9:"copyright";s:0:"";s:12:"focal_length";s:1:"0";s:3:"iso";s:1:"0";s:13:"shutter_speed";s:1:"0";s:5:"title";s:0:"";s:11:"orientation";s:1:"0";s:8:"keywords";a:0:{}}}'),
(328, 126, '_wp_attached_file', '2019/01/Panda.jpg'),
(329, 126, '_wp_attachment_metadata', 'a:5:{s:5:"width";i:425;s:6:"height";i:425;s:4:"file";s:17:"2019/01/Panda.jpg";s:5:"sizes";a:2:{s:9:"thumbnail";a:4:{s:4:"file";s:17:"Panda-150x150.jpg";s:5:"width";i:150;s:6:"height";i:150;s:9:"mime-type";s:10:"image/jpeg";}s:6:"medium";a:4:{s:4:"file";s:17:"Panda-300x300.jpg";s:5:"width";i:300;s:6:"height";i:300;s:9:"mime-type";s:10:"image/jpeg";}}s:10:"image_meta";a:12:{s:8:"aperture";s:1:"0";s:6:"credit";s:0:"";s:6:"camera";s:0:"";s:7:"caption";s:0:"";s:17:"created_timestamp";s:1:"0";s:9:"copyright";s:0:"";s:12:"focal_length";s:1:"0";s:3:"iso";s:1:"0";s:13:"shutter_speed";s:1:"0";s:5:"title";s:0:"";s:11:"orientation";s:1:"0";s:8:"keywords";a:0:{}}}'),
(330, 127, '_wp_attached_file', '2019/01/Sleepyhead.jpg'),
(331, 127, '_wp_attachment_metadata', 'a:5:{s:5:"width";i:450;s:6:"height";i:262;s:4:"file";s:22:"2019/01/Sleepyhead.jpg";s:5:"sizes";a:2:{s:9:"thumbnail";a:4:{s:4:"file";s:22:"Sleepyhead-150x150.jpg";s:5:"width";i:150;s:6:"height";i:150;s:9:"mime-type";s:10:"image/jpeg";}s:6:"medium";a:4:{s:4:"file";s:22:"Sleepyhead-300x175.jpg";s:5:"width";i:300;s:6:"height";i:175;s:9:"mime-type";s:10:"image/jpeg";}}s:10:"image_meta";a:12:{s:8:"aperture";s:1:"0";s:6:"credit";s:0:"";s:6:"camera";s:0:"";s:7:"caption";s:0:"";s:17:"created_timestamp";s:1:"0";s:9:"copyright";s:0:"";s:12:"focal_length";s:1:"0";s:3:"iso";s:1:"0";s:13:"shutter_speed";s:1:"0";s:5:"title";s:0:"";s:11:"orientation";s:1:"0";s:8:"keywords";a:0:{}}}'),
(332, 128, '_wp_attached_file', '2019/01/King-of-Sleep.jpg'),
(333, 128, '_wp_attachment_metadata', 'a:5:{s:5:"width";i:400;s:6:"height";i:288;s:4:"file";s:25:"2019/01/King-of-Sleep.jpg";s:5:"sizes";a:2:{s:9:"thumbnail";a:4:{s:4:"file";s:25:"King-of-Sleep-150x150.jpg";s:5:"width";i:150;s:6:"height";i:150;s:9:"mime-type";s:10:"image/jpeg";}s:6:"medium";a:4:{s:4:"file";s:25:"King-of-Sleep-300x216.jpg";s:5:"width";i:300;s:6:"height";i:216;s:9:"mime-type";s:10:"image/jpeg";}}s:10:"image_meta";a:12:{s:8:"aperture";s:1:"0";s:6:"credit";s:0:"";s:6:"camera";s:0:"";s:7:"caption";s:0:"";s:17:"created_timestamp";s:1:"0";s:9:"copyright";s:0:"";s:12:"focal_length";s:1:"0";s:3:"iso";s:1:"0";s:13:"shutter_speed";s:1:"0";s:5:"title";s:0:"";s:11:"orientation";s:1:"0";s:8:"keywords";a:0:{}}}'),
(334, 129, 'sleep_start', '2018-12-28 23:00:00'),
(335, 129, '_sleep_start', 'field_5c1cd74be4878'),
(336, 129, 'sleep_end', '2018-12-29 08:00:00'),
(337, 129, '_sleep_end', 'field_5c1cd773e4879'),
(338, 129, 'sleep_deep', '5'),
(339, 129, '_sleep_deep', 'field_5c1cd788e487a'),
(340, 129, 'sleep_rest', '5'),
(341, 129, '_sleep_rest', 'field_5c1cd89fe487b'),
(342, 130, 'sleep_start', '2018-12-29 23:30:00'),
(343, 130, '_sleep_start', 'field_5c1cd74be4878'),
(344, 130, 'sleep_end', '2018-12-30 07:30:00'),
(345, 130, '_sleep_end', 'field_5c1cd773e4879'),
(346, 130, 'sleep_deep', '4'),
(347, 130, '_sleep_deep', 'field_5c1cd788e487a'),
(348, 130, 'sleep_rest', '4'),
(349, 130, '_sleep_rest', 'field_5c1cd89fe487b'),
(350, 131, 'sleep_start', '2018-12-31 00:30:00'),
(351, 131, '_sleep_start', 'field_5c1cd74be4878'),
(352, 131, 'sleep_end', '2018-12-31 07:30:00'),
(353, 131, '_sleep_end', 'field_5c1cd773e4879'),
(354, 131, 'sleep_deep', '3.5'),
(355, 131, '_sleep_deep', 'field_5c1cd788e487a'),
(356, 131, 'sleep_rest', '2.5'),
(357, 131, '_sleep_rest', 'field_5c1cd89fe487b'),
(358, 131, '_edit_lock', '1546599591:1'),
(359, 131, '_edit_last', '1'),
(360, 130, '_edit_lock', '1546599472:1'),
(361, 130, '_edit_last', '1'),
(362, 129, '_edit_lock', '1546599498:1'),
(363, 129, '_edit_last', '1'),
(364, 121, '_edit_lock', '1546599503:1'),
(365, 132, 'sleep_start', '2019-01-01 08:30:00'),
(366, 132, '_sleep_start', 'field_5c1cd74be4878'),
(367, 132, 'sleep_end', '2019-01-01 10:30:00'),
(368, 132, '_sleep_end', 'field_5c1cd773e4879'),
(369, 132, 'sleep_deep', '2.5'),
(370, 132, '_sleep_deep', 'field_5c1cd788e487a'),
(371, 132, 'sleep_rest', '1'),
(372, 132, '_sleep_rest', 'field_5c1cd89fe487b'),
(373, 133, 'sleep_start', '01/01/2019 10:30 pm'),
(374, 133, '_sleep_start', 'field_5c1cd74be4878'),
(375, 133, 'sleep_end', '01/02/2019 9:30 am'),
(376, 133, '_sleep_end', 'field_5c1cd773e4879'),
(377, 133, 'sleep_deep', '5'),
(378, 133, '_sleep_deep', 'field_5c1cd788e487a'),
(379, 133, 'sleep_rest', '5'),
(380, 133, '_sleep_rest', 'field_5c1cd89fe487b'),
(381, 132, '_edit_lock', '1546599636:1'),
(382, 132, '_edit_last', '1'),
(383, 134, 'sleep_start', '01/03/2019 12:00 am'),
(384, 134, '_sleep_start', 'field_5c1cd74be4878'),
(385, 134, 'sleep_end', '01/03/2019 9:00 am'),
(386, 134, '_sleep_end', 'field_5c1cd773e4879'),
(387, 134, 'sleep_deep', '3.5'),
(388, 134, '_sleep_deep', 'field_5c1cd788e487a'),
(389, 134, 'sleep_rest', '4.5'),
(390, 134, '_sleep_rest', 'field_5c1cd89fe487b'),
(399, 136, 'sleep_start', '01/03/2019 11:19 pm'),
(400, 136, '_sleep_start', 'field_5c1cd74be4878'),
(401, 136, 'sleep_end', '01/04/2019 8:19 am'),
(402, 136, '_sleep_end', 'field_5c1cd773e4879'),
(403, 136, 'sleep_deep', '3'),
(404, 136, '_sleep_deep', 'field_5c1cd788e487a'),
(405, 136, 'sleep_rest', '3'),
(406, 136, '_sleep_rest', 'field_5c1cd89fe487b'),
(411, 137, 'sleep_start', '01/04/2019 11:50 pm'),
(412, 137, '_sleep_start', 'field_5c1cd74be4878'),
(413, 137, 'sleep_end', '01/05/2019 8:00 am'),
(414, 137, '_sleep_end', 'field_5c1cd773e4879'),
(415, 137, 'sleep_deep', '3.5'),
(416, 137, '_sleep_deep', 'field_5c1cd788e487a'),
(417, 137, 'sleep_rest', '3'),
(418, 137, '_sleep_rest', 'field_5c1cd89fe487b'),
(419, 138, '_wp_attached_file', '2019/01/received_208080433280014.png'),
(420, 138, '_wp_attachment_metadata', 'a:5:{s:5:"width";i:772;s:6:"height";i:766;s:4:"file";s:36:"2019/01/received_208080433280014.png";s:5:"sizes";a:3:{s:9:"thumbnail";a:4:{s:4:"file";s:36:"received_208080433280014-150x150.png";s:5:"width";i:150;s:6:"height";i:150;s:9:"mime-type";s:9:"image/png";}s:6:"medium";a:4:{s:4:"file";s:36:"received_208080433280014-300x298.png";s:5:"width";i:300;s:6:"height";i:298;s:9:"mime-type";s:9:"image/png";}s:12:"medium_large";a:4:{s:4:"file";s:36:"received_208080433280014-768x762.png";s:5:"width";i:768;s:6:"height";i:762;s:9:"mime-type";s:9:"image/png";}}s:10:"image_meta";a:12:{s:8:"aperture";s:1:"0";s:6:"credit";s:0:"";s:6:"camera";s:0:"";s:7:"caption";s:0:"";s:17:"created_timestamp";s:1:"0";s:9:"copyright";s:0:"";s:12:"focal_length";s:1:"0";s:3:"iso";s:1:"0";s:13:"shutter_speed";s:1:"0";s:5:"title";s:0:"";s:11:"orientation";s:1:"0";s:8:"keywords";a:0:{}}}'),
(421, 139, '_thumbnail_id', '138'),
(422, 140, '_wp_attached_file', '2019/01/received_208080433280014-1.png'),
(423, 140, '_wp_attachment_metadata', 'a:5:{s:5:"width";i:772;s:6:"height";i:766;s:4:"file";s:38:"2019/01/received_208080433280014-1.png";s:5:"sizes";a:3:{s:9:"thumbnail";a:4:{s:4:"file";s:38:"received_208080433280014-1-150x150.png";s:5:"width";i:150;s:6:"height";i:150;s:9:"mime-type";s:9:"image/png";}s:6:"medium";a:4:{s:4:"file";s:38:"received_208080433280014-1-300x298.png";s:5:"width";i:300;s:6:"height";i:298;s:9:"mime-type";s:9:"image/png";}s:12:"medium_large";a:4:{s:4:"file";s:38:"received_208080433280014-1-768x762.png";s:5:"width";i:768;s:6:"height";i:762;s:9:"mime-type";s:9:"image/png";}}s:10:"image_meta";a:12:{s:8:"aperture";s:1:"0";s:6:"credit";s:0:"";s:6:"camera";s:0:"";s:7:"caption";s:0:"";s:17:"created_timestamp";s:1:"0";s:9:"copyright";s:0:"";s:12:"focal_length";s:1:"0";s:3:"iso";s:1:"0";s:13:"shutter_speed";s:1:"0";s:5:"title";s:0:"";s:11:"orientation";s:1:"0";s:8:"keywords";a:0:{}}}'),
(424, 139, '_edit_lock', '1546691745:1'),
(425, 139, '_edit_last', '1'),
(426, 139, 'likes', 'a:2:{i:0;i:29;i:1;i:30;}'),
(427, 139, '_likes', 'field_5c1d092dca022'),
(428, 141, '_wp_attached_file', '2019/01/ScreenShot_17-10-21_17-32-55-000.jpg'),
(429, 141, '_wp_attachment_metadata', 'a:5:{s:5:"width";i:1920;s:6:"height";i:1080;s:4:"file";s:44:"2019/01/ScreenShot_17-10-21_17-32-55-000.jpg";s:5:"sizes";a:4:{s:9:"thumbnail";a:4:{s:4:"file";s:44:"ScreenShot_17-10-21_17-32-55-000-150x150.jpg";s:5:"width";i:150;s:6:"height";i:150;s:9:"mime-type";s:10:"image/jpeg";}s:6:"medium";a:4:{s:4:"file";s:44:"ScreenShot_17-10-21_17-32-55-000-300x169.jpg";s:5:"width";i:300;s:6:"height";i:169;s:9:"mime-type";s:10:"image/jpeg";}s:12:"medium_large";a:4:{s:4:"file";s:44:"ScreenShot_17-10-21_17-32-55-000-768x432.jpg";s:5:"width";i:768;s:6:"height";i:432;s:9:"mime-type";s:10:"image/jpeg";}s:5:"large";a:4:{s:4:"file";s:45:"ScreenShot_17-10-21_17-32-55-000-1024x576.jpg";s:5:"width";i:1024;s:6:"height";i:576;s:9:"mime-type";s:10:"image/jpeg";}}s:10:"image_meta";a:12:{s:8:"aperture";s:1:"0";s:6:"credit";s:0:"";s:6:"camera";s:0:"";s:7:"caption";s:0:"";s:17:"created_timestamp";s:1:"0";s:9:"copyright";s:0:"";s:12:"focal_length";s:1:"0";s:3:"iso";s:1:"0";s:13:"shutter_speed";s:1:"0";s:5:"title";s:0:"";s:11:"orientation";s:1:"0";s:8:"keywords";a:0:{}}}'),
(430, 142, '_thumbnail_id', '141'),
(431, 142, '_edit_lock', '1546785964:1'),
(432, 142, '_edit_last', '1'),
(433, 142, 'likes', ''),
(434, 142, '_likes', 'field_5c1d092dca022'),
(435, 144, '_wp_attached_file', '2019/01/astronaut.png'),
(436, 144, '_wp_attachment_metadata', 'a:5:{s:5:"width";i:2739;s:6:"height";i:2160;s:4:"file";s:21:"2019/01/astronaut.png";s:5:"sizes";a:4:{s:9:"thumbnail";a:4:{s:4:"file";s:21:"astronaut-150x150.png";s:5:"width";i:150;s:6:"height";i:150;s:9:"mime-type";s:9:"image/png";}s:6:"medium";a:4:{s:4:"file";s:21:"astronaut-300x237.png";s:5:"width";i:300;s:6:"height";i:237;s:9:"mime-type";s:9:"image/png";}s:12:"medium_large";a:4:{s:4:"file";s:21:"astronaut-768x606.png";s:5:"width";i:768;s:6:"height";i:606;s:9:"mime-type";s:9:"image/png";}s:5:"large";a:4:{s:4:"file";s:22:"astronaut-1024x808.png";s:5:"width";i:1024;s:6:"height";i:808;s:9:"mime-type";s:9:"image/png";}}s:10:"image_meta";a:12:{s:8:"aperture";s:1:"0";s:6:"credit";s:0:"";s:6:"camera";s:0:"";s:7:"caption";s:0:"";s:17:"created_timestamp";s:1:"0";s:9:"copyright";s:0:"";s:12:"focal_length";s:1:"0";s:3:"iso";s:1:"0";s:13:"shutter_speed";s:1:"0";s:5:"title";s:0:"";s:11:"orientation";s:1:"0";s:8:"keywords";a:0:{}}}'),
(437, 145, '_wp_attached_file', '2019/01/astronaut-1.png'),
(438, 145, '_wp_attachment_metadata', 'a:5:{s:5:"width";i:2739;s:6:"height";i:2160;s:4:"file";s:23:"2019/01/astronaut-1.png";s:5:"sizes";a:4:{s:9:"thumbnail";a:4:{s:4:"file";s:23:"astronaut-1-150x150.png";s:5:"width";i:150;s:6:"height";i:150;s:9:"mime-type";s:9:"image/png";}s:6:"medium";a:4:{s:4:"file";s:23:"astronaut-1-300x237.png";s:5:"width";i:300;s:6:"height";i:237;s:9:"mime-type";s:9:"image/png";}s:12:"medium_large";a:4:{s:4:"file";s:23:"astronaut-1-768x606.png";s:5:"width";i:768;s:6:"height";i:606;s:9:"mime-type";s:9:"image/png";}s:5:"large";a:4:{s:4:"file";s:24:"astronaut-1-1024x808.png";s:5:"width";i:1024;s:6:"height";i:808;s:9:"mime-type";s:9:"image/png";}}s:10:"image_meta";a:12:{s:8:"aperture";s:1:"0";s:6:"credit";s:0:"";s:6:"camera";s:0:"";s:7:"caption";s:0:"";s:17:"created_timestamp";s:1:"0";s:9:"copyright";s:0:"";s:12:"focal_length";s:1:"0";s:3:"iso";s:1:"0";s:13:"shutter_speed";s:1:"0";s:5:"title";s:0:"";s:11:"orientation";s:1:"0";s:8:"keywords";a:0:{}}}'),
(439, 146, 'sleep_start', '01/06/2019 11:50 pm'),
(440, 146, '_sleep_start', 'field_5c1cd74be4878'),
(441, 146, 'sleep_end', '01/07/2019 8:00 am'),
(442, 146, '_sleep_end', 'field_5c1cd773e4879'),
(443, 146, 'sleep_deep', '4'),
(444, 146, '_sleep_deep', 'field_5c1cd788e487a'),
(445, 146, 'sleep_rest', '2.5'),
(446, 146, '_sleep_rest', 'field_5c1cd89fe487b'),
(447, 147, 'sleep_start', '01/08/2019 12:30 am'),
(448, 147, '_sleep_start', 'field_5c1cd74be4878'),
(449, 147, 'sleep_end', '01/08/2019 8:50 am'),
(450, 147, '_sleep_end', 'field_5c1cd773e4879'),
(451, 147, 'sleep_deep', '4.5'),
(452, 147, '_sleep_deep', 'field_5c1cd788e487a'),
(453, 147, 'sleep_rest', '2.5'),
(454, 147, '_sleep_rest', 'field_5c1cd89fe487b'),
(455, 148, '_wp_attached_file', '2019/01/IMG_20180316_181249.jpg'),
(456, 148, '_wp_attachment_metadata', 'a:5:{s:5:"width";i:4160;s:6:"height";i:3120;s:4:"file";s:31:"2019/01/IMG_20180316_181249.jpg";s:5:"sizes";a:4:{s:9:"thumbnail";a:4:{s:4:"file";s:31:"IMG_20180316_181249-150x150.jpg";s:5:"width";i:150;s:6:"height";i:150;s:9:"mime-type";s:10:"image/jpeg";}s:6:"medium";a:4:{s:4:"file";s:31:"IMG_20180316_181249-300x225.jpg";s:5:"width";i:300;s:6:"height";i:225;s:9:"mime-type";s:10:"image/jpeg";}s:12:"medium_large";a:4:{s:4:"file";s:31:"IMG_20180316_181249-768x576.jpg";s:5:"width";i:768;s:6:"height";i:576;s:9:"mime-type";s:10:"image/jpeg";}s:5:"large";a:4:{s:4:"file";s:32:"IMG_20180316_181249-1024x768.jpg";s:5:"width";i:1024;s:6:"height";i:768;s:9:"mime-type";s:10:"image/jpeg";}}s:10:"image_meta";a:12:{s:8:"aperture";s:1:"2";s:6:"credit";s:0:"";s:6:"camera";s:15:"ZTE BLADE V0800";s:7:"caption";s:0:"";s:17:"created_timestamp";s:10:"1521223969";s:9:"copyright";s:0:"";s:12:"focal_length";s:4:"3.57";s:3:"iso";s:3:"100";s:13:"shutter_speed";s:16:"0.03030303030303";s:5:"title";s:0:"";s:11:"orientation";s:1:"0";s:8:"keywords";a:0:{}}}');

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `wp_posts`
--

CREATE TABLE IF NOT EXISTS `wp_posts` (
  `ID` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `post_author` bigint(20) unsigned NOT NULL DEFAULT '0',
  `post_date` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `post_date_gmt` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `post_content` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `post_title` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `post_excerpt` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `post_status` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'publish',
  `comment_status` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'open',
  `ping_status` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'open',
  `post_password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `post_name` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `to_ping` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `pinged` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `post_modified` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `post_modified_gmt` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `post_content_filtered` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `post_parent` bigint(20) unsigned NOT NULL DEFAULT '0',
  `guid` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `menu_order` int(11) NOT NULL DEFAULT '0',
  `post_type` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'post',
  `post_mime_type` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `comment_count` bigint(20) NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`),
  KEY `post_name` (`post_name`(191)),
  KEY `type_status_date` (`post_type`,`post_status`,`post_date`,`ID`),
  KEY `post_parent` (`post_parent`),
  KEY `post_author` (`post_author`),
  KEY `anta_post_modified_gmt` (`post_modified_gmt`) USING BTREE,
  KEY `anta_post_date_gmt` (`post_date_gmt`) USING BTREE,
  KEY `anta_post_date` (`post_date`) USING BTREE,
  KEY `anta_post_type` (`post_type`) USING BTREE,
  KEY `anta_post_status` (`post_status`) USING BTREE,
  KEY `anta_post_modified` (`post_modified`) USING BTREE
) ENGINE=InnoDB  DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci AUTO_INCREMENT=149 ;

--
-- Gegevens worden uitgevoerd voor tabel `wp_posts`
--

INSERT INTO `wp_posts` (`ID`, `post_author`, `post_date`, `post_date_gmt`, `post_content`, `post_title`, `post_excerpt`, `post_status`, `comment_status`, `ping_status`, `post_password`, `post_name`, `to_ping`, `pinged`, `post_modified`, `post_modified_gmt`, `post_content_filtered`, `post_parent`, `guid`, `menu_order`, `post_type`, `post_mime_type`, `comment_count`) VALUES
(2, 1, '2018-11-14 15:40:39', '2018-11-14 15:40:39', 'Dit is een voorbeeldpagina. Het verschilt van een bericht omdat het op één plaats blijft en weergegeven wordt in je website navigatie (in de meeste thema''s). De meeste mensen starten met een Over-ons pagina om zich voor te stellen op hun website.\nEen voorbeeld:\n\n<blockquote> Welkom! Ik ben een Bert; fietskoerier tijdens de dag en mijn grote passie is acteren. Ik woon in Antwerpen, heb een geweldige hond genaamd Jack, en ik lust af en toe wel eens een heerlijk Bolleke. </blockquote> \n\nof iets anders:\n\n<blockquote>BikeBelgium te Gent werd in 1971 opgericht en heeft zich toegespitst op innovatieve en kwaliteitsvolle stadsfietsen. Onze 16 medewerkers werken vol passie aan de beste en betaalbare fiets voor elke stadsbewoner.</blockquote>\n\nAls nieuwe WordPress-gebruiker, ga naar <a href="https://simodecl.cmsdevelopment.be/wp-admin/"> je dashboard</a> om deze pagina te verwijderen en creëer zelf je nieuwe pagina''s. Veel plezier!', 'Voorbeeld pagina', '', 'publish', 'closed', 'open', '', 'voorbeeld pagina', '', '', '2018-11-14 15:40:39', '2018-11-14 15:40:39', '', 0, 'https://simodecl.cmsdevelopment.be/?page_id=2', 0, 'page', '', 0),
(3, 1, '2018-11-14 15:40:39', '2018-11-14 15:40:39', '<h2>Wie zijn wij</h2><p>Het adres van onze website is: https://simodecl.cmsdevelopment.be.</p><h2>Welke persoonlijke data we verzamelen en waarom we dat doen</h2><h3>Reacties</h3><p>Als bezoekers reacties achterlaten op de site, verzamelen we de data die getoond wordt in het reactieformulier, het IP-adres van de bezoeker en de browser user agent om spam te bestrijden.</p><p>Een geanonimiseerde string, gemaakt op basis van je e-mailadres (dit wordt ook een hash genoemd) kan worden gestuurd naar de Gravatar dienst indien je dit gebruikt. De privacybeleid pagina kun je hier vinden: https://automattic.com/privacy/. Nadat je reactie is goedgekeurd, is je profielfoto publiekelijk zichtbaar in de context van je reactie.</p><h3>Media</h3><p>Als je afbeeldingen naar de website upload, moet je voorkomen dat je afbeeldingen uploadt met daarin GPS locatiegegevens (EXIF data). Bezoekers van de website kunnen de afbeeldingen van je website downloaden en deze locatiegegevens inzien.</p><h3>Contactformulieren</h3><h3>Cookies</h3><p>Wanneer je een reactie achterlaat op onze site, kun je aangeven of we je naam, je e-mailadres en website in een cookie opgeslagen mogen worden. Dit doen we voor jouw gemak zodat je deze gegevens niet opnieuw hoeft in te vullen voor een nieuwe reactie. Deze cookies zijn een jaar lang geldig. </p><p>Indien je een account hebt en je logt in op deze website, slaan we een tijdelijk cookie op om te bepalen of jouw browser cookies accepteert. Dit cookie bevat geen persoonlijke data en wordt verwijderd zodra je je browser sluit.</p><p>Zodra je inlogt, zullen we enkele cookies bewaren in verband met jouw login informatie en schermweergave opties. Login cookies zijn 2 dagen geldig en cookies voor schermweergave opties 1 jaar. Als je &quot;Herinner mij&quot; selecteert, wordt je login 2 weken bewaard. Zodra je uitlogt van jouw account, worden de login cookies verwijderd.</p><p>Wanneer je een bericht wijzigt of publiceert wordt een aanvullende cookie door je browser opgeslagen. Deze cookie bevat geen persoonlijke data en bevat enkel het post ID van het artikel wat je hebt bewerkt. Deze cookie is na een dag verlopen.</p><h3>Ingesloten inhoud van andere websites</h3><p>Berichten op deze website kunnen ingesloten (embedded) inhoud bevatten. Bijvoorbeeld video''s, afbeeldingen, berichten, etc. Ingesloten inhoud van andere websites gedraagt zich exact hetzelfde alsof de bezoeker deze andere website heeft bezocht.</p><p>Deze websites kunnen gegevens over jou verzamelen, cookies gebruiken, tracking van derde partijen insluiten en je interactie met deze ingesloten inhoud monitoren, inclusief de interactie met ingesloten inhoud als je een account hebt en ingelogd bent op die website.</p><h3>Analytics</h3><h2>Met wie we uw data delen</h2><h2>Hoelang we uw data bewaren</h2><p>Wanneer je een reactie achterlaat dan wordt die reactie en de metadata van die reactie voor altijd bewaard. Op deze manier kunnen we vervolgreacties automatisch herkennen en goedkeuren in plaats van dat we ze moeten modereren.</p><p>Voor gebruikers die zich registreren op onze website (indien van toepassing), bewaren we ook persoonlijke informatie in hun gebruikersprofiel. Alle gebruikers kunnen hun persoonlijke informatie bekijken, wijzigen of verwijderen op ieder moment (enkel de gebruikersnaam kan niet gewijzigd worden). Beheerders van de website kunnen deze informatie ook bekijken en wijzigen.</p><h2>Welke rechten heb je van je eigen gegevens</h2><p>Als je een account hebt op deze website of je hebt reacties geplaatst, kan je verzoeken om een exportbestand van je persoonlijke gegevens die we van je hebben, inclusief alle gegevens die je ons hebt gegeven. Je kan ook verzoeken dat we deze persoonlijke gegevens die we van je hebben verwijderen. Dit bevat geen data die we verplicht moeten bewaren in verband met administratieve, wettelijke of beveiligingsdoeleinden.</p><h2>Waar we uw data naar toe sturen</h2><p>Bezoekerscommentaren kunnen worden gecontroleerd via een geautomatiseerde spamdetectieservice.</p><h2>Uw contactgegevens</h2><h2>Bijkomende informatie</h2><h3>Hoe we uw gegevens beschermen</h3><h3>De procedures die we hebben in geval van een gegevensinbreuk</h3><h3>Derden waar we gegevens van ontvangen</h3><h3>Welke geautomatiseerde besluitvorming en/of profilering doen we met gebruikersgegevens</h3><h3>Openbaarmakingsverplichtingen van de industrie</h3>', 'Privacybeleid', '', 'draft', 'closed', 'open', '', 'privacy-policy', '', '', '2018-11-14 15:40:39', '2018-11-14 15:40:39', '', 0, 'https://simodecl.cmsdevelopment.be/?page_id=3', 0, 'page', '', 0),
(14, 1, '2018-11-26 08:53:35', '2018-11-26 08:53:35', 'a:7:{s:8:"location";a:1:{i:0;a:1:{i:0;a:3:{s:5:"param";s:12:"current_user";s:8:"operator";s:2:"==";s:5:"value";s:9:"logged_in";}}}s:8:"position";s:6:"normal";s:5:"style";s:7:"default";s:15:"label_placement";s:3:"top";s:21:"instruction_placement";s:5:"label";s:14:"hide_on_screen";s:0:"";s:11:"description";s:0:"";}', 'User', 'user', 'publish', 'closed', 'closed', '', 'group_5bfbb403cbecd', '', '', '2019-01-06 14:48:43', '2019-01-06 14:48:43', '', 0, 'https://simodecl.cmsdevelopment.be/?post_type=acf-field-group&#038;p=14', 2, 'acf-field-group', '', 0),
(15, 1, '2018-11-26 08:53:35', '2018-11-26 08:53:35', 'a:15:{s:4:"type";s:5:"image";s:12:"instructions";s:0:"";s:8:"required";i:0;s:17:"conditional_logic";i:0;s:7:"wrapper";a:3:{s:5:"width";s:0:"";s:5:"class";s:0:"";s:2:"id";s:0:"";}s:13:"return_format";s:5:"array";s:12:"preview_size";s:9:"thumbnail";s:7:"library";s:3:"all";s:9:"min_width";s:0:"";s:10:"min_height";s:0:"";s:8:"min_size";s:0:"";s:9:"max_width";s:0:"";s:10:"max_height";s:0:"";s:8:"max_size";s:0:"";s:10:"mime_types";s:0:"";}', 'Avatar', 'avatar', 'publish', 'closed', 'closed', '', 'field_5bfbb409ee5e1', '', '', '2018-11-26 10:09:29', '2018-11-26 10:09:29', '', 14, 'https://simodecl.cmsdevelopment.be/?post_type=acf-field&#038;p=15', 0, 'acf-field', '', 0),
(16, 1, '2018-11-26 09:46:58', '2018-11-26 09:46:58', 'a:10:{s:4:"type";s:4:"text";s:12:"instructions";s:0:"";s:8:"required";i:0;s:17:"conditional_logic";i:0;s:7:"wrapper";a:3:{s:5:"width";s:0:"";s:5:"class";s:0:"";s:2:"id";s:0:"";}s:13:"default_value";s:0:"";s:11:"placeholder";s:0:"";s:7:"prepend";s:0:"";s:6:"append";s:0:"";s:9:"maxlength";s:0:"";}', 'School', 'school', 'publish', 'closed', 'closed', '', 'field_5bfbc0fe8c5db', '', '', '2018-11-26 09:46:58', '2018-11-26 09:46:58', '', 14, 'https://simodecl.cmsdevelopment.be/?post_type=acf-field&p=16', 1, 'acf-field', '', 0),
(17, 1, '2018-11-26 10:47:22', '2018-11-26 10:47:22', 'a:7:{s:8:"location";a:1:{i:0;a:1:{i:0;a:3:{s:5:"param";s:9:"post_type";s:8:"operator";s:2:"==";s:5:"value";s:4:"post";}}}s:8:"position";s:6:"normal";s:5:"style";s:7:"default";s:15:"label_placement";s:3:"top";s:21:"instruction_placement";s:5:"label";s:14:"hide_on_screen";s:0:"";s:11:"description";s:0:"";}', 'Post', 'post', 'trash', 'closed', 'closed', '', 'group_5bfbcf25b8999__trashed', '', '', '2018-12-21 15:39:19', '2018-12-21 15:39:19', '', 0, 'https://simodecl.cmsdevelopment.be/?post_type=acf-field-group&#038;p=17', 0, 'acf-field-group', '', 0),
(18, 1, '2018-11-26 10:47:22', '2018-11-26 10:47:22', 'a:10:{s:4:"type";s:4:"text";s:12:"instructions";s:0:"";s:8:"required";i:0;s:17:"conditional_logic";i:0;s:7:"wrapper";a:3:{s:5:"width";s:0:"";s:5:"class";s:0:"";s:2:"id";s:0:"";}s:13:"default_value";s:0:"";s:11:"placeholder";s:0:"";s:7:"prepend";s:0:"";s:6:"append";s:0:"";s:9:"maxlength";s:0:"";}', 'Test', 'test', 'trash', 'closed', 'closed', '', 'field_5bfbcf2ae9eaf__trashed', '', '', '2018-12-21 15:39:19', '2018-12-21 15:39:19', '', 17, 'https://simodecl.cmsdevelopment.be/?post_type=acf-field&#038;p=18', 0, 'acf-field', '', 0),
(19, 1, '2018-11-26 10:47:34', '2018-11-26 10:47:34', 'Welkom bij WordPress. Dit is je eerste bericht. Pas het aan of verwijder het en start met bloggen!', 'Hallo wereld!', '', 'inherit', 'closed', 'closed', '', '1-revision-v1', '', '', '2018-11-26 10:47:34', '2018-11-26 10:47:34', '', 1, 'https://simodecl.cmsdevelopment.be/2018/11/26/1-revision-v1/', 0, 'revision', '', 0),
(25, 3, '2018-11-26 12:14:03', '2018-11-26 12:14:03', '', 'profielfotofacebook', '', 'inherit', 'open', 'closed', '', 'profielfotofacebook', '', '', '2018-11-26 12:14:03', '2018-11-26 12:14:03', '', 0, 'https://simodecl.cmsdevelopment.be/wp-content/uploads/2018/11/profielfotofacebook.jpg', 0, 'attachment', 'image/jpeg', 0),
(26, 3, '2018-11-26 20:33:44', '2018-11-26 20:33:44', '', 'MaN', '', 'inherit', 'open', 'closed', '', 'man', '', '', '2018-11-26 20:33:44', '2018-11-26 20:33:44', '', 0, 'https://simodecl.cmsdevelopment.be/wp-content/uploads/2018/11/MaN.png', 0, 'attachment', 'image/png', 0),
(27, 1, '2018-11-26 20:35:35', '2018-11-26 20:35:35', '', 'kanye-west', '', 'inherit', 'open', 'closed', '', 'kanye-west', '', '', '2018-11-26 20:35:35', '2018-11-26 20:35:35', '', 0, 'https://simodecl.cmsdevelopment.be/wp-content/uploads/2018/11/kanye-west.png', 0, 'attachment', 'image/png', 0),
(28, 3, '2018-11-27 12:19:23', '2018-11-27 12:19:23', '', 'KKomrade', '', 'inherit', 'open', 'closed', '', 'kkomrade', '', '', '2018-11-27 12:19:23', '2018-11-27 12:19:23', '', 0, 'https://simodecl.cmsdevelopment.be/wp-content/uploads/2018/11/KKomrade.png', 0, 'attachment', 'image/png', 0),
(30, 1, '2018-11-27 12:38:21', '2018-11-27 12:38:21', 'a:8:{s:4:"type";s:11:"date_picker";s:12:"instructions";s:0:"";s:8:"required";i:0;s:17:"conditional_logic";i:0;s:7:"wrapper";a:3:{s:5:"width";s:0:"";s:5:"class";s:0:"";s:2:"id";s:0:"";}s:14:"display_format";s:5:"m/d/Y";s:13:"return_format";s:5:"m/d/Y";s:9:"first_day";i:1;}', 'Goaldate', 'goaldate', 'publish', 'closed', 'closed', '', 'field_5bfd3a84c97be', '', '', '2018-12-05 10:19:02', '2018-12-05 10:19:02', '', 14, 'https://simodecl.cmsdevelopment.be/?post_type=acf-field&#038;p=30', 2, 'acf-field', '', 0),
(31, 1, '2018-11-27 12:38:21', '2018-11-27 12:38:21', 'a:12:{s:4:"type";s:6:"number";s:12:"instructions";s:0:"";s:8:"required";i:0;s:17:"conditional_logic";i:0;s:7:"wrapper";a:3:{s:5:"width";s:0:"";s:5:"class";s:0:"";s:2:"id";s:0:"";}s:13:"default_value";s:0:"";s:11:"placeholder";s:0:"";s:7:"prepend";s:0:"";s:6:"append";s:0:"";s:3:"min";s:0:"";s:3:"max";s:0:"";s:4:"step";s:0:"";}', 'Goalamount', 'goalamount', 'publish', 'closed', 'closed', '', 'field_5bfd3aa9c97bf', '', '', '2018-11-27 18:43:37', '2018-11-27 18:43:37', '', 14, 'https://simodecl.cmsdevelopment.be/?post_type=acf-field&#038;p=31', 3, 'acf-field', '', 0),
(33, 1, '2018-11-27 13:23:11', '2018-11-27 13:23:11', '', 'desert', '', 'inherit', 'open', 'closed', '', 'desert', '', '', '2018-11-27 13:23:11', '2018-11-27 13:23:11', '', 0, 'https://simodecl.cmsdevelopment.be/wp-content/uploads/2018/11/desert.jpg', 0, 'attachment', 'image/jpeg', 0),
(38, 1, '2018-11-14 15:40:39', '2018-11-14 15:40:39', 'Welkom bij WordPress. Dit is je eerste bericht. Pas het aan of verwijder het en start met bloggen!', 'Hallo wereld!', '', 'publish', 'open', 'open', '', 'hallo-wereld', '', '', '2018-11-26 20:45:22', '2018-11-26 20:45:22', '', 0, 'https://simodecl.cmsdevelopment.be/?p=1', 0, 'post', '', 1),
(39, 1, '2018-12-02 18:52:51', '2018-12-02 18:52:51', 'a:10:{s:4:"type";s:4:"text";s:12:"instructions";s:0:"";s:8:"required";i:0;s:17:"conditional_logic";i:0;s:7:"wrapper";a:3:{s:5:"width";s:0:"";s:5:"class";s:0:"";s:2:"id";s:0:"";}s:13:"default_value";s:0:"";s:11:"placeholder";s:0:"";s:7:"prepend";s:0:"";s:6:"append";s:0:"";s:9:"maxlength";s:0:"";}', 'Sleeptype', 'sleeptype', 'publish', 'closed', 'closed', '', 'field_5c0429eeb7a68', '', '', '2018-12-02 18:52:51', '2018-12-02 18:52:51', '', 14, 'https://simodecl.cmsdevelopment.be/?post_type=acf-field&p=39', 4, 'acf-field', '', 0),
(40, 1, '2018-12-02 18:56:28', '2018-12-02 18:56:28', 'a:9:{s:4:"type";s:4:"user";s:12:"instructions";s:0:"";s:8:"required";i:0;s:17:"conditional_logic";i:0;s:7:"wrapper";a:3:{s:5:"width";s:0:"";s:5:"class";s:0:"";s:2:"id";s:0:"";}s:4:"role";s:0:"";s:10:"allow_null";i:0;s:8:"multiple";i:1;s:13:"return_format";s:2:"id";}', 'Following', 'following', 'publish', 'closed', 'closed', '', 'field_5c042a29b58ce', '', '', '2019-01-04 23:44:40', '2019-01-04 23:44:40', '', 14, 'https://simodecl.cmsdevelopment.be/?post_type=acf-field&#038;p=40', 5, 'acf-field', '', 0),
(42, 1, '2018-12-04 13:37:52', '2018-12-04 13:37:52', '', 'dp-zalm-met-gebakken-patatjes', '', 'inherit', 'open', 'closed', '', 'dp-zalm-met-gebakken-patatjes', '', '', '2018-12-04 13:37:52', '2018-12-04 13:37:52', '', 0, 'https://simodecl.cmsdevelopment.be/wp-content/uploads/2018/12/dp-zalm-met-gebakken-patatjes.jpg', 0, 'attachment', 'image/jpeg', 0),
(49, 1, '2018-12-10 17:12:17', '2018-12-10 17:12:17', '', 'Kanye west is the best', '', 'publish', 'open', 'closed', '', 'kanye-west-is-the-best', '', '', '2018-12-24 12:28:26', '2018-12-24 12:28:26', '', 0, 'https://simodecl.cmsdevelopment.be/?post_type=selfie&#038;p=49', 0, 'selfie', '', 0),
(50, 1, '2018-12-10 18:32:57', '2018-12-10 18:32:57', '', 'Kanye 2', '', 'publish', 'open', 'closed', '', 'kanye-2', '', '', '2018-12-25 20:40:10', '2018-12-25 20:40:10', '', 0, 'https://simodecl.cmsdevelopment.be/?post_type=selfie&#038;p=50', 0, 'selfie', '', 7),
(51, 1, '2018-12-10 17:28:46', '2018-12-10 17:28:46', '', 'kanye-west-1', 'ANAHEIM, CA - JUNE 03:  Rapper Kanye West performs onstage at the Power 106 Powerhouse show at Honda Center on June 3, 2016 in Anaheim, California.  (Photo by Scott Dudelson/FilmMagic)', 'inherit', 'open', 'closed', '', 'kanye-west-1', '', '', '2018-12-10 17:28:46', '2018-12-10 17:28:46', '', 50, 'https://simodecl.cmsdevelopment.be/wp-content/uploads/2018/12/kanye-west-1.jpg', 0, 'attachment', 'image/jpeg', 0),
(52, 1, '2018-12-15 13:27:13', '2018-12-15 13:27:13', '', 'Activity', '', 'publish', 'closed', 'closed', '', 'activity', '', '', '2018-12-15 13:27:13', '2018-12-15 13:27:13', '', 0, 'https://simodecl.cmsdevelopment.be/activity/', 0, 'page', '', 0),
(53, 1, '2018-12-15 13:27:13', '2018-12-15 13:27:13', '', 'Members', '', 'publish', 'closed', 'closed', '', 'members', '', '', '2018-12-15 13:27:13', '2018-12-15 13:27:13', '', 0, 'https://simodecl.cmsdevelopment.be/members/', 0, 'page', '', 0),
(54, 1, '2018-12-15 13:27:13', '2018-12-15 13:27:13', '{{poster.name}} replied to one of your updates:\n\n<blockquote>&quot;{{usermessage}}&quot;</blockquote>\n\n<a href="{{{thread.url}}}">Go to the discussion</a> to reply or catch up on the conversation.', '[{{{site.name}}}] {{poster.name}} replied to one of your updates', '{{poster.name}} replied to one of your updates:\n\n"{{usermessage}}"\n\nGo to the discussion to reply or catch up on the conversation: {{{thread.url}}}', 'publish', 'closed', 'closed', '', 'site-name-poster-name-replied-to-one-of-your-updates', '', '', '2018-12-15 13:27:13', '2018-12-15 13:27:13', '', 0, 'https://simodecl.cmsdevelopment.be/?post_type=bp-email&p=54', 0, 'bp-email', '', 0),
(55, 1, '2018-12-15 13:27:13', '2018-12-15 13:27:13', '{{poster.name}} replied to one of your comments:\n\n<blockquote>&quot;{{usermessage}}&quot;</blockquote>\n\n<a href="{{{thread.url}}}">Go to the discussion</a> to reply or catch up on the conversation.', '[{{{site.name}}}] {{poster.name}} replied to one of your comments', '{{poster.name}} replied to one of your comments:\n\n"{{usermessage}}"\n\nGo to the discussion to reply or catch up on the conversation: {{{thread.url}}}', 'publish', 'closed', 'closed', '', 'site-name-poster-name-replied-to-one-of-your-comments', '', '', '2018-12-15 13:27:13', '2018-12-15 13:27:13', '', 0, 'https://simodecl.cmsdevelopment.be/?post_type=bp-email&p=55', 0, 'bp-email', '', 0),
(56, 1, '2018-12-15 13:27:13', '2018-12-15 13:27:13', '{{poster.name}} mentioned you in a status update:\n\n<blockquote>&quot;{{usermessage}}&quot;</blockquote>\n\n<a href="{{{mentioned.url}}}">Go to the discussion</a> to reply or catch up on the conversation.', '[{{{site.name}}}] {{poster.name}} mentioned you in a status update', '{{poster.name}} mentioned you in a status update:\n\n"{{usermessage}}"\n\nGo to the discussion to reply or catch up on the conversation: {{{mentioned.url}}}', 'publish', 'closed', 'closed', '', 'site-name-poster-name-mentioned-you-in-a-status-update', '', '', '2018-12-15 13:27:13', '2018-12-15 13:27:13', '', 0, 'https://simodecl.cmsdevelopment.be/?post_type=bp-email&p=56', 0, 'bp-email', '', 0),
(57, 1, '2018-12-15 13:27:13', '2018-12-15 13:27:13', '{{poster.name}} mentioned you in the group "{{group.name}}":\n\n<blockquote>&quot;{{usermessage}}&quot;</blockquote>\n\n<a href="{{{mentioned.url}}}">Go to the discussion</a> to reply or catch up on the conversation.', '[{{{site.name}}}] {{poster.name}} mentioned you in an update', '{{poster.name}} mentioned you in the group "{{group.name}}":\n\n"{{usermessage}}"\n\nGo to the discussion to reply or catch up on the conversation: {{{mentioned.url}}}', 'publish', 'closed', 'closed', '', 'site-name-poster-name-mentioned-you-in-an-update', '', '', '2018-12-15 13:27:13', '2018-12-15 13:27:13', '', 0, 'https://simodecl.cmsdevelopment.be/?post_type=bp-email&p=57', 0, 'bp-email', '', 0),
(58, 1, '2018-12-15 13:27:13', '2018-12-15 13:27:13', 'Thanks for registering!\n\nTo complete the activation of your account, go to the following link and click on the <strong>Activate</strong> button:\n<a href="{{{activate.url}}}">{{{activate.url}}}</a>\n\nIf the ''Activation Key'' field is empty, copy and paste the following into the field - {{key}}', '[{{{site.name}}}] Activate your account', 'Thanks for registering!\n\nTo complete the activation of your account, go to the following link and click on the ''Activate'' button: {{{activate.url}}}\n\nIf the ''Activation Key'' field is empty, copy and paste the following into the field - {{key}}', 'publish', 'closed', 'closed', '', 'site-name-activate-your-account', '', '', '2018-12-15 13:27:13', '2018-12-15 13:27:13', '', 0, 'https://simodecl.cmsdevelopment.be/?post_type=bp-email&p=58', 0, 'bp-email', '', 0),
(59, 1, '2018-12-15 13:27:13', '2018-12-15 13:27:13', '<a href="{{{initiator.url}}}">{{initiator.name}}</a> wants to add you as a friend.\n\nTo accept this request and manage all of your pending requests, visit: <a href="{{{friend-requests.url}}}">{{{friend-requests.url}}}</a>', '[{{{site.name}}}] New friendship request from {{initiator.name}}', '{{initiator.name}} wants to add you as a friend.\n\nTo accept this request and manage all of your pending requests, visit: {{{friend-requests.url}}}\n\nTo view {{initiator.name}}''s profile, visit: {{{initiator.url}}}', 'publish', 'closed', 'closed', '', 'site-name-new-friendship-request-from-initiator-name', '', '', '2018-12-15 13:27:13', '2018-12-15 13:27:13', '', 0, 'https://simodecl.cmsdevelopment.be/?post_type=bp-email&p=59', 0, 'bp-email', '', 0),
(60, 1, '2018-12-15 13:27:13', '2018-12-15 13:27:13', '<a href="{{{friendship.url}}}">{{friend.name}}</a> accepted your friend request.', '[{{{site.name}}}] {{friend.name}} accepted your friendship request', '{{friend.name}} accepted your friend request.\n\nTo learn more about them, visit their profile: {{{friendship.url}}}', 'publish', 'closed', 'closed', '', 'site-name-friend-name-accepted-your-friendship-request', '', '', '2018-12-15 13:27:13', '2018-12-15 13:27:13', '', 0, 'https://simodecl.cmsdevelopment.be/?post_type=bp-email&p=60', 0, 'bp-email', '', 0),
(61, 1, '2018-12-15 13:27:13', '2018-12-15 13:27:13', 'Group details for the group &quot;<a href="{{{group.url}}}">{{group.name}}</a>&quot; were updated:\n<blockquote>{{changed_text}}</blockquote>', '[{{{site.name}}}] Group details updated', 'Group details for the group "{{group.name}}" were updated:\n\n{{changed_text}}\n\nTo view the group, visit: {{{group.url}}}', 'publish', 'closed', 'closed', '', 'site-name-group-details-updated', '', '', '2018-12-15 13:27:13', '2018-12-15 13:27:13', '', 0, 'https://simodecl.cmsdevelopment.be/?post_type=bp-email&p=61', 0, 'bp-email', '', 0),
(62, 1, '2018-12-15 13:27:13', '2018-12-15 13:27:13', '<a href="{{{inviter.url}}}">{{inviter.name}}</a> has invited you to join the group: &quot;{{group.name}}&quot;.\n<a href="{{{invites.url}}}">Go here to accept your invitation</a> or <a href="{{{group.url}}}">visit the group</a> to learn more.', '[{{{site.name}}}] You have an invitation to the group: "{{group.name}}"', '{{inviter.name}} has invited you to join the group: "{{group.name}}".\n\nTo accept your invitation, visit: {{{invites.url}}}\n\nTo learn more about the group, visit: {{{group.url}}}.\nTo view {{inviter.name}}''s profile, visit: {{{inviter.url}}}', 'publish', 'closed', 'closed', '', 'site-name-you-have-an-invitation-to-the-group-group-name', '', '', '2018-12-15 13:27:13', '2018-12-15 13:27:13', '', 0, 'https://simodecl.cmsdevelopment.be/?post_type=bp-email&p=62', 0, 'bp-email', '', 0),
(63, 1, '2018-12-15 13:27:13', '2018-12-15 13:27:13', 'You have been promoted to <b>{{promoted_to}}</b> in the group &quot;<a href="{{{group.url}}}">{{group.name}}</a>&quot;.', '[{{{site.name}}}] You have been promoted in the group: "{{group.name}}"', 'You have been promoted to {{promoted_to}} in the group: "{{group.name}}".\n\nTo visit the group, go to: {{{group.url}}}', 'publish', 'closed', 'closed', '', 'site-name-you-have-been-promoted-in-the-group-group-name', '', '', '2018-12-15 13:27:13', '2018-12-15 13:27:13', '', 0, 'https://simodecl.cmsdevelopment.be/?post_type=bp-email&p=63', 0, 'bp-email', '', 0),
(64, 1, '2018-12-15 13:27:13', '2018-12-15 13:27:13', '<a href="{{{profile.url}}}">{{requesting-user.name}}</a> wants to join the group &quot;{{group.name}}&quot;. As you are an administrator of this group, you must either accept or reject the membership request.\n\n<a href="{{{group-requests.url}}}">Go here to manage this</a> and all other pending requests.', '[{{{site.name}}}] Membership request for group: {{group.name}}', '{{requesting-user.name}} wants to join the group "{{group.name}}". As you are the administrator of this group, you must either accept or reject the membership request.\n\nTo manage this and all other pending requests, visit: {{{group-requests.url}}}\n\nTo view {{requesting-user.name}}''s profile, visit: {{{profile.url}}}', 'publish', 'closed', 'closed', '', 'site-name-membership-request-for-group-group-name', '', '', '2018-12-15 13:27:13', '2018-12-15 13:27:13', '', 0, 'https://simodecl.cmsdevelopment.be/?post_type=bp-email&p=64', 0, 'bp-email', '', 0),
(65, 1, '2018-12-15 13:27:13', '2018-12-15 13:27:13', '{{sender.name}} sent you a new message: &quot;{{usersubject}}&quot;\n\n<blockquote>&quot;{{usermessage}}&quot;</blockquote>\n\n<a href="{{{message.url}}}">Go to the discussion</a> to reply or catch up on the conversation.', '[{{{site.name}}}] New message from {{sender.name}}', '{{sender.name}} sent you a new message: "{{usersubject}}"\n\n"{{usermessage}}"\n\nGo to the discussion to reply or catch up on the conversation: {{{message.url}}}', 'publish', 'closed', 'closed', '', 'site-name-new-message-from-sender-name', '', '', '2018-12-15 13:27:13', '2018-12-15 13:27:13', '', 0, 'https://simodecl.cmsdevelopment.be/?post_type=bp-email&p=65', 0, 'bp-email', '', 0),
(66, 1, '2018-12-15 13:27:13', '2018-12-15 13:27:13', 'You recently changed the email address associated with your account on {{site.name}} to {{user.email}}. If this is correct, <a href="{{{verify.url}}}">go here to confirm the change</a>.\n\nOtherwise, you can safely ignore and delete this email if you have changed your mind, or if you think you have received this email in error.', '[{{{site.name}}}] Verify your new email address', 'You recently changed the email address associated with your account on {{site.name}} to {{user.email}}. If this is correct, go to the following link to confirm the change: {{{verify.url}}}\n\nOtherwise, you can safely ignore and delete this email if you have changed your mind, or if you think you have received this email in error.', 'publish', 'closed', 'closed', '', 'site-name-verify-your-new-email-address', '', '', '2018-12-15 13:27:13', '2018-12-15 13:27:13', '', 0, 'https://simodecl.cmsdevelopment.be/?post_type=bp-email&p=66', 0, 'bp-email', '', 0),
(67, 1, '2018-12-15 13:27:13', '2018-12-15 13:27:13', 'Your membership request for the group &quot;<a href="{{{group.url}}}">{{group.name}}</a>&quot; has been accepted.', '[{{{site.name}}}] Membership request for group "{{group.name}}" accepted', 'Your membership request for the group "{{group.name}}" has been accepted.\n\nTo view the group, visit: {{{group.url}}}', 'publish', 'closed', 'closed', '', 'site-name-membership-request-for-group-group-name-accepted', '', '', '2018-12-15 13:27:13', '2018-12-15 13:27:13', '', 0, 'https://simodecl.cmsdevelopment.be/?post_type=bp-email&p=67', 0, 'bp-email', '', 0),
(68, 1, '2018-12-15 13:27:13', '2018-12-15 13:27:13', 'Your membership request for the group &quot;<a href="{{{group.url}}}">{{group.name}}</a>&quot; has been rejected.', '[{{{site.name}}}] Membership request for group "{{group.name}}" rejected', 'Your membership request for the group "{{group.name}}" has been rejected.\n\nTo request membership again, visit: {{{group.url}}}', 'publish', 'closed', 'closed', '', 'site-name-membership-request-for-group-group-name-rejected', '', '', '2018-12-15 13:27:13', '2018-12-15 13:27:13', '', 0, 'https://simodecl.cmsdevelopment.be/?post_type=bp-email&p=68', 0, 'bp-email', '', 0),
(70, 1, '2018-12-21 12:13:02', '2018-12-21 12:13:02', 'a:7:{s:8:"location";a:1:{i:0;a:1:{i:0;a:3:{s:5:"param";s:9:"post_type";s:8:"operator";s:2:"==";s:5:"value";s:13:"sleeptracking";}}}s:8:"position";s:6:"normal";s:5:"style";s:7:"default";s:15:"label_placement";s:3:"top";s:21:"instruction_placement";s:5:"label";s:14:"hide_on_screen";a:11:{i:0;s:11:"the_content";i:1;s:7:"excerpt";i:2;s:10:"discussion";i:3;s:8:"comments";i:4;s:9:"revisions";i:5;s:6:"format";i:6;s:15:"page_attributes";i:7;s:14:"featured_image";i:8;s:10:"categories";i:9;s:4:"tags";i:10;s:15:"send-trackbacks";}s:11:"description";s:0:"";}', 'Sleep tracking', 'sleep-tracking', 'publish', 'closed', 'closed', '', 'group_5c1cd71a51716', '', '', '2018-12-21 12:13:02', '2018-12-21 12:13:02', '', 0, 'https://simodecl.cmsdevelopment.be/?post_type=acf-field-group&#038;p=70', 0, 'acf-field-group', '', 0),
(71, 1, '2018-12-21 12:13:02', '2018-12-21 12:13:02', 'a:8:{s:4:"type";s:16:"date_time_picker";s:12:"instructions";s:0:"";s:8:"required";i:0;s:17:"conditional_logic";i:0;s:7:"wrapper";a:3:{s:5:"width";s:0:"";s:5:"class";s:0:"";s:2:"id";s:0:"";}s:14:"display_format";s:11:"d/m/Y g:i a";s:13:"return_format";s:11:"d/m/Y g:i a";s:9:"first_day";i:1;}', 'Sleep start', 'sleep_start', 'publish', 'closed', 'closed', '', 'field_5c1cd74be4878', '', '', '2018-12-21 12:13:02', '2018-12-21 12:13:02', '', 70, 'https://simodecl.cmsdevelopment.be/?post_type=acf-field&p=71', 0, 'acf-field', '', 0),
(72, 1, '2018-12-21 12:13:02', '2018-12-21 12:13:02', 'a:8:{s:4:"type";s:16:"date_time_picker";s:12:"instructions";s:0:"";s:8:"required";i:0;s:17:"conditional_logic";i:0;s:7:"wrapper";a:3:{s:5:"width";s:0:"";s:5:"class";s:0:"";s:2:"id";s:0:"";}s:14:"display_format";s:11:"d/m/Y g:i a";s:13:"return_format";s:11:"d/m/Y g:i a";s:9:"first_day";i:1;}', 'Sleep end', 'sleep_end', 'publish', 'closed', 'closed', '', 'field_5c1cd773e4879', '', '', '2018-12-21 12:13:02', '2018-12-21 12:13:02', '', 70, 'https://simodecl.cmsdevelopment.be/?post_type=acf-field&p=72', 1, 'acf-field', '', 0),
(73, 1, '2018-12-21 12:13:02', '2018-12-21 12:13:02', 'a:12:{s:4:"type";s:6:"number";s:12:"instructions";s:0:"";s:8:"required";i:0;s:17:"conditional_logic";i:0;s:7:"wrapper";a:3:{s:5:"width";s:0:"";s:5:"class";s:0:"";s:2:"id";s:0:"";}s:13:"default_value";s:0:"";s:11:"placeholder";s:0:"";s:7:"prepend";s:0:"";s:6:"append";s:0:"";s:3:"min";i:1;s:3:"max";i:5;s:4:"step";s:0:"";}', 'Sleep deep', 'sleep_deep', 'publish', 'closed', 'closed', '', 'field_5c1cd788e487a', '', '', '2018-12-21 12:13:02', '2018-12-21 12:13:02', '', 70, 'https://simodecl.cmsdevelopment.be/?post_type=acf-field&p=73', 2, 'acf-field', '', 0),
(74, 1, '2018-12-21 12:13:02', '2018-12-21 12:13:02', 'a:12:{s:4:"type";s:6:"number";s:12:"instructions";s:0:"";s:8:"required";i:0;s:17:"conditional_logic";i:0;s:7:"wrapper";a:3:{s:5:"width";s:0:"";s:5:"class";s:0:"";s:2:"id";s:0:"";}s:13:"default_value";s:0:"";s:11:"placeholder";s:0:"";s:7:"prepend";s:0:"";s:6:"append";s:0:"";s:3:"min";i:1;s:3:"max";i:5;s:4:"step";s:0:"";}', 'Sleep rest', 'sleep_rest', 'publish', 'closed', 'closed', '', 'field_5c1cd89fe487b', '', '', '2018-12-21 12:13:02', '2018-12-21 12:13:02', '', 70, 'https://simodecl.cmsdevelopment.be/?post_type=acf-field&p=74', 3, 'acf-field', '', 0),
(77, 1, '2018-12-21 15:40:46', '2018-12-21 15:40:46', 'a:7:{s:8:"location";a:1:{i:0;a:1:{i:0;a:3:{s:5:"param";s:9:"post_type";s:8:"operator";s:2:"==";s:5:"value";s:6:"selfie";}}}s:8:"position";s:6:"normal";s:5:"style";s:7:"default";s:15:"label_placement";s:3:"top";s:21:"instruction_placement";s:5:"label";s:14:"hide_on_screen";s:0:"";s:11:"description";s:0:"";}', 'Selfie', 'selfie', 'publish', 'closed', 'closed', '', 'group_5c1d092a6bbf6', '', '', '2018-12-24 13:49:43', '2018-12-24 13:49:43', '', 0, 'https://simodecl.cmsdevelopment.be/?post_type=acf-field-group&#038;p=77', 0, 'acf-field-group', '', 0),
(78, 1, '2018-12-21 15:40:47', '2018-12-21 15:40:47', 'a:9:{s:4:"type";s:4:"user";s:12:"instructions";s:0:"";s:8:"required";i:0;s:17:"conditional_logic";i:0;s:7:"wrapper";a:3:{s:5:"width";s:0:"";s:5:"class";s:0:"";s:2:"id";s:0:"";}s:4:"role";s:0:"";s:10:"allow_null";i:0;s:8:"multiple";i:1;s:13:"return_format";s:2:"id";}', 'Likes', 'likes', 'publish', 'closed', 'closed', '', 'field_5c1d092dca022', '', '', '2018-12-24 12:28:06', '2018-12-24 12:28:06', '', 77, 'https://simodecl.cmsdevelopment.be/?post_type=acf-field&#038;p=78', 0, 'acf-field', '', 0),
(82, 1, '2018-12-29 13:56:45', '2018-12-29 13:56:45', '', 'cat_face_glasses_thick_65455_3840x2400', '', 'inherit', 'open', 'closed', '', 'cat_face_glasses_thick_65455_3840x2400', '', '', '2018-12-29 13:56:45', '2018-12-29 13:56:45', '', 0, 'https://simodecl.cmsdevelopment.be/wp-content/uploads/2018/12/cat_face_glasses_thick_65455_3840x2400.jpg', 0, 'attachment', 'image/jpeg', 0),
(83, 1, '2018-12-29 13:58:38', '2018-12-29 13:58:38', '', 'Kittycat', '', 'publish', 'open', 'closed', '', 'kittycat', '', '', '2018-12-29 13:59:34', '2018-12-29 13:59:34', '', 0, 'https://simodecl.cmsdevelopment.be/?post_type=selfie&#038;p=83', 0, 'selfie', '', 1),
(95, 1, '2018-12-29 14:45:03', '2018-12-29 14:45:03', 'a:7:{s:8:"location";a:1:{i:0;a:1:{i:0;a:3:{s:5:"param";s:9:"post_type";s:8:"operator";s:2:"==";s:5:"value";s:4:"tips";}}}s:8:"position";s:6:"normal";s:5:"style";s:7:"default";s:15:"label_placement";s:3:"top";s:21:"instruction_placement";s:5:"label";s:14:"hide_on_screen";a:14:{i:0;s:9:"permalink";i:1;s:11:"the_content";i:2;s:7:"excerpt";i:3;s:10:"discussion";i:4;s:8:"comments";i:5;s:9:"revisions";i:6;s:4:"slug";i:7;s:6:"author";i:8;s:6:"format";i:9;s:15:"page_attributes";i:10;s:14:"featured_image";i:11;s:10:"categories";i:12;s:4:"tags";i:13;s:15:"send-trackbacks";}s:11:"description";s:0:"";}', 'Tips', 'tips', 'publish', 'closed', 'closed', '', 'group_5c278771b7f09', '', '', '2018-12-29 14:46:53', '2018-12-29 14:46:53', '', 0, 'https://simodecl.cmsdevelopment.be/?post_type=acf-field-group&#038;p=95', 0, 'acf-field-group', '', 0),
(96, 1, '2018-12-29 14:45:03', '2018-12-29 14:45:03', 'a:13:{s:4:"type";s:6:"select";s:12:"instructions";s:0:"";s:8:"required";i:1;s:17:"conditional_logic";i:0;s:7:"wrapper";a:3:{s:5:"width";s:0:"";s:5:"class";s:0:"";s:2:"id";s:0:"";}s:7:"choices";a:3:{s:4:"Text";s:4:"Text";s:5:"Image";s:5:"Image";s:5:"Video";s:5:"Video";}s:13:"default_value";a:1:{i:0;s:4:"Text";}s:10:"allow_null";i:0;s:8:"multiple";i:0;s:2:"ui";i:0;s:13:"return_format";s:5:"value";s:4:"ajax";i:0;s:11:"placeholder";s:0:"";}', 'Type', 'type', 'publish', 'closed', 'closed', '', 'field_5c2787760a6fb', '', '', '2018-12-29 14:45:03', '2018-12-29 14:45:03', '', 95, 'https://simodecl.cmsdevelopment.be/?post_type=acf-field&p=96', 0, 'acf-field', '', 0),
(97, 1, '2018-12-29 14:45:03', '2018-12-29 14:45:03', 'a:10:{s:4:"type";s:8:"textarea";s:12:"instructions";s:0:"";s:8:"required";i:0;s:7:"wrapper";a:3:{s:5:"width";s:0:"";s:5:"class";s:0:"";s:2:"id";s:0:"";}s:13:"default_value";s:0:"";s:11:"placeholder";s:0:"";s:9:"maxlength";s:0:"";s:4:"rows";s:0:"";s:9:"new_lines";s:0:"";s:17:"conditional_logic";a:1:{i:0;a:1:{i:0;a:3:{s:5:"field";s:19:"field_5c2787760a6fb";s:8:"operator";s:2:"==";s:5:"value";s:4:"Text";}}}}', 'Text', 'text', 'publish', 'closed', 'closed', '', 'field_5c2787b30a6fc', '', '', '2018-12-29 14:45:03', '2018-12-29 14:45:03', '', 95, 'https://simodecl.cmsdevelopment.be/?post_type=acf-field&p=97', 1, 'acf-field', '', 0),
(98, 1, '2018-12-29 14:45:03', '2018-12-29 14:45:03', 'a:15:{s:4:"type";s:5:"image";s:12:"instructions";s:0:"";s:8:"required";i:0;s:7:"wrapper";a:3:{s:5:"width";s:0:"";s:5:"class";s:0:"";s:2:"id";s:0:"";}s:13:"return_format";s:3:"url";s:12:"preview_size";s:6:"medium";s:7:"library";s:3:"all";s:9:"min_width";s:0:"";s:10:"min_height";s:0:"";s:8:"min_size";s:0:"";s:9:"max_width";s:0:"";s:10:"max_height";s:0:"";s:8:"max_size";s:0:"";s:10:"mime_types";s:0:"";s:17:"conditional_logic";a:1:{i:0;a:1:{i:0;a:3:{s:5:"field";s:19:"field_5c2787760a6fb";s:8:"operator";s:2:"==";s:5:"value";s:5:"Image";}}}}', 'Image', 'image', 'publish', 'closed', 'closed', '', 'field_5c2787fd0a6fd', '', '', '2018-12-29 14:45:03', '2018-12-29 14:45:03', '', 95, 'https://simodecl.cmsdevelopment.be/?post_type=acf-field&p=98', 2, 'acf-field', '', 0),
(99, 1, '2018-12-29 14:45:03', '2018-12-29 14:45:03', 'a:7:{s:4:"type";s:3:"url";s:12:"instructions";s:38:"Gebruik een embed url van bv. youtube.";s:8:"required";i:0;s:7:"wrapper";a:3:{s:5:"width";s:0:"";s:5:"class";s:0:"";s:2:"id";s:0:"";}s:13:"default_value";s:0:"";s:11:"placeholder";s:0:"";s:17:"conditional_logic";a:1:{i:0;a:1:{i:0;a:3:{s:5:"field";s:19:"field_5c2787760a6fb";s:8:"operator";s:2:"==";s:5:"value";s:5:"Video";}}}}', 'Video', 'video', 'publish', 'closed', 'closed', '', 'field_5c2788380a6fe', '', '', '2018-12-29 14:45:03', '2018-12-29 14:45:03', '', 95, 'https://simodecl.cmsdevelopment.be/?post_type=acf-field&p=99', 3, 'acf-field', '', 0),
(101, 1, '2018-12-29 14:47:37', '2018-12-29 14:47:37', '', '', '', 'publish', 'closed', 'closed', '', '101', '', '', '2018-12-29 14:47:37', '2018-12-29 14:47:37', '', 0, 'https://simodecl.cmsdevelopment.be/?post_type=tips&#038;p=101', 0, 'tips', '', 0),
(102, 1, '2018-12-29 14:47:55', '2018-12-29 14:47:55', '', '', '', 'publish', 'closed', 'closed', '', '102', '', '', '2018-12-29 14:47:55', '2018-12-29 14:47:55', '', 0, 'https://simodecl.cmsdevelopment.be/?post_type=tips&#038;p=102', 0, 'tips', '', 0),
(103, 1, '2018-12-29 14:48:15', '2018-12-29 14:48:15', '', '', '', 'publish', 'closed', 'closed', '', '103', '', '', '2018-12-29 14:48:15', '2018-12-29 14:48:15', '', 0, 'https://simodecl.cmsdevelopment.be/?post_type=tips&#038;p=103', 0, 'tips', '', 0),
(104, 1, '2018-12-29 14:48:39', '2018-12-29 14:48:39', '', '', '', 'publish', 'closed', 'closed', '', '104', '', '', '2018-12-29 14:48:39', '2018-12-29 14:48:39', '', 0, 'https://simodecl.cmsdevelopment.be/?post_type=tips&#038;p=104', 0, 'tips', '', 0),
(105, 1, '2018-12-29 14:50:43', '2018-12-29 14:50:43', '', '10-sleep-pic2', '', 'inherit', 'open', 'closed', '', '10-sleep-pic2', '', '', '2018-12-29 15:31:46', '2018-12-29 15:31:46', '', 112, 'https://simodecl.cmsdevelopment.be/wp-content/uploads/2018/12/10-sleep-pic2.jpg', 0, 'attachment', 'image/jpeg', 0),
(106, 1, '2018-12-29 14:50:43', '2018-12-29 14:50:43', '', 'anxiety-1024x900', '', 'inherit', 'open', 'closed', '', 'anxiety-1024x900', '', '', '2018-12-29 14:51:14', '2018-12-29 14:51:14', '', 107, 'https://simodecl.cmsdevelopment.be/wp-content/uploads/2018/12/anxiety-1024x900.jpg', 0, 'attachment', 'image/jpeg', 0),
(107, 1, '2018-12-29 14:51:14', '2018-12-29 14:51:14', '', 'anxiety', '', 'publish', 'closed', 'closed', '', 'anxiety', '', '', '2018-12-29 14:51:14', '2018-12-29 14:51:14', '', 0, 'https://simodecl.cmsdevelopment.be/?post_type=tips&#038;p=107', 0, 'tips', '', 0),
(108, 1, '2018-12-29 14:51:38', '2018-12-29 14:51:38', '', '', '', 'publish', 'closed', 'closed', '', '108', '', '', '2018-12-29 14:51:38', '2018-12-29 14:51:38', '', 0, 'https://simodecl.cmsdevelopment.be/?post_type=tips&#038;p=108', 0, 'tips', '', 0),
(109, 1, '2018-12-29 14:53:17', '2018-12-29 14:53:17', '', 'Matras', '', 'publish', 'closed', 'closed', '', 'matras', '', '', '2018-12-29 14:53:17', '2018-12-29 14:53:17', '', 0, 'https://simodecl.cmsdevelopment.be/?post_type=tips&#038;p=109', 0, 'tips', '', 0),
(110, 1, '2018-12-29 15:09:20', '2018-12-29 15:09:20', '', '', '', 'publish', 'closed', 'closed', '', '110', '', '', '2018-12-29 15:09:20', '2018-12-29 15:09:20', '', 0, 'https://simodecl.cmsdevelopment.be/?post_type=tips&#038;p=110', 0, 'tips', '', 0),
(111, 1, '2018-12-29 15:09:42', '2018-12-29 15:09:42', '', '', '', 'publish', 'closed', 'closed', '', '111', '', '', '2018-12-29 15:09:42', '2018-12-29 15:09:42', '', 0, 'https://simodecl.cmsdevelopment.be/?post_type=tips&#038;p=111', 0, 'tips', '', 0),
(112, 1, '2018-12-29 15:31:46', '2018-12-29 15:31:46', '', '10tips', '', 'publish', 'closed', 'closed', '', '10tips', '', '', '2018-12-29 15:31:46', '2018-12-29 15:31:46', '', 0, 'https://simodecl.cmsdevelopment.be/?post_type=tips&#038;p=112', 0, 'tips', '', 0),
(113, 1, '2018-12-30 14:22:39', '2018-12-30 14:22:39', '', 'Automatisch concept', '', 'publish', 'closed', 'closed', '', 'automatisch-concept', '', '', '2018-12-30 14:22:55', '2018-12-30 14:22:55', '', 0, 'https://simodecl.cmsdevelopment.be/?post_type=sleeptracking&#038;p=113', 0, 'sleeptracking', '', 0),
(121, 1, '2018-12-30 18:39:09', '2018-12-30 18:39:09', '', '', '', 'publish', 'closed', 'closed', '', '121', '', '', '2018-12-30 18:39:09', '2018-12-30 18:39:09', '', 0, 'https://simodecl.cmsdevelopment.be/sleeptracking/121/', 0, 'sleeptracking', '', 0),
(122, 1, '2019-01-02 19:06:31', '2019-01-02 19:06:31', 'Jij bent een echt ochtendmens! ’s ochtends sta je steeds lekker fris op en zou je de wereld kunnen verslaan! ', 'Morning Person', '', 'inherit', 'open', 'closed', '', 'morning-person', '', '', '2019-01-02 19:08:00', '2019-01-02 19:08:00', '', 0, 'https://simodecl.cmsdevelopment.be/wp-content/uploads/2019/01/Morning-Person.jpg', 0, 'attachment', 'image/jpeg', 0),
(123, 1, '2019-01-02 19:07:02', '2019-01-02 19:07:02', 'Slapen is voor jouw het ultieme moment om te genieten. Sleep all day? Yes please! ', 'Sleep Lover', '', 'inherit', 'open', 'closed', '', 'sleep-lover', '', '', '2019-01-02 19:08:07', '2019-01-02 19:08:07', '', 0, 'https://simodecl.cmsdevelopment.be/wp-content/uploads/2019/01/Sleep-Lover.jpg', 0, 'attachment', 'image/jpeg', 0),
(124, 1, '2019-01-02 19:09:13', '2019-01-02 19:09:13', 'Jij zou wel willen goed slapen, maar soms lukt het je echt niet… Je ligt nog lang wakker, te piekeren of te woelen.', 'Restless Bat', '', 'inherit', 'open', 'closed', '', 'restless-bat', '', '', '2019-01-02 19:09:28', '2019-01-02 19:09:28', '', 0, 'https://simodecl.cmsdevelopment.be/wp-content/uploads/2019/01/Restless-Bat.jpg', 0, 'attachment', 'image/jpeg', 0),
(125, 1, '2019-01-02 19:17:29', '2019-01-02 19:17:29', '’s avonds uren gamen, netflixen of instagrammen? Dat ben jij! Doordat je ’s avonds niet weg te slaan bent van de schermen, verlies je soms kostbare uren slaap. ', 'Screen Addict', '', 'inherit', 'open', 'closed', '', 'screen-addict', '', '', '2019-01-02 19:17:44', '2019-01-02 19:17:44', '', 0, 'https://simodecl.cmsdevelopment.be/wp-content/uploads/2019/01/Screen-Addict.png', 0, 'attachment', 'image/png', 0),
(126, 1, '2019-01-02 19:17:53', '2019-01-02 19:17:53', 'Geeuw… GEEEUWWW…. Geeuw… Moe in de klas? Moe in de zetel? Klinkt herkenbaar voor panda’s. Wat extra slaap kan je deugd doen! ', 'Panda', '', 'inherit', 'open', 'closed', '', 'panda', '', '', '2019-01-02 19:18:00', '2019-01-02 19:18:00', '', 0, 'https://simodecl.cmsdevelopment.be/wp-content/uploads/2019/01/Panda.jpg', 0, 'attachment', 'image/jpeg', 0),
(127, 1, '2019-01-02 19:18:20', '2019-01-02 19:18:20', 'Ochtenden zijn zo je ding niet… Magische truc om ochtenden draaglijker te maken? Vroeger in bed kruipen!', 'Sleepyhead', '', 'inherit', 'open', 'closed', '', 'sleepyhead', '', '', '2019-01-02 19:18:28', '2019-01-02 19:18:28', '', 0, 'https://simodecl.cmsdevelopment.be/wp-content/uploads/2019/01/Sleepyhead.jpg', 0, 'attachment', 'image/jpeg', 0),
(128, 1, '2019-01-02 19:18:36', '2019-01-02 19:18:36', 'Hé goed bezig! Jij vind slaap belangrijk en probeert dit zo goed mogelijk te doen. Keep it up!', 'King of Sleep', '', 'inherit', 'open', 'closed', '', 'king-of-sleep', '', '', '2019-01-02 19:18:43', '2019-01-02 19:18:43', '', 0, 'https://simodecl.cmsdevelopment.be/wp-content/uploads/2019/01/King-of-Sleep.jpg', 0, 'attachment', 'image/jpeg', 0),
(129, 1, '2019-01-04 10:57:00', '2019-01-04 10:57:00', '', '', '', 'publish', 'closed', 'closed', '', '129', '', '', '2019-01-04 11:00:38', '2019-01-04 11:00:38', '', 0, 'https://simodecl.cmsdevelopment.be/sleeptracking/129/', 0, 'sleeptracking', '', 0),
(130, 1, '2019-01-04 10:57:39', '2019-01-04 10:57:39', '', '', '', 'publish', 'closed', 'closed', '', '130', '', '', '2019-01-04 11:00:16', '2019-01-04 11:00:16', '', 0, 'https://simodecl.cmsdevelopment.be/sleeptracking/130/', 0, 'sleeptracking', '', 0),
(131, 1, '2019-01-04 10:58:07', '2019-01-04 10:58:07', '', '', '', 'publish', 'closed', 'closed', '', '131', '', '', '2019-01-04 10:59:57', '2019-01-04 10:59:57', '', 0, 'https://simodecl.cmsdevelopment.be/sleeptracking/131/', 0, 'sleeptracking', '', 0),
(132, 1, '2019-01-04 11:01:32', '2019-01-04 11:01:32', '', '', '', 'publish', 'closed', 'closed', '', '132', '', '', '2019-01-04 11:02:44', '2019-01-04 11:02:44', '', 0, 'https://simodecl.cmsdevelopment.be/sleeptracking/132/', 0, 'sleeptracking', '', 0),
(133, 1, '2019-01-04 11:02:12', '2019-01-04 11:02:12', '', '', '', 'publish', 'closed', 'closed', '', '133', '', '', '2019-01-04 11:02:12', '2019-01-04 11:02:12', '', 0, 'https://simodecl.cmsdevelopment.be/sleeptracking/133/', 0, 'sleeptracking', '', 0),
(134, 1, '2019-01-04 11:04:46', '2019-01-04 11:04:46', '', '', '', 'publish', 'closed', 'closed', '', '134', '', '', '2019-01-04 11:04:46', '2019-01-04 11:04:46', '', 0, 'https://simodecl.cmsdevelopment.be/sleeptracking/134/', 0, 'sleeptracking', '', 0),
(136, 1, '2019-01-04 22:19:44', '2019-01-04 22:19:44', '', '', '', 'publish', 'closed', 'closed', '', '136', '', '', '2019-01-04 22:19:44', '2019-01-04 22:19:44', '', 0, 'https://simodecl.cmsdevelopment.be/sleeptracking/136/', 0, 'sleeptracking', '', 0),
(137, 3, '2019-01-04 22:51:18', '2019-01-04 22:51:18', '', '', '', 'publish', 'closed', 'closed', '', '137', '', '', '2019-01-04 22:51:18', '2019-01-04 22:51:18', '', 0, 'https://simodecl.cmsdevelopment.be/sleeptracking/137/', 0, 'sleeptracking', '', 0),
(138, 3, '2019-01-05 11:22:06', '2019-01-05 11:22:06', '', 'received_208080433280014', '', 'inherit', 'open', 'closed', '', 'received_208080433280014', '', '', '2019-01-05 11:22:06', '2019-01-05 11:22:06', '', 0, 'https://simodecl.cmsdevelopment.be/wp-content/uploads/2019/01/received_208080433280014.png', 0, 'attachment', 'image/png', 0),
(139, 3, '2019-01-05 11:23:00', '2019-01-05 11:23:00', '', 'Relatable!', '', 'publish', 'open', 'closed', '', 'relatable', '', '', '2019-01-05 11:24:18', '2019-01-05 11:24:18', '', 0, 'https://simodecl.cmsdevelopment.be/?post_type=selfie&#038;p=139', 0, 'selfie', '', 0),
(140, 3, '2019-01-05 11:22:18', '2019-01-05 11:22:18', '', 'received_208080433280014-1', '', 'inherit', 'open', 'closed', '', 'received_208080433280014-1', '', '', '2019-01-05 11:22:18', '2019-01-05 11:22:18', '', 0, 'https://simodecl.cmsdevelopment.be/wp-content/uploads/2019/01/received_208080433280014-1.png', 0, 'attachment', 'image/png', 0),
(141, 29, '2019-01-06 14:20:33', '2019-01-06 14:20:33', '', 'ScreenShot_17-10-21_17-32-55-000', '', 'inherit', 'open', 'closed', '', 'screenshot_17-10-21_17-32-55-000', '', '', '2019-01-06 14:20:33', '2019-01-06 14:20:33', '', 0, 'https://simodecl.cmsdevelopment.be/wp-content/uploads/2019/01/ScreenShot_17-10-21_17-32-55-000.jpg', 0, 'attachment', 'image/jpeg', 0),
(142, 29, '2019-01-06 14:36:15', '2019-01-06 14:36:15', '', 'Eindelijk promotie!', '', 'publish', 'open', 'closed', '', 'eindelijk-promotie', '', '', '2019-01-06 14:36:22', '2019-01-06 14:36:22', '', 0, 'https://simodecl.cmsdevelopment.be/?post_type=selfie&#038;p=142', 0, 'selfie', '', 0),
(143, 1, '2019-01-06 14:35:52', '0000-00-00 00:00:00', '', 'Automatisch concept', '', 'auto-draft', 'open', 'open', '', '', '', '', '2019-01-06 14:35:52', '0000-00-00 00:00:00', '', 0, 'https://simodecl.cmsdevelopment.be/?p=143', 0, 'post', '', 0),
(144, 29, '2019-01-06 14:48:15', '2019-01-06 14:48:15', '', 'astronaut', '', 'inherit', 'open', 'closed', '', 'astronaut', '', '', '2019-01-06 14:48:15', '2019-01-06 14:48:15', '', 0, 'https://simodecl.cmsdevelopment.be/wp-content/uploads/2019/01/astronaut.png', 0, 'attachment', 'image/png', 0),
(145, 29, '2019-01-06 14:48:51', '2019-01-06 14:48:51', '', 'astronaut-1', '', 'inherit', 'open', 'closed', '', 'astronaut-1', '', '', '2019-01-06 14:48:51', '2019-01-06 14:48:51', '', 0, 'https://simodecl.cmsdevelopment.be/wp-content/uploads/2019/01/astronaut-1.png', 0, 'attachment', 'image/png', 0),
(146, 29, '2019-01-06 15:15:32', '2019-01-06 15:15:32', '', '', '', 'publish', 'closed', 'closed', '', '146', '', '', '2019-01-06 15:15:32', '2019-01-06 15:15:32', '', 0, 'https://simodecl.cmsdevelopment.be/sleeptracking/146/', 0, 'sleeptracking', '', 0),
(147, 29, '2019-01-06 15:20:36', '2019-01-06 15:20:36', '', '', '', 'publish', 'closed', 'closed', '', '147', '', '', '2019-01-06 15:20:36', '2019-01-06 15:20:36', '', 0, 'https://simodecl.cmsdevelopment.be/sleeptracking/147/', 0, 'sleeptracking', '', 0),
(148, 30, '2019-01-06 16:02:55', '2019-01-06 16:02:55', '', 'IMG_20180316_181249', '', 'inherit', 'open', 'closed', '', 'img_20180316_181249', '', '', '2019-01-06 16:02:55', '2019-01-06 16:02:55', '', 0, 'https://simodecl.cmsdevelopment.be/wp-content/uploads/2019/01/IMG_20180316_181249.jpg', 0, 'attachment', 'image/jpeg', 0);

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `wp_signups`
--

CREATE TABLE IF NOT EXISTS `wp_signups` (
  `signup_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `domain` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `path` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `title` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_login` varchar(60) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `user_email` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `registered` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `activated` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `active` tinyint(1) NOT NULL DEFAULT '0',
  `activation_key` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `meta` longtext COLLATE utf8mb4_unicode_ci,
  PRIMARY KEY (`signup_id`),
  KEY `activation_key` (`activation_key`),
  KEY `user_email` (`user_email`),
  KEY `user_login_email` (`user_login`,`user_email`),
  KEY `domain_path` (`domain`(140),`path`(51))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `wp_termmeta`
--

CREATE TABLE IF NOT EXISTS `wp_termmeta` (
  `meta_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `term_id` bigint(20) unsigned NOT NULL DEFAULT '0',
  `meta_key` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `meta_value` longtext COLLATE utf8mb4_unicode_ci,
  PRIMARY KEY (`meta_id`),
  KEY `term_id` (`term_id`),
  KEY `meta_key` (`meta_key`(191))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `wp_terms`
--

CREATE TABLE IF NOT EXISTS `wp_terms` (
  `term_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `slug` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `term_group` bigint(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`term_id`),
  KEY `slug` (`slug`(191)),
  KEY `name` (`name`(191))
) ENGINE=InnoDB  DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci AUTO_INCREMENT=29 ;

--
-- Gegevens worden uitgevoerd voor tabel `wp_terms`
--

INSERT INTO `wp_terms` (`term_id`, `name`, `slug`, `term_group`) VALUES
(1, 'Ongecategoriseerd', 'geen-categorie', 0),
(2, 'kanye', 'kanye', 0),
(4, 'activity-comment', 'activity-comment', 0),
(5, 'activity-comment-author', 'activity-comment-author', 0),
(6, 'activity-at-message', 'activity-at-message', 0),
(7, 'groups-at-message', 'groups-at-message', 0),
(8, 'core-user-registration', 'core-user-registration', 0),
(9, 'friends-request', 'friends-request', 0),
(10, 'friends-request-accepted', 'friends-request-accepted', 0),
(11, 'groups-details-updated', 'groups-details-updated', 0),
(12, 'groups-invitation', 'groups-invitation', 0),
(13, 'groups-member-promoted', 'groups-member-promoted', 0),
(14, 'groups-membership-request', 'groups-membership-request', 0),
(15, 'messages-unread', 'messages-unread', 0),
(16, 'settings-verify-email-change', 'settings-verify-email-change', 0),
(17, 'groups-membership-request-accepted', 'groups-membership-request-accepted', 0),
(18, 'groups-membership-request-rejected', 'groups-membership-request-rejected', 0),
(21, 'kat', 'kat', 0),
(23, 'joker', 'joker', 0),
(24, 'text', 'text', 0),
(25, 'image', 'image', 0),
(26, 'video', 'video', 0),
(27, 'meme', 'meme', 0),
(28, 'overwatch', 'overwatch', 0);

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `wp_term_relationships`
--

CREATE TABLE IF NOT EXISTS `wp_term_relationships` (
  `object_id` bigint(20) unsigned NOT NULL DEFAULT '0',
  `term_taxonomy_id` bigint(20) unsigned NOT NULL DEFAULT '0',
  `term_order` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`object_id`,`term_taxonomy_id`),
  KEY `term_taxonomy_id` (`term_taxonomy_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Gegevens worden uitgevoerd voor tabel `wp_term_relationships`
--

INSERT INTO `wp_term_relationships` (`object_id`, `term_taxonomy_id`, `term_order`) VALUES
(49, 2, 0),
(50, 2, 0),
(54, 4, 0),
(55, 5, 0),
(56, 6, 0),
(57, 7, 0),
(58, 8, 0),
(59, 9, 0),
(60, 10, 0),
(61, 11, 0),
(62, 12, 0),
(63, 13, 0),
(64, 14, 0),
(65, 15, 0),
(66, 16, 0),
(67, 17, 0),
(68, 18, 0),
(83, 21, 0),
(101, 24, 0),
(102, 24, 0),
(103, 24, 0),
(104, 24, 0),
(107, 25, 0),
(108, 24, 0),
(109, 26, 0),
(110, 24, 0),
(111, 24, 0),
(112, 25, 0),
(139, 27, 0),
(142, 28, 0);

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `wp_term_taxonomy`
--

CREATE TABLE IF NOT EXISTS `wp_term_taxonomy` (
  `term_taxonomy_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `term_id` bigint(20) unsigned NOT NULL DEFAULT '0',
  `taxonomy` varchar(32) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `description` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `parent` bigint(20) unsigned NOT NULL DEFAULT '0',
  `count` bigint(20) NOT NULL DEFAULT '0',
  PRIMARY KEY (`term_taxonomy_id`),
  UNIQUE KEY `term_id_taxonomy` (`term_id`,`taxonomy`),
  KEY `taxonomy` (`taxonomy`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci AUTO_INCREMENT=29 ;

--
-- Gegevens worden uitgevoerd voor tabel `wp_term_taxonomy`
--

INSERT INTO `wp_term_taxonomy` (`term_taxonomy_id`, `term_id`, `taxonomy`, `description`, `parent`, `count`) VALUES
(1, 1, 'category', '', 0, 0),
(2, 2, 'hashtag', '', 0, 2),
(4, 4, 'bp-email-type', 'A member has replied to an activity update that the recipient posted.', 0, 1),
(5, 5, 'bp-email-type', 'A member has replied to a comment on an activity update that the recipient posted.', 0, 1),
(6, 6, 'bp-email-type', 'Recipient was mentioned in an activity update.', 0, 1),
(7, 7, 'bp-email-type', 'Recipient was mentioned in a group activity update.', 0, 1),
(8, 8, 'bp-email-type', 'Recipient has registered for an account.', 0, 1),
(9, 9, 'bp-email-type', 'A member has sent a friend request to the recipient.', 0, 1),
(10, 10, 'bp-email-type', 'Recipient has had a friend request accepted by a member.', 0, 1),
(11, 11, 'bp-email-type', 'A group''s details were updated.', 0, 1),
(12, 12, 'bp-email-type', 'A member has sent a group invitation to the recipient.', 0, 1),
(13, 13, 'bp-email-type', 'Recipient''s status within a group has changed.', 0, 1),
(14, 14, 'bp-email-type', 'A member has requested permission to join a group.', 0, 1),
(15, 15, 'bp-email-type', 'Recipient has received a private message.', 0, 1),
(16, 16, 'bp-email-type', 'Recipient has changed their email address.', 0, 1),
(17, 17, 'bp-email-type', 'Recipient had requested to join a group, which was accepted.', 0, 1),
(18, 18, 'bp-email-type', 'Recipient had requested to join a group, which was rejected.', 0, 1),
(21, 21, 'hashtag', '', 0, 1),
(23, 23, 'hashtag', '', 0, 0),
(24, 24, 'type', '', 0, 7),
(25, 25, 'type', '', 0, 2),
(26, 26, 'type', '', 0, 1),
(27, 27, 'hashtag', '', 0, 1),
(28, 28, 'hashtag', '', 0, 1);

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `wp_usermeta`
--

CREATE TABLE IF NOT EXISTS `wp_usermeta` (
  `umeta_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) unsigned NOT NULL DEFAULT '0',
  `meta_key` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `meta_value` longtext COLLATE utf8mb4_unicode_ci,
  PRIMARY KEY (`umeta_id`),
  KEY `user_id` (`user_id`),
  KEY `meta_key` (`meta_key`(191))
) ENGINE=InnoDB  DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci AUTO_INCREMENT=589 ;

--
-- Gegevens worden uitgevoerd voor tabel `wp_usermeta`
--

INSERT INTO `wp_usermeta` (`umeta_id`, `user_id`, `meta_key`, `meta_value`) VALUES
(1, 1, 'nickname', 'cmsdev_db6'),
(2, 1, 'first_name', 'Simon'),
(3, 1, 'last_name', 'Decloedt'),
(4, 1, 'description', ''),
(5, 1, 'rich_editing', 'true'),
(6, 1, 'syntax_highlighting', 'true'),
(7, 1, 'comment_shortcuts', 'false'),
(8, 1, 'admin_color', 'midnight'),
(9, 1, 'use_ssl', '0'),
(10, 1, 'show_admin_bar_front', 'true'),
(11, 1, 'locale', ''),
(12, 1, 'wp_capabilities', 'a:2:{s:13:"administrator";b:1;s:6:"mobile";b:1;}'),
(13, 1, 'wp_user_level', '10'),
(14, 1, 'dismissed_wp_pointers', 'wp496_privacy,plugin_editor_notice,theme_editor_notice'),
(15, 1, 'show_welcome_panel', '1'),
(17, 1, 'wp_dashboard_quick_press_last_post_id', '143'),
(18, 1, 'community-events-location', 'a:1:{s:2:"ip";s:12:"178.117.98.0";}'),
(33, 3, 'nickname', 'angular2'),
(34, 3, 'first_name', ''),
(35, 3, 'last_name', ''),
(36, 3, 'description', ''),
(37, 3, 'rich_editing', 'true'),
(38, 3, 'syntax_highlighting', 'true'),
(39, 3, 'comment_shortcuts', 'false'),
(40, 3, 'admin_color', 'fresh'),
(41, 3, 'use_ssl', '0'),
(42, 3, 'show_admin_bar_front', 'true'),
(43, 3, 'locale', ''),
(44, 3, 'wp_capabilities', 'a:1:{s:6:"mobile";b:1;}'),
(45, 3, 'wp_user_level', '7'),
(64, 1, 'wp_user-settings', 'libraryContent=browse&editor_expand=on'),
(65, 1, 'wp_user-settings-time', '1542622979'),
(79, 1, 'facebook_profile', ''),
(80, 1, 'twitter_profile', ''),
(81, 1, 'linkedin_profile', ''),
(82, 1, 'google_profile', ''),
(83, 1, 'avatar', '42'),
(84, 1, '_avatar', 'field_5bfbb409ee5e1'),
(93, 1, 'school', 'Arteveldehogeschool'),
(94, 1, '_school', 'field_5bfbc0fe8c5db'),
(95, 3, 'facebook_profile', ''),
(96, 3, 'twitter_profile', ''),
(97, 3, 'linkedin_profile', ''),
(98, 3, 'google_profile', ''),
(99, 3, 'avatar', '26'),
(100, 1, 'goal_date', '20181129'),
(101, 1, '_goal_date', 'field_5bfd3a84c97be'),
(102, 1, 'goal_amount', '7'),
(103, 1, '_goal_amount', 'field_5bfd3aa9c97bf'),
(104, 1, 'goal', ''),
(105, 1, '_goal', 'field_5bfd3a70c97bd'),
(106, 1, '_new_email', 'a:2:{s:4:"hash";s:32:"64d93e522c96a5b54280a285e39232e9";s:8:"newemail";s:24:"decloedt.simon@gmail.com";}'),
(186, 1, 'goaldate', '20181212'),
(187, 1, 'goalamount', '8'),
(188, 1, '_goaldate', 'field_5bfd3a84c97be'),
(189, 1, '_goalamount', 'field_5bfd3aa9c97bf'),
(190, 11, 'nickname', 'Angular4'),
(191, 11, 'first_name', 'Ang'),
(192, 11, 'last_name', 'Ular'),
(193, 11, 'description', ''),
(194, 11, 'rich_editing', 'true'),
(195, 11, 'syntax_highlighting', 'true'),
(196, 11, 'comment_shortcuts', 'false'),
(197, 11, 'admin_color', 'fresh'),
(198, 11, 'use_ssl', '0'),
(199, 11, 'show_admin_bar_front', 'true'),
(200, 11, 'locale', ''),
(201, 11, 'wp_capabilities', 'a:1:{s:6:"mobile";b:1;}'),
(202, 11, 'wp_user_level', '7'),
(218, 3, '_avatar', 'field_5bfbb409ee5e1'),
(219, 3, 'school', ''),
(220, 3, '_school', 'field_5bfbc0fe8c5db'),
(221, 3, 'goaldate', ''),
(222, 3, '_goaldate', 'field_5bfd3a84c97be'),
(223, 3, 'goalamount', ''),
(224, 3, '_goalamount', 'field_5bfd3aa9c97bf'),
(225, 1, 'sleeptype', 'King of Sleep'),
(226, 1, '_sleeptype', 'field_5c0429eeb7a68'),
(228, 1, '_following', 'field_5c042a29b58ce'),
(239, 1, 'following', 'a:3:{i:0;i:6;i:1;i:2;i:2;i:3;}'),
(240, 1, 'following', 'a:3:{i:0;i:6;i:1;i:2;i:2;i:3;}'),
(241, 1, 'following', 'a:3:{i:0;i:6;i:1;i:2;i:2;i:3;}'),
(242, 1, 'meta-box-order_selfie', 'a:4:{s:15:"acf_after_title";s:0:"";s:4:"side";s:38:"submitdiv,postimagediv,tagsdiv-hashtag";s:6:"normal";s:118:"acf-group_5c1d092a6bbf6,acf-group_5c1cd71a51716,authordiv,acf-group_5bfbb403cbecd,slugdiv,commentstatusdiv,commentsdiv";s:8:"advanced";s:0:"";}'),
(243, 1, 'screen_layout_selfie', '2'),
(244, 1, 'tgmpa_dismissed_notice_tgmpa', '1'),
(245, 1, 'closedpostboxes_sleeptracking', 'a:1:{i:0;s:23:"acf-group_5bfbb403cbecd";}'),
(246, 1, 'metaboxhidden_sleeptracking', 'a:4:{i:0;s:23:"acf-group_5c1d092a6bbf6";i:1;s:23:"acf-group_5c278771b7f09";i:2;s:23:"acf-group_5bfbb403cbecd";i:3;s:7:"slugdiv";}'),
(247, 1, 'closedpostboxes_selfie', 'a:1:{i:0;s:23:"acf-group_5bfbb403cbecd";}'),
(248, 1, 'metaboxhidden_selfie', 'a:3:{i:0;s:23:"acf-group_5c278771b7f09";i:1;s:23:"acf-group_5c1cd71a51716";i:2;s:7:"slugdiv";}'),
(249, 1, 'closedpostboxes_tips', 'a:0:{}'),
(250, 1, 'metaboxhidden_tips', 'a:4:{i:0;s:23:"acf-group_5c1d092a6bbf6";i:1;s:23:"acf-group_5c1cd71a51716";i:2;s:23:"acf-group_5bfbb403cbecd";i:3;s:7:"slugdiv";}'),
(290, 3, 'sleeptype', ''),
(291, 3, '_sleeptype', 'field_5c0429eeb7a68'),
(292, 3, 'following', 'a:2:{i:0;i:1;i:1;i:2;}'),
(293, 3, '_following', 'field_5c042a29b58ce'),
(307, 1, 'session_tokens', 'a:2:{s:64:"c49b706abec252a743be5638102e4e172771e3a15533fbf5dfd4613acca3647c";a:4:{s:10:"expiration";i:1546815650;s:2:"ip";s:14:"178.117.98.141";s:2:"ua";s:114:"Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/71.0.3578.98 Safari/537.36";s:5:"login";i:1546642850;}s:64:"711d7c46bc3d69cb8f6b39f6663c96a05ddfc54718f04b42bffe06940cc97187";a:4:{s:10:"expiration";i:1547896970;s:2:"ip";s:14:"178.117.98.141";s:2:"ua";s:114:"Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/71.0.3578.98 Safari/537.36";s:5:"login";i:1546687370;}}'),
(541, 1, 'closedpostboxes_acf-field-group', 'a:0:{}'),
(542, 1, 'metaboxhidden_acf-field-group', 'a:1:{i:0;s:7:"slugdiv";}'),
(543, 1, 'meta-box-order_acf-field-group', 'a:3:{s:4:"side";s:9:"submitdiv";s:6:"normal";s:80:"acf-field-group-fields,acf-field-group-locations,acf-field-group-options,slugdiv";s:8:"advanced";s:0:"";}'),
(544, 1, 'screen_layout_acf-field-group', '2'),
(545, 29, 'nickname', 'manatran'),
(546, 29, 'first_name', 'Manaus'),
(547, 29, 'last_name', 'Transez'),
(548, 29, 'description', ''),
(549, 29, 'rich_editing', 'true'),
(550, 29, 'syntax_highlighting', 'true'),
(551, 29, 'comment_shortcuts', 'false'),
(552, 29, 'admin_color', 'fresh'),
(553, 29, 'use_ssl', '0'),
(554, 29, 'show_admin_bar_front', 'true'),
(555, 29, 'locale', ''),
(556, 29, 'wp_capabilities', 'a:1:{s:6:"mobile";b:1;}'),
(557, 29, 'wp_user_level', '7'),
(558, 29, 'avatar', '145'),
(559, 29, '_avatar', 'field_5bfbb409ee5e1'),
(560, 29, 'school', 'Partyvelde'),
(561, 29, '_school', 'field_5bfbc0fe8c5db'),
(562, 29, 'goaldate', '2019-03-31T22:00:00.000Z'),
(563, 29, '_goaldate', 'field_5bfd3a84c97be'),
(564, 29, 'goalamount', '9'),
(565, 29, '_goalamount', 'field_5bfd3aa9c97bf'),
(566, 29, 'sleeptype', 'Morning Person'),
(567, 29, '_sleeptype', 'field_5c0429eeb7a68'),
(568, 29, 'following', 'a:2:{i:0;i:1;i:1;i:3;}'),
(569, 29, '_following', 'field_5c042a29b58ce'),
(570, 30, 'nickname', 'android'),
(571, 30, 'first_name', 'Android'),
(572, 30, 'last_name', 'User'),
(573, 30, 'description', ''),
(574, 30, 'rich_editing', 'true'),
(575, 30, 'syntax_highlighting', 'true'),
(576, 30, 'comment_shortcuts', 'false'),
(577, 30, 'admin_color', 'fresh'),
(578, 30, 'use_ssl', '0'),
(579, 30, 'show_admin_bar_front', 'true'),
(580, 30, 'locale', ''),
(581, 30, 'wp_capabilities', 'a:1:{s:6:"mobile";b:1;}'),
(582, 30, 'wp_user_level', '7'),
(583, 30, 'following', 'a:1:{i:0;i:3;}'),
(584, 30, '_following', 'field_5c042a29b58ce'),
(585, 30, 'sleeptype', 'Sleep Lover'),
(586, 30, '_sleeptype', 'field_5c0429eeb7a68'),
(587, 30, 'avatar', '148'),
(588, 30, '_avatar', 'field_5bfbb409ee5e1');

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `wp_users`
--

CREATE TABLE IF NOT EXISTS `wp_users` (
  `ID` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `user_login` varchar(60) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `user_pass` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `user_nicename` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `user_email` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `user_url` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `user_registered` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `user_activation_key` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `user_status` int(11) NOT NULL DEFAULT '0',
  `display_name` varchar(250) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  PRIMARY KEY (`ID`),
  KEY `user_login_key` (`user_login`),
  KEY `user_nicename` (`user_nicename`),
  KEY `user_email` (`user_email`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci AUTO_INCREMENT=31 ;

--
-- Gegevens worden uitgevoerd voor tabel `wp_users`
--

INSERT INTO `wp_users` (`ID`, `user_login`, `user_pass`, `user_nicename`, `user_email`, `user_url`, `user_registered`, `user_activation_key`, `user_status`, `display_name`) VALUES
(1, 'cmsdev_db6', '$P$BXOsDk6m57T7jms0XAIWJUXtYYfw8A1', 'cmsdev_db6', 'simodecl@student.arteveldehs.be', '', '2018-11-14 15:40:39', '', 0, 'Simon Decloedt'),
(3, 'angular2', '$P$BgX52mIayQ1LT9U5XklY4ZD61710zt0', 'angular2', 'angular2@gmail.com', '', '2018-11-18 19:06:18', '', 0, 'angular2'),
(11, 'Angular4', '$P$BRFxnAGSPikyA.7HktZ3zJPeKJRwzB.', 'angular4', 'ang@gmail.com', '', '2018-12-02 13:58:28', '', 0, 'Ang Ular'),
(29, 'manatran', '$P$Be7Vm9xgWKl3mRy3zyJ63F/lqcrbbN0', 'manatran', 'manatran@test.com', '', '2019-01-06 14:15:14', '', 0, 'Manaus Transez'),
(30, 'android', '$P$BwupAEkib5.EvLmMxp.uDi85/MLmfc0', 'android', 'android@gmail.com', '', '2019-01-06 15:57:07', '', 0, 'Android User');

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
