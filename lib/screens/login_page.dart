import 'package:crimemap/bloc/auth_bloc/auth_bloc.dart';
import 'package:crimemap/screens/home_page.dart';
import 'package:crimemap/screens/register_page.dart';
import 'package:crimemap/services/auth_service.dart';
import 'package:crimemap/shared/theme.dart';
import 'package:crimemap/utils/utils.dart';
import 'package:crimemap/widgets/button.dart';
import 'package:crimemap/widgets/notify.dart';
import 'package:crimemap/widgets/text_input.dart';
import 'package:dio/dio.dart';
import 'package:flushbar/flushbar_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginPage extends StatefulWidget {
  static final routName = '/login';

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  var isLoading = false;

  setIsLoading(bool value) {
    setState(() {
      isLoading = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        minimum: EdgeInsets.only(left: 30, right: 30),
        child: SingleChildScrollView(
          child: Center(
            child: BlocConsumer<AuthBloc, AuthState>(
              listener: (context, state) {
                if (state is AuthAuthenticated) {
                  Navigator.pushReplacement(context,
                      MaterialPageRoute(builder: (context) => HomePage()));
                }
              },
              builder: (context, state) => Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  //logo
                  Container(
                    width: 300,
                    height: 300,
                    decoration: BoxDecoration(
                      boxShadow: [
                        BoxShadow(
                          color: Colors.white24.withOpacity(0.5),
                          spreadRadius: 5,
                          blurRadius: 7,
                          offset: Offset(50, 100), // changes position of shadow
                        ),
                      ],
                      shape: BoxShape.circle,
                      image: DecorationImage(
                        image: AssetImage('assets/logo_crime mapping.png'),
                        fit: BoxFit.contain,
                      ),
                    ),
                  ),
                  SizedBox(height: 30),
                  //textinputemail
                  TextInputForm(
                    controller: _emailController,
                    hintText: 'Masukkan Email Anda',
                    obscureText: false,
                    keyboardType: TextInputType.emailAddress,
                  ),
                  SizedBox(height: 30),
                  //textinputpassword
                  TextInputForm(
                    controller: _passwordController,
                    hintText: 'Masukkan Password',
                    obscureText: true,
                    keyboardType: TextInputType.text,
                  ),
                  SizedBox(height: 30),
                  //textbelumpunyaakun
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text('Belum punya akun? ', style: blackTextFont),
                      InkWell(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => RegisterPage()));
                        },
                        child: Text(
                          'Register.',
                          style: blueTextFont,
                        ),
                      )
                    ],
                  ),
                  SizedBox(height: 30),
                  //buttonlogin
                  ButtonForm(
                    color: Colors.lightBlue,
                    onPressed: () {
                      if (isLoading) {
                        return;
                      }
                      handleOnSubmitLogin();
                    },
                    text: isLoading ? 'Login...' : 'Login',
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  //
  handleOnSubmitLogin() {
    if (!(_emailController.text != '' && _passwordController.text != ' ')) {
      return showFlushBar(context, 'Email dan Password harus diisi');
    } else if (!(_passwordController.text.length >= 6)) {
      return showFlushBar(context, 'Password Harus Lebih dari 6 kata');
    } else {
      onSubmit();
    }
  }

  onSubmit() async {
    try {
      setIsLoading(true);
      final authService = AuthService(api: Api());
      final token = await authService.login(
        email: _emailController.text,
        password: _passwordController.text,
      );
      context.bloc<AuthBloc>().add(AuthEventLoggedIn(token));
    } on DioError catch (err) {
      setIsLoading(false);
      print(err.message);
      FlushbarHelper.createError(message: "Login gagal")..show(context);
    }
  }
}
