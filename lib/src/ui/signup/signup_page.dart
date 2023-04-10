import 'package:flutter/material.dart';

class SignUpPage extends StatelessWidget {
  const SignUpPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 2.0,
        leading: const Icon(Icons.close),
        title: const Text('Registro'),
        actions: [TextButton(onPressed: () {}, child: const Text('Continuar'))],
      ),
    );
  }
}
