import 'package:flutter/material.dart';
import '../model/product_model.dart';

class CartViewModel extends ChangeNotifier {
  final List<Mushroom> _items = [];

  List<Mushroom> get items => _items;

  void add(Mushroom m) {
    final copy = m.copy();
    copy.quantity = 1;

    final index = _items.indexWhere((item) => item.id == copy.id);

    if (index != -1) {
      _items[index].quantity++;
    } else {
      _items.add(copy);
    }

    notifyListeners();
  }

  void remove(Mushroom m) {
    _items.removeWhere((item) => item.id == m.id);
    notifyListeners();
  }

  void clear() {
    _items.clear();
    notifyListeners();
  }

  void increaseQuantity(Mushroom m) {
    final index = _items.indexWhere((item) => item.id == m.id);
    if (index != -1) {
      _items[index].quantity++;
      notifyListeners();
    }
  }

  void decreaseQuantity(Mushroom m) {
    final index = _items.indexWhere((item) => item.id == m.id);

    if (index != -1) {
      if (_items[index].quantity > 1) {
        _items[index].quantity--;
      } else {
        _items.removeAt(index);
      }
      notifyListeners();
    }
  }

  int get totalItems {
    int total = 0;
    for (var item in _items) {
      total += item.quantity;
    }
    return total;
  }

  double get totalPrice {
    double total = 0;
    for (var item in _items) {
      total += item.price * item.quantity;
    }
    return total;
  }
}
