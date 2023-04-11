import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:news/src/ui/navegacion/navegacion.dart';
import 'package:news/src/ui/signup/signup_page.dart';

import '../../utils/fire_auth.dart';
import '../../utils/validator.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>();

  final _emailTextController = TextEditingController();
  final _passwordTextController = TextEditingController();

  bool _isProcessing = false;

  bool _isHiden = true;

  void _tooglePasswordView() {
    setState(() {
      _isHiden = !_isHiden;
    });
  }

  Future<FirebaseApp> _initializeFirebase() async {
    FirebaseApp firebaseApp = await Firebase.initializeApp();

    User? user = FirebaseAuth.instance.currentUser;

    if (user != null) {
      Navigator.of(context).pushAndRemoveUntil(
        MaterialPageRoute(
          builder: (context) => Navegacion(user: user),
        ),
        ModalRoute.withName('/'),
      );
    }

    return firebaseApp;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Inicio de sesión'),
      ),
      body: FutureBuilder(
        future: _initializeFirebase(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            return Padding(
              padding: const EdgeInsets.only(left: 24.0, right: 24.0),
              child: Column(
                children: [
                  const Padding(padding: EdgeInsets.only(bottom: 24.0)),
                  Text('Ingresa tus credenciales para continuar',
                      style: GoogleFonts.poppins(
                          fontWeight: FontWeight.bold, fontSize: 18)),
                  const SizedBox(
                    height: 35,
                  ),
                  Form(
                    key: _formKey,
                    child: Column(
                      children: <Widget>[
                        TextFormField(
                          controller: _emailTextController,
                          //focusNode: _focusEmail,
                          validator: (value) => Validator.validateEmail(
                            email: value,
                          ),
                          decoration: const InputDecoration(
                            filled: true,
                            border: OutlineInputBorder(),
                            labelText: "Correo",
                          ),
                        ),
                        const SizedBox(height: 8.0),
                        TextFormField(
                          controller: _passwordTextController,
                          obscureText: _isHiden,
                          validator: (value) => Validator.validatePassword(
                            password: value,
                          ),
                          decoration: InputDecoration(
                              filled: true,
                              border: const OutlineInputBorder(),
                              labelText: "Contraseña",
                              suffixIcon: InkWell(
                                onTap: _tooglePasswordView,
                                child: Icon(_isHiden
                                    ? Icons.visibility_outlined
                                    : Icons.visibility_off_outlined),
                              )),
                        ),
                        const SizedBox(height: 24.0),
                        _isProcessing
                            ? const CircularProgressIndicator()
                            : Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Expanded(
                                    child: ElevatedButton(
                                      onPressed: () async {
                                        /*  _focusEmail.unfocus();
                                        _focusPassword.unfocus(); */

                                        if (_formKey.currentState!.validate()) {
                                          setState(() {
                                            _isProcessing = true;
                                          });

                                          User? user = await FireAuth
                                              .signInUsingEmailPassword(
                                            email: _emailTextController.text,
                                            password:
                                                _passwordTextController.text,
                                          );

                                          setState(() {
                                            _isProcessing = false;
                                          });

                                          if (user != null) {
                                            Navigator.pushNamedAndRemoveUntil(
                                                context,
                                                'inicio',
                                                (route) => false);
                                          }
                                        }
                                      },
                                      child: const Text(
                                        'Acceder',
                                        style: TextStyle(color: Colors.white),
                                      ),
                                    ),
                                  ),
                                ],
                              )
                      ],
                    ),
                  )
                ],
              ),
            );
          }

          return const Center(
            child: CircularProgressIndicator(
              color: Colors.blue,
            ),
          );
        },
      ),
    );
  }
}
