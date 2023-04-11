import 'package:flutter/material.dart';
import 'package:news/src/widgets/empty_widget.dart';

class TendenciaPage extends StatefulWidget {
  const TendenciaPage({super.key});

  @override
  State<TendenciaPage> createState() => _TendenciaPageState();
}

class _TendenciaPageState extends State<TendenciaPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: EmptyWidget(
          alto: 300,
          ancho: 250,
          text: 'No hay tendencias.',
          ruta: 'assets/json/empty.json',
        ),
      ),
    );
  }
}
