<?php
class consultatieService{
    public function consultatieTonen($datum) {
        $consultatieDAO= new consultatieDAO();
        $consultatie=$consultatieDAO->getByDate($datum);
        return $consultatie;
    }
    public function consultatieToevoegen($id, $gewicht, $dierId, $datum, $notitie, $medbeeld) {
        $consultatieDAO= new consultatieDAO();
        $consultatieDAO->create($id, $gewicht, $dierId, $datum, $notitie, $medbeeld);
    }
}