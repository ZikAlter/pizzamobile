import 'package:flutter/material.dart';

class BasketPageContent extends StatefulWidget {
  @override
  _BasketPageContentState createState() => _BasketPageContentState();
}

class _BasketPageContentState extends State<BasketPageContent> {
  final TextEditingController _addressController = TextEditingController();

  @override
  void dispose() {
    _addressController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final double pizzaPrice = 589; // Цена товара

    return Scaffold(
      resizeToAvoidBottomInset: true, // Адаптируем под клавиатуру
      /*appBar: AppBar(
        title: const Text("Корзина"),
        centerTitle: true,
        backgroundColor: const Color.fromARGB(255, 255, 121, 49),
      ),*/
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Заголовок корзины
            Text(
              "Корзина 1 товар на ${pizzaPrice.toStringAsFixed(0)} руб.",
              style: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w500,
                color: Color.fromARGB(255, 255, 121, 49),
              ),
            ),
            const SizedBox(height: 16),

            // Карточка товара
            Card(
              elevation: 4,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16),
              ),
              color: Colors.white,
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Изображение товара
                    ClipRRect(
                      borderRadius: BorderRadius.circular(12),
                      child: Image.network(
                        'https://img.freepik.com/free-photo/top-view-sausage-pizza-with-tomato-red-bell-pepper-cheese-top-view_140725-7089.jpg?t=st=1733137026~exp=1733140626~hmac=fef9f81700f092b310cb88e4ec20132547c31c6ff0abd5ddb040a5f834e36e02&w=826',
                        width: 80,
                        height: 90,
                        fit: BoxFit.cover,
                      ),
                    ),
                    const SizedBox(width: 16),

                    // Описание товара
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            "Пепперони фреш",
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(height: 8),
                          const Text(
                            "Пикантная пепперони, моцарелла, свежие томаты, фирменный томатный соус",
                            style: TextStyle(fontSize: 14, color: Colors.grey),
                          ),
                          const SizedBox(height: 8),

                          // Управление количеством
                          Row(
                            children: [
                              IconButton(
                                onPressed: () {},
                                icon: const Icon(Icons.add, color: Colors.orange),
                              ),
                              const Text("1", style: TextStyle(fontSize: 16)),
                              IconButton(
                                onPressed: () {},
                                icon: const Icon(Icons.remove, color: Colors.orange),
                              ),
                            ],
                          ),
                          GestureDetector(
                                onTap: () {},
                                child: const Text(
                                  "Изменить",
                                  style: TextStyle(
                                    color: Color.fromARGB(255, 255, 121, 49),
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 16),

            // Поле ввода адреса доставки
            const Text(
              "Адрес доставки:",
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.w400),
            ),
            const SizedBox(height: 8),
            TextField(
              controller: _addressController,
              decoration: InputDecoration(
                hintText: "Введите адрес доставки",
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8.0),
                ),
              ),
            ),
            const SizedBox(height: 24),

            // Кнопка оформления заказа
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  final enteredAddress = _addressController.text;
                  // Показываем диалог с введённым адресом
                  showDialog(
                    context: context,
                    builder: (context) => AlertDialog(
                      title: const Text("Подтверждение заказа"),
                      content: Text("Ваш адрес: $enteredAddress\nСумма заказа: ${pizzaPrice.toStringAsFixed(0)} руб."),
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
                  "Оформить за ${pizzaPrice.toStringAsFixed(0)} руб.",
                  style: const TextStyle(fontSize: 16, color: Colors.white, fontWeight: FontWeight.w400),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
