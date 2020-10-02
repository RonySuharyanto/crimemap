import 'package:crimemap/models/laporan_model.dart';
import 'package:crimemap/shared/sizeconfig.dart';
import 'package:crimemap/shared/theme.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../models/laporan_model.dart';

class RiwayatLaporanCard extends StatelessWidget {
  final LaporanModel laporan;

  RiwayatLaporanCard(this.laporan);

  @override
  Widget build(BuildContext context) {
    print(laporan.jenisKejahatan.jenis);
    return Card(
      elevation: 2,
      child: Container(
        padding: EdgeInsets.all(10),
        width: SizeTheme.screenWidth,
        height: 100,
        child: Row(
          children: [
            (laporan.jenisKejahatan.jenis.toLowerCase() == 'Curanmor')
                ? Image.asset('assets/curanmor.png', height: 100)
                : (laporan.jenisKejahatan.jenis.toLowerCase() == 'tawuran')
                    ? Image.asset('assets/tawuran.png', height: 100)
                    : (laporan.jenisKejahatan.jenis.toLowerCase() == 'curas')
                        ? Image.asset('assets/curas.png', height: 100)
                        : (laporan.jenisKejahatan.jenis.toLowerCase() ==
                                'Curat')
                            ? Image.asset('assets/curat.png', height: 100)
                            : Image.asset('assets/begal.png', height: 100),
            SizedBox(width: 25),
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Jumlah Korban: ${laporan.jumlahKorban} orang',
                  style: blackTextFont.copyWith(fontSize: 20),
                ),
                Text(
                  'Tanggal Laporan ${dateFormat(laporan.tanggalDibuat)}',
                  style: blackTextFont.copyWith(fontSize: 12),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  String dateFormat(String date){
    return DateFormat('dd-MMMM-yyyy').format(DateTime.parse(date));
  }
}
