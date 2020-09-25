import 'package:crimemap/bloc/pengaduan_detail_bloc/pengaduan_detail_bloc.dart';
import 'package:crimemap/models/pengaduan_detail_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LaporanDetailPage extends StatefulWidget {
  final String pengaduanId;

  const LaporanDetailPage({
    Key key,
    @required this.pengaduanId,
  }) : super(key: key);

  @override
  _LaporanDetailPageState createState() => _LaporanDetailPageState();
}

class _LaporanDetailPageState extends State<LaporanDetailPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Status Laporan"),
        centerTitle: true,
      ),
      body: BlocBuilder<PengaduanDetailBloc, PengaduanDetailState>(
        builder: (context, state) {
          if (state is PengaduanDetailFailure) {
            return Center(
              child: Text("Ops terjadi kesalahan"),
            );
          }

          if (state is PengaduanDetailLoaded) {
            return _LaporanDetail(data: state.data);
          }

          return Center(
            child: CircularProgressIndicator(),
          );
        },
      ),
    );
  }

  @override
  void initState() {
    fetch();
    super.initState();
  }

  fetch() {
    context
        .bloc<PengaduanDetailBloc>()
        .add(PengaduanDetailEventFetch(widget.pengaduanId));
  }
}

class _LaporanDetail extends StatelessWidget {
  final PengaduanDetailModel data;

  const _LaporanDetail({
    Key key,
    @required this.data,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(data.id),
        Text(data.jumlahKorban.toString()),
        ListView.builder(
          shrinkWrap: true,
          itemCount: data.riwayat.length,
          itemBuilder: (context, index) {
            return Text(data.riwayat[index].status);
          },
        ),
      ],
    );
  }
}
