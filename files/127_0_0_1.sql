-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jan 10, 2025 at 08:25 AM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `aaa1`
--
CREATE DATABASE IF NOT EXISTS `aaa1` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `aaa1`;
--
-- Database: `datimessina`
--
CREATE DATABASE IF NOT EXISTS `datimessina` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `datimessina`;

-- --------------------------------------------------------

--
-- Table structure for table `datidinavigazione`
--

CREATE TABLE `datidinavigazione` (
  `id_persona` int(11) NOT NULL,
  `name` varchar(50) NOT NULL,
  `surname` varchar(50) NOT NULL,
  `wherebirth` varchar(100) NOT NULL,
  `birth_date` date NOT NULL,
  `live` varchar(100) NOT NULL,
  `city` varchar(50) NOT NULL,
  `province` varchar(50) NOT NULL,
  `email` varchar(118) NOT NULL,
  `type` varchar(50) NOT NULL,
  `phone` varchar(15) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `datidinavigazione`
--

INSERT INTO `datidinavigazione` (`id_persona`, `name`, `surname`, `wherebirth`, `birth_date`, `live`, `city`, `province`, `email`, `type`, `phone`) VALUES
(1, 'dsadasd', 'asdasd', 'asdasdasd', '2006-02-02', 'asdas', 'dsadasd', 'asdasd', 'asdasds@gmail.com', 'studente', '34234234'),
(2, 'Alessandro', 'Pala', 'MAGGI', '2006-02-02', 'GaR', 'Garlenda', 'Savona', 'alessandropala06@gmail.com', 'studente', '234234234432');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `datidinavigazione`
--
ALTER TABLE `datidinavigazione`
  ADD PRIMARY KEY (`id_persona`),
  ADD UNIQUE KEY `phone` (`phone`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `datidinavigazione`
--
ALTER TABLE `datidinavigazione`
  MODIFY `id_persona` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- Database: `gestione_ordini`
--
CREATE DATABASE IF NOT EXISTS `gestione_ordini` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `gestione_ordini`;

-- --------------------------------------------------------

--
-- Table structure for table `clienti`
--

CREATE TABLE `clienti` (
  `ID_cliente` int(11) NOT NULL,
  `nome` char(20) NOT NULL,
  `indirizzo` char(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `clienti`
--

INSERT INTO `clienti` (`ID_cliente`, `nome`, `indirizzo`) VALUES
(0, 'Johnny', 'Via pencio 33'),
(1, 'Alessandro', 'Via dalle Palle'),
(2, 'Rylee', 'Via Brombeis 69'),
(3, 'Leosnardos', 'Via zio pera 66'),
(4, 'Johnny', 'Via fentanyl 4'),
(5, 'Jesse', 'VIa Baghdad 4');

-- --------------------------------------------------------

--
-- Table structure for table `dettagli`
--

CREATE TABLE `dettagli` (
  `ID_dettaglio` int(11) NOT NULL,
  `id_ordine` int(11) NOT NULL,
  `id_merce` int(11) NOT NULL,
  `quantità` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `merci`
--

CREATE TABLE `merci` (
  `ID_merce` int(11) NOT NULL,
  `descrizione` char(20) NOT NULL,
  `prezzo` float NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `merci`
--

INSERT INTO `merci` (`ID_merce`, `descrizione`, `prezzo`) VALUES
(1, 'Melanzana', 2),
(2, 'Mela', 4),
(3, 'Fentanyl', 30),
(4, 'Funghetto', 40),
(5, 'Papaya', 20);

-- --------------------------------------------------------

--
-- Table structure for table `ordini`
--

CREATE TABLE `ordini` (
  `ID_ordine` int(11) NOT NULL,
  `id_cliente` int(11) NOT NULL,
  `data` date DEFAULT NULL,
  `id_pagamento` int(11) NOT NULL,
  `importo` float DEFAULT NULL,
  `conferma` char(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `ordini`
--

INSERT INTO `ordini` (`ID_ordine`, `id_cliente`, `data`, `id_pagamento`, `importo`, `conferma`) VALUES
(0, 5, '2024-11-18', 5, 60, '1'),
(1, 3, '2024-10-08', 5, 33, 's'),
(3, 0, '2024-09-02', 3, 1, 's'),
(9, 5, '2024-11-19', 2, 2, 's');

-- --------------------------------------------------------

--
-- Table structure for table `pagamenti`
--

CREATE TABLE `pagamenti` (
  `ID_pagamento` int(11) NOT NULL,
  `descrizione` char(20) NOT NULL,
  `valuta` char(15) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `pagamenti`
--

INSERT INTO `pagamenti` (`ID_pagamento`, `descrizione`, `valuta`) VALUES
(1, 'Contanti', 'euro'),
(2, 'Bonifico immediato', 'euro'),
(3, 'In natura', 'te lo spiegherò'),
(4, 'Carta di credito', 'euro'),
(5, 'scambio con banane', 'banane');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `clienti`
--
ALTER TABLE `clienti`
  ADD PRIMARY KEY (`ID_cliente`);

--
-- Indexes for table `dettagli`
--
ALTER TABLE `dettagli`
  ADD PRIMARY KEY (`ID_dettaglio`),
  ADD KEY `id_ordine` (`id_ordine`),
  ADD KEY `id_merce` (`id_merce`);

--
-- Indexes for table `merci`
--
ALTER TABLE `merci`
  ADD PRIMARY KEY (`ID_merce`);

--
-- Indexes for table `ordini`
--
ALTER TABLE `ordini`
  ADD PRIMARY KEY (`ID_ordine`),
  ADD KEY `id_cliente` (`id_cliente`),
  ADD KEY `id_pagamento` (`id_pagamento`);

--
-- Indexes for table `pagamenti`
--
ALTER TABLE `pagamenti`
  ADD PRIMARY KEY (`ID_pagamento`);

--
-- Constraints for dumped tables
--

--
-- Constraints for table `dettagli`
--
ALTER TABLE `dettagli`
  ADD CONSTRAINT `dettagli_ibfk_1` FOREIGN KEY (`id_ordine`) REFERENCES `ordini` (`ID_ordine`),
  ADD CONSTRAINT `dettagli_ibfk_2` FOREIGN KEY (`id_merce`) REFERENCES `merci` (`ID_merce`);

--
-- Constraints for table `ordini`
--
ALTER TABLE `ordini`
  ADD CONSTRAINT `ordini_ibfk_1` FOREIGN KEY (`id_cliente`) REFERENCES `clienti` (`ID_cliente`),
  ADD CONSTRAINT `ordini_ibfk_2` FOREIGN KEY (`id_pagamento`) REFERENCES `pagamenti` (`ID_pagamento`);
--
-- Database: `magazzino`
--
CREATE DATABASE IF NOT EXISTS `magazzino` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `magazzino`;

-- --------------------------------------------------------

--
-- Table structure for table `clienti`
--

CREATE TABLE `clienti` (
  `id_cliente` int(11) NOT NULL,
  `cognome` char(50) NOT NULL,
  `nome` char(50) NOT NULL,
  `data_nascita` date DEFAULT NULL,
  `email` char(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `clienti`
--

INSERT INTO `clienti` (`id_cliente`, `cognome`, `nome`, `data_nascita`, `email`) VALUES
(1, 'Pala', 'Alessandro', '2006-02-02', 'alep@gmail.com'),
(2, 'Tenace', 'Danilo', '1986-06-15', 'danit@gmail.com'),
(3, 'Merlo', 'Marco', '2006-01-23', 'marcom@gmail.com');

-- --------------------------------------------------------

--
-- Table structure for table `quarterly_sales`
--

CREATE TABLE `quarterly_sales` (
  `employee_id` int(11) DEFAULT NULL,
  `q1_2022` decimal(10,2) DEFAULT NULL,
  `q2_2022` decimal(10,2) DEFAULT NULL,
  `q3_2022` decimal(10,2) DEFAULT NULL,
  `q4_2022` decimal(10,2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `quarterly_sales`
--

INSERT INTO `quarterly_sales` (`employee_id`, `q1_2022`, `q2_2022`, `q3_2022`, `q4_2022`) VALUES
(8, 3471.41, 14789.25, 3478.34, 1254.23),
(4, 5417.81, 12846.23, 8741.54, 3589.99),
(10, 1547.52, 1269.66, 1478.65, 2474.33),
(1, 8715.55, 8465.65, 24747.82, 3514.36),
(3, 12774.51, 24784.31, 12223.34, 8451.51),
(2, 4989.23, 5103.22, 4897.98, 5322.05),
(7, 18415.66, 15279.37, 14634.44, 14445.12),
(6, 2498.63, 8741.45, 3997.65, 2497.21),
(5, 6349.74, 7555.55, 6944.35, 7788.01),
(9, 4485.36, 4101.50, 8787.45, 7648.90);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `clienti`
--
ALTER TABLE `clienti`
  ADD PRIMARY KEY (`id_cliente`),
  ADD UNIQUE KEY `email` (`email`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `clienti`
--
ALTER TABLE `clienti`
  MODIFY `id_cliente` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- Database: `phpmyadmin`
--
CREATE DATABASE IF NOT EXISTS `phpmyadmin` DEFAULT CHARACTER SET utf8 COLLATE utf8_bin;
USE `phpmyadmin`;

-- --------------------------------------------------------

--
-- Table structure for table `pma__bookmark`
--

CREATE TABLE `pma__bookmark` (
  `id` int(10) UNSIGNED NOT NULL,
  `dbase` varchar(255) NOT NULL DEFAULT '',
  `user` varchar(255) NOT NULL DEFAULT '',
  `label` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  `query` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Bookmarks';

-- --------------------------------------------------------

--
-- Table structure for table `pma__central_columns`
--

CREATE TABLE `pma__central_columns` (
  `db_name` varchar(64) NOT NULL,
  `col_name` varchar(64) NOT NULL,
  `col_type` varchar(64) NOT NULL,
  `col_length` text DEFAULT NULL,
  `col_collation` varchar(64) NOT NULL,
  `col_isNull` tinyint(1) NOT NULL,
  `col_extra` varchar(255) DEFAULT '',
  `col_default` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Central list of columns';

-- --------------------------------------------------------

--
-- Table structure for table `pma__column_info`
--

CREATE TABLE `pma__column_info` (
  `id` int(5) UNSIGNED NOT NULL,
  `db_name` varchar(64) NOT NULL DEFAULT '',
  `table_name` varchar(64) NOT NULL DEFAULT '',
  `column_name` varchar(64) NOT NULL DEFAULT '',
  `comment` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  `mimetype` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  `transformation` varchar(255) NOT NULL DEFAULT '',
  `transformation_options` varchar(255) NOT NULL DEFAULT '',
  `input_transformation` varchar(255) NOT NULL DEFAULT '',
  `input_transformation_options` varchar(255) NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Column information for phpMyAdmin';

-- --------------------------------------------------------

--
-- Table structure for table `pma__designer_settings`
--

CREATE TABLE `pma__designer_settings` (
  `username` varchar(64) NOT NULL,
  `settings_data` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Settings related to Designer';

--
-- Dumping data for table `pma__designer_settings`
--

INSERT INTO `pma__designer_settings` (`username`, `settings_data`) VALUES
('root', '{\"relation_lines\":\"true\",\"snap_to_grid\":\"off\",\"angular_direct\":\"direct\"}');

-- --------------------------------------------------------

--
-- Table structure for table `pma__export_templates`
--

CREATE TABLE `pma__export_templates` (
  `id` int(5) UNSIGNED NOT NULL,
  `username` varchar(64) NOT NULL,
  `export_type` varchar(10) NOT NULL,
  `template_name` varchar(64) NOT NULL,
  `template_data` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Saved export templates';

--
-- Dumping data for table `pma__export_templates`
--

INSERT INTO `pma__export_templates` (`id`, `username`, `export_type`, `template_name`, `template_data`) VALUES
(1, 'root', 'database', 'ghghkbn', '{\"quick_or_custom\":\"quick\",\"what\":\"sql\",\"structure_or_data_forced\":\"0\",\"table_select[]\":\"ordini\",\"table_structure[]\":\"ordini\",\"table_data[]\":\"ordini\",\"aliases_new\":\"\",\"output_format\":\"sendit\",\"filename_template\":\"@DATABASE@\",\"remember_template\":\"on\",\"charset\":\"utf-8\",\"compression\":\"none\",\"maxsize\":\"\",\"codegen_structure_or_data\":\"data\",\"codegen_format\":\"0\",\"csv_separator\":\",\",\"csv_enclosed\":\"\\\"\",\"csv_escaped\":\"\\\"\",\"csv_terminated\":\"AUTO\",\"csv_null\":\"NULL\",\"csv_columns\":\"something\",\"csv_structure_or_data\":\"data\",\"excel_null\":\"NULL\",\"excel_columns\":\"something\",\"excel_edition\":\"win\",\"excel_structure_or_data\":\"data\",\"json_structure_or_data\":\"data\",\"json_unicode\":\"something\",\"latex_caption\":\"something\",\"latex_structure_or_data\":\"structure_and_data\",\"latex_structure_caption\":\"Structure of table @TABLE@\",\"latex_structure_continued_caption\":\"Structure of table @TABLE@ (continued)\",\"latex_structure_label\":\"tab:@TABLE@-structure\",\"latex_relation\":\"something\",\"latex_comments\":\"something\",\"latex_mime\":\"something\",\"latex_columns\":\"something\",\"latex_data_caption\":\"Content of table @TABLE@\",\"latex_data_continued_caption\":\"Content of table @TABLE@ (continued)\",\"latex_data_label\":\"tab:@TABLE@-data\",\"latex_null\":\"\\\\textit{NULL}\",\"mediawiki_structure_or_data\":\"structure_and_data\",\"mediawiki_caption\":\"something\",\"mediawiki_headers\":\"something\",\"htmlword_structure_or_data\":\"structure_and_data\",\"htmlword_null\":\"NULL\",\"ods_null\":\"NULL\",\"ods_structure_or_data\":\"data\",\"odt_structure_or_data\":\"structure_and_data\",\"odt_relation\":\"something\",\"odt_comments\":\"something\",\"odt_mime\":\"something\",\"odt_columns\":\"something\",\"odt_null\":\"NULL\",\"pdf_report_title\":\"\",\"pdf_structure_or_data\":\"structure_and_data\",\"phparray_structure_or_data\":\"data\",\"sql_include_comments\":\"something\",\"sql_header_comment\":\"\",\"sql_use_transaction\":\"something\",\"sql_compatibility\":\"NONE\",\"sql_structure_or_data\":\"structure_and_data\",\"sql_create_table\":\"something\",\"sql_auto_increment\":\"something\",\"sql_create_view\":\"something\",\"sql_procedure_function\":\"something\",\"sql_create_trigger\":\"something\",\"sql_backquotes\":\"something\",\"sql_type\":\"INSERT\",\"sql_insert_syntax\":\"both\",\"sql_max_query_size\":\"50000\",\"sql_hex_for_binary\":\"something\",\"sql_utc_time\":\"something\",\"texytext_structure_or_data\":\"structure_and_data\",\"texytext_null\":\"NULL\",\"xml_structure_or_data\":\"data\",\"xml_export_events\":\"something\",\"xml_export_functions\":\"something\",\"xml_export_procedures\":\"something\",\"xml_export_tables\":\"something\",\"xml_export_triggers\":\"something\",\"xml_export_views\":\"something\",\"xml_export_contents\":\"something\",\"yaml_structure_or_data\":\"data\",\"\":null,\"lock_tables\":null,\"as_separate_files\":null,\"csv_removeCRLF\":null,\"excel_removeCRLF\":null,\"json_pretty_print\":null,\"htmlword_columns\":null,\"ods_columns\":null,\"sql_dates\":null,\"sql_relation\":null,\"sql_mime\":null,\"sql_disable_fk\":null,\"sql_views_as_tables\":null,\"sql_metadata\":null,\"sql_create_database\":null,\"sql_drop_table\":null,\"sql_if_not_exists\":null,\"sql_simple_view_export\":null,\"sql_view_current_user\":null,\"sql_or_replace_view\":null,\"sql_truncate\":null,\"sql_delayed\":null,\"sql_ignore\":null,\"texytext_columns\":null}');

-- --------------------------------------------------------

--
-- Table structure for table `pma__favorite`
--

CREATE TABLE `pma__favorite` (
  `username` varchar(64) NOT NULL,
  `tables` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Favorite tables';

-- --------------------------------------------------------

--
-- Table structure for table `pma__history`
--

CREATE TABLE `pma__history` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `username` varchar(64) NOT NULL DEFAULT '',
  `db` varchar(64) NOT NULL DEFAULT '',
  `table` varchar(64) NOT NULL DEFAULT '',
  `timevalue` timestamp NOT NULL DEFAULT current_timestamp(),
  `sqlquery` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='SQL history for phpMyAdmin';

-- --------------------------------------------------------

--
-- Table structure for table `pma__navigationhiding`
--

CREATE TABLE `pma__navigationhiding` (
  `username` varchar(64) NOT NULL,
  `item_name` varchar(64) NOT NULL,
  `item_type` varchar(64) NOT NULL,
  `db_name` varchar(64) NOT NULL,
  `table_name` varchar(64) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Hidden items of navigation tree';

-- --------------------------------------------------------

--
-- Table structure for table `pma__pdf_pages`
--

CREATE TABLE `pma__pdf_pages` (
  `db_name` varchar(64) NOT NULL DEFAULT '',
  `page_nr` int(10) UNSIGNED NOT NULL,
  `page_descr` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='PDF relation pages for phpMyAdmin';

-- --------------------------------------------------------

--
-- Table structure for table `pma__recent`
--

CREATE TABLE `pma__recent` (
  `username` varchar(64) NOT NULL,
  `tables` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Recently accessed tables';

--
-- Dumping data for table `pma__recent`
--

INSERT INTO `pma__recent` (`username`, `tables`) VALUES
('root', '[{\"db\":\"progettoagrario\",\"table\":\"utenti\"},{\"db\":\"progettoagrario\",\"table\":\"ordini\"},{\"db\":\"progettoagrario\",\"table\":\"prodotti\"},{\"db\":\"progettoagrario\",\"table\":\"dettagli_ordini\"},{\"db\":\"datimessina\",\"table\":\"datidinavigazione\"},{\"db\":\"prova\",\"table\":\"utenti\"},{\"db\":\"prova\",\"table\":\"conteggio\"},{\"db\":\"gestione_ordini\",\"table\":\"clienti\"},{\"db\":\"gestione_ordini\",\"table\":\"ordini\"},{\"db\":\"gestione_ordini\",\"table\":\"dettagli\"}]');

-- --------------------------------------------------------

--
-- Table structure for table `pma__relation`
--

CREATE TABLE `pma__relation` (
  `master_db` varchar(64) NOT NULL DEFAULT '',
  `master_table` varchar(64) NOT NULL DEFAULT '',
  `master_field` varchar(64) NOT NULL DEFAULT '',
  `foreign_db` varchar(64) NOT NULL DEFAULT '',
  `foreign_table` varchar(64) NOT NULL DEFAULT '',
  `foreign_field` varchar(64) NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Relation table';

-- --------------------------------------------------------

--
-- Table structure for table `pma__savedsearches`
--

CREATE TABLE `pma__savedsearches` (
  `id` int(5) UNSIGNED NOT NULL,
  `username` varchar(64) NOT NULL DEFAULT '',
  `db_name` varchar(64) NOT NULL DEFAULT '',
  `search_name` varchar(64) NOT NULL DEFAULT '',
  `search_data` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Saved searches';

-- --------------------------------------------------------

--
-- Table structure for table `pma__table_coords`
--

CREATE TABLE `pma__table_coords` (
  `db_name` varchar(64) NOT NULL DEFAULT '',
  `table_name` varchar(64) NOT NULL DEFAULT '',
  `pdf_page_number` int(11) NOT NULL DEFAULT 0,
  `x` float UNSIGNED NOT NULL DEFAULT 0,
  `y` float UNSIGNED NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Table coordinates for phpMyAdmin PDF output';

-- --------------------------------------------------------

--
-- Table structure for table `pma__table_info`
--

CREATE TABLE `pma__table_info` (
  `db_name` varchar(64) NOT NULL DEFAULT '',
  `table_name` varchar(64) NOT NULL DEFAULT '',
  `display_field` varchar(64) NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Table information for phpMyAdmin';

-- --------------------------------------------------------

--
-- Table structure for table `pma__table_uiprefs`
--

CREATE TABLE `pma__table_uiprefs` (
  `username` varchar(64) NOT NULL,
  `db_name` varchar(64) NOT NULL,
  `table_name` varchar(64) NOT NULL,
  `prefs` text NOT NULL,
  `last_update` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Tables'' UI preferences';

-- --------------------------------------------------------

--
-- Table structure for table `pma__tracking`
--

CREATE TABLE `pma__tracking` (
  `db_name` varchar(64) NOT NULL,
  `table_name` varchar(64) NOT NULL,
  `version` int(10) UNSIGNED NOT NULL,
  `date_created` datetime NOT NULL,
  `date_updated` datetime NOT NULL,
  `schema_snapshot` text NOT NULL,
  `schema_sql` text DEFAULT NULL,
  `data_sql` longtext DEFAULT NULL,
  `tracking` set('UPDATE','REPLACE','INSERT','DELETE','TRUNCATE','CREATE DATABASE','ALTER DATABASE','DROP DATABASE','CREATE TABLE','ALTER TABLE','RENAME TABLE','DROP TABLE','CREATE INDEX','DROP INDEX','CREATE VIEW','ALTER VIEW','DROP VIEW') DEFAULT NULL,
  `tracking_active` int(1) UNSIGNED NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Database changes tracking for phpMyAdmin';

-- --------------------------------------------------------

--
-- Table structure for table `pma__userconfig`
--

CREATE TABLE `pma__userconfig` (
  `username` varchar(64) NOT NULL,
  `timevalue` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `config_data` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='User preferences storage for phpMyAdmin';

--
-- Dumping data for table `pma__userconfig`
--

INSERT INTO `pma__userconfig` (`username`, `timevalue`, `config_data`) VALUES
('root', '2025-01-10 07:24:40', '{\"Console\\/Mode\":\"collapse\",\"lang\":\"en_GB\",\"ThemeDefault\":\"pmahomme\"}');

-- --------------------------------------------------------

--
-- Table structure for table `pma__usergroups`
--

CREATE TABLE `pma__usergroups` (
  `usergroup` varchar(64) NOT NULL,
  `tab` varchar(64) NOT NULL,
  `allowed` enum('Y','N') NOT NULL DEFAULT 'N'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='User groups with configured menu items';

-- --------------------------------------------------------

--
-- Table structure for table `pma__users`
--

CREATE TABLE `pma__users` (
  `username` varchar(64) NOT NULL,
  `usergroup` varchar(64) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Users and their assignments to user groups';

--
-- Indexes for dumped tables
--

--
-- Indexes for table `pma__bookmark`
--
ALTER TABLE `pma__bookmark`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `pma__central_columns`
--
ALTER TABLE `pma__central_columns`
  ADD PRIMARY KEY (`db_name`,`col_name`);

--
-- Indexes for table `pma__column_info`
--
ALTER TABLE `pma__column_info`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `db_name` (`db_name`,`table_name`,`column_name`);

--
-- Indexes for table `pma__designer_settings`
--
ALTER TABLE `pma__designer_settings`
  ADD PRIMARY KEY (`username`);

--
-- Indexes for table `pma__export_templates`
--
ALTER TABLE `pma__export_templates`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `u_user_type_template` (`username`,`export_type`,`template_name`);

--
-- Indexes for table `pma__favorite`
--
ALTER TABLE `pma__favorite`
  ADD PRIMARY KEY (`username`);

--
-- Indexes for table `pma__history`
--
ALTER TABLE `pma__history`
  ADD PRIMARY KEY (`id`),
  ADD KEY `username` (`username`,`db`,`table`,`timevalue`);

--
-- Indexes for table `pma__navigationhiding`
--
ALTER TABLE `pma__navigationhiding`
  ADD PRIMARY KEY (`username`,`item_name`,`item_type`,`db_name`,`table_name`);

--
-- Indexes for table `pma__pdf_pages`
--
ALTER TABLE `pma__pdf_pages`
  ADD PRIMARY KEY (`page_nr`),
  ADD KEY `db_name` (`db_name`);

--
-- Indexes for table `pma__recent`
--
ALTER TABLE `pma__recent`
  ADD PRIMARY KEY (`username`);

--
-- Indexes for table `pma__relation`
--
ALTER TABLE `pma__relation`
  ADD PRIMARY KEY (`master_db`,`master_table`,`master_field`),
  ADD KEY `foreign_field` (`foreign_db`,`foreign_table`);

--
-- Indexes for table `pma__savedsearches`
--
ALTER TABLE `pma__savedsearches`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `u_savedsearches_username_dbname` (`username`,`db_name`,`search_name`);

--
-- Indexes for table `pma__table_coords`
--
ALTER TABLE `pma__table_coords`
  ADD PRIMARY KEY (`db_name`,`table_name`,`pdf_page_number`);

--
-- Indexes for table `pma__table_info`
--
ALTER TABLE `pma__table_info`
  ADD PRIMARY KEY (`db_name`,`table_name`);

--
-- Indexes for table `pma__table_uiprefs`
--
ALTER TABLE `pma__table_uiprefs`
  ADD PRIMARY KEY (`username`,`db_name`,`table_name`);

--
-- Indexes for table `pma__tracking`
--
ALTER TABLE `pma__tracking`
  ADD PRIMARY KEY (`db_name`,`table_name`,`version`);

--
-- Indexes for table `pma__userconfig`
--
ALTER TABLE `pma__userconfig`
  ADD PRIMARY KEY (`username`);

--
-- Indexes for table `pma__usergroups`
--
ALTER TABLE `pma__usergroups`
  ADD PRIMARY KEY (`usergroup`,`tab`,`allowed`);

--
-- Indexes for table `pma__users`
--
ALTER TABLE `pma__users`
  ADD PRIMARY KEY (`username`,`usergroup`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `pma__bookmark`
--
ALTER TABLE `pma__bookmark`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `pma__column_info`
--
ALTER TABLE `pma__column_info`
  MODIFY `id` int(5) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `pma__export_templates`
--
ALTER TABLE `pma__export_templates`
  MODIFY `id` int(5) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `pma__history`
--
ALTER TABLE `pma__history`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `pma__pdf_pages`
--
ALTER TABLE `pma__pdf_pages`
  MODIFY `page_nr` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `pma__savedsearches`
--
ALTER TABLE `pma__savedsearches`
  MODIFY `id` int(5) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- Database: `progettoagrario`
--
CREATE DATABASE IF NOT EXISTS `progettoagrario` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `progettoagrario`;

-- --------------------------------------------------------

--
-- Table structure for table `dettagli_ordini`
--

CREATE TABLE `dettagli_ordini` (
  `ordine_ID` int(11) NOT NULL,
  `prodotto_ID` int(11) NOT NULL,
  `quantità_ordinata` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `ordini`
--

CREATE TABLE `ordini` (
  `ID_ordine` int(11) NOT NULL,
  `utente_ID` int(11) NOT NULL,
  `dataordine` date NOT NULL,
  `statoordine` char(75) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `prodotti`
--

CREATE TABLE `prodotti` (
  `ID_prodotto` int(11) NOT NULL,
  `nome` char(100) NOT NULL,
  `descrizione` char(255) NOT NULL,
  `quantità` int(100) NOT NULL,
  `prezzo` float(65,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `prodotti`
--

INSERT INTO `prodotti` (`ID_prodotto`, `nome`, `descrizione`, `quantità`, `prezzo`) VALUES
(8, 'Cactus', 'Cactus', 17, 5.99),
(9, 'Pump It Up', 'boh dei tasti dove salti', 1, 500.99);

-- --------------------------------------------------------

--
-- Table structure for table `utenti`
--

CREATE TABLE `utenti` (
  `ID_utente` int(11) NOT NULL,
  `nome` char(50) NOT NULL,
  `email` char(100) NOT NULL,
  `password` char(255) NOT NULL,
  `tipo_utente` char(40) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `utenti`
--

INSERT INTO `utenti` (`ID_utente`, `nome`, `email`, `password`, `tipo_utente`) VALUES
(150, 'ale', 'aaaa565@gmail.com', '$2y$10$MQL7ju/hM5hy7knpWZOEOeL4ekIoI96PcbYxalGxXrfx0BBWz5y/6', 'admin'),
(151, 'Ciao', 'ale@gmail.com', '$2y$10$FFgD863FpbkDNIRaSdtiheeY7yXSHtn3ghRCoj4dJ.O1KEyEf2yg2', 'cliente'),
(152, 'BJM', 'bjm@gmail.com', '$2y$10$RBX1.btgsf7Oo4JEUK0nW.qMVFZ4SV3C.AhtcsI/5hd3LuzcFtKTK', 'admin'),
(155, 'Ciao', 'ciao@gmail.com', '$2y$10$ra6e/71ZfYWtM4.fOnfTLefqLhEmtokjSktG.9jxHJjqvmDPIAKH.', 'cliente'),
(156, 'pino', 'pino@gmail.com', '$2y$10$KJptkztjWkE.EWpRA1aZR.TkWwwxhwVFLiVyTDuxEj1079lnI.AXa', 'cliente');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `dettagli_ordini`
--
ALTER TABLE `dettagli_ordini`
  ADD KEY `ordine_ID` (`ordine_ID`),
  ADD KEY `prodotto_ID` (`prodotto_ID`);

--
-- Indexes for table `ordini`
--
ALTER TABLE `ordini`
  ADD PRIMARY KEY (`ID_ordine`),
  ADD KEY `utente_ID` (`utente_ID`);

--
-- Indexes for table `prodotti`
--
ALTER TABLE `prodotti`
  ADD PRIMARY KEY (`ID_prodotto`);

--
-- Indexes for table `utenti`
--
ALTER TABLE `utenti`
  ADD PRIMARY KEY (`ID_utente`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `ordini`
--
ALTER TABLE `ordini`
  MODIFY `ID_ordine` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `prodotti`
--
ALTER TABLE `prodotti`
  MODIFY `ID_prodotto` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `utenti`
--
ALTER TABLE `utenti`
  MODIFY `ID_utente` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=157;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `dettagli_ordini`
--
ALTER TABLE `dettagli_ordini`
  ADD CONSTRAINT `dettagli_ordini_ibfk_1` FOREIGN KEY (`ordine_ID`) REFERENCES `ordini` (`ID_ordine`),
  ADD CONSTRAINT `dettagli_ordini_ibfk_2` FOREIGN KEY (`prodotto_ID`) REFERENCES `prodotti` (`ID_prodotto`);

--
-- Constraints for table `ordini`
--
ALTER TABLE `ordini`
  ADD CONSTRAINT `ordini_ibfk_1` FOREIGN KEY (`utente_ID`) REFERENCES `utenti` (`ID_utente`);
--
-- Database: `prova`
--
CREATE DATABASE IF NOT EXISTS `prova` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `prova`;

-- --------------------------------------------------------

--
-- Table structure for table `conteggio`
--

CREATE TABLE `conteggio` (
  `ID_conta` int(11) NOT NULL,
  `conta` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `conteggio`
--

INSERT INTO `conteggio` (`ID_conta`, `conta`) VALUES
(1, 0),
(2, 0),
(3, 1),
(4, 1);

-- --------------------------------------------------------

--
-- Table structure for table `utenti`
--

CREATE TABLE `utenti` (
  `ID_UTENTE` int(11) NOT NULL,
  `NAME` char(50) NOT NULL,
  `COGNOME` char(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `utenti`
--

INSERT INTO `utenti` (`ID_UTENTE`, `NAME`, `COGNOME`) VALUES
(1, 'dsfs', 'sdfsdf'),
(2, 'Leonardo', 'Da Pont'),
(3, 'Favij', 'BJM'),
(4, 'fgh', 'gfh'),
(5, 'asdasda', 'sdasdasd');

-- --------------------------------------------------------

--
-- Table structure for table `utenti2`
--

CREATE TABLE `utenti2` (
  `ID` int(11) NOT NULL,
  `pass` char(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `conteggio`
--
ALTER TABLE `conteggio`
  ADD PRIMARY KEY (`ID_conta`);

--
-- Indexes for table `utenti`
--
ALTER TABLE `utenti`
  ADD PRIMARY KEY (`ID_UTENTE`);

--
-- Indexes for table `utenti2`
--
ALTER TABLE `utenti2`
  ADD PRIMARY KEY (`ID`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `conteggio`
--
ALTER TABLE `conteggio`
  MODIFY `ID_conta` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `utenti`
--
ALTER TABLE `utenti`
  MODIFY `ID_UTENTE` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `utenti2`
--
ALTER TABLE `utenti2`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;
--
-- Database: `test`
--
CREATE DATABASE IF NOT EXISTS `test` DEFAULT CHARACTER SET latin1 COLLATE latin1_swedish_ci;
USE `test`;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
