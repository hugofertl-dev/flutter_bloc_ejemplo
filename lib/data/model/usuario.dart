// To parse this JSON data, do
//
//     final usuarioModel = usuarioModelFromJson(jsonString);

import 'dart:convert';

UsuarioModel usuarioModelFromJson(String str) =>
    UsuarioModel.fromJson(json.decode(str));

String usuarioModelToJson(UsuarioModel data) => json.encode(data.toJson());

class UsuarioModel {
  UsuarioModel({
    this.mail = '',
    this.password = '',
    this.nombre = '',
    this.direccion = '',
  });

  String mail;
  String password;
  String nombre;
  String direccion;

  factory UsuarioModel.fromJson(Map<String, dynamic> json) => UsuarioModel(
        mail: json["mail"] ?? '',
        password: json["password"] ?? '',
        nombre: json["nombre"] ?? '',
        direccion: json["direccion"] ?? '',
      );

  Map<String, dynamic> toJson() => {
        "mail": mail,
        "password": password,
        "nombre": nombre,
        "direccion": direccion,
      };
}
