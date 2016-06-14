 <?php
//set the include php class
include "secure_db.php";
//create the obj
$db = new SecureDB();
//call this fuction to enable debug in the class
//$db -> enableDebug();
//make the select

/*********************************************************************/
/**********************  DROP TABELLE CIMBO   ************************/
/*********************************************************************/



// sql to create table
$sql = 
    "DROP TABLE device, immaginiDevice, specificheDevice, device_sls, device_assistance";

$resultQuery = $db -> query($sql);
//handle it

if($resultQuery === true){
    echo "Tablelle \n device \n immaginiDevice \n specificheDevice \n sono state eliminate correttamente" . "<br>" . "<br>" . "<br>";    
}else{
    echo "Errore Distruzione Tabelle" . "<br>";
}








/*********************************************************************/
/***********************  TABELLA DEVICES   **************************/
/*********************************************************************/



// sql to create table
$sql = 
    "CREATE TABLE device (
                            id INT(6) UNSIGNED AUTO_INCREMENT PRIMARY KEY,
                            nome VARCHAR(35) NOT NULL,
                            categoria VARCHAR(150) NOT NULL,
                            sottoCategoria VARCHAR(150),
                            gridImagePath VARCHAR(300) NOT NULL,
                            promo TINYINT(1) NOT NULL,
                            nuovo TINYINT(1) NOT NULL,
                            piuVenduto TINYINT(1) NOT NULL,
                            compraSubito TINYINT(1) DEFAULT 1,
                            aRate TINYINT(1) NOT NULL,
                            noleggio TINYINT(1) NOT NULL,
                            marca VARCHAR(100) NOT NULL,
                            prezzo DECIMAL(10,2) NOT NULL,
                            prezzoScontato DECIMAL(10,2) NOT NULL,
                            prezzoARate VARCHAR(100) NOT NULL,
                            prezzoANoleggio DECIMAL(10,2) NOT NULL,
                            descrizione TEXT NOT NULL
)";

$resultQuery = $db -> query($sql);
//handle it

if($resultQuery === true){
    echo "Tablella device costruita correttamente" . "<br>" . "<br>";    
}else{
    echo "Errore costruzione tabella" . "<br>" . "<br>";
}


$sqlInsert = "INSERT INTO device (id, nome, categoria, sottoCategoria, gridImagePath, promo, nuovo, piuVenduto, compraSubito, aRate, noleggio, marca, prezzo, prezzoScontato, prezzoARate, prezzoANoleggio, descrizione) VALUES 
('1', 'Iphone6s', 'smartphone_telefoni', 'smartphone', 'images/grid200x276/iPhone6s1.png',
 '1', '0', '1', '1', '1', '1', 'Apple', '820.00', '800.00', '35.00 &euro; 24/mesi', '35.00', 'iPhone 6s mantiene tutte le caratteristiche che hanno reso straordinaria la generazione precedente di iPhone, e le spingono a un livello ancora pi&ugrave; avanzato. Viene realizzato in alluminio serie 7000, la lega pi&ugrave; robusta mai utilizzata per un iPhone. Il suo display Retina HD &egrave; fatto del vetro pi&ugrave; resistente che uno smartphone abbia mai avuto.') ,
 ('2', 'Samsung Galaxy S7 Edge', 'smartphone_telefoni', 'smartphone', 'images/grid200x276/samsungGalaxyS7Edge1.png',
 '0', '1', '0', '1', '1', '0', 'Samsung', '820.00', '800.00', '35.00 &euro; 24/mesi', '35.00', 'Caratteristiche:') ,
 ('3', 'Huawei P9 Plus', 'smartphone_telefoni', 'smartphone', 'images/grid200x276/huaweiP9Plus1.png',
 '1', '0', '0', '1', '1', '0', 'Huawei', '749.90', '650.00', '30.00 &euro; 24/mesi', '30.00', 'Caratteristiche:'),
 ('4', 'Cordless Facile Maxi', 'smartphone_telefoni', 'telefoni', 'images/grid200x276/cordlessFacileMaxi1.png',
 '0', '0', '0', '1', '0', '0', 'Tim', '35.90', '29.95', '5.00 &euro; 24/mesi', '5.00', 'Caratteristiche:'),
 ('5', 'IPad Air 2', 'tablet_computer', 'tablet', 'images/grid200x276/ipadAir2_1.png',
 '0', '1', '1', '1', '1', '0', 'Apple', '520.00', '450.00', '37.00 &euro; 24/mesi', '37.00', 'Caratteristiche:'),
 ('6', 'Decoder TIMvision', 'tv_smart_living', 'smart living', 'images/grid200x276/decoderTimVision.png',
 '0', '1', '1', '1', '0', '1', 'Tim', '49.00', '40.00', '15.00 &euro; 24/mesi', '2.00', 'Con il decoder TIMvision hai a disposizione pi&ugrave; di 8.000 titoli tra cartoni, film, serie e documentari sempre on demand per creare il tuo palinsesto senza interruzioni pubblicitarie. Puoi goderti la visione anche su Smart TV, su timvision.it e su app TIMvision per Smartphone, Tablet e PC, utilizzando le credenziali scelte al momento della registrazione al servizio TIMvision.'),
 ('7', 'Samsung Smart TV 50', 'tv_smart_living', 'tv', 'images/grid200x276/samsungSmartTv.png',
 '0', '1', '1', '1', '1', '0', 'Samsung', '936.00', '850.00', '40.00 &euro; 24/mesi', '15.00', 'Caratteristiche:'),
 ('8', 'Samsung Galaxy TabPro S 12', 'tablet_computer', 'computer', 'images/grid200x276/samsungGalaxyTabProS12_1.png',
 '0', '1', '1', '1', '1', '0', 'Samsung', '1299.90', '850.00', '35.00 &euro; 24/mesi', '35.00', 'Caratteristiche:'),
 ('9', 'Olivetti My Way', 'outlet', 'outlet', 'images/grid200x276/olivettiMyWay.png',
 '1', '0', '1', '1', '0', '0', 'Olivetti', '49.00', '19.00', '15.00 &euro; 24/mesi', '2.00', 'Caratteristiche:'),
 ('10', 'Modem ADSL Wi-Fi', 'modem_networking', 'modem', 'images/grid200x276/modemAdsl.png',
 '0', '1', '1', '1', '0', '1', 'Tim', '69.00', '59.00', '5.00 &euro; 24/mesi', '3.00', 'Caratteristiche:'),
 ('11', 'Polar Loop Activity Tracker', 'tv_smart_living', 'bracciali', 'images/grid200x276/polarLoop1.png',
 '0', '0', '1', '1', '0', '0', 'Polar', '99.90', '89.00', '4.00 &euro; 24/mesi', '5.00', 'Caratteristiche:'),
 ('12', 'Sony Smart Band Fifa Edition', 'tv_smart_living', 'bracciali', 'images/grid200x276/smartBandSony1.png',
 '1', '0', '1', '1', '0', '0', 'Sony', '79.90', '49.00', '3.50 &euro; 24/mesi', '3.00', 'Caratteristiche:'),
 ('13', 'Tim Tag', 'tv_smart_living', 'smart_living', 'images/grid200x276/timTag1.png',
 '1', '0', '1', '1', '0', '0', 'Tim', '129.90', '120.00', '5.00 &euro; 24/mesi', '5.00', 'Caratteristiche:'),
 ('14', 'Ihealth HS5', 'tv_smart_living', 'smart_living', 'images/grid200x276/IhealthHS5.png',
 '0', '0', '1', '1', '0', '0', 'iHealth', '119.90', '100.00', '5.00 &euro; 24/mesi', '5.00', 'Caratteristiche:')";



$resultQueryInsert = $db -> query($sqlInsert);

if($resultQueryInsert === true){
    echo "Inseriento tuple in device avvenuto correttamente" . "<br>" . "<br>";    
}else{
    echo "Errore nell'inserimento dei dati nella tabella device" . "<br>" . "<br>";
}


/*********************************************************************/
/*********************  TABELLA IMMAGINI_DEVICES   *******************/
/*********************************************************************/


// sql to create table
$sql = 
    "CREATE TABLE immaginiDevice (
                            id INT(6) UNSIGNED AUTO_INCREMENT PRIMARY KEY,
                            alt VARCHAR(150) NOT NULL,
                            frontImagePath VARCHAR(300) NOT NULL,
                            sideImagePath VARCHAR(300),
                            backImagePath VARCHAR(300) 
                            )";


$resultQuery = $db -> query($sql);
//handle it

if($resultQuery === true){
    echo "Tablella immaginiDevice costruita correttamente" . "<br>" . "<br>";    
}else{
    echo "Errore costruzione tabella immaginiDevice" . "<br>" . "<br>";
}

$sqlInsert1 = "INSERT INTO immaginiDevice 
(id,
alt,
frontImagePath,
sideImagePath,
backImagePath) VALUES(
'1',
'Iphone6s',
'images/dispositivi/iPhone6s1.png',
'images/dispositivi/iPhone6s2.png',
'images/dispositivi/iPhone6s3.png'),
('2','SamsungGalaxyS7Edge',
'images/dispositivi/samsungGalaxyS7Edge1.png',
'images/dispositivi/samsungGalaxyS7Edge2.png',
'images/dispositivi/samsungGalaxyS7Edge3.png'
),
('8','Samsung Galaxy TabPro S 12',
'images/dispositivi/samsungGalaxyTabProS12_1.png',
'images/dispositivi/samsungGalaxyTabProS12_2.png',
'images/dispositivi/samsungGalaxyTabProS12_3.png'
)";

$sqlInsert2 = "INSERT INTO immaginiDevice 
(id,
alt,
frontImagePath) VALUES(
'3','Huawei P9 Plus',
'images/dispositivi/huaweiP9Plus1.png') ,
('4','Cordless Facile Maxi',
'images/dispositivi/cordlessFacileMaxi1.png') ,
('5','IPad Air 2',
'images/dispositivi/ipadAir2_1.png'),
('6','Decoder TIMvision',
'images/dispositivi/decoderTimvision1.png'),
('9','Olivetti My Way',
'images/dispositivi/olivettiMyWay1.png'),
('10','Modem ADSL Wi-Fi',
'images/dispositivi/modemAdsl1.png'),
('11','Polar Loop Activity Tracker',
'images/dispositivi/polarLoop1.png'),
('12','Sony Smart Band Fifa Edition',
'images/dispositivi/smartBandSony1.png'),
('13','Tim Tag',
'images/dispositivi/timTag1.png'),
('14','Ihealth HS5',
'images/dispositivi/IhealthHS51.png')";

$sqlInsert3 = 
"INSERT INTO immaginiDevice 
(id,
alt,
frontImagePath,
sideImagePath) VALUES(
'7','Samsung Smart TV 50  + Soundbar con TIMvision',
'images/dispositivi/samsungSmartTv1.png',
'images/dispositivi/samsungSmartTv2.png')";


$resultQueryInsert1 = $db -> query($sqlInsert1);
$resultQueryInsert2 = $db -> query($sqlInsert2);
$resultQueryInsert3 = $db -> query($sqlInsert3);


if($resultQueryInsert1 === true && $resultQueryInsert2 === true && $resultQueryInsert3 === true){
    echo "Inseriento tuple in immaginiDevice avvenuto correttamente" . "<br>" . "<br>";    
}else{
    echo "Errore nell inserimento dei dati nella tabella immaginiDevice" . "<br>" . "<br>";
}

/*********************************************************************/
/*********************  TABELLA SPECIFICHE_DEVICES   *******************/
/*********************************************************************/


// sql to create table
$sql = 
    "CREATE TABLE specificheDevice (
                            id INT(6) UNSIGNED AUTO_INCREMENT,
                            titolo VARCHAR(150) NOT NULL,
                            dettaglio VARCHAR(300) NOT NULL,
                            PRIMARY KEY(id, titolo)
                            )";


$resultQuery = $db -> query($sql);
//handle it

if($resultQuery === true){
    echo "Tablella specificheDevice costruita correttamente" . "<br>" . "<br>";    
}else{
    echo "Errore costruzione tabella" . "<br>" . "<br>";
}

$sqlInsert = "INSERT INTO specificheDevice (id, titolo, dettaglio) VALUES 
('1', 'Colori:', 'Argento, oro, grigio siderale, oro rosa'), 
('1', 'Capacit&agrave;:', '16GB 64GB 128GB'),
('1', 'Display:', 'Display Retina HD con 3D Touch Widescreen retroilluminato LED da 4,7'),
('1', 'Chip:', 'Chip A9 con architettura a 64 bit'),
('1', 'Fotocamera iSight:', 'Fotocamera iSight da 12 megapixel con pixel da 1,22&micro;'),
('1', 'Registrazione video:', 'Registrazione video 4K (3840x2160) a 30 fps'),
('1', 'Videocamera FaceTime HD:', 'Foto da 5 megapixel'),
('1', 'Touch ID:', 'Sensore di impronte digitali integrato nel tasto Home'),
('1', 'Geolocalizzazione:', 'GPS assistito e GLONASS'),
('2', 'Sistema Operativo:', 'Android 6.0'),
('2', 'Schermo:', '5.5&rsquo;&rsquo;'),
('2', 'Processore:', 'OctaCore (QuadCore 2.3 Ghz + QuadCore 1.6 Ghz)'),
('3', 'Sistema Operativo:', 'Android 6.0'),
('3', 'Schermo:', 'Full HD Amoled da 5.5&rsquo;&rsquo;'),
('3', 'Fotocamera:', 'Doppia Fotocamera Leica da 12 Mpxl Dual Flash + anteriore da 8 Mpxl'),
('3', 'Processore:', 'Kirin 955 - Octa-Core (4x2,5 GHz + 4x1,8 GHz)'),
('4', 'Schermo:', 'Ampio'),
('4', 'Tasti:', 'Grandi retroilluminati'),
('4', 'Risparmio energetico:', 'Tasto ECO mode plus per risparmio energetico'),
('6', 'Dimensioni (LxPxA):', '210 mm x 210 mm x 40 mm'),
('6', 'Processore:', 'Processore Intel ATOM CE 4230'),
('6', 'Confezione:', 'Decoder - Cavo alimentazione - Cavo HDMI - Telecomando universale - Batterie - Guida'),
('6', 'Connettivita:', 'HDMI 1.3 - Ethernet - Connessione Wireless 802.11 b/g/n'),
('6', 'Modalità Video PAL:', '576p - 720p - 1080i - 1080p'), 
('7', 'Modello:', ' 50JU6400 - 50&ldquo;'),
('7', 'Display:', ' Ultra HD - 4K 3840 x 2160'),
('7', 'Soundbar:', ' HW-J250 inclusa'),
('8', 'Display:', ' 12&rdquo; FHD+, 2160x1440 SuperAmoled'),
('8', 'Sistema Operativo:', ' Windows 10 Pro'), 
('8', 'Memoria interna:', ' 128GB SSD'),
('8', 'Fotocamera:', '(Front: 5 MP AF, Back: 5 MP )'),
('9', 'Modali&agrave; utilizzo:', ' Stampante, scanner, copiatrice'),
('9', 'Tecnologia:', ' ink-jet a colori'), 
('9', 'Connettivit&agrave;:', ' Stampa via Bluetooth'),
('9', 'Opzioni:', ' Programmazione foto'),
('10', 'Navigazione:', ' senza fili pi&ugrave; veloce'),
('10', 'Connessione:', ' Connessione possibile con pi&ugrave; dispositivi'), 
('10', 'Connettivit&agrave;:', ' Stampa via Bluetooth'),
('10', 'Risparmio energetico:', ' Funzione Eco per risparmio energetico'),
('11', 'Misura l’attivit&agrave; fisica:', ' 24h/24 - 7gg/7'),
('11', 'Conta passi', ''), 
('11', 'Calcola le calorie consumate', ''),
('11', 'Monitoraggio attivit&agrave; del sonno', ''),
('11', 'Definisce obiettivi giornalieri personalizzati.', ''),
('12', 'Conta passi', ''), 
('12', 'Calcola le calorie consumate', ''),
('12', 'Monitoraggio attivit&agrave; del sonno', ''), 
('13', 'Resistente all’acqua', ''),
('13', 'Fornisce allarmi di movimento', ''),
('13', 'Batteria di lunga durata', ''),
('13', 'Dimensioni:', ' 49 x 47 x 17 mm'),
('14', 'Bilancia digitale di alta qualit&agrave;', ''),
('14', 'Compatibile con i dispositivi Apple iOS (versione iOS 5.0 o successiva)', ''),
('14', 'Compatibile con i dispositivi Android (sistema operativo 3.0 o successivo)', ''), 
('14', 'Comprende un servizio gratuito iHealth Cloud.', '')
";

         
$resultQueryInsert = $db -> query($sqlInsert);

if($resultQueryInsert === true){
    echo "Inseriento tuple in specificheDevice avvenuto correttamente" . "<br>" . "<br>";    
}else{
    echo "Errore nell'inserimento dei dati nella tabella specificheDevice" . "<br>" . "<br>";
}




/*********************************************************************/
/*********************  TABELLA device_sls   *******************/
/*********************************************************************/


// sql to create table
$sql = 
    "CREATE TABLE device_sls (
                            id INT(6) UNSIGNED AUTO_INCREMENT PRIMARY KEY,
                            id_device INT(6) NOT NULL,
                            id_sls INT(6) NOT NULL
                            )";


$resultQuery = $db -> query($sql);
//handle it

if($resultQuery === true){
    echo "Tablella device_sls costruita correttamente" . "<br>" . "<br>";    
}else{
    echo "Errore costruzione tabella device_sls" . "<br>" . "<br>";
}

$sqlInsert1 = "INSERT INTO device_sls 
(id,
id_device,
id_sls) VALUES
('1','13','0'),
('2','11','1'),
('3','12','1'),
('4','6','2'),
('5','7','2'),
('6','14','1')";


$resultQueryInsert1 = $db -> query($sqlInsert1);



if($resultQueryInsert1 === true){
    echo "Inseriento tuple in device_sls avvenuto correttamente" . "<br>" . "<br>";    
}else{
    echo "Errore nell inserimento dei dati nella tabella device_sls" . "<br>" . "<br>";
}

/*********************************************************************/
/*********************  TABELLA device_assistance   *******************/
/*********************************************************************/


// sql to create table
$sql = 
    "CREATE TABLE device_assistance (
                            id INT(6) UNSIGNED AUTO_INCREMENT PRIMARY KEY,
                            id_device INT(6) NOT NULL,
                            id_assistance INT(6) NOT NULL
                            )";


$resultQuery = $db -> query($sql);
//handle it

if($resultQuery === true){
    echo "Tablella device_assistance costruita correttamente" . "<br>" . "<br>";    
}else{
    echo "Errore costruzione tabella device_assistance" . "<br>" . "<br>";
}

$sqlInsert1 = "INSERT INTO device_assistance 
(id,
id_device,
id_assistance) VALUES
('1','1','11'),
('2','5','12'),
('3','2','13'),
('4','3','13'),
('5','6','14'),
('6','6','15')";


$resultQueryInsert1 = $db -> query($sqlInsert1);



if($resultQueryInsert1 === true){
    echo "Inseriento tuple in device_assistance avvenuto correttamente" . "<br>" . "<br>";    
}else{
    echo "Errore nell inserimento dei dati nella tabella device_assistance" . "<br>" . "<br>";
}

?>