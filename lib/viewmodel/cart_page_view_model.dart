import 'package:flutter/material.dart';
import '../model/product_model.dart';

class CartViewModel extends ChangeNotifier {
  final List<Mushroom> _items = [];
  final List<Mushroom> _saved = [];

  List<Mushroom> get items => _items;
  List<Mushroom> get saved => _saved;

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

  void saveForLater(Mushroom m) {
    remove(m);
    final savedCopy = m.copy();
    savedCopy.quantity = 1;
    _saved.add(savedCopy);
    notifyListeners();
  }

  void removeFromSaved(Mushroom m) {
    _saved.removeWhere((item) => item.id == m.id);
    notifyListeners();
  }

  void moveToCart(Mushroom m) {
    _saved.removeWhere((item) => item.id == m.id);
    add(m);
    notifyListeners();
  }

  int get totalItems => _items.fold(0, (sum, item) => sum + item.quantity);

  double get totalPrice =>
      _items.fold(0, (sum, item) => sum + item.price * item.quantity);
}
