// todo: model class laporan

class Laporan {
  final String id;
  final String notelp;
  final String alamat;
  final String keterangan;
  final String kejahatan;
  final String foto;
  final int jumlahKorban;
  final String status;
  final String tanggalDibuat;

  Laporan({
    this.id,
    this.notelp,
    this.alamat,
    this.keterangan,
    this.kejahatan,
    this.foto,
    this.jumlahKorban,
    this.tanggalDibuat,
    this.status = 'pending' ?? this.status,
  });
}

List<Laporan> listRiwayatLaporan = [
  Laporan(
    id: '134139898',
    kejahatan: 'Curanmor',
    jumlahKorban: 8,
    keterangan: 'Ada Maling Motor Nich Daerah Sini',
    notelp: '0819570954',
    alamat: 'jl.sunter agung',
    tanggalDibuat: '20-09-2020',
    foto:
        'https://cdn-radar.jawapos.com/uploads/radarsurabaya/news/2020/02/25/sindikat-curanmor-spesialis-kos-yang-beraksi-di-belasan-tkp-digulung_m_180943.jpg',
  ),
  Laporan(
    id: '13417564',
    kejahatan: 'Tawuran',
    jumlahKorban: 10,
    keterangan: 'Ada Tawuran di manggarai',
    notelp: '0856732185',
    alamat: 'jl.manggarai utara',
    tanggalDibuat: '15-04-2020',
    foto:
        'https://img.beritasatu.com/cache/beritasatu/600x350-2/1423051947.jpg',
  ),
  Laporan(
    id: '367895416',
    kejahatan: 'Curas',
    jumlahKorban: 5,
    keterangan: 'Ada Curas di Kemayoran',
    notelp: '0217954367',
    alamat: 'jl.ondel-ondel',
    tanggalDibuat: '13-11-2019',
    foto: '',
  ),
  Laporan(
    id: '13417564',
    kejahatan: 'Curat',
    jumlahKorban: 7,
    keterangan: 'Ada Curat di Mampang',
    notelp: '08578095647',
    alamat: 'jl.mampang prapatan',
    tanggalDibuat: '25-03-2019',
    foto: '',
  ),
  Laporan(
    id: '678931256',
    kejahatan: 'Begal',
    jumlahKorban: 8,
    keterangan: 'Ada Begal di utan panjang',
    notelp: '0812586905',
    alamat: 'jl.utan panjang',
    tanggalDibuat: '27-06-2020',
    foto:
        'https://imgx.motorplus-online.com/crop/0x0:0x0/700x465/photo/2018/12/30/3992130237.jpg',
  ),
];
