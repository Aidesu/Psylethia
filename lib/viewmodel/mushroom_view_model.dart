import 'package:flutter/material.dart';
import '../api/api_mushrooms.dart';
import '../model/product_model.dart';

class MushroomsViewModel extends ChangeNotifier {
  List<Mushroom> mushrooms = [];
  List<Mushroom> allMushrooms = [];

  Future<void> fetchMushrooms() async {
    final data = await ApiMushrooms.fetchMushrooms();

    int generatedId = 1;

    allMushrooms = data.map((m) {
      // chaque champignon reçoit un id unique
      m.id = generatedId++;
      return m;
    }).toList();

    mushrooms = List.from(allMushrooms);
    notifyListeners();
  }

  void filter(String query) {
    if (query.isEmpty) {
      mushrooms = List.from(allMushrooms);
    } else {
      final q = query.toLowerCase();
      mushrooms = allMushrooms.where((m) {
        return m.name.toLowerCase().contains(q) ||
            m.commonname.toLowerCase().contains(q);
      }).toList();
    }
    notifyListeners();
  }
}
