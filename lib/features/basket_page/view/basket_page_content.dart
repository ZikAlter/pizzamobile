// Экран корзина
import 'package:flutter/material.dart';

class BasketPageContent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: const [
        Icon(Icons.search, size: 100, color: Colors.grey),
        SizedBox(height: 16),
        Text("Что то для чего то...", style: TextStyle(fontSize: 20)),
      ],
    );
  }
}