<?php

  namespace Core\Providers;

  use setasign\fpdf\FPDF;

  class PDFProvider extends FPDF {

    public function __construct($orientation='P', $unit='mm', $size='A4') {
      parent::__construct($orientation, $unit, $size);
    }

    public function Header() {
      $this->Image('img/logo.png', 10, 8, 33);
      $this->SetFont('Arial', 'B', 15);
      $this->Cell(80);
      $this->Cell(30, 10, 'Title', 1, 0, 'C');
      $this->Ln(20);
    }

    public function Footer() {
      $this->SetY(-15);
      $this->SetFont('Arial', 'I', 8);
      $this->Cell(0, 10, 'Page '.$this->PageNo().'/{nb}', 0, 0, 'C');
    }
  }