import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:bloc_flutter_ejemplo_app/data/model/usuario.dart';
import 'package:bloc_flutter_ejemplo_app/global/environmet.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  AuthBloc() : super(AuthState());

  @override
  Stream<AuthState> mapEventToState(
    AuthEvent event,
  ) async* {
    if (event is OnValidarDatosAuth) {
      yield* _onValidarDatosAuth(event);
    }
    if (event is OnValidarUsuarioAuth) {
      yield state.copyWith(logeadoOk: true);
    }
  }

  Stream<AuthState> _onValidarDatosAuth(OnValidarDatosAuth event) async* {
    String error = '';
    if (event.mail.length < 10) {
      error = 'Mail invalido';
    }
    if (error == '' && event.password.length < 8) {
      error = 'Password debe ser mayor 8 caracteres';
    }

    yield state.copyWith(
        accion: Environmet.onnValidarDatosAuth,
        mail: (error == '') ? event.mail : null,
        password: (error == '') ? event.password : null,
        datosOk: (error == ''),
        error: error);
  }
}
