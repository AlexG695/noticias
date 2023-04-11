import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:news/src/ui/login/login_page.dart';
import 'package:news/src/ui/navegacion/global/global_page.dart';
import 'package:news/src/ui/navegacion/noticias/noticias_page.dart';
import 'package:news/src/ui/navegacion/para_ti/para_ti_page.dart';
import 'package:news/src/ui/navegacion/tendencia/tendencia_page.dart';

class Navegacion extends StatefulWidget {
  final User user;
  const Navegacion({super.key, required this.user});

  @override
  State<Navegacion> createState() => _NavegacionState();
}

class _NavegacionState extends State<Navegacion> {
  bool _isSendingVerification = false;
  bool _isSigningOut = false;

  late User _currentUser;
  int currentPageIndex = 0;

  @override
  initState() {
    _currentUser = widget.user;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Six Fory-Eit News',
            style: GoogleFonts.poppins(fontWeight: FontWeight.bold)),
        centerTitle: true,
        actions: [
          IconButton(
              onPressed: () {
                _showModalAccount();
              },
              icon: const Icon(Icons.account_circle)),
          const SizedBox(width: 7)
        ],
      ),
      bottomNavigationBar: NavigationBar(
        onDestinationSelected: (int index) {
          setState(() {
            currentPageIndex = index;
          });
        },
        selectedIndex: currentPageIndex,
        destinations: const <Widget>[
          NavigationDestination(
              selectedIcon: Icon(Icons.library_books),
              icon: Icon(Icons.library_books_outlined),
              label: 'Noticias'),
          NavigationDestination(icon: Icon(Icons.language), label: 'Global'),
          NavigationDestination(
              selectedIcon: Icon(Icons.star),
              icon: Icon(Icons.star_outline_rounded),
              label: 'Para ti'),
          NavigationDestination(
              icon: Icon(Icons.trending_up_sharp), label: 'Tendencia')
        ],
      ),
      body: const <Widget>[
        NoticiasPage(),
        GlobalPage(),
        ParaTiPage(),
        TendenciaPage()
      ][currentPageIndex],
    );
  }

  _showModalAccount() {
    showModalBottomSheet(
        context: context,
        builder: (context) {
          return SafeArea(
            bottom: true,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const SizedBox(height: 12),
                Container(
                  width: 55,
                  height: 8,
                  decoration: BoxDecoration(
                      color: Colors.grey,
                      borderRadius: BorderRadius.circular(100)),
                ),
                const SizedBox(height: 20),
                const CircleAvatar(
                  radius: 55,
                ),
                Text(
                  '${_currentUser.displayName}',
                  style: GoogleFonts.poppins(
                      fontWeight: FontWeight.bold, fontSize: 17),
                ),
                ListTile(
                  onTap: () {},
                  leading: const Icon(Icons.settings_outlined),
                  title: const Text('Configuración'),
                ),
                ListTile(
                  onTap: () async {
                    await FirebaseAuth.instance.signOut();
                    Navigator.pushNamedAndRemoveUntil(
                        context, 'login', (route) => false);
                  },
                  leading: const Icon(Icons.logout_outlined),
                  title: const Text('Cerrar sesión'),
                )
              ],
            ),
          );
        });
  }
}
