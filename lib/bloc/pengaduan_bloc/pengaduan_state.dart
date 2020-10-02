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

class PengaduanLoadedbyId extends PengaduanState{
  final String id;

  PengaduanLoadedbyId(this.id);

  @override
  List<Object> get props => [id];
}

class PengaduanFailure extends PengaduanState {}
