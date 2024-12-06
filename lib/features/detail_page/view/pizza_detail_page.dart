import 'package:flutter/material.dart';
import 'package:pizza_mobile/features/menu_page/menu_page.dart';
import 'package:pizza_mobile/repositories/basket_model.dart';
import 'package:provider/provider.dart';

class PizzaDetailPage extends StatelessWidget {
  final Pizza pizza;

  const PizzaDetailPage({Key? key, required this.pizza}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text("Пицца солнца"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // Карточка с содержимым (без кнопки)
            Card(
              elevation: 4, // Тень
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(14), // Закругленные углы
              ),
              color: Colors.white,
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      pizza.name,
                      style: const TextStyle(
                        fontSize: 23, 
                        fontWeight: FontWeight.w400, 
                        color: Color.fromARGB(255, 255, 121, 49),
                      ),
                    ),
                    const SizedBox(height: 8),
                    ClipRRect(
                      borderRadius: BorderRadius.circular(25),
                      child: Image.network(
                        pizza.imageUrl,
                        width: double.infinity,
                        height: 250,
                        fit: BoxFit.cover,
                      ),
                    ),
                    const SizedBox(height: 10),
                    Text(
                      pizza.description,
                      style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w500, color: Colors.grey),
                    ),
                    const SizedBox(height: 10),
                    Text(
                      "Тесто: Традиционное. Размер пиццы: ${pizza.size} см.",
                      style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w500, color: Colors.grey),
                    ),
                    const SizedBox(height: 10),
                    Text(
                      "Вес: ${pizza.weight.toStringAsFixed(0)} г. Энергетическая ценность: ${pizza.calories.toStringAsFixed(0)} ккал",
                      style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w500, color: Colors.grey),
                    ),
                  ],
                ),
              ),
            ),

            // Кнопка, расположенная под карточкой
            const SizedBox(height: 16), // Добавляем отступ между карточкой и кнопкой
            ElevatedButton(
              onPressed: () {
                context.read<BasketModel>().addToBasket(pizza);
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text('Добавлено в корзину: ${pizza.name}'),
                  ),
                );
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color.fromARGB(255, 255, 121, 49), // Цвет кнопки
                padding: const EdgeInsets.symmetric(horizontal: 80, vertical: 12),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8.0),
                ),
              ),
              child: Text(
                '+ ${pizza.price.toStringAsFixed(0)} руб.',
                style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w400, color: Colors.white),
              ),
            ),
          ],
        ),
      ),
    );
  }
}