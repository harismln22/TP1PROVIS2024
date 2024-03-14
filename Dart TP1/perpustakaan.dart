import 'dart:io';

class Perpus 
{
  String judul = "", penulis = ""; 
  int tahun = 0, jumlahHalaman = 0;

  Perpus(judul, penulis, tahun, jumlahHalaman) // construct parameter non named
  {
    this.judul = judul;
    this.penulis = penulis;
    this.tahun = tahun;
    this.jumlahHalaman = jumlahHalaman;
  }

  void tampilkanInfo() // menampilkan buku
  {
    print('\nBuku: ');
    print('Judul: $judul\nPenulis: $penulis\nTahun: $tahun\nHalaman: $jumlahHalaman\n');
  }
}

Future<Perpus> buatObjekBuku(String judul, String penulis, int tahun, int jumlahHalaman) async 
{
  await Future.delayed(Duration(seconds: 2)); // akan menunda selama 2 detik
  return Perpus(judul,  penulis,  tahun, jumlahHalaman); // mengembalikan objek buku
}

void main() async 
{
  print('Selamat datang di perpustakaan , silahkan pilih fitur dibawah ini');
  int stop = 0;
  Perpus? buku;
  while(stop == 0)
  {
    print('1. Membuat buku');
    print('2. Menampilkan buku');
    print('3. keluar');
    print('pilih:');
    String? milih = stdin.readLineSync();

    int? konvertAngka = int.tryParse(milih!);

    if(konvertAngka != null)
    {
      if(konvertAngka == 1)
      {
        print('Masukkan judul: ');
        String? isi_nama = stdin.readLineSync();

        print('Masukkan penulis');
        String? isi_penulis = stdin.readLineSync();

        print('Masukkan tahun: ');
        String? isi_tahun = stdin.readLineSync();
        int? konvertTahun = int.tryParse(isi_tahun!);

        print('Masukkan jumlah Halaman: ');
        String? isi_halaman = stdin.readLineSync();
        int? konvertHalaman = int.tryParse(isi_halaman!);
        print('Membuat buku...');
        buku = await buatObjekBuku(isi_nama!, isi_penulis!, konvertTahun!, konvertHalaman!);
        print('buku berhasil dibuat.');
      }
      else if(konvertAngka == 2)
      {
        if (buku != null) 
        {
          buku.tampilkanInfo();
        } 
        else {
          print('Buku kosong!');
        }
      }
      else
      {
        stop = 1;
      }
    }
  }
}
