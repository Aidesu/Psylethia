import 'package:flutter/material.dart';
import 'home_page.dart';
import './cart_page.dart';
import './category_page.dart';
import './profile_page.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int index = 0;

  final pages = const [HomePage(), CategoriesPage(), CartPage(), ProfilePage()];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pages[index],

      bottomNavigationBar: BottomNavigationBar(
        currentIndex: index,
        onTap: (i) => setState(() => index = i),
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "Accueil"),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: "Profil"),
          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_cart),
            label: "Panier",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.category),
            label: "Catégories",
          ),
        ],
      ),
    );
  }
}
