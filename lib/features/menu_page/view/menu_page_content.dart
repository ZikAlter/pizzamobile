import 'package:flutter/material.dart';
//import 'package:pizza_mobile/features/basket_page/basket_page.dart';
import 'package:pizza_mobile/features/detail_page/detail_page.dart';
import 'package:pizza_mobile/repositories/basket_model.dart';
import 'package:provider/provider.dart';

class Pizza {
  final String name;
  final double price;
  final String imageUrl;
  final String description;
  final double weight;
  final double calories;
  final int size;

  Pizza({
    required this.name,
    required this.price,
    required this.imageUrl,
    required this.description,
    required this.weight,
    required this.calories,
    required this.size
  });
}

class MenuPageContent extends StatelessWidget {
  final List<Pizza> pizzas = [
    Pizza(
      name: 'Пепперони фреш',
      price: 589,
      imageUrl: 'https://img.freepik.com/free-photo/pizza-pizza-filled-with-tomatoes-salami-olives_140725-1200.jpg?t=st=1733136156~exp=1733139756~hmac=a9af7c06eaa9c91d1478d75b157d213de13053e76fec0613a00f1c3f7062b956&w=740',
      description: 'Пикантная пепперони, увеличенная порция моцареллы, томаты, фирменный томатный соус',
      weight: 590,
      calories: 257,
      size: 30,
    ),
    Pizza(
      name: 'Ветчина и сыр',
      price: 479,
      imageUrl: 'https://img.freepik.com/free-photo/pizza-with-sliced-sausages-orange-juice_140725-3666.jpg?t=st=1733137083~exp=1733140683~hmac=a30a2beca4cca31fdbc391e9a46b9fe5212cbe314849bdd8cd1ec2f9563c995c&w=360',
      description: 'Ветчина, моцарелла, фирменный соус альфредо',
      weight: 480,
      calories: 282,
      size: 30,
    ),
    Pizza(
      name: 'Салями с перчинкой',
      price: 555,
      imageUrl: 'https://img.freepik.com/free-photo/top-view-sausage-pizza-with-tomato-red-bell-pepper-cheese-top-view_140725-7089.jpg?t=st=1733137026~exp=1733140626~hmac=fef9f81700f092b310cb88e4ec20132547c31c6ff0abd5ddb040a5f834e36e02&w=826',
      description: 'Цыпленок, ветчина, пикантная пепперони, острые колбаски чоризо, моцарелла, фирменный томатный соус',
      weight: 600,
      calories: 290,
      size: 35,
    ),
    Pizza(
      name: 'Жюльен',
      price: 720,
      imageUrl: 'https://img.freepik.com/free-photo/pizza-with-extra-cheese-herbs_141793-341.jpg?t=st=1733137315~exp=1733140915~hmac=d3bcc981a23620df3ff4de8adf8e066f9e875f553cf0b39fc32db7766d24619d&w=360',
      description: 'Цыпленок, шампиньоны, ароматный грибной соус, красный лук, чеснок, моцарелла, смесь сыров чеддер и пармезан, фирменный соус альфредо',
      weight: 630,
      calories: 241,
      size: 35,
    ),
    Pizza(
      name: 'Маргарита',
      price: 535,
      imageUrl: 'https://img.freepik.com/free-photo/mix-pizza-table_140725-7404.jpg?t=st=1733137314~exp=1733140914~hmac=48062880519124cf36992abcb7a1a53944e9899574649a6e4b9aa1a08c75b6b1&w=360',
      description: 'Увеличенная порция моцареллы, томаты, итальянские травы, фирменный томатный соус',
      weight: 590,
      calories: 235,
      size: 30,
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
            color: Colors.white,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(14),
            ),
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
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        const SizedBox(height: 8),
                        Align(
                          alignment: Alignment.centerLeft,
                          child: ElevatedButton(
                            onPressed: () {
                              context.read<BasketModel>().addToBasket(pizza);
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(
                                  content: Text('Добавлено в корзину: ${pizza.name}'),
                                ),
                              );
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor: const Color.fromARGB(255, 250, 185, 150),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(30),
                              ),
                            ),
                            child: Text('${pizza.price.toStringAsFixed(0)} руб.'),
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



