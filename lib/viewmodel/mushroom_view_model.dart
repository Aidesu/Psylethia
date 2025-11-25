import 'package:flutter/material.dart';
import '../api/api_mushrooms.dart';
import '../model/product_model.dart';

class MushroomsViewModel extends ChangeNotifier {
  List<Mushroom> mushrooms = [];
  List<Mushroom> allMushrooms = [];
  bool isLoading = true;

  Future<void> fetchMushrooms() async {
    final data = await ApiMushrooms.fetchMushrooms();

    allMushrooms = data.map((m) {
      return m;
    }).toList();

    mushrooms = List.from(allMushrooms);
    isLoading = false;
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

  void category(String category) {
    mushrooms = allMushrooms
        .where((m) => m.type.toString().contains(category))
        .toList();
    notifyListeners();
  }
}
