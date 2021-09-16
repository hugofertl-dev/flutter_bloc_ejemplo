import 'package:flutter/material.dart';

class PagePrincipal extends StatelessWidget {
  const PagePrincipal({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Page 1')),
      body: const Center(
        child: Text('Pagina 1'),
      ),
    );
  }
}
