# Hypermedia project
<h4>Intro</h4>

Per il costo di Hypermedia applications (web and multimedia) abbiamo realizzato un sito web che, seguendo le seguenti specifiche [specifiche](https://github.com/mkcn/hypermedia-project/tree/master/cimbelli-conti-daverio-16-05-2016/Specification_part2.pdf), contituisce un sottoinsieme del sito [tim.it](http://tim.it)

I linguaggi utilizzati sono: 

* HTML 
* JS 
* SQL
* PHP (per gestire il contenuto dinamico)
* Ajax (per  gestire le chiamate asincrone a pagine PHP)

Il sito web è accessibile da tutti i principali browser all'indirizzo [http://timhypermedia.altervista.org/](http://timhypermedia.altervista.org/).

<h4>Version mobile</h4>
In caso di dispositivi mobile il sito web è accessibile:

* dal link precendete (con grafica dedicata per schermi di ogni dimensione) 
* in formato applicazione , disponibile per dispositivi Android al sequente link [TIM.apk](https://github.com/mkcn/hypermedia-project/raw/master/Phonegap/Tim.apk).

L'applicazione è stata generato utilizzando la versione online di [Phonegap](https://build.phonegap.com/apps). 


<h4>Struttura codice</h4>

Il progetto è struttura nel sequente ordine:

* le pagine HTML si trovano nella directory principale [WEBSITE](https://github.com/mkcn/hypermedia-project/tree/master/WEBSITE)
* i file CSS in [WEBSITE/css](https://github.com/mkcn/hypermedia-project/tree/master/WEBSITE/css)
* i file JS in [WEBSITE/js](https://github.com/mkcn/hypermedia-project/tree/master/WEBSITE/js)
* tutte le imagini in [WEBSITE/images](https://github.com/mkcn/hypermedia-project/tree/master/WEBSITE/images)
* i file PHP in [WEBSITE/db](https://github.com/mkcn/hypermedia-project/tree/master/WEBSITE/db)


* i file del database in formato .sql nella cartella [DB](https://github.com/mkcn/hypermedia-project/tree/master/DB). In particolare il file [DB.sql](https://github.com/mkcn/hypermedia-project/raw/master/DB/DB.sql) contiene l'intero db e il file [DB-Schema.pdf](https://github.com/mkcn/hypermedia-project/raw/master/DB/DB-Schema.pdf) contiene lo schema della struttura del database. 


* i file di Phonegap con l'applicazione sono nella cartella [Phonegap](https://github.com/mkcn/hypermedia-project/tree/master/Phonegap)


* file di [documentazione e mockup](https://github.com/mkcn/hypermedia-project/tree/master/cimbelli-conti-daverio-16-05-2016)

Per costruire il nostro sito abbiamo preso spunto da un template online, il quale ci ha fornito una base per l'aspetto grafico. Abbiamo utilizzato parte dei css e delle funzioni javascript basati su Boostrap e Jquery.

Le librerie e funzione esterne sono posizionate rispettivamente nella cartella "libraries":

* [WEBSITE/css/libraries](https://github.com/mkcn/hypermedia-project/tree/master/WEBSITE/css/libraries)  per delineare l'aspetto grafico generale del sito 
* [WEBSITE/js/libraries](https://github.com/mkcn/hypermedia-project/tree/master/WEBSITE/js/Libraries) per ottenere degli effetti grafici complessi, come per esempio il menu a tendina e lo slider dei prodotti.

<h4>Funzionalità opzionali implementate:</h4>
<ul>
<li>Form per la richiesta generale di informazioni: è presente un bottone "contattaci" nelle 4 pagine degli assistance services che mostra questo form.</li>
<li>Il filtro per i prodotti (gestito usando i cookies o in alcuni casi specifici usando il paramentro "filter" passato col il metodo GET). Esso permette di filtrare dinamicamente basandosi sul tag degli oggetti nella lista. </li>
</ul>

<h4>Problemi di incompatibilità con Phonegap</h4>

Dai test effettuati nell'applicazione non tutti i dispositivi mobile supportano la lettura dei cookies, non permettendo quindi il funzionamento corretto del filtro.

Inoltre Phonegap non rende disponibie la funzione "document.referrer" abbiamo quindi optato, a differenza della modalità browser, un link "Vai a" che garantisse il giusto funzionamento ma è non contestualizzato. 

