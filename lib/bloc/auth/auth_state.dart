part of 'auth_bloc.dart';

@immutable
class AuthState {
  final bool isWorking;
  final String accion;
  final String mail;
  final String password;
  final bool datosOk;
  final bool logeadoOk;
  final UsuarioModel usuario;
  final String error;

  AuthState({
    this.isWorking = false,
    this.accion = '',
    this.mail = '',
    this.password = '',
    this.datosOk = false,
    this.logeadoOk = false,
    UsuarioModel? usuario,
    this.error = '',
  }) : usuario = usuario ?? UsuarioModel();

  AuthState copyWith({
    bool? isWorking,
    String? accion,
    String? mail,
    String? password,
    bool? datosOk,
    bool? logeadoOk,
    UsuarioModel? usuario,
    String? error,
  }) =>
      AuthState(
          isWorking: isWorking ?? this.isWorking,
          accion: accion ?? this.accion,
          mail: mail ?? this.mail,
          password: password ?? this.password,
          logeadoOk: logeadoOk ?? this.logeadoOk,
          datosOk: datosOk ?? this.datosOk,
          usuario: usuario ?? this.usuario,
          error: error ?? this.error);

  AuthState initState() => AuthState();
}
