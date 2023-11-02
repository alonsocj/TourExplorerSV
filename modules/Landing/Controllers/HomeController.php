<?php 

  namespace Module\Landing\Controllers;

  use Module\Tour\Models\TourModel;
  use Module\Tour\Models\TourPlaceModel;
  use Module\Place\Models\PlaceModel;
  use Module\Place\Models\ImageModel;

  class HomeController {
    public function index() {
      $data = [
        'title' => 'ToursExplorer SV',
        'message' => 'Encuentra los mejores tours en El Salvador',
        'tours' => TourModel::obtenerToursFechaMayorAAhora()
      ];
      return view('landing.home', $data);
    }

    public function showOldTours() {
      $data = [
        'title' => 'ToursExplorer SV',
        'message' => 'Encuentra los mejores tours en El Salvador',
        'tours' => TourModel::obtenerToursFechaMenorAAhora()
      ];
      return view('landing.home', $data);
    }

    public function showTour($params) {
      $paramsData = $params['params'];
      $tour = TourModel::obtenerUno(htmlentities(addslashes($paramsData['id_tour'])));

      if (!$tour) {
        flash('error', 'Tour no encontrado');
        return redirect('/');
      }

      $lugares = TourPlaceModel::obtenerPorTour($tour['id_tour']);

      for ($i=0; $i < count($lugares); $i++) { 
        $lugar = PlaceModel::obtenerUno($lugares[$i]['id_lugar']);
        $lugares[$i]['lugar'] = $lugar;
        $lugares[$i]['imagenes'] = ImageModel::imagenesPorLugar($lugar['id_lugar']);
      }

      $data = [
        'title' => 'ToursExplorer SV',
        'message' => 'Encuentra los mejores tours en El Salvador',
        'tour' => $tour,
        'lugares' => $lugares
      ];

      return view('landing.tour', $data);

    }

    public function phpinfo() {
      phpinfo();
    }
  }