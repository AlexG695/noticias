import 'package:flutter/material.dart';
import 'package:news/src/widgets/empty_widget.dart';

class ParaTiPage extends StatefulWidget {
  const ParaTiPage({super.key});

  @override
  State<ParaTiPage> createState() => _ParaTiPageState();
}

class _ParaTiPageState extends State<ParaTiPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: EmptyWidget(
            alto: 250,
            ancho: 250,
            text: 'No hay recomendaciones para ti',
            ruta: 'assets/json/for_you.json'),
      ),
    );
  }
}
