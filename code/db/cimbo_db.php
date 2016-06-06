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
    "DROP TABLE device, immaginiDevice, specificheDevice, device_sls";

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
                            nome VARCHAR(150) NOT NULL,
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
                            descrizione TEXT NOT NULL
)";

$resultQuery = $db -> query($sql);
//handle it

if($resultQuery === true){
    echo "Tablella device costruita correttamente" . "<br>" . "<br>";    
}else{
    echo "Errore costruzione tabella" . "<br>" . "<br>";
}


$sqlInsert = "INSERT INTO device (id, nome, categoria, sottoCategoria, gridImagePath, promo, nuovo, piuVenduto, compraSubito, aRate, noleggio, marca, prezzo, prezzoScontato, descrizione) VALUES 
('1', 'Iphone6s', 'smartphone_telefoni', 'smartphone', 'images/grid200x276/iPhone6s1.png',
 '0', '0', '1', '1', '1', '0', 'Apple', '820.00', '800.00', 'iPhone 6s mantiene tutte le caratteristiche che hanno reso straordinaria la generazione precedente di iPhone, e le spingono a un livello ancora pi&ugrave; avanzato. Viene realizzato in alluminio serie 7000, la lega pi&ugrave; robusta mai utilizzata per un iPhone. Il suo display Retina HD &egrave; fatto del vetro pi&ugrave; resistente che uno smartphone abbia mai avuto.') ,
 ('2', 'Samsung Galaxy S7 Edge', 'smartphone_telefoni', 'smartphone', 'images/grid200x276/samsungGalaxyS7Edge1.png',
 '0', '1', '0', '1', '1', '1', 'Samsung', '820.00', '800.00', 'Caratteristiche:') ,
 ('3', 'Huawei P9 Plus', 'smartphone_telefoni', 'smartphone', 'images/grid200x276/huaweiP9Plus1.png',
 '1', '0', '0', '0', '1', '1', 'Huawei', '749.90', '650.00', 'Caratteristiche:'),
 ('4', 'Cordless Facile Maxi', 'smartphone_telefoni', 'telefoni', 'images/grid200x276/cordlessFacileMaxi1.png',
 '0', '0', '0', '1', '1', '1', 'Tim', '35.90', '29.95', 'Caratteristiche:'),
 ('5', 'IPad Air 2', 'tablet_computer', 'tablet', 'images/grid200x276/ipadAir2_1.png',
 '0', '1', '1', '0', '1', '1', 'Apple', '520.00', '450.00', 'Caratteristiche:'),
 ('6', 'Decoder TIMvision', 'tv_smart_living', 'smart living', 'images/grid200x276/decoderTimVision.png',
 '0', '1', '1', '0', '1', '1', 'Tim', '49.00', '40.00', 'Con il decoder TIMvision hai a disposizione pi&ugrave; di 8.000 titoli tra cartoni, film, serie e documentari sempre on demand per creare il tuo palinsesto senza interruzioni pubblicitarie. Puoi goderti la visione anche su Smart TV, su timvision.it e su app TIMvision per Smartphone, Tablet e PC, utilizzando le credenziali scelte al momento della registrazione al servizio TIMvision.'),
 ('7', 'Samsung Smart TV 50  + Soundbar con TIMvision', 'tv_smart_living', 'tv', 'images/grid200x276/samsungSmartTv.png',
 '0', '1', '1', '0', '1', '1', 'Samsung', '936.00', '850.00', 'Caratteristiche:'),
 ('8', 'Samsung Galaxy TabPro S 12', 'tablet_computer', 'computer', 'images/grid200x276/samsungGalaxyTabProS12_1.png',
 '0', '1', '1', '0', '1', '1', 'Samsung', '1299,90', '850.00', 'Caratteristiche:'),
 ('9', 'Olivetti My Way', 'outlet', 'outlet', 'images/grid200x276/olivettiMyWay.png',
 '1', '0', '1', '0', '0', '0', 'Olivetti', '49,00', '19.00', 'Caratteristiche:'),
 ('10', 'Modem ADSL Wi-Fi', 'modem_networking', 'modem', 'images/grid200x276/modemAdsl.png',
 '0', '1', '1', '0', '0', '0', 'Tim', '69,00', '59.00', 'Caratteristiche:')";



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
'images/dispositivi/modemAdsl1.png')";

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
('10', 'Risparmio energetico:', ' Funzione Eco per risparmio energetico')
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
id_sls) VALUES(
'1',
'7',
'2'),
('2',
'7',
'0'
)";


$resultQueryInsert1 = $db -> query($sqlInsert1);



if($resultQueryInsert1 === true){
    echo "Inseriento tuple in device_sls avvenuto correttamente" . "<br>" . "<br>";    
}else{
    echo "Errore nell inserimento dei dati nella tabella device_sls" . "<br>" . "<br>";
}








?>