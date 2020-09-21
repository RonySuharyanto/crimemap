import 'package:crimemap/widgets/profile_heading.dart';
import 'package:crimemap/widgets/profile_list.dart';
import 'package:flutter/material.dart';

class AkunPage extends StatefulWidget {
  @override
  _AkunPageState createState() => _AkunPageState();
}

class _AkunPageState extends State<AkunPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
      children: [
        //background
        Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          padding: EdgeInsets.only(top: 350.0),
          color: Colors.white,
          child: ProfileList(
            icon1: Icons.supervisor_account,
            text1: 'Renakta',
            icon2: Icons.local_phone,
            text2: '08567080999',
            icon3: Icons.wc,
            text3: 'laki-laki',
            icon4: Icons.home,
            text4: 'jl.kesasar buntu',
            icon5: Icons.check,
            text5: 'Simpan',
          ),
        ),
        //heading
        Container(
            height: 200.0,
            width: MediaQuery.of(context).size.width,
            color: Colors.blue),
        //profileheading
        ProfileHeading(
            image: AssetImage('assets/kipli.png'), nama: '', email: ''),
      ],
    ));
  }
}
