import 'package:dio/dio.dart';

class Api {
  final dio = Dio(BaseOptions(
    baseUrl: "http://192.168.43.5:3000",
  ));

  void removeDefaultAuthHeader() {
    dio.options.headers = {
      'Authorization': '',
    };
  }

  void setDefaultAuthHeader(String jwt) {
    dio.options.headers = {
      'Authorization': 'Bearer ' + jwt,
    };
  }
}
