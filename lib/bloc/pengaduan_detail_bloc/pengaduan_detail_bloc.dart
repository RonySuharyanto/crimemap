import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:crimemap/models/pengaduan_detail_model.dart';
import 'package:crimemap/services/laporan_service.dart';
import 'package:equatable/equatable.dart';

part 'pengaduan_detail_event.dart';
part 'pengaduan_detail_state.dart';

class PengaduanDetailBloc
    extends Bloc<PengaduanDetailEvent, PengaduanDetailState> {
  final LaporanService _laporanService;

  PengaduanDetailBloc(this._laporanService) : super(PengaduanDetailLoading());

  @override
  Stream<PengaduanDetailState> mapEventToState(
    PengaduanDetailEvent event,
  ) async* {
    if (event is PengaduanDetailEventFetch) {
      try {
        final data = await this._laporanService.getPengaduanById(event.id);
        yield PengaduanDetailLoaded(data);
      } catch (err) {
        yield PengaduanDetailFailure();
      }
    }
  }
}
