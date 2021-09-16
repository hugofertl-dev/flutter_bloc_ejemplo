import 'package:bloc_flutter_ejemplo_app/bloc/auth/auth_bloc.dart';
import 'package:bloc_flutter_ejemplo_app/pages/home.dart';
import 'package:bloc_flutter_ejemplo_app/pages/pageprincipal.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (_) => AuthBloc(),
        ),
      ],
      child: MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Material App',
          initialRoute: 'home',
          routes: {
            'home': (_) => const HomePage(),
            'page': (_) => const PagePrincipal(),
          }),
    );
  }
}
