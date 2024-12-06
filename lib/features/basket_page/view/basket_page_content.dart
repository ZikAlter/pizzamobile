import 'package:flutter/material.dart';
import 'package:pizza_mobile/repositories/basket_model.dart';
import 'package:provider/provider.dart';

class BasketPageContent extends StatelessWidget {
  final TextEditingController addressController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final basket = context.watch<BasketModel>();
    final pizzaPrice = basket.totalPrice;

    return Scaffold(
      body: Column(
        children: [
          // Текст с общим количеством товаров и суммой
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Text(
              "Корзина ${basket.basketItems.length} товар(ов) на ${pizzaPrice.toStringAsFixed(0)} руб.",
              style: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w500,
                color: Color.fromARGB(255, 255, 121, 49),
              ),
            ),
          ),
          // Список товаров
          Expanded(
            child: basket.basketItems.isEmpty
                ? const Center(child: Text("Корзина пуста"))
                : ListView.builder(
                    itemCount: basket.basketItems.length,
                    itemBuilder: (context, index) {
                      final pizza = basket.basketItems[index];
                      return Card(
                        margin: const EdgeInsets.symmetric(
                          horizontal: 12,
                          vertical: 8,
                        ),
                        elevation: 4,
                        color: Colors.white,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(14),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            children: [
                              ListTile(
                                leading: ClipRRect(
                                  borderRadius: BorderRadius.circular(12),
                                  child: Image.network(
                                    pizza.imageUrl,
                                    width: 60,
                                    height: 50,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                                title: Text(
                                  pizza.name,
                                  style: const TextStyle(
                                      fontWeight: FontWeight.w600),
                                ),
                                subtitle: Text(
                                  '${pizza.price.toStringAsFixed(0)} руб.',
                                  style: const TextStyle(color: Colors.grey),
                                ),
                                trailing: IconButton(
                                  icon: const Icon(Icons.delete,
                                      color:
                                          Color.fromARGB(255, 255, 121, 49)),
                                  onPressed: () {
                                    basket.removeFromBasket(pizza);
                                  },
                                ),
                              ),
                              Row(
                                mainAxisSize: MainAxisSize.min, // Сокращаем размер ряда до минимального
                                children: [
                                  // Кнопка "увеличить"
                                  IconButton(
                                    icon: const Icon(Icons.add, color: Colors.orange),
                                    onPressed: () {
                                      basket.addToBasket(pizza);
                                    },
                                    constraints: const BoxConstraints(), // Убираем лишние отступы от кнопок
                                    padding: EdgeInsets.zero, // Убираем внутренние отступы
                                  ),
                                  // Текущее количество
                                  Text(
                                    '${basket.getQuantity(pizza)}',
                                    style: const TextStyle(fontSize: 16),
                                  ),
                                  // Кнопка "уменьшить"
                                  IconButton(
                                    icon: const Icon(Icons.remove, color: Colors.orange),
                                    onPressed: () {
                                      basket.decreaseQuantity(pizza);
                                    },
                                    constraints: const BoxConstraints(), // Убираем лишние отступы от кнопок
                                    padding: EdgeInsets.zero, // Убираем внутренние отступы
                                  ),
                                ],
                              )
                            ],
                          ),
                        ),
                      );
                    },
                  ),
          ),
          // Поле для ввода адреса
          const Text(
              'Адрес доставки:',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.w400),
            ),
          Padding(
            padding:
                const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
            child: 
              TextField(
                controller: addressController,
                decoration: InputDecoration(
                  hintText: "Введите адрес доставки",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide:
                        const BorderSide(color: Color.fromARGB(255, 255, 121, 49)),
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                ),
              ),
          ),
        ],
      ),
      bottomNavigationBar: Container(
        padding: const EdgeInsets.all(16),
        child: ElevatedButton(
          onPressed: () {
            final enteredAddress = addressController.text.isEmpty
                ? "Адрес не указан"
                : addressController.text;
            showDialog(
              context: context,
              builder: (context) => AlertDialog(
                title: const Text("Подтверждение заказа"),
                content: Text(
                  "Ваш адрес: $enteredAddress\nСумма заказа: ${basket.totalPrice.toStringAsFixed(0)} руб.",
                ),
                actions: [
                  TextButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    child: const Text("Ок"),
                  ),
                ],
              ),
            );
          },
          style: ElevatedButton.styleFrom(
            backgroundColor: const Color.fromARGB(255, 255, 121, 49),
            padding: const EdgeInsets.symmetric(vertical: 10),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8.0),
            ),
          ),
          child: Text(
            "Оформить за ${basket.totalPrice.toStringAsFixed(0)} руб.",
            style: const TextStyle(
              fontSize: 16,
              color: Colors.white,
              fontWeight: FontWeight.w400,
            ),
          ),
        ),
      ),
    );
  }
}
