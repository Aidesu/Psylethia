import 'package:flutter/material.dart';
import '../api/api_mushrooms.dart';
import '../model/product_model.dart';

class MushroomsViewModel extends ChangeNotifier {
  List<Mushroom> mushrooms = [];

  Future<void> fetchMushrooms() async {
    mushrooms = await ApiMushrooms.fetchMushrooms();
    notifyListeners();
  }
}
