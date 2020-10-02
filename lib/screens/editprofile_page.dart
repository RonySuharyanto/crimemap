import 'package:crimemap/widgets/button.dart';
import 'package:crimemap/widgets/text_input.dart';
import 'package:flutter/material.dart';

class EditProfilePage extends StatefulWidget {
  @override
  _EditProfilePageState createState() => _EditProfilePageState();
}

class _EditProfilePageState extends State<EditProfilePage> {
  final _namaController = TextEditingController(text: 'ahok');
  final _noTelpController = TextEditingController(text: 'iva@email.com');
  final _alamatController = TextEditingController(text: 'danau sunter agung');
  final height = SizedBox(height: 20);

  @override
  void dispose() {
    _namaController.dispose();
    _noTelpController.dispose();
    _alamatController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Edit Profile'),
      ),
      body: SafeArea(
        minimum: EdgeInsets.symmetric(horizontal: 30.0),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              TextInputForm(
                controller: _namaController,
                hintText: 'Masukkan Nama Anda',
                keyboardType: TextInputType.text,
                prefixIcon: Icon(Icons.portrait),
                obscureText: false,
              ),
              height,
              TextInputForm(
                controller: _noTelpController,
                hintText: 'Masukkan NoTelp Anda',
                keyboardType: TextInputType.number,
                prefixIcon: Icon(Icons.portrait),
                obscureText: false,
              ),
              height,
              TextInputForm(
                controller: _alamatController,
                hintText: 'Masukkan Alamat Anda',
                keyboardType: TextInputType.text,
                prefixIcon: Icon(Icons.portrait),
                obscureText: false,
              ),
              SizedBox(height: 50),
              ButtonForm(
                color: Colors.lightBlue,
                onPressed: () {},
                text: 'SIMPAN',
              ),
            ],
          ),
        ),
      ),
    );
  }
}
