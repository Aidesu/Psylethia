import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'viewmodel/mushroom_view_model.dart';
import 'viewmodel/cart_page_view_model.dart';

import 'view/main_page.dart';
import 'view/home_page.dart';
import 'view/category_page.dart';
import 'view/category_view.dart';
import 'view/profile_page.dart';
import 'view/cart_page.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) {
            final vm = MushroomsViewModel();
            vm.fetchMushrooms();
            return vm;
          },
        ),

        ChangeNotifierProvider(create: (_) => CartViewModel()),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Psylethia',

      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        bottomNavigationBarTheme: const BottomNavigationBarThemeData(
          selectedItemColor: Colors.black,
          unselectedItemColor: Colors.grey,
        ),
      ),

      initialRoute: '/main',

      routes: {
        '/main': (_) => const MainPage(),
        '/home': (_) => const HomePage(),
        '/category': (_) => const CategoryPage(),
        '/profile': (_) => const ProfilePage(),
        '/cart': (_) => const CartPage(),
        '/category/view': (context) {
          final category = ModalRoute.of(context)!.settings.arguments as String;
          return CategoryView(category: category);
        },
      },
    );
  }
}
