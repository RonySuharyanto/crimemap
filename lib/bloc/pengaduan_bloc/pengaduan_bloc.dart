import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:crimemap/services/laporan_service.dart';
import 'package:equatable/equatable.dart';

import '../../models/laporan_model.dart';

part 'pengaduan_event.dart';
part 'pengaduan_state.dart';

class PengaduanBloc extends Bloc<PengaduanEvent, PengaduanState> {
  final LaporanService _laporanService;

  PengaduanBloc(this._laporanService) : super(PengaduanLoading());

  @override
  Stream<PengaduanState> mapEventToState(
    PengaduanEvent event,
  ) async* {
    if (event is PengaduanEventFetch) {
      try {
        yield PengaduanLoading();
        final data = await _laporanService.getListPengaduan();
        yield PengaduanLoaded(data);
      } catch (err) {
        print(err);
        yield PengaduanFailure();
      }
    }
  }
}
