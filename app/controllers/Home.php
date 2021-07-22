<?php

class Home extends Controller
{
    public function index()
    {
        $data['title'] = 'Halaman Home';

        //bergantian memanggil file dalam template sifatnya static
        $this->view('templates/header', $data);
        $this->view('templates/sidebar', $data);
        //memanggil content sesuai dengan yang dipanggil
        $this->view('home/index', $data);
        $this->view('templates/footer');
    }
}
