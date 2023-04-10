import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:news/src/ui/signup/signup_page.dart';

class LoginPage extends StatelessWidget {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passController = TextEditingController();

  LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          _LoginEmail(emailController: _emailController),
          const SizedBox(height: 15),
          _LoginPassword(passwordController: _passController),
          const SizedBox(height: 30),
          _SubmitButton(
            email: _emailController.text,
            password: _passController.text,
          ),
          const SizedBox(height: 20),
          Text(
            '-O-',
            style: GoogleFonts.poppins(fontWeight: FontWeight.bold),
          ),
          const _CreateAccountButton()
        ],
      ),
    );
  }
}

class _LoginEmail extends StatelessWidget {
  _LoginEmail({
    Key? key,
    required this.emailController,
  }) : super(key: key);

  final TextEditingController emailController;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 25, vertical: 7),
      width: double.infinity,
      child: const TextField(
        decoration:
            InputDecoration(border: OutlineInputBorder(), labelText: 'Correo'),
      ),
    );
  }
}

class _LoginPassword extends StatelessWidget {
  _LoginPassword({
    Key? key,
    required this.passwordController,
  }) : super(key: key);

  final TextEditingController passwordController;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 25, vertical: 7),
      width: double.infinity,
      child: const TextField(
        decoration: InputDecoration(
            border: OutlineInputBorder(), labelText: 'Contraseña'),
      ),
    );
  }
}

class _SubmitButton extends StatelessWidget {
  _SubmitButton({
    Key? key,
    required this.email,
    required this.password,
  }) : super(key: key);

  final String email, password;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 25, vertical: 5),
      width: double.infinity,
      child: ElevatedButton(
        onPressed: () async {
          print('hello');
        },
        child: const Text('Acceder'),
      ),
    );
  }
}

class _CreateAccountButton extends StatelessWidget {
  const _CreateAccountButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        width: double.infinity,
        margin: const EdgeInsets.symmetric(horizontal: 25, vertical: 5),
        child: OutlinedButton(
            onPressed: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => const SignUpPage(),
                ),
              );
            },
            child: const Text('Crear cuenta')));
  }
}
