part of 'pengaduan_detail_bloc.dart';

abstract class PengaduanDetailState extends Equatable {
  const PengaduanDetailState();

  @override
  List<Object> get props => [];
}

class PengaduanDetailLoading extends PengaduanDetailState {}

class PengaduanDetailFailure extends PengaduanDetailState {}

class PengaduanDetailLoaded extends PengaduanDetailState {
  final PengaduanDetailModel data;

  const PengaduanDetailLoaded(this.data);

  @override
  List<Object> get props => [data];
}
