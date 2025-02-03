<?php
//nome de file utilizzato nello script per memorizzare il totale accessi
$nomefile ="accessi.txt";
//Verifica dell'esistenza del file con la funzione file_exists()
if (file_exists($nomefile))
{ 
   //se esiste gia viene aperto in lettura
   $idfile=fopen($nomefile,"r+");      
   //se non si riesce ad prirlo viene creato un messaggio di errore
   if (!$idfile) die ($msg="il file &nomefile non � stato aperto<BR>");
      //se il file viene aperto correttamente 
      //vengono letti i primi dieci caratteri e memorizzati nella variabile $conta_accessi
      //il casting � d'obbligo per trasformare la stringa in intero
      $conta_accessi = (int) fread($idfile,10);
   //chiusura file
   fclose($idfile); 
}
else
{ 
   //se il file non esiste viene aperto e creato contestualmente
   $idfile=fopen($nomefile,"w+");      
   if (!$idfile) die ($msg="il file &nomefile non � stato aperto<BR>"); 
      //se il file viene aperto correttamente viene inizializzata la variabile conta_accessi
      $conta_accessi = 0;
   //chiusura del file
   fclose($idfile);  
} 
//incremento del contatore di accessi (conta_accessi)
$conta_accessi++;
//apertura del file in scrittura e lettura distruttiva
$idfile=fopen($nomefile,"w+");      
if (!$idfile) die ($msg="il file &nomefile non � stato aperto<BR>"); 
   //se file aperto correttamente 
   //scrittura nel file del contatore di accessi
   fwrite($idfile,$conta_accessi);  
//chiusura file
fclose($idfile);
//visualizzazione contatore accessi  

echo"ACCESSI: ".($conta_accessi)."<br><br>";
?>


