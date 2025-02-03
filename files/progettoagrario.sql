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
-- Database: `progettoagrario`
--

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
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
