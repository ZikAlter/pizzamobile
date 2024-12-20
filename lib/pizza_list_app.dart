import 'package:flutter/material.dart';
import 'package:pizza_mobile/features/home_page/home_page.dart';
import 'package:pizza_mobile/theme/theme.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Пицца солнце',
      theme: appTheme,
      home: const HomePage(title: 'Пицца солнце'),
    );
  }
}