import 'package:flutter/material.dart';
import 'package:psylethia/components/widgets/app_bar/bottom_bar.dart';
import 'package:psylethia/view/category_view.dart';
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

  final pages = const [
    HomePage(),
    ProfilePage(),
    CartPage(),
    CategoryPage(),
    CategoryView(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pages[index],
      bottomNavigationBar: MyBottomNavBar(
        currentIndex: index,
        onTap: (i) => setState(() => index = i),
      ),
    );
  }
}
