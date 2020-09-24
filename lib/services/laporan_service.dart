import 'package:crimemap/models/pengaduan_detail_model.dart';
import 'package:crimemap/utils/utils.dart';

import '../models/laporan_model.dart';

class LaporanService {
  final Api _api;

  const LaporanService(this._api);

  Future<List<LaporanModel>> getListPengaduan() async {
    final res = await _api.dio.get('/api/masyarakat/pengaduan');
    final data = res.data;
    final List<LaporanModel> listLaporan = [];
    (data as List).forEach((element) {
      listLaporan.add(LaporanModel.fromJSON(element));
    });
    return listLaporan;
  }

  Future<PengaduanDetailModel> getPengaduanById(String id) async {
    final res = await _api.dio.get('/api/pengaduan/$id');
    return PengaduanDetailModel.fromJSON(res.data);
  }
}
