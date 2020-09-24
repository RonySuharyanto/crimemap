part of 'pengaduan_bloc.dart';

abstract class PengaduanState extends Equatable {
  const PengaduanState();

  @override
  List<Object> get props => [];
}

class PengaduanLoading extends PengaduanState {}

class PengaduanLoaded extends PengaduanState {
  final List<LaporanModel> data;

  const PengaduanLoaded(this.data);

  @override
  List<Object> get props => [data];
}

class PengaduanFailure extends PengaduanState {}
