import 'package:crimemap/models/laporan_model.dart';
import 'package:crimemap/shared/sizeconfig.dart';
import 'package:crimemap/shared/theme.dart';
import 'package:flutter/material.dart';

class RiwayatLaporanCard extends StatelessWidget {
  final Laporan laporan;

  RiwayatLaporanCard(this.laporan);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2,
      child: Container(
        padding: EdgeInsets.all(10),
        width: SizeTheme.screenWidth,
        height: 100,
        child: Row(
          children: [
            (laporan.kejahatan == 'Curanmor')
                ? Image.asset('assets/curanmor.png', height: 100)
                : (laporan.kejahatan == 'Tawuran')
                    ? Image.asset('assets/tawuran.png', height: 100)
                    : (laporan.kejahatan == 'Curas')
                        ? Image.asset('assets/curas.png', height: 100)
                        : (laporan.kejahatan == 'Curat')
                            ? Image.asset('assets/curat.png', height: 100)
                            : Image.asset('assets/begal.png', height: 100),
            SizedBox(width: 25),
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Jumlah Korban: ${laporan.jumlahKorban.toString()} orang',
                  style: blackTextFont.copyWith(fontSize: 20),
                ),
                Text(
                  'Tanggal Laporan ${laporan.tanggalDibuat}',
                  style: blackTextFont.copyWith(fontSize: 20),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
