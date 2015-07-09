<?php

/* require_once("    ")
 * 
 */

class KlantDAO {
    

    /* klanten per ID ophalen */

    public function getById($id) {

        $dbh = new PDO($DBConfig::$DB_CONNSTRING, DBConfig::$DB_USERNAME, DBConfig::$DB_PASSWORD);

        $sql = "select klant.id as klantid , naam , voornaam,email, straat, wachtwoord,
            huisnummer, postcode, woonplaats, tel, dierid from
           klant , dier where dierid = dier.id and klanten.id = " . id;
        
        $resultset = $dbh->query($sql);
        $rij = $resultset->fetch();
        $dier = Dier::create ($rij["dierid"],
                $rij["naam"]);
        $klant = Klant::create($rij["dierid"],$rij["naam"],$dier);
        $dbh = null;
        return $klant;
    }
    
    
    
    /*  klant toevoegen */
    
    public function create($naam , $voornaam,$email ,$straat,$wachtwoord , $huisnummer, $postcode,
            $woonplaats,$tel, $dierID) {
        $sql = "insert into klant (naam, voornaam,email,straat,wachtwoord,postcode,huisnummer,
                postcode,woonplaats,tel, dierid) 
                values ('" .$naam."','" .$voornaam."','" .$email."'," .$straat."'," .$wachtwoord."',
                 '".$huisnummer."'," .$postcode."',".$woonplaats."',".$tel."'".$dierID.")";
        
         $dbh = new PDO($DBConfig::$DB_CONNSTRING, DBConfig::$DB_USERNAME, DBConfig::$DB_PASSWORD);
         $dbh->exec($sql);
         $klantID = $dbh->lastInsertId();
         $dbh = null;
         $dierDAO = new DierDAO();
         $genre = $genreDAO->getById($dierID);
         $klant = Klant::create($klantID, $naam,$voornaam,$email,$straat,$wachtwoord,$huisnummer,
                 $postcode, $woonplaats, $tel);
         return $klant;
        
    }
    
    
    /* klant verwijderen */
 /*  
    public function delete($id){
        $sql = " delete from klant where id = ".$id;
         $dbh = new PDO($DBConfig::$DB_CONNSTRING, DBConfig::$DB_USERNAME, DBConfig::$DB_PASSWORD);
         $dbh->exec ($sql);
         $dbh = null;
    }
  * */
  
    
    
    
    /* klant bijwerken */
    
    public function update ($klant) {
        $sql = "update klant set naam ='" .$klant-> getNaam().
                "',dierID" .$klant->getDier()->getId();
        $dbh = new PDO($DBConfig::$DB_CONNSTRING, DBConfig::$DB_USERNAME, DBConfig::$DB_PASSWORD);
        $dbh->exec($sql);
        $dbh = null ;
    }

}
