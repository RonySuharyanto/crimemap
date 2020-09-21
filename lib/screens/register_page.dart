import 'package:crimemap/screens/login_page.dart';
import 'package:crimemap/widgets/button.dart';
import 'package:crimemap/widgets/text_input.dart';
import 'package:flutter/material.dart';

class RegisterPage extends StatefulWidget {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController namaController = TextEditingController();
  final TextEditingController nomertelponController = TextEditingController();
  final TextEditingController jeniskelaminController = TextEditingController();
  final TextEditingController alamatController = TextEditingController();
  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        Navigator.pop(
            context, MaterialPageRoute(builder: (context) => LoginPage()));
        return;
      },
      child: Scaffold(
        body: SingleChildScrollView(
          child: SafeArea(
            minimum: EdgeInsets.only(left: 30, right: 30),
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  //foto
                  Container(
                    width: 200,
                    height: 200,
                    decoration: BoxDecoration(
                        border: Border.all(),
                        shape: BoxShape.circle,
                        image: DecorationImage(
                            image: AssetImage('assets/logo_profil.png'))),
                  ),
                  SizedBox(height: 50),
                  //email
                  TextInputForm(
                    keyboardType: TextInputType.text,
                    obscureText: false,
                    hintText: "Masukkan email",
                    controller: widget.namaController,
                  ),
                  SizedBox(height: 20),
                  //password
                  TextInputForm(
                    keyboardType: TextInputType.text,
                    obscureText: false,
                    hintText: "Masukkan password",
                    controller: widget.emailController,
                  ),
                  SizedBox(height: 20),
                  //nama
                  TextInputForm(
                    keyboardType: TextInputType.text,
                    obscureText: false,
                    hintText: "Masukkan nama",
                    controller: widget.passwordController,
                  ),
                  SizedBox(height: 20),
                  //nomer telpon
                  TextInputForm(
                    keyboardType: TextInputType.text,
                    obscureText: false,
                    hintText: "Nomer Telpon",
                    controller: widget.nomertelponController,
                  ),
                  SizedBox(height: 20),
                  //jenis kelamin
                  TextInputForm(
                    keyboardType: TextInputType.text,
                    obscureText: false,
                    hintText: "Jenis Kelamin",
                    controller: widget.jeniskelaminController,
                  ),
                  SizedBox(height: 20),
                  //alamat
                  TextInputForm(
                    keyboardType: TextInputType.text,
                    obscureText: false,
                    hintText: "Alamat",
                    controller: widget.alamatController,
                  ),
                  SizedBox(height: 20),
                  //button register
                  ButtonForm(
                    color: Colors.lightBlue,
                    onPressed: () {},
                    text: 'Daftar',
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
