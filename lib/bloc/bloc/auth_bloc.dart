import 'package:bloc/bloc.dart';
import 'package:bloc_flutter_ejemplo_app/data/model/usuario.dart';
import 'package:bloc_flutter_ejemplo_app/global/environmet.dart';
import 'package:meta/meta.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  AuthBloc() : super(AuthState()) {
    on<OnValidarDatosAuth>(_onValidarDatosAuth);
    on<OnValidarUsuarioAuth>(_onValidarUsuarioAuth);
  }

  void _onValidarDatosAuth(OnValidarDatosAuth event, Emitter<AuthState> emit) {
    emit(state.copyWith(isWorking: true));

    String error = '';
    if (event.mail.length < 10) {
      error = 'Mail invalido';
    }
    if (error == '' && event.password.length < 8) {
      error = 'Password debe ser mayor 8 caracteres';
    }

    emit(state.copyWith(
        isWorking: false,
        accion: Environmet.onnValidarDatosAuth,
        mail: (error == '') ? event.mail : null,
        password: (error == '') ? event.password : null,
        datosOk: (error == ''),
        error: error));
  }

  void _onValidarUsuarioAuth(
      OnValidarUsuarioAuth event, Emitter<AuthState> emit) {
    emit(state.copyWith(logeadoOk: true));
  }
}
