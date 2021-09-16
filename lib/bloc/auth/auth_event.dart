part of 'auth_bloc.dart';

@immutable
abstract class AuthEvent {}

class OnValidarDatosAuth extends AuthEvent {
  final String mail;
  final String password;

  OnValidarDatosAuth(this.mail, this.password);
}

class OnValidarUsuarioAuth extends AuthEvent {
  OnValidarUsuarioAuth();
}
