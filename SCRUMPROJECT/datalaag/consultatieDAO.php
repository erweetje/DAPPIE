<?php

class ConsultatieDAO{
    
    /* consultatie per ID ophalen */

    public function getById($id) {

        $dbh = new PDO($DBConfig::$DB_CONNSTRING, DBConfig::$DB_USERNAME, DBConfig::$DB_PASSWORD);

        $sql = "select consultatie.id as id , gewicht ,datum, notitie,  dierid from
           consultatie , dier where dierid = dier.id and consultatie.id = " . id;
        
        $resultset = $dbh->query($sql);
        $rij = $resultset->fetch();
        $dier = Dier::create ($rij["dierid"],
                $rij["naam"]);
        $consultatie = consultatie::create($rij["dierid"],$rij["naam"],$dier);
        $dbh = null;
        return $klant;
    }
    
        /*  consultatie toevoegen */
    
    public function create($gewicht , $datum,$notitie, $dierID) {
        $sql = "insert into consultatie (gewicht,datum,notitie,dierid)
                  
                values ('" .$gewicht."','" .$datum."','" .$nototie."','".$dierID.")";
        
         $dbh = new PDO($DBConfig::$DB_CONNSTRING, DBConfig::$DB_USERNAME, DBConfig::$DB_PASSWORD);
         $dbh->exec($sql);
         $consultatieID = $dbh->lastInsertId();
         $dbh = null;
         $dierDAO = new DierDAO();
         $dier = $dierDAO->getById($dierID);
         $consultatie = Consultatie::create($id, $gewicht,$datum,$notitie);
         return $consultatie;
        
    }
      /* consultatie bijwerken */
    
    public function update ($consultatie) {
        $sql = "update consultatie set naam ='" .$klant-> getNaam().
                "',dierID" .$consultatie->getKlant()->getId();
        $dbh = new PDO($DBConfig::$DB_CONNSTRING, DBConfig::$DB_USERNAME, DBConfig::$DB_PASSWORD);
        $dbh->exec($sql);
        $dbh = null ;
    }
}

