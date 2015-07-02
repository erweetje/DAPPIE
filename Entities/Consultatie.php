<?php
class consultatie {
    private $id;
    private $gewicht;
    private $dierId;
    private $datum;
    private $notitie;
    
    public function __construct($id, $gewicht, $dierId, $datum, $notitie) {
        $this->id=$id;
        $this->gewicht=$gewicht;
        $this->dierId=$dierId;
        $this->datum=$datum;
        $this->notitie=$notitie;
             
    }
    
    public function getId() {
        return $this->id;
    }
    public function getGewicht() {
        return $this->gewicht;
    }
      public function getDierId() {
        return $this->dierId;
    }
      public function getDatum() {
        return $this->datum;
    }
      public function getNotitie() {
        return $this->notitie;
    }
    
    public function setGewicht($gewicht) {
        $this->gewicht=$gewicht;
    }
       public function setDierId($dierId) {
        $this->dierId=$dierId;
    }
       public function setDatum($datum) {
        $this->datum=$datum;
    }
       public function setNotitie($notitie) {
        $this->notitie=$notitie;
    }
}