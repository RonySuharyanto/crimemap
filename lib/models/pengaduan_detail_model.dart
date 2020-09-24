import 'package:equatable/equatable.dart';
import 'package:intl/intl.dart';
import 'package:meta/meta.dart';

import 'laporan_model.dart';

class PengaduanDetailModel extends Equatable {
  final String id;
  final String keterangan;
  final int jumlahKorban;
  final User polisi;
  final User masyarakat;
  final JenisKejahatan jenisKejahatan;
  final String longitude;
  final String latitude;
  final String statusTerakhir;
  final DateTime tanggalDibuat;
  final List<Riwayat> riwayat;

  const PengaduanDetailModel({
    @required this.id,
    @required this.keterangan,
    @required this.jumlahKorban,
    @required this.polisi,
    @required this.masyarakat,
    @required this.jenisKejahatan,
    @required this.longitude,
    @required this.latitude,
    @required this.statusTerakhir,
    @required this.tanggalDibuat,
    @required this.riwayat,
  });

  factory PengaduanDetailModel.fromJSON(Map<String, dynamic> json) {
    return PengaduanDetailModel(
      id: json['_id'],
      keterangan: json['keterangan'],
      jumlahKorban: json['jumlah_korban'],
      latitude: json['latitude'],
      longitude: json['longitude'],
      statusTerakhir: json['status_terakhir'],
      tanggalDibuat: DateTime.parse(json['tanggal_dibuat']),
      jenisKejahatan: JenisKejahatan.fromJSON(json['jenis_kejahatan']),
      masyarakat: User.fromJSON(json['masyarakat']),
      polisi: json["polisi"] == null ? null : User.fromJSON(json['polisi']),
      riwayat:
          (json['riwayat'] as List).map((j) => Riwayat.fromJSON(j)).toList(),
    );
  }

  @override
  List<Object> get props => [
        id,
        keterangan,
        jumlahKorban,
        polisi,
        masyarakat,
        jenisKejahatan,
        longitude,
        latitude,
        statusTerakhir,
        tanggalDibuat,
        riwayat,
      ];
}

class Riwayat extends Equatable {
  final String id;
  final String keterangan;
  final String foto;
  final String status;
  final DateTime tanggalDibuat;

  const Riwayat({
    @required this.id,
    @required this.keterangan,
    @required this.foto,
    @required this.status,
    @required this.tanggalDibuat,
  });

  factory Riwayat.fromJSON(Map<String, dynamic> json) {
    return Riwayat(
      id: json["_id"],
      keterangan: json["keterangan"],
      foto: json["foto"],
      status: json['status'],
      tanggalDibuat: DateTime.parse(json['tanggal_dibuat']),
    );
  }

  String get formatTangalDibuat =>
      DateFormat.yMd().format(tanggalDibuat.toLocal()) +
      " " +
      DateFormat.Hm().format(tanggalDibuat.toLocal());

  @override
  List<Object> get props => [id, keterangan, foto, status, tanggalDibuat];
}

class User extends Equatable {
  final String id;
  final String nama;
  final String noTelp;

  const User({
    @required this.id,
    @required this.nama,
    @required this.noTelp,
  });

  factory User.fromJSON(Map<String, dynamic> json) {
    return User(
      id: json["_id"],
      nama: json["nama"],
      noTelp: json["no_telp"],
    );
  }

  @override
  List<Object> get props => [id, nama, noTelp];
}
