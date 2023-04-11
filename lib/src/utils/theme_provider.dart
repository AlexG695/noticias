import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ThemeProvider extends ChangeNotifier {
  final String key = "theme";
  SharedPreferences? _prefs;
  bool _darkTheme = false;

  bool get darkTheme => _darkTheme;

  ThemeProvider() {
    _darkTheme = false;
    _loadFromPrefs();
  }

  toggleTheme() {
    _darkTheme = !_darkTheme;
    _saveToPrefs();
    notifyListeners();
  }

  _initPrefs() async {
    // if(_prefs == null)
    _prefs = await SharedPreferences.getInstance();
  }

  _loadFromPrefs() async {
    await _initPrefs();
    _darkTheme = _prefs?.getBool(key) ?? false;
    notifyListeners();
  }

  _saveToPrefs() async {
    await _initPrefs();
    _prefs?.setBool(key, _darkTheme);
  }
}

ThemeData lightThemeData(BuildContext context) {
  return ThemeData.light().copyWith(
      useMaterial3: true,
      visualDensity: VisualDensity.adaptivePlatformDensity,
      navigationBarTheme: const NavigationBarThemeData(
          height: 65, elevation: 7.0, indicatorColor: Colors.blue),
      indicatorColor: Colors.orange,
      listTileTheme: const ListTileThemeData(
        style: ListTileStyle.list,
      ),
      outlinedButtonTheme: OutlinedButtonThemeData(
          style: ButtonStyle(
              textStyle:
                  MaterialStateProperty.resolveWith((states) => const TextStyle(
                        color: Colors.white,
                      )),
              side: MaterialStateBorderSide.resolveWith(
                  (states) => const BorderSide(color: Colors.black)))),
      scaffoldBackgroundColor: Colors.white,
      floatingActionButtonTheme:
          const FloatingActionButtonThemeData(backgroundColor: Colors.blue),
      appBarTheme: appBarTheme,
      elevatedButtonTheme: ElevatedButtonThemeData(
          style: ButtonStyle(
              backgroundColor:
                  MaterialStateColor.resolveWith((states) => Colors.blue))),
      iconTheme: const IconThemeData(color: Colors.black),
      textTheme: Theme.of(context).textTheme.apply(bodyColor: Colors.black));
}

ThemeData darkThemeData(BuildContext context) {
  return ThemeData.dark().copyWith(
      useMaterial3: true,
      visualDensity: VisualDensity.adaptivePlatformDensity,
      navigationBarTheme: const NavigationBarThemeData(
          height: 65,
          indicatorColor: Colors.white,
          surfaceTintColor: Color(0xff151e21),
          elevation: 7.0),
      listTileTheme: const ListTileThemeData(
        style: ListTileStyle.list,
      ),
      floatingActionButtonTheme:
          const FloatingActionButtonThemeData(backgroundColor: Colors.white),
      outlinedButtonTheme: OutlinedButtonThemeData(
          style: ButtonStyle(
              textStyle: MaterialStateProperty.resolveWith(
                  (states) => const TextStyle(color: Colors.white)),
              side: MaterialStateBorderSide.resolveWith(
                  (states) => const BorderSide(color: Colors.white)))),
      indicatorColor: Colors.orange,
      scaffoldBackgroundColor: const Color(0xff161618),
      appBarTheme: appBarThemeDark,
      iconTheme: const IconThemeData(color: Colors.white),
      disabledColor: Colors.white,
      elevatedButtonTheme: ElevatedButtonThemeData(
          style: ButtonStyle(
              backgroundColor:
                  MaterialStateColor.resolveWith((states) => Colors.orange))),
      backgroundColor: const Color(0xff151e21),
      textTheme: Theme.of(context).textTheme.apply(bodyColor: Colors.white));
}

const appBarTheme = AppBarTheme(
  centerTitle: false,
  elevation: 5.0,
  color: Colors.white,
);

const appBarThemeDark =
    AppBarTheme(centerTitle: false, elevation: 5.0, color: Color(0xff1c1c1c));
