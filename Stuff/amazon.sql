-- phpMyAdmin SQL Dump
-- version 4.6.5.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Creato il: Apr 15, 2017 alle 13:45
-- Versione del server: 10.1.21-MariaDB
-- Versione PHP: 7.1.1

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
-- Struttura della tabella `dettagli`
--

CREATE TABLE `dettagli` (
  `ordine` int(11) NOT NULL,
  `prodotto` int(11) NOT NULL,
  `quantita` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Struttura della tabella `ordine`
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
-- Struttura della tabella `prodotto`
--

CREATE TABLE `prodotto` (
  `cod` int(11) NOT NULL,
  `immagine` varchar(20) DEFAULT NULL,
  `nome` varchar(20) NOT NULL,
  `descrizione` varchar(20) DEFAULT NULL,
  `prezzo` float NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dump dei dati per la tabella `prodotto`
--

INSERT INTO `prodotto` (`cod`, `immagine`, `nome`, `descrizione`, `prezzo`) VALUES
(1, NULL, 'Nintendo Wii', 'una triste console', 109.99),
(2, NULL, 'Nintendo DS', 'una vecchia console', 50.99),
(3, NULL, 'Giulio Pertile', 'un triste giocatore', 0.98),
(4, NULL, 'Overwatch', 'uno zoo', 39.99),
(5, NULL, 'Apple iPhone', 'un telefono costoso', 1200.96);

--
-- Indici per le tabelle scaricate
--

--
-- Indici per le tabelle `dettagli`
--
ALTER TABLE `dettagli`
  ADD PRIMARY KEY (`ordine`,`prodotto`),
  ADD KEY `numero` (`prodotto`);

--
-- Indici per le tabelle `ordine`
--
ALTER TABLE `ordine`
  ADD PRIMARY KEY (`cod`);

--
-- Indici per le tabelle `prodotto`
--
ALTER TABLE `prodotto`
  ADD PRIMARY KEY (`cod`);

--
-- AUTO_INCREMENT per le tabelle scaricate
--

--
-- AUTO_INCREMENT per la tabella `ordine`
--
ALTER TABLE `ordine`
  MODIFY `cod` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT per la tabella `prodotto`
--
ALTER TABLE `prodotto`
  MODIFY `cod` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
--
-- Limiti per le tabelle scaricate
--

--
-- Limiti per la tabella `dettagli`
--
ALTER TABLE `dettagli`
  ADD CONSTRAINT `dettagli_ibfk_1` FOREIGN KEY (`ordine`) REFERENCES `ordine` (`cod`),
  ADD CONSTRAINT `dettagli_ibfk_2` FOREIGN KEY (`prodotto`) REFERENCES `prodotto` (`cod`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
