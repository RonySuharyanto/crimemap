part of 'pengaduan_detail_bloc.dart';

abstract class PengaduanDetailEvent extends Equatable {
  const PengaduanDetailEvent();

  @override
  List<Object> get props => [];
}

class PengaduanDetailEventFetch extends PengaduanDetailEvent {
  final String id;

  const PengaduanDetailEventFetch(this.id);

  @override
  List<Object> get props => [id];
}
