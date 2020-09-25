import 'package:bloc/bloc.dart';
import 'package:crimemap/services/auth_service.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

part 'profile_state.dart';

class ProfileCubit extends Cubit<ProfileState> {
  final AuthService _authService;

  ProfileCubit(this._authService) : super(ProfileLoading());

  fetch() async {
    emit(ProfileLoading());
    try {
      final data = await _authService.profile();
      emit(ProfileLoaded(data));
    } catch (e) {
      print(e);
      emit(ProfileFailure());
    }
  }
}
