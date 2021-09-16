import 'package:bloc_flutter_ejemplo_app/bloc/auth/auth_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final edtmail = TextEditingController();
  final edtpass = TextEditingController();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Ejemplo')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: TextFormField(
                onChanged: (_) => _validar(context),
                decoration: const InputDecoration(hintText: 'test@test.com'),
                controller: edtmail,
              ),
            ),
            const SizedBox(height: 10),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: TextFormField(
                onChanged: (_) => _validar(context),
                obscureText: true,
                decoration:
                    const InputDecoration(hintText: 'Ingrese al Contraseña'),
                controller: edtpass,
              ),
            ),
            const SizedBox(height: 20),
            BlocConsumer<AuthBloc, AuthState>(
              listener: (_, state) {
                if (state.logeadoOk) {
                  Navigator.popAndPushNamed(context, 'page');
                }
              },
              buildWhen: (previous, current) => (current.accion == 'validar'),
              builder: (_, state) {
                return MaterialButton(
                    color: Colors.black87,
                    child: const Text(
                      'Ingresar ...',
                      style: TextStyle(color: Colors.white),
                    ),
                    onPressed: (state.datosOk)
                        ? () {
                            context
                                .read<AuthBloc>()
                                .add(OnValidarUsuarioAuth());
                            // if (state.logeadoOk) {
                            //   Navigator.popAndPushNamed(context, 'page');
                            // }
                          }
                        : null);
              },
            ),
            const SizedBox(height: 20),
            BlocBuilder<AuthBloc, AuthState>(
              builder: (_, state) {
                return Text('mail : ${state.mail}');
              },
            ),
          ],
        ),
      ),
    );
  }

  void _validar(BuildContext context) {
    // final authBloc = BlocProvider.of<AuthBloc>(context);
    // authBloc.add(OnValidarDatosAuth(edtmail.text, edtpass.text));
    //
    context
        .read<AuthBloc>()
        .add(OnValidarDatosAuth(edtmail.text, edtpass.text));
  }
}
