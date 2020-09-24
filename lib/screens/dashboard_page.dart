import 'package:crimemap/screens/formlaporan_page.dart';
import 'package:crimemap/screens/riwayatlaporan_page.dart';
import 'package:crimemap/shared/theme.dart';
import 'package:flutter/material.dart';

class DashboardPage extends StatefulWidget {
  @override
  _DashboardPageState createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {
  EdgeInsetsGeometry _margin = EdgeInsets.fromLTRB(20, 10, 20, 10);
  EdgeInsetsGeometry _padding = EdgeInsets.all(30);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          menuCard(
            'Membuat Laporan',
            'assets/laporan.png',
            Colors.teal,
            Colors.amber[100],
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => FormLaporanPage()));
            },
          ),
          menuCard(
            'Riwayat Laporan',
            'assets/riwayat1.png',
            Colors.black,
            Colors.amber[100],
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => RiwayatLaporanPage()));
            },
          ),
        ],
      ),
    );
  }

  menuCard(String text, String image, Color color1, Color color2,
      {Function onTap}) {
    double _height = MediaQuery.of(context).size.height / 4;
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: _margin,
        padding: _padding,
        height: _height,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              spreadRadius: 5,
              blurRadius: 7,
              offset: Offset(0, 3),
            )
          ],
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              text,
              style: blackTextFont.copyWith(
                color: Colors.white,
                fontSize: 24,
              ),
            ),
            Image.asset(
              image,
              height: 90,
            ),
          ],
        ),
      ),
    );
  }
}
