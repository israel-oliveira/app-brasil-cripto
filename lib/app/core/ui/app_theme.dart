import 'package:flutter/material.dart';

class AppTheme {
  AppTheme._();

  static ThemeData get theme => ThemeData(
    primaryColor: const Color.fromARGB(255, 17, 79, 185),
    appBarTheme: AppBarTheme(
      backgroundColor: Color.fromARGB(255, 17, 79, 185),
      titleTextStyle: TextStyle(
        color: Colors.white,
        fontSize: 20,
        fontWeight: FontWeight.bold,
      ),
      iconTheme: IconThemeData(
        color: Colors.white,
      ),
    ),
    drawerTheme: DrawerThemeData(
      backgroundColor: Colors.white,
    ),
    floatingActionButtonTheme: FloatingActionButtonThemeData(
      backgroundColor: Color.fromARGB(255, 17, 79, 185),
      foregroundColor: Colors.white,
    ),
  );
}
