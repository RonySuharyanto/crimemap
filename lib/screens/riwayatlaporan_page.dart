import 'package:crimemap/models/laporan_model.dart';
import 'package:crimemap/shared/sizeconfig.dart';
import 'package:crimemap/shared/theme.dart';
import 'package:crimemap/widgets/riwayatlaporan_card.dart';
import 'package:flutter/material.dart';

class RiwayatLaporanPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SizeTheme().init(context);
    return Scaffold(
      backgroundColor: Colors.lightBlue,
      appBar: AppBar(title: Text('Riwayat Laporan')),
      body: Container(
        width: SizeTheme.screenWidth,
        height: SizeTheme.screenHeight,
        color: whiteColor,
        child: Column(
          children: listRiwayatLaporan
              .map((e) => Container(
                  margin: EdgeInsets.all(5), child: RiwayatLaporanCard(e)))
              .toList(),
        ),
      ),
    );
  }
}
