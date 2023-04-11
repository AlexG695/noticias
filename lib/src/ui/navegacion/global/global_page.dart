import 'package:flutter/material.dart';
import 'package:news/src/widgets/empty_widget.dart';

class GlobalPage extends StatefulWidget {
  const GlobalPage({super.key});

  @override
  State<GlobalPage> createState() => _GlobalPageState();
}

class _GlobalPageState extends State<GlobalPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: EmptyWidget(
            alto: 250,
            ancho: 250,
            text: 'No hay noticias globales',
            ruta: 'assets/json/global.json'),
      ),
    );
  }
}
