# Hypermedia project
Per costruire il nostro sito abbiamo preso spunto da un template online, il quale ci ha fornito una base per l'aspetto grafico. Infatti, di questo template, abbiamo utilizzato parte dei css per delineare l'aspetto grafico generale del sito e delle funzioni javascript per ottenere degli effetti grafici complessi (Il menu a tendina e lo slider dei prodotti in primis).

<h5>Ciò che noi abbiamo realizzato è:</h5>
<ul>
<li>Tutto l'html.</li>
<li>Tutto il php.</li>
<li>Tutto il db.</li>
<li>Tutti i file js associati ad ogni pagina del sito. (Quelli nella cartella js che costituiscono la logica lato client del sito).</li>
<li>Parti di css più specifiche alle nostre esigenze.</li>
</ul>

Tutte le librerie utilizzate sia per il js che per il css sono rispettivamente all'interno delle cartelle denominate Libraries.
Le librerie esterne utilizzate sono: bootstrap, jquery e tutti quei file del template che servono agli effetti implementati.

Nella cartella DB abbiamo inserito un pdf in cui è abbozzata la struttura del nostro database.

<h5>Opzionali implementati:</h5>
<ul>
<li>Form per la richiesta generale di informazioni: è presente un bottone "contattaci" nelle 4 pagine degli assistance services che mostra questo form.</li>
<li>Il filtro per i prodotti (gestito con il supporto dei cookies).</li>
<li>Abbiamo riposto attenzione nell'evitare che il nostro sito fosse vulnerabile a un attacco di tipo SQL Injection, filtrando attraverso escaping tutti gli input provenienti dall'esterno. Abbiamo modificato i permessi dei file più sensibili, impedendo di essere reperibili dall'esterno.</li>
</ul>

<h5>Bug noti:</h5>
<ul>
<li>Phonegap per la sola versione android non supporta la lettura dei cookies non permettendo un funzionamento corretto del filtro.</li>
<li>Phonegap non rendeva disponibie la funzione document.referrer rendendo impossibile un funzionamento completo del nostro "Vai a" (il quale funziona correttamente se utilizzato da browser).</li>
</ul>
