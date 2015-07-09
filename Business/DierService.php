<?php

class dierService {
    public function dierTonen($id) {
        $dierDAO= new dierDAO();
        $dier=$dierDAO->tonen($id);
        return $dier;
    }
    public function dierAanpassen($id, $naam, $stamboomnaam, $soort, $ras,$geboortedatum, $gewicht,
            $chipnummer, $paspoortnummer, $kleur,  $klantId) {
        $dierDAO= new dierDAO();
        $dier=$dierDAO->getById($id);
        $dier->setNaam($naam);
        $dier->setStamboomnaam($stamboomnaam);
        $dier->setSoort($soort);
        $dier->setRas($ras);
        $dier->setGeboortedatum($geboortedatum);
        $dier->setGewicht($gewicht);
        $dier->setChipnummer($chipnummer);
        $dier->setPaspoortnummer($paspoortnummer);
        $dier->setKleur($kleur);
        $dier->setKlantId($klantId);
                
        
    }
    
}