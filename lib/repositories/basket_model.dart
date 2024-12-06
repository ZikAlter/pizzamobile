import 'package:flutter/material.dart';
import 'package:pizza_mobile/features/menu_page/menu_page.dart';
//import 'package:pizza_mobile/models/pizza.dart';

class BasketModel with ChangeNotifier {
  final List<Pizza> _basketItems = [];
  final Map<Pizza, int> _quantities = {};

  List<Pizza> get basketItems => _basketItems;

  double get totalPrice => _basketItems.fold(
      0, (sum, item) => sum + item.price * (_quantities[item] ?? 1));

  void addToBasket(Pizza pizza) {
    if (!_basketItems.contains(pizza)) {
      _basketItems.add(pizza);
      _quantities[pizza] = 1;
    } else {
      _quantities[pizza] = (_quantities[pizza] ?? 0) + 1;
    }
    notifyListeners();
  }

  void removeFromBasket(Pizza pizza) {
    _basketItems.remove(pizza);
    _quantities.remove(pizza);
    notifyListeners();
  }

  void decreaseQuantity(Pizza pizza) {
    if (_quantities.containsKey(pizza) && _quantities[pizza]! > 1) {
      _quantities[pizza] = _quantities[pizza]! - 1;
    } else {
      _basketItems.remove(pizza);
      _quantities.remove(pizza);
    }
    notifyListeners();
  }

  int getQuantity(Pizza pizza) {
    return _quantities[pizza] ?? 0;
  }
}
