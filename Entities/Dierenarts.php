<?php

class dierenarts {
    private static $idMap=array();                                              #alle objecten dierenarts komen hier in (index adhv id)
    private $id;
    private $naam;
    private $voornaam;
    
    private function __construct($id, $naam, $voornaam) {
        $this->id=$id;
        $this->naam=$naam;
        $this->voornaam=$voornaam;
    }
    
    public static function create($id, $naam, $voornaam) {
        if (!isset(self::$idMap[$id])){
            self::$idMap[$id] = new dierenarts($id, $naam, $voornaam);
        }
        return self::$idMap[$id];
    }
    
    public function getId() {
        return $this->id;
    }
    public function getNaam() {
        return $this->naam;
    }
    public function getVoornaam() {
        return $this->voornaam;
    }
    public function setNaam($naam) {
        $this->naam=$naam;
    }
    public function setVoornaam($voornaam) {
        $this->voornaam=$voornaam;
    }
}