import 'package:flutter/material.dart';
import '../model/product_model.dart';

class CartViewModel extends ChangeNotifier {
  final List<Mushroom> _items = [];

  List<Mushroom> get items => _items;

  void add(Mushroom m) {
    _items.add(m);
    notifyListeners();
  }

  void remove(Mushroom m) {
    _items.remove(m);
    notifyListeners();
  }

  void clear() {
    _items.clear();
    notifyListeners();
  }
}
