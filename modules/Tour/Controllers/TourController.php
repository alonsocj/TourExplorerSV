<?php

namespace Module\Tour\Controllers;

class TourController{
    public function index(){
    return view('tour.historyTour');
    }
    public function phpinfo(){
        phpinfo();
    }
}