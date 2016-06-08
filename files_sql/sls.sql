-- phpMyAdmin SQL Dump
-- version 4.5.4.1deb2ubuntu1
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: Jun 08, 2016 at 06:16 PM
-- Server version: 5.7.12-0ubuntu1
-- PHP Version: 7.0.4-7ubuntu2.1

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `my_db`
--

-- --------------------------------------------------------

--
-- Table structure for table `sls`
--

DROP TABLE IF EXISTS `sls`;
CREATE TABLE `sls` (
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
  `act_timricorda` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `sls`
--

INSERT INTO `sls` (`id`, `titolo`, `categoria`, `promozione`, `attivabile`, `img_prod`, `img_pres`, `img_land`, `des_offerta`, `des_specifiche`, `act_act`, `act_device_correlati_nome`, `act_device_correlati_link`, `act_timricorda`) VALUES
(0, 'TIM Tag', 'casa_famiglia', 1, 1, '../images/smartLifeServices/casa_famiglia/tim_Tag_prod.png', '../images/smartLifeServices/casa_famiglia/tim_Tag_pres.png', '../images/smartLifeServices/casa_famiglia_land.jpg', 'TIMTag, è il dispositivo che ti informa sulla posizione del tuo amico a quattro zampe e delle cose a te più care.\r\nSegui in tempo reale i suoi spostamenti sul tuo smartphone senza perderlo mai di vista. ', 'Con il seguente servizio avrai a disposizione: <br>\r\n&#10095; 2 mesi di servizio TIMTa <br>\r\n&#10095; un\' App dedicata intuitiva e semplice da utilizzare! <br>\r\n&#10095; una TIM Card inclusa <br>', 'Recarsi a un centro TIM per richiedere maggiori informazioni e attivare il servizio. <br>\r\nSarà necessario attivare un sim , completamente inclusa nel servizio , sucessivamente installre l\'applicazione "TIM tag" sul tuo dispositivo e infine acquistare il dispositivo per il tracciamento.<br>', NULL, NULL, 'È un\'offerta TIM che ti offre un Tracker GPS con inclusi 12 mesi di servizio TIMTag. L’opzione TIMTag in promo, include il traffico sia dati che SMSs dal Tracker GPS verso la piattaforma di servizio (max 50MB e 100SMS ogni 30 giorni) e l’utilizzo dell’App TIMTag. <br>\r\nIl Bundle dati e SMS previsto è calibrato per soddisfare le esigenze di un utilizzo continuativo del dispositivo.'),
(1, 'Ihealth HS5 ', 'salute_benessere', 0, 1, '../images/smartLifeServices/salute_benessere/IhealthHS5_prod.jpg', '../images/smartLifeServices/salute_benessere/IhealthHS5_pres.jpg', '../images/smartLifeServices/salute_benessere_land.jpg', 'Registra le calorie e le attività giornaliere, pianifica gli obiettivi di peso.<br>\r\nOrganizza le registrazioni, i grafici, lo storico delle letture e visualizza le tendenze ', 'Bilancia digitale di alta qualità\r\n<br>\r\n&#10095; Compatibile con i dispositivi Apple iOS (versione iOS 5.0 o successiva)\r\n<br>\r\n&#10095;  Compatibile con i dispositivi Android (sistema operativo 3.0 o successivo)\r\n<br>\r\n&#10095;  Comprende un servizio gratuito iHealth Cloud.', 'Recarsi in un centro tim e richiedere l\'attivazione.\r\nSarà necessario acquistare il prodotto linkato.', NULL, NULL, 'iHEALTH ha sviluppato una linea di prodotti innovativi, per la gestione della salute personale su smartphone o tablet. I prodotti wireless iHealth con connessione bluetooth per iPad, iPhone, iPod e Android consentono di misurare facilmente, memorizzare e condividere immediatamente i risultati con la famiglia o il medico.\r\n<br>\r\nLa potente applicazione iHealth MyVitals permette di gestire tutti i dati relativi alla propria salute con grafici, statistiche e tendenze.\r\n<br>\r\nQuesta applicazione, unica nel suo genere, traccia la relazione tra vari parametri come la pressione sanguigna, il peso, l’apporto calorico e l’attività fisica. Compatibile con tutte le piattaforme Apple e Android. Comprende un servizio gratuito iHealth Cloud.'),
(2, 'TIM vision ', 'tv_entertainment', 1, 1, '../images/smartLifeServices/tv_entertainment/tim_vision_prod.png', '../images/smartLifeServices/tv_entertainment/tim_vision_pres.png', '../images/smartLifeServices/tv_entertainment_land.jpg', 'Scegli tra cinema, serie, cartoni e documentari, sempre on demand, per creare il tuo palinsesto TV senza interruzioni pubblicitarie.', 'Con il decoder TIMvision hai a disposizione più di 8.000 titoli tra cartoni, film, serie e documentari sempre on demand per creare il tuo palinsesto senza interruzioni pubblicitarie.<br><br>\r\n\r\nTramite il telecomando puoi mettere in pausa il tuo film preferito e farlo ripartire quando decidi tu, puoi rivedere una scena o andare avanti.<br><br>\r\n\r\nCollega il decoder alla tua linea ADSL Illimitata o Fibra Ottica di TIM per accedere:<br>\r\n\r\n   &#10095;  al Videostore di TIMvision, dove ti aspettano tutti gli episodi delle migliori serie, dalle più famose alle più esclusive, i cartoni animati e le serie preferite per bambini e ragazzi, le anteprime più attese e tanti film mai visti in tv o da rivedere in lingua originale.<br>\r\n   &#10095;  alla Replay TV di TIMvision, dove trovi tutti i programmi televisivi andati in onda negli ultimi 7 giorni sulle reti RAI (da tutti i dispositivi escluso streaming da web) e LA7 e l’archivio LA7<br>\r\n   &#10095;  a YouTube, per vedere i video che vuoi direttamente dalla tua TV\r\n', 'Rivolgersi a un centro TIM per attivare il servizio.<br>\r\nSarà necessario essere in possesso dei prodotti di seguito elencati.', NULL, NULL, 'Puoi goderti la visione anche su Smart TV, su timvision.it e su app TIMvision per Smartphone, Tablet e PC, utilizzando le credenziali scelte al momento della registrazione al servizio TIMvision.'),
(3, 'Pagamenti SmartPhone (TODO)', 'servizi_persona', 0, 0, '../images/smartLifeServices/servizi_persona/trasporti.jpg', '../images/smartLifeServices/servizi_persona/sim_2.jpg', NULL, 'Scopri tutti gli smartphone che sono abilitati all’utilizzo dei servizi di pagamento. Controlla la lista dei terminali compatibili, certificati per garantire i requisiti di sicurezza di banche e circuiti di pagamento. ', 'COMODO : Lasci il portafoglio a casa e utilizzi lo smartphone per avere a disposizione le tue carte \r\n<br>\r\nSICURO : I dati della tua carta di credito o prepagata sono memorizzati in modo confidenziale e protetto sulla TIM Card \r\n<br>\r\nSEMPLICE E VELOCE : Basta un tocco per scegliere la carta con cui effettuare i tuoi acquisti ', 'Basta recarsi a un cetro Tim per richiedere l\'attivazione.<br>\r\nPer usufruire del servizio sarà necessario essere a disposizione di un device compatibile con il servizio.', 'Scopri i device NFC', 'deviceByCategory.html?categoria=smartphone_telefoni', 'TIM Wallet è compatibile con tutti gli smartphone NFC SIM BASED, terminali in grado di leggere le informazioni memorizzate sulla SIM con la sicurezza richiesta da banche e circuiti di pagamento. La lista degli smartphone NFC, testati e abilitati, è in continua evoluzione. L’abilitazione di altri telefoni necessita di opportune verifiche di sicurezza non solo da parte di TIM ma anche da parte dei nostri partner. Consulta la lista aggiornata dei terminali abilitati . '),
(4, 'Sport watch', 'salute_benessere', 0, 1, '../images/smartLifeServices/salute_benessere/smart_sport_prod.jpg', '../images/smartLifeServices/salute_benessere/smart_sport_pres.jpg', '../images/smartLifeServices/salute_benessere_land.jpg', 'Con questo servizio sarai in grado di registrare automaticamente le tue attivit fisiche, sociali e di intrattenimento.', 'Con il seguente servizio sarà possibile:<br>\r\n&#10095; Tracciare i km percorsi giornalmente.<br>\r\n&#10095; Monitorare le attvità del sonno, l\'ora di cui ti addormenti e le fasi rem.<br>\r\n&#10095; Controllare il progresso tramite la sincronizzazione con smartphone o sito web.', 'Recarsi a un centro tim e richiedere l\'attivazione del servizio.<br>\r\nSarà necessario acquistare uno dei bracciali tra quelli elencati, compatibili con il servizio.', NULL, NULL, 'Non è mai stato cosi facile restare in forma, prova il servizio e consiglialo a tutti i tuoi amico.'),
(5, 'TIM home connect', 'casa_famiglia', 1, 0, '../images/smartLifeServices/casa_famiglia/TIM_home_prod.jpg', '../images/smartLifeServices/casa_famiglia/TIM_home_pres.png', NULL, 'La soluzione ideale per gestire tutti i sistemi di domotica presenti nella tua casa, dalla semplice caldaia domestica, ai sistemi di protezione della casa, ai più avanzati sistemi di monitoraggio. ', '', '', NULL, NULL, ''),
(6, 'TIM Sky', 'tv_entertainment', 0, 0, '../images/smartLifeServices/tv_entertainment/tim_sky_prod.png', '../images/smartLifeServices/tv_entertainment/tim_sky_pres.png', NULL, 'Solo la nostra fibra e l’ADSL veloce ti portano SKY, senza parabola. TIM SKY, la prima offerta che ti dà chiamate, internet senza limiti e ti porta a casa lo spettacolo di SKY, senza parabola', '', '', NULL, NULL, ''),
(7, 'Trasporti ', 'servizi_persona', 0, 0, '../images/smartLifeServices/servizi_persona/trasporti_prod.jpg', '../images/smartLifeServices/servizi_persona/trasporti_pres.jpg', NULL, 'Acquista i biglietti dei trasporti della tua città, attraverso il servizio SMS ticketing. Verifica subito se il servizio è già disponibile nella tua città! ', '', '', NULL, NULL, '');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `sls`
--
ALTER TABLE `sls`
  ADD PRIMARY KEY (`id`),
  ADD KEY `img_pres` (`img_pres`),
  ADD KEY `id` (`id`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
