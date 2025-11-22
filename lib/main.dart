import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:psylethia/view/cart_page.dart';
import 'package:psylethia/view/profile_page.dart';
import './viewmodel/mushroom_view_model.dart';
import 'view/home_page.dart';
import 'package:psylethia/view/category_page.dart';
import 'package:psylethia/view/products_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => MushroomsViewModel(),

      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Psylethia',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        ),

        initialRoute: '/home',

        routes: {
          '/home': (_) => const HomePage(),
          '/category': (_) => const CategoryPage(),
          '/product': (_) => ProductsPage(),
          '/profile': (_) => const ProfilePage(),
          '/cart': (_) => const CartPage(),
        },
      ),
    );
  }
}
