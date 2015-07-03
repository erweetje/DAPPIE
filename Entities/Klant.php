<?php

class Klant {
    private $id;
    private $naam;
    private $voornaam;
    private $straat;
    private $huisnummer;
    private $postcode;
    private $woonplaats;
    private $email;
    private $wachtwoord;
    private $tel;
    private static $idMap=array();

    private function __construct($id, $naam, $voornaam, $straat, $huisnummer,
            $postcode, $woonplaats, $email, $wachtwoord, $tel){
        $this->id=$id;
        $this->naam=$naam;
        $this->voornaam=$voornaam;
        $this->straat=$straat;
        $this->huisnummer=$huisnummer;
        $this->postcode=$postcode;
        $this->woonplaats=$woonplaats;
        $this->email=$email;
        $this->wachtwoord=$wachtwoord;
        $this->tel=$tel;
        
    }
    
    public static function create($id, $naam, $voornaam, $straat, $huisnummer,
            $postcode, $woonplaats, $email, $wachtwoord, $tel) {
        if (!isset(self::$idMap[$id])) {
            self::$idMap[$id]=new Klant($id, $naam, $voornaam, $straat, $huisnummer, $postcode, $woonplaats, $email, $wachtwoord, $tel);
            
        }
        return self::$idMap;
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
    public function getStraat() {
        return $this->straat;
    }
    public function getHuisnummer() {
        return $this->huisnummer;
    }
            
    public function getPostcode() {
        return $this->postcode;
    }
    public function getWoonplaats() {
        return $this->woonplaats;
    }
    public function getEmail() {
        return $this->email;
    }
    public function getWachtwoord() {
        return $this->wachtwoord;
    }
    
    public function getTel() {
        return $this->tel;
    }
    
    public function setNaam($naam) {
        $this->naam=$naam;
    }
    public function setVoornaam($voornaam) {
        $this->voornaam=$voornaam;
    }
    public function setStraat($straat) {
        $this->straat=$straat;
    }
    public function setHuisnummer($huisnummer) {
        $this->huisnummer=$huisnummer;
    }
    public function setPostcode($postcode) {
        $this->postcode=$postcode;
    }
    public function setWoonplaats($woonplaats) {
        $this->woonplaats=$woonplaats;
    }
    public function setEmail($email) {
        $this->email=$email;
    }
    public function setWachtwoord($wachtwoord) {
        $this->wachtwoord=$wachtwoord;
    }
    public function setTel($tel) {
        $this->tel=$tel;
    }    
           
}