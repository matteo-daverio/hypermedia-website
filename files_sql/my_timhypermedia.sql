-- phpMyAdmin SQL Dump
-- version 4.1.7
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: Jun 24, 2016 at 05:53 PM
-- Server version: 5.6.29-log
-- PHP Version: 5.3.10

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `my_timhypermedia`
--
CREATE DATABASE IF NOT EXISTS `my_timhypermedia` DEFAULT CHARACTER SET latin1 COLLATE latin1_swedish_ci;
USE `my_timhypermedia`;

-- --------------------------------------------------------

--
-- Table structure for table `assistance_services`
--

DROP TABLE IF EXISTS `assistance_services`;
CREATE TABLE IF NOT EXISTS `assistance_services` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `Service` text NOT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=5 ;

--
-- Dumping data for table `assistance_services`
--

INSERT INTO `assistance_services` (`Id`, `Service`) VALUES
(1, 'Gestione Linea e Servizi'),
(2, 'Controllo Costi e Pagamenti'),
(3, 'Supporto Tecnico e Configurazione'),
(4, 'Contenuti e Smart Life');

-- --------------------------------------------------------

--
-- Table structure for table `assistance_services_element`
--

DROP TABLE IF EXISTS `assistance_services_element`;
CREATE TABLE IF NOT EXISTS `assistance_services_element` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `Subtitle_id` int(11) NOT NULL,
  `Element` text NOT NULL,
  `Link` int(11) NOT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=21 ;

--
-- Dumping data for table `assistance_services_element`
--

INSERT INTO `assistance_services_element` (`Id`, `Subtitle_id`, `Element`, `Link`) VALUES
(1, 1, 'Attivazione linea di casa', 1),
(2, 1, 'Variazione abbonamento', 2),
(3, 1, 'Restituzione prodotti', 3),
(4, 2, 'Disattivare i servizi di linea fissa', 4),
(5, 2, 'Gli elenchi telefonici a casa tua', 5),
(6, 3, 'Richiedere un rimborso', 6),
(7, 3, 'Conto Online: cosa cambia dal 1° febbraio 2016', 7),
(8, 4, 'Verifica credito e bonus disponibili', 8),
(9, 4, 'Promozioni e rinnovi automatici', 9),
(10, 5, 'Modalit&agrave; di pagamento della fattura', 10),
(11, 6, 'Configurazione Mail su iPhone', 11),
(12, 6, 'Configurazione Mail su iPad', 12),
(13, 6, 'Configurazione Mail su Android', 13),
(14, 7, 'Decoder TIMvision', 14),
(15, 7, 'TIMvision da web', 15),
(16, 8, 'Cos''&egrave; TIMgames', 16),
(17, 8, 'Tutti i modi per abbonarsi', 17),
(18, 9, 'Cos''&egrave; TIMmusic', 18),
(19, 9, '	\r\nTutti i modi per acquistare', 19),
(20, 9, 'Come ascolto in modalit&agrave; offline?', 20);

-- --------------------------------------------------------

--
-- Table structure for table `assistance_services_subtitle`
--

DROP TABLE IF EXISTS `assistance_services_subtitle`;
CREATE TABLE IF NOT EXISTS `assistance_services_subtitle` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `Title_id` int(11) NOT NULL,
  `Subtitle` text NOT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=10 ;

--
-- Dumping data for table `assistance_services_subtitle`
--

INSERT INTO `assistance_services_subtitle` (`Id`, `Title_id`, `Subtitle`) VALUES
(1, 1, 'Gestione della Linea'),
(2, 1, 'Attivare e Disattivare i Servizi Telefonici'),
(3, 2, 'Fatture e Pagamenti'),
(4, 3, 'Ricaricabile'),
(5, 3, 'Abbonamento'),
(6, 4, 'Configurare la posta'),
(7, 5, 'TIMvision'),
(8, 6, 'Scopri TIMgames'),
(9, 7, 'Scopri TIMmusic');

-- --------------------------------------------------------

--
-- Table structure for table `assistance_services_title`
--

DROP TABLE IF EXISTS `assistance_services_title`;
CREATE TABLE IF NOT EXISTS `assistance_services_title` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `Service_id` int(11) NOT NULL,
  `Title` text NOT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=8 ;

--
-- Dumping data for table `assistance_services_title`
--

INSERT INTO `assistance_services_title` (`Id`, `Service_id`, `Title`) VALUES
(1, 1, 'Fisso'),
(2, 2, 'Fisso'),
(3, 2, 'Mobile'),
(4, 3, 'Smartphone e Tablet'),
(5, 3, 'Decoder e TV'),
(6, 4, 'TIMgames'),
(7, 4, 'TIMmusic');

-- --------------------------------------------------------

--
-- Table structure for table `device`
--

DROP TABLE IF EXISTS `device`;
CREATE TABLE IF NOT EXISTS `device` (
  `id` int(6) unsigned NOT NULL AUTO_INCREMENT,
  `nome` varchar(35) NOT NULL,
  `categoria` varchar(150) NOT NULL,
  `sottoCategoria` varchar(150) DEFAULT NULL,
  `gridImagePath` varchar(300) NOT NULL,
  `promo` tinyint(1) NOT NULL,
  `nuovo` tinyint(1) NOT NULL,
  `piuVenduto` tinyint(1) NOT NULL,
  `compraSubito` tinyint(1) DEFAULT '1',
  `aRate` tinyint(1) NOT NULL,
  `noleggio` tinyint(1) NOT NULL,
  `marca` varchar(100) NOT NULL,
  `prezzo` decimal(10,2) NOT NULL,
  `prezzoScontato` decimal(10,2) NOT NULL,
  `prezzoARate` varchar(100) NOT NULL,
  `prezzoANoleggio` decimal(10,2) NOT NULL,
  `descrizione` text NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=15 ;

--
-- Dumping data for table `device`
--

INSERT INTO `device` (`id`, `nome`, `categoria`, `sottoCategoria`, `gridImagePath`, `promo`, `nuovo`, `piuVenduto`, `compraSubito`, `aRate`, `noleggio`, `marca`, `prezzo`, `prezzoScontato`, `prezzoARate`, `prezzoANoleggio`, `descrizione`) VALUES
(1, 'Iphone6s', 'smartphone_telefoni', 'smartphone', 'images/grid200x276/iPhone6s1.png', 1, 0, 1, 1, 1, 1, 'Apple', 820.00, 800.00, '35.00 &euro; 24/mesi', 35.00, 'iPhone 6s mantiene tutte le caratteristiche che hanno reso straordinaria la generazione precedente di iPhone, e le spingono a un livello ancora pi&ugrave; avanzato. Viene realizzato in alluminio serie 7000, la lega pi&ugrave; robusta mai utilizzata per un iPhone. Il suo display Retina HD &egrave; fatto del vetro pi&ugrave; resistente che uno smartphone abbia mai avuto.'),
(2, 'Samsung Galaxy S7 Edge', 'smartphone_telefoni', 'smartphone', 'images/grid200x276/samsungGalaxyS7Edge1.png', 0, 1, 0, 1, 1, 0, 'Samsung', 820.00, 800.00, '35.00 &euro; 24/mesi', 35.00, 'Caratteristiche:'),
(3, 'Huawei P9 Plus', 'smartphone_telefoni', 'smartphone', 'images/grid200x276/huaweiP9Plus1.png', 1, 0, 0, 1, 1, 0, 'Huawei', 749.90, 650.00, '30.00 &euro; 24/mesi', 30.00, 'Caratteristiche:'),
(4, 'Cordless Facile Maxi', 'smartphone_telefoni', 'telefoni', 'images/grid200x276/cordlessFacileMaxi1.png', 0, 0, 0, 1, 0, 0, 'Tim', 35.90, 29.95, '5.00 &euro; 24/mesi', 5.00, 'Caratteristiche:'),
(5, 'IPad Air 2', 'tablet_computer', 'tablet', 'images/grid200x276/ipadAir2_1.png', 0, 1, 1, 1, 1, 0, 'Apple', 520.00, 450.00, '37.00 &euro; 24/mesi', 37.00, 'Caratteristiche:'),
(6, 'Decoder TIMvision', 'tv_smart_living', 'smart living', 'images/grid200x276/decoderTimVision.png', 0, 1, 1, 1, 0, 1, 'Tim', 49.00, 40.00, '15.00 &euro; 24/mesi', 2.00, 'Con il decoder TIMvision hai a disposizione pi&ugrave; di 8.000 titoli tra cartoni, film, serie e documentari sempre on demand per creare il tuo palinsesto senza interruzioni pubblicitarie. Puoi goderti la visione anche su Smart TV, su timvision.it e su app TIMvision per Smartphone, Tablet e PC, utilizzando le credenziali scelte al momento della registrazione al servizio TIMvision.'),
(7, 'Samsung Smart TV 50', 'tv_smart_living', 'tv', 'images/grid200x276/samsungSmartTv.png', 0, 1, 1, 1, 1, 0, 'Samsung', 936.00, 850.00, '40.00 &euro; 24/mesi', 15.00, 'Caratteristiche:'),
(8, 'Samsung Galaxy TabPro S 12', 'tablet_computer', 'computer', 'images/grid200x276/samsungGalaxyTabProS12_1.png', 0, 1, 1, 1, 1, 0, 'Samsung', 1299.90, 850.00, '35.00 &euro; 24/mesi', 35.00, 'Caratteristiche:'),
(9, 'Olivetti My Way', 'outlet', 'outlet', 'images/grid200x276/olivettiMyWay.png', 1, 0, 1, 1, 0, 0, 'Olivetti', 49.00, 19.00, '15.00 &euro; 24/mesi', 2.00, 'Caratteristiche:'),
(10, 'Modem ADSL Wi-Fi', 'modem_networking', 'modem', 'images/grid200x276/modemAdsl.png', 0, 1, 1, 1, 0, 1, 'Tim', 69.00, 59.00, '5.00 &euro; 24/mesi', 3.00, 'Caratteristiche:'),
(11, 'Polar Loop Activity Tracker', 'tv_smart_living', 'bracciali', 'images/grid200x276/polarLoop1.png', 0, 0, 1, 1, 0, 0, 'Polar', 99.90, 89.00, '4.00 &euro; 24/mesi', 5.00, 'Caratteristiche:'),
(12, 'Sony Smart Band Fifa Edition', 'tv_smart_living', 'bracciali', 'images/grid200x276/smartBandSony1.png', 1, 0, 1, 1, 0, 0, 'Sony', 79.90, 49.00, '3.50 &euro; 24/mesi', 3.00, 'Caratteristiche:'),
(13, 'Tim Tag', 'tv_smart_living', 'smart_living', 'images/grid200x276/timTag1.png', 1, 0, 1, 1, 0, 0, 'Tim', 129.90, 120.00, '5.00 &euro; 24/mesi', 5.00, 'Caratteristiche:'),
(14, 'Ihealth HS5', 'tv_smart_living', 'smart_living', 'images/grid200x276/IhealthHS5.png', 0, 0, 1, 1, 0, 0, 'iHealth', 119.90, 100.00, '5.00 &euro; 24/mesi', 5.00, 'Caratteristiche:');

-- --------------------------------------------------------

--
-- Table structure for table `device_assistance`
--

DROP TABLE IF EXISTS `device_assistance`;
CREATE TABLE IF NOT EXISTS `device_assistance` (
  `id` int(6) unsigned NOT NULL AUTO_INCREMENT,
  `id_device` int(6) NOT NULL,
  `id_assistance` int(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=7 ;

--
-- Dumping data for table `device_assistance`
--

INSERT INTO `device_assistance` (`id`, `id_device`, `id_assistance`) VALUES
(1, 1, 11),
(2, 5, 12),
(3, 2, 13),
(4, 3, 13),
(5, 6, 14),
(6, 6, 15);

-- --------------------------------------------------------

--
-- Table structure for table `device_sls`
--

DROP TABLE IF EXISTS `device_sls`;
CREATE TABLE IF NOT EXISTS `device_sls` (
  `id` int(6) unsigned NOT NULL AUTO_INCREMENT,
  `id_device` int(6) NOT NULL,
  `id_sls` int(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=7 ;

--
-- Dumping data for table `device_sls`
--

INSERT INTO `device_sls` (`id`, `id_device`, `id_sls`) VALUES
(1, 13, 0),
(2, 11, 1),
(3, 12, 1),
(4, 6, 2),
(5, 7, 2),
(6, 14, 4);

-- --------------------------------------------------------

--
-- Table structure for table `highlights`
--

DROP TABLE IF EXISTS `highlights`;
CREATE TABLE IF NOT EXISTS `highlights` (
  `Id` int(11) NOT NULL,
  `Title` text NOT NULL,
  `Description` text NOT NULL,
  `Link` int(11) NOT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `highlights`
--

INSERT INTO `highlights` (`Id`, `Title`, `Description`, `Link`) VALUES
(1, 'Highlights', 'Attivazione linea di casa', 1),
(2, 'Highlights', 'Configurazione Mail su iPhone', 11),
(3, 'Highlights', 'Decoder TIMvision', 14),
(4, 'Highlights', 'Configurazione Mail su Android', 13),
(5, 'Highlights', 'Cos’è TIMgames', 16),
(6, 'Highlights', 'Verifica credito e bonus disponibili', 8),
(7, 'Highlights', 'Cos''è TIMmusic', 18),
(8, 'Highlights', 'Modalità di pagamento della fattura', 10),
(9, 'Highlights', 'Richiedere un rimborso', 6),
(10, 'Highlights', 'Disattivare i servizi di linea fissa', 4);

-- --------------------------------------------------------

--
-- Table structure for table `immaginiDevice`
--

DROP TABLE IF EXISTS `immaginiDevice`;
CREATE TABLE IF NOT EXISTS `immaginiDevice` (
  `id` int(6) unsigned NOT NULL AUTO_INCREMENT,
  `alt` varchar(150) NOT NULL,
  `frontImagePath` varchar(300) NOT NULL,
  `sideImagePath` varchar(300) DEFAULT NULL,
  `backImagePath` varchar(300) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=15 ;

--
-- Dumping data for table `immaginiDevice`
--

INSERT INTO `immaginiDevice` (`id`, `alt`, `frontImagePath`, `sideImagePath`, `backImagePath`) VALUES
(1, 'Iphone6s', 'images/dispositivi/iPhone6s1.png', 'images/dispositivi/iPhone6s2.png', 'images/dispositivi/iPhone6s3.png'),
(2, 'SamsungGalaxyS7Edge', 'images/dispositivi/samsungGalaxyS7Edge1.png', 'images/dispositivi/samsungGalaxyS7Edge2.png', 'images/dispositivi/samsungGalaxyS7Edge3.png'),
(8, 'Samsung Galaxy TabPro S 12', 'images/dispositivi/samsungGalaxyTabProS12_1.png', 'images/dispositivi/samsungGalaxyTabProS12_2.png', 'images/dispositivi/samsungGalaxyTabProS12_3.png'),
(3, 'Huawei P9 Plus', 'images/dispositivi/huaweiP9Plus1.png', NULL, NULL),
(4, 'Cordless Facile Maxi', 'images/dispositivi/cordlessFacileMaxi1.png', NULL, NULL),
(5, 'IPad Air 2', 'images/dispositivi/ipadAir2_1.png', NULL, NULL),
(6, 'Decoder TIMvision', 'images/dispositivi/decoderTimvision1.png', NULL, NULL),
(9, 'Olivetti My Way', 'images/dispositivi/olivettiMyWay1.png', NULL, NULL),
(10, 'Modem ADSL Wi-Fi', 'images/dispositivi/modemAdsl1.png', NULL, NULL),
(11, 'Polar Loop Activity Tracker', 'images/dispositivi/polarLoop1.png', NULL, NULL),
(12, 'Sony Smart Band Fifa Edition', 'images/dispositivi/smartBandSony1.png', NULL, NULL),
(13, 'Tim Tag', 'images/dispositivi/timTag1.png', NULL, NULL),
(14, 'Ihealth HS5', 'images/dispositivi/IhealthHS51.png', NULL, NULL),
(7, 'Samsung Smart TV 50  + Soundbar con TIMvision', 'images/dispositivi/samsungSmartTv1.png', 'images/dispositivi/samsungSmartTv2.png', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `page_assistance`
--

DROP TABLE IF EXISTS `page_assistance`;
CREATE TABLE IF NOT EXISTS `page_assistance` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `Title` text NOT NULL,
  `Description` longtext NOT NULL,
  `Link` text NOT NULL,
  `Img` varchar(255) NOT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=21 ;

--
-- Dumping data for table `page_assistance`
--

INSERT INTO `page_assistance` (`Id`, `Title`, `Description`, `Link`, `Img`) VALUES
(11, 'Configurazione Mail su iPhone', '<p>Per aggiungere il tuo account di posta Alice su <strong>iPhone</strong>, tocca dal menu l''icona <strong>Impostazioni</strong>:</p><p><img alt="Icona impostazioni" src="images/assistenza/servizi/iPhone_impostazioni.jpg" style="width: 76px; height: 77px;"></p><p>Nelle <strong>Impostazioni</strong>:</p><ul class="acc_content"><li>scegli la voce <strong>Posta, contatti, calendari</strong></li><li>quindi <strong>Aggiungi account... </strong></li><li>dall''elenco dei provider vai su <strong>Altro</strong>:</li></ul><p><img alt="Aggiunta account email" src="images/assistenza/servizi/iPhone_mail_account.jpg"></p><ul class="acc_content"><li>tocca l''opzione <strong>Aggiungi account Mail</strong></li><li>compila i campi con i tuoi dati della casella di posta Alice:<ul class="acc_content"><li><strong>Nome</strong>: inserisci un nome a tua scelta;</li><li><strong>Indirizzo</strong>: il tuo indirizzo completo del dominio @alice.it;</li><li><strong>Password</strong>: digita la tua password di posta;</li><li><strong>Descrizione</strong>: inserisci un nome per specificare questo account (Alice, Casa, Ufficio, ...).</li></ul></li><li>tocca infine il tasto <strong>Avanti</strong>:</li></ul><p><img alt="Log in al servizio email" src="images/assistenza/servizi/iPhone_mail_login.jpg" style="width: 200px; height: 288px;"></p><p>L''iPhone nei passaggi successivi <strong>verifica automaticamente </strong>l''esistenza dell''account e il corretto funzionamento dei server di posta in entrata ed in uscita:</p><ul class="acc_content"><li>Se visualizzi il seguente avviso al termine della verifica ; tocca il tasto <strong>Si </strong>per completare la configurazione:</li></ul><p><img alt="Errore SSL" src="images/assistenza/servizi/iPhone_mail_error.jpg"></p><p>Per accedere alla casella di posta tocca l''icona <strong>Mail </strong>dal menu principale e seleziona il tuo account.</p><p><img alt="Icona email" src="images/assistenza/servizi/iPhone_mail_icon.jpg"></p><p><strong>N.B. </strong>iPhone configura in automatico la tua casella alice secondo il protocollo <strong>IMAP</strong>che permette di mantenere sincronizzata la tua mail con il server di posta; in questo modo anche l''eliminazione dei tuoi messaggi dal server avviene solo quando effettui la cancellazione da iPhone. Ti consigliamo di mantenere questa impostazione.</p><p> Se hai necessit&agrave; di configurare la mail su protocollo <strong>POP3 </strong>clicca sotto su ''Configurazione POP3'' </p><p>Se trovi comunque difficolt&agrave; nella configurazione, ti informiamo che &egrave; disponibile il nostro servizio di assistenza a pagamento <strong>SOS PC</strong>: il personale tecnico concorder&agrave; un <strong>intervento personalizzato</strong> per configurare in maniera ottimale il tuo iPhone.</p>', 'deviceByCategory.html?categoria=smartphone_telefoni&filter=[marca:Apple]', 'Supporto Tecnico e Configurazione'),
(1, 'Attivazione linea di casa', '<p>Richiedere l''attivazione di una linea telefonica di casa &egrave; molto semplice. puoi:</p><ul class="acc_content"><li>richiederla online</li><li>chiamare&nbsp;il Servizio Clienti linea fissa&nbsp;187</li><li>recarti&nbsp;presso un Negozio TIM.</li></ul><p>Verifica la modalit&agrave; di attivazione consultando on line le varie offerte disponibili.</p><p>I dati necessari sono:</p><ul class="acc_content"><li>nome e cognome</li><li>codice fiscale</li><li>indirizzo dell''abitazione per cui richiedi l''installazione della linea</li><li>un recapito telefonico di cellulare</li><li>indirizzo email (facoltativo).</li></ul><p>Il nostro personale tecnico ti contatter&agrave; quanto prima per concordare l''appuntamento per l''installazione dell''impianto telefonico.</p>', '0', 'Gestione Linea e Servizi'),
(2, 'Variazione Abbonamento', '<p>Se hai cessato la tua attivit&agrave; professionale, puoi richiedere la variazione del tuo contratto di abbonamento telefonico.<br>Per richiedere la variazione chiama il Servizio Clienti 191.</p><p>Con la richiesta della trasformazione del contratto dalla categoria Affari ("A") alla categoria Residenziale ("B") il costo del tuo abbonamento mensile passer&agrave; da:</p><ul class="acc_content">	<li><strong>22,50</strong> &euro; (IVA esclusa) a <strong>17,54</strong> &euro; (IVA al 22% inclusa), in caso di <strong>linea</strong> telefonica di <strong>base</strong></li>	<li><strong>31,00</strong> &euro; (IVA esclusa) a <strong>20,17</strong> &euro; (IVA al 22% inclusa), in caso di <strong>linea ISDN</strong>.</li></ul>', '0', 'Gestione Linea e Servizi'),
(3, 'Restituzione prodotti', '<p>Per cessare il noleggio di un prodotto, con la conseguente interruzione del relativo abbonamento, basta chiamare il Servizio Clienti linea fissa 187 e poi consegnare o spedire il prodotto insieme al modulo di accompagnamento che puoi scaricare da questa pagina.<br>Se hai chiesto il recesso dal Contratto di Noleggio e Manutenzione devi restituire il prodotto in noleggio entro e non oltre 30 giorni dalla data della richiesta di cessazione/recesso del contratto, e consegnarlo presso i seguenti Negozi TIM:</p><ul class="acc_content"><li>ROMA: &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Viale Liegi, 31</li><li>MILANO:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Piazza Cordusio snc - ang. Via Broletto</li><li>NAPOLI: &nbsp; &nbsp; &nbsp; &nbsp;&nbsp;Centro Direzionale - Isola A4</li><li>PALERMO: &nbsp; &nbsp; Via della libert&agrave;, 37/d</li><li>TREVISO:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Via XX Settembre, 2</li></ul><p>oppure spedirlo a mezzo pacco postale a:&nbsp;</p><p>&nbsp; &nbsp; &nbsp;&nbsp;&nbsp; Telecom Italia S.p.A. c/o Geodis Logistics<br>&nbsp; &nbsp; &nbsp; &nbsp; Magazzino Reverse A22<br>&nbsp; &nbsp; &nbsp; &nbsp; Piazzale Giorgio Ambrosoli snc<br>&nbsp; &nbsp; &nbsp; &nbsp; 27015 Landriano PV</p><p><span style="font-size:9.0pt"><o:p></o:p></span></p><p>Al pacco postale devi allegare il modulo di accompagnamento che puoi scaricare da questa pagina.</p>', '0', 'Gestione Linea e Servizi'),
(4, 'Disattivare i servizi di linea fissa', '<p>Registrandoti alla nostra Area Clienti puoi gestire autonomamente la cessazione dei servizi attivi sulla tua linea telefonica; una volta entrato naviga all''interno de "La mia Linea"-"Servizi e Offerte Attivi" oppure su "il Mio Conto" all''interno del "Dettaglio Costi" della fattura.</p><p>I servizi che puoi disattivare sono i seguenti:</p><ul class="acc_content">	<li>Payforme: &egrave; un servizio attivo di default che puoi disattivare nella sezione "La mia Linea" - "Riepilogo".</li>	<li>Chi &egrave; : servizio che ti consente di visualizzare sul display del tuo telefono predisposto il numero di chi ti sta chiamando, da rete fissa o da rete mobile.</li>	<li>Memotel: <strong>la&nbsp;segreteria telefonica che puoi attivare sulla tua linea di casa</strong>.</li>	<li>Trasferimento di chiamata: il servizio che ti consente di trasferire anche sul tuo cellulare le chiamate in arrivo al tuo numero di casa.</li>	<li>Ultima chiamata persa:componendo il 42400 dal telefono fisso puoi conoscere l''ultimo numero, sia fisso che mobile che ti ha chiamato, la data e l''ora.</li></ul><p>In alternativa:</p><ul class="acc_content">	<li>chiama il Servizio Clienti 187.</li></ul>', '0', 'Gestione Linea e Servizi'),
(6, 'Richiedere un rimborso', '<p><strong>Rimborso per doppio pagamento</strong><br>Se desideri chiedere il rimborso per un pagamento gi&agrave; effettuato, chiama il Servizio Clienti 187. Ti sar&agrave; chiesto di lasciare un tuo recapito telefonico e sarai ricontattato, entro quattro giorni lavorativi, dal nostro ufficio amministrativo per verificare i dati inerenti ai pagamenti effettuati ed eventualmente concordare le modalit&agrave; per il rimborso.</p><p><strong>Rimborso per anticipo conversazioni nazionali</strong><br>Se hai aderito al servizio di domiciliazione bancaria della tua fattura e ti risulta ancora non accreditato il rimborso per anticipo conversazioni, chiama il Servizio Clienti 187. I nostri operatori effettueranno insieme a te tutte le opportune verifiche.</p><p><strong>Rimborso per fattura negativa</strong><br>Per conoscere tempi e modalit&agrave; di rimborso, chiama il Servizio Clienti 187. I nostri operatori effettueranno insieme a te tutte le opportune verifiche.</p>', '0', 'Controllo Costi e Pagamenti'),
(5, 'Gli elenchi telefonici a casa tua', '<p><strong>Il servizio di consegna degli elenchi telefonici</strong> consente di ricevere ogni anno, comodamente presso l''indirizzo di ubicazione del tuo impianto telefonico, gli elenchi degli abbonati di linea&nbsp;fissa TIM e degli altri gestori telefonici, aggiornati all''anno in corso. Il servizio <strong>NON comprende il ritiro degli Elenchi telefonici relativi alle precedenti&nbsp;edizioni</strong>.</p><p>Il servizio di <strong>consegna elenchi telefonici &egrave; a pagamento al costo annuale di 2,50 &euro; (IVA inclusa).</strong> Il costo del servizio &egrave; addebitato sulla Fattura TIM della linea di casa; <strong>non &egrave; dovuto alcun importo agli addetti incaricati della distribuzione.</strong></p><p>Ti ricordiamo che &egrave; possibile <strong>rinunciare gratuitamente in qualsiasi momento al servizio di consegna degli elenchi telefonici, </strong>contattando telefonicamente il Servizio Clienti linea fissa 187 o inviando una comunicazione scritta all''indirizzo Telecom Italia&nbsp; indicato sulla Fattura o al numero verde fax 800000187 del Servizio Clienti; in tal caso TIM provveder&agrave; a non addebitare pi&ugrave; il relativo importo.<br>Per ulteriori informazioni sul servizio o per richiederlo in caso di precedente rinuncia, ti invitiamo a contattare il Servizio Clienti&nbsp;187, a disposizione 7 giorni su 7, dalle 7.00 alle 22.30.</p>', '0', 'Gestione Linea e Servizi'),
(7, 'Conto Online: cosa cambia dal 1&deg; febbraio 2016', '<p>A partire dal 1&deg; febbraio 2016, &egrave; cambiata&nbsp;la disciplina delle modalit&agrave; di fatturazione per i clienti ADSL e Fibra per incentivare l''utilizzo del servizio gratuito di ricezione on line della fattura in formato esclusivamente elettronico.</p><p>AI clienti ADSL e Fibra che hanno attiva la domiciliazione bancaria o postale e che abbiano un indirizzo di posta elettronica associata al Servizio (@alice.it o @tim.it), verr&agrave; attivato in automatico il servizio di ricezione delle fatture in formato esclusivamente elettronico (Conto Online).</p><p>Tale servizio consiste nella notifica via mail della possibilit&agrave; di visualizzare la fattura nella sezione MyTIM Fisso del sito&nbsp;<strong>tim.it</strong>&nbsp;e dunque nell''eliminazione della fattura&nbsp;cartacea e dei relativi costi. &nbsp;</p><p>Per tutti i clienti che non hanno la domiciliazione attiva, che non hanno un indirizzo e-mail associato al servizio, o che hanno scelto di non aderire al Conto Online, verr&agrave; mantenuto l''invio della fattura&nbsp;cartacea. Per questi clienti sar&agrave; addebitato un importo mensile di 2 euro IVA inclusa, comprensivo delle spese di spedizione.</p><p>Per eliminare l''invio della fattura&nbsp;cartacea e dei relativi costi, &egrave; possibile passare al Conto Online&nbsp; attivando la domiciliazione dei pagamenti e, se non si dispone di un indirizzo di posta elettronica associato al Servizio, &nbsp;richiedendone uno su <strong>https://mail.alice.it/</strong>&nbsp;direttamente dalla linea ADSL o Fibra di casa.</p><p>L''attivazione del servizio di domiciliazione bancaria su MyTIM Fisso &egrave; gratuita e gestibile direttamente&nbsp;<strong>online</strong>.</p><p>Per ulteriori dettagli sulla modifica&nbsp;delle Condizioni Generali dei contratti ADSL e FIBRA&nbsp;(adeguamento articolo&nbsp;"Condizioni economiche e modalit&agrave; di pagamento") ti rimandiamo alla lettura della relativa <strong>news</strong>.</p>', '0', 'Controllo Costi e Pagamenti'),
(10, 'Modalit&agrave; di pagamento della fattura', '<p>Se non hai gi&agrave; attiva una domiciliazione, &egrave; possibile effettuare il pagamento della fattura utilizzando una delle seguenti modalit&agrave;:</p><ul class="acc_content"><li>Tramite&nbsp;il servizio&nbsp;<strong>P@gonline</strong>. Accedi a <strong>MyTIM Mobile</strong>. Se sei titolare di una Carta di Credito dei circuiti VISA, MASTERCARD o AMERICAN EXPRESS, potrai utilizzarla per effettuare il pagamento delle fatture da saldare, senza costi aggiuntivi, in modo semplice e sicuro.<br>Al termine dell''operazione, riceverai conferma di avvenuto pagamento all''indirizzo email indicato in fase di registrazione a MyTIM Mobile.&nbsp;<br>Ti ricordiamo che non &egrave; possibile effettuare il pagamento di pi&ugrave; fatture con un''unica transazione.</li><li>Tramite i circuiti&nbsp;<strong>Lottomatica Servizi e Sisal</strong>. Recandoti in un qualsiasi punto vendita autorizzato su tutto il territorio nazionale, puoi effettuare il pagamento consegnando all''addetto del punto vendita il bollettino postale premarcato allegato alle nostre comunicazioni o in alternativa comunicando il tuo numero di telefono e l''importo del rendiconto telefonico da saldare.&nbsp;<br>Al termine dell''operazione verr&agrave; rilasciata una ricevuta di attestazione di avvenuto pagamento.&nbsp;<br>Ti ricordiamo che dai punti vendita &egrave; possibile pagare in contanti o&nbsp;con carta bancomat e, dai siti web dei circuiti, con carta di credito.</li><li>Attraverso il&nbsp;<strong>bollettino premarcato</strong>&nbsp;allegato alle nostre fatture (se ricevi la fattura cartacea) o comunicazioni, utilizzabile presso tutti gli uffici postali e presso gli sportelli degli Istituti di Credito convenzionati;</li><li><strong>Altre modalit&agrave;</strong>: &egrave; possibile effettuare il pagamento su Conto Corrente postale n.ro 28027001 (compilando un bollettino in bianco) intestato a TELECOM ITALIA S.p.A. Via Gaetano Negri 1 - 20123 MILANO o tramite bonifico bancario da effettuare sulle coordinate "BANCA INTESA SPA - Iban&nbsp; IT&nbsp; 16&nbsp; N&nbsp; 03069&nbsp; 05073 000000610115".&nbsp;<br>Nella causale di versamento sar&agrave; necessario indicare sempre il numero dell''utenza, la denominazione sociale o nome e cognome&nbsp;del titolare del contratto ed il bimestre di riferimento.&nbsp;<br>In caso di utilizzo di queste ultime due modalit&agrave; di pagamento, ti invitiamo a comunicare telefonicamente gli estremi di pagamento al Servizio Clienti 119. Nel caso in cui la tua linea sia stata sospesa sar&agrave; necessario&nbsp;inviarci la copia della ricevuta attestante l''avvenuto pagamento.<br>Se hai gi&agrave; registrato la tua linea a <strong>MyTIM Mobile</strong>, puoi&nbsp;compilare ed inviare direttamente <strong>online</strong> la "Richiesta di riattivazione linea e comunicazione estremi di pagamento" disponibile nella sezione <strong>MODULI</strong>&nbsp;sotto la voce "Clienti con abbonamento" allegando la<strong> </strong>copia della ricevuta.&nbsp;Se non sei registrato potrai inviare la copia della ricevuta di pagamento secondo le modalit&agrave; indicate dal Servizio Clienti 119.</li></ul><p>Ti ricordiamo che...</p>Puoi decidere in ogni momento di attivare il&nbsp;<strong>pagamento automatico</strong>&nbsp;sul tuo Conto Corrente o sulla tua Carta di Credito della tua fattura, in modo da non doverti pi&ugrave; preoccupare della data di scadenza.&nbsp;', '0', 'Controllo Costi e Pagamenti'),
(8, 'Verifica credito residuo e bonus disponibili', '<p>Il credito residuo disponibile, le offerte e lo stato dei&nbsp;bonus attivi sulla tua linea ricaricabile, sono consultabili attraverso le seguenti modalit&agrave;:</p><ul class="acc_content"><li>Direttamente dal tuo Smartphone, accedendo&nbsp;all''<strong>app MyTIM Mobile</strong>, attualmente disponibile in download gratuito nelle versioni per iPhone e per smartphone con sistema operativo Android.</li><li>Direttamente online sul sito tim.it nella sezione&nbsp;MyTIM Mobile&nbsp;riservata ai nostri clienti che ti permette di verificare il credito residuo, le quantit&agrave; di minuti, SMS, GB ancora disponibili, i bonus in euro &nbsp;eventualmente presenti&nbsp;ed effettuare variazioni sulla tua linea telefonica;</li><li><strong>Chiamando il numero gratuito 40916,</strong>&nbsp;per il credito residuo. Inoltre digitando il tasto 1 puoi conoscere le offerte attive, la quantit&agrave; di minuti, SMS, GB ancora disponibili e i bonus in euro eventualmente presenti;</li><li>Attraverso il&nbsp;<strong>servizio gratuito&nbsp;</strong>119sms;<strong>&nbsp;inviando un sms al 119</strong>&nbsp;"a testo libero"(ad esempio "qual &egrave; il mio credito residuo") il servizio ti risponder&agrave; con un sms con le informazioni richieste;</li>\r\n\r\n\r\n<li>Attraverso l''attivazione del&nbsp;<strong>servizio gratuito </strong>"TIM Ti Avvisa&nbsp;- info sms"&nbsp;che ti permette di conoscere il costo dell''ultima chiamata nazionale effettuata e il credito residuo aggiornato in tempo reale grazie alla ricezione di un sms direttamente sul tuo telefonino oppure con il servizio "TIM Ti Avvisa - offerte" puoi essere informato con un sms gratuito quando il consumo delle tue offerte attive raggiunge la percentuale da te scelta;</li>\r\n\r\n\r\n\r\n</ul><p>&nbsp;<br>Se sulla tua linea sono presenti&nbsp;offerte e bonus in euro, la priorit&agrave; di consumo segue generalmente&nbsp;il seguente criterio:</p><p>1. Minuti, sms, GB inclusi nell''offerta attiva;</p><p>2. Bonus in euro con scadenza;</p><p>2. Bonus in euro senza scadenza;</p><p>3. Credito residuo.</p><p>In presenza di due o pi&ugrave; bonus &egrave; prioritario quello con scadenza pi&ugrave; immediata.</p><p>Ti ricordiamo che il bonus in euro non pu&ograve; essere utilizzato per <strong>le chiamate internazionali</strong>, per le chiamate verso numerazioni non geografiche (in Italia e all''estero) e per il <strong>traffico roaming</strong> (ad eccezione del traffico roaming dati).</p><p>Per ulteriori dettagli sulle condizioni di utilizzo dei bonus in euro presenti sulla tua linea, consulta la pagina dedicata nella sezione Offerte del sito tim.it.</p><p>Ti ricordiamo infine che per poter usufruire delle offerte&nbsp;e degli eventuali bonus in euro presenti sulla linea, il credito residuo della tua SIM deve essere maggiore di zero.</p>', '0', 'Controllo Costi e Pagamenti'),
(9, 'Promozioni e rinnovi automatici', '<p>Se hai una linea Ricaricabile ed hai acquistato una Promozione che prevede il rinnovo periodico di un bundle di traffico in chiamate, SMS o navigazione Internet, ti ricordiamo che il rinnovo dell''opzione avverr&agrave; al massimo entro 4 ore dalla mezzanotte della data di scadenza prevista dall''offerta. Il rinnovo &egrave; sempre confermato con un SMS.</p><p>Ti ricordiamo di verificare che il giorno del rinnovo la tua TIM Card disponga di un credito sufficiente.</p><p>Prima di usufruire del servizio ti invitiamo comunque a verificare l''avvenuto rinnovo del bundle previsto dalla Promozione contattando il numero gratuito <strong>40916</strong> (per Clienti Ricaricabili).</p><p>Inoltre potrai sempre verificare lo stato della tua Promozione consultando l''<strong>MyTIM Mobile</strong>, navigando dal telefonino sul sito <strong>TIM.it ottimizzato per il tuo Smartphone</strong>, oppure attraverso l''<strong>app MyTIM Mobile</strong>.</p><p><strong>N.B.</strong><br>Ti ricordiamo che in caso di navigazione Internet senza offerta dati attiva o rinnovata si applica la <strong>tariffa dati base</strong>.</p>', '0', 'Controllo Costi e Pagamenti'),
(12, 'Configurazione Mail su iPad', '<p>Per aggiungere il tuo account di posta Alice su iPad, tocca dal menu l''icona <strong>Impostazioni</strong>:</p><p><img alt="Icona impostazioni" src="images/assistenza/servizi/iPhone_impostazioni.jpg" style="width: 76px; height: 77px;"></p><p>Nelle <strong>Impostazioni</strong>:</p><ul class="acc_content">	<li>scegli la voce <strong>E-mail, contatti, calendari</strong></li>	<li>quindi <strong>Aggiungi account... </strong>sulla destra</li>	<li>dall''elenco dei provider vai su <strong>Altro</strong>:</li></ul><p align="center"><img alt="Selezione account mail" src="images/assistenza/servizi/iPad_mail_account.jpg" style="width: 500px; height: 377px;"></p><ul class="acc_content">	<li>tocca l''opzione <strong>Aggiungi account Mail</strong></li>	<li>compila i campi con i tuoi dati della casella di posta Alice:	<ul class="acc_content">		<li><strong>Nome</strong>: inserisci un nome a tua scelta;</li>		<li><strong>Indirizzo</strong>: il tuo indirizzo completo del dominio @alice.it;</li>		<li><strong>Password</strong>: digita la tua password di posta;</li>		<li><strong>Descrizione</strong>: inserisci un nome per specificare questo account (Alice, Casa, Ufficio, ...).</li>	</ul>	</li>	<li>tocca infine il tasto <strong>Salva</strong>:</li></ul><p align="center"><img alt="creazione account" src="images/assistenza/servizi/iPad_mail_login.jpg"></p><p>L''iPad nei passaggi successivi <strong>verifica automaticamente </strong>l''esistenza dell''account e il corretto funzionamento dei server di posta in entrata ed in uscita (''Cerco account'' e ''Verifico'').</p><ul class="acc_content">	<li>Al termine della verifica potresti visualizzare il seguente avviso, in questo caso tocca il tasto <strong>Si </strong>per completare la configurazione:</li></ul><p align="center"><img alt="errore SSL" src="images/assistenza/servizi/iPhone_mail_error.jpg"></p><p>Per accedere alla casella di posta tocca l''icona <strong>Mail </strong>dal menu principale e seleziona il tuo account.</p><p><img alt="icona mail" src="images/assistenza/servizi/iPhone_mail_icon.jpg"></p><p><strong>Se riscontri difficolt&agrave; nell''invio dei messaggi, seleziona di seguito la voce ''Gestione posta in uscita SMTP''</strong>.</p><p><strong>N.B. </strong>iPad configura in automatico <strong>per la ricezione dei messaggi</strong> della tua casella Alice&nbsp;il <strong>protocollo</strong> <strong>IMAP </strong>che permette di mantenere sincronizzato lo stato della tua&nbsp;mail&nbsp;con il server di posta; in questo modo anche l''eliminazione dei tuoi messaggi dal server avviene solo quando effettui la cancellazione da iPad. <strong>Ti consigliamo di mantenere questa impostazione sul tuo tablet</strong>.</p><p>Se hai necessit&agrave; di configurare la ricezione dei messaggi&nbsp;tramite protocollo <strong>POP3 </strong>segui le indicazioni riportate di seguito alla voce ''Gestione POP3''.</p><p>Se trovi comunque difficolt&agrave; nella configurazione, ti informiamo che &egrave; disponibile il nostro servizio di assistenza a pagamento <strong>SOS PC</strong>: il personale tecnico concorder&agrave; un <strong>intervento personalizzato</strong> per configurare in maniera ottimale il tuo iPad.</p>', 'deviceByCategory.html?categoria=tablet_computer&filter=[marca:Apple],[sottoCategoria:tablet]', 'Supporto Tecnico e Configurazione'),
(14, 'Decoder TIMvision', '<p>Di seguito &egrave; riportato il significato dei led e delle porte presenti sul decoder&nbsp; <strong>TIMvision </strong>. </p>\r\n<p><strong><font color="#e0001a">Led parte frontale </font></strong></p>\r\n<p align="center"><img alt="led parte frontale" src="images/assistenza/servizi/timvision_front.jpg"> </p>\r\n<p></p>\r\n<ul class="acc_content">\r\n<li><strong>1 </strong><strong>-&nbsp;Led di Stato del decoder TIMvision </strong>:&nbsp; \r\n<ul class="acc_content">\r\n<li>VERDE: acceso \r\n</li><li>ROSSO: standby \r\n</li><li>VERDE lampeggiante: aggiornamento in corso (non spegnere o scollegare da Internet) \r\n</li><li>ROSSO lampeggiante: condizione d''errore; contattare il Numero Verde 800.187.800&nbsp; </li></ul>\r\n</li><li><strong>2 - Ricevitore infrarossi </strong>per il telecomando </li></ul>\r\n<p><strong><font color="#e0001a">Porte pannello posteriore&nbsp; </font></strong>&nbsp; </p>\r\n<p align="center"><img alt="led posteriori"  src="images/assistenza/servizi/timvision_back.jpg"> </p>\r\n<p></p>\r\n<ul class="acc_content">\r\n<li><strong>3 -&nbsp;Presa </strong>per il <strong>cavo&nbsp;di alimentazione elettrica </strong>&nbsp; \r\n</li><li><strong>4 -&nbsp;Interruttore di accensione/spegnimento </strong>(I: acceso)&nbsp; \r\n</li><li><strong>5 - Porta Ethernet </strong>per collegamento via cavo al modem Telecom Italia \r\n</li><li><strong>6 - Porta HDMI </strong>per collegamento alla TV (necessario per i contenuti HD) <strong></strong>\r\n</li><li><strong>7 - Sigillo di garanzia </strong>del prodotto \r\n</li><li><strong>8 - Porta USB 2.0 </strong>\r\n</li><li><strong>9&nbsp;- Uscita audio digitale ottica </strong>per il collegamento&nbsp;al&nbsp;corrispondente ingresso del televisore o dell''amplificatore &nbsp;multicanale o stereo \r\n</li><li><strong>10&nbsp;- Connettore video analogico </strong>\r\n</li><li><strong>11&nbsp;- Connettori audio analogici (R e L)&nbsp; </strong>per il collegamento agli ingressi audio analogici della porta AV del televisore o per collegare impianti Home Theatre o HI-FI \r\n</li><li><strong>12 - Tasto di Reset </strong>del decoder. <strong>Riporta il dispositivo alle impostazioni di fabbrica </strong>. Premere con una punta per 4 secondi fino al lampeggiare verde del led nella parte frontale. Attendere il completamento del reset finch&egrave; il led diventa rosso (standby)&nbsp;senza scollegare o spegnere il dispositivo; a questo punto sar&agrave; possibile accendere nuovamente il decoder. \r\n</li><li><strong>13 - Ingresso/uscita Antenna TV </strong>per la fruizione dei canali televisivi del digitale terrestre. <strong></strong>Collegare il cavo d''antenna dall''impianto di casa al <strong>connettore IN </strong>e dal <strong>connettore OUT </strong>alla presa del televisore. </li></ul>', 'page.device.html?id=6&categoria=tv_smart_living', 'Supporto Tecnico e Configurazione'),
(13, 'Configurazione Mail su Android', '<p>Per configurare la casella di posta &egrave; necessario che sia attiva la connessione internet, il tuo dispositivo mobile infatti si collegher&agrave;&nbsp; al server per verificare i dati immessi.</p><p>Puoi utilizzare la tua casella Alice sul tuo dispositivo <strong>Android </strong>secondo il protocollo <strong>IMAP</strong> oppure <strong>POP3</strong>.</p><p>Ti consigliamo di configurare il tuo dispositivo con il protocollo <strong>IMAP </strong>in quanto ti permette di mantenere sincronizzata la tua mail con il server di posta; in questo modo anche l''eliminazione dei tuoi messaggi dal server avviene solo quando effettui la cancellazione dal tuo dispositivo.</p><ul class="acc_content">	<li>Per iniziare tocca il menu <strong>Applicazioni</strong> e poi<strong> Email</strong></li></ul><p><img alt="Android applications" src="images/assistenza/servizi/android_app.jpg" style="width: 200px; height: 333px;">&nbsp; <img alt="android mail" src="images/assistenza/servizi/android_mail.jpg" style="width: 200px; height: 333px;"></p><ul class="acc_content">	<li>Tocca <strong>Aggiungi account,</strong> nella schermata successiva inserisci il tuo<strong> indirizzo di posta</strong> <strong>@alice.it</strong>, la tua <strong>password </strong>e tocca <strong>Avanti</strong></li></ul><p><img alt="aggiunta account mail" src="images/assistenza/servizi/android_mail_account.jpg" style="width: 200px; height: 333px;">&nbsp; <img alt="mail login" src="images/assistenza/servizi/android_mail_login.jpg" style="width: 200px; height: 333px;"></p><ul class="acc_content">	<li>Tocca il tipo di protocollo che intendi configurare:<strong> IMAP o POP3, </strong>poi verifica che i seguenti campi visualizzati sul display siano corretti, come nell''immagine riportata<strong>, </strong>e poi tocca <strong>Avanti:</strong>	<ul class="acc_content">		<li>Nome utente: <strong>il tuo indirizzo di posta</strong></li>		<li>Password: la tua <strong>password </strong>(non&nbsp; visibile)</li>		<li>Server IMAP (o POP3): <strong>in.alice.it</strong></li>		<li>Porta: <strong>143 per IMAP</strong> o <strong>110 per POP3</strong></li>	</ul>	</li></ul><p><img alt="tipo di account" src="images/assistenza/servizi/android_tipo.jpg" style="width: 200px; height: 333px;">&nbsp; <img alt="imposta server" src="images/assistenza/servizi/android_server.jpg" style="width: 200px; height: 333px;"></p><ul class="acc_content">	<li>Se i dati che hai inserito sono corretti, verifica la configurazione del server di posta in uscita, come nell''immagine riportata, e poi tocca <strong>Avanti</strong>:	<ul class="acc_content">		<li>Server SMTP: <strong>out.alice.it</strong></li>		<li>Porta: <strong>587</strong></li>		<li>Richiedi accesso: <strong>selezionato</strong></li>		<li>Nome utente: <strong>il tuo indirizzo di posta</strong></li>		<li>Password: la tua <strong>password </strong>(non&nbsp; visibile)</li>	</ul>	</li></ul><ul class="acc_content">	<li>Inserisci il <strong>nome per il tuo account</strong> ed il <strong>nome che sar&agrave; visualizzato</strong> nei tuoi messaggi di posta inviata e tocca <strong>Fine</strong> per completare la configurazione</li></ul><p><img alt="richiedi accesso" src="images/assistenza/servizi/android_accesso.jpg" style="width: 200px; height: 333px;">&nbsp; <img alt="imposta nome account" src="images/assistenza/servizi/android_account.jpg" style="width: 200px; height: 333px;"></p><p>Se trovi comunque difficolt&agrave; nella configurazione, ti informiamo che &egrave; disponibile il nostro servizio di assistenza a pagamento <strong>SOS PC</strong>: il personale tecnico concorder&agrave; un <strong>intervento personalizzato</strong> per configurare in maniera ottimale il tuo dispositivo mobile.</p>', 'deviceByCategory.html?categoria=smartphone_telefoni&filter=[marca:Huawei|Samsung|Tim],[sottoCategoria:smartphone]', 'Supporto Tecnico e Configurazione'),
(16, 'Cos’è TIMgames', '<p>TIMgames &egrave; servizio TIM edicato al gaming che consente a tutti i clienti di scaricare su tablet e smartphone i migliori giochi on demand e in abbonamento per il mondo mobile.</p><p>Con TIMgames avrai a disposizione una library di oltre 1500 giochi, aggiornata ogni settimana con nuovi titoli e giochi in offerta presenti nell&#x2019;area promozioni dello store.</p><p>TIMgames &egrave;accessibile sia da App (scaricabile da Google Play) che da browser su <u>www.timgames.it</u>. L&#x2019;utente pu&ograve; scegliere la modalit&agrave; di acquisto preferita tra on demand e abbonamento.</p><p>In particolare:</p><ul class="acc_content"><li><p>On demand: a partire da 0,49&#x20ac;, acquistando e scaricando un gioco sul proprio telefonino;</p></li><li><p>In abbonamento: con I Love Games Promo, a soli 2&#x20ac; a settimana si possono scaricare senza limiti tutti i giochi presenti su TIMgames. Il primo mese &egrave; in promozione a solo 1&#x20ac; a settimana.</p></li></ul>', '0', 'Contenuti e Smart Life'),
(15, 'TIMvision da web', '<p>Gli abbonati con <strong>linea ADSL di TIM </strong>possono vedere i contenuti compresi nell&#x2019;abbonamento TIMvision su 6 dispositivi a scelta senza costi aggiuntivi:<br><br><font color="#333399"><strong>dal decoder TIMvision</strong></font> - collega il decoder alla linea ADSL e alla televisione tradizionale mediante e procedi alla&nbsp;configurazione iniziale. Per vedere i contenuti inclusi nell''offerta entra dal menu principale&nbsp;nella sezione <strong>TIMvisionTV</strong>e scegli tra i canali disponibili. </p>\r\n<p><strong><font color="#333399">da Smart Tv e Bluray (Samsung e LG) connessi ad Internet compatibili -&nbsp;</font></strong>&nbsp;per vedere i contenuti inclusi nell&#x2019;offerta, seleziona l&#x2019;<strong>applicazione TIMvision</strong> dall&#x2019; <strong>App Store</strong> o <strong>Smart Hub</strong> del televisore/bluray collegato all&#x2019;ADSL. Entra in&nbsp;<strong>TIMvisionTV</strong> dal menu principale e seleziona&nbsp;una delle tante sezioni (cinema, serie tv etc), scegli un titolo e premi il tasto&nbsp;<strong>GUARDA</strong> per iniziare la visione. </p>\r\n<p><strong><font color="#000080">PC attraverso il sito </font></strong><strong><font color="#000080">www.timvision.it</font></strong><strong><font color="#000080">:</font></strong> </p>\r\n<ul class="acc_content">\r\n<li>Clicca su <strong>ACCEDI</strong> e inserisci username e password della tua alice mail associata alla linea ADSL di TIM. \r\n</li><li>Completa la registrazione con i campi necessari, accetta condizioni contrattuali, Informativa privacy e consensi privacy</li></ul>\r\n<p><strong><font color="#000080">Smartphone e Tablet Apple, Android e Windows Phone 8</font></strong> - scarica ed entra&nbsp;nell&#x2019;applicazione TIMvision, seleziona&nbsp;<strong>ACCEDI/LOGIN</strong> e inserisci username e password della tua alice mail associata alla linea ADSL di TIM o create in fase di registrazione su WEB. Nella sezione <strong>TIMvision Tv</strong> (Abbonamento su Windows 8) sono presenti tutti i contenuti inclusi nella&nbsp;tua offerta. La fruizione sar&agrave; limitata dalle condizioni specifiche dell&#x2019;offerta mobile (es. disponibilit&agrave; dei diritti dei contenuti). </p>', 'page.device.html?id=6&categoria=tv_smart_living', 'Supporto Tecnico e Configurazione'),
(17, 'Tutti i modi per abbonarsi', '<p>Con TIMgames hai la possibilit&agrave; di scegliere tutti i giochi che vuoi per il tuo telefonino in due semplici modalit&agrave;:</p><ul class="acc_content">	<li>On demand: basta accedere al sito mobile www.timgames.it oppure dall&#x2019;App TIMgames e scegliere tutti i giochi presenti. Il prezzo &egrave; indicato accanto ad ogni titolo. Inoltre, all&#x2019;interno della sezione promozioni, troverai molti giochi da provare gratuitamente prima di effettuare l&#x2019;acquisto;</li>	<li>Abbonamento: per attivare I Love Games Promo, a soli 2&#x20ac; a settimana in promo a met&agrave; prezzo per il primo mese, puoi andare in qualsiasi negozio TIM, chiamare il 119, il 409167 oppure tramite il sito tim.it</li></ul>In entrambi i casi, accedendo alla sezione MyTIMgames, potrai visualizzare tutti i giochi scaricati e gestire gli abbonamenti sottoscritti.', '0', 'Contenuti e Smart Life'),
(18, 'Cos''è TIMmusic', '<p>TIMmusic &egrave; la piattaforma di musica digitale di Telecomitalia dedicata a tutti i clienti che hanno uno smartphone/tablet TIM o una linea ADSL o Fibra&nbsp; residenziale Telecom Italia o una chiavetta Internet TIM.</p><p>Con TIMmusic puoi ascoltare milioni di brani in streaming senza limiti di tempo sul tuo smartphone e tablet o sul PC (clienti ADSL e Fibra Residenziale Telecom Italia o con chiavetta Internet TIM). Puoi&nbsp; creare tue playlist personali o ascoltare quelle suggerite da dj e artisti famosi e condividere tutto sui principali social network. Il catalogo &egrave; sempre aggiornato con tutte le ultime uscite discografiche, spesso anche in anteprima esclusiva. E , se sei su mobile, non consumi GB perch&egrave; il traffico dati per l&#x2019;ascolto di musica &egrave; incluso nel costo dell&#x2019;abbonamento.</p>', '0', 'Contenuti e Smart Life'),
(19, 'Tutti i modi per acquistare', '<p>Se sei un cliente TIM puoi attivare l&#x2019;abbonamento per Smarthone e Tablet direttamente nella sezione &#x201c;Abbonamento&#x201d; della App. Per iOS occorre accedere dallo smartphone o&nbsp; tablet a timmusic.it.</p><p>Si puo&#x2019; attivare TIMmusic anche presso i negozi TIM, chiamando il 40916 (seguendo la voce guida) o da tim.it (anche per chiavetta TIM).</p><p>Se sei un cliente con una linea ADSL o Fibra&nbsp; residenziale Telecom Italia puoi attivare l&#x2019;Abbonamento TIMmusic per fruirne su PC, da &nbsp;sito timmusic.it,&nbsp; dal sito tim.it oppure chiamando il 187.</p>', '0', 'Contenuti e Smart Life'),
(20, 'Come ascolto in modalità offline?', '<p><span style="line-height: 115%;">Grazie alla funzionalit&agrave; di ASCOLTO OFFLINE* il cliente pu&ograve; <b>ascoltare la sua musica preferita anche senza connessione. </b></span></p><p><span style="line-height: 115%;">(*) disponibile solo per iOS, prossimamente anche per Android</span></p><p><span style="line-height: 115%;">Per poter salvare album o playlist basta scegliere &#x00ab;<b> salva per l&#x2019;ascolto offline</b>&#x00bb; dal men&ugrave; contestuale di ciascun contenuto.</span></p><p><img alt="musica da ascoltare poi" src="images/assistenza/servizi/music_queue.png" style="width: 438px; height: 293px;"></p><p>&nbsp;</p><p><span style="line-height: 115%;">La freccia <b>VERDE</b> indicher&agrave; i brani gi&agrave; scaricati;</span></p><p><span style="line-height: 115%;">La freccia <b>GIALLA</b> i contenuti che si stanno salvando</span></p><img height="289" hspace="12" alt="ascoltare musica" src="images/assistenza/servizi/music_listen.png" width="166"><p>&nbsp;</p><p>Nella sezione &#x00ab;ASCOLTO OFFLINE&#x00bb; del menu&#x2019; il cliente pu&ograve;:</p><ul class="acc_content">	<li>	<p>monitorare lo spazio che occupano in <strong>memoria</strong> i brani salvati</p>	</li>	<li>	<p>Decidere quando passare in <strong>modalit&agrave; OFFLINE</strong></p>	</li>	<li>	<p><strong>Gestire le playlist </strong>salvate</p>	</li></ul><p><img alt="ascoltare offline" src="images/assistenza/servizi/music_offline.png" style="width: 395px; height: 307px;"></p>', '0', 'Contenuti e Smart Life');

-- --------------------------------------------------------

--
-- Table structure for table `sls`
--

DROP TABLE IF EXISTS `sls`;
CREATE TABLE IF NOT EXISTS `sls` (
  `id` int(11) NOT NULL,
  `titolo` varchar(50) NOT NULL,
  `categoria` varchar(50) NOT NULL,
  `promozione` tinyint(1) NOT NULL,
  `attivabile` tinyint(1) NOT NULL,
  `img_prod` varchar(150) NOT NULL,
  `img_pres` varchar(150) NOT NULL,
  `img_land` varchar(150) DEFAULT NULL,
  `des_offerta` text NOT NULL,
  `des_specifiche` text NOT NULL,
  `act_act` text NOT NULL,
  `act_device_correlati_nome` varchar(150) DEFAULT NULL,
  `act_device_correlati_link` varchar(200) DEFAULT NULL,
  `act_timricorda` text NOT NULL,
  PRIMARY KEY (`id`),
  KEY `img_pres` (`img_pres`),
  KEY `id` (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `sls`
--

INSERT INTO `sls` (`id`, `titolo`, `categoria`, `promozione`, `attivabile`, `img_prod`, `img_pres`, `img_land`, `des_offerta`, `des_specifiche`, `act_act`, `act_device_correlati_nome`, `act_device_correlati_link`, `act_timricorda`) VALUES
(0, 'TIM Tag', 'casa_famiglia', 1, 1, 'images/smartLifeServices/casa_famiglia/tim_Tag_prod.png', 'images/smartLifeServices/casa_famiglia/tim_Tag_pres.png', 'images/smartLifeServices/casa_famiglia_land.jpg', 'TIMTag, è il dispositivo che ti informa sulla posizione del tuo amico a quattro zampe e delle cose a te più care.\r\nSegui in tempo reale i suoi spostamenti sul tuo smartphone senza perderlo mai di vista. ', 'Con il seguente servizio avrai a disposizione: <br>\r\n&#10095; 2 mesi di servizio TIMTa <br>\r\n&#10095; un'' App dedicata intuitiva e semplice da utilizzare! <br>\r\n&#10095; una TIM Card inclusa <br>', 'Recarsi a un centro TIM per richiedere maggiori informazioni e attivare il servizio. <br>\r\nSarà necessario attivare un sim , completamente inclusa nel servizio , sucessivamente installre l''applicazione "TIM tag" sul tuo dispositivo e infine acquistare il dispositivo per il tracciamento.<br><br>\r\nIl servizio è in promozione e non ha costi aggiuntivi.', NULL, NULL, 'È un''offerta TIM che ti offre un Tracker GPS con inclusi 12 mesi di servizio TIMTag. L’opzione TIMTag in promo, include il traffico sia dati che SMSs dal Tracker GPS verso la piattaforma di servizio (max 50MB e 100SMS ogni 30 giorni) e l’utilizzo dell’App TIMTag. <br>\r\nIl Bundle dati e SMS previsto è calibrato per soddisfare le esigenze di un utilizzo continuativo del dispositivo.'),
(1, 'Sport watch', 'salute_benessere', 0, 1, 'images/smartLifeServices/salute_benessere/smart_sport_prod.png', 'images/smartLifeServices/salute_benessere/smart_sport_pres.jpg', 'images/smartLifeServices/salute_benessere_land.jpg', 'Con questo servizio sarai in grado di registrare automaticamente le tue attivit fisiche, sociali e di intrattenimento.', 'Con il seguente servizio sarà possibile:<br>\r\n&#10095; Tracciare i km percorsi giornalmente.<br>\r\n&#10095; Monitorare le attvità del sonno, l''ora di cui ti addormenti e le fasi rem.<br>\r\n&#10095; Controllare il progresso tramite la sincronizzazione con smartphone o sito web.', 'Recarsi a un centro tim e richiedere l''attivazione del servizio.<br>\r\nSarà necessario acquistare uno dei bracciali tra quelli elencati, compatibili con il servizio.\r\n<br><br>\r\nIl costo di attivazione del servizio è di <b>15 € al mese.</b>', 'Vai ai bracciali compatibili', 'deviceByCategory.html?categoria=tv_smart_living&filter=[sottoCategoria:bracciali]', 'Non è mai stato cosi facile restare in forma, prova il servizio e consiglialo a tutti i tuoi amico.'),
(2, 'TIM vision ', 'tv_entertainment', 1, 1, 'images/smartLifeServices/tv_entertainment/tim_vision_prod.png', 'images/smartLifeServices/tv_entertainment/tim_vision_pres.png', 'images/smartLifeServices/tv_entertainment_land.jpg', 'Scegli tra cinema, serie, cartoni e documentari, sempre on demand, per creare il tuo palinsesto TV senza interruzioni pubblicitarie.', 'Con il decoder TIMvision hai a disposizione più di 8.000 titoli tra cartoni, film, serie e documentari sempre on demand per creare il tuo palinsesto senza interruzioni pubblicitarie.<br><br>\r\n\r\nTramite il telecomando puoi mettere in pausa il tuo film preferito e farlo ripartire quando decidi tu, puoi rivedere una scena o andare avanti.<br><br>\r\n\r\nCollega il decoder alla tua linea ADSL Illimitata o Fibra Ottica di TIM per accedere:<br>\r\n\r\n   &#10095;  al Videostore di TIMvision, dove ti aspettano tutti gli episodi delle migliori serie, dalle più famose alle più esclusive, i cartoni animati e le serie preferite per bambini e ragazzi, le anteprime più attese e tanti film mai visti in tv o da rivedere in lingua originale.<br>\r\n   &#10095;  alla Replay TV di TIMvision, dove trovi tutti i programmi televisivi andati in onda negli ultimi 7 giorni sulle reti RAI (da tutti i dispositivi escluso streaming da web) e LA7 e l’archivio LA7<br>\r\n   &#10095;  a YouTube, per vedere i video che vuoi direttamente dalla tua TV\r\n', 'Rivolgersi a un centro TIM per attivare il servizio.<br>\r\nSarà necessario essere in possesso dei prodotti di seguito elencati.\r\n<br><br>\r\nIl costo di attivazione del servizio è di <b>20 € al mese.</b>', NULL, NULL, 'Puoi goderti la visione anche su Smart TV, su timvision.it e su app TIMvision per Smartphone, Tablet e PC, utilizzando le credenziali scelte al momento della registrazione al servizio TIMvision.'),
(3, ' Firma digitale ', 'servizi_persona', 0, 1, 'images/smartLifeServices/servizi_persona/firma_prod.jpg', 'images/smartLifeServices/servizi_persona/firma_pres.jpg', 'images/smartLifeServices/tim_personal_land.jpg', 'La fiducia che una firma digitale deve assicurare è ben superiore a quella della tradizionale firma manuale. Una chiave privata conosciuta solo dalla persona autorizzata a farne uso può servire persino a provarne l''identità. Si attendono sviluppi molto interessanti e TIM è in primo piano', 'Abilità il tuo conto online alla firma eletronica, protrai cosi: <br>\r\n&#10095; Firmare direttamente dal tuo tablet <br>\r\n&#10095; Controllare lo storico delle firme <br>\r\n&#10095; Avere una notifca in tempo reale in caso di contraffazioni.', 'Recarsi in un centro TIM e richiedere l''attivazione\r\n<br><br>\r\nIl costo di attivazione del servizio è di <b>10 € al mese.</b>', NULL, NULL, 'Già più di 5000 clienti hanno attivato il servizio e oltre il 90% dei clienti si sono ritenuti soddisfatti. <br>\r\nCosa aspetti? Attivalo subito.'),
(4, 'Ihealth HS5 ', 'salute_benessere', 0, 1, 'images/smartLifeServices/salute_benessere/IhealthHS5_prod.jpg', 'images/smartLifeServices/salute_benessere/IhealthHS5_pres.jpg', 'images/smartLifeServices/salute_benessere_land.jpg', 'Registra le calorie e le attività giornaliere, pianifica gli obiettivi di peso.<br>\r\nOrganizza le registrazioni, i grafici, lo storico delle letture e visualizza le tendenze ', 'Bilancia digitale di alta qualità\r\n<br>\r\n&#10095; Compatibile con i dispositivi Apple iOS (versione iOS 5.0 o successiva)\r\n<br>\r\n&#10095;  Compatibile con i dispositivi Android (sistema operativo 3.0 o successivo)\r\n<br>\r\n&#10095;  Comprende un servizio gratuito iHealth Cloud.', 'Recarsi in un centro tim e richiedere l''attivazione.<br>\r\nSarà necessario acquistare il prodotto linkato.\r\n<br><br>\r\nNon sono previsti costi aggiuntivi.', NULL, NULL, 'iHEALTH ha sviluppato una linea di prodotti innovativi, per la gestione della salute personale su smartphone o tablet. I prodotti wireless iHealth con connessione bluetooth per iPad, iPhone, iPod e Android consentono di misurare facilmente, memorizzare e condividere immediatamente i risultati con la famiglia o il medico.\r\n<br>\r\nLa potente applicazione iHealth MyVitals permette di gestire tutti i dati relativi alla propria salute con grafici, statistiche e tendenze.\r\n<br>\r\nQuesta applicazione, unica nel suo genere, traccia la relazione tra vari parametri come la pressione sanguigna, il peso, l’apporto calorico e l’attività fisica. Compatibile con tutte le piattaforme Apple e Android. Comprende un servizio gratuito iHealth Cloud.'),
(5, 'TIM home connect', 'casa_famiglia', 1, 0, 'images/smartLifeServices/casa_famiglia/TIM_home_prod.jpg', 'images/smartLifeServices/casa_famiglia/TIM_home_pres.png', NULL, 'La soluzione ideale per gestire tutti i sistemi di domotica presenti nella tua casa, dalla semplice caldaia domestica, ai sistemi di protezione della casa, ai più avanzati sistemi di monitoraggio. ', '', '', NULL, NULL, ''),
(6, 'TIM Sky', 'tv_entertainment', 0, 0, 'images/smartLifeServices/tv_entertainment/tim_sky_prod.png', 'images/smartLifeServices/tv_entertainment/tim_sky_pres.png', NULL, 'Solo la nostra fibra e l’ADSL veloce ti portano SKY, senza parabola. TIM SKY, la prima offerta che ti dà chiamate, internet senza limiti e ti porta a casa lo spettacolo di SKY, senza parabola', '', '', NULL, NULL, ''),
(7, 'Trasporti ', 'servizi_persona', 0, 0, 'images/smartLifeServices/servizi_persona/trasporti_prod.jpg', 'images/smartLifeServices/servizi_persona/trasporti_pres.jpg', NULL, 'Acquista i biglietti dei trasporti della tua città, attraverso il servizio SMS ticketing. Verifica subito se il servizio è già disponibile nella tua città! ', '', '', NULL, NULL, ''),
(8, 'Pagamenti', 'servizi_persona', 0, 0, 'images/smartLifeServices/servizi_persona/sim_prod.jpg', 'images/smartLifeServices/servizi_persona/sim_pres.jpg', NULL, 'Scopri tutti gli smartphone che sono abilitati all’utilizzo dei servizi di pagamento. Controlla la lista dei terminali compatibili, certificati per garantire i requisiti di sicurezza di banche e circuiti di pagamento. ', 'COMODO : Lasci il portafoglio a casa e utilizzi lo smartphone per avere a disposizione le tue carte \r\n<br>\r\nSICURO : I dati della tua carta di credito o prepagata sono memorizzati in modo confidenziale e protetto sulla TIM Card \r\n<br>\r\nSEMPLICE E VELOCE : Basta un tocco per scegliere la carta con cui effettuare i tuoi acquisti ', 'Basta recarsi a un cetro Tim per richiedere l''attivazione.<br>\r\nPer usufruire del servizio sarà necessario essere a disposizione di un device compatibile con il servizio.', NULL, NULL, 'TIM Wallet è compatibile con tutti gli smartphone NFC SIM BASED, terminali in grado di leggere le informazioni memorizzate sulla SIM con la sicurezza richiesta da banche e circuiti di pagamento. La lista degli smartphone NFC, testati e abilitati, è in continua evoluzione. L’abilitazione di altri telefoni necessita di opportune verifiche di sicurezza non solo da parte di TIM ma anche da parte dei nostri partner. Consulta la lista aggiornata dei terminali abilitati . ');

-- --------------------------------------------------------

--
-- Table structure for table `sls_faq`
--

DROP TABLE IF EXISTS `sls_faq`;
CREATE TABLE IF NOT EXISTS `sls_faq` (
  `id` int(11) NOT NULL,
  `id_sls` int(11) NOT NULL,
  `faq_title` text NOT NULL,
  `faq_content` text NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `sls_faq`
--

INSERT INTO `sls_faq` (`id`, `id_sls`, `faq_title`, `faq_content`) VALUES
(0, 4, 'Il servizio ha scadenza?', 'No, una volta attivato non vi è una scadenza, sarà dunque possibile usufruire del servizio finche rimarrai in possesso di un dispositivo abilitato.'),
(0, 4, 'È possibile ricevere rimborsi in caso di problemi?', 'In generale non abbiamo una politica di "soddisfatto o rimborsato" ma ogni caso verrà valutato a sè.'),
(1, 0, 'Chi può scegliere TIMTag', 'L''offerta è valida per i clienti ricaricabili, residenti nel territorio italiano e che ne fruiscano per scopi estranei alla loro eventuale attività imprenditoriale o professionale.'),
(2, 0, 'Cosa succede se recedo anticipatamente dall''offerta TIMTag?', 'Il cliente potrà recedere in qualsiasi momento dall''offerta chiamando il Servizio Clienti 119. A seguito del predetto recesso la TIM Card rimarrà attiva ed il cliente potrà continuare a fruire del relativo servizio telefonico ricaricabile. '),
(3, 0, 'Quale garanzia hanno i prodotti presenti Pack TIM Tag?', 'I prodotti commercializzati da TIM sono assistiti, per il periodo di vigenza della garanzia, direttamente dai costruttori tramite i loro Centri di Assistenza. Le condizioni di garanzia sono contenute all''interno della confezione contenente il Modem Internet.\r\n'),
(4, 2, 'Quanto dura la garanzia?', ' La garanzia per vizi e/o difetti e/o malfunzionamenti decorre dalla consegna del Prodotto, \r\nha una validità di 2 (due) anni e \r\nviene \r\nassicurata da TIM\r\n, anche avvalendosi di \r\nsoggetti  terzi  da  essa  inca\r\nricati,  nell’ambito  del  territorio  italiano. '),
(5, 2, 'È possibile dismettere il servizio?', ' Il Cliente, in conformità alle disposizioni normative in materia di contratti a distanza e di contratti negoziati \r\nfuori dai locali commerciali, può esercitare anche il diritto di \r\nrecesso  nelle  forme  e  modalità  prev\r\niste  dagli\r\n  articoli  52  e  seguenti  del  D.Lgs  206/2005.'),
(6, 1, 'Quali sono le condizioni per disattivare il servizio?', 'Il servizio è disattivabile a partire dal primo mese di utilizzo.\r\nI costi per la disattivazione sono quelli previsti dal contratto specifico.'),
(7, 1, 'In caso di danneggiamento del prodotto il servizio decade?', 'Se la casistica rientra nelle condizioni di garanzia del prodotti automaticamente decade anche il servizio.<br>\r\nEsso sarà poi riattivabile gratuitamente entro 1 anno.'),
(8, 3, 'Quanto è sicuro?', 'Avendo sempre accesso allo storico delle firme e ricevendo una notifica per ogniuna di esse , siamo in grado di garantire una pronta risposta per ogni problema.'),
(9, 3, 'Dopo quanto decade il servizio?', 'Il servizio si rinnoverà automaticamente ogni mese, fino a disattivazione.');

-- --------------------------------------------------------

--
-- Table structure for table `specificheDevice`
--

DROP TABLE IF EXISTS `specificheDevice`;
CREATE TABLE IF NOT EXISTS `specificheDevice` (
  `id` int(6) unsigned NOT NULL AUTO_INCREMENT,
  `titolo` varchar(150) NOT NULL,
  `dettaglio` varchar(300) NOT NULL,
  PRIMARY KEY (`id`,`titolo`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=15 ;

--
-- Dumping data for table `specificheDevice`
--

INSERT INTO `specificheDevice` (`id`, `titolo`, `dettaglio`) VALUES
(1, 'Colori:', 'Argento, oro, grigio siderale, oro rosa'),
(1, 'Capacit&agrave;:', '16GB 64GB 128GB'),
(1, 'Display:', 'Display Retina HD con 3D Touch Widescreen retroilluminato LED da 4,7'),
(1, 'Chip:', 'Chip A9 con architettura a 64 bit'),
(1, 'Fotocamera iSight:', 'Fotocamera iSight da 12 megapixel con pixel da 1,22&micro;'),
(1, 'Registrazione video:', 'Registrazione video 4K (3840x2160) a 30 fps'),
(1, 'Videocamera FaceTime HD:', 'Foto da 5 megapixel'),
(1, 'Touch ID:', 'Sensore di impronte digitali integrato nel tasto Home'),
(1, 'Geolocalizzazione:', 'GPS assistito e GLONASS'),
(2, 'Sistema Operativo:', 'Android 6.0'),
(2, 'Schermo:', '5.5&rsquo;&rsquo;'),
(2, 'Processore:', 'OctaCore (QuadCore 2.3 Ghz + QuadCore 1.6 Ghz)'),
(3, 'Sistema Operativo:', 'Android 6.0'),
(3, 'Schermo:', 'Full HD Amoled da 5.5&rsquo;&rsquo;'),
(3, 'Fotocamera:', 'Doppia Fotocamera Leica da 12 Mpxl Dual Flash + anteriore da 8 Mpxl'),
(3, 'Processore:', 'Kirin 955 - Octa-Core (4x2,5 GHz + 4x1,8 GHz)'),
(4, 'Schermo:', 'Ampio'),
(4, 'Tasti:', 'Grandi retroilluminati'),
(4, 'Risparmio energetico:', 'Tasto ECO mode plus per risparmio energetico'),
(6, 'Dimensioni (LxPxA):', '210 mm x 210 mm x 40 mm'),
(6, 'Processore:', 'Processore Intel ATOM CE 4230'),
(6, 'Confezione:', 'Decoder - Cavo alimentazione - Cavo HDMI - Telecomando universale - Batterie - Guida'),
(6, 'Connettivita:', 'HDMI 1.3 - Ethernet - Connessione Wireless 802.11 b/g/n'),
(6, 'Modalità Video PAL:', '576p - 720p - 1080i - 1080p'),
(7, 'Modello:', ' 50JU6400 - 50&ldquo;'),
(7, 'Display:', ' Ultra HD - 4K 3840 x 2160'),
(7, 'Soundbar:', ' HW-J250 inclusa'),
(8, 'Display:', ' 12&rdquo; FHD+, 2160x1440 SuperAmoled'),
(8, 'Sistema Operativo:', ' Windows 10 Pro'),
(8, 'Memoria interna:', ' 128GB SSD'),
(8, 'Fotocamera:', '(Front: 5 MP AF, Back: 5 MP )'),
(9, 'Modali&agrave; utilizzo:', ' Stampante, scanner, copiatrice'),
(9, 'Tecnologia:', ' ink-jet a colori'),
(9, 'Connettivit&agrave;:', ' Stampa via Bluetooth'),
(9, 'Opzioni:', ' Programmazione foto'),
(10, 'Navigazione:', ' senza fili pi&ugrave; veloce'),
(10, 'Connessione:', ' Connessione possibile con pi&ugrave; dispositivi'),
(10, 'Connettivit&agrave;:', ' Stampa via Bluetooth'),
(10, 'Risparmio energetico:', ' Funzione Eco per risparmio energetico'),
(11, 'Misura l’attivit&agrave; fisica:', ' 24h/24 - 7gg/7'),
(11, 'Conta passi', ''),
(11, 'Calcola le calorie consumate', ''),
(11, 'Monitoraggio attivit&agrave; del sonno', ''),
(11, 'Definisce obiettivi giornalieri personalizzati.', ''),
(12, 'Conta passi', ''),
(12, 'Calcola le calorie consumate', ''),
(12, 'Monitoraggio attivit&agrave; del sonno', ''),
(13, 'Resistente all’acqua', ''),
(13, 'Fornisce allarmi di movimento', ''),
(13, 'Batteria di lunga durata', ''),
(13, 'Dimensioni:', ' 49 x 47 x 17 mm'),
(14, 'Bilancia digitale di alta qualit&agrave;', ''),
(14, 'Compatibile con i dispositivi Apple iOS (versione iOS 5.0 o successiva)', ''),
(14, 'Compatibile con i dispositivi Android (sistema operativo 3.0 o successivo)', ''),
(14, 'Comprende un servizio gratuito iHealth Cloud.', '');

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
