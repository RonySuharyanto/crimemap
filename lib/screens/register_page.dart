import 'package:crimemap/screens/login_page.dart';
import 'package:crimemap/services/auth_service.dart';
import 'package:crimemap/shared/theme.dart';
import 'package:crimemap/utils/utils.dart';
import 'package:crimemap/widgets/button.dart';
import 'package:crimemap/widgets/text_input.dart';
import 'package:dio/dio.dart';
import 'package:flushbar/flushbar_helper.dart';
import 'package:flutter/material.dart';

class RegisterPage extends StatefulWidget {
  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController namaController = TextEditingController();
  final TextEditingController nomertelponController = TextEditingController();
  final TextEditingController jeniskelaminController = TextEditingController();
  final TextEditingController alamatController = TextEditingController();

  var isLoading = false;

  String jenkelVal;
  int jenkelType = 0;
  

  void _handleJenkelType(int value) {
    setState(() {
      jenkelType = value;
      switch (jenkelType) {
        case 1:
          jenkelVal = 'Laki-Laki';
          break;
        case 2:
          jenkelVal = 'Perempuan';
          break;
      }
    });
  }


  setIsLoading(bool value) {
    setState(() {
      isLoading = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    print(jenkelVal);
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
                  SizedBox(height: 50),
                  TextInputForm(
                    keyboardType: TextInputType.text,
                    obscureText: false,
                    hintText: "Masukkan email",
                    controller: emailController,
                  ),
                  SizedBox(height: 20),
                  //password
                  TextInputForm(
                    keyboardType: TextInputType.text,
                    obscureText: true,
                    hintText: "Masukkan password",
                    controller: passwordController,
                  ),
                  SizedBox(height: 20),
                  //nama
                  TextInputForm(
                    keyboardType: TextInputType.text,
                    obscureText: false,
                    hintText: "Masukkan nama",
                    controller: namaController,
                  ),
                  SizedBox(height: 20),
                  //nama
                  TextInputForm(
                    keyboardType: TextInputType.text,
                    obscureText: false,
                    hintText: "Masukkan nomor telpon",
                    controller: nomertelponController,
                  ),
                  SizedBox(height: 20),
                  //nama
                  TextInputForm(
                    keyboardType: TextInputType.text,
                    obscureText: false,
                    hintText: "Masukkan alamat",
                    controller: alamatController,
                  ),
                  SizedBox(height: 20),
                
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                        Text(
                    
                    'Jenis Kelamin',
                    style: blackTextFont,
                  ),
                      Row(children: <Widget>[
                        
                        Radio(value: 1,
                        groupValue: jenkelType,
                        onChanged: _handleJenkelType,
                        activeColor: Colors.lightBlue,
                        ),
                        Text(
                          'Laki - Laki',
                          style: blackTextFont,
                        ),
                        SizedBox(width: 30.0),
                              //
                              Radio(
                                  value: 2,
                                  groupValue: jenkelType,
                                  onChanged: _handleJenkelType,
                                  activeColor: Colors.lightBlue),
                              Text(
                                'Perempuan',
                                style: blackTextFont,
                              ),
                      ],),
                    ],
                  ),
                  SizedBox(height: 20),
                  //button register
                  ButtonForm(
                    color: Colors.lightBlue,
                    onPressed: onSubmit,
                    text: isLoading ? 'Daftar...' : 'Daftar',
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  onSubmit() async {
    try {
      setIsLoading(true);
      final authService = AuthService(api: Api());
      await authService.register(
        email: emailController.text,
        password: passwordController.text,
        nama: namaController.text,
        alamat: alamatController.text,
        noTelp: nomertelponController.text,
        jenisKelamin: jenkelVal,
      );
      Navigator.of(context).pop();
    } on DioError catch (err) {
      print(err.message);
      setIsLoading(false);
      FlushbarHelper.createError(message: "Registrasi gagal")..show(context);
    }
  }
}
