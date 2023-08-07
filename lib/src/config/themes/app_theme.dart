import 'package:flutter/material.dart';

abstract class AppTheme {
  static ThemeData get lightTheme => ThemeData(
        appBarTheme: const AppBarTheme(
          backgroundColor: Colors.white,
          foregroundColor: Colors.black,
          elevation: 0,
        ),
        colorScheme: ColorScheme.fromSwatch(
          primarySwatch: Colors.deepPurple,
        ),
        scaffoldBackgroundColor: Colors.white,
        primaryColor: Colors.black,
        splashColor: Colors.transparent,
        fontFamily: 'IBM',
        useMaterial3: true,
      );
}
