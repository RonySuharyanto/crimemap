import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

class LaporanModel extends Equatable {
  final String id;
  final LaporanLocation location;
  final JenisKejahatan jenisKejahatan;
  final String keterangan;
  final String jumlahKeterangan;
  final String statusTerakhir;
  final String polisi;
  final String foto;
  final String masyarakat;
  final String tanggalDibuat;
  final int jumlahKorban;

  const LaporanModel({
    this.id,
    this.location,
    this.keterangan,
    this.jumlahKeterangan,
    this.statusTerakhir,
    this.polisi,
    this.foto,
    this.masyarakat,
    this.tanggalDibuat,
    this.jenisKejahatan,
    this.jumlahKorban,
  });

  factory LaporanModel.fromJSON(Map<String, dynamic> json) {
    return LaporanModel(
      id: json['_id'],
      location: LaporanLocation.fromJSON(json['location']),
      keterangan: json['keterangan'],
      jumlahKeterangan: json['jumlah_keterangan'],
      statusTerakhir: json['status_terakhir'],
      foto: json['foto'],
      masyarakat: json['masyarakat'],
      tanggalDibuat: json['tanggal_dibuat'],
      jenisKejahatan: JenisKejahatan.fromJSON(json['jenis_kejahatan']),
      jumlahKorban: json['jumlah_korban'],
    );
  }

  @override
  List<Object> get props => [
        id,
        location,
        keterangan,
        jumlahKeterangan,
        statusTerakhir,
        polisi,
        foto,
        masyarakat,
        tanggalDibuat,
      ];
}

class JenisKejahatan extends Equatable {
  final String id;
  final int maksimalPetugas;
  final String jenis;
  final int tingkat;

  const JenisKejahatan({
    @required this.id,
    @required this.maksimalPetugas,
    @required this.jenis,
    @required this.tingkat,
  });

  factory JenisKejahatan.fromJSON(Map<String, dynamic> json) {
    return JenisKejahatan(
      id: json['_id'],
      maksimalPetugas: json['maksimal_petugas'],
      jenis: json['jenis'],
      tingkat: json['tingkat'],
    );
  }

  @override
  List<Object> get props => [id, maksimalPetugas, jenis, tingkat];
}

class LaporanLocation extends Equatable {
  final String type;
  final List<dynamic> coordinates;

  const LaporanLocation({
    this.type,
    this.coordinates,
  });

  factory LaporanLocation.fromJSON(Map<String, dynamic> json) {
    return LaporanLocation(
      type: json['type'],
      coordinates: json['coordinates'],
    );
  }

  @override
  List<Object> get props => [type, coordinates];
}
