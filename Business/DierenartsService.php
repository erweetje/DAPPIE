<?php

class dierenartsService {
    public function dierenartsToevoegen($id, $naam, $voornaam) {
        $dierenartsDAO= new dierenartsDAO(); 
        $dierenartsDAO->create($naam, $voornaam);
    }
    public function dierenartsTonen($id) {
        $dierenartsDAO= new dierenartsDAO();
        $dierenarts=$dierenartsDAO->tonen($id);
        return $dierenarts;
    }
    public function dierenartsAanpassen($id, $naam, $voornaam) {
        $dierenartsDAO= new dierenartsDAO(); 
        $dierenarts= $dierenartsDAO->getByID($id);
        $dierenarts->setNaam($naam);
        $dierenarts->setVoornaam($voornaam);
    }
}