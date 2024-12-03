import 'package:flutter/material.dart';
import 'package:pizza_mobile/features/basket_page/basket_page.dart';
import 'package:pizza_mobile/features/menu_page/menu_page.dart';
import 'package:pizza_mobile/features/profile_page/profile_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key, required this.title});

  final String title;

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;

static final List<Widget> _pages = <Widget>[
  MenuPageContent(),
  BasketPageContent(),
  ProfilePageContent(),
];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body:
      _pages[_selectedIndex],
      bottomNavigationBar: NavigationBar(
        selectedIndex: _selectedIndex,
        onDestinationSelected: _onItemTapped,
        destinations: const <NavigationDestination>[
          NavigationDestination(
            icon: Icon(Icons.local_pizza),
            label: 'Меню',
          ),
          NavigationDestination(
            icon: Icon(Icons.shopping_cart),
            label: 'Корзина',
          ),
          NavigationDestination(
            icon: Icon(Icons.person),
            label: 'Профиль',
          ),
        ],
      ), 
    );
  }
}
