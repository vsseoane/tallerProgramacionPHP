<?php

include_once 'utils.php';

require('includes/libs/fpdf.php');
$pubId = $_GET['id'];
class PDF extends FPDF {

// Tabla coloreada
    function LlenarElPDF($data,$pubId) {

        foreach ($data as $row) {
            $this->Cell(50, 6, 'Titulo:', 0, 0, 'L');
            $this->MultiCell(125, 15, utf8_decode($row['titulo']), 0, 'L', 0);
            $this->Cell(50, 6, 'Descripcion:', 0, 0, 'L');
            $cantLetras_descripcion = strlen(utf8_decode($row['descripcion']));
            $cantLetrasPorRenglon = 55;
            $cantRenglones_descripcion = ($cantLetras_descripcion / $cantLetrasPorRenglon) + 2;
            $this->MultiCell(125, $cantRenglones_descripcion, utf8_decode($row['descripcion']), 0, 'L', 0);
            $tipo = '';
            if ($row['tipo'] == 'E') {
                $tipo = 'Encontrado';
            }
            if ($row['tipo'] == 'P') {
                $tipo = 'Perdido';
            }
            $this->Ln();
            $this->Cell(50, 6, 'Tipo:', 0, 0, 'L');
            $this->MultiCell(125, 4, $tipo, 0, 'L', 0);
            $this->Ln();
            $this->Cell(50, 6, 'Barrio:', 0, 0, 'L');
            $barrioID = $row['barrio_id'];
            $barrio = ConseguirBarrioPorID($barrioID);
            $this->MultiCell(125, 4, utf8_decode($barrio), 0, 'L', 0);
            $this->Ln();
            $this->Cell(50, 6, 'Especie:', 0, 0, 'L');
            $especieID = $row['especie_id'];
            $especie = ConseguirEspeciePorID($especieID);
            $this->MultiCell(125, 4, utf8_decode($especie), 0, 'L', 0);
            $this->Ln();
            $this->Cell(50, 6, 'Raza:', 0, 0, 'L');
            $razaID = $row['raza_id'];
            $raza = ConseguirRazaPorID($razaID);
            $this->MultiCell(125, 4, utf8_decode($raza), 0, 'L', 0);
            $this->Ln();
            $this->Cell(50, 6, 'Usuario:', 0, 0, 'L');
            $usuarioID = $row['usuario_id'];
            $usuario = ConseguirUsuariosPorID($usuarioID);
            $this->MultiCell(125, 4, utf8_decode($usuario), 0, 'L', 0);
            $this->Ln();
            $dir = "fotos/" . $pubId . "/";

            if (is_dir($dir)) {
                $d = dir($dir);
                $iBefore = $this->GetY() + 5;
                $i = $iBefore;
                $xBefore = $this->GetX() + 5;
                $x = $xBefore;
                $cont = 0;
                while (false !== ($file = $d->read())) {

                    if ($file != "." && $file != "..") {

                        $this->Image($dir . $file, $x, $i, 0, 40);
                        $this->Ln();
                        $x += 60;
                        $cont++;
                        if (($cont % 2 == 0) && ($cont % 6 != 0)) {
                            $x -= 120;
                            $i += 60;
                        }
                        if ($cont % 6 == 0) {
                            $this->AddPage();
                            $x = 10;
                            $i = 10;
                        }
                    }
                }
                $d->close();
            }
            return $this;
        }
    }

}

function ConseguirBarrioPorID($barrioID) {
    $conn = getConexion();
    $conn->consulta("select nombre from barrios where id = :idBarrio", array(array("idBarrio", $barrioID, 'string')));
    $data = $conn->restantesRegistros();
    $conn->desconectar();
    return $data[0]['nombre'];
}

function ConseguirEspeciePorID($especieID) {
    $conn = getConexion();
    $conn->consulta("select nombre from especies where id = :idEspecie", array(array("idEspecie", $especieID, 'string')));
    $data = $conn->restantesRegistros();
    $conn->desconectar();
    return $data[0]['nombre'];
}

function ConseguirRazaPorID($razaID) {
    $conn = getConexion();
    $conn->consulta("select nombre from razas where id = :idRaza", array(array("idRaza", $razaID, 'string')));
    $data = $conn->restantesRegistros();
    $conn->desconectar();
    return $data[0]['nombre'];
}

function ConseguirUsuariosPorID($usuarioID) {
    $conn = getConexion();
    $conn->consulta("select nombre from usuarios where id = :idUsuario", array(array("idUsuario", $usuarioID, 'string')));
    $data = $conn->restantesRegistros();
    $conn->desconectar();
    return $data[0]['nombre'];
}

$pdf = new PDF();

$conn = getConexion();

$conn->consulta("select titulo, descripcion , tipo , especie_id, raza_id, barrio_id, abierto, usuario_id , exitoso , id ,  count(*) as cantPublicaciones from publicaciones where id= :idPub", array(array("idPub", $pubId, 'string')));



$data = $conn->restantesRegistros();

$conn->desconectar();


$pdf->SetFont('Arial', '', 14);
$pdf->AddPage();
$pdf->LlenarElPDF($data,$pubId);
$pdf->Output();
?>