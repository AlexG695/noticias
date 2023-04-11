import 'dart:io';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:news/src/ui/navegacion/navegacion.dart';
import 'package:news/src/ui/signup/sign_in_google.dart';

import '../../utils/fire_auth.dart';
import '../../utils/validator.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  final _registerFormKey = GlobalKey<FormState>();

  File? image;

  final _nameTextController = TextEditingController();
  final _emailTextController = TextEditingController();
  final _passwordTextController = TextEditingController();
  String imageUrl = '';

  bool _isProcessing = false;

  bool _isHiden = true;

  void _tooglePasswordView() {
    setState(() {
      _isHiden = !_isHiden;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Registro'),
        actions: [
          TextButton(
            onPressed: () async {
              setState(() {
                _isProcessing = true;
              });

              if (_registerFormKey.currentState!.validate()) {
                User? user = await FireAuth.registerUsingEmailPassword(
                  name: _nameTextController.text,
                  email: _emailTextController.text,
                  password: _passwordTextController.text,
                );

                setState(() {
                  _isProcessing = false;
                });

                if (user != null) {
                  Navigator.of(context).pushAndRemoveUntil(
                    MaterialPageRoute(
                      builder: (context) => Navegacion(user: user),
                    ),
                    ModalRoute.withName('/'),
                  );
                }
              }
            },
            child: const Text('Crear'),
          )
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Center(
          child: Column(
            //mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Form(
                key: _registerFormKey,
                child: Column(
                  children: <Widget>[
                    Text(
                      'Rellena to los datos para completar tu registro',
                      style: GoogleFonts.poppins(
                          fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 35),
                    TextFormField(
                      controller: _nameTextController,
                      //focusNode: _focusName,
                      validator: (value) => Validator.validateName(
                        name: value,
                      ),
                      decoration: const InputDecoration(
                        filled: true,
                        border: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.black)),
                        labelText: "Nombre",
                      ),
                    ),
                    const SizedBox(height: 16.0),
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
                    const SizedBox(height: 16.0),
                    TextFormField(
                      controller: _passwordTextController,
                      //focusNode: _focusPassword,
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
                            child: Icon(
                              _isHiden
                                  ? Icons.visibility_outlined
                                  : Icons.visibility_off_outlined,
                            ),
                          )),
                    ),
                    const SizedBox(height: 32.0),
                    /* _isProcessing
                        ? const CircularProgressIndicator()
                        : Row(
                            children: [
                              Expanded(
                                child: ElevatedButton(
                                  onPressed: () async {
                                    setState(() {
                                      _isProcessing = true;
                                    });

                                    if (_registerFormKey.currentState!
                                        .validate()) {
                                      User? user = await FireAuth
                                          .registerUsingEmailPassword(
                                        name: _nameTextController.text,
                                        email: _emailTextController.text,
                                        password: _passwordTextController.text,
                                      );

                                      setState(() {
                                        _isProcessing = false;
                                      });

                                      if (user != null) {
                                        Navigator.of(context)
                                            .pushAndRemoveUntil(
                                          MaterialPageRoute(
                                            builder: (context) =>
                                                Navegacion(user: user),
                                          ),
                                          ModalRoute.withName('/'),
                                        );
                                      }
                                    }
                                  },
                                  child: const Text(
                                    'Crear cuenta',
                                    style: TextStyle(color: Colors.white),
                                  ),
                                ),
                              ),
                            ],
                          ), */
                    const SizedBox(height: 25),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
      bottomNavigationBar: Container(
        margin: const EdgeInsets.symmetric(horizontal: 25, vertical: 10),
        child: OutlinedButton.icon(
          onPressed: () {
            signInWithGoogle().then((result) => {
                  if (result != null)
                    {
                      /* Navigator.pushAndRemoveUntil(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                Navegacion(user: user)),
                                        (route) => false) */
                    }
                });
          },
          icon: Image.asset(
            'assets/img/google_logo.png',
            height: 22,
            width: 22,
          ),
          label: Text(
            'Acceder con Google',
            style: GoogleFonts.poppins(color: Colors.black),
          ),
        ),
      ),
    );
  }
}
