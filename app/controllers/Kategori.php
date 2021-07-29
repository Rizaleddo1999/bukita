<?php

class Kategori extends Controller
{
    public function index()
    {
        $data['title'] = 'Halaman Kategori';
        $data['kategori'] = $this->model('KategoriModel')->getAllKategori();

        //bergantian memanggil file dalam template sifatnya static
        $this->view('templates/header', $data);
        $this->view('templates/sidebar', $data);
        //memanggil content sesuai dengan yang dipanggil
        $this->view('kategori/index', $data);
        $this->view('templates/footer');
    }

    public function cari()
    {
        $data['title'] = 'Data Kategori';
        $data['kategori'] = $this->model('KategoriModel')->cariKategori();
        $data['key'] = $_POST['key'];

        //bergantian memanggil file dalam template sifatnya static
        $this->view('templates/header', $data);
        $this->view('templates/sidebar', $data);
        //memanggil content sesuai dengan yang dipanggil
        $this->view('kategori/index', $data);
        $this->view('templates/footer');
    }

    public function edit($id)
    {
        $data['title'] = 'Detail Kategori';
        $data['kategori'] = $this->model('KategoriModel')->getKategoriById($id);

        $this->view('templates/header', $data);
        $this->view('templates/sidebar', $data);
        //memanggil halaman form tambah Kategori
        $this->view('kategori/edit', $data);
        //akhir memanggil halaman form tambah Kategori
        $this->view('templates/footer');
    }

    public function tambah()
    {
        $data['title'] = 'Tambah Kategori';

        $this->view('templates/header', $data);
        $this->view('templates/sidebar', $data);
        //memanggil halaman form tambah Kategori
        $this->view('kategori/create', $data);
        //akhir memanggil halaman form tambah Kategori
        $this->view('templates/footer');
    }

    public function simpanKategori()
    {
        if ($this->model('KategoriModel')->tambahKategori($_POST) > 0) {
            Flasher::setMessage('Berhasil', 'ditambahkan', 'success');
            header('location: ' . base_url . '/kategori');
            exit;
        } else {
            Flasher::setMessage('Gagal', 'ditambahkan', 'danger');
            header('location: ' . base_url . '/kategori');
            exit;
        }
    }

    public function updateKategori()
    {
        if ($this->model('KategoriModel')->updateDataKategori($_POST) > 0) {
            Flasher::setMessage('Berhasil', 'diupdate', 'success');
            header('location: ' . base_url . '/kategori');
            exit;
        } else {
            Flasher::setMessage('Gagal', 'diupdate', 'danger');
            header('location: ' . base_url . '/kategori');
            exit;
        }
    }

    public function hapus($id)
    {
        if ($this->model('KategoriModel')->deleteKategori($id) > 0) {
            Flasher::setMessage('Berhasil', 'dihapus', 'success');
            header('location: ' . base_url . '/kategori');
            exit;
        } else {
            Flasher::setMessage('Gagal', 'dihapus', 'danger');
            header('location: ' . base_url . '/kategori');
            exit;
        }
    }
}
