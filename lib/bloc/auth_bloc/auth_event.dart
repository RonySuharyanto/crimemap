part of 'auth_bloc.dart';

abstract class AuthEvent extends Equatable {
  const AuthEvent();

  @override
  List<Object> get props => [];
}

class AuthEventStart extends AuthEvent {}

class AuthEventLoggedIn extends AuthEvent {
  const AuthEventLoggedIn(this.token);

  final String token;

  @override
  List<Object> get props => [token];
}

class AuthEventLoggedOut extends AuthEvent {}
