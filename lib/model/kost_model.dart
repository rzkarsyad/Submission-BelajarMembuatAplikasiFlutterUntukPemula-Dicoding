class KostModel {
  String nama;
  String deskripsi;
  String alamat;
  String luas;
  String images;
  List<String> icon;
  List<String> fasilitas;
  int harga;

  KostModel({
    required this.nama,
    required this.deskripsi,
    required this.alamat,
    required this.luas,
    required this.images,
    required this.icon,
    required this.fasilitas,
    required this.harga,
  });
}

var KostTerdekat = [
  KostModel(
    nama: 'Kost Alam Jaya',
    deskripsi:
        'Kost Alam Jaya nyaman untuk dihuni terletak di tengah kota. Tersedia kamar untuk putra dan putri. Luas 2.5 x 2.5 meter. Lokasi dekat dengan Universitas Ahmad Yani, fasilitas lokasi juga tersedi',
    alamat: 'Jl. Jend. Soedirman Kec. Purwokerto Utara No. 21',
    luas: '2.5 x 2.5m',
    images: 'images/kost_alam.png',
    icon: [
      'images/kasur.png',
      'images/listrik.png',
      'images/wifi.png',
      'images/wc.png',
      'images/ac.png',
    ],
    fasilitas: [
      'Kasur',
      'Listrik',
      'Wifi',
      'WC Dalam',
      'AC',
    ],
    harga: 1250000,
  ),
  KostModel(
    nama: 'Kost Oine',
    deskripsi:
        'Kost Oine terletak di jalan Jend. Soedirman Kec. Purwokerto Utara No. 57. Lokasi dekat dengan fasilitas umum. Harga kost terjangkau.',
    alamat: 'Jl. Jend. Soedirman Kec. Purwokerto Utara No. 57',
    luas: '2.5 x 2.5m',
    images: 'images/kost_oine.png',
    icon: [
      'images/kasur.png',
      'images/listrik.png',
      'images/wifi.png',
      'images/wc.png',
      'images/ac.png',
    ],
    fasilitas: [
      'Kasur',
      'Listrik',
      'Wifi',
      'WC Dalam',
      'AC',
    ],
    harga: 1250000,
  ),
];

var KostRekomendasi = [
  KostModel(
    nama: 'Kost Artha Tipe B',
    deskripsi:
        'Kost yang nyaman dan tenang di pusat kota Purwokerto FREE: - Kebersihan kamar seminggu 1x termasuk ganti sprei - Shower mandi air panas/dingin - WiFi Tersedia dapur bersama di tiap lantai, dengan fasilitas kompor 2 tungku, kulkas, dispenser dan peralatan masak. Data bisa berubah sewaktu-waktu, tanyakan data saat ini.',
    alamat: 'Jl. Arwana No. 15 Perum Tegal Sari Indah',
    luas: '3 x 2.5m',
    images: 'images/kost_artha.png',
    icon: [
      'images/kasur.png',
      'images/listrik.png',
      'images/wifi.png',
      'images/wc.png',
    ],
    fasilitas: [
      'Kasur',
      'Listrik',
      'Wifi',
      'WC Dalam',
    ],
    harga: 1150000,
  ),
  KostModel(
    nama: 'Kost Simp',
    deskripsi:
        'BOOKING LANGSUNG sekarang, sebelum kehabisan • Kost putri Unsoed nyaman, aman dan bersih. Kost terletak di barat lapangan karawangkal unsoed purwokerto utara. Kost putri UNSOED yang punya akses jalan mobil, Ventilasi dan cahaya cukup, kamar mandi cukup luas , Kos sangat Dekat Unsoed Fakultas MIPA, PETERNAKAN, AGROBISNIS, BIOLOGI,PERIKANAN, FARMASI, APOTEKER, BAHASA, KEDOKTERAN GIGI, Hanya 7 menit jalan kaki • Dekat dengan Universitas Jenderal Soedirman (4 menit), Padang Golf Wijayakusuma (5 menit), GOR Satria Purwokerto (5 menit), BSI AMIK Purwokerto (6 menit), UT Purwokerto (5 menit), LP3i Purwokerto (5 menit), RST Wijayakusuma (5 menit), RS St Elisabeth (10 menit), RSIA Bunda Arif (10 menit), RS Bunda Purwokerto (9 menit), Politeknik Pratama Purwokerto (6 menit), Pasar Bancar Kembar (6 menit) dekat dengan tempat makan, tempat nongkrong, Ibadah, SPBU, ATM dan mudah ditemukan oleh ojek online • Yuk BOOKING LANGSUNG sekarang, sebelum kehabisan.',
    alamat: 'Jl. Arwana No. 15 Perum Tegal Sari Indah',
    luas: '3 x 2.5m',
    images: 'images/kost_simp.png',
    icon: [
      'images/kasur.png',
      'images/listrik.png',
      'images/wifi.png',
      'images/wc.png',
    ],
    fasilitas: [
      'Kasur',
      'Listrik',
      'Wifi',
      'WC Dalam',
    ],
    harga: 1150000,
  ),
  KostModel(
    nama: 'Kost Minpe',
    deskripsi:
        'Kost Atas terletak di atas ruko. Tempatnya sangat strategis dekat dengan masjid, tempat makan, laundry, mini market, klinik, tempat Fotocopy dan Print. Kampus belakang Unsoed yaitu FIB,Fakultas Pertanian, Fakultas Perternakan, FMIPA,Fakultas Biologi, Fakultas ilmu kesehatan masyarakat, Fakultas Ilmu perikanan, GOR Susilo & GOR Satria.',
    alamat: 'Jl. Arwana No. 15 Perum Tegal Sari Indah',
    luas: '3 x 2.5m',
    images: 'images/kost_minpe.png',
    icon: [
      'images/kasur.png',
      'images/wifi.png',
      'images/wc.png',
    ],
    fasilitas: [
      'Kasur',
      'Wifi',
      'WC Dalam',
    ],
    harga: 1000000,
  ),
  KostModel(
    nama: 'Kost Gray',
    deskripsi:
        '5 Menit dari UGM. 10 Menit dari UNY. Dekat wisata kuliner Jl. Kaliurang, Donkin Donut, McD, Tempo Gelato, Pizza Hut, RM Sederhana. Kalimilk, K24, CircleK AlfaMart Indomart, Bank BNI Bank Bukopin. Kendaraan dan makanan 24jam.',
    alamat: 'Depok, Kabupaten Sleman, Jogja',
    luas: '3 x 2.5m',
    images: 'images/kost_gray.png',
    icon: [
      'images/kasur.png',
      'images/wifi.png',
      'images/listrik.png',
    ],
    fasilitas: [
      'Kasur',
      'Wifi',
      'Listrik',
    ],
    harga: 950000,
  ),
];
