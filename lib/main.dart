import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news/src/repositories/auth_repository.dart';
import 'package:news/src/ui/login/login_page.dart';
import 'package:news/src/ui/navegacion/navegacion.dart';
import 'package:news/src/ui/welcome/welcome.dart';
import 'package:news/src/utils/theme_provider.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});

  User? user = FirebaseAuth.instance.currentUser;

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
        create: (_) => ThemeProvider(),
        child: Consumer<ThemeProvider>(
          builder: (context, ThemeProvider notifier, child) {
            return MaterialApp(
                routes: {
                  'inicio': (context) => Navegacion(user: user!),
                  'login': (context) => LoginPage()
                },
                debugShowCheckedModeBanner: false,
                theme: notifier.darkTheme
                    ? darkThemeData(context)
                    : lightThemeData(context),
                home: const Welcome());
          },
        ));
  }
}
