-- phpMyAdmin SQL Dump
-- version 4.6.5.2
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Apr 07, 2017 at 10:28 
-- Server version: 10.1.21-MariaDB
-- PHP Version: 7.1.1

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `amazon`
--

-- --------------------------------------------------------

--
-- Table structure for table `dettagli`
--

CREATE TABLE `dettagli` (
  `ordine` int(11) NOT NULL,
  `numero` int(11) NOT NULL,
  `prodotto` int(11) NOT NULL,
  `quantita` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `ordine`
--

CREATE TABLE `ordine` (
  `cod` int(11) NOT NULL,
  `codFiscale` varchar(20) NOT NULL,
  `indirizzo` varchar(20) DEFAULT NULL,
  `data` date NOT NULL,
  `pagamento` enum('paypal','carta','contanti') NOT NULL DEFAULT 'paypal'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `prodotto`
--

CREATE TABLE `prodotto` (
  `cod` int(11) NOT NULL,
  `immagine` varchar(20) DEFAULT NULL,
  `nome` varchar(20) NOT NULL,
  `descrizione` varchar(20) DEFAULT NULL,
  `prezzo` float NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `prodotto`
--

INSERT INTO `prodotto` (`cod`, `immagine`, `nome`, `descrizione`, `prezzo`) VALUES
(1, NULL, 'Nintendo Wii', 'una triste console', 109.99),
(2, NULL, 'Nintendo DS', 'una vecchia console', 50.99),
(3, NULL, 'Giulio Pertile', 'un triste giocatore', 0.98),
(4, NULL, 'Overwatch', 'uno zoo', 39.99),
(5, NULL, 'Apple iPhone', 'un telefono costoso', 1200.96);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `dettagli`
--
ALTER TABLE `dettagli`
  ADD PRIMARY KEY (`ordine`,`numero`);

--
-- Indexes for table `ordine`
--
ALTER TABLE `ordine`
  ADD PRIMARY KEY (`cod`);

--
-- Indexes for table `prodotto`
--
ALTER TABLE `prodotto`
  ADD PRIMARY KEY (`cod`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `ordine`
--
ALTER TABLE `ordine`
  MODIFY `cod` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `prodotto`
--
ALTER TABLE `prodotto`
  MODIFY `cod` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
--
-- Constraints for dumped tables
--

--
-- Constraints for table `dettagli`
--
ALTER TABLE `dettagli`
  ADD CONSTRAINT `dettagli_ibfk_1` FOREIGN KEY (`ordine`) REFERENCES `ordine` (`cod`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
