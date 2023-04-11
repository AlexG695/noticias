import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';

class EmptyWidget extends StatelessWidget {
  String text;
  String ruta;
  double? alto;
  double? ancho;
  EmptyWidget(
      {Key? key,
      required this.text,
      required this.ruta,
      required ancho,
      required alto})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Lottie.asset(ruta, width: ancho, height: alto, fit: BoxFit.fill),
            Text(
              text,
              style:
                  GoogleFonts.roboto(fontSize: 15, fontWeight: FontWeight.bold),
            )
          ],
        ),
      ),
    );
  }
}
