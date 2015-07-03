<?php

require_once ("data/klantDAO.php");

class klantService{
    public function klantToevoegen($naam, $voornaam, $straat, $huisnummer,
            $postcode, $woonplaats, $email, $wachtwoord, $tel) {
        $klantDAO=new klantDAO();
        $klantDAO->create($naam, $voornaam, $straat, $huisnummer,
            $postcode, $woonplaats, $email, $wachtwoord, $tel);
        
    }
    public function klantTonen($id) {
        $klantDAO= new klantDAO();
        $klant=$klantDAO->getById($id);
        return $klant;
    }
    public function klantDelete($id) {
     $klantDAO= new klantDAO();
     $klantDAO->delete($id);
    }
    
}