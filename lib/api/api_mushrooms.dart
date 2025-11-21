import 'dart:convert';
import 'package:http/http.dart' as http;
import '../model/product_model.dart';

class ApiMushrooms {
  static Future<List<Mushroom>> fetchMushrooms() async {
    final url = Uri.parse("https://toxicshrooms.vercel.app/api/mushrooms");

    final response = await http.get(url);

    if (response.statusCode != 200) {
      throw Exception("Erreur API ${response.statusCode}");
    }

    final List decoded = jsonDecode(response.body);

    return decoded.map((item) => Mushroom.fromJson(item)).toList();
  }
}
