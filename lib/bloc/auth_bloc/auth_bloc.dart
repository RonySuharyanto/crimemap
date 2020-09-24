import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:crimemap/utils/utils.dart';
import 'package:equatable/equatable.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final Api _api;

  AuthBloc(this._api) : super(AuthInitial());

  @override
  Stream<AuthState> mapEventToState(
    AuthEvent event,
  ) async* {
    if (event is AuthEventStart) {
      final pref = await SharedPreferences.getInstance();
      final token = pref.getString("token");
      if (token == null) {
        yield AuthUnauthenticated();
      }
      this._api.setDefaultAuthHeader(token);
      yield AuthAuthenticated();
    }

    if (event is AuthEventLoggedIn) {
      final pref = await SharedPreferences.getInstance();
      pref.setString("token", event.token);
      _api.setDefaultAuthHeader(event.token);
      yield AuthAuthenticated();
    }

    if (event is AuthEventLoggedOut) {
      final pref = await SharedPreferences.getInstance();
      await pref.remove("token");
      _api.setDefaultAuthHeader("");
    }
  }
}
