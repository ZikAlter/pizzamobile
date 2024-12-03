import 'package:flutter/material.dart';

final appTheme = ThemeData(
  colorSchemeSeed: Colors.orange,
  useMaterial3: true,
  appBarTheme: const AppBarTheme(
    backgroundColor: Color.fromARGB(255, 31, 31, 31),
    elevation: 0,
    titleTextStyle: TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.w700),
    //iconTheme: IconThemeData(color: Colors.white,),
  ),
);