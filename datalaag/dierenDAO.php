<?php

/*   require_once     

 * 
 *  */

class DierenDAO {
    /* dieren per ID ophalen */

    public function getById($id) {
        $dbh = new PDO($DBConfig::$DB_CONNSTRING, DBConfig::$DB_USERNAME, DBConfig::$DB_PASSWORD);

        $sql = "select naam , stamboomnaam, soort, ras, geboortedatum, chipnummer,
           paspoortnummer,kleur, medbeeld, klantid
           from dier , klant    where dierId=dier.id and klant.id = " . $id;


        $resultset = $dbh->query($sql);
        $rij = $resultSet->fetch();
        $genre = Genre::create($id, $rij["naam"]);
        $dbh = null;
        return $dier;
    }
    
      /*  dier toevoegen */
    
    public function create($naam , $stamboomnaam,$soort ,$ras,$geboortedatum , $chipnummer, $paspoortnummer,
            $kleur,$medbeeld, $klantID) {
        $sql = "insert into dier (naam, stamboomnaam,soort,ras,geboortedatum,chipnummer,paspoortnummer,
                kleur,metbeeld, klantid) 
                values ('" .$naam."','" .$stamboomnaam."','" .$soort."'," .$rast."'," .$geboortedatum."',
                 '".$chipnummer."'," .$paspoortnummer."',".$kleur."',".$medbeeld."'".$klantID.")";
        
         $dbh = new PDO($DBConfig::$DB_CONNSTRING, DBConfig::$DB_USERNAME, DBConfig::$DB_PASSWORD);
         $dbh->exec($sql);
         $dierID = $dbh->lastInsertId();
         $dbh = null;
         $klantDAO = new klantDAO();
         $dier = $dierDAO->getById($dierID);
         $dier = Klant::create($dierID, $naam,$stamboomnaam,$soort,$ras,$geboortedatum,$chipnummer,
                 $paspoortnummer, $kleur, $medbeeld, $klantID);
         return $dier;
        
    }
    
     /* dier verwijderen */
    
  /*  public function delete($id){
        $sql = " delete from dier where id = ".$id;
         $dbh = new PDO($DBConfig::$DB_CONNSTRING, DBConfig::$DB_USERNAME, DBConfig::$DB_PASSWORD);
         $dbh->exec ($sql);
         $dbh = null;
    }
    */
    /* dier bijwerken */
    
    public function update ($dier) {
        $sql = "update dier set naam ='" .$dier-> getNaam().
                "',dierID" .$dier->getKlant()->getId();
        $dbh = new PDO($DBConfig::$DB_CONNSTRING, DBConfig::$DB_USERNAME, DBConfig::$DB_PASSWORD);
        $dbh->exec($sql);
        $dbh = null ;
    }


}
