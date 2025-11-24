import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:psylethia/view/cart_page.dart';
import 'package:psylethia/view/category_page.dart';
import 'package:psylethia/view/category_view.dart';
import 'package:psylethia/view/profile_page.dart';
import 'package:psylethia/viewmodel/cart_page_view_model.dart';
import './viewmodel/mushroom_view_model.dart';
import 'view/main_page.dart';
import 'view/home_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => MushroomsViewModel()),
        ChangeNotifierProvider(create: (_) => CartViewModel()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Psylethia',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          bottomNavigationBarTheme: const BottomNavigationBarThemeData(
            selectedItemColor: Colors.black,
            unselectedItemColor: Colors.black,
          ),
        ),

        initialRoute: '/main',

        routes: {
          '/main': (_) => const MainPage(),
          '/home': (_) => const HomePage(),
          '/category': (_) => const CategoryPage(),
          '/category/view': (_) => const CategoryView(),
          '/profile': (_) => const ProfilePage(),
          '/cart': (_) => const CartPage(),
        },
      ),
    );
  }
}
