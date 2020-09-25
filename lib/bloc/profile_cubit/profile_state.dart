part of 'profile_cubit.dart';

abstract class ProfileState extends Equatable {
  const ProfileState();

  @override
  List<Object> get props => [];
}

class ProfileLoading extends ProfileState {}

class ProfileFailure extends ProfileState {}

class ProfileLoaded extends ProfileState {
  final Profile data;

  const ProfileLoaded(this.data);

  @override
  List<Object> get props => [data];
}

class Profile extends Equatable {
  final String id;
  final String email;
  final String nama;
  final String noTelp;
  final String jenisKelamin;
  final String fotoProfile;
  final String alamat;

  const Profile({
    @required this.id,
    @required this.email,
    @required this.nama,
    @required this.noTelp,
    @required this.jenisKelamin,
    @required this.fotoProfile,
    @required this.alamat,
  });

  factory Profile.fromJSON(Map<String, dynamic> json) {
    return Profile(
      id: json['_id'],
      email: json['email'],
      nama: json['nama'],
      noTelp: json['no_telp'],
      jenisKelamin: json['jenis_kelamin'],
      fotoProfile: json['foto_profile'],
      alamat: json['alamat'],
    );
  }

  @override
  List<Object> get props => [
        id,
        email,
        nama,
        noTelp,
        jenisKelamin,
        fotoProfile,
        alamat,
      ];
}
