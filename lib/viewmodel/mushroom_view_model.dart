import 'package:flutter/material.dart';
import '../api/api_mushrooms.dart';
import '../model/product_model.dart';

class MushroomsViewModel extends ChangeNotifier {
  List<Mushroom> mushrooms = [];
  List<Mushroom> allMushrooms = [];

  Future<void> fetchMushrooms() async {
    allMushrooms = await ApiMushrooms.fetchMushrooms();
    mushrooms = allMushrooms;
    notifyListeners();
  }

  void filter(String query) {
    if (query.isEmpty) {
      mushrooms = allMushrooms;
    } else {
      mushrooms = allMushrooms.where((m) {
        final q = query.toLowerCase();
        return m.name.toLowerCase().contains(q) ||
            m.commonname.toLowerCase().contains(q);
      }).toList();
    }
    notifyListeners();
  }
}
