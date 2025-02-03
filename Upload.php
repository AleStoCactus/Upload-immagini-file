<?php
//Verifica campo - tecnica POSTBACK - 
include 'Conta_accessi.php';

if (!isset($_POST['invia']))
{
   //viene mostrato il form
   echo "<FORM ACTION='".$_SERVER['PHP_SELF']."' ENCTYPE='multipart/form-data' METHOD='post'>";
   echo "<INPUT TYPE='file' NAME='file_caricato'>";
   echo "<INPUT TYPE='submit' value='Upload file' NAME='invia'>";
   echo "</FORM>";
}
else
{
   //trasferisco il tipo, il percorso completo (nome_tmp) e il nome del file in 3 variabili di comodo
   $f=$_FILES['file_caricato']['type'];
   $nome=$_FILES['file_caricato']['name'];
   $nome_tmp=$_FILES['file_caricato']['tmp_name'];
   //verifico il tipo di file, se si tratta di un'immagine (jpg, gif o png)
   if (($f=="image/jpeg")||($f=="image/gif")||($f=="image/png"))
   {
      //Con move_uploaded_file il file verr� caricato dal client al server 
      //nel percorso specificato come secondo parametro
      move_uploaded_file($nome_tmp,"immagini/".$nome);
      echo "Immagine caricata";
   } 
   //controllo che il file non sia nullo
   else if ($nome=="")
   {
      echo "Nessun file caricato";
   }
   else
   { 
      //se tipo file non consentito
      move_uploaded_file($nome_tmp,"files/".$nome);
      echo "File caricato";
   }
}
?>
