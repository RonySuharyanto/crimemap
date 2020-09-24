import 'package:crimemap/bloc/pengaduan_bloc/pengaduan_bloc.dart';
import 'package:crimemap/bloc/pengaduan_detail_bloc/pengaduan_detail_bloc.dart';
import 'package:crimemap/screens/main_page.dart';
import 'package:crimemap/services/laporan_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'bloc/auth_bloc/auth_bloc.dart';
import 'screens/main_page.dart';
import 'utils/utils.dart';

void main() {
  runApp(MyApp());
}

final api = Api();

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<AuthBloc>(
          create: (_) => AuthBloc(api)..add(AuthEventStart()),
          lazy: false,
        ),
        BlocProvider<PengaduanBloc>(
          create: (_) => PengaduanBloc(LaporanService(api)),
        ),
        BlocProvider<PengaduanDetailBloc>(
          create: (_) => PengaduanDetailBloc(LaporanService(api)),
        ),
      ],
      child: MaterialApp(
        home: MainPage(),
      ),
    );
  }
}
