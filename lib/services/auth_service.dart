import 'package:crimemap/bloc/profile_cubit/profile_cubit.dart';
import 'package:crimemap/utils/utils.dart';
import 'package:flutter/foundation.dart';

class AuthService {
  final Api api;

  const AuthService({
    @required this.api,
  });

  Future<String> login({
    @required String email,
    @required String password,
  }) async {
    final res = await this.api.dio.post('/api/masyarakat/login', data: {
      'email': email,
      'password': password,
    });
    return res.data['accessToken'];
  }

  Future<void> register({
    @required String email,
    @required String password,
    @required String nama,
    @required String alamat,
    @required String noTelp,
    @required String jenisKelamin,
  }) async {
    await api.dio.post('/api/masyarakat/register', data: {
      'email': email,
      'password': password,
      'nama': nama,
      'alamat': alamat,
      'no_telp': noTelp,
      'jenis_kelamin': jenisKelamin,
    });
  }

  Future<Profile> profile() async {
    final res = await api.dio.get('/api/masyarakat/profile');
    return Profile.fromJSON(res.data);
  }
}
