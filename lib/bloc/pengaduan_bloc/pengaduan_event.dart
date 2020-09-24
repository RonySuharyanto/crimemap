part of 'pengaduan_bloc.dart';

abstract class PengaduanEvent extends Equatable {
  const PengaduanEvent();

  @override
  List<Object> get props => [];
}

class PengeduanEventFetch extends PengaduanEvent {}
