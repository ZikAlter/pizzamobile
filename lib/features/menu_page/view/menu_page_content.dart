import 'package:flutter/material.dart';

class Pizza {
  final String name;
  final String description;
  final double price;
  final String imageUrl;

  Pizza({
    required this.name,
    required this.description,
    required this.price,
    required this.imageUrl,
  });
}

class MenuPageContent extends StatelessWidget {
  final List<Pizza> pizzas = [
    Pizza(
      name: 'Пепперони фреш',
      description: 'Пикантная пепперони, увеличенная порция моцареллы, томаты, фирменный томатный соус',
      price: 589,
      imageUrl: 'https://img.freepik.com/free-photo/pizza-pizza-filled-with-tomatoes-salami-olives_140725-1200.jpg?t=st=1733136156~exp=1733139756~hmac=a9af7c06eaa9c91d1478d75b157d213de13053e76fec0613a00f1c3f7062b956&w=740',
    ),
    Pizza(
      name: 'Ветчина и сыр',
      description: 'Ветчина, моцарелла, фирменный соус альфредо',
      price: 479,
      imageUrl: 'https://img.freepik.com/free-photo/pizza-with-sliced-sausages-orange-juice_140725-3666.jpg?t=st=1733137083~exp=1733140683~hmac=a30a2beca4cca31fdbc391e9a46b9fe5212cbe314849bdd8cd1ec2f9563c995c&w=360',
    ),
    Pizza(
      name: 'Салями с перчинкой',
      description: 'Цыпленок, ветчина, пикантная пепперони, острые колбаски чоризо, моцарелла, фирменный томатный соус',
      price: 555,
      imageUrl: 'https://img.freepik.com/free-photo/top-view-sausage-pizza-with-tomato-red-bell-pepper-cheese-top-view_140725-7089.jpg?t=st=1733137026~exp=1733140626~hmac=fef9f81700f092b310cb88e4ec20132547c31c6ff0abd5ddb040a5f834e36e02&w=826',
    ),
    Pizza(
      name: 'Жюльен',
      description: 'Цыпленок, шампиньоны, ароматный грибной соус, красный лук, чеснок, моцарелла, смесь сыров чеддер и пармезан, фирменный соус альфредо',
      price: 720,
      imageUrl: 'https://img.freepik.com/free-photo/pizza-with-extra-cheese-herbs_141793-341.jpg?t=st=1733137315~exp=1733140915~hmac=d3bcc981a23620df3ff4de8adf8e066f9e875f553cf0b39fc32db7766d24619d&w=360',
    ),
    Pizza(
      name: 'Маргарита',
      description: 'Увеличенная порция моцареллы, томаты, итальянские травы, фирменный томатный соус',
      price: 535,
      imageUrl: 'https://img.freepik.com/free-photo/mix-pizza-table_140725-7404.jpg?t=st=1733137314~exp=1733140914~hmac=48062880519124cf36992abcb7a1a53944e9899574649a6e4b9aa1a08c75b6b1&w=360',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
        padding: const EdgeInsets.all(6),
        itemCount: pizzas.length,
        itemBuilder: (context, index) {
          final pizza = pizzas[index];
          return GestureDetector(
            onTap: () {
              // Переход на экран с подробным описанием
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => PizzaDetailPage(pizza: pizza),
                ),
              );
            },
            child: Card(
              margin: const EdgeInsets.symmetric(vertical: 8),
              elevation: 4,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(14),
              ),
              color: Colors.white,
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(25),
                      child: Image.network(
                        pizza.imageUrl,
                        width: 110,
                        height: 120,
                        fit: BoxFit.cover,
                      ),
                    ),
                    const SizedBox(width: 16),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            pizza.name,
                            style: const TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(height: 8),
                          Text(
                            pizza.description,
                            style: const TextStyle(
                              fontSize: 14,
                              color: Colors.grey,
                            ),
                          ),
                          const SizedBox(height: 8),
                          Align(
                            alignment: Alignment.centerLeft,
                            child: ElevatedButton(
                              onPressed: () {
                                // Добавить логику покупки
                                print('Добавлено в корзину: ${pizza.name}');
                              },
                              style: ElevatedButton.styleFrom(
                                backgroundColor: const Color.fromARGB(255, 249, 171, 129),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(30),
                                ),
                              ),
                              child: Text(
                                '${pizza.price.toStringAsFixed(0)} руб.',
                                style: const TextStyle(fontSize: 14),
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
          );
        },
      ),
    );
  }
}

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
                      style: const TextStyle(fontSize: 14, color: Colors.grey),
                    ),
                    const SizedBox(height: 10),
                    Text(
                      "Тесто: Традиционное. Размер пиццы: 30 см.",
                      style: const TextStyle(fontSize: 14, color: Colors.grey),
                    ),
                    const SizedBox(height: 10),
                    Text(
                      "Вес: 590 г. Энергетическая ценность: 257 ккал",
                      style: const TextStyle(fontSize: 14, color: Colors.grey),
                    ),
                  ],
                ),
              ),
            ),

            // Кнопка, расположенная под карточкой
            const SizedBox(height: 16), // Добавляем отступ между карточкой и кнопкой
            ElevatedButton(
              onPressed: () {
                // Логика добавления в корзину
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



