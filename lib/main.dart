import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
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
    return ChangeNotifierProvider(
      create: (_) => MushroomsViewModel(),

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
        },
      ),
    );
  }
}
