import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';

import '../login/login_page.dart';
import '../signup/signup_page.dart';

class Welcome extends StatefulWidget {
  const Welcome({super.key});

  @override
  State<Welcome> createState() => _WelcomeState();
}

class _WelcomeState extends State<Welcome> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Lottie.asset('assets/json/news.json'),
          const SizedBox(height: 35),
          Text(
            textAlign: TextAlign.center,
            'Enterate de lo que sucede en el mundo',
            style:
                GoogleFonts.poppins(fontWeight: FontWeight.bold, fontSize: 22),
          ),
          const SizedBox(height: 35),
          Container(
              width: double.infinity,
              margin: const EdgeInsets.symmetric(horizontal: 25),
              child: ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const LoginPage()));
                  },
                  child: Text(
                    'Iniciar',
                    style:
                        GoogleFonts.poppins(color: Colors.black, fontSize: 16),
                  ))),
          const SizedBox(
            height: 15,
          ),
          Container(
              width: double.infinity,
              margin: const EdgeInsets.symmetric(horizontal: 25),
              child: OutlinedButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const SignUpPage()));
                  },
                  child: Text(
                    'Registrarme',
                    style:
                        GoogleFonts.poppins(color: Colors.black, fontSize: 16),
                  )))
        ],
      ),
    );
  }
}
