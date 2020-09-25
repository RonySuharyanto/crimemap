import 'package:crimemap/bloc/pengaduan_bloc/pengaduan_bloc.dart';
import 'package:crimemap/screens/laporan_detail_page.dart';
import 'package:crimemap/shared/sizeconfig.dart';
import 'package:crimemap/shared/theme.dart';
import 'package:crimemap/widgets/riwayatlaporan_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RiwayatLaporanPage extends StatefulWidget {
  @override
  _RiwayatLaporanPageState createState() => _RiwayatLaporanPageState();
}

class _RiwayatLaporanPageState extends State<RiwayatLaporanPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.lightBlue,
      appBar: AppBar(title: Text('Riwayat Laporan')),
      body: Container(
        width: SizeTheme.screenWidth,
        height: SizeTheme.screenHeight,
        color: whiteColor,
        child: BlocBuilder<PengaduanBloc, PengaduanState>(
          builder: (context, state) {
            if (state is PengaduanFailure) {
              return Center(
                child: Text("Oops terjadi kesalahan"),
              );
            }

            if (state is PengaduanLoaded) {
              return ListView.builder(
                itemCount: state.data.length,
                itemBuilder: (context, index) {
                  return InkWell(
                    onTap: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => LaporanDetailPage(
                            pengaduanId: state.data[index].id),
                      ),
                    ),
                    child: RiwayatLaporanCard(state.data[index]),
                  );
                },
              );
            }

            return Center(
              child: CircularProgressIndicator(),
            );
          },
        ),
      ),
    );
  }

  @override
  void initState() {
    fetch();
    super.initState();
  }

  void fetch() {
    context.bloc<PengaduanBloc>()..add(PengaduanEventFetch());
  }
}
