import 'package:flutter/material.dart';
import 'package:pizza_mobile/pizza_list_app.dart';
import 'package:pizza_mobile/repositories/basket_model.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (context) => BasketModel(),
      child: const MyApp(),
    ),
  );
}